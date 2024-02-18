`timescale 1 ns / 1 ps

module CFG_CTRL #( parameter pADDR_WIDTH   = 12,
                   parameter pDATA_WIDTH   = 32
                 )
(
	//////////////////////////////////////
	// FPGA AXI-Lite, from Axis-Axilite //
	//////////////////////////////////////
	input  wire          aa_cfg_awvalid,
	input  wire  [31: 0] aa_cfg_awaddr,
	input  wire          aa_cfg_wvalid,
	input  wire  [31: 0] aa_cfg_wdata,
	input  wire   [3: 0] aa_cfg_wstrb,
	input  wire          aa_cfg_arvalid,
	input  wire  [31: 0] aa_cfg_araddr,
	input  wire          aa_cfg_rready,
	output wire  [31: 0] aa_cfg_rdata,
	output wire          aa_cfg_rvalid,
	output wire          aa_cfg_awready,
	output wire          aa_cfg_wready,
	output wire          aa_cfg_arready,
	
	/////////////////////
	// AXI-Lite Master //
	/////////////////////
	input  wire          axi_wready1,		//for AXIL_AXIS
	input  wire          axi_awready1,
	input  wire          axi_arready1,
	input  wire  [31: 0] axi_rdata1,
	input  wire          axi_rvalid1,
	input  wire          axi_awready4,		//for AXIL_SWITCH
	input  wire          axi_wready4,
	input  wire          axi_arready4,
	input  wire  [31: 0] axi_rdata4,
	input  wire          axi_rvalid4,
	input  wire          axi_awready3,		//for IO_SERDES
	input  wire          axi_wready3,
	input  wire          axi_arready3,
	input  wire  [31: 0] axi_rdata3,
	input  wire          axi_rvalid3,
	input  wire          axi_awready0,		//for LOGIC_ANLZ
	input  wire          axi_wready0,
	input  wire          axi_arready0,
	input  wire  [31: 0] axi_rdata0,
	input  wire          axi_rvalid0,
	input  wire          axi_awready2,		//for USERSUBSYS
	input  wire          axi_wready2,
	input  wire          axi_arready2,
	input  wire  [31: 0] axi_rdata2,
	input  wire          axi_rvalid2,
	output wire          axi_awvalid,
	output wire  [14: 0] axi_awaddr,
	output wire          axi_wvalid,
	output wire  [31: 0] axi_wdata,
	output wire   [3: 0] axi_wstrb,
	output wire          axi_arvalid,
	output wire  [14: 0] axi_araddr,
	output wire          axi_rready,	
	
	//////////////////////
	// Target Selection //
	//////////////////////
	output wire          cc_aa_enable,
	output wire          cc_as_enable,
	output wire          cc_is_enable,
	output wire          cc_la_enable,
	output wire          cc_up_enable,
	output wire   [4: 0] user_prj_sel,
	
	////////////////////////
	// Wishbone interface //
	////////////////////////	
	input  wire          wb_rst,
	input  wire          wb_clk,
	input  wire  [31: 0] wbs_adr,
	input  wire  [31: 0] wbs_wdata,
	input  wire   [3: 0] wbs_sel,
	input  wire          wbs_cyc,
	input  wire          wbs_stb,
	input  wire          wbs_we,
	output wire          wbs_ack,
	output wire  [31: 0] wbs_rdata,
	
	//////////////////////////
	// Top AXI-Lite Signals //
	//////////////////////////
	input  wire          user_clock2,
	input  wire          axi_clk,
	input  wire          axi_reset_n,
	input  wire          uck2_rst_n
);

	////////////////////////////
	// Internal Signals begin //
	////////////////////////////	
	reg wb_fsm_reg;
	reg wb_axi_request;
	reg wb_axi_request_rw;
	reg [3:0] wb_axi_wstrb;
	reg wb_axi_request_done;
	reg [31:0] wb_axi_request_add;
	reg [31:0] wb_axi_wdata;
	reg [31:0] wb_axi_rdata;
	
	reg [2:0] f_axi_fsm_reg;
	reg f_axi_request;
	reg f_axi_request_rw;
	reg [3:0] f_axi_wstrb;
	reg f_axi_request_done;
	reg [31:0] f_axi_request_add;
	reg [31:0] f_axi_wdata;
	reg [31:0] f_axi_rdata;
	
	reg [2:0] m_axi_fsm_reg;
	
	reg axi_grant_o_reg = 1'b0;
	wire m_axi_request;
	wire m_axi_request_rw;
	wire [3:0] m_axi_wstrb;
	wire m_axi_request_done;
	wire [31:0] m_axi_request_add;
	wire [31:0] m_axi_wdata;
	
	wire m_axi_awready;
	wire m_axi_wready;
	wire m_axi_arready;
	wire [31:0] m_axi_rdata;
	wire m_axi_rvalid;
	
	reg cc_enable;
	reg cc_sub_enable;

	wire cc_axi_awvalid;
	wire cc_axi_wvalid;

	reg [2:0] cc_s_fsm_reg;	
	reg [11:0] cc_s_addr;
	reg [31:0] cc_s_wdata;
	reg [31:0] cc_s_rdata;
	
	wire axi_awready5;
	wire axi_wready5;
	wire axi_arready5;
	wire [31: 0] axi_rdata5;
	wire axi_rvalid5;
	
	//////////////////////////////////////
	// Internal signals for Ports begin //
	//////////////////////////////////////
	reg [31: 0] aa_cfg_rdata_o = 32'b0;
	reg aa_cfg_rvalid_o = 1'b0;
	reg aa_cfg_awready_o = 1'b0;
	reg aa_cfg_wready_o = 1'b0;
	reg aa_cfg_arready_o = 1'b0;
	
	reg axi_awvalid_o = 1'b0;
	reg [14: 0] axi_awaddr_o = 15'b0;
	reg axi_wvalid_o = 1'b0;
	reg [31: 0] axi_wdata_o = 32'b0;
	reg [3: 0] axi_wstrb_o = 4'b0;
	reg axi_arvalid_o = 1'b0;
	reg [14: 0] axi_araddr_o = 15'b0;
	reg axi_rready_o = 1'b0;

	reg cc_aa_enable_o;
	reg cc_as_enable_o;
	reg cc_is_enable_o;
	reg cc_la_enable_o;
	reg cc_up_enable_o;

	reg [4: 0] user_prj_sel_o;
	
	reg wbs_ack_o;
	reg [31: 0] wbs_rdata_o;
	
	///////////////////////////////////
	// Assignment for Internal begin //
	///////////////////////////////////
	assign m_axi_request = axi_grant_o_reg ? f_axi_request : wb_axi_request;
	assign m_axi_request_rw = axi_grant_o_reg ? f_axi_request_rw : wb_axi_request_rw;
	assign m_axi_wstrb = axi_grant_o_reg ? f_axi_wstrb : wb_axi_wstrb;
	assign m_axi_request_done = axi_grant_o_reg ? f_axi_request_done : wb_axi_request_done;
	assign m_axi_request_add = axi_grant_o_reg ? f_axi_request_add : wb_axi_request_add;
	assign m_axi_wdata = axi_grant_o_reg ? f_axi_wdata : wb_axi_wdata;

	/*
	In case of cc_sub_enable, read always return 0xFFFFFFFF, write always complete.
	({1{cc_sub_enable}} & axi_awvalid))
	({1{cc_sub_enable}} & axi_wvalid))
	({1{cc_sub_enable}} & axi_arvalid))
	({32{cc_sub_enable}} & 32'hFFFFFFFF))
	({1{cc_sub_enable}} & axi_arvalid))
	*/
	assign m_axi_awready = ((((((({1{cc_up_enable}} & axi_awready2) | ({1{cc_la_enable}} & axi_awready0)) | ({1{cc_aa_enable}} & axi_awready1)) | ({1{cc_is_enable}} & axi_awready3)) | ({1{cc_as_enable}} & axi_awready4)) | ({1{cc_enable}} & axi_awready5)) | ({1{cc_sub_enable}} & axi_awvalid));
	assign m_axi_wready = ((((((({1{cc_up_enable}} & axi_wready2) | ({1{cc_la_enable}} & axi_wready0)) | ({1{cc_aa_enable}} & axi_wready1)) | ({1{cc_is_enable}} & axi_wready3)) | ({1{cc_as_enable}} & axi_wready4)) | ({1{cc_enable}} & axi_wready5)) | ({1{cc_sub_enable}} & axi_wvalid));
	assign m_axi_arready = ((((((({1{cc_up_enable}} & axi_arready2) | ({1{cc_la_enable}} & axi_arready0)) | ({1{cc_aa_enable}} & axi_arready1)) | ({1{cc_is_enable}} & axi_arready3)) | ({1{cc_as_enable}} & axi_arready4)) | ({1{cc_enable}} & axi_arready5)) | ({1{cc_sub_enable}} & axi_arvalid));
	assign m_axi_rdata = ((((((({32{cc_up_enable}} & axi_rdata2) | ({32{cc_la_enable}} & axi_rdata0)) | ({32{cc_aa_enable}} & axi_rdata1)) | ({32{cc_is_enable}} & axi_rdata3)) | ({32{cc_as_enable}} & axi_rdata4)) | ({32{cc_enable}} & axi_rdata5)) | ({32{cc_sub_enable}} & 32'hFFFFFFFF));
	assign m_axi_rvalid = ((((((({1{cc_up_enable}} & axi_rvalid2) | ({1{cc_la_enable}} & axi_rvalid0)) | ({1{cc_aa_enable}} & axi_rvalid1)) | ({1{cc_is_enable}} & axi_rvalid3)) | ({1{cc_as_enable}} & axi_rvalid4)) | ({1{cc_enable}} & axi_rvalid5)) | ({1{cc_sub_enable}} & axi_arvalid));
	
	
	assign cc_axi_awvalid = axi_awvalid && cc_enable;
	assign cc_axi_wvalid = axi_wvalid && cc_enable;

	////////////////////////////////
	// Assignment for Ports begin //
	////////////////////////////////
	assign aa_cfg_rdata = aa_cfg_rdata_o;
	assign aa_cfg_rvalid = aa_cfg_rvalid_o;
	assign aa_cfg_awready = aa_cfg_awready_o;
	assign aa_cfg_wready = aa_cfg_wready_o;
	assign aa_cfg_arready = aa_cfg_arready_o;

	assign axi_awvalid = axi_awvalid_o;
	assign axi_awaddr = axi_awaddr_o;
	assign axi_wvalid = axi_wvalid_o;
	assign axi_wdata = axi_wdata_o;
	assign axi_wstrb = axi_wstrb_o;
	assign axi_arvalid = axi_arvalid_o;
	assign axi_araddr = axi_araddr_o;
	assign axi_rready = axi_rready_o;

	assign cc_aa_enable = cc_aa_enable_o;
	assign cc_as_enable = cc_as_enable_o;
	assign cc_is_enable = cc_is_enable_o;
	assign cc_la_enable = cc_la_enable_o;
	assign cc_up_enable = cc_up_enable_o;

	assign user_prj_sel = user_prj_sel_o;

	assign wbs_ack = wbs_ack_o;
	assign wbs_rdata = wbs_rdata_o;

	assign axi_awready5 = cc_axi_awvalid ? 1 : 0;
	assign axi_wready5 = cc_axi_wvalid ? 1 : 0;
	assign axi_arready5 = 1'b1;
	assign axi_rdata5 = { 27'b0, user_prj_sel_o };
	assign axi_rvalid5 = 1'b1;

	//////////////////////////// 
	// Local paramaters begin //
	////////////////////////////
	localparam wb_fsm_idle = 1'b0;
	localparam wb_fsm_inprogress = 1'b1;

	localparam axi_fsm_idle = 3'b000;
	localparam axi_fsm_read_data = 3'b001;
	localparam axi_fsm_read_complete = 3'b010;
	localparam axi_fsm_write_data = 3'b011;
	localparam axi_fsm_write_complete = 3'b100;
	
	/////////////////////////////////
	// Always for Target Selection //
	/////////////////////////////////
	always @ ( posedge axi_clk or negedge axi_reset_n)
	begin
		if ( !axi_reset_n )
		begin
			cc_aa_enable_o <= 1'b0;
			cc_as_enable_o <= 1'b0;
			cc_is_enable_o <= 1'b0;
			cc_la_enable_o <= 1'b0;
			cc_up_enable_o <= 1'b0;
			cc_enable <= 1'b0;
			cc_sub_enable <= 1'b0;
		end else
		begin
			cc_aa_enable_o <= ( m_axi_request_add[31:12] == 20'h30002 )? 1'b1 : 1'b0;
			cc_as_enable_o <= ( m_axi_request_add[31:12] == 20'h30004 )? 1'b1 : 1'b0;
			cc_is_enable_o <= ( m_axi_request_add[31:12] == 20'h30003 )? 1'b1 : 1'b0;
			cc_la_enable_o <= ( m_axi_request_add[31:12] == 20'h30001 )? 1'b1 : 1'b0;
			cc_up_enable_o <= ( m_axi_request_add[31:12] == 20'h30000 )? 1'b1 : 1'b0;
			cc_enable <= ( m_axi_request_add[31:12] == 20'h30005 )? 1'b1 : 1'b0;
			cc_sub_enable <= ( (m_axi_request_add[31:12] >= 20'h30006) && (m_axi_request_add[31:12] <= 20'h3FFFF ) )? 1'b1 : 1'b0;
		end
	end	
	////////////////////////////////////////////
	// Always for Wishbone Interface handling //
	////////////////////////////////////////////
	always @ ( posedge wb_clk or posedge wb_rst)
	begin
		if ( wb_rst ) 
		begin
			wb_fsm_reg <= wb_fsm_idle;
			wb_axi_request <= 1'b0;
			wb_axi_request_rw <= 1'b0;
			wb_axi_wstrb <= 4'b0;
			wb_axi_request_add <= 32'b0;
			wb_axi_wdata <= 32'b0;
			
			wbs_ack_o <= 1'b0;
			wbs_rdata_o <= 32'b0;						
		end else
		begin
			case (wb_fsm_reg) 
				wb_fsm_idle:
				begin
					wbs_ack_o <= 1'b0;
					wbs_rdata_o <= 32'h0;
					if ( !wbs_ack_o ) begin
						if ( wbs_cyc && wbs_stb ) begin
							wb_axi_request <= 1'b1;
							wb_axi_request_rw <= wbs_we;
							wb_axi_request_add <= wbs_adr;	//Latch wbs_adr
							if ( wbs_we ) begin
								wb_axi_wdata <= wbs_wdata;	//Latch wbs_wdata;
								wb_axi_wstrb <= wbs_sel;
							end
							wb_fsm_reg <= wb_fsm_inprogress;
						end
					end
				end
				wb_fsm_inprogress:
				begin
					if ( wb_axi_request_done )
					begin
						wbs_ack_o <= 1'b1;	
						if ( !wb_axi_request_rw )
							wbs_rdata_o <= wb_axi_rdata;	//Output wbs_rdata_o
						else
							wb_axi_wdata <= 32'h0;
						wb_axi_request <= 1'b0;
						wb_axi_request_add <= 32'b0;
						wb_fsm_reg <= wb_fsm_idle;						
					end
				end
			endcase
		end
	end	

	/////////////////////////////////////////////////
	// Always for FPGA-AXI-Lite Interface handling //
	/////////////////////////////////////////////////	
	always @ ( posedge axi_clk or negedge axi_reset_n)
	begin
		if ( !axi_reset_n )
		begin
			f_axi_fsm_reg <= axi_fsm_idle;
			f_axi_request <= 1'b0;
			f_axi_request_rw <= 1'b0;
			f_axi_wstrb <= 4'b0;
			f_axi_request_add <= 32'b0;
			f_axi_wdata <= 32'b0;
			
			aa_cfg_rdata_o <= 32'b0;
			aa_cfg_rvalid_o <= 1'b0;
			aa_cfg_awready_o <= 1'b0;
			aa_cfg_wready_o <= 1'b0;
			aa_cfg_arready_o <= 1'b0;			
		end else
		begin
			case ( f_axi_fsm_reg )
				axi_fsm_idle:
				begin			
					aa_cfg_wready_o <= 1'b0;
					if ( aa_cfg_awvalid ) begin
						aa_cfg_awready_o <= 1'b1;
						f_axi_request_add <= aa_cfg_awaddr;		//Latch awaddr
						f_axi_fsm_reg <= axi_fsm_write_data;
					end else if ( aa_cfg_arvalid ) begin
						aa_cfg_arready_o <= 1'b1;
						f_axi_request_add <= aa_cfg_araddr;		//Latch araddr
						f_axi_request_rw <= 1'b0;
						f_axi_request <= 1'b1;						
						f_axi_fsm_reg <= axi_fsm_read_data;
					end
				end
				axi_fsm_read_data:
				begin
					aa_cfg_arready_o <= 1'b0;
					if ( aa_cfg_rready && f_axi_request_done ) begin
						aa_cfg_rdata_o <= f_axi_rdata;			//Output aa_cfg_rdata_o
						aa_cfg_rvalid_o <= 1'b1;
						f_axi_request <= 1'b0;	
						f_axi_request_add <= 32'b0;
						f_axi_fsm_reg <= axi_fsm_read_complete;						
					end
				end
				axi_fsm_read_complete:
				begin
					if ( aa_cfg_rready ) begin
						aa_cfg_rdata_o <= 32'b0;
						aa_cfg_rvalid_o <= 1'b0;
						f_axi_fsm_reg <= axi_fsm_idle;		
					end					
				end
				axi_fsm_write_data:
				begin
					aa_cfg_awready_o <= 1'b0;
					if ( aa_cfg_wvalid ) begin
						f_axi_request <= 1'b1;
						f_axi_request_rw <= 1'b1;	
						f_axi_wdata <= aa_cfg_wdata;			//Latch wdata
						f_axi_wstrb <= aa_cfg_wstrb;						
						f_axi_fsm_reg <= axi_fsm_write_complete;		
					end
				end
				axi_fsm_write_complete:
				begin
					if ( f_axi_request_done ) begin
						aa_cfg_wready_o <= 1'b1;
						f_axi_request <= 1'b0;		
						f_axi_request_add <= 32'b0;
						f_axi_fsm_reg <= axi_fsm_idle;								
					end
				end
			endcase			
		end
	end
	
	/////////////////////////////////////////////////
	// Always for requests grant - axi_grant_o_reg //
	/////////////////////////////////////////////////
	always @( posedge wb_clk or posedge wb_rst )
	begin
		if ( wb_rst ) begin
			axi_grant_o_reg <= 1'b0;
		end else begin
			case (axi_grant_o_reg)
				1'b0: begin
					if ((~wb_axi_request)) begin
						if (f_axi_request) begin
							axi_grant_o_reg <= 1'b1;
						end
					end
				end
				1'b1: begin
					if ((~f_axi_request)) begin
						if (wb_axi_request) begin
							axi_grant_o_reg <= 1'b0;
						end
					end
				end			
			endcase
		end
	end		

	///////////////////////////////////////////////////
	// Always for AXI-Lite Master Interface handling //
	///////////////////////////////////////////////////
	always @ ( posedge axi_clk or negedge axi_reset_n )
	begin
		if ( !axi_reset_n ) begin
			wb_axi_rdata <= 32'b0;
			wb_axi_request_done <= 1'b0;
			
			f_axi_rdata <= 32'b0;
			f_axi_request_done <= 1'b0;
			
			axi_awvalid_o <= 1'b0;
			axi_awaddr_o <= 15'b0;
			axi_wvalid_o <= 1'b0;
			axi_wdata_o <= 32'b0;
			axi_wstrb_o <= 4'b0;
			axi_arvalid_o <= 1'b0;
			axi_araddr_o <= 15'b0;
			axi_rready_o <= 1'b0;			

			m_axi_fsm_reg <= axi_fsm_idle;
		end else begin
			case ( m_axi_fsm_reg )
				axi_fsm_idle:
				begin
					wb_axi_request_done <= 1'b0;
					f_axi_request_done <= 1'b0;			
					if ( m_axi_request && !m_axi_request_done ) begin
						if ( m_axi_request_rw ) begin
							axi_awvalid_o <= 1'b1;
							axi_awaddr_o <= m_axi_request_add[14:0];							
							axi_wvalid_o <= 1'b1;
							axi_wdata_o <= m_axi_wdata;
							axi_wstrb_o <= m_axi_wstrb;
							m_axi_fsm_reg <= axi_fsm_write_data;
						end else begin
							axi_arvalid_o <= 1'b1;							
							axi_araddr_o <= m_axi_request_add[14:0];
							axi_rready_o <= 1'b1;
							m_axi_fsm_reg <= axi_fsm_read_data;
						end
					end
				end
				axi_fsm_read_data:
				begin
					if ( m_axi_arready && m_axi_rvalid) begin
						axi_arvalid_o <= 1'b0;
						axi_araddr_o <= 15'b0;
						axi_rready_o <= 1'b0;
						if ( axi_grant_o_reg )
							f_axi_rdata <= m_axi_rdata;
						else 
							wb_axi_rdata <= m_axi_rdata;
						if ( axi_grant_o_reg )
							f_axi_request_done <= 1'b1;
						else 
							wb_axi_request_done <= 1'b1;
						m_axi_fsm_reg <= axi_fsm_idle;												
					end else if ( m_axi_arready ) begin
						axi_araddr_o <= 15'b0;
						axi_arvalid_o <= 1'b0;
						m_axi_fsm_reg <= axi_fsm_read_complete;	
					end
				end
				axi_fsm_read_complete:
				begin
					if ( m_axi_rvalid ) begin
						axi_rready_o <= 1'b0;
						if ( axi_grant_o_reg )
							f_axi_rdata <= m_axi_rdata;
						else 
							wb_axi_rdata <= m_axi_rdata;
						if ( axi_grant_o_reg )
							f_axi_request_done <= 1'b1;
						else 
							wb_axi_request_done <= 1'b1;
						m_axi_fsm_reg <= axi_fsm_idle;						
					end
				end
				axi_fsm_write_data:
				begin
					if ( m_axi_awready && m_axi_wready) begin
						axi_awvalid_o <= 1'b0;
						axi_awaddr_o <= 15'b0;
						axi_wvalid_o <= 1'b0;
						axi_wdata_o <= 32'b0;
						axi_wstrb_o <= 4'b0;
						if ( axi_grant_o_reg )
							f_axi_request_done <= 1'b1;
						else 
							wb_axi_request_done <= 1'b1;						
						m_axi_fsm_reg <= axi_fsm_idle;	
					end	else begin
						if ( m_axi_awready ) begin
							axi_awaddr_o <= 15'b0;
							axi_awvalid_o <= 1'b0;
							m_axi_fsm_reg <= axi_fsm_write_complete;								
						end
					end
				end
				axi_fsm_write_complete:
				begin
					if ( m_axi_wready) begin
						axi_wvalid_o <= 1'b0;
						axi_wdata_o <= 32'b0;
						axi_wstrb_o <= 4'b0;
						if ( axi_grant_o_reg )
							f_axi_request_done <= 1'b1;
						else 
							wb_axi_request_done <= 1'b1;					
						m_axi_fsm_reg <= axi_fsm_idle;	
					end
				end
			endcase
		end
	end

	///////////////////////////////////////////
	// Always for AXI-Lite CC Slave response //
	///////////////////////////////////////////	
	always @ ( posedge axi_clk or negedge axi_reset_n ) 
	begin	
		if ( !axi_reset_n ) begin
			user_prj_sel_o <= 5'b0;
		end else begin
			if ( cc_axi_awvalid && cc_axi_wvalid ) begin
				if (axi_awaddr[11:0] == 12'h000 && (axi_wstrb[0] == 1) ) begin //offset 0
					user_prj_sel_o <= axi_wdata[4:0];
				end
				else begin
					user_prj_sel_o <= user_prj_sel_o;
				end
			end
		end
	end	

endmodule
