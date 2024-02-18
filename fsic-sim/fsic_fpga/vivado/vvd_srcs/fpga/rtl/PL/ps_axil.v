`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 11:28:50 AM
// Design Name: 
// Module Name: ps_axil
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


module ps_axil(
	//////////////////////////
	// PS AXI-Lite, from PS //
	//////////////////////////
	input  wire  [31: 0] s_axi_araddr,		//for address read
	output wire          s_axi_arready,
	input  wire          s_axi_arvalid,
	input  wire  [31: 0] s_axi_awaddr,		//for address write
	output wire          s_axi_awready,
	input  wire          s_axi_awvalid,
	input  wire          s_axi_bready,		//for write response
	output wire   [1: 0] s_axi_bresp,
	output wire          s_axi_bvalid,
	output wire  [31: 0] s_axi_rdata,		//for data read
	input  wire          s_axi_rready,
	output wire   [1: 0] s_axi_rresp,
	output wire          s_axi_rvalid,	
	input  wire  [31: 0] s_axi_wdata,		//for data write
	output wire          s_axi_wready,	
	input  wire   [3: 0] s_axi_wstrb,
	input  wire          s_axi_wvalid,	

	//////////////////
	// FSIC Signals //
	//////////////////
	output wire aa_mb_irq,
	input wire  is_ioclk,
    output wire [37:0] caravel_mprj_out,
    input wire [37:0] caravel_mprj_in,	

	//////////////////////
	//  LADMA AXI MM IF //
	//////////////////////	
	output wire [63:0] ladma_mm_araddr,
	output wire [1:0] ladma_mm_arburst,
	output wire [3:0] ladma_mm_arcache,
	output wire [0:0] ladma_mm_arid,
	output wire [7:0] ladma_mm_arlen,
	output wire [1:0] ladma_mm_arlock,
	output wire [2:0] ladma_mm_arprot,
	output wire [3:0] ladma_mm_arqos,
	input wire ladma_mm_arready,
	output wire [3:0] ladma_mm_arregion,
	output wire [2:0] ladma_mm_arsize,
	output wire [0:0] ladma_mm_aruser,
	output wire ladma_mm_arvalid,
	output wire [63:0] ladma_mm_awaddr,
	output wire [1:0] ladma_mm_awburst,
	output wire [3:0] ladma_mm_awcache,
	output wire [0:0] ladma_mm_awid,
	output wire [7:0] ladma_mm_awlen,
	output wire [1:0] ladma_mm_awlock,
	output wire [2:0] ladma_mm_awprot,
	output wire [3:0] ladma_mm_awqos,
	input wire ladma_mm_awready,
	output wire [3:0] ladma_mm_awregion,
	output wire [2:0] ladma_mm_awsize,
	output wire [0:0] ladma_mm_awuser,
	output wire ladma_mm_awvalid,
	input wire [0:0] ladma_mm_bid,
	output wire ladma_mm_bready,
	input wire [1:0] ladma_mm_bresp,
	input wire [0:0] ladma_mm_buser,
	input wire ladma_mm_bvalid,
	input wire [31:0] ladma_mm_rdata,
	input wire [0:0] ladma_mm_rid,
	input wire ladma_mm_rlast,
	output wire ladma_mm_rready,
	input wire [1:0] ladma_mm_rresp,
	input wire [0:0] ladma_mm_ruser,
	input wire ladma_mm_rvalid,
	output wire [31:0] ladma_mm_wdata,
	output wire ladma_mm_wlast,
	input wire ladma_mm_wready,
	output wire [3:0] ladma_mm_wstrb,
	output wire [0:0] ladma_mm_wuser,
	output wire ladma_mm_wvalid,

	////////////////
	// LADMA AXIL //
	////////////////
	input wire [31:0] ladma_s_araddr,
	output wire ladma_s_arready,
	input wire ladma_s_arvalid,
	input wire [31:0] ladma_s_awaddr,
	output wire ladma_s_awready,
	input wire ladma_s_awvalid,
	input wire ladma_s_bready,
	output wire [1:0] ladma_s_bresp,
	output wire ladma_s_bvalid,
	output wire [31:0] ladma_s_rdata,
	input wire ladma_s_rready,
	output wire [1:0] ladma_s_rresp,
	output wire ladma_s_rvalid,
	input wire [31:0] ladma_s_wdata,
	output wire ladma_s_wready,
	input wire [3:0] ladma_s_wstrb,
	input wire ladma_s_wvalid,

	/////////////////////
	// LADMA Interrupt //
	/////////////////////
	output wire ladma_interrupt,

	///////////////////////
	//  User DMA AXIS IF //
	///////////////////////
    input wire [31:0] updma_si_tdata,
    input wire [3:0] updma_si_tstrb,
    input wire [3:0] updma_si_tkeep,
    input wire updma_si_tlast,
    input wire updma_si_tvalid,
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
    input wire [6:0] updma_si_tuser,
`else
    input wire [1:0] updma_si_tuser,
