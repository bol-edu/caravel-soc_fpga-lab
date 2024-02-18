`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2023 05:16:40 PM
// Design Name: 
// Module Name: LOGIC_ANLZ_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LOGIC_ANLZ_tb;

    wire axi_awready;
    wire axi_wready;
    wire axi_arready;
    wire [31 : 0] axi_rdata;
    wire axi_rvalid;
    reg axi_awvalid;
    reg [14 : 0] axi_awaddr;
    reg axi_wvalid;
    reg [31 : 0] axi_wdata;
    reg [3 : 0] axi_wstrb;
    reg axi_arvalid;
    reg [14 : 0] axi_araddr;
    reg axi_rready;
    reg cc_la_enable;
    wire [31 : 0] m_tdata;
    wire [3 : 0] m_tstrb;
    wire [3 : 0] m_tkeep;
    wire m_tlast;
    wire m_tvalid;
    wire [1 : 0] m_tuser;
    wire la_hpri_req;
    reg m_tready;
    reg [23 : 0] up_la_data;
    wire user_clock2;
    reg axi_clk;
    reg axi_reset_n;
    wire axis_clk;
    wire uck2_rst_n;
    wire axis_rst_n;
  
    LOGIC_ANLZ #(
        .pADDR_WIDTH(15),
        .pDATA_WIDTH(32)
    ) DUT (
        .axi_awready(axi_awready),
        .axi_wready(axi_wready),
        .axi_arready(axi_arready),
        .axi_rdata(axi_rdata),
        .axi_rvalid(axi_rvalid),
        .axi_awvalid(axi_awvalid),
        .axi_awaddr(axi_awaddr),
        .axi_wvalid(axi_wvalid),
        .axi_wdata(axi_wdata),
        .axi_wstrb(axi_wstrb),
        .axi_arvalid(axi_arvalid),
        .axi_araddr(axi_araddr),
        .axi_rready(axi_rready),
        .cc_la_enable(cc_la_enable),
        .m_tdata(m_tdata),
        .m_tstrb(m_tstrb),
        .m_tkeep(m_tkeep),
        .m_tlast(m_tlast),
        .m_tvalid(m_tvalid),
        .m_tuser(m_tuser),
        .la_hpri_req(la_hpri_req),
        .m_tready(m_tready),
        .up_la_data(up_la_data),
        .user_clock2(user_clock2),
        .axi_clk(axi_clk),
        .axi_reset_n(axi_reset_n),
        .axis_clk(axis_clk),
        .uck2_rst_n(uck2_rst_n),
        .axis_rst_n(axis_rst_n)
    );
    
    task generate_cycles;
        input [15:0] num_cycles;
        input delay_mode;    
        input [5:0] delay_cycles;
        input [23:0] base;
    
        reg [23:0] data;
        integer i;
        reg [5:0] delay;
     
        begin
            for (i = 0; i < num_cycles; i = i + 1) begin        
                if (delay_mode) begin
                    delay = delay_cycles;
                end else begin
                    delay = $random;
                    if (delay <= 1)
                        delay = delay_cycles;            
                end
            
                data = i + 1 + base;
                
                repeat(delay) @(posedge axi_clk);
                //$display("Delay %h: Cycle %d: Data = %h", delay, i, data);        
                up_la_data = data;
            end
        end           
    endtask  
    
	reg [8:0] delayed_receive_count;
   	//AXIS Slave handling
	always @( posedge axi_clk or posedge axi_reset_n) begin
	   if ( !axi_reset_n ) begin
	       delayed_receive_count <= 0;
	       m_tready <= 1'b0;
	   end else begin
	       delayed_receive_count <= delayed_receive_count + 1;
	       
	       if (delayed_receive_count[8:6] == 3'b111)
	           m_tready <= 1'b1;
	       else 
	           m_tready <= 1'b0;
	           
	       if ( m_tready & m_tvalid ) begin
	           $display("%x", m_tdata); 
	       end 
	   end
	end	    
    
    reg [2:0] axi_fsm_reg;
	localparam axi_fsm_idle = 3'b000;
	localparam axi_fsm_read_data = 3'b001;
	localparam axi_fsm_read_complete = 3'b010;
	localparam axi_fsm_write_data = 3'b011;
	localparam axi_fsm_write_complete = 3'b100;	
		
    //FPGA AXI-Lite Master handling
	always @( posedge axi_clk or negedge axi_reset_n) begin
		if ( !axi_reset_n ) begin
			axi_awvalid <= 0;
			axi_awaddr <= 0;
			axi_wvalid <= 0;
			axi_wdata <= 0;
			axi_wstrb <= 0;
			axi_arvalid <= 0;
			axi_araddr <= 0;
			axi_rready <= 0;
			
			axi_fsm_reg <= axi_fsm_idle;
		end else begin 
			case ( axi_fsm_reg )
				axi_fsm_idle:
				begin											
					if ( axi_arvalid ) begin
						axi_fsm_reg <= axi_fsm_read_data;
					end else if ( axi_awvalid ) begin
						axi_fsm_reg <= axi_fsm_write_data;						
					end
				end
				axi_fsm_read_data:
				begin
					if ( axi_arready ) begin
					    $display("Read CFG Addr: %x",axi_araddr); 
						axi_araddr <= 0;
						axi_arvalid <= 0;
						axi_fsm_reg <= axi_fsm_read_complete;
					end
				end
				axi_fsm_read_complete:
				begin
					if ( axi_rvalid ) begin
                        $display("Read CFG data: %x",axi_rdata); 															
						axi_rready <= 1'b0;																				
						axi_fsm_reg <= axi_fsm_idle;
					end
				end
				axi_fsm_write_data:
				begin
					if ( axi_awready && axi_wready ) begin
						axi_awvalid <= 0;
						axi_awaddr <= 0;
						axi_wvalid <= 0;
						axi_wdata <= 0;
						axi_wstrb <= 0;
						axi_fsm_reg <= axi_fsm_idle;
					end else if ( axi_awready ) begin
						axi_awaddr <= 0;
						axi_awvalid <= 0;
						axi_fsm_reg <= axi_fsm_write_complete;						
					end
				end
				axi_fsm_write_complete:
				begin
					if ( axi_wready ) begin
						axi_wvalid <= 0;
						axi_wdata <= 0;
						axi_wstrb <= 0;
						axi_fsm_reg <= axi_fsm_idle;											
					end
				end
			endcase		
		end
	end		     
        
    assign axis_clk = axi_clk;
    assign axis_rst_n = axi_reset_n; 
           
    always 
		#50 axi_clk = ~axi_clk;    
		
   initial begin
        axi_clk = 1'b0;
		up_la_data = 24'b0;
		axi_reset_n = 1'b0;
		cc_la_enable = 1'b0;		
		
        axi_awvalid = 1'b0;
        axi_awaddr = 32'b0;
        axi_wvalid = 1'b0;
        axi_wdata = 32'b0;
        axi_wstrb = 4'b0;
        axi_arvalid = 1'b0;
        axi_araddr = 32'b0;
        axi_rready = 1'b0;		
      			
		repeat (10) @(posedge axi_clk);
	    axi_reset_n = 1'b1;	

	    repeat (10) @(posedge axi_clk);
		@(posedge axi_clk)
		begin
		    cc_la_enable <= 1'b1;
            axi_arvalid <= 1'b1;
            axi_araddr <= 32'h30001000;
            axi_rready <= 1'b1;		  
		end

	    repeat (15) @(posedge axi_clk);
		@(posedge axi_clk)
		begin
		    cc_la_enable <= 1'b1;
            axi_awvalid <= 1'b1;
            axi_awaddr <= 32'h30001000;
            axi_wvalid <= 1'b1;
            axi_wdata <= 32'h00ffffff;
		end

	    repeat (15) @(posedge axi_clk);
		@(posedge axi_clk)
		begin
		    cc_la_enable <= 1'b1;
            axi_arvalid <= 1'b1;
            axi_araddr <= 32'h30001000;
            axi_rready <= 1'b1;		  
		end			  
		
	    repeat (10) @(posedge axi_clk);
		@(posedge axi_clk)
		begin
		    cc_la_enable <= 1'b1;
            axi_arvalid <= 1'b1;
            axi_araddr <= 32'h3000100C;
            axi_rready <= 1'b1;		  
		end

	    repeat (15) @(posedge axi_clk);
		@(posedge axi_clk)
		begin
		    cc_la_enable <= 1'b1;
            axi_awvalid <= 1'b1;
            axi_awaddr <= 32'h3000100C;
            axi_wvalid <= 1'b1;
            axi_wdata <= 32'h10;
		end

	    repeat (15) @(posedge axi_clk);
		@(posedge axi_clk)
		begin
		    cc_la_enable <= 1'b1;
            axi_arvalid <= 1'b1;
            axi_araddr <= 32'h3000100C;
            axi_rready <= 1'b1;		  
		end			  		
		 		
	    repeat (15) @(posedge axi_clk);
	    @(posedge axi_clk)
        generate_cycles(16'h80, 1'b0, 6'h3F, 24'h0);  

	    repeat (15) @(posedge axi_clk);
	    @(posedge axi_clk)       
        generate_cycles(16'h80, 1'b1, 6'h2, 24'h111100);

	    repeat (2000) @(posedge axi_clk);        
        $finish;
							
    end				
    
endmodule
