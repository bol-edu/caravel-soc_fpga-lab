








//  x-channel dma(in) arb(out)
//                                1   2   3   4   5   6   7   8   9  10   11   12   13
// clk                          |   |   |   |   |   |   |   |   |   |    |    |    |    |  
// sstvalid                    ______________/-----------\___________/-------------------
// x_FF_state (1-full)         ______________/-----------\___________/-------------------
// dma_x_ready (ie, cyc & stb) __/-----------\___________/-----------\___________________
// dma_x_addr                  ___a1______________________a2_____________________________
// dma_x_valid (ie, ack_o)     __________/---\___________________/---\___________________
// x_FF (ie, data_out)         ___________d1______________________d2_____________________
// sstready                    ______________________/---\_______________________________


//  y-channel dma(out) arb(in)
//                                     1   2   3   4   5   6   7   8   9  10   11   
// clk                               |   |   |   |   |   |   |   |   |   |    |    |
// smtready                         --------------\___________/----------------------
// y_FF_state (1-full)              ______________/-----------\______________________
// dma_y_valid (ie, cyc & stb & WE) ______________/-----------\______________________
// dma_y_addr                       ________________a1_______________________________
// dma_y_ready (ie, ack_o)          ______________________/---\______________________
// y_FF (ie, data_in )              ___________d1____________________________________
// smtvalid                         __________/---\__________________________________

// dma_state FSM
// idel all 0
// x in WE =0
// y out WE=1

// generator of x_addr
// generator of y_addr




