`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/17 22:39:23
// Design Name: 
// Module Name: arbiter_tb
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
module axis_sw_tb();
parameter   DATA_WIDTH = 32;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
parameter   pUSER_PROJECT_SIDEBAND_WIDTH = 5;
`endif
parameter   STRB_WIDTH = DATA_WIDTH/8;
parameter   USER_WIDTH = 2;
parameter   TID_WIDTH = 2;
parameter   VALID_WS_LEN = 2;
reg o_clk, o_rst_n;
//for axi_lite
//write address channel
reg 	soc_axi_awvalid;
reg 	[14:0] soc_axi_awaddr;		
wire	soc_axi_awready;
//write data channel
reg 	soc_axi_wvalid;
reg 	[DATA_WIDTH-1:0] soc_axi_wdata;
reg 	[(DATA_WIDTH/8)-1:0] soc_axi_wstrb;
wire	soc_axi_wready;
//read addr channel
reg 	soc_axi_arvalid;
reg 	[14:0] soc_axi_araddr;
wire soc_axi_arready;
//read data channel
wire soc_axi_rvalid;
wire [DATA_WIDTH-1:0] soc_axi_rdata;
reg 	soc_axi_rready;
reg 	soc_cc_as_enable;		//axi_lite enable       
/*
*for Aribter
*/
//Input stream 0
reg [DATA_WIDTH-1:0] data_0;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
reg [pUSER_PROJECT_SIDEBAND_WIDTH-1:0] upsb_0;
`endif
reg [STRB_WIDTH-1:0] strb_0, keep_0;
reg [USER_WIDTH-1:0] user_0; 
reg valid_0, hpri_req0, tlast_0;
wire ready_0;
//Input stream 1
reg [DATA_WIDTH-1:0] data_1;
reg [STRB_WIDTH-1:0] strb_1, keep_1;
reg [USER_WIDTH-1:0] user_1; 
reg valid_1, tlast_1;
wire ready_1;
//Input stream 2
reg [DATA_WIDTH-1:0] data_2;
reg [STRB_WIDTH-1:0] strb_2, keep_2;
reg [USER_WIDTH-1:0] user_2; 
reg valid_2, hpri_req2, tlast_2;
wire ready_2;
//ouput stream
wire [DATA_WIDTH-1:0] data_m;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
wire [pUSER_PROJECT_SIDEBAND_WIDTH-1:0] upsb_m;
`endif
wire [STRB_WIDTH-1:0] strb_m, keep_m;
wire valid_m, tlast_m;
wire [USER_WIDTH-1:0] user_m;
wire [TID_WIDTH-1:0] tid_m; 
reg ready_m;
/*
*for Demux
*/
//Input stream
reg is_valid = 1'b0, is_tlast;
reg [DATA_WIDTH-1:0] is_data;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
reg [pUSER_PROJECT_SIDEBAND_WIDTH-1:0] is_upsb;
`endif
reg [STRB_WIDTH-1:0] is_strb;
reg [STRB_WIDTH-1:0] is_keep;
reg [TID_WIDTH-1:0] is_tid;
reg [USER_WIDTH-1:0] is_user;
wire is_ready;
//ouput stream 0
wire [DATA_WIDTH-1:0] up_data;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
wire [pUSER_PROJECT_SIDEBAND_WIDTH-1:0] up_upsb;
`endif
wire [STRB_WIDTH-1:0] up_keep;
wire [STRB_WIDTH-1:0] up_strb;
wire up_valid, up_tlast;
wire [USER_WIDTH-1:0] up_user;
reg up_ready;
//ouput stream 1
wire [DATA_WIDTH-1:0] aa_data;
wire [STRB_WIDTH-1:0] aa_keep;
wire [STRB_WIDTH-1:0] aa_strb;
wire aa_valid, aa_tlast;
wire [USER_WIDTH-1:0] aa_user;
reg aa_ready;
reg start_test; 
//axi_lite
task soc_cfg_write;		//input addr, data, strb and valid_delay 
	input [14:0] axi_awaddr;
	input [DATA_WIDTH-1:0] axi_wdata;
	input [3:0] axi_wstrb;
	input [7:0] valid_delay;
	begin
		soc_axi_awaddr <= axi_awaddr;
		soc_axi_awvalid <= 0;
		soc_axi_wdata <= axi_wdata;
		soc_axi_wstrb <= axi_wstrb;
		soc_axi_wvalid <= 0;
		repeat (valid_delay) @ (posedge o_clk);
		soc_axi_awvalid <= 1;
		soc_axi_wvalid <= 1;
		@ (posedge o_clk);
		while (soc_axi_awready == 0) begin		//assume both soc_axi_awready and soc_axi_wready assert as the same time.
			@ (posedge o_clk);
		end
		$display($time, "=> soc_cfg_write : soc_axi_awaddr=%x, soc_axi_awvalid=%b, soc_axi_awready=%b, soc_axi_wdata=%x, axi_wstrb=%x, soc_axi_wvalid=%b, soc_axi_wready=%b", soc_axi_awaddr, soc_axi_awvalid, soc_axi_awready, soc_axi_wdata, axi_wstrb, soc_axi_wvalid, soc_axi_wready); 
		soc_axi_awvalid <= 0;
		soc_axi_wvalid <= 0;
	end