`endif
    output wire updma_si_tready,

    output wire [31:0] updma_so_tdata,
    output wire [3:0] updma_so_tstrb,
    output wire [3:0] updma_so_tkeep,
    output wire updma_so_tlast,
    output wire updma_so_tvalid,
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
    output wire [6:0] updma_so_tuser,
`else
    output wire [1:0] updma_so_tuser,
`endif
    input wire updma_so_tready,

	//////////////////////
	// AXI QSPI Signals //
	//////////////////////
	input wire qspi_io0_i,
	output wire qspi_io1_o,
	input wire qspi_sck_i,
	input wire qspi_ss_i,

	/////////////////////////////
	// Global AXI-Lite Signals //
	/////////////////////////////
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 axi_clk CLK" *)
(* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axi, ASSOCIATED_RESET axi_reset_n, FREQ_HZ 5000000" *)
	input  wire          axi_clk,
	input  wire          axi_reset_n,
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 axi_clk_m CLK" *)
(* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF ladma_mm, ASSOCIATED_RESET axi_reset_m_n, FREQ_HZ 5000000" *)
	input  wire          axi_clk_m,
	input  wire          axi_reset_m_n,
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 axi_clk_udsi CLK" *)
(* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF updma_si, ASSOCIATED_RESET axis_rst_n, FREQ_HZ 5000000" *)
	input  wire          axi_clk_usdi,
	input  wire          axi_reset_usdi_n,
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 axi_clk_udso CLK" *)
(* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF updma_so, ASSOCIATED_RESET axis_rst_n, FREQ_HZ 5000000" *)
	input  wire          axi_clk_udso,
	input  wire          axi_reset_udso_n,
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 axis_clk CLK" *)
(* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF ladma_s, ASSOCIATED_RESET axis_rst_n, FREQ_HZ 5000000" *)
	input  wire          axis_clk,
    input  wire          axis_rst_n
    );

	////////////////////////////////
	// AXI-Lite Master, to Slaves //
	////////////////////////////////
	//Input
	wire          axi_awready0;		//for AXIS_SWITCH
	wire          axi_wready0;
	wire          axi_arready0;
	wire  [31: 0] axi_rdata0;
	wire          axi_rvalid0;
	wire          axi_wready1;		//for AXIL_AXIS
	wire          axi_awready1;
	wire          axi_arready1;
	wire  [31: 0] axi_rdata1;
	wire          axi_rvalid1;
	wire          axi_awready2;		//for IO_SERDES
	wire          axi_wready2;
	wire          axi_arready2;
	wire  [31: 0] axi_rdata2;
	wire          axi_rvalid2;
	//Output
	wire          axi_awvalid;
	wire  [14: 0] axi_awaddr;
	wire          axi_wvalid;
	wire  [31: 0] axi_wdata;
	wire   [3: 0] axi_wstrb;
	wire          axi_arvalid;
	wire  [14: 0] axi_araddr;
	wire          axi_rready;	
	
	//////////////////////
	// Target Selection //
	//////////////////////
	//Output
	wire          aa_enable;
	wire          as_enable;
	wire          is_enable;

	///////////////////////
	// Stream Connection //
	///////////////////////
	wire [31:0] is_as_tdata;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
    wire [4:0] is_as_tupsb;
`endif
	wire [3:0] is_as_tstrb;
	wire [3:0] is_as_tkeep;
	wire is_as_tlast;
	wire [1:0] is_as_tid;
	wire is_as_tvalid;
	wire [1:0] is_as_tuser;
	wire as_is_tready;

	wire [31:0] as_is_tdata;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
    wire [4:0] as_is_tupsb;
