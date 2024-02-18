`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author : Tony Ho
//
// Create Date: 06/21/2023 02:34:48 PM
// Design Name:
// Module Name: fsic_tb_soc_to_fpga
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
// 20230720
// 1. change pADDR_WIDTH=15 and use [pADDR_WIDTH-1:0] for *_axi_awaddr and *_axi_araddr
// 20230714
// 1. add pADDR_WIDTH and pDATA_WIDTH
// 2. change [pADDR_WIDTH+1:2] *_axi_awaddr to [pADDR_WIDTH+1:2] *_axi_awaddr for DW base address
// 3. update coding error and add pSERIALIO_TDATA_WIDTH
// 4. update tpyo, change cc_is_enable to cc_is_enable
// 5. use fork join to sync soc and fpga to replace sync by test_seq
// 6. verify soc and fpga txen_ctl timing in test003
// 20230712
// 1. check cfg read result
// 20230711
// 1. update cfg read/write
// 2. replace #0 to non-block assigment in initial block.
// 20230706
// 1. update test003 : simulation the behavior of fpga axis_switch rx buffer full
// 2. using #0 to replace @negedge assign value in testbench
// 3. use localparam
// 4. use axis_rst_n & axi_reset_n
// 5. update port for serial_*
// 20230705
// 1. update test002 to verify soc provide soc_as_is_tdata, soc_as_is_tstrb, soc_as_is_tkeep, soc_as_is_tlast, soc_as_is_tid, soc_as_is_tuser, soc_as_is_tvalid, soc_as_is_tready to fpga
// 20230703
// 1. update port name
// 2. update testbench for core clock with offset
// 20230630
// 1. add task soc_delay_valid;		//input tdata and valid_delay 
// 2. add register R/W interface
// 3. add soc_cfg_read
// 20230629
// 1. data transfer from Axis siwtch to io serdes when is_as_tready=1 and as_is_tvalid=1
// 2. use posedge to update data in testbench
//	 - get data_send error 
//		  1060=> data_send	 : soc_as_is_tdata=22222222, soc_as_is_tvalid=1, soc_is_as_tready=1
// 3. use delay to workaround get data_send incorrect issue
//	1059=> data_send	 : soc_as_is_tdata=11111111, soc_as_is_tvalid=1, soc_is_as_tready=1
//	1060=>soc_as_is_tdata=22222222, soc_as_is_tvalid=1, soc_is_as_tready=1
// 4. use negedge to update data in testbench, remove item 2 & 3
// 20230628
// 1. update interface to axis switch
// 2. support flow control in as_is_tready and is_as_tready

//test001 : soc side register R/W test
//test002 : soc to fpga TX/RX test with change coreclk phase
module fsic_tb_soc_to_fpga #(
		parameter pSERIALIO_WIDTH   = 12,
		parameter pADDR_WIDTH   = 15,
		parameter pDATA_WIDTH   = 32,
		parameter IOCLK_Period	= 10,
		parameter DLYCLK_Period	= 1,
		parameter SHIFT_DEPTH = 10,
		parameter pRxFIFO_DEPTH = 5,
		parameter pCLK_RATIO = 4
	)
	(

	);

		localparam TEST002_CNT	= 4;
		localparam TEST003_CNT	= 4;
		localparam TEST004_CNT	= 4;
		localparam TEST005_CNT	= 4;
		localparam BUF_SIZE = 16;

	reg [31:0] UP_data_send_cnt;		//upstream (SOC to FPGA) data_send_cnt
	reg [31:0] UP_data_send_buf[BUF_SIZE-1:0];
	reg [3:0] UP_tstrb_send_buf[BUF_SIZE-1:0];
	reg [3:0] UP_tkeep_send_buf[BUF_SIZE-1:0];
	reg UP_tlast_send_buf[BUF_SIZE-1:0];
	reg [1:0] UP_tid_send_buf[BUF_SIZE-1:0];
	reg [1:0] UP_tuser_send_buf[BUF_SIZE-1:0];

	reg [31:0] UP_data_received_cnt;
	reg [31:0] UP_data_received_buf[BUF_SIZE-1:0];
	reg [3:0] UP_tstrb_received_buf[BUF_SIZE-1:0];
	reg [3:0] UP_tkeep_received_buf[BUF_SIZE-1:0];
	reg UP_tlast_received_buf[BUF_SIZE-1:0];
	reg [1:0] UP_tid_received_buf[BUF_SIZE-1:0];
	reg [1:0] UP_tuser_received_buf[BUF_SIZE-1:0];

	reg [31:0] DN_data_send_cnt;		//DownStream (FPGA to SOC) data_send_cnt
	reg [31:0] DN_data_send_buf[BUF_SIZE-1:0];
	reg [3:0] DN_tstrb_send_buf[BUF_SIZE-1:0];
	reg [3:0] DN_tkeep_send_buf[BUF_SIZE-1:0];
	reg DN_tlast_send_buf[BUF_SIZE-1:0];
	reg [1:0] DN_tid_send_buf[BUF_SIZE-1:0];
	reg [1:0] DN_tuser_send_buf[BUF_SIZE-1:0];

	reg [31:0] DN_data_received_cnt;
	reg [31:0] DN_data_received_buf[BUF_SIZE-1:0];
	reg [3:0] DN_tstrb_received_buf[BUF_SIZE-1:0];
	reg [3:0] DN_tkeep_received_buf[BUF_SIZE-1:0];
	reg DN_tlast_received_buf[BUF_SIZE-1:0];
	reg [1:0] DN_tid_received_buf[BUF_SIZE-1:0];
	reg [1:0] DN_tuser_received_buf[BUF_SIZE-1:0];

	reg [31:0] error_cnt;


	

	real ioclk_pd = IOCLK_Period;
	real coreclk_pd = IOCLK_Period*4;
	real dlyclk_pd = DLYCLK_Period;

	reg soc_rst;
	reg fpga_rst;
	reg soc_resetb;
	reg fpga_resetb;
	
	reg rst;
	reg ioclk;
	reg dlyclk;
	reg [7:0] dly_time;
	
	wire soc_ioclk;
	wire fpga_ioclk;
	
	wire soc_txclk_src;
	wire soc_txclk_dly;
	wire soc_txclk;
	wire fpga_txclk_src;
	wire fpga_txclk_dly;
	wire fpga_txclk;

	reg [7:0] soc_cfg_expect_data;
	
	//write addr channel
	reg soc_axi_awvalid;
	reg [pADDR_WIDTH-1:0] soc_axi_awaddr;
	wire soc_axi_awready;
	
	//write data channel
	reg 	soc_axi_wvalid;
	reg 	[pDATA_WIDTH-1:0] soc_axi_wdata;
	reg 	[3:0] soc_axi_wstrb;
	wire	soc_axi_wready;
	
	//read addr channel
	reg 	soc_axi_arvalid;
	reg 	[pADDR_WIDTH-1:0] soc_axi_araddr;
	wire 	soc_axi_arready;
	
	//read data channel
	wire 	soc_axi_rvalid;
	wire 	[pDATA_WIDTH-1:0] soc_axi_rdata;
	reg 	soc_axi_rready;
	
	reg 	soc_cc_is_enable;		//axi_lite enable


	//write addr channel
	reg fpga_axi_awvalid;
	reg [pADDR_WIDTH-1:0] fpga_axi_awaddr;
	wire fpga_axi_awready;
	
	//write data channel
	reg 	fpga_axi_wvalid;
	reg 	[pDATA_WIDTH-1:0] fpga_axi_wdata;
	reg 	[3:0] fpga_axi_wstrb;
	wire	fpga_axi_wready;
	
	//read addr channel
	reg 	fpga_axi_arvalid;
	reg 	[pADDR_WIDTH-1:0] fpga_axi_araddr;
	wire 	fpga_axi_arready;
	
	//read data channel
	wire 	fpga_axi_rvalid;
	wire 	[pDATA_WIDTH-1:0] fpga_axi_rdata;
	reg 	fpga_axi_rready;
	
	reg 	fpga_cc_is_enable;		//axi_lite enable


	reg [pDATA_WIDTH-1:0] soc_as_is_tdata;
	reg [3:0] soc_as_is_tstrb;
	reg [3:0] soc_as_is_tkeep;
	reg soc_as_is_tlast;
	reg [1:0] soc_as_is_tid;
	reg soc_as_is_tvalid;
	reg [1:0] soc_as_is_tuser;
	reg soc_as_is_tready;		//when local side axis switch Rxfifo size <= threshold then as_is_tready=0; this flow control mechanism is for notify remote side do not provide data with is_as_tvalid=1

	wire [pSERIALIO_WIDTH-1:0] soc_serial_txd;
//	wire [7:0] soc_Serial_Data_Out_tdata;
//	wire soc_Serial_Data_Out_tstrb;
//	wire soc_Serial_Data_Out_tkeep;
//	wire soc_Serial_Data_Out_tid_tuser;	// tid and tuser	
//	wire soc_Serial_Data_Out_tlast_tvalid_tready;		//flowcontrol

	wire [pDATA_WIDTH-1:0] soc_is_as_tdata;
	wire [3:0] soc_is_as_tstrb;
	wire [3:0] soc_is_as_tkeep;
	wire soc_is_as_tlast;
	wire [1:0] soc_is_as_tid;
	wire soc_is_as_tvalid;
	wire [1:0] soc_is_as_tuser;
	wire soc_is_as_tready;		//when remote side axis switch Rxfifo size <= threshold then is_as_tready=0; this flow control mechanism is for notify local side do not provide data with as_is_tvalid=1

	reg [pDATA_WIDTH-1:0] fpga_as_is_tdata;
	reg [3:0] fpga_as_is_tstrb;
	reg [3:0] fpga_as_is_tkeep;
	reg fpga_as_is_tlast;
	reg [1:0] fpga_as_is_tid;
	reg fpga_as_is_tvalid;
	reg [1:0] fpga_as_is_tuser;
	reg fpga_as_is_tready;		//when local side axis switch Rxfifo size <= threshold then as_is_tready=0; this flow control mechanism is for notify remote side do not provide data with is_as_tvalid=1

	wire [pSERIALIO_WIDTH-1:0] fpga_serial_txd;
//	wire [7:0] fpga_Serial_Data_Out_tdata;
//	wire fpga_Serial_Data_Out_tstrb;
//	wire fpga_Serial_Data_Out_tkeep;
//	wire fpga_Serial_Data_Out_tid_tuser;	// tid and tuser	
//	wire fpga_Serial_Data_Out_tlast_tvalid_tready;		//flowcontrol

	wire [pDATA_WIDTH-1:0] fpga_is_as_tdata;
	wire [3:0] fpga_is_as_tstrb;
	wire [3:0] fpga_is_as_tkeep;
	wire fpga_is_as_tlast;
	wire [1:0] fpga_is_as_tid;
	wire fpga_is_as_tvalid;
	wire [1:0] fpga_is_as_tuser;
	wire fpga_is_as_tready;		//when remote side axis switch Rxfifo size <= threshold then is_as_tready=0, this flow control mechanism is for notify local side do not provide data with as_is_tvalid=1


	//wire [7:0] Serial_Data_Out_ad_delay1;
	//wire txclk_delay1;

	//wire [7:0] Serial_Data_Out_ad_delay;
	//wire txclk_delay;

	//assign #4 Serial_Data_Out_ad_delay1 = Serial_Data_Out_ad;
	//assign #4 txclk_delay1 = txclk;
	//assign #4 Serial_Data_Out_ad_delay = Serial_Data_Out_ad_delay1;
	//assign #4 txclk_delay = txclk_delay1;

	wire soc_coreclk_source;
	wire soc_coreclk;
	wire soc_coreclk_dly1ns;
	wire soc_ioclk_dly1ns;
	reg soc_coreclk_dly_en;
	reg soc_ioclk_dly_en;
	
	reg soc_txclk_dly_en;
	reg fpga_txclk_dly_en;
	
	assign fpga_ioclk = ioclk;
	
	//change skew in soc_ioclk and soc_coreclk
	assign #1 soc_ioclk_dly1ns = ioclk;
	
	assign #1 soc_coreclk_dly1ns = soc_coreclk_source;
	
	assign soc_coreclk = (soc_coreclk_dly_en) ? soc_coreclk_dly1ns : soc_coreclk_source;
	assign soc_ioclk = (soc_ioclk_dly_en) ? soc_ioclk_dly1ns : ioclk;
	
	assign soc_txclk = (soc_txclk_dly_en) ? soc_txclk_dly : soc_txclk_src;
	assign fpga_txclk = (fpga_txclk_dly_en) ? fpga_txclk_dly : fpga_txclk_src;
	
	fsic_clock_div soc_clock_div (
	.resetb(soc_resetb),
	.in(ioclk),
	.out(soc_coreclk_source)
	);

	fsic_clock_div fpga_clock_div (
	.resetb(fpga_resetb),
	.in(ioclk),
	.out(fpga_coreclk)
	);


	IO_SERDES  #(
		.pSERIALIO_WIDTH(pSERIALIO_WIDTH),
		.pADDR_WIDTH(pADDR_WIDTH),
		.pDATA_WIDTH(pDATA_WIDTH),
		.pRxFIFO_DEPTH(pRxFIFO_DEPTH),
		.pCLK_RATIO(pCLK_RATIO)
	)
	soc_fsic_io_serdes(
		.axis_rst_n(~soc_rst),
		.axi_reset_n(~soc_rst),
		.serial_tclk(soc_txclk_src),
		.serial_rclk(fpga_txclk),
		.ioclk(soc_ioclk),
		.axis_clk(soc_coreclk),
		.axi_clk(soc_coreclk),
		
		//write addr channel
		.axi_awvalid(soc_axi_awvalid),
		.axi_awaddr(soc_axi_awaddr),
		.axi_awready(soc_axi_awready),

		//write data channel
		.axi_wvalid(soc_axi_wvalid),
		.axi_wdata(soc_axi_wdata),
		.axi_wstrb(soc_axi_wstrb),
		.axi_wready(soc_axi_wready),

		//read addr channel
		.axi_arvalid(soc_axi_arvalid),
		.axi_araddr(soc_axi_araddr),
		.axi_arready(soc_axi_arready),
		
		//read data channel
		.axi_rvalid(soc_axi_rvalid),
		.axi_rdata(soc_axi_rdata),
		.axi_rready(soc_axi_rready),
		
		.cc_is_enable(soc_cc_is_enable),
		
		.as_is_tdata(soc_as_is_tdata),
		.as_is_tstrb(soc_as_is_tstrb),
		.as_is_tkeep(soc_as_is_tkeep),
		.as_is_tlast(soc_as_is_tlast),
		.as_is_tid(soc_as_is_tid),
		.as_is_tvalid(soc_as_is_tvalid),
		.as_is_tuser(soc_as_is_tuser),
		.as_is_tready(soc_as_is_tready),
		.serial_txd(soc_serial_txd),
		.serial_rxd(fpga_serial_txd),
		.is_as_tdata(soc_is_as_tdata),
		.is_as_tstrb(soc_is_as_tstrb),
		.is_as_tkeep(soc_is_as_tkeep),
		.is_as_tlast(soc_is_as_tlast),
		.is_as_tid(soc_is_as_tid),
		.is_as_tvalid(soc_is_as_tvalid),
		.is_as_tuser(soc_is_as_tuser),
		.is_as_tready(soc_is_as_tready)
	);

	IO_SERDES  #(
		.pSERIALIO_WIDTH(pSERIALIO_WIDTH),
		.pADDR_WIDTH(pADDR_WIDTH),
		.pDATA_WIDTH(pDATA_WIDTH),
		.pRxFIFO_DEPTH(pRxFIFO_DEPTH),
		.pCLK_RATIO(pCLK_RATIO)
	)
	fpga_fsic_io_serdes(
		.axis_rst_n(~fpga_rst),
		.axi_reset_n(~fpga_rst),
		.serial_tclk(fpga_txclk_src),
		.serial_rclk(soc_txclk),
		.ioclk(fpga_ioclk),
		.axis_clk(fpga_coreclk),
		.axi_clk(fpga_coreclk),
		
		//write addr channel
		.axi_awvalid(fpga_axi_awvalid),
		.axi_awaddr(fpga_axi_awaddr),
		.axi_awready(fpga_axi_awready),

		//write data channel
		.axi_wvalid(fpga_axi_wvalid),
		.axi_wdata(fpga_axi_wdata),
		.axi_wstrb(fpga_axi_wstrb),
		.axi_wready(fpga_axi_wready),

		//read addr channel
		.axi_arvalid(fpga_axi_arvalid),
		.axi_araddr(fpga_axi_araddr),
		.axi_arready(fpga_axi_arready),
		
		//read data channel
		.axi_rvalid(fpga_axi_rvalid),
		.axi_rdata(fpga_axi_rdata),
		.axi_rready(fpga_axi_rready),
		
		.cc_is_enable(fpga_cc_is_enable),


		.as_is_tdata(fpga_as_is_tdata),
		.as_is_tstrb(fpga_as_is_tstrb),
		.as_is_tkeep(fpga_as_is_tkeep),
		.as_is_tlast(fpga_as_is_tlast),
		.as_is_tid(fpga_as_is_tid),
		.as_is_tvalid(fpga_as_is_tvalid),
		.as_is_tuser(fpga_as_is_tuser),
		.as_is_tready(fpga_as_is_tready),
		.serial_txd(fpga_serial_txd),
		.serial_rxd(soc_serial_txd),
		.is_as_tdata(fpga_is_as_tdata),
		.is_as_tstrb(fpga_is_as_tstrb),
		.is_as_tkeep(fpga_is_as_tkeep),
		.is_as_tlast(fpga_is_as_tlast),
		.is_as_tid(fpga_is_as_tid),
		.is_as_tvalid(fpga_is_as_tvalid),
		.is_as_tuser(fpga_is_as_tuser),
		.is_as_tready(fpga_is_as_tready)
	);

	dly_line	#(
		.SHIFT_DEPTH(SHIFT_DEPTH)
	)	
	dly_line_fpga_txclk (
		.dlyclk(dlyclk),
		.dly_in(fpga_txclk_src),
		.rst(rst),
		.dly_time(dly_time),
		.dly_out(fpga_txclk_dly)
	);

	dly_line	#(
		.SHIFT_DEPTH(SHIFT_DEPTH)
	)	
	dly_line_soc_txclk (
		.dlyclk(dlyclk),
		.dly_in(soc_txclk_src),
		.rst(rst),
		.dly_time(dly_time),
		.dly_out(soc_txclk_dly)
	);


	
	// init and reset
	initial begin
		error_cnt = 0;
		ioclk = 1;
		dlyclk = 1;
		rst = 1;
		dly_time=0;

		soc_coreclk_dly_en = 0;
		soc_ioclk_dly_en = 0;

		soc_txclk_dly_en = 1;
		fpga_txclk_dly_en = 1;
		
		//write addr channel
		soc_axi_awvalid=0;
		soc_axi_awaddr=0;
		
		//write data channel
		soc_axi_wvalid=0;
		soc_axi_wdata=0;
		soc_axi_wstrb=0;
		
		//read addr channel
		soc_axi_arvalid=0;
		soc_axi_araddr=0;
		
		//read data channel
		soc_axi_rready=0;
		
		soc_cc_is_enable=0;


		soc_as_is_tdata=0;
		soc_as_is_tstrb=0;
		soc_as_is_tkeep=0;
		soc_as_is_tlast=0;
		soc_as_is_tid=0;
		soc_as_is_tvalid=0;
		soc_as_is_tuser=0;
		soc_as_is_tready=0;

		//write addr channel
		fpga_axi_awvalid=0;
		fpga_axi_awaddr=0;

		
		//write data channel
		fpga_axi_wvalid=0;
		fpga_axi_wdata=0;
		fpga_axi_wstrb=0;
		
		//read addr channel
		fpga_axi_arvalid=0;
		fpga_axi_araddr=0;
		
		//read data channel
		fpga_axi_rready=0;
		
		fpga_cc_is_enable=0;

		fpga_as_is_tdata=0;
		fpga_as_is_tstrb=0;
		fpga_as_is_tkeep=0;
		fpga_as_is_tlast=0;
		fpga_as_is_tid=0;
		fpga_as_is_tvalid=0;
		fpga_as_is_tuser=0;
		fpga_as_is_tready=0;

		#10;
		rst = 0;
		
		test001();	//soc side register test
		//test002();	//TX/RX test - loop with change coreclk phase in soc - soc provide data and valid=1 to fpga
		//test003();	//TX/RX test with tready toggle - loop with change coreclk phase in soc  - soc provide data and valid=1 to fpga
		//test004();  //TX/RX test - loop with change coreclk phase in soc - fpga provide data and valid=1 to soc
		test_dlytime();	// dly_time test

		#40;
		$display("=============================================================================================");
		$display("=============================================================================================");
		$display("=============================================================================================");
		if (error_cnt != 0 ) 
			$display($time, "=> Final result [FAILED], error_cnt = %x, please search [ERROR] in the log", error_cnt);
		else
			$display($time, "=> Final result [PASS], error_cnt = %x", error_cnt);
		$display("=============================================================================================");
		$display("=============================================================================================");
		$display("=============================================================================================");

		
		$finish;
		
	end

	task test001;
		//input [7:0] compare_data;

		begin
			$display("test001 : soc side register test");
			soc_apply_reset(40,40);

			#20;
			soc_cc_is_enable=1;

			//burst write test
			soc_cfg_write(0, 0, 4'b0001, 0);		//write offset 0 = 0
			soc_cfg_write(0, 1, 4'b0001, 0);		//write offset 0 = 1
			soc_cfg_write(0, 2, 4'b0001, 0);		//write offset 0 = 2
			soc_cfg_write(0, 3, 4'b0001, 0);		//write offset 0 = 3

			//burst read test
			soc_cfg_expect_data = 3;		//read offset 0 result should be 3, other offset is reserved and result equal to offset 0
			soc_cfg_write(0, soc_cfg_expect_data, 4'b0001, 0);		//write offset 0 = 3
			soc_cfg_read(0,0);			//read offset 0
			soc_cfg_read(4,0);			//read offset 4
			soc_cfg_read(8,0);			//read offset 8
			soc_cfg_read(12,0);			//read offset 12


			//burst write/read test
			soc_cfg_expect_data = 0;		//read offset 0 result should be 0
			soc_cfg_write(0, soc_cfg_expect_data, 4'b0001, 0);		
			soc_cfg_read(0,0);
			
			soc_cfg_expect_data = 1;		//read offset 0 result should be 1
			soc_cfg_write(0, soc_cfg_expect_data, 4'b0001, 0);		
			soc_cfg_read(0,0);
			
			soc_cfg_expect_data = 2;		//read offset 0 result should be 2
			soc_cfg_write(0, soc_cfg_expect_data, 4'b0001, 0);		
			soc_cfg_read(0,0);

			soc_cfg_expect_data = 3;		//read offset 0 result should be 3
			soc_cfg_write(0, soc_cfg_expect_data, 4'b0001, 0);		
			soc_cfg_read(0,0);
			
			//write to offset 1, the data in offset 0 should no changed.
			soc_cfg_expect_data = 3;	// data should be 3 in offset 0
			soc_cfg_write(0,soc_cfg_expect_data,1,0);	// write to offset 0, data = 3
			soc_cfg_write(0, 0, 4'b0010, 0);	// write to offset 1 (strobe = 4'b0010) , data = 0
			soc_cfg_read(0,0);		//read offset 0

	`ifdef NotSupport_Test
			//no support below test in IO_SERDES module
			//IO_SERDES output axi_awready_out = 1 and axi_wready_out = 1 when both axi_awvalid_in=1 and axi_wvalid_in=1
			//it will cause dead lock if testbench set axi_awvalid=1 and wait for axi_awready
			soc_cfg_write_addr(0,0);
			soc_cfg_write_data(0,1,0);
			soc_cfg_write_addr(0,0);
			soc_cfg_write_data(1,1,0);
			soc_cfg_write_addr(0,0);
			soc_cfg_write_data(2,1,0);
			soc_cfg_write_addr(0,0);
			soc_cfg_write_data(3,1,0);
	`endif //NotSupport_Test
	
			#20;

		end

	endtask


	reg[31:0] k;
	reg[31:0] j;
	reg[31:0] i;
	reg[31:0]idx1;

	task test_dlytime;
		//input [7:0] compare_data;

		begin
			soc_txclk_dly_en = 1;
			fpga_txclk_dly_en = 1;
			for (k=0;k<4;k=k+1) begin
				dly_time = k;
				$display("test_dlytime: dly_time = %x", dly_time);
				test002();
				test003();
				test004();
			end
			soc_txclk_dly_en = 0;
			fpga_txclk_dly_en = 0;
			
			#1000;
		end
	endtask

	
	task test002;
		//input [7:0] compare_data;

		begin
			for (j=0;j<3;j=j+1) begin
				soc_coreclk_dly_en = j[0];
				soc_ioclk_dly_en = j[1];
				$display("test002: UpStream test,  soc_coreclk_dly_en = %b, soc_ioclk_dly_en=%b", soc_coreclk_dly_en, soc_ioclk_dly_en);
				
				for (i=0;i<TEST002_CNT;i=i+1) begin
					$display("test002: UpStream test - loop %02d, change coreclk phase in soc", i);
					fork 
						soc_apply_reset(40+i*10, 40);			//change coreclk phase in soc
						fpga_apply_reset(40,40);		//fix coreclk phase in fpga
					join
					#40;
					soc_cc_is_enable=1;
					fpga_cc_is_enable=1;
					fork 
						soc_cfg_write(0,1,1,0);
						fpga_cfg_write(0,1,1,0);
					join
					$display($time, "=> soc rxen_ctl=1");
					$display($time, "=> fpga rxen_ctl=1");
	
					#400;
					fork 
						soc_cfg_write(0,3,1,0);
						fpga_cfg_write(0,3,1,0);
					join
					$display($time, "=> soc txen_ctl=1");
					$display($time, "=> fpga txen_ctl=1");
	
					#200;
					soc_as_is_tdata = 32'h5a5a5a5a;
					#40;
	
					//init counter
					UP_data_send_cnt = 0;
					UP_data_received_cnt = 0;
					
					fork
						UpStream_test_soc();
						UpStream_test_fpga();
					join
					
					#40; //add delay to make sure UP_data_send_buf and UP_data_received_buf is ready for compare.
					
					//check result
					for(idx1=0; idx1<BUF_SIZE; idx1=idx1+1)begin
						if (UP_data_send_buf[idx1] !== UP_data_received_buf[idx1]) begin
							$display($time, "=> test002 data compare [ERROR], UP_data_send_buf[%x] = %x, UP_data_received_buf[%x] = %x", idx1, UP_data_send_buf[idx1], idx1, UP_data_received_buf[idx1]);
							error_cnt = error_cnt + 1;
						end	
						else 
							$display($time, "=> test002 data compare [PASS], UP_data_send_buf[%x] = %x, UP_data_received_buf[%x] = %x", idx1, UP_data_send_buf[idx1], idx1, UP_data_received_buf[idx1]);
	
						if (UP_tstrb_send_buf[idx1] !== UP_tstrb_received_buf[idx1]) begin
							$display($time, "=> test002 data compare [ERROR], UP_tstrb_send_buf[%x] = %x, UP_tstrb_received_buf[%x] = %x", idx1, UP_tstrb_send_buf[idx1], idx1, UP_tstrb_received_buf[idx1]);
							error_cnt = error_cnt + 1;
						end	
						else 
							$display($time, "=> test002 data compare [PASS], UP_tstrb_send_buf[%x] = %x, UP_tstrb_received_buf[%x] = %x", idx1, UP_tstrb_send_buf[idx1], idx1, UP_tstrb_received_buf[idx1]);
	
	
						if (UP_tkeep_send_buf[idx1] !== UP_tkeep_received_buf[idx1]) begin
							$display($time, "=> test002 data compare [ERROR], UP_tkeep_send_buf[%x] = %x, UP_tkeep_received_buf[%x] = %x", idx1, UP_tkeep_send_buf[idx1], idx1, UP_tkeep_received_buf[idx1]);
							error_cnt = error_cnt + 1;
						end	
						else 
							$display($time, "=> test002 data compare [PASS], UP_tkeep_send_buf[%x] = %x, UP_tkeep_received_buf[%x] = %x", idx1, UP_tkeep_send_buf[idx1], idx1, UP_tkeep_received_buf[idx1]);
	
						if (UP_tlast_send_buf[idx1] !== UP_tlast_received_buf[idx1]) begin
							$display($time, "=> test002 data compare [ERROR], UP_tlast_send_buf[%x] = %x, UP_tlast_received_buf[%x] = %x", idx1, UP_tlast_send_buf[idx1], idx1, UP_tlast_received_buf[idx1]);
							error_cnt = error_cnt + 1;
						end	
						else 
							$display($time, "=> test002 data compare [PASS], UP_tlast_send_buf[%x] = %x, UP_tlast_received_buf[%x] = %x", idx1, UP_tlast_send_buf[idx1], idx1, UP_tlast_received_buf[idx1]);
	
	
						if (UP_tid_send_buf[idx1] !== UP_tid_received_buf[idx1]) begin
							$display($time, "=> test002 data compare [ERROR], UP_tid_send_buf[%x] = %x, UP_tid_received_buf[%x] = %x", idx1, UP_tid_send_buf[idx1], idx1, UP_tid_received_buf[idx1]);
							error_cnt = error_cnt + 1;
						end	
						else 
							$display($time, "=> test002 data compare [PASS], UP_tid_send_buf[%x] = %x, UP_tid_received_buf[%x] = %x", idx1, UP_tid_send_buf[idx1], idx1, UP_tid_received_buf[idx1]);
	
	
						if (UP_tuser_send_buf[idx1] !== UP_tuser_received_buf[idx1]) begin
							$display($time, "=> test002 data compare [ERROR], UP_tuser_send_buf[%x] = %x, UP_tuser_received_buf[%x] = %x", idx1, UP_tuser_send_buf[idx1], idx1, UP_tuser_received_buf[idx1]);
							error_cnt = error_cnt + 1;
						end	
						else 
							$display($time, "=> test002 data compare [PASS], UP_tuser_send_buf[%x] = %x, UP_tuser_received_buf[%x] = %x", idx1, UP_tuser_send_buf[idx1], idx1, UP_tuser_received_buf[idx1]);
	
					end
					
					#200;
				end
			end
			soc_coreclk_dly_en = 0;
			soc_ioclk_dly_en = 0;
			#1000;
		end
	endtask


	task UpStream_test_soc;
		//input [7:0] compare_data;

		begin
			@ (posedge soc_coreclk);
			
			for(idx1=0; idx1<BUF_SIZE; idx1=idx1+1)begin
				soc_as_is_tdata <=  idx1 * 32'h11111111;
				soc_as_is_tstrb <=  idx1 * 4'h1;
				soc_as_is_tkeep <=  idx1 * 4'h1;
				soc_as_is_tid <=  idx1 * 2'h1;
				soc_as_is_tuser <=  idx1 * 2'h1;
				soc_as_is_tlast <=  idx1 * 1'h1;
				soc_as_is_tvalid <= 1;

				@ (posedge soc_coreclk);
				while (soc_is_as_tready == 0) begin		// wait util soc_is_as_tready == 1 then change data
						@ (posedge soc_coreclk);
				end
			end
			soc_as_is_tvalid <= 0;

			$display($time, "=> UpStream_test_soc done");
		end
	endtask

	reg[31:0]idx2;

	task UpStream_test_fpga;
		//input [7:0] compare_data;

		begin
			fpga_as_is_tready = 1;
			@ (posedge fpga_coreclk);
			//for Axis Switch Rx
			for(idx2=0; idx2<BUF_SIZE; idx2=idx2+1)begin
				@ (posedge fpga_coreclk);
				while ( fpga_is_as_tvalid == 0) begin
					@ (posedge fpga_coreclk);
				end
				$display($time, "=> fpga idx2=%x", idx2);
			end
		$display($time, "=> UpStream_test_fpga done");
		end
	endtask


	// test003 : simulation the behavior of fpga axis_switch rx buffer full
	// Step 1. soc provide data and valid=1 to fpga
	// Step 2. fpga default send tready=1 to soc
	// step 3. fpga set tready=0 (to simulation the behavior of fpga axis_switch rx buffer full)
	// step 4. soc provide valid=0 to fpga
	// step 5. fpga set tready=1
	// step 6. soc provide data and valid=1 to fpga
	
	reg[31:0] m;
	task test003;
		//input [7:0] compare_data;

		begin
			for (j=0;j<3;j=j+1) begin
				soc_coreclk_dly_en = j[0];
				soc_ioclk_dly_en = j[1];
				$display("test003 : UpStream test with tready toggle,  soc_coreclk_dly_en = %b, soc_ioclk_dly_en=%b", soc_coreclk_dly_en, soc_ioclk_dly_en);

				for (m=0;m<TEST003_CNT;m=m+1) begin
	
					$display("test003 : UpStream test with tready toggle - loop %02d", m);
					fork 
						//change txen timing in soc
						test003_soc_init();
						test003_fpga_init();
					join 	
	
					fork 
						test003_soc();
						test003_fpga();
					join 	
	
					#40; //add delay to make sure UP_data_send_buf and UP_data_received_buf is ready for compare.
					
					//check result
					//check result
					for(idx1=0; idx1<BUF_SIZE; idx1=idx1+1)begin
						if (UP_data_send_buf[idx1] !== UP_data_received_buf[idx1]) begin
							$display($time, "=> test003 data compare [ERROR], UP_data_send_buf[%x] = %x, UP_data_received_buf[%x] = %x", idx1, UP_data_send_buf[idx1], idx1, UP_data_received_buf[idx1]);
							error_cnt = error_cnt + 1;
						end	
						else 
							$display($time, "=> test003 data compare [PASS], UP_data_send_buf[%x] = %x, UP_data_received_buf[%x] = %x", idx1, UP_data_send_buf[idx1], idx1, UP_data_received_buf[idx1]);
	
						if (UP_tstrb_send_buf[idx1] !== UP_tstrb_received_buf[idx1]) begin
							$display($time, "=> test003 data compare [ERROR], UP_tstrb_send_buf[%x] = %x, UP_tstrb_received_buf[%x] = %x", idx1, UP_tstrb_send_buf[idx1], idx1, UP_tstrb_received_buf[idx1]);
							error_cnt = error_cnt + 1;
						end	
						else 
							$display($time, "=> test003 data compare [PASS], UP_tstrb_send_buf[%x] = %x, UP_tstrb_received_buf[%x] = %x", idx1, UP_tstrb_send_buf[idx1], idx1, UP_tstrb_received_buf[idx1]);
	
	
						if (UP_tkeep_send_buf[idx1] !== UP_tkeep_received_buf[idx1]) begin
							$display($time, "=> test003 data compare [ERROR], UP_tkeep_send_buf[%x] = %x, UP_tkeep_received_buf[%x] = %x", idx1, UP_tkeep_send_buf[idx1], idx1, UP_tkeep_received_buf[idx1]);
							error_cnt = error_cnt + 1;
						end	
						else 
							$display($time, "=> test003 data compare [PASS], UP_tkeep_send_buf[%x] = %x, UP_tkeep_received_buf[%x] = %x", idx1, UP_tkeep_send_buf[idx1], idx1, UP_tkeep_received_buf[idx1]);
	
						if (UP_tlast_send_buf[idx1] !== UP_tlast_received_buf[idx1]) begin
							$display($time, "=> test003 data compare [ERROR], UP_tlast_send_buf[%x] = %x, UP_tlast_received_buf[%x] = %x", idx1, UP_tlast_send_buf[idx1], idx1, UP_tlast_received_buf[idx1]);
							error_cnt = error_cnt + 1;
						end	
						else 
							$display($time, "=> test003 data compare [PASS], UP_tlast_send_buf[%x] = %x, UP_tlast_received_buf[%x] = %x", idx1, UP_tlast_send_buf[idx1], idx1, UP_tlast_received_buf[idx1]);
	
	
						if (UP_tid_send_buf[idx1] !== UP_tid_received_buf[idx1]) begin
							$display($time, "=> test003 data compare [ERROR], UP_tid_send_buf[%x] = %x, UP_tid_received_buf[%x] = %x", idx1, UP_tid_send_buf[idx1], idx1, UP_tid_received_buf[idx1]);
							error_cnt = error_cnt + 1;
						end	
						else 
							$display($time, "=> test003 data compare [PASS], UP_tid_send_buf[%x] = %x, UP_tid_received_buf[%x] = %x", idx1, UP_tid_send_buf[idx1], idx1, UP_tid_received_buf[idx1]);
	
	
						if (UP_tuser_send_buf[idx1] !== UP_tuser_received_buf[idx1]) begin
							$display($time, "=> test003 data compare [ERROR], UP_tuser_send_buf[%x] = %x, UP_tuser_received_buf[%x] = %x", idx1, UP_tuser_send_buf[idx1], idx1, UP_tuser_received_buf[idx1]);
							error_cnt = error_cnt + 1;
						end	
						else 
							$display($time, "=> test003 data compare [PASS], UP_tuser_send_buf[%x] = %x, UP_tuser_received_buf[%x] = %x", idx1, UP_tuser_send_buf[idx1], idx1, UP_tuser_received_buf[idx1]);
	
					end
	
				end
			end
			soc_coreclk_dly_en = 0;
			soc_ioclk_dly_en = 0;
			#1000;
		end
	endtask

	task test003_soc_init;
		//input [7:0] compare_data;

		begin
			soc_apply_reset(40+m*10, 40);			//change coreclk phase in soc

			#40;
			soc_cc_is_enable=1;
			soc_cfg_write(0,1,1,0);
			$display($time, "=> soc rxen_ctl=1");
			#100;
			repeat (m) #100;
			soc_cfg_write(0,3,1,0);					//txen timing in #100/#200/#300/#400 after rxen
			$display($time, "=> soc txen_ctl=1");
			#200;
			soc_as_is_tdata = 32'h5a5a5a5a;
		end
	endtask

	reg [7:0] as_fifo_cnt;
	task test003_fpga_init;
		//input [7:0] compare_data;

		begin
			fpga_apply_reset(40,40);		//fix coreclk phase in fpga

			as_fifo_cnt = 0;

			#40;
			fpga_cc_is_enable=1;
			fpga_cfg_write(0,1,1,0);
			$display($time, "=> fpga rxen_ctl=1");
			#200;
			fpga_cfg_write(0,3,1,0);			//txen timing fixed in #200 after rxen
			$display($time, "=> fpga txen_ctl=1");
			#200;

			fpga_as_is_tdata = 32'h5a5a5a5a;
			fpga_as_is_tready = 1;
		end
	endtask

	reg[31:0]idx3;
	task test003_soc;
		//input [7:0] compare_data;

		begin
			@ (posedge soc_coreclk);
			// wait util soc_is_as_tready == 1 then change data
			for(idx3=0; idx3<BUF_SIZE; idx3=idx3+1)begin
				soc_as_is_tdata <=  idx3 * 32'h11111111;
				soc_as_is_tstrb <=  idx3 * 4'h1;
				soc_as_is_tkeep <=  idx3 * 4'h1;
				soc_as_is_tid <=  idx3 * 2'h1;
				soc_as_is_tuser <=  idx3 * 2'h1;
				soc_as_is_tlast <=  idx3 * 1'h1;
				soc_as_is_tvalid <= 1;

				@ (posedge soc_coreclk);
				while (soc_is_as_tready == 0) begin
						@ (posedge soc_coreclk);
				end
			end
			soc_as_is_tvalid <= 0;

			$display($time, "=> test003_soc done");

		end
	endtask

	reg[31:0]idx4;
	task test003_fpga;
		//input [7:0] compare_data;

		begin
		
			@ (posedge fpga_coreclk);
			while ( fpga_is_as_tvalid == 0) begin		//wait for remote side from valid data then start test
				@ (posedge fpga_coreclk);
			end

			//for Axis Switch Rx
			for(idx4=0; idx4<BUF_SIZE; idx4=idx4+1)begin
				if (fpga_is_as_tvalid)
					as_fifo_cnt = as_fifo_cnt + 1;

				if (as_fifo_cnt == 4 && fpga_is_as_tvalid )  begin
						fpga_as_is_tready <= 0;
						repeat(20) @ (posedge fpga_coreclk); //wait for 20 coreclk
						fpga_as_is_tready <= 1;
						as_fifo_cnt = as_fifo_cnt + 1;  //add as_fifo_cnt to avoid enter
				end
				else fpga_as_is_tready <= 1;

				$display($time, "=> fpga fpga_as_is_tready=%b, idx4=%x, as_fifo_cnt=%x", fpga_as_is_tready, idx4, as_fifo_cnt);
				@ (posedge fpga_coreclk);

			end

			#200;
			$display($time, "=> test003_fpga done");
		end
	endtask



	task test004;
		//input [7:0] compare_data;

		begin
			for (j=0;j<3;j=j+1) begin
				soc_coreclk_dly_en = j[0];
				soc_ioclk_dly_en = j[1];
				$display("test004: DownStream test,  soc_coreclk_dly_en = %b, soc_ioclk_dly_en=%b", soc_coreclk_dly_en, soc_ioclk_dly_en);
				for (i=0;i<TEST004_CNT;i=i+1) begin
					$display("test004: DownStream test - loop %02d, change coreclk phase in soc", i);
					fork 
						soc_apply_reset(40+i*10, 40);			//change coreclk phase in soc
						fpga_apply_reset(40,40);		//fix coreclk phase in fpga
					join
					#40;
					soc_cc_is_enable=1;
					fpga_cc_is_enable=1;
					fork 
						soc_cfg_write(0,1,1,0);
						fpga_cfg_write(0,1,1,0);
					join
					$display($time, "=> soc rxen_ctl=1");
					$display($time, "=> fpga rxen_ctl=1");
	
					#400;
					fork 
						soc_cfg_write(0,3,1,0);
						fpga_cfg_write(0,3,1,0);
					join
					$display($time, "=> soc txen_ctl=1");
					$display($time, "=> fpga txen_ctl=1");
	
					#200;
					fpga_as_is_tdata = 32'h5a5a5a5a;
					#40;
	
					//init counter
					DN_data_send_cnt = 0;
					DN_data_received_cnt = 0;
					
					fork
						test004_soc();
						test004_fpga();
					join
					
					#40; //add delay to make sure DN_data_send_buf and DN_data_received_buf is ready for compare.
					
					//check result
					for(idx1=0; idx1<BUF_SIZE; idx1=idx1+1)begin
						if (DN_data_send_buf[idx1] !== DN_data_received_buf[idx1]) begin
							$display($time, "=> test004 data compare [ERROR], DN_data_send_buf[%x] = %x, DN_data_received_buf[%x] = %x", idx1, DN_data_send_buf[idx1], idx1, DN_data_received_buf[idx1]);
							error_cnt = error_cnt + 1;
						end	
						else 
							$display($time, "=> test004 data compare [PASS], DN_data_send_buf[%x] = %x, DN_data_received_buf[%x] = %x", idx1, DN_data_send_buf[idx1], idx1, DN_data_received_buf[idx1]);
	
						if (DN_tstrb_send_buf[idx1] !== DN_tstrb_received_buf[idx1]) begin
							$display($time, "=> test004 data compare [ERROR], DN_tstrb_send_buf[%x] = %x, DN_tstrb_received_buf[%x] = %x", idx1, DN_tstrb_send_buf[idx1], idx1, DN_tstrb_received_buf[idx1]);
							error_cnt = error_cnt + 1;
						end	
						else 
							$display($time, "=> test004 data compare [PASS], DN_tstrb_send_buf[%x] = %x, DN_tstrb_received_buf[%x] = %x", idx1, DN_tstrb_send_buf[idx1], idx1, DN_tstrb_received_buf[idx1]);
	
	
						if (DN_tkeep_send_buf[idx1] !== DN_tkeep_received_buf[idx1]) begin
							$display($time, "=> test004 data compare [ERROR], DN_tkeep_send_buf[%x] = %x, DN_tkeep_received_buf[%x] = %x", idx1, DN_tkeep_send_buf[idx1], idx1, DN_tkeep_received_buf[idx1]);
							error_cnt = error_cnt + 1;
						end	
						else 
							$display($time, "=> test004 data compare [PASS], DN_tkeep_send_buf[%x] = %x, DN_tkeep_received_buf[%x] = %x", idx1, DN_tkeep_send_buf[idx1], idx1, DN_tkeep_received_buf[idx1]);
	
						if (DN_tlast_send_buf[idx1] !== DN_tlast_received_buf[idx1]) begin
							$display($time, "=> test004 data compare [ERROR], DN_tlast_send_buf[%x] = %x, DN_tlast_received_buf[%x] = %x", idx1, DN_tlast_send_buf[idx1], idx1, DN_tlast_received_buf[idx1]);
							error_cnt = error_cnt + 1;
						end	
						else 
							$display($time, "=> test004 data compare [PASS], DN_tlast_send_buf[%x] = %x, DN_tlast_received_buf[%x] = %x", idx1, DN_tlast_send_buf[idx1], idx1, DN_tlast_received_buf[idx1]);
	
	
						if (DN_tid_send_buf[idx1] !== DN_tid_received_buf[idx1]) begin
							$display($time, "=> test004 data compare [ERROR], DN_tid_send_buf[%x] = %x, DN_tid_received_buf[%x] = %x", idx1, DN_tid_send_buf[idx1], idx1, DN_tid_received_buf[idx1]);
							error_cnt = error_cnt + 1;
						end	
						else 
							$display($time, "=> test004 data compare [PASS], DN_tid_send_buf[%x] = %x, DN_tid_received_buf[%x] = %x", idx1, DN_tid_send_buf[idx1], idx1, DN_tid_received_buf[idx1]);
	
	
						if (DN_tuser_send_buf[idx1] !== DN_tuser_received_buf[idx1]) begin
							$display($time, "=> test004 data compare [ERROR], DN_tuser_send_buf[%x] = %x, DN_tuser_received_buf[%x] = %x", idx1, DN_tuser_send_buf[idx1], idx1, DN_tuser_received_buf[idx1]);
							error_cnt = error_cnt + 1;
						end	
						else 
							$display($time, "=> test004 data compare [PASS], DN_tuser_send_buf[%x] = %x, DN_tuser_received_buf[%x] = %x", idx1, DN_tuser_send_buf[idx1], idx1, DN_tuser_received_buf[idx1]);
	
					end
					
					#200;
				end
			end	
			soc_coreclk_dly_en = 0;
			soc_ioclk_dly_en = 0;
			#1000;
		end
	endtask


	task test004_fpga;
		//input [7:0] compare_data;

		begin
			@ (posedge fpga_coreclk);
			
			for(idx1=0; idx1<BUF_SIZE; idx1=idx1+1)begin
				fpga_as_is_tdata <=  idx1 * 32'h11111111;
				fpga_as_is_tstrb <=  idx1 * 4'h1;
				fpga_as_is_tkeep <=  idx1 * 4'h1;
				fpga_as_is_tid <=  idx1 * 2'h1;
				fpga_as_is_tuser <=  idx1 * 2'h1;
				fpga_as_is_tlast <=  idx1 * 1'h1;
				fpga_as_is_tvalid <= 1;

				@ (posedge fpga_coreclk);
				while (fpga_is_as_tready == 0) begin		// wait util fpga_is_as_tready == 1 then change data
						@ (posedge fpga_coreclk);
				end
			end
			fpga_as_is_tvalid <= 0;

			$display($time, "=> test004_fpga done");
		end
	endtask


	task test004_soc;
		//input [7:0] compare_data;

		begin
			soc_as_is_tready = 1;
			@ (posedge soc_coreclk);
			//for Axis Switch Rx
			for(idx2=0; idx2<BUF_SIZE; idx2=idx2+1)begin
				@ (posedge soc_coreclk);
				while ( soc_is_as_tvalid == 0) begin
					@ (posedge soc_coreclk);
				end
				$display($time, "=> soc idx2=%x", idx2);
			end
		$display($time, "=> test004_soc done");
		end
	endtask
	

	
	//Dump UP_data_send
	initial begin
		UP_data_send_cnt = 0;
		
		while (1) begin
			@ (posedge soc_coreclk);
			//#39;				 //use delay to workaround get data_send incorrect issue
			if (soc_as_is_tvalid && soc_is_as_tready) begin
				$display($time, "=> soc data_send	 : soc_as_is_tdata=%x, soc_as_is_tvalid=%b, soc_is_as_tready=%b, %x, %x, %b, %x, %x", soc_as_is_tdata, soc_as_is_tvalid, soc_is_as_tready, soc_as_is_tstrb, soc_as_is_tkeep, soc_as_is_tlast, soc_as_is_tid, soc_as_is_tuser);
				UP_data_send_buf[UP_data_send_cnt] = soc_as_is_tdata;
				UP_tstrb_send_buf[UP_data_send_cnt] = soc_as_is_tstrb;
				UP_tkeep_send_buf[UP_data_send_cnt] = soc_as_is_tkeep;
				UP_tlast_send_buf[UP_data_send_cnt] = soc_as_is_tlast;
				UP_tid_send_buf[UP_data_send_cnt] = soc_as_is_tid;
				UP_tuser_send_buf[UP_data_send_cnt] = soc_as_is_tuser;
				UP_data_send_cnt = UP_data_send_cnt+1;
			end
		end
	end


	//Dump UP_data_received
	initial begin
		UP_data_received_cnt = 0;
		
		while (1) begin
			@ (posedge fpga_coreclk);
			if (fpga_is_as_tvalid) begin
				$display($time, "=> fpga data_received : fpga_is_as_tdata=%x, fpga_is_as_tvalid=%b, %x, %x, %b, %x, %x", fpga_is_as_tdata, fpga_is_as_tvalid, fpga_is_as_tstrb, fpga_is_as_tkeep, fpga_is_as_tlast, fpga_is_as_tid, fpga_is_as_tuser);
				UP_data_received_buf[UP_data_received_cnt] = fpga_is_as_tdata;
				UP_data_received_buf[UP_data_received_cnt] = fpga_is_as_tdata;
				UP_tstrb_received_buf[UP_data_received_cnt] = fpga_is_as_tstrb;
				UP_tkeep_received_buf[UP_data_received_cnt] = fpga_is_as_tkeep;
				UP_tlast_received_buf[UP_data_received_cnt] = fpga_is_as_tlast;
				UP_tid_received_buf[UP_data_received_cnt] = fpga_is_as_tid;
				UP_tuser_received_buf[UP_data_received_cnt] = fpga_is_as_tuser;
				UP_data_received_cnt = UP_data_received_cnt+1;
			end
		end

	end

	//Dump DN_data_send
	initial begin
		DN_data_send_cnt = 0;
		
		while (1) begin
			@ (posedge fpga_coreclk);
			//#39;				 //use delay to workaround get data_send incorrect issue
			if (fpga_as_is_tvalid && fpga_is_as_tready) begin
				$display($time, "=> soc data_send	 : fpga_as_is_tdata=%x, fpga_as_is_tvalid=%b, fpga_is_as_tready=%b, %x, %x, %b, %x, %x", fpga_as_is_tdata, fpga_as_is_tvalid, fpga_is_as_tready, fpga_as_is_tstrb, fpga_as_is_tkeep, fpga_as_is_tlast, fpga_as_is_tid, fpga_as_is_tuser);
				DN_data_send_buf[DN_data_send_cnt] = fpga_as_is_tdata;
				DN_tstrb_send_buf[DN_data_send_cnt] = fpga_as_is_tstrb;
				DN_tkeep_send_buf[DN_data_send_cnt] = fpga_as_is_tkeep;
				DN_tlast_send_buf[DN_data_send_cnt] = fpga_as_is_tlast;
				DN_tid_send_buf[DN_data_send_cnt] = fpga_as_is_tid;
				DN_tuser_send_buf[DN_data_send_cnt] = fpga_as_is_tuser;
				DN_data_send_cnt = DN_data_send_cnt+1;
			end
		end
	end


	//Dump DN_data_received
	initial begin
		DN_data_received_cnt = 0;
		
		while (1) begin
			@ (posedge soc_coreclk);
			if (soc_is_as_tvalid) begin
				$display($time, "=> fpga data_received : soc_is_as_tdata=%x, soc_is_as_tvalid=%b, %x, %x, %b, %x, %x", soc_is_as_tdata, soc_is_as_tvalid, soc_is_as_tstrb, soc_is_as_tkeep, soc_is_as_tlast, soc_is_as_tid, soc_is_as_tuser);
				DN_data_received_buf[DN_data_received_cnt] = soc_is_as_tdata;
				DN_data_received_buf[DN_data_received_cnt] = soc_is_as_tdata;
				DN_tstrb_received_buf[DN_data_received_cnt] = soc_is_as_tstrb;
				DN_tkeep_received_buf[DN_data_received_cnt] = soc_is_as_tkeep;
				DN_tlast_received_buf[DN_data_received_cnt] = soc_is_as_tlast;
				DN_tid_received_buf[DN_data_received_cnt] = soc_is_as_tid;
				DN_tuser_received_buf[DN_data_received_cnt] = soc_is_as_tuser;
				DN_data_received_cnt = DN_data_received_cnt+1;
			end
		end

	end


	// config register read result compare_data

	initial begin
		//$monitor($time, "=>fpga_is_as_tdata=%x, fpga_is_as_tvalid=%b", fpga_is_as_tdata, fpga_is_as_tvalid);
		
		while (1) begin
			@ (posedge soc_coreclk);
			if (soc_axi_rvalid && soc_axi_rready) begin
				if (soc_axi_rdata == soc_cfg_expect_data)
					$display($time, "=> soc soc_cfg_read data compare : [PASS], soc_axi_rdata= %x", soc_axi_rdata);
				else 
					$display($time, "=> soc soc_cfg_read data compare : [FAIL], soc_axi_rdata= %x, soc_cfg_expect_data=%x", soc_axi_rdata, soc_cfg_expect_data);

			end
		end

	end
	

	always #(ioclk_pd/2) ioclk = ~ioclk;

	always #(dlyclk_pd/2) dlyclk = ~dlyclk;
	

	//apply reset
	task soc_apply_reset;
		input real delta1;		// for POR De-Assert
		input real delta2;		// for reset De-Assert
		begin
			#(40);
			$display($time, "=> soc POR Assert"); 
			soc_resetb = 0;
			$display($time, "=> soc reset Assert"); 
			soc_rst = 1;
			#(delta1);

			$display($time, "=> soc POR De-Assert"); 
			soc_resetb = 1;

			#(delta2);
			$display($time, "=> soc reset De-Assert"); 
			soc_rst = 0;
		end	
	endtask
	
	task fpga_apply_reset;
		input real delta1;		// for POR De-Assert
		input real delta2;		// for reset De-Assert
		begin
			#(40);
			$display($time, "=> fpga POR Assert"); 
			fpga_resetb = 0;
			$display($time, "=> fpga reset Assert"); 
			fpga_rst = 1;
			#(delta1);

			$display($time, "=> fpga POR De-Assert"); 
			fpga_resetb = 1;

			#(delta2);
			$display($time, "=> fpga reset De-Assert"); 
			fpga_rst = 0;
		end
	endtask
	
	task soc_delay_valid;		//input tdata and valid_delay 
		input [pDATA_WIDTH-1:0] tdata;
		input [7:0] valid_delay;
		
		begin
			soc_as_is_tdata <= tdata;
			soc_as_is_tvalid <= 0;
			//$display($time, "=> soc_delay_valid before : valid_delay=%x", valid_delay); 
			repeat (valid_delay) @ (posedge soc_coreclk);
			//$display($time, "=> soc_delay_valid after  : valid_delay=%x", valid_delay); 
			soc_as_is_tvalid <= 1;
			@ (posedge soc_coreclk);
			while (soc_is_as_tready == 0) begin
					@ (posedge soc_coreclk);
			end
			$display($time, "=> soc_delay_valid : soc_as_is_tdata=%x, soc_as_is_tvalid=%b, soc_is_as_tready=%b, valid_delay=%x", soc_as_is_tdata, soc_as_is_tvalid, soc_is_as_tready, valid_delay); 
			@ (posedge soc_coreclk);
			soc_as_is_tvalid <= 0;
			
		end
		
	endtask
		

	task soc_cfg_write_addr;		//input addr and valid_delay 
		input [pADDR_WIDTH-1:0] axi_awaddr;
		input [7:0] valid_delay;
		
		begin
			soc_axi_awaddr <= axi_awaddr;
			soc_axi_awvalid <= 0;
			//$display($time, "=> soc_delay_valid before : valid_delay=%x", valid_delay); 
			repeat (valid_delay) @ (posedge soc_coreclk);
			//$display($time, "=> soc_delay_valid after  : valid_delay=%x", valid_delay); 
			soc_axi_awvalid <= 1;
			@ (posedge soc_coreclk);
			while (soc_axi_awready == 0) begin
					@ (posedge soc_coreclk);
			end
			$display($time, "=> soc_cfg_write_addr : soc_axi_awaddr=%x, soc_axi_awvalid=%b, soc_axi_awready=%b", soc_axi_awaddr, soc_axi_awvalid, soc_axi_awready); 
			soc_axi_awvalid <= 0;
		end
		
	endtask

	task soc_cfg_write_data;		//input data, strb and valid_delay 
		input [pDATA_WIDTH-1:0] axi_wdata;
		input [3:0] axi_wstrb;
		
		input [7:0] valid_delay;
		
		begin
			soc_axi_wdata <= axi_wdata;
			soc_axi_wstrb <= axi_wstrb;
			soc_axi_wvalid <= 0;
			//$display($time, "=> soc_delay_valid before : valid_delay=%x", valid_delay); 
			repeat (valid_delay) @ (posedge soc_coreclk);
			//$display($time, "=> soc_delay_valid after  : valid_delay=%x", valid_delay); 
			soc_axi_wvalid <= 1;
			@ (posedge soc_coreclk);
			while (soc_axi_wready == 0) begin
					@ (posedge soc_coreclk);
			end
			$display($time, "=> soc_cfg_write_data : soc_axi_wdata=%x, axi_wstrb=%x, soc_axi_wvalid=%b, soc_axi_wready=%b", soc_axi_wdata, axi_wstrb, soc_axi_wvalid, soc_axi_wready); 
			soc_axi_wvalid <= 0;
		end
		
	endtask

	task soc_cfg_write;		//input addr, data, strb and valid_delay 
		input [pADDR_WIDTH-1:0] axi_awaddr;
		input [pDATA_WIDTH-1:0] axi_wdata;
		input [3:0] axi_wstrb;
		input [7:0] valid_delay;
		
	
		begin
			soc_axi_awaddr <= axi_awaddr;
			soc_axi_awvalid <= 0;
			soc_axi_wdata <= axi_wdata;
			soc_axi_wstrb <= axi_wstrb;
			soc_axi_wvalid <= 0;
			//$display($time, "=> soc_delay_valid before : valid_delay=%x", valid_delay); 
			repeat (valid_delay) @ (posedge soc_coreclk);
			//$display($time, "=> soc_delay_valid after  : valid_delay=%x", valid_delay); 
			soc_axi_awvalid <= 1;
			soc_axi_wvalid <= 1;
			@ (posedge soc_coreclk);
			while (soc_axi_awready == 0) begin		//assume both soc_axi_awready and soc_axi_wready assert as the same time.
					@ (posedge soc_coreclk);
			end
			$display($time, "=> soc_cfg_write : soc_axi_awaddr=%x, soc_axi_awvalid=%b, soc_axi_awready=%b, soc_axi_wdata=%x, axi_wstrb=%x, soc_axi_wvalid=%b, soc_axi_wready=%b", soc_axi_awaddr, soc_axi_awvalid, soc_axi_awready, soc_axi_wdata, axi_wstrb, soc_axi_wvalid, soc_axi_wready); 
			soc_axi_awvalid <= 0;
			soc_axi_wvalid <= 0;
		end
		
	endtask

	task fpga_cfg_write;		//input addr, data, strb and valid_delay 
		input [pADDR_WIDTH-1:0] axi_awaddr;
		input [pDATA_WIDTH-1:0] axi_wdata;
		input [3:0] axi_wstrb;
		input [7:0] valid_delay;
		
		begin
			fpga_axi_awaddr <= axi_awaddr;
			fpga_axi_awvalid <= 0;
			fpga_axi_wdata <= axi_wdata;
			fpga_axi_wstrb <= axi_wstrb;
			fpga_axi_wvalid <= 0;
			//$display($time, "=> fpga_delay_valid before : valid_delay=%x", valid_delay); 
			repeat (valid_delay) @ (posedge fpga_coreclk);
			//$display($time, "=> fpga_delay_valid after  : valid_delay=%x", valid_delay); 
			fpga_axi_awvalid <= 1;
			fpga_axi_wvalid <= 1;
			@ (posedge fpga_coreclk);
			while (fpga_axi_awready == 0) begin		//assume both fpga_axi_awready and fpga_axi_wready assert as the same time.
					@ (posedge fpga_coreclk);
			end
			$display($time, "=> fpga_cfg_write : fpga_axi_awaddr=%x, fpga_axi_awvalid=%b, fpga_axi_awready=%b, fpga_axi_wdata=%x, axi_wstrb=%x, fpga_axi_wvalid=%b, fpga_axi_wready=%b", fpga_axi_awaddr, fpga_axi_awvalid, fpga_axi_awready, fpga_axi_wdata, axi_wstrb, fpga_axi_wvalid, fpga_axi_wready); 
			fpga_axi_awvalid <= 0;
			fpga_axi_wvalid <= 0;
		end
		
	endtask

	task soc_cfg_read;		//input addr and valid_delay 
		input [pADDR_WIDTH-1:0] axi_araddr;
		input [7:0] valid_delay;
		//input [7:0] compare_data;
		
		begin
			soc_axi_araddr <= axi_araddr;
			soc_axi_arvalid <= 0;
			soc_axi_rready <= 0;
			//$display($time, "=> soc_delay_valid before : valid_delay=%x", valid_delay); 
			repeat (valid_delay) @ (posedge soc_coreclk);
			//$display($time, "=> soc_delay_valid after  : valid_delay=%x", valid_delay); 
			soc_axi_arvalid <= 1;
			@ (posedge soc_coreclk);
			while (soc_axi_arready == 0) begin		
					@ (posedge soc_coreclk);
			end
			$display($time, "=> soc_cfg_read : soc_axi_araddr=%x, soc_axi_arvalid=%b, soc_axi_arready=%b", soc_axi_araddr, soc_axi_arvalid, soc_axi_arready); 
			
			
			soc_axi_arvalid <= 0;
			//$display($time, "=> soc_delay_valid before : valid_delay=%x", valid_delay); 
			repeat (valid_delay) @ (posedge soc_coreclk);
			//$display($time, "=> soc_delay_valid after  : valid_delay=%x", valid_delay); 
			soc_axi_rready <= 1;
			@ (posedge soc_coreclk);
			while (soc_axi_rvalid == 0) begin		
					@ (posedge soc_coreclk);
			end
			$display($time, "=> soc_cfg_read : soc_axi_rdata=%x, soc_axi_rready=%b, soc_axi_rvalid=%b", soc_axi_rdata, soc_axi_rready, soc_axi_rvalid); 
			soc_axi_rready <= 0;

		end
		
	endtask


endmodule