`default_nettype wire


module fir_DMA #(
    parameter BITS = 32,
    parameter pADDR_WIDTH =12,
    parameter pDATA_WIDTH =32,
    parameter Tape_Num =11
)(

    // Wishbone Slave ports (WB MI A)
    input 				wb_clk_i,
    input 				wb_rst_i, 
    input 				wbs_stb_i,
    input 				wbs_cyc_i,
    input 				wbs_we_i,
    input  [3:0] 			wbs_sel_i,
    input  [(pDATA_WIDTH-1):0]	wbs_dat_i,
    input  [(pDATA_WIDTH-1):0]	wbs_adr_i,
    output 			        wbs_ack_o,
    output [(pDATA_WIDTH-1):0] 	wbs_dat_o,
    
    // dma  to arb
    output 				dma_stb_i,
    output 				dma_cyc_i,
    output 				dma_we_i,
    output  [3:0] 			dma_sel_i,
    output  [(pDATA_WIDTH-1):0]	dma_dat_i,
    output  [(pDATA_WIDTH-1):0]	dma_adr_i,
    input 			        dma_ack_o,
    input [(pDATA_WIDTH-1):0] 	dma_dat_o
    
);

    //tlast counter for data length = 64
    reg [5:0] 		         tlast_counter;
	
	// write
    wire                     awready;
    wire                     awvalid;
    wire [(pADDR_WIDTH-1):0] awaddr;
    wire                     wready;
    wire                     wvalid;  
    wire [(pDATA_WIDTH-1):0] wdata;
	
	// read
    wire                     arready;
    wire                     arvalid;
    wire [(pADDR_WIDTH-1):0] araddr;
    wire                     rready;
    wire                     rvalid;
    wire [(pDATA_WIDTH-1):0] rdata;
	
	// input data
    wire                     ss_tready;
    wire                     ss_tvalid;
    wire                     ss_tlast;
    wire [(pDATA_WIDTH-1):0] ss_tdata;
	
	// output data
    wire                     sm_tready;
    wire                     sm_tvalid;
    wire                     sm_tlast;
    wire [(pDATA_WIDTH-1):0] sm_tdata;
	
	// tap ram control
    wire   [3:0]             tap_WE;
    wire                     tap_EN;
    wire [(pDATA_WIDTH-1):0] tap_Di;
    wire [(pADDR_WIDTH-1):0] tap_A;
    wire [(pDATA_WIDTH-1):0] tap_Do;

	// data ram control
    wire  [3:0]              data_WE;
    wire                     data_EN;
    wire [(pDATA_WIDTH-1):0] data_Di;
    wire [(pADDR_WIDTH-1):0] data_A;
    wire [(pDATA_WIDTH-1):0] data_Do;


    // FSM
    reg [1:0]               state, next_state;


    
    localparam  RESET = 2'd0, IDLE = 2'd1, X_ADDR = 2'd2, Y_ADDR = 2'd3;
///////////////////////////// state machine begin////////////////////////////
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if(wb_rst_i) begin
	    state      <= RESET;
	    end
        else begin
            state      <= next_state;
        end
    end
    always @(*) begin
        case(state) 
            RESET: begin
                if ((wbs_adr_i==32'h3000_0000) & (wbs_dat_i==32'h0000_0001)) begin
                    next_state = IDLE;
                end
                else begin
                    next_state =RESET;
                end
            end
            IDLE: begin
                if( (y_addr_counter>>2)==(data_len))begin
                next_state = RESET;
                end            
                else if (~x_FF_state) begin
                    next_state = X_ADDR;
                end
                else if (y_FF_state) begin
                    next_state = Y_ADDR;
                end
                else begin
                    next_state =IDLE;
                end
            end
            X_ADDR: begin
                if (dma_ack_o) begin
                    next_state = IDLE;
                end
                else begin
                    next_state = X_ADDR;
                end
            end
            Y_ADDR: begin
                if (dma_ack_o) begin
                    next_state = IDLE;
                end
                else begin
                    next_state = Y_ADDR;
                end
            end
            default: begin 
                next_state = RESET;
            end
        endcase
    end
  ///////////////////////   state machine end     ////////////////////  
    
    
  ////////////////////// x and y addr generator  begin   ///////////////////////
  
  
  /////////////// get initial x_addr and y_addr/////////////


    reg [(pDATA_WIDTH-1):0]	dma_x_addr;
    reg [(pDATA_WIDTH-1):0]	dma_y_addr;
    reg                        x_o_count;
    reg                        y_o_count;
    wire                       wb_hs;

    assign wb_hs = wbs_stb_i & wbs_cyc_i & wbs_we_i;
    wire                    x_addr_signal;
    wire                    y_addr_signal;

    assign x_addr_signal = (wbs_adr_i==32'h3000_0004) ? 1 : 0;
    assign y_addr_signal = (wbs_adr_i==32'h3000_0008) ? 1 : 0;
    // x-address
	always @(posedge wb_clk_i or posedge wb_rst_i)begin
	    if(wb_rst_i) begin
	        dma_x_addr <= 0;
	        x_o_count <= 0;
    	end
    	else if (wb_hs & (x_addr_signal)) begin //defined // changed : replace with x_addr_signal & wb_hs
    		dma_x_addr <= wbs_dat_i;
    		x_o_count <= 1'b1;
    	end
    	else begin
    	    x_o_count <= 1'b0;
    	end
    end
        
    // y-address
	always @(posedge wb_clk_i or posedge wb_rst_i)begin
	    if(wb_rst_i) begin
	        dma_y_addr <= 0;
	        y_o_count <= 0;
    	end
    	else if (wb_hs & (y_addr_signal)) begin //defined // changed : replace with y_addr_signal & wb_hs
    		dma_y_addr <= wbs_dat_i;
    		y_o_count <= 1'b1;
    	end
    	else begin
            y_o_count <= 1'b0;
    	end
    end

/////////////// get intial addr end//////////////
  
////////////// addr counter design  begin ////////
  
 
    reg [(pDATA_WIDTH-1):0] x_addr_counter;
    reg [(pDATA_WIDTH-1):0] y_addr_counter;
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
	    if(wb_rst_i|(state==RESET)) begin
	      x_addr_counter <= 0;
             y_addr_counter <= 0; 
	    end
	    else if (dma_ack_o &(state==X_ADDR)) begin
            x_addr_counter<=x_addr_counter+32'd4;
	    end	

	    else if (dma_ack_o &(state==Y_ADDR)) begin	
            y_addr_counter<=y_addr_counter+32'd4;
            end
            else begin
            end	
       end
  ////////////// addr counter design  end ////////     
       
    // initial addr + counter addr       
       
    wire [(pDATA_WIDTH-1):0] x_addr_reg,y_addr_reg;
    assign x_addr_reg= dma_x_addr + x_addr_counter;
    assign y_addr_reg= dma_y_addr + y_addr_counter;
    
  ////////////////////// x and y addr generator end   ///////////////////////

/////////
  reg  [(pDATA_WIDTH-1):0]  data_len;
  	always @(posedge wb_clk_i or posedge wb_rst_i) begin
	    if(wb_rst_i) begin
	     data_len<=0;
	    end
	    else if (wbs_adr_i==32'h3000_0010) begin
              data_len<= wbs_dat_i;
	    end	
            else begin
            end	
       end
  

  ///////////////////// output signal to arb from dma (begin)///////////////////////
  
  
  
    assign dma_stb_i = (state==X_ADDR | state ==Y_ADDR) ? 1 : 0;
    assign dma_cyc_i = (state==X_ADDR | state ==Y_ADDR) ? 1 : 0;
    assign dma_we_i  = (state ==Y_ADDR) ? 1 : 0;
    assign dma_sel_i = 1'b1;
    assign dma_dat_i = y_FF;
    assign dma_adr_i =  ((state==X_ADDR) ?  x_addr_reg : 32'b0)|((state==Y_ADDR) ? y_addr_reg : 32'b0);
   
  /*
  //test    
    assign dma_stb_i =  0;
    assign dma_cyc_i =  0;
    assign dma_we_i  =  0;
    assign dma_sel_i =  0;
    assign dma_dat_i = y_FF;
    assign dma_adr_i =  ((state==X_ADDR) ?  x_addr_reg : 32'b0)|((state==Y_ADDR) ? y_addr_reg : 32'b0);
    */
    
  ///////////////////// output signal to arb from dma (end)///////////////////////









    reg                     y_FF_state;  //1: full 0:empyty
    reg                     x_FF_state;  //1: full 0:empyty
    reg [(pDATA_WIDTH-1):0] y_FF;
    reg [(pDATA_WIDTH-1):0] x_FF;

    assign ss_tvalid = x_FF_state;
    assign sm_tready = ~y_FF_state;
    assign ss_tdata  = x_FF;

	always @(posedge wb_clk_i or posedge wb_rst_i) begin
	    if(wb_rst_i) begin
	     	y_FF <= 0;
            y_FF_state <= 0; 
	    end
	    else if (~y_FF_state & sm_tvalid) begin
	    	y_FF <= sm_tdata;
        	y_FF_state <= 1; 
	    end	

	    else if (y_FF_state& dma_ack_o &(state==Y_ADDR)) begin	
        	y_FF_state <= 0;
        	y_FF <= 0;
        end
        else begin
        end	
	end

	always @(posedge wb_clk_i or posedge wb_rst_i) begin
	    if(wb_rst_i) begin
			x_FF <= 0;
			x_FF_state <= 0; 
	    end
	    else if (~x_FF_state & dma_ack_o & (state==X_ADDR)) begin
			x_FF <= dma_dat_o;
			x_FF_state <= 1; 
	    end
        // add //
	    else if (x_FF_state & ss_tready) begin	
			x_FF_state <= 0;
			x_FF <= 0;
		end          
		else begin
		end                     
	end







   	//------global---------
   	
    wire                     fir_valid;
    wire                     fir_we;
    wire [(pADDR_WIDTH-1):0] fir_addr;
   	assign fir_valid = wbs_stb_i & wbs_cyc_i & (~x_addr_signal); // changed : replace with x_addr_signal
   	assign fir_we    = wbs_we_i & wbs_cyc_i & (~y_addr_signal);  // changed : replace with y_addr_signal
   	assign fir_addr  = wbs_adr_i[11:0];
	assign wbs_ack_o = (w_count==1) | rvalid|x_o_count|y_o_count; 
   	//wready | rvalid |
   	reg  [1:0] w_count;
   	wire [1:0] n_count;
    
    assign n_count = w_count + 2'b01;
	always @(posedge wb_clk_i or posedge wb_rst_i)begin
	    if(wb_rst_i | n_count==2) begin
			w_count <= 4'd0;
    	end
    	else if (awvalid) begin
    		w_count <= n_count;
    	end
    	else begin
    		w_count <= 4'd0;
    	end
    end
   	
   	reg [(pDATA_WIDTH-1):0] wbdato;
   	assign wbs_dat_o = wbdato;

   	// *****
   	// read data out
   	always @(*) begin
        wbdato = 32'd0;
        if (fir_addr == 12'h0) begin
        	wbdato = {27'd0, sm_tvalid, ss_tready, 1'b0, rdata[2:0]};	// X[n], Y[n]
        end 
        else if ((fir_addr >= 12'h20) & (fir_addr <= 12'h48))  begin
        	wbdato = rdata;
        end
        else begin
        	wbdato = rdata;
        end
    end
    
   	//---------------------




    // ------module conect---------
    fir fir_DUT(
    
    	// AXI Lite write
        .awready(awready),
        .wready(wready),
        .awvalid(awvalid),
        .awaddr(fir_addr),
        .wvalid(wvalid),
        .wdata(wbs_dat_i),
        
        // AXI Lite READ
        .arready(arready),
        .rready(rready),
        .arvalid(arvalid),
        .araddr(fir_addr),
        .rvalid(rvalid),
        .rdata(rdata),
        
        // AXI Stream in
        .ss_tvalid(ss_tvalid),
        .ss_tdata(ss_tdata),
        .ss_tready(ss_tready),
        
        // AXI Stream out
        .sm_tready(sm_tready),
        .sm_tvalid(sm_tvalid),
        .sm_tdata(sm_tdata),
        .sm_tlast(sm_tlast),

        // ram for tap
        .tap_WE(tap_WE),
        .tap_EN(tap_EN),
        .tap_Di(tap_Di),
        .tap_A(tap_A),
        .tap_Do(tap_Do),

        // ram for data
        .data_WE(data_WE),
        .data_EN(data_EN),
        .data_Di(data_Di),
        .data_A(data_A),
        .data_Do(data_Do),

        .axis_clk(wb_clk_i),
        .axis_rst_n(~wb_rst_i)

    );
    
    bram11 tap_RAM (
        .CLK(wb_clk_i),
        .WE(tap_WE),
        .EN(tap_EN),
        .Di(tap_Di),
        .A(tap_A),
        .Do(tap_Do)
    );
    bram11 data_RAM(
        .CLK(wb_clk_i),
        .WE(data_WE),
        .EN(data_EN),
        .Di(data_Di),
        .A(data_A),
        .Do(data_Do)
    );
    
    /*
    bram_test tap_ram (
        .clk(wb_clk_i),
        .we(tap_WE[0]),
        .re(tap_EN),
        .waddr(tap_A),
        .raddr(tap_A),
        .wdi(tap_Di),
        .rdo(tap_Do)
    );
    // DATA RAM
    bram_test data_ram (
        .clk(wb_clk_i),
        .we(data_WE[0]),
        .re(data_EN),
        .waddr(data_A),
        .raddr(data_A),
        .wdi(data_Di),
        .rdo(data_Do)
    );
	*/
	
    //------------
    // AXI-lite W
    //------------
    assign awvalid = fir_valid & (fir_addr[7:4] != 4'd8) & fir_we;	// 0x00~80
    assign wvalid  = fir_valid & (fir_addr[7:4] != 4'd8) & fir_we;	// 0x00~80
    
    //------------
    // AXI-lite R
    //------------
    assign arvalid = fir_valid & (fir_addr[7:4] != 4'd8) ;			// 0x00~80
    assign rready  = fir_valid & (fir_addr[7:4] != 4'd8) ;			// 0x00~80
    
endmodule

`default_nettype wire
