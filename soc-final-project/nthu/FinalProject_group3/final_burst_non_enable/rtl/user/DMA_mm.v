
`default_nettype wire


module mm_DMA #(
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

 localparam  AR = 32'h3000_0084, BR= 32'h3000_0088, YAR = 32'h3000_008c;// should change same as firmware

	
	// input data
    wire                     ss_tready;
    wire                     ss_tvalid;
    wire [(pDATA_WIDTH-1):0] ss_tdata;
	
	// output data
    wire                     sm_tready;
    wire                     sm_tvalid;
    wire [(pDATA_WIDTH-1):0] sm_tdata;
	



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
                if( ((y_addr_counter-4)>>2)==(data_len))begin
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


    reg [(pDATA_WIDTH-1):0]	dma_a_addr;
    reg [(pDATA_WIDTH-1):0]	dma_b_addr;
    reg [(pDATA_WIDTH-1):0]	dma_y_addr;
    reg                        a_o_count;
     reg                       b_o_count;
    reg                        y_o_count;
    wire                       wb_hs;

    assign wb_hs = wbs_stb_i & wbs_cyc_i & wbs_we_i;
    wire                    a_addr_signal;
    wire                    y_addr_signal;
    wire                    b_addr_signal;
    assign a_addr_signal = (wbs_adr_i==AR) ? 1 : 0;
    assign b_addr_signal = (wbs_adr_i==BR) ? 1 : 0;
    assign y_addr_signal = (wbs_adr_i==YAR) ? 1 : 0;
    // x-address
	always @(posedge wb_clk_i or posedge wb_rst_i)begin
	    if(wb_rst_i) begin
	        dma_a_addr <= 0;
	        a_o_count <= 0;
    	end
    	else if (wb_hs & (a_addr_signal)) begin //defined // changed : replace with x_addr_signal & wb_hs
    		dma_a_addr <= wbs_dat_i;
    		a_o_count <= 1'b1;
    	end
    	else begin
    	    a_o_count <= 1'b0;
    	end
    end
       always @(posedge wb_clk_i or posedge wb_rst_i)begin
	    if(wb_rst_i) begin
	        dma_b_addr <= 0;
	        b_o_count <= 0;
    	end
    	else if (wb_hs & (b_addr_signal)) begin //defined // changed : replace with x_addr_signal & wb_hs
    		dma_b_addr <= wbs_dat_i;
    		b_o_count <= 1'b1;
    	end
    	else begin
    	    b_o_count <= 1'b0;
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
             a_b_state<=1;
	    end
	    else if (dma_ack_o &(state==X_ADDR)) begin
	      if (x_addr_counter >> 2 ==4'd15) begin
	      x_addr_counter<=32'd0;
	      a_b_state<= ~a_b_state;
	      end
	      else begin
              x_addr_counter<=x_addr_counter+32'd4;
	      end
	    end	

	    else if (dma_ack_o &(state==Y_ADDR)) begin	
            y_addr_counter<=y_addr_counter+32'd4;
            end
            else begin
            end	
       end
       
       
       
    
  ////////////// addr counter design  end ////////     
       
    // initial addr + counter addr       
    reg a_b_state;
    wire [(pDATA_WIDTH-1):0] x_addr_reg,y_addr_reg;
    assign x_addr_reg= a_b_state? (dma_a_addr + x_addr_counter):(dma_b_addr + x_addr_counter);
    assign y_addr_reg= dma_y_addr + y_addr_counter;
    
  ////////////////////// x and y addr generator end   ///////////////////////

/////////
  reg  [(pDATA_WIDTH-1):0]  data_len;
  	always @(posedge wb_clk_i or posedge wb_rst_i) begin
	    if(wb_rst_i) begin
	     data_len<=0;
	    end
	    else if (wbs_adr_i==32'h3000_0010) begin
              data_len<= 4'd15;
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
   	
       assign wbs_ack_o = a_o_count|b_o_count|y_o_count;





    // ------module conect---------
    mm mm(
         
        
        .ss_tvalid(ss_tvalid),
        .ss_tdata(ss_tdata),
        .ss_tready(ss_tready),
        
        
        .sm_tready(sm_tready),
        .sm_tvalid(sm_tvalid),
        .sm_tdata(sm_tdata),


        .axis_clk(wb_clk_i),
        .axis_rst(wb_rst_i)

    );


    
endmodule

`default_nettype wire
