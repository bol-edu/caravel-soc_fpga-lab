`default_nettype wire

// some like this
module wishbone_arbiter(
    input         clk,
    input         rst,
    // decoder 30000
    input         wbs_stb_i,
    input         wbs_cyc_i,
    input         wbs_we_i,
    input  [3:0]  wbs_sel_i,
    input  [31:0] wbs_dat_i,
    input  [31:0] wbs_adr_i,
        
        
        
     
    // Wishbone Interface 1  decoder 3800
    input         wb1_stb_i,
    input         wb1_cyc_i,
    input         wb1_we_i,
    input  [3:0]  wb1_sel_i,
    input  [31:0] wb1_dat_i,
    input  [31:0] wb1_adr_i,
    output       wb1_ack_o,
    output  [31:0] wb1_dat_o,

    // Wishbone Interface 2  fir
    input         wb2_stb_i,
    input         wb2_cyc_i,
    input         wb2_we_i,
    input  [3:0]  wb2_sel_i,
    input  [31:0] wb2_dat_i,
    input  [31:0] wb2_adr_i,
    output     wb2_ack_o,
    output  [31:0] wb2_dat_o,

    // Wishbone Interface 3 qsort
    input         wb3_stb_i,
    input         wb3_cyc_i,
    input         wb3_we_i,
    input  [3:0]  wb3_sel_i,
    input  [31:0] wb3_dat_i,
    input  [31:0] wb3_adr_i,
    output         wb3_ack_o,
    output  [31:0] wb3_dat_o,
    
    // Wishbone Interface 4 mm
    input         wb4_stb_i,
    input         wb4_cyc_i,
    input         wb4_we_i,
    input  [3:0]  wb4_sel_i,
    input  [31:0] wb4_dat_i,
    input  [31:0] wb4_adr_i,
    output         wb4_ack_o,
    output  [31:0] wb4_dat_o

    // Shared Wishbone Bus
);

    reg [31:0] dma_x_addr,dma_y_addr,dma_a_addr,dma_b_addr,dma_c_addr,dma_q_addr;
    wire wb_hs;
    assign wb_hs = wbs_stb_i & wbs_cyc_i & wbs_we_i;
    wire                    x_addr_signal;
    wire                    y_addr_signal;
    wire                    a_addr_signal;
    wire                    b_addr_signal;
    wire                    c_addr_signal;
    wire                    q_addr_signal;

    assign x_addr_signal = (wbs_adr_i==32'h3000_0004) ? 1 : 0;
    assign y_addr_signal = (wbs_adr_i==32'h3000_0008) ? 1 : 0;
    assign a_addr_signal = (wbs_adr_i==32'h3000_0084) ? 1 : 0;
    assign b_addr_signal = (wbs_adr_i==32'h3000_0088) ? 1 : 0;
    assign c_addr_signal = (wbs_adr_i==32'h3000_008c) ? 1 : 0;
    assign q_addr_signal = (wbs_adr_i==32'h3000_0080) ? 1 : 0;
    // x-address
   always @(posedge clk or posedge rst)begin
	    if(rst) begin
	        dma_x_addr <= 0;
    	end
    	else if (wb_hs & (x_addr_signal)) begin //defined // changed : replace with x_addr_signal & wb_hs
    		dma_x_addr <= wbs_dat_i;
    	end
    	else begin
    	end
    end
   always @(posedge clk or posedge rst)begin
	    if(rst) begin
	        dma_y_addr <= 0;
    	end
    	else if (wb_hs & (y_addr_signal)) begin //defined // changed : replace with x_addr_signal & wb_hs
    		dma_y_addr <= wbs_dat_i;
    	end
    	else begin
    	end
    end
   always @(posedge clk or posedge rst)begin
	    if(rst) begin
	        dma_a_addr <= 0;
    	end
    	else if (wb_hs & (a_addr_signal)) begin //defined // changed : replace with x_addr_signal & wb_hs
    		dma_a_addr <= wbs_dat_i;
    	end
    	else begin
    	end
    end
    always @(posedge clk or posedge rst)begin
	    if(rst) begin
	        dma_b_addr <= 0;
    	end
    	else if (wb_hs & (b_addr_signal)) begin //defined // changed : replace with x_addr_signal & wb_hs
    		dma_b_addr <= wbs_dat_i;
    	end
    	else begin
    	end
    end
    
    always @(posedge clk or posedge rst)begin
	    if(rst) begin
	        dma_c_addr <= 0;
    	end
    	else if (wb_hs & (c_addr_signal)) begin //defined // changed : replace with x_addr_signal & wb_hs
    		dma_c_addr <= wbs_dat_i;
    	end
    	else begin
    	end
    end
    
    always @(posedge clk or posedge rst)begin
	    if(rst) begin
	        dma_q_addr <= 0;
    	end
    	else if (wb_hs & (q_addr_signal)) begin //defined // changed : replace with x_addr_signal & wb_hs
    		dma_q_addr <= wbs_dat_i;
    	end
    	else begin
    	end
    end
























    wire             bus_ack_o;
    wire  [31:0]     bus_dat_o;






reg [2:0] decoder,n_decoder;

localparam  INIT = 3'b000, cpu = 3'b001,fir = 3'b010, qsort = 3'b011, mm = 3'b100;



    always @(*) begin 
        case (decoder)
        
            INIT: begin 
             if(wb2_cyc_i)
             n_decoder=fir;
             else if(wb3_cyc_i)
             n_decoder=qsort;
             else if(wb4_cyc_i)
             n_decoder=mm;
             else if(wb1_cyc_i)
             n_decoder=cpu;
             else begin
             n_decoder =decoder;
            
             
             end
             
            end
            cpu: begin
            if(bus_ack_o) begin
            n_decoder= INIT;
            end
            else begin
            n_decoder= decoder;
            end
            
            end
            
            fir: begin 
            
            if(bus_ack_o) begin
            n_decoder= INIT;
            end
            else begin
            n_decoder= decoder;
            end
               
            end
            
            qsort: begin 
            if(bus_ack_o) begin
            n_decoder= INIT;
            end
            else begin
            n_decoder= decoder;
            end
            
            
            end
        
            mm:  begin
            
            if(bus_ack_o) begin
            n_decoder= INIT;
            end
            else begin
            n_decoder= decoder;
            end
            
            
            end   
            
            
            default: begin 
                n_decoder = INIT;
            end
        endcase
    end
    always @(posedge clk) begin
        if (rst) begin
            decoder <= 2'b0;
        end
        else begin
            decoder<=n_decoder;
        end
    end 





assign wb1_ack_o=bus_ack_o&(decoder==2'b01);
assign wb2_ack_o=bus_ack_o&(decoder==2'b10);
assign wb3_ack_o=bus_ack_o&(decoder==2'b11);
assign wb4_ack_o=bus_ack_o&(decoder==3'b100);
assign wb1_dat_o=bus_dat_o;
assign wb2_dat_o=bus_dat_o;
assign wb3_dat_o=bus_dat_o;
assign wb4_dat_o=bus_dat_o;


    wire         stb;
    wire         cyc;	// command strobe -request
    wire         we;		// 1: write, 0: read
    wire  [3:0]  sel;		// byte-enable
    wire  [31:0] dat;	// data in
    wire  [31:0] adr;		// address in
    
    
    //would be change to bus
    assign we = (wb1_we_i&(decoder==2'b1))|(wb2_we_i&(decoder==2'b10))|(wb3_we_i&(decoder==2'b11))|(wb4_we_i&(decoder==3'b100));
    assign sel= (wb1_sel_i&{4{(decoder==2'b1)}})|(wb2_sel_i&{4{(decoder==2'b10)}})|(wb3_sel_i&{4{(decoder==2'b11)}})|(wb4_sel_i&{4{(decoder==3'b100)}});
    assign dat= (wb1_dat_i&{32{(decoder==2'b1)}})|(wb2_dat_i&{32{(decoder==2'b10)}})|(wb3_dat_i&{32{(decoder==2'b11)}})|(wb4_dat_i&{32{(decoder==3'b100)}});
    assign adr= (wb1_adr_i&{32{(decoder==2'b1)}})|(wb2_adr_i&{32{(decoder==2'b10)}})|(wb3_adr_i&{32{(decoder==2'b11)}})|(wb4_adr_i&{32{(decoder==3'b100)}});	
    assign cyc =(wb1_cyc_i&(decoder==2'b1))|(wb2_cyc_i&(decoder==2'b10))|(wb3_cyc_i&(decoder==2'b11))|(wb4_cyc_i&(decoder==3'b100));
    //assign cyc =(wb1_cyc_i&(state==CPU))|(wb2_cyc_i&(state==FIR))|(wb3_cyc_i&(state==QS))|(wb4_cyc_i&(state===MM));
    assign stb =(wb1_stb_i&(decoder==2'b1))|(wb2_stb_i&(decoder==2'b10))|(wb3_stb_i&(decoder==2'b11))|(wb4_stb_i&(decoder==3'b100));
    wire valid;

    wire sdram_cle;
    wire sdram_cs;
    wire sdram_cas;
    wire sdram_ras;
    wire sdram_we;
    wire sdram_dqm;
    wire [1:0] sdram_ba;
    wire [12:0] sdram_a;
    wire [31:0] d2c_data;
    wire [31:0] c2d_data;
    wire [3:0]  bram_mask;

    wire [22:0] ctrl_addr;
    wire ctrl_busy;
    wire ctrl_in_valid, ctrl_out_valid;

    reg ctrl_in_valid_q;
    
    // WB MI A
    
    
    
    
    
    assign valid = cyc && stb;
    assign ctrl_in_valid = we ? valid : ~ctrl_in_valid_q && valid;
    assign bus_ack_o = (we) ? ~ctrl_busy && valid : ctrl_out_valid; 
    assign bram_mask = sel & {4{we}};
    assign ctrl_addr = adr[22:0];

    assign rst_n = ~rst;
    always @(posedge clk) begin
        if (rst) begin
            ctrl_in_valid_q <= 1'b0;
        end
        else begin
            if (~we && valid && ~ctrl_busy && ctrl_in_valid_q == 1'b0)
                ctrl_in_valid_q <= 1'b1;
            else if (ctrl_out_valid)
                ctrl_in_valid_q <= 1'b0;
        end
    end






    sdram_controller user_sdram_controller (
        .clk       (clk),
        .rst       (rst),
        // To SDRAM
        .sdram_cle (sdram_cle),
        .sdram_cs  (sdram_cs),
        .sdram_cas (sdram_cas),
        .sdram_ras (sdram_ras),
        .sdram_we  (sdram_we),
        .sdram_dqm (sdram_dqm),
        .sdram_ba  (sdram_ba),
        .sdram_a   (sdram_a),
        .sdram_dqi (d2c_data),
        .sdram_dqo (c2d_data),
        // SDRAM Control Signals
        .user_addr (ctrl_addr),
        .rw        (we),
        .data_in   (dat),
        .data_out  (bus_dat_o),
        .busy      (ctrl_busy),
        .in_valid  (ctrl_in_valid),
        .out_valid (ctrl_out_valid)
    );

    sdr user_bram (
        .Rst_n (rst_n),
        .Clk   (clk),
        .Cke   (sdram_cle),
        .Cs_n  (sdram_cs),
        .Ras_n (sdram_ras),
        .Cas_n (sdram_cas),
        .We_n  (sdram_we),
        .Addr  (sdram_a),
        .Ba    (sdram_ba),
        .Dqm   (bram_mask),
        .Dqi   (c2d_data),
        .Dqo   (d2c_data)
    );





endmodule