`endif
	wire [3:0] as_is_tstrb;
	wire [3:0] as_is_tkeep;
	wire as_is_tlast;
	wire [1:0]as_is_tid;
	wire as_is_tvalid;
	wire [1:0]as_is_tuser;
	wire is_as_tready;

	wire [31:0] as_aa_tdata;
	wire [3:0] as_aa_tstrb;
	wire [3:0] as_aa_tkeep;
	wire as_aa_tlast;
	wire as_aa_tvalid;
	wire [1:0] as_aa_tuser;
	wire aa_as_tready;
	
	wire [31:0] aa_as_tdata;
	wire [3:0] aa_as_tstrb;
	wire [3:0] aa_as_tkeep;
	wire aa_as_tlast;
	wire aa_as_tvalid;
	wire [1:0] aa_as_tuser;
	wire as_aa_tready;

	wire [31:0] outStream_tdata;
	wire [3:0] outStream_tstrb;   
	wire [3:0] outStream_tkeep;
	wire outStream_tlast;
	wire outStream_tvalid;
	wire [1:0] outStream_tuser; 
	wire outStream_tready;

	////////////////////////////
	// Internal Signals begin //
	////////////////////////////	
	reg [2:0] ps_axi_fsm_reg;
	reg ps_axi_request;
	reg ps_axi_request_rw;
	reg [3:0] ps_axi_wstrb;
	reg ps_axi_request_done;
	reg [31:0] ps_axi_request_add;
	reg [31:0] ps_axi_wdata;
	reg [31:0] ps_axi_rdata;
	
	reg [2:0] axi_fsm_reg;
	
	wire axi_awready;
	wire axi_wready;
	wire axi_arready;
	wire [31:0] axi_rdata;
	wire axi_rvalid;
	
	reg aa_enable_o;
	reg as_enable_o;
	reg is_enable_o;	

	//////////////////////////////////////
	// Internal signals for Ports begin //
	//////////////////////////////////////
	reg s_axi_arready_o;       //for address read
	reg s_axi_awready_o;       //for address write
	reg [1: 0] s_axi_bresp_o;  //for write response
	reg s_axi_bvalid_o;
	reg [31: 0] s_axi_rdata_o; //for data read
	reg [1: 0] s_axi_rresp_o;
	reg s_axi_rvalid_o;
	reg s_axi_wready_o;        //for data write	
	
    reg axi_awvalid_o;
    reg [14: 0] axi_awaddr_o;
    reg axi_wvalid_o;
    reg [31: 0] axi_wdata_o;
    reg [3: 0] axi_wstrb_o;
    reg axi_arvalid_o;
    reg [14: 0] axi_araddr_o;
    reg axi_rready_o;

    wire [12:0] is_serial_rxd;
    wire is_serial_rclk;
    wire [12:0] is_serial_txd;
    wire is_serial_tclk;
       
    assign caravel_mprj_out = {1'bz, is_ioclk, 1'bz, 13'bz, is_serial_tclk, is_serial_txd, 3'bz, qspi_sck_i, qspi_ss_i, qspi_io0_i, 2'bz};
    assign is_serial_rclk = caravel_mprj_in[35];
    assign is_serial_rxd = caravel_mprj_in[34:22];
    assign qspi_io1_o = caravel_mprj_in[1];
    	
	///////////////////////////////////
	// Assignment for Internal begin //
	///////////////////////////////////	
    assign axi_awready = ((({1{is_enable}} & axi_awready2) | ({1{as_enable}} & axi_awready0)) | ({1{aa_enable}} & axi_awready1));
	assign axi_wready = ((({1{is_enable}} & axi_wready2) | ({1{as_enable}} & axi_wready0)) | ({1{aa_enable}} & axi_wready1));
	assign axi_arready = ((({1{is_enable}} & axi_arready2) | ({1{as_enable}} & axi_arready0)) | ({1{aa_enable}} & axi_arready1));
	assign axi_rdata = ((({32{is_enable}} & axi_rdata2) | ({32{as_enable}} & axi_rdata0)) | ({32{aa_enable}} & axi_rdata1));
	assign axi_rvalid = ((({1{is_enable}} & axi_rvalid2) | ({1{as_enable}} & axi_rvalid0)) | ({1{aa_enable}} & axi_rvalid1));
		
	////////////////////////////////
	// Assignment for Ports begin //
	////////////////////////////////	
	assign s_axi_arready = s_axi_arready_o;    //for address read
	assign s_axi_awready = s_axi_awready_o;    //for address write
	assign s_axi_bresp = s_axi_bresp_o;        //for write response
	assign s_axi_bvalid = s_axi_bvalid_o;
	assign s_axi_rdata = s_axi_rdata_o;        //for data read
	assign s_axi_rresp = s_axi_rresp_o;
	assign s_axi_rvalid = s_axi_rvalid_o;
	assign s_axi_wready = s_axi_wready_o;      //for data write
	
    assign axi_awvalid = axi_awvalid_o;
    assign axi_awaddr = axi_awaddr_o;
    assign axi_wvalid = axi_wvalid_o;
    assign axi_wdata = axi_wdata_o;
    assign axi_wstrb = axi_wstrb_o;
    assign axi_arvalid = axi_arvalid_o;
    assign axi_araddr = axi_araddr_o;
    assign axi_rready = axi_rready_o;	
	
	assign aa_enable = aa_enable_o;
	assign as_enable = as_enable_o;
	assign is_enable = is_enable_o;

	//////////////////////////// 
	// Local paramaters begin //
	////////////////////////////
	localparam axi_fsm_idle = 3'b000;
	localparam axi_fsm_read_data = 3'b001;
	localparam axi_fsm_read_complete = 3'b010;
	localparam axi_fsm_write_data = 3'b011;
	localparam axi_fsm_write_complete = 3'b100;
	localparam axi_fsm_write_response = 3'b101;
		
	///////////////////////////////////////////////
	// Always for PS-AXI-Lite Interface handling //
	///////////////////////////////////////////////	
	always @ ( posedge axi_clk or negedge axi_reset_n)
	begin
		if ( !axi_reset_n )
		begin
			ps_axi_fsm_reg <= axi_fsm_idle;
			ps_axi_request <= 1'b0;
			ps_axi_request_rw <= 1'b0;
			ps_axi_wstrb <= 4'b0;
			ps_axi_request_add <= 32'b0;
			ps_axi_wdata <= 32'b0;
	
            s_axi_arready_o <= 1'b0;    //for address read
	        s_axi_awready_o <= 1'b0;    //for address write
            s_axi_bresp_o <= 2'b0;      //for write response
            s_axi_bvalid_o <= 1'b0;
            s_axi_rdata_o <= 32'b0;      //for data read
            s_axi_rresp_o <= 2'b0;
            s_axi_rvalid_o <= 1'b0;
            s_axi_wready_o <= 1'b0;     //for data write			
		end else
		begin
			case ( ps_axi_fsm_reg )
				axi_fsm_idle:
				begin
                    if ( s_axi_awvalid ) begin
                        s_axi_awready_o <= 1'b1;    //for address write
                        ps_axi_request_rw <= 1'b1;                                            
                        ps_axi_request_add <= s_axi_awaddr;
                        ps_axi_fsm_reg <= axi_fsm_write_data;     
				    end else if ( s_axi_arvalid ) begin
				        s_axi_arready_o <= 1'b1;    //for address read 
                        ps_axi_request <= 1'b1;
                        ps_axi_request_rw <= 1'b0;
                        ps_axi_request_add <= s_axi_araddr;
                        ps_axi_fsm_reg <= axi_fsm_read_data;
				    end
				end
				axi_fsm_read_data:
				begin
                    s_axi_arready_o <= 1'b0;    //for address read
                    if ( s_axi_rready && ps_axi_request_done ) begin
                        s_axi_rdata_o <= ps_axi_rdata;      //for data read
                        s_axi_rvalid_o <= 1'b1;
                        ps_axi_request <= 1'b0;
                        ps_axi_request_add <= 32'b0;                        
                        ps_axi_fsm_reg <= axi_fsm_read_complete;                                                
                    end				
				end
				axi_fsm_read_complete:
				begin
                    s_axi_rdata_o <= 32'b0;      //for data read
                    s_axi_rvalid_o <= 1'b0;
                    ps_axi_fsm_reg <= axi_fsm_idle;
				end
				axi_fsm_write_data:
				begin
				    s_axi_awready_o <= 1'b0;    //for address write
				    if ( s_axi_wvalid ) begin
                        ps_axi_request <= 1'b1;
                        ps_axi_wstrb <= s_axi_wstrb;
                        ps_axi_wdata <= s_axi_wdata;
                        s_axi_wready_o <= 1'b1;     //for data write                          	                                
                        ps_axi_fsm_reg <= axi_fsm_write_complete;       
				    end 
				end
				axi_fsm_write_complete:
				begin
				    s_axi_wready_o <= 1'b0;     //for data write
				    if ( ps_axi_request_done ) begin
                        s_axi_bvalid_o <= 1'b1;				    
                        ps_axi_request <= 1'b0;
                        ps_axi_request_add <= 32'b0;                        
                        ps_axi_wstrb <= 4'b0;
                        ps_axi_wdata <= 32'b0;
                        ps_axi_fsm_reg <= axi_fsm_write_response;
				    end
				end
				axi_fsm_write_response:
				begin
				    if ( s_axi_bready ) begin
                        s_axi_bvalid_o <= 1'b0;
                        ps_axi_fsm_reg <= axi_fsm_idle;                        
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

            ps_axi_request_done <= 1'b0;
            ps_axi_rdata <= 32'b0;
			
			axi_awvalid_o <= 1'b0;
			axi_awaddr_o <= 15'b0;
			axi_wvalid_o <= 1'b0;
			axi_wdata_o <= 32'b0;
			axi_wstrb_o <= 4'b0;
			axi_arvalid_o <= 1'b0;
			axi_araddr_o <= 15'b0;
			axi_rready_o <= 1'b0;			

			axi_fsm_reg <= axi_fsm_idle;
		end else begin
			case ( axi_fsm_reg )
				axi_fsm_idle:
				begin
					ps_axi_request_done <= 1'b0;			
					if ( ps_axi_request && !ps_axi_request_done ) begin
						if ( ps_axi_request_rw ) begin
							axi_awvalid_o <= 1'b1;
							axi_awaddr_o <= ps_axi_request_add[14:0];							
							axi_wvalid_o <= 1'b1;
							axi_wdata_o <= ps_axi_wdata;
							axi_wstrb_o <= ps_axi_wstrb;
							axi_fsm_reg <= axi_fsm_write_data;
						end else begin
							axi_arvalid_o <= 1'b1;							
							axi_araddr_o <= ps_axi_request_add[14:0];
							axi_rready_o <= 1'b1;
							axi_fsm_reg <= axi_fsm_read_data;
						end
					end
				end
				axi_fsm_read_data:
				begin
					if ( axi_arready && axi_rvalid) begin
						axi_arvalid_o <= 1'b0;
						axi_araddr_o <= 15'b0;
						axi_rready_o <= 1'b0;
						ps_axi_rdata <= axi_rdata;
						ps_axi_request_done <= 1'b1;
						axi_fsm_reg <= axi_fsm_idle;												
					end else if ( axi_arready ) begin
						axi_araddr_o <= 15'b0;
						axi_arvalid_o <= 1'b0;
						axi_fsm_reg <= axi_fsm_read_complete;	
					end
				end
				axi_fsm_read_complete:
				begin
					if ( axi_rvalid ) begin
						axi_rready_o <= 1'b0;
						ps_axi_rdata <= axi_rdata;
						ps_axi_request_done <= 1'b1;
						axi_fsm_reg <= axi_fsm_idle;						
					end
				end
				axi_fsm_write_data:
				begin
					if ( axi_awready && axi_wready) begin
						axi_awvalid_o <= 1'b0;
						axi_awaddr_o <= 15'b0;
						axi_wvalid_o <= 1'b0;
						axi_wdata_o <= 32'b0;
						axi_wstrb_o <= 4'b0;
						ps_axi_request_done <= 1'b1;						
						axi_fsm_reg <= axi_fsm_idle;	
					end	else begin
						if ( axi_awready ) begin
							axi_awaddr_o <= 15'b0;
							axi_awvalid_o <= 1'b0;
							axi_fsm_reg <= axi_fsm_write_complete;								
						end
					end
				end
				axi_fsm_write_complete:
				begin
					if ( axi_wready) begin
						axi_wvalid_o <= 1'b0;
						axi_wdata_o <= 32'b0;
						axi_wstrb_o <= 4'b0;
						ps_axi_request_done <= 1'b1;					
						axi_fsm_reg <= axi_fsm_idle;	
					end
				end
			endcase
		end
	end	
	
	/////////////////////////////////
	// Always for Target Selection //
	/////////////////////////////////
	always @ ( posedge axi_clk or negedge axi_reset_n)
	begin
		if ( !axi_reset_n )
		begin
			aa_enable_o <= 1'b0;
			as_enable_o <= 1'b0;
			is_enable_o <= 1'b0;
		end else
		begin
			aa_enable_o <= ( (ps_axi_request_add[31:12] >= 20'h60000) && (ps_axi_request_add[31:12] <= 20'h60005) )? 1'b1 : 1'b0;
			as_enable_o <= ( ps_axi_request_add[31:12] == 20'h60006 )? 1'b1 : 1'b0;
			is_enable_o <= ( ps_axi_request_add[31:12] == 20'h60007 )? 1'b1 : 1'b0;
		end
	end	

AXIS_SWz #(.pADDR_WIDTH( 15 ),
           .pDATA_WIDTH( 32 )) 
	PL_AS (
		.axi_reset_n(axi_reset_n),
		.axis_clk(axis_clk),
		.axis_rst_n(axis_rst_n),
		//axi_lite slave interface
		//write addr channel
		.axi_awvalid(axi_awvalid),
		.axi_awaddr(axi_awaddr),
		.axi_awready(axi_awready0),		//o
		//write data channel
		.axi_wvalid(axi_wvalid),
		.axi_wdata(axi_wdata),
		.axi_wstrb(axi_wstrb),
		.axi_wready(axi_wready0),		//o
		//read addr channel
		.axi_arvalid(axi_arvalid),
		.axi_araddr(axi_araddr),
		.axi_arready(axi_arready0),		//o
		//read data channel
		.axi_rvalid(axi_rvalid0),		//o
		.axi_rdata(axi_rdata0),		//o
		.axi_rready(axi_rready),
		.cc_as_enable(as_enable),
        //AXI Stream inputs for User Project grant 0
        .up_as_tdata(updma_si_tdata),
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
        .up_as_tupsb(updma_si_tuser[6:2]),
`endif
        .up_as_tstrb(updma_si_tstrb),
        .up_as_tkeep(updma_si_tkeep),
        .up_as_tlast(updma_si_tlast),
        .up_as_tvalid(updma_si_tvalid),
        .up_as_tuser(updma_si_tuser[1:0]),
        .as_up_tready(updma_si_tready),    //o
        //AXI Output Stream for User Project
        .as_up_tdata(updma_so_tdata),
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
        .as_up_tupsb(updma_so_tuser[6:2]),
