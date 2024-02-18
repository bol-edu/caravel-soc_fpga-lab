`timescale 1 ns / 1 ps

module tb_top;

	localparam axi_fsm_idle = 3'b000;
	localparam axi_fsm_read_data = 3'b001;
	localparam axi_fsm_read_complete = 3'b010;
	localparam axi_fsm_write_data = 3'b011;
	localparam axi_fsm_write_complete = 3'b100;	

	integer index;
	
	reg [2:0] aa_axi_fsm_reg;

	reg [2:0] axi_fsm_0_reg;
	reg [11:0] axi_addr_0_reg;
	reg [31:0] axi_wdata_0_reg;

	reg [2:0] axi_fsm_1_reg;
	reg [11:0] axi_addr_1_reg;
	reg [31:0] axi_wdata_1_reg;

	reg [2:0] axi_fsm_2_reg;
	reg [11:0] axi_addr_2_reg;
	reg [31:0] axi_wdata_2_reg;
	
	reg [31:0] mem1 [0:255];
	reg [31:0] mem2 [0:255];
	reg [31:0] mem3 [0:255];
	reg rxen_ctl;
	reg txen_ctl;
	reg [31:0] as_reg;

	reg aa_cfg_awvalid;
	reg [31:0] aa_cfg_awaddr;
	reg aa_cfg_wvalid;
	reg [31:0] aa_cfg_wdata;
	reg [3:0] aa_cfg_wstrb;
	reg aa_cfg_arvalid;
	reg [31:0] aa_cfg_araddr;
	reg aa_cfg_rready;
	
	wire [31:0] aa_cfg_rdata;
	wire aa_cfg_rvalid;
	wire aa_cfg_awready;
	wire aa_cfg_wready;
	wire aa_cfg_arready;
	
	reg axi_wready1;		//for AXIL_AXIS
	reg axi_awready1;
	reg axi_arready1;
	reg [31:0] axi_rdata1;
	reg axi_rvalid1;
	wire axi_wready4;		//for AXIL_SWITCH
	wire axi_awready4;
	wire axi_arready4;
	wire [31:0] axi_rdata4;
	wire axi_rvalid4;
	wire axi_awready3;		//for IO_SERDES
	wire axi_wready3;
	wire axi_arready3;
	wire [31:0] axi_rdata3;
	wire axi_rvalid3;
	reg axi_awready0;		//for LOGIC_ANLZ
	reg axi_wready0;
	reg axi_arready0;
	reg [31:0] axi_rdata0;
	reg axi_rvalid0;
	reg axi_awready2;		//for USERSUBSYS
	reg axi_wready2;
	reg axi_arready2;
	reg [31:0] axi_rdata2;
	reg axi_rvalid2;

	wire axi_awvalid;
	wire [14:0] axi_awaddr;
	wire axi_wvalid;
	wire [31:0] axi_wdata;
	wire [3:0] axi_wstrb;
	wire axi_arvalid;
	wire [14:0] axi_araddr;
	wire axi_rready;	

	wire cc_aa_enable;
	wire cc_as_enable;
	wire cc_is_enable;
	wire cc_la_enable;
	wire cc_up_enable;
	wire [4:0] user_prj_sel;	
	
	reg wb_rst;
	reg wb_clk;
	reg [31:0] wbs_adr;
	reg [31:0] wbs_wdata;
	reg [3:0] wbs_sel;
	reg wbs_cyc;
	reg wbs_stb;
	reg wbs_we;
	wire wbs_ack;
	wire [31:0] wbs_rdata;
	
	reg user_clock2;
	wire axi_clk;
	reg axi_reset_n;

	wire axi_awvalid_is;
	wire axi_wvalid_is;

	wire axi_awvalid_as;
	wire axi_wvalid_as;
	
	assign axi_clk = wb_clk;

	assign axi_awvalid_is = axi_awvalid && cc_is_enable;
	assign axi_wvalid_is = axi_wvalid && cc_is_enable;
	
	assign axi_awready3 = (axi_awvalid_is && axi_wvalid_is) ? 1 : 0;
	assign axi_wready3 = (axi_awvalid_is && axi_wvalid_is) ? 1 : 0;
	assign axi_arready3 = 1;
	assign axi_rdata3 = { 30'b0, txen_ctl, rxen_ctl };
	assign axi_rvalid3 = 1;	

	assign axi_awvalid_as = axi_awvalid && cc_as_enable;
	assign axi_wvalid_as = axi_wvalid && cc_as_enable;

	assign axi_awready4 = (axi_awvalid_as && axi_wvalid_as) ? 1 : 0;
	assign axi_wready4 = (axi_awvalid_as && axi_wvalid_as) ? 1 : 0;
	assign axi_arready4 = 1;
	assign axi_rdata4 = as_reg;
	assign axi_rvalid4 = 1;

	CFG_CTRL dut (
		//////////////////////////////////////
		// FPGA AXI-Lite, from Axis-Axilite //
		//////////////////////////////////////
		.aa_cfg_awvalid(aa_cfg_awvalid),
		.aa_cfg_awaddr(aa_cfg_awaddr),
		.aa_cfg_wvalid(aa_cfg_wvalid),
		.aa_cfg_wdata(aa_cfg_wdata),
		.aa_cfg_wstrb(aa_cfg_wstrb),
		.aa_cfg_arvalid(aa_cfg_arvalid),
		.aa_cfg_araddr(aa_cfg_araddr),
		.aa_cfg_rready(aa_cfg_rready),
		.aa_cfg_rdata(aa_cfg_rdata),
		.aa_cfg_rvalid(aa_cfg_rvalid),
		.aa_cfg_awready(aa_cfg_awready),
		.aa_cfg_wready(aa_cfg_wready),
		.aa_cfg_arready(aa_cfg_arready),

		/////////////////////
		// AXI-Lite Master //
		/////////////////////	
		.axi_wready1(axi_wready1),		//for AXIL_AXIS
		.axi_awready1(axi_awready1),
		.axi_arready1(axi_arready1),
		.axi_rdata1(axi_rdata1),
		.axi_rvalid1(axi_rvalid1),
		.axi_awready4(axi_awready4),		//for AXIL_SWITCH
		.axi_wready4(axi_wready4),
		.axi_arready4(axi_arready4),
		.axi_rdata4(axi_rdata4),
		.axi_rvalid4(axi_rvalid4),
		.axi_awready3(axi_awready3),		//for IO_SERDES
		.axi_wready3(axi_wready3),
		.axi_arready3(axi_arready3),
		.axi_rdata3(axi_rdata3),
		.axi_rvalid3(axi_rvalid3),
		.axi_awready0(axi_awready0),		//for LOGIC_ANLZ
		.axi_wready0(axi_wready0),
		.axi_arready0(axi_arready0),
		.axi_rdata0(axi_rdata0),
		.axi_rvalid0(axi_rvalid0),
		.axi_awready2(axi_awready2),		//for USERSUBSYS
		.axi_wready2(axi_wready2),
		.axi_arready2(axi_arready2),
		.axi_rdata2(axi_rdata2),
		.axi_rvalid2(axi_rvalid2),
		.axi_awvalid(axi_awvalid),
		.axi_awaddr(axi_awaddr),
		.axi_wvalid(axi_wvalid),
		.axi_wdata(axi_wdata),
		.axi_wstrb(axi_wstrb),
		.axi_arvalid(axi_arvalid),
		.axi_araddr(axi_araddr),
		.axi_rready(axi_rready),		

		//////////////////////
		// Target Selection //
		//////////////////////
		.cc_aa_enable(cc_aa_enable),
		.cc_as_enable(cc_as_enable),
		.cc_is_enable(cc_is_enable),
		.cc_la_enable(cc_la_enable),
		.cc_up_enable(cc_up_enable),
		.user_prj_sel(user_prj_sel),

		////////////////////////
		// Wishbone interface //
		////////////////////////	
		.wb_rst(wb_rst),
		.wb_clk(wb_clk),
		.wbs_adr(wbs_adr),
		.wbs_wdata(wbs_wdata),
		.wbs_sel(wbs_sel),
		.wbs_cyc(wbs_cyc),
		.wbs_stb(wbs_stb),
		.wbs_we(wbs_we),
		.wbs_ack(wbs_ack),
		.wbs_rdata(wbs_rdata),

		//////////////////////////
		// Top AXI-Lite Signals //
		//////////////////////////		
		.user_clock2(user_clock2),
		.axi_clk(axi_clk),
		.axi_reset_n(axi_reset_n)
		
	);
	
	always 
		#1 wb_clk = ~wb_clk;

	initial begin
		aa_cfg_awvalid = 1'b0;
		aa_cfg_awaddr = 32'b0;
		aa_cfg_wvalid = 1'b0;
		aa_cfg_wdata = 32'b0;
		aa_cfg_wstrb = 4'b0;
		aa_cfg_arvalid = 1'b0;
		aa_cfg_araddr = 32'b0;
		aa_cfg_rready = 1'b0;
		
		axi_wready1 = 1'b0;
		axi_awready1 = 1'b0;
		axi_arready1 = 1'b0;
		axi_rdata1 = 32'b0;
		axi_rvalid1 = 1'b0;
		axi_awready0 = 1'b0;
		axi_wready0 = 1'b0;
		axi_arready0 = 1'b0;
		axi_rdata0 = 32'b0;
		axi_rvalid0 = 1'b0;
		axi_awready2 = 1'b0;
		axi_wready2 = 1'b0;
		axi_arready2 = 1'b0;
		axi_rdata2 = 32'b0;
		axi_rvalid2 = 1'b0;

		wb_rst = 1'b1;
		wb_clk = 1'b1;
		wbs_adr = 32'b0;
		wbs_wdata = 32'b0;
		wbs_sel = 4'b0;
		wbs_cyc = 1'b0;
		wbs_stb = 1'b0;
		wbs_we = 1'b0;
		
		user_clock2 = 1'b0;		
		axi_reset_n = 1'b0;
		
		for ( index = 0; index < 256; index = index + 1)
		begin
			mem1[index] = index;
			mem2[index] = index;
			mem3[index] = index;
		end
		
		#8
		wb_rst = 1'b0;
		
		#4
		axi_reset_n = 1'b1;
		
		#10
		wbs_adr = 32'h30000088;
		wbs_wdata = 32'h5a5a5a5a;
		wbs_sel = 4'b1111;
		wbs_cyc = 1'b1;
		wbs_stb = 1'b1;
		wbs_we = 1'b1;		

		aa_cfg_arvalid = 1'b1;
		aa_cfg_araddr = 32'h30000088;
		aa_cfg_rready = 1'b1;			
		
		#50
		wbs_adr = 32'h30001064;
		wbs_cyc = 1'b1;
		wbs_stb = 1'b1;
		wbs_we = 1'b0;				

		#10
		aa_cfg_awaddr = 32'h30001064;
		aa_cfg_awvalid = 1'b1;
		aa_cfg_wdata = 32'h1234567F;
		aa_cfg_wstrb = 4'b1111;
		aa_cfg_wvalid = 1'b1;
		
		#50
		aa_cfg_arvalid = 1'b1;
		aa_cfg_araddr = 32'h30001064;
		aa_cfg_rready = 1'b1;	
		
		#50		
		wbs_adr = 32'h30002088;
		wbs_wdata = 32'h5a5a5a5a;
		wbs_sel = 4'b1111;
		wbs_cyc = 1'b1;
		wbs_stb = 1'b1;
		wbs_we = 1'b1;		
		
		#10
		aa_cfg_arvalid = 1'b1;
		aa_cfg_araddr = 32'h30002088;
		aa_cfg_rready = 1'b1;		
		
		#50		
		aa_cfg_arvalid = 1'b1;
		aa_cfg_araddr = 32'h30003000;
		aa_cfg_rready = 1'b1;
		
		#10
		wbs_adr = 32'h30003000;
		wbs_wdata = 32'h11224433;
		wbs_sel = 4'b1111;
		wbs_cyc = 1'b1;
		wbs_stb = 1'b1;
		wbs_we = 1'b1;
		
		#50
		aa_cfg_arvalid = 1'b1;
		aa_cfg_araddr = 32'h30003000;
		aa_cfg_rready = 1'b1;
		
		#50
		aa_cfg_awaddr = 32'h30054000;
		aa_cfg_awvalid = 1'b1;
		aa_cfg_wdata = 32'h7878787F;
		aa_cfg_wstrb = 4'b1111;
		aa_cfg_wvalid = 1'b1;		
		
		#50
		aa_cfg_awaddr = 32'h30005000;
		aa_cfg_awvalid = 1'b1;
		aa_cfg_wdata = 32'h7878787F;
		aa_cfg_wstrb = 4'b1111;
		aa_cfg_wvalid = 1'b1;			
		
		#10
		wbs_adr = 32'h30005000;
		wbs_cyc = 1'b1;
		wbs_stb = 1'b1;		
		wbs_we = 1'b0;
		
		#50
		aa_cfg_awaddr = 32'h30004000;
		aa_cfg_awvalid = 1'b1;
		aa_cfg_wdata = 32'h7878787F;
		aa_cfg_wstrb = 4'b1111;
		aa_cfg_wvalid = 1'b1;		
		
		#10
		wbs_adr = 32'h30004000;
		wbs_cyc = 1'b1;
		wbs_stb = 1'b1;		
		wbs_we = 1'b0;
		
		#50		
		wbs_adr = 32'h30004004;
		wbs_wdata = 32'h11223344;
		wbs_sel = 4'b1111;
		wbs_cyc = 1'b1;
		wbs_stb = 1'b1;
		wbs_we = 1'b1;				
		
		#10
		aa_cfg_arvalid = 1'b1;
		aa_cfg_araddr = 32'h30004004;
		aa_cfg_rready = 1'b1;		
				
	end
	
	//WB Master wb_ack_o handling
	always @( posedge wb_clk or posedge wb_rst) begin
		if ( wb_rst ) begin
			wbs_adr <= 32'h0;
			wbs_wdata <= 32'h0;
			wbs_sel <= 4'b0;
			wbs_cyc <= 1'b0;
			wbs_stb <= 1'b0;
			wbs_we <= 1'b0;			
		end else begin 
			if ( wbs_ack ) begin
				wbs_adr <= 32'h0;
				wbs_wdata <= 32'h0;
				wbs_sel <= 4'b0;
				wbs_cyc <= 1'b0;
				wbs_stb <= 1'b0;
				wbs_we <= 1'b0;
			end
		end
	end	
	
	//FPGA AXI-Lite Master handling
	always @( posedge axi_clk or negedge axi_reset_n) begin
		if ( !axi_reset_n ) begin
			aa_cfg_awvalid <= 0;
			aa_cfg_awaddr <= 0;
			aa_cfg_wvalid <= 0;
			aa_cfg_wdata <= 0;
			aa_cfg_wstrb <= 0;
			aa_cfg_arvalid <= 0;
			aa_cfg_araddr <= 0;
			aa_cfg_rready <= 0;
			
			aa_axi_fsm_reg <= axi_fsm_idle;
		end else begin 
			case ( aa_axi_fsm_reg )
				axi_fsm_idle:
				begin											
					if ( aa_cfg_arvalid ) begin
						aa_axi_fsm_reg <= axi_fsm_read_data;
					end else if ( aa_cfg_awvalid ) begin
						aa_axi_fsm_reg <= axi_fsm_write_data;						
					end
				end
				axi_fsm_read_data:
				begin
					if ( aa_cfg_arready ) begin
						aa_cfg_araddr <= 0;
						aa_cfg_arvalid <= 0;
						aa_axi_fsm_reg <= axi_fsm_read_complete;
					end
				end
				axi_fsm_read_complete:
				begin
					if ( aa_cfg_rvalid ) begin												
						aa_cfg_rready <= 1'b0;																				
						aa_axi_fsm_reg <= axi_fsm_idle;
					end
				end
				axi_fsm_write_data:
				begin
					if ( aa_cfg_awready && aa_cfg_wready ) begin
						aa_cfg_awvalid <= 0;
						aa_cfg_awaddr <= 0;
						aa_cfg_wvalid <= 0;
						aa_cfg_wdata <= 0;
						aa_cfg_wstrb <= 0;
						aa_axi_fsm_reg <= axi_fsm_idle;
					end else if ( aa_cfg_awready ) begin
						aa_cfg_awaddr <= 0;
						aa_cfg_awvalid <= 0;
						aa_axi_fsm_reg <= axi_fsm_write_complete;						
					end
				end
				axi_fsm_write_complete:
				begin
					if ( aa_cfg_wready ) begin
						aa_cfg_wvalid <= 0;
						aa_cfg_wdata <= 0;
						aa_cfg_wstrb <= 0;
						aa_axi_fsm_reg <= axi_fsm_idle;											
					end
				end
			endcase		
		end
	end			
	
	// Always for AXI-Lite UP Slave response
	always @ ( posedge axi_clk or negedge axi_reset_n ) begin	
		if ( !axi_reset_n || !cc_up_enable ) begin
			axi_awready2 <= 0;
			axi_wready2 <= 0;
			axi_arready2 <= 0;
			axi_rdata2 <= 0; 
			axi_rvalid2 <= 0;
			axi_fsm_2_reg <= axi_fsm_idle;
			axi_addr_2_reg <= 0;
			axi_wdata_2_reg <= 0;
		end else begin
			case ( axi_fsm_2_reg )
				axi_fsm_idle:
				begin
					if ( axi_arvalid ) begin
						axi_arready2 <= 1'b1;
						axi_addr_2_reg <= axi_araddr;
						axi_fsm_2_reg <= axi_fsm_read_data;						
					end else if ( axi_awvalid && axi_wvalid ) begin
						axi_wready2 <= 1'b1;							
						axi_awready2 <= 1'b1;
						axi_addr_2_reg <= axi_awaddr;	
						axi_wdata_2_reg <= axi_wdata;	
						axi_fsm_2_reg <= axi_fsm_write_complete;
					end else if ( axi_awvalid ) begin
						axi_awready2 <= 1'b1;
						axi_addr_2_reg <= axi_awaddr;
						axi_fsm_2_reg <= axi_fsm_write_data;						
					end
				end
				axi_fsm_read_data:
				begin	
					axi_arready2 <= 1'b0;
					axi_rdata2 <= mem3[axi_addr_2_reg[7:0]];
					axi_rvalid2 <= 1'b1;	
					axi_fsm_2_reg <= axi_fsm_read_complete;																					
				end
				axi_fsm_read_complete:			
				begin
					if ( axi_rready ) begin
						axi_rdata2 <= 32'h0;
						axi_rvalid2 <= 1'b0;	
						axi_fsm_2_reg <= axi_fsm_idle;															
					end
				end	
				axi_fsm_write_data:
				begin
					axi_awready2 <= 1'b0;						
					if ( axi_wvalid ) begin
						axi_wdata_2_reg <= axi_wdata;
						axi_wready2 <= 1'b1;
						axi_fsm_2_reg <= axi_fsm_write_complete;
					end					
				end
				axi_fsm_write_complete:
				begin
					mem3[axi_addr_2_reg[7:0]] <= axi_wdata_2_reg;					
					axi_awready2 <= 1'b0;						
					axi_wready2 <= 1'b0;
					axi_fsm_2_reg <= axi_fsm_idle;
				end
			endcase
		end
	end	

	// Always for AXI-Lite LA Slave response
	always @ ( posedge axi_clk or negedge axi_reset_n ) begin	
		if ( !axi_reset_n || !cc_la_enable ) begin
			axi_awready0 <= 0;
			axi_wready0 <= 0;
			axi_arready0 <= 0;
			axi_rdata0 <= 0; 
			axi_rvalid0 <= 0;
			axi_fsm_0_reg <= axi_fsm_idle;
			axi_addr_0_reg <= 0;
			axi_wdata_0_reg <= 0;
		end else begin
			case ( axi_fsm_0_reg )
				axi_fsm_idle:
				begin
					if ( axi_arvalid ) begin
						axi_arready0 <= 1'b1;
						axi_addr_0_reg <= axi_araddr;
						axi_fsm_0_reg <= axi_fsm_read_data;						
					end else if ( axi_awvalid && axi_wvalid ) begin
						axi_wready0 <= 1'b1;							
						axi_awready0 <= 1'b1;
						axi_addr_0_reg <= axi_awaddr;	
						axi_wdata_0_reg <= axi_wdata;	
						axi_fsm_0_reg <= axi_fsm_write_complete;
					end else if ( axi_awvalid ) begin
						axi_awready0 <= 1'b1;
						axi_addr_0_reg <= axi_awaddr;
						axi_fsm_0_reg <= axi_fsm_write_data;						
					end
				end
				axi_fsm_read_data:
				begin	
					axi_arready0 <= 1'b0;
					axi_rdata0 <= mem1[axi_addr_0_reg[7:0]];
					axi_rvalid0 <= 1'b1;	
					axi_fsm_0_reg <= axi_fsm_read_complete;																					
				end
				axi_fsm_read_complete:			
				begin
					if ( axi_rready ) begin
						axi_rdata0 <= 32'h0;
						axi_rvalid0 <= 1'b0;	
						axi_fsm_0_reg <= axi_fsm_idle;															
					end
				end	
				axi_fsm_write_data:
				begin
					axi_awready0 <= 1'b0;						
					if ( axi_wvalid ) begin
						axi_wdata_0_reg <= axi_wdata;
						axi_wready0 <= 1'b1;
						axi_fsm_0_reg <= axi_fsm_write_complete;
					end					
				end
				axi_fsm_write_complete:
				begin
					mem1[axi_addr_0_reg[7:0]] <= axi_wdata_0_reg;					
					axi_awready0 <= 1'b0;						
					axi_wready0 <= 1'b0;
					axi_fsm_0_reg <= axi_fsm_idle;
				end
			endcase
		end
	end	

	// Always for AXI-Lite AA Slave response
	always @ ( posedge axi_clk or negedge axi_reset_n ) begin	
		if ( !axi_reset_n || !cc_aa_enable ) begin
			axi_awready1 <= 0;
			axi_wready1 <= 0;
			axi_arready1 <= 0;
			axi_rdata1 <= 0; 
			axi_rvalid1 <= 0;
			axi_fsm_1_reg <= axi_fsm_idle;
			axi_addr_1_reg <= 0;
			axi_wdata_1_reg <= 0;
		end else begin
			case ( axi_fsm_1_reg )
				axi_fsm_idle:
				begin
					if ( axi_arvalid ) begin
						axi_arready1 <= 1'b1;
						axi_addr_1_reg <= axi_araddr;
						axi_fsm_1_reg <= axi_fsm_read_data;						
					end else if ( axi_awvalid && axi_wvalid ) begin
						axi_wready1 <= 1'b1;							
						axi_awready1 <= 1'b1;
						axi_addr_1_reg <= axi_awaddr;	
						axi_wdata_1_reg <= axi_wdata;	
						axi_fsm_1_reg <= axi_fsm_write_complete;
					end else if ( axi_awvalid ) begin
						axi_awready1 <= 1'b1;
						axi_addr_1_reg <= axi_awaddr;
						axi_fsm_1_reg <= axi_fsm_write_data;						
					end
				end
				axi_fsm_read_data:
				begin	
					axi_arready1 <= 1'b0;
					axi_rdata1 <= mem2[axi_addr_1_reg[7:0]];
					axi_rvalid1 <= 1'b1;	
					axi_fsm_1_reg <= axi_fsm_read_complete;																					
				end
				axi_fsm_read_complete:			
				begin
					if ( axi_rready ) begin
						axi_rdata1 <= 32'h0;
						axi_rvalid1 <= 1'b0;	
						axi_fsm_1_reg <= axi_fsm_idle;															
					end
				end	
				axi_fsm_write_data:
				begin
					axi_awready1 <= 1'b0;						
					if ( axi_wvalid ) begin
						axi_wdata_1_reg <= axi_wdata;
						axi_wready1 <= 1'b1;
						axi_fsm_1_reg <= axi_fsm_write_complete;
					end					
				end
				axi_fsm_write_complete:
				begin
					mem2[axi_addr_1_reg[7:0]] <= axi_wdata_1_reg;					
					axi_awready1 <= 1'b0;						
					axi_wready1 <= 1'b0;
					axi_fsm_1_reg <= axi_fsm_idle;
				end
			endcase
		end
	end


	// AXI-Lite AS Slave response
	always @(posedge axi_clk or negedge axi_reset_n) begin
		if ( !axi_reset_n ) begin
			as_reg <= 0;
		end
		else begin
			if ( axi_awvalid_as && axi_wvalid_as ) begin		//when axi_awvalid_in=1 and axi_wvalid_in=1 means axi_awready_out=1 and axi_wready_out=1
				if (axi_awaddr[11:0] == 12'h000 ) begin //offset 0
					if ( axi_wstrb[0] == 1 ) as_reg[7:0] <= axi_wdata[7:0];
					if ( axi_wstrb[1] == 1 ) as_reg[15:8] <= axi_wdata[15:8];
					if ( axi_wstrb[2] == 1 ) as_reg[23:16] <= axi_wdata[23:16];
					if ( axi_wstrb[3] == 1 ) as_reg[31:24] <= axi_wdata[31:24];
				end
				else begin
					as_reg <= as_reg;
				end
			end
		end
	end

	// AXI-Lite IS Slave response
    	always @(posedge axi_clk or negedge axi_reset_n) begin
        	if ( !axi_reset_n ) begin
        	    rxen_ctl <= 0;
        	    txen_ctl <= 0;
        	end
        	else begin
			if ( axi_awvalid_is && axi_wvalid_is ) begin		//when axi_awvalid_in=1 and axi_wvalid_in=1 means axi_awready_out=1 and axi_wready_out=1
				if (axi_awaddr[11:0] == 12'h000 && (axi_wstrb[0] == 1) ) begin //offset 0
					rxen_ctl <= axi_wdata[0];
					txen_ctl <= axi_wdata[1];
				end
				else begin
					rxen_ctl <= rxen_ctl;
					txen_ctl <= txen_ctl;
				end
			end
        	end
	end
	
endmodule