endtask
task soc_cfg_read;		//input addr and valid_delay 
	input [14:0] axi_araddr;
	input [7:0] valid_delay;
	begin
		soc_axi_araddr <= axi_araddr;
		soc_axi_arvalid <= 0;
		soc_axi_rready <= 0;
		repeat (valid_delay) @ (posedge o_clk);
		soc_axi_arvalid <= 1;
		@ (posedge o_clk);
		while (soc_axi_arready == 0) begin		
				@ (posedge o_clk);
		end
		$display($time, "=> soc_cfg_read : soc_axi_araddr=%x, soc_axi_arvalid=%b, soc_axi_arready=%b", soc_axi_araddr, soc_axi_arvalid, soc_axi_arready); 
		soc_axi_arvalid <= 0;
		repeat (valid_delay) @ (posedge o_clk);
		soc_axi_rready <= 1;
		@ (posedge o_clk);
		while (soc_axi_rvalid == 0) begin		
				@ (posedge o_clk);
		end
		$display($time, "=> soc_cfg_read : soc_axi_rdata=%x, soc_axi_rready=%b, soc_axi_rvalid=%b", soc_axi_rdata, soc_axi_rready, soc_axi_rvalid); 
		soc_axi_rready <= 0;
	end
endtask
reg[31:0]idx;
task axis_tx;
        input [7:0] valid_delay;
		begin
			@ (posedge o_clk);			
			for(idx=0; idx<10; idx=idx+1)begin
				data_0 <=  idx + 32'h00001110;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
                upsb_0 <= idx;