`endif
        .as_up_tstrb(updma_so_tstrb),
        .as_up_tkeep(updma_so_tkeep),
        .as_up_tlast(updma_so_tlast),
        .as_up_tvalid(updma_so_tvalid),
        .as_up_tuser(updma_so_tuser[1:0]),
        .up_as_tready(updma_so_tready),
		//AXI Stream inputs for Axis Axilite grant 1
		.aa_as_tdata(aa_as_tdata),
		.aa_as_tstrb(aa_as_tstrb),
		.aa_as_tkeep(aa_as_tkeep),   
		.aa_as_tlast(aa_as_tlast),       
		.aa_as_tvalid(aa_as_tvalid),
		.aa_as_tuser(aa_as_tuser),       
		.as_aa_tready(as_aa_tready),	//o
		//AXI Stream outputs for IO Serdes
		.as_is_tdata(as_is_tdata),
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
        .as_is_tupsb(as_is_tupsb),
`endif
		.as_is_tstrb(as_is_tstrb),
		.as_is_tkeep(as_is_tkeep), 
		.as_is_tlast(as_is_tlast),        
		.as_is_tid(as_is_tid), 
		.as_is_tvalid(as_is_tvalid),
		.as_is_tuser(as_is_tuser),     
		.is_as_tready(is_as_tready),	//i
		//AXI Input Stream for IO_Serdes
		.is_as_tdata(is_as_tdata),
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
        .is_as_tupsb(is_as_tupsb),
`endif
		.is_as_tstrb(is_as_tstrb),    
		.is_as_tkeep(is_as_tkeep),
		.is_as_tlast(is_as_tlast),
		.is_as_tid(is_as_tid),
		.is_as_tvalid(is_as_tvalid),
		.is_as_tuser(is_as_tuser),
		.as_is_tready(as_is_tready),	//o
		//AXI Output Stream for Axis_Axilite
		.as_aa_tdata(as_aa_tdata),
		.as_aa_tstrb(as_aa_tstrb),    
		.as_aa_tkeep(as_aa_tkeep),
		.as_aa_tlast(as_aa_tlast),    
		.as_aa_tvalid(as_aa_tvalid),
		.as_aa_tuser(as_aa_tuser), 
		.aa_as_tready(aa_as_tready),	//i
        //AXI Output Stream for AxiDMA
        .as_ad_tdata(outStream_tdata),
        .as_ad_tstrb(outStream_tstrb),    
        .as_ad_tkeep(outStream_tkeep),
        .as_ad_tlast(outStream_tlast),    
        .as_ad_tvalid(outStream_tvalid),
        .as_ad_tuser(outStream_tuser), 
        .ad_as_tready(outStream_tready)     //i  		
	);

AXIL_AXIS #(.pADDR_WIDTH( 15 ),
            .pDATA_WIDTH( 32 )) 
	PL_AA (
		//AXIL
		.s_wready(axi_wready1),	//o  
		.s_awready(axi_awready1),	//o  
		.s_arready(axi_arready1), 	//o  
		.s_rdata(axi_rdata1),		//o
		.s_rvalid(axi_rvalid1),    //o
		.s_awvalid(axi_awvalid),
		.s_awaddr(axi_awaddr),
		.s_wvalid(axi_wvalid),
		.s_wdata(axi_wdata),
		.s_wstrb(axi_wstrb),
		.s_arvalid(axi_arvalid),
		.s_araddr(axi_araddr),
		.s_rready(axi_rready),
		.cc_aa_enable(aa_enable),
		//AS->AA
		.as_aa_tdata(as_aa_tdata),
		.as_aa_tstrb(as_aa_tstrb),
		.as_aa_tkeep(as_aa_tkeep),
		.as_aa_tlast(as_aa_tlast),
		.as_aa_tvalid(as_aa_tvalid),
		.as_aa_tuser(as_aa_tuser),
		.aa_as_tready(aa_as_tready),	//o
		//AA->AS
		.aa_as_tdata(aa_as_tdata),		//o
		.aa_as_tstrb(aa_as_tstrb),		//o
		.aa_as_tkeep(aa_as_tkeep),		//o
		.aa_as_tlast(aa_as_tlast),		//o
		.aa_as_tvalid(aa_as_tvalid),	//o
		.aa_as_tuser(aa_as_tuser),		//o
		.as_aa_tready(as_aa_tready),		
		//Other
 		.mb_irq(aa_mb_irq),	//o
		.axi_clk(axi_clk),
		.axi_reset_n(axi_reset_n),
		.axis_clk(axis_clk),
		.axis_rst_n(axis_rst_n)
	);	

IO_SERDES #(.pUSER_PROJECT_SIDEBAND_WIDTH( 5 ),
             .pSERIALIO_WIDTH( 13 ),
             .pADDR_WIDTH( 15 ),
             .pDATA_WIDTH( 32 ),
             .pRxFIFO_DEPTH( 5 ),
             .pCLK_RATIO( 4 )) 
	PL_IS (
		.axi_awready(axi_awready2),	//o
		.axi_wready(axi_wready2),	//o
		.axi_arready(axi_arready2),	//o
		.axi_rdata(axi_rdata2),		//o
		.axi_rvalid(axi_rvalid2),	//o
		.axi_awvalid(axi_awvalid),
		.axi_awaddr(axi_awaddr),
		.axi_wvalid(axi_wvalid),
		.axi_wdata(axi_wdata),
		.axi_wstrb(axi_wstrb),
		.axi_arvalid(axi_arvalid),
		.axi_araddr(axi_araddr),
		.axi_rready(axi_rready),
		.cc_is_enable(is_enable),

		.is_as_tdata(is_as_tdata),		//o
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
        .is_as_tupsb(is_as_tupsb),
`endif
		.is_as_tstrb(is_as_tstrb),		//o
		.is_as_tkeep(is_as_tkeep),		//o
		.is_as_tlast(is_as_tlast),		//o
		.is_as_tid(is_as_tid),			//o
		.is_as_tvalid(is_as_tvalid),	//o
		.is_as_tuser(is_as_tuser),		//o
		.as_is_tready(as_is_tready),

		.as_is_tdata(as_is_tdata),
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
        .as_is_tupsb(as_is_tupsb),