`endif				
				strb_0 <=  4'hf;
				keep_0 <=  4'hf;
				user_0 <=  2'b00;
				if(idx == 4'h9)
				    tlast_0 <=  1'h1;
				else
				    tlast_0 <=  1'h0;
                if(valid_delay != 0) begin
                    valid_0 <= 0;				    
                    repeat (valid_delay) @ (posedge o_clk);	
                end                    			    
				valid_0 <= 1;
				@ (posedge o_clk);
				while (ready_0 == 0) begin		
					@ (posedge o_clk);
				end
			end
			valid_0 <= 0;
            tlast_0 <=  1'h0;
		end
endtask
reg[31:0]idxh;
task axis_tx_hi_req;
        input [7:0] valid_delay;
		begin
			@ (posedge o_clk);			
			for(idxh=0; idxh<10; idxh=idxh+1)begin
				data_0 <=  idxh + 32'h00002220;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
                upsb_0 <= idxh + 5'h10;
`endif					
				strb_0 <=  4'hf;
				keep_0 <=  4'hf;
				user_0 <=  2'b00;
				tlast_0 <= 1'b0;
				if(idxh == 4'h9)
				    hpri_req0 <=  1'h0;
				else
				    hpri_req0 <=  1'h1;
                if(valid_delay != 0) begin
                    valid_0 <= 0;				    
                    repeat (valid_delay) @ (posedge o_clk);	
                end                    			    
				valid_0 <= 1;
				@ (posedge o_clk);
				while (ready_0 == 0) begin		
					@ (posedge o_clk);
				end
			end
			valid_0 <= 0;
		end
endtask
reg[31:0]idx1;
task axis_tx1;
        input [7:0] valid_delay;
		begin
			@ (posedge o_clk);
			for(idx1=0; idx1<10; idx1=idx1+1)begin
				data_1 <=  idx1 + 32'h00003330;
				strb_1 <=  4'hf;
				keep_1 <=  4'hf;
				user_1 <=  2'b01;
				if(idx1 == 4'h9)
				    tlast_1 <=  1'h1;
				else
				    tlast_1 <=  1'h0;
                if(valid_delay != 0) begin
                    valid_1 <= 0;				    
                    repeat (valid_delay) @ (posedge o_clk);	
                end                    			    
				valid_1 <= 1;
				@ (posedge o_clk);
				while (ready_1 == 0) begin		
					@ (posedge o_clk);
				end
			end
			valid_1 <= 0;
            tlast_1 <=  1'h0;
		end
endtask
reg[31:0]idx2;
task axis_tx2;
        input [7:0] valid_delay;
		begin
			@ (posedge o_clk);
			for(idx2=0; idx2<10; idx2=idx2+1)begin
				data_2 <=  idx2 + 32'h00005550;
				strb_2 <=  4'hf;
				keep_2 <=  4'hf;
				user_2 <=  2'b00;
				if(idx2 == 4'h9)
				    tlast_2 <=  1'h1;
				else
				    tlast_2 <=  1'h0;
                if(valid_delay != 0) begin
                    valid_2 <= 0;				    
                    repeat (valid_delay) @ (posedge o_clk);	
                end                    			    
				valid_2 <= 1;
				@ (posedge o_clk);
				while (ready_2 == 0) begin		
					@ (posedge o_clk);
				end
			end
			valid_2 <= 0;
            tlast_2 <=  1'h0;
		end
endtask
reg[31:0]idx2h;
task axis_tx_hi_req2;
        input [7:0] valid_delay;
		begin
			@ (posedge o_clk);
			for(idx2h=0; idx2h<10; idx2h=idx2h+1)begin
				data_2 <=  idx2h + 32'h00006660;
				strb_2 <=  4'hf;
				keep_2 <=  4'hf;
				user_2 <=  2'b00;
				tlast_2 <= 1'b0;
				if(idx2h == 4'h9)
				    hpri_req2 <=  1'h0;
				else
				    hpri_req2 <=  1'h1;
                if(valid_delay != 0) begin
                    valid_2 <= 0;				    
                    repeat (valid_delay) @ (posedge o_clk);	
                end                    			    
				valid_2 <= 1;
				@ (posedge o_clk);
				while (ready_2 == 0) begin		
					@ (posedge o_clk);
				end
			end
			valid_2 <= 0;
		end
endtask
task axis_rx;    
    begin
        ready_m <= 1;
        if(ready_m && valid_m) begin
            $display("Upstream received stream data is %h", data_m);
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
            $display("Upstream received up sideband is %h", upsb_m);   
`endif	            
            $display("TID is %h", tid_m);                
            $display("data strobe is %h", strb_m);
            $display("keep is %h", keep_m);
            $display("user data is %h", user_m);
            if(tlast_m) begin
                $display("This transaction is over"); 
                ready_m <= 0;                
            end
        end                                                                  
    end  
endtask
//for Demux task
task is_axis_tx;
    input [DATA_WIDTH-1:0] data_in;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
    input [pUSER_PROJECT_SIDEBAND_WIDTH-1:0] upsb_in;
`endif    
    input [STRB_WIDTH-1:0] strb_in;    
    input [STRB_WIDTH-1:0] keep_in;
    input tlast_in;  
    input [TID_WIDTH-1:0] tid_in;        
    input [USER_WIDTH-1:0] user_in;  
    input [VALID_WS_LEN-1:0] valid_wait_state;
    begin    
        is_data = #0 data_in;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
        is_upsb = upsb_in;
`endif         
        is_strb = strb_in;        
        is_keep = keep_in;
        is_tlast = tlast_in;
        is_tid = tid_in;
        is_user = user_in;
        if(valid_wait_state != {(VALID_WS_LEN){1'b0}}) begin
            is_valid = 0;
            repeat (valid_wait_state) @ (posedge o_clk);
        end
        is_valid = 1;
        repeat (1) @ (posedge o_clk); 
//test case 1_begin:  when checking valid and ready are 1 from  Io_serses
/*
        if(!is_ready) begin
            wait(is_ready)
            is_valid = 1;
            repeat (1) @ (posedge o_clk); 
        end 
*/             
//test case 1_end                        
//test case 2_begin: when valid is 1 to receive data from Io_serses (now we apply this test case for Tony's requirement)     
        if(!is_ready) begin
            is_valid = 0;
            repeat (1) @ (posedge o_clk);
            wait(is_ready);
            is_valid = 1;
            repeat (1) @ (posedge o_clk);              
        end     
//test case 2_end             
        wait(is_valid && is_ready);
        if(tlast_in) begin
            is_valid = #0 0;  
            is_tlast = 0;
        end            
    end  
endtask
task up_axis_rx;
    begin
        up_ready <= 1;
        if(up_ready && up_valid) begin
            $display("User Project stream data is %h", up_data);
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
            $display("User Project sideband is %h", up_upsb);   
`endif            
            $display("strb is %h", up_strb);            
            $display("keep is %h", up_keep);
            $display("user data is %h", up_user);
            if(up_tlast) begin 
                $display("This transaction is over");
            end                 
        end
    end  
endtask
task aa_axis_rx;
    reg [4:0] dcount;
    begin
        if(dcount != 5'd0) begin
            if(dcount == 5'd5) begin
                aa_ready <= 1;
                dcount <= 5'd0;
            end else begin
                aa_ready <= 0;
                dcount <= dcount + 1;
            end
        end else begin
            aa_ready <= 1;
            dcount <= 5'd0;
        end                        
        if(aa_ready && aa_valid) begin
            $display("Axis_Axilite stream data is %h", aa_data);
            $display("strb is %h", aa_strb);            
            $display("keep is %h", aa_keep);
            $display("user data is %h", aa_user);
            if(aa_tlast) begin
                $display("This transaction is over"); 
            end
            if((aa_data==16'h5551) && (dcount == 5'd0)) begin
                dcount <= 1;
            end                        
       end
    end  
endtask
//for Arbiter Rx
always @(posedge o_clk) begin
    if(o_rst_n)
        if(start_test == 1)
            axis_rx;
end
//For Demux Rx
always @(posedge o_clk) begin
    if(o_rst_n)
        if(start_test == 1)
            up_axis_rx;
end
always @(posedge o_clk) begin
    if(o_rst_n)
        if(start_test == 1)
            aa_axis_rx;
end
initial
begin
#150
start_test = 1'b1;  
end
initial
begin
    start_test = 1'b0;    
	o_clk = 0;
	o_rst_n = 1'b0;
	#100 o_rst_n = 1;
	#50 
    //for axi_lite
    //write addr channel
    soc_axi_awvalid = 0;
    soc_axi_awaddr = 0;
    //write data channel
    soc_axi_wvalid = 0;
    soc_axi_wdata = 0;
    soc_axi_wstrb = 0;
    //read addr channel
    soc_axi_arvalid = 0;
    soc_axi_araddr = 0;
    //read data channel
    soc_axi_rready = 0;
    soc_cc_as_enable = 0;
    #100;
    soc_cc_as_enable = 1;
    soc_cfg_write(0,0,1,0);		//write offset 0 = 0
    soc_cfg_read(0,0);			//read offset 0
    soc_cfg_write(0,3,1,0);		//write offset 0 = 3
    soc_cfg_read(0,0);			//read offset 0
    axis_tx_hi_req(8'h0);
end
initial
begin
    #5000 
	axis_tx(8'h0);    
end
initial
begin
#1000
axis_tx1(8'h0);
end
initial
begin
#1000
axis_tx_hi_req2(8'h0);
end
initial
begin
    #5000 
    axis_tx2(8'h0);    	
end
//for Demux
initial
begin
    start_test = 1'b0;    
	o_clk = 0;
	o_rst_n = 1'b0;
	#150 o_rst_n = 1;
	#1000 
	
`ifdef USER_PROJECT_SIDEBAND_SUPPORT	
    //data, upsb, strb, keep, tlast, tid, user, wait 
	is_axis_tx(16'h2221, 5'h0, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);   
	is_axis_tx(16'h2222, 5'h1, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);
	is_axis_tx(16'h2223, 5'h2, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);    
	is_axis_tx(16'h2224, 5'h3, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);
	is_axis_tx(16'h2225, 5'h4, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);   
	is_axis_tx(16'h2226, 5'h5, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);
	is_axis_tx(16'h2227, 5'h6, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);    
	is_axis_tx(16'h2228, 5'h7, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);
	is_axis_tx(16'h2229, 5'h8, 4'hF, 4'hF, 1'b1, 2'b00, 2'b00, 2'b00);    	 		   	
	is_axis_tx(16'h1111, 5'h10, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00);
	is_axis_tx(16'h1112, 5'h11, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00); 	  	
	is_axis_tx(16'h1113, 5'h12, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00);  
	is_axis_tx(16'h1114, 5'h13, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00); 
	is_axis_tx(16'h1115, 5'h14, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00);  
	is_axis_tx(16'h1116, 5'h15, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00); 	  	
	is_axis_tx(16'h1117, 5'h16, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00);  
	is_axis_tx(16'h1118, 5'h17, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00); 					
	is_axis_tx(16'h1119, 5'h18, 4'hF, 4'hF, 1'b1, 2'b01, 2'b01, 2'b00);
	#1000 
    //data, upsb, strb, keep, tlast, tid, user, wait 
	is_axis_tx(16'h3331, 5'h9, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);   
	is_axis_tx(16'h3332, 5'h8, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);
	is_axis_tx(16'h3333, 5'h7, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);    
	is_axis_tx(16'h3334, 5'h6, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);
	is_axis_tx(16'h3335, 5'h5, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);  
	is_axis_tx(16'h3336, 5'h4, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);
	is_axis_tx(16'h3337, 5'h3, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);    
	is_axis_tx(16'h3338, 5'h2, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);
	is_axis_tx(16'h3339, 5'h1, 4'hF, 4'hF, 1'b1, 2'b00, 2'b00, 2'b00);  	
    is_axis_tx(16'h5551, 5'h19, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00);
	is_axis_tx(16'h5552, 5'h18, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00); 	  	
	is_axis_tx(16'h5553, 5'h17, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00);  
	is_axis_tx(16'h5554, 5'h16, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00); 
	is_axis_tx(16'h5555, 5'h15, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00);  
	is_axis_tx(16'h5556, 5'h14, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00); 	  	
	is_axis_tx(16'h5557, 5'h13, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00);  
	is_axis_tx(16'h5558, 5'h12, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00);
	is_axis_tx(16'h5559, 5'h11, 4'hF, 4'hF, 1'b1, 2'b01, 2'b01, 2'b00);
`else
    //data, strb, keep, tlast, tid, user, wait 
	is_axis_tx(16'h2221, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);   
	is_axis_tx(16'h2222, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);
	is_axis_tx(16'h2223, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);    
	is_axis_tx(16'h2224, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);
	is_axis_tx(16'h2225, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);   
	is_axis_tx(16'h2226, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);
	is_axis_tx(16'h2227, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);    
	is_axis_tx(16'h2228, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);
	is_axis_tx(16'h2229, 4'hF, 4'hF, 1'b1, 2'b00, 2'b00, 2'b00);    	 		   	
	is_axis_tx(16'h1111, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00);
	is_axis_tx(16'h1112, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00); 	  	
	is_axis_tx(16'h1113, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00);  
	is_axis_tx(16'h1114, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00); 
	is_axis_tx(16'h1115, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00);  
	is_axis_tx(16'h1116, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00); 	  	
	is_axis_tx(16'h1117, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00);  
	is_axis_tx(16'h1118, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00); 					
	is_axis_tx(16'h1119, 4'hF, 4'hF, 1'b1, 2'b01, 2'b01, 2'b00);
	#1000 
    //data, strb, keep, tlast, tid, user, wait 
	is_axis_tx(16'h3331, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);   
	is_axis_tx(16'h3332, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);
	is_axis_tx(16'h3333, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);    
	is_axis_tx(16'h3334, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);
	is_axis_tx(16'h3335, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);  
	is_axis_tx(16'h3336, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);
	is_axis_tx(16'h3337, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);    
	is_axis_tx(16'h3338, 4'hF, 4'hF, 1'b0, 2'b00, 2'b00, 2'b00);
	is_axis_tx(16'h3339, 4'hF, 4'hF, 1'b1, 2'b00, 2'b00, 2'b00);  	
    is_axis_tx(16'h5551, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00);
	is_axis_tx(16'h5552, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00); 	  	
	is_axis_tx(16'h5553, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00);  
	is_axis_tx(16'h5554, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00); 
	is_axis_tx(16'h5555, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00);  
	is_axis_tx(16'h5556, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00); 	  	
	is_axis_tx(16'h5557, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00);  
	is_axis_tx(16'h5558, 4'hF, 4'hF, 1'b0, 2'b01, 2'b01, 2'b00);
	is_axis_tx(16'h5559, 4'hF, 4'hF, 1'b1, 2'b01, 2'b01, 2'b00);
`endif 
end
AXIS_SW uut_AXIS_SW(
.axi_reset_n(o_rst_n),
.axis_clk(o_clk),
//axi_lite interface
.axi_awvalid(soc_axi_awvalid),
.axi_awaddr(soc_axi_awaddr),
.axi_awready(soc_axi_awready),
.axi_wvalid(soc_axi_wvalid),
.axi_wdata(soc_axi_wdata),
.axi_wstrb(soc_axi_wstrb),
.axi_wready(soc_axi_wready),
.axi_arvalid(soc_axi_arvalid),
.axi_araddr(soc_axi_araddr),
.axi_arready(soc_axi_arready),
.axi_rvalid(soc_axi_rvalid),
.axi_rdata(soc_axi_rdata),
.axi_rready(soc_axi_rready),
.cc_as_enable(soc_cc_as_enable),
//Upstream for axis arbiter
.up_as_tdata(data_0),
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
.up_as_tupsb(upsb_0),
`endif 
.up_as_tstrb(strb_0),
.up_as_tkeep(keep_0),
.up_as_tlast(tlast_0),
.up_as_tvalid(valid_0),
.up_as_tuser(user_0),
.up_hpri_req(hpri_req0),
.as_up_tready(ready_0),
.aa_as_tdata(data_1),
.aa_as_tstrb(strb_1),
.aa_as_tkeep(keep_1),
.aa_as_tlast(tlast_1),
.aa_as_tvalid(valid_1),
.aa_as_tuser(user_1),
.as_aa_tready(ready_1),
.la_as_tdata(data_2),
.la_as_tstrb(strb_2),
.la_as_tkeep(keep_2),
.la_as_tlast(tlast_2),
.la_as_tvalid(valid_2),
.la_as_tuser(user_2),
.la_hpri_req(hpri_req2),
.as_la_tready(ready_2),
.as_is_tdata(data_m),
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
.as_is_tupsb(upsb_m),
`endif 
.as_is_tstrb(strb_m),
.as_is_tkeep(keep_m),
.as_is_tlast(tlast_m),
.as_is_tid(tid_m), 
.as_is_tvalid(valid_m),
.as_is_tuser(user_m),
.is_as_tready(ready_m),
//Downstream for axis demux
.is_as_tdata(is_data),
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
.is_as_tupsb(is_upsb),
`endif 
.is_as_tstrb(is_strb),
.is_as_tkeep(is_keep),
.is_as_tlast(is_tlast),
.is_as_tid(is_tid),
.is_as_tvalid(is_valid),
.is_as_tuser(is_user),
.as_is_tready(is_ready),
.as_up_tdata(up_data),
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
.as_up_tupsb(up_upsb),
`endif 
.as_up_tstrb(up_strb),
.as_up_tkeep(up_keep),
.as_up_tlast(up_tlast),
.as_up_tvalid(up_valid),
.as_up_tuser(up_user),
.up_as_tready(up_ready),
.as_aa_tdata(aa_data),
.as_aa_tstrb(aa_strb),
.as_aa_tkeep(aa_keep),
.as_aa_tlast(aa_tlast),
.as_aa_tvalid(aa_valid),
.as_aa_tuser(aa_user),
.aa_as_tready(aa_ready)
);
always	#50 o_clk = ~o_clk;
endmodule