`endif
		.as_is_tstrb(as_is_tstrb),
		.as_is_tkeep(as_is_tkeep),
		.as_is_tlast(as_is_tlast),
		.as_is_tid(as_is_tid),
		.as_is_tvalid(as_is_tvalid),
		.as_is_tuser(as_is_tuser),
		.is_as_tready(is_as_tready),	//o

		.ioclk(is_ioclk),
		.serial_rxd(is_serial_rxd),
		.serial_rclk(is_serial_rclk),
		.serial_txd(is_serial_txd),		//o
		.serial_tclk(is_serial_tclk),	//o
		.axi_clk(axi_clk),
		.axi_reset_n(axi_reset_n),
		.axis_clk(axis_clk),
		.axis_rst_n(axis_rst_n)
	);

 ladmatr LA_DMA
    (
		.ap_clk(axi_clk_m),
        .ap_rst_n(axi_reset_m_n),
        .inStreamTop_TDATA(outStream_tdata),
        .inStreamTop_TKEEP(outStream_tkeep),
        .inStreamTop_TLAST(outStream_tlast),
        .inStreamTop_TREADY(outStream_tready),
        .inStreamTop_TSTRB(outStream_tstrb),
        .inStreamTop_TUSER(outStream_tuser),
        .inStreamTop_TVALID(outStream_tvalid),
        .interrupt(ladma_interrupt),
        .m_axi_gmem0_ARADDR(ladma_mm_araddr),
        .m_axi_gmem0_ARBURST(ladma_mm_arburst),
        .m_axi_gmem0_ARCACHE(ladma_mm_arcache),
        .m_axi_gmem0_ARID(ladma_mm_arid),
        .m_axi_gmem0_ARLEN(ladma_mm_arlen),
        .m_axi_gmem0_ARLOCK(ladma_mm_arlock),
        .m_axi_gmem0_ARPROT(ladma_mm_arprot),
        .m_axi_gmem0_ARQOS(ladma_mm_arqos),
        .m_axi_gmem0_ARREADY(ladma_mm_arready),
        .m_axi_gmem0_ARREGION(ladma_mm_arregion),
        .m_axi_gmem0_ARSIZE(ladma_mm_arsize),
        .m_axi_gmem0_ARUSER(ladma_mm_aruser),
        .m_axi_gmem0_ARVALID(ladma_mm_arvalid),
        .m_axi_gmem0_AWADDR(ladma_mm_awaddr),
        .m_axi_gmem0_AWBURST(ladma_mm_awburst),
        .m_axi_gmem0_AWCACHE(ladma_mm_awcache),
        .m_axi_gmem0_AWID(ladma_mm_awid),
        .m_axi_gmem0_AWLEN(ladma_mm_awlen),
        .m_axi_gmem0_AWLOCK(ladma_mm_awlock),
        .m_axi_gmem0_AWPROT(ladma_mm_awprot),
        .m_axi_gmem0_AWQOS(ladma_mm_awqos),
        .m_axi_gmem0_AWREADY(ladma_mm_awready),
        .m_axi_gmem0_AWREGION(ladma_mm_awregion),
        .m_axi_gmem0_AWSIZE(ladma_mm_awsize),
        .m_axi_gmem0_AWUSER(ladma_mm_awuser),
        .m_axi_gmem0_AWVALID(ladma_mm_awvalid),
        .m_axi_gmem0_BID(ladma_mm_bid),
        .m_axi_gmem0_BREADY(ladma_mm_bready),
        .m_axi_gmem0_BRESP(ladma_mm_bresp),
        .m_axi_gmem0_BUSER(ladma_mm_buser),
        .m_axi_gmem0_BVALID(ladma_mm_bvalid),
        .m_axi_gmem0_RDATA(ladma_mm_rdata),
        .m_axi_gmem0_RID(ladma_mm_rid),
        .m_axi_gmem0_RLAST(ladma_mm_rlast),
        .m_axi_gmem0_RREADY(ladma_mm_rready),
        .m_axi_gmem0_RRESP(ladma_mm_rresp),
        .m_axi_gmem0_RUSER(ladma_mm_ruser),
        .m_axi_gmem0_RVALID(ladma_mm_rvalid),
        .m_axi_gmem0_WDATA(ladma_mm_wdata),
        .m_axi_gmem0_WLAST(ladma_mm_wlast),
        .m_axi_gmem0_WREADY(ladma_mm_wready),
        .m_axi_gmem0_WSTRB(ladma_mm_wstrb),
        .m_axi_gmem0_WUSER(ladma_mm_wuser),
        .m_axi_gmem0_WVALID(ladma_mm_wvalid),
        .s_axi_control_ARADDR(ladma_s_araddr[6:0]),
        .s_axi_control_ARREADY(ladma_s_arready),
        .s_axi_control_ARVALID(ladma_s_arvalid),
        .s_axi_control_AWADDR(ladma_s_awaddr[6:0]),
        .s_axi_control_AWREADY(ladma_s_awready),
        .s_axi_control_AWVALID(ladma_s_awvalid),
        .s_axi_control_BREADY(ladma_s_bready),
        .s_axi_control_BRESP(ladma_s_bresp),
        .s_axi_control_BVALID(ladma_s_bvalid),
        .s_axi_control_RDATA(ladma_s_rdata),
        .s_axi_control_RREADY(ladma_s_rready),
        .s_axi_control_RRESP(ladma_s_rresp),
        .s_axi_control_RVALID(ladma_s_rvalid),
        .s_axi_control_WDATA(ladma_s_wdata),
        .s_axi_control_WREADY(ladma_s_wready),
        .s_axi_control_WSTRB(ladma_s_wstrb),
        .s_axi_control_WVALID(ladma_s_wvalid)
	);

    
endmodule
