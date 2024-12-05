// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
 `timescale 1ns/1ps


`define AUTOTB_DUT      mmult
`define AUTOTB_DUT_INST AESL_inst_mmult
`define AUTOTB_TOP      apatb_mmult_top
`define AUTOTB_LAT_RESULT_FILE "mmult.result.lat.rb"
`define AUTOTB_PER_RESULT_TRANS_FILE "mmult.performance.result.transaction.xml"
`define AUTOTB_TOP_INST AESL_inst_apatb_mmult_top
`define AUTOTB_MAX_ALLOW_LATENCY  15000000
`define AUTOTB_CLOCK_PERIOD_DIV2 5.00

`define AESL_DEPTH_gmem0 1
`define AESL_DEPTH_gmem1 1
`define AESL_DEPTH_gmem2 1
`define AESL_DEPTH_a 1
`define AESL_DEPTH_b 1
`define AESL_DEPTH_c 1
`define AESL_DEPTH_a_row 1
`define AESL_DEPTH_a_col 1
`define AESL_DEPTH_b_col 1
`define AUTOTB_TVIN_gmem0  "../tv/cdatafile/c.mmult.autotvin_gmem0.dat"
`define AUTOTB_TVIN_gmem1  "../tv/cdatafile/c.mmult.autotvin_gmem1.dat"
`define AUTOTB_TVIN_a  "../tv/cdatafile/c.mmult.autotvin_a.dat"
`define AUTOTB_TVIN_b  "../tv/cdatafile/c.mmult.autotvin_b.dat"
`define AUTOTB_TVIN_c  "../tv/cdatafile/c.mmult.autotvin_c.dat"
`define AUTOTB_TVIN_a_row  "../tv/cdatafile/c.mmult.autotvin_a_row.dat"
`define AUTOTB_TVIN_a_col  "../tv/cdatafile/c.mmult.autotvin_a_col.dat"
`define AUTOTB_TVIN_b_col  "../tv/cdatafile/c.mmult.autotvin_b_col.dat"
`define AUTOTB_TVIN_gmem0_out_wrapc  "../tv/rtldatafile/rtl.mmult.autotvin_gmem0.dat"
`define AUTOTB_TVIN_gmem1_out_wrapc  "../tv/rtldatafile/rtl.mmult.autotvin_gmem1.dat"
`define AUTOTB_TVIN_a_out_wrapc  "../tv/rtldatafile/rtl.mmult.autotvin_a.dat"
`define AUTOTB_TVIN_b_out_wrapc  "../tv/rtldatafile/rtl.mmult.autotvin_b.dat"
`define AUTOTB_TVIN_c_out_wrapc  "../tv/rtldatafile/rtl.mmult.autotvin_c.dat"
`define AUTOTB_TVIN_a_row_out_wrapc  "../tv/rtldatafile/rtl.mmult.autotvin_a_row.dat"
`define AUTOTB_TVIN_a_col_out_wrapc  "../tv/rtldatafile/rtl.mmult.autotvin_a_col.dat"
`define AUTOTB_TVIN_b_col_out_wrapc  "../tv/rtldatafile/rtl.mmult.autotvin_b_col.dat"
`define AUTOTB_TVOUT_gmem2  "../tv/cdatafile/c.mmult.autotvout_gmem2.dat"
`define AUTOTB_TVOUT_gmem2_out_wrapc  "../tv/rtldatafile/rtl.mmult.autotvout_gmem2.dat"
module `AUTOTB_TOP;

parameter AUTOTB_TRANSACTION_NUM = 1;
parameter PROGRESS_TIMEOUT = 10000000;
parameter LATENCY_ESTIMATION = -1;
parameter LENGTH_a = 1;
parameter LENGTH_b = 1;
parameter LENGTH_c = 1;
parameter LENGTH_a_row = 1;
parameter LENGTH_a_col = 1;
parameter LENGTH_b_col = 1;
parameter LENGTH_gmem0 = 256;
parameter LENGTH_gmem1 = 256;
parameter LENGTH_gmem2 = 256;

task read_token;
    input integer fp;
    output reg [191 : 0] token;
    integer ret;
    begin
        token = "";
        ret = 0;
        ret = $fscanf(fp,"%s",token);
    end
endtask

reg AESL_clock;
reg rst;
reg dut_rst;
reg start;
reg ce;
reg tb_continue;
wire AESL_start;
wire AESL_reset;
wire AESL_ce;
wire AESL_ready;
wire AESL_idle;
wire AESL_continue;
wire AESL_done;
reg AESL_done_delay = 0;
reg AESL_done_delay2 = 0;
reg AESL_ready_delay = 0;
wire ready;
wire ready_wire;
wire [6 : 0] control_AWADDR;
wire  control_AWVALID;
wire  control_AWREADY;
wire  control_WVALID;
wire  control_WREADY;
wire [31 : 0] control_WDATA;
wire [3 : 0] control_WSTRB;
wire [6 : 0] control_ARADDR;
wire  control_ARVALID;
wire  control_ARREADY;
wire  control_RVALID;
wire  control_RREADY;
wire [31 : 0] control_RDATA;
wire [1 : 0] control_RRESP;
wire  control_BVALID;
wire  control_BREADY;
wire [1 : 0] control_BRESP;
wire  control_INTERRUPT;
wire  gmem0_AWVALID;
wire  gmem0_AWREADY;
wire [63 : 0] gmem0_AWADDR;
wire [0 : 0] gmem0_AWID;
wire [7 : 0] gmem0_AWLEN;
wire [2 : 0] gmem0_AWSIZE;
wire [1 : 0] gmem0_AWBURST;
wire [1 : 0] gmem0_AWLOCK;
wire [3 : 0] gmem0_AWCACHE;
wire [2 : 0] gmem0_AWPROT;
wire [3 : 0] gmem0_AWQOS;
wire [3 : 0] gmem0_AWREGION;
wire [0 : 0] gmem0_AWUSER;
wire  gmem0_WVALID;
wire  gmem0_WREADY;
wire [31 : 0] gmem0_WDATA;
wire [3 : 0] gmem0_WSTRB;
wire  gmem0_WLAST;
wire [0 : 0] gmem0_WID;
wire [0 : 0] gmem0_WUSER;
wire  gmem0_ARVALID;
wire  gmem0_ARREADY;
wire [63 : 0] gmem0_ARADDR;
wire [0 : 0] gmem0_ARID;
wire [7 : 0] gmem0_ARLEN;
wire [2 : 0] gmem0_ARSIZE;
wire [1 : 0] gmem0_ARBURST;
wire [1 : 0] gmem0_ARLOCK;
wire [3 : 0] gmem0_ARCACHE;
wire [2 : 0] gmem0_ARPROT;
wire [3 : 0] gmem0_ARQOS;
wire [3 : 0] gmem0_ARREGION;
wire [0 : 0] gmem0_ARUSER;
wire  gmem0_RVALID;
wire  gmem0_RREADY;
wire [31 : 0] gmem0_RDATA;
wire  gmem0_RLAST;
wire [0 : 0] gmem0_RID;
wire [0 : 0] gmem0_RUSER;
wire [1 : 0] gmem0_RRESP;
wire  gmem0_BVALID;
wire  gmem0_BREADY;
wire [1 : 0] gmem0_BRESP;
wire [0 : 0] gmem0_BID;
wire [0 : 0] gmem0_BUSER;
wire  gmem1_AWVALID;
wire  gmem1_AWREADY;
wire [63 : 0] gmem1_AWADDR;
wire [0 : 0] gmem1_AWID;
wire [7 : 0] gmem1_AWLEN;
wire [2 : 0] gmem1_AWSIZE;
wire [1 : 0] gmem1_AWBURST;
wire [1 : 0] gmem1_AWLOCK;
wire [3 : 0] gmem1_AWCACHE;
wire [2 : 0] gmem1_AWPROT;
wire [3 : 0] gmem1_AWQOS;
wire [3 : 0] gmem1_AWREGION;
wire [0 : 0] gmem1_AWUSER;
wire  gmem1_WVALID;
wire  gmem1_WREADY;
wire [31 : 0] gmem1_WDATA;
wire [3 : 0] gmem1_WSTRB;
wire  gmem1_WLAST;
wire [0 : 0] gmem1_WID;
wire [0 : 0] gmem1_WUSER;
wire  gmem1_ARVALID;
wire  gmem1_ARREADY;
wire [63 : 0] gmem1_ARADDR;
wire [0 : 0] gmem1_ARID;
wire [7 : 0] gmem1_ARLEN;
wire [2 : 0] gmem1_ARSIZE;
wire [1 : 0] gmem1_ARBURST;
wire [1 : 0] gmem1_ARLOCK;
wire [3 : 0] gmem1_ARCACHE;
wire [2 : 0] gmem1_ARPROT;
wire [3 : 0] gmem1_ARQOS;
wire [3 : 0] gmem1_ARREGION;
wire [0 : 0] gmem1_ARUSER;
wire  gmem1_RVALID;
wire  gmem1_RREADY;
wire [31 : 0] gmem1_RDATA;
wire  gmem1_RLAST;
wire [0 : 0] gmem1_RID;
wire [0 : 0] gmem1_RUSER;
wire [1 : 0] gmem1_RRESP;
wire  gmem1_BVALID;
wire  gmem1_BREADY;
wire [1 : 0] gmem1_BRESP;
wire [0 : 0] gmem1_BID;
wire [0 : 0] gmem1_BUSER;
wire  gmem2_AWVALID;
wire  gmem2_AWREADY;
wire [63 : 0] gmem2_AWADDR;
wire [0 : 0] gmem2_AWID;
wire [7 : 0] gmem2_AWLEN;
wire [2 : 0] gmem2_AWSIZE;
wire [1 : 0] gmem2_AWBURST;
wire [1 : 0] gmem2_AWLOCK;
wire [3 : 0] gmem2_AWCACHE;
wire [2 : 0] gmem2_AWPROT;
wire [3 : 0] gmem2_AWQOS;
wire [3 : 0] gmem2_AWREGION;
wire [0 : 0] gmem2_AWUSER;
wire  gmem2_WVALID;
wire  gmem2_WREADY;
wire [31 : 0] gmem2_WDATA;
wire [3 : 0] gmem2_WSTRB;
wire  gmem2_WLAST;
wire [0 : 0] gmem2_WID;
wire [0 : 0] gmem2_WUSER;
wire  gmem2_ARVALID;
wire  gmem2_ARREADY;
wire [63 : 0] gmem2_ARADDR;
wire [0 : 0] gmem2_ARID;
wire [7 : 0] gmem2_ARLEN;
wire [2 : 0] gmem2_ARSIZE;
wire [1 : 0] gmem2_ARBURST;
wire [1 : 0] gmem2_ARLOCK;
wire [3 : 0] gmem2_ARCACHE;
wire [2 : 0] gmem2_ARPROT;
wire [3 : 0] gmem2_ARQOS;
wire [3 : 0] gmem2_ARREGION;
wire [0 : 0] gmem2_ARUSER;
wire  gmem2_RVALID;
wire  gmem2_RREADY;
wire [31 : 0] gmem2_RDATA;
wire  gmem2_RLAST;
wire [0 : 0] gmem2_RID;
wire [0 : 0] gmem2_RUSER;
wire [1 : 0] gmem2_RRESP;
wire  gmem2_BVALID;
wire  gmem2_BREADY;
wire [1 : 0] gmem2_BRESP;
wire [0 : 0] gmem2_BID;
wire [0 : 0] gmem2_BUSER;
integer done_cnt = 0;
integer AESL_ready_cnt = 0;
integer ready_cnt = 0;
reg ready_initial;
reg ready_initial_n;
reg ready_last_n;
reg ready_delay_last_n;
reg done_delay_last_n;
reg interface_done = 0;
wire control_write_data_finish;
wire AESL_slave_start;
reg AESL_slave_start_lock = 0;
wire AESL_slave_write_start_in;
wire AESL_slave_write_start_finish;
reg AESL_slave_ready;
wire AESL_slave_output_done;
wire AESL_slave_done;
reg ready_rise = 0;
reg start_rise = 0;
reg slave_start_status = 0;
reg slave_done_status = 0;
reg ap_done_lock = 0;


wire ap_clk;
wire ap_rst_n;
wire ap_rst_n_n;

`AUTOTB_DUT `AUTOTB_DUT_INST(
    .s_axi_control_AWADDR(control_AWADDR),
    .s_axi_control_AWVALID(control_AWVALID),
    .s_axi_control_AWREADY(control_AWREADY),
    .s_axi_control_WVALID(control_WVALID),
    .s_axi_control_WREADY(control_WREADY),
    .s_axi_control_WDATA(control_WDATA),
    .s_axi_control_WSTRB(control_WSTRB),
    .s_axi_control_ARADDR(control_ARADDR),
    .s_axi_control_ARVALID(control_ARVALID),
    .s_axi_control_ARREADY(control_ARREADY),
    .s_axi_control_RVALID(control_RVALID),
    .s_axi_control_RREADY(control_RREADY),
    .s_axi_control_RDATA(control_RDATA),
    .s_axi_control_RRESP(control_RRESP),
    .s_axi_control_BVALID(control_BVALID),
    .s_axi_control_BREADY(control_BREADY),
    .s_axi_control_BRESP(control_BRESP),
    .interrupt(control_INTERRUPT),
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .m_axi_gmem0_AWVALID(gmem0_AWVALID),
    .m_axi_gmem0_AWREADY(gmem0_AWREADY),
    .m_axi_gmem0_AWADDR(gmem0_AWADDR),
    .m_axi_gmem0_AWID(gmem0_AWID),
    .m_axi_gmem0_AWLEN(gmem0_AWLEN),
    .m_axi_gmem0_AWSIZE(gmem0_AWSIZE),
    .m_axi_gmem0_AWBURST(gmem0_AWBURST),
    .m_axi_gmem0_AWLOCK(gmem0_AWLOCK),
    .m_axi_gmem0_AWCACHE(gmem0_AWCACHE),
    .m_axi_gmem0_AWPROT(gmem0_AWPROT),
    .m_axi_gmem0_AWQOS(gmem0_AWQOS),
    .m_axi_gmem0_AWREGION(gmem0_AWREGION),
    .m_axi_gmem0_AWUSER(gmem0_AWUSER),
    .m_axi_gmem0_WVALID(gmem0_WVALID),
    .m_axi_gmem0_WREADY(gmem0_WREADY),
    .m_axi_gmem0_WDATA(gmem0_WDATA),
    .m_axi_gmem0_WSTRB(gmem0_WSTRB),
    .m_axi_gmem0_WLAST(gmem0_WLAST),
    .m_axi_gmem0_WID(gmem0_WID),
    .m_axi_gmem0_WUSER(gmem0_WUSER),
    .m_axi_gmem0_ARVALID(gmem0_ARVALID),
    .m_axi_gmem0_ARREADY(gmem0_ARREADY),
    .m_axi_gmem0_ARADDR(gmem0_ARADDR),
    .m_axi_gmem0_ARID(gmem0_ARID),
    .m_axi_gmem0_ARLEN(gmem0_ARLEN),
    .m_axi_gmem0_ARSIZE(gmem0_ARSIZE),
    .m_axi_gmem0_ARBURST(gmem0_ARBURST),
    .m_axi_gmem0_ARLOCK(gmem0_ARLOCK),
    .m_axi_gmem0_ARCACHE(gmem0_ARCACHE),
    .m_axi_gmem0_ARPROT(gmem0_ARPROT),
    .m_axi_gmem0_ARQOS(gmem0_ARQOS),
    .m_axi_gmem0_ARREGION(gmem0_ARREGION),
    .m_axi_gmem0_ARUSER(gmem0_ARUSER),
    .m_axi_gmem0_RVALID(gmem0_RVALID),
    .m_axi_gmem0_RREADY(gmem0_RREADY),
    .m_axi_gmem0_RDATA(gmem0_RDATA),
    .m_axi_gmem0_RLAST(gmem0_RLAST),
    .m_axi_gmem0_RID(gmem0_RID),
    .m_axi_gmem0_RUSER(gmem0_RUSER),
    .m_axi_gmem0_RRESP(gmem0_RRESP),
    .m_axi_gmem0_BVALID(gmem0_BVALID),
    .m_axi_gmem0_BREADY(gmem0_BREADY),
    .m_axi_gmem0_BRESP(gmem0_BRESP),
    .m_axi_gmem0_BID(gmem0_BID),
    .m_axi_gmem0_BUSER(gmem0_BUSER),
    .m_axi_gmem1_AWVALID(gmem1_AWVALID),
    .m_axi_gmem1_AWREADY(gmem1_AWREADY),
    .m_axi_gmem1_AWADDR(gmem1_AWADDR),
    .m_axi_gmem1_AWID(gmem1_AWID),
    .m_axi_gmem1_AWLEN(gmem1_AWLEN),
    .m_axi_gmem1_AWSIZE(gmem1_AWSIZE),
    .m_axi_gmem1_AWBURST(gmem1_AWBURST),
    .m_axi_gmem1_AWLOCK(gmem1_AWLOCK),
    .m_axi_gmem1_AWCACHE(gmem1_AWCACHE),
    .m_axi_gmem1_AWPROT(gmem1_AWPROT),
    .m_axi_gmem1_AWQOS(gmem1_AWQOS),
    .m_axi_gmem1_AWREGION(gmem1_AWREGION),
    .m_axi_gmem1_AWUSER(gmem1_AWUSER),
    .m_axi_gmem1_WVALID(gmem1_WVALID),
    .m_axi_gmem1_WREADY(gmem1_WREADY),
    .m_axi_gmem1_WDATA(gmem1_WDATA),
    .m_axi_gmem1_WSTRB(gmem1_WSTRB),
    .m_axi_gmem1_WLAST(gmem1_WLAST),
    .m_axi_gmem1_WID(gmem1_WID),
    .m_axi_gmem1_WUSER(gmem1_WUSER),
    .m_axi_gmem1_ARVALID(gmem1_ARVALID),
    .m_axi_gmem1_ARREADY(gmem1_ARREADY),
    .m_axi_gmem1_ARADDR(gmem1_ARADDR),
    .m_axi_gmem1_ARID(gmem1_ARID),
    .m_axi_gmem1_ARLEN(gmem1_ARLEN),
    .m_axi_gmem1_ARSIZE(gmem1_ARSIZE),
    .m_axi_gmem1_ARBURST(gmem1_ARBURST),
    .m_axi_gmem1_ARLOCK(gmem1_ARLOCK),
    .m_axi_gmem1_ARCACHE(gmem1_ARCACHE),
    .m_axi_gmem1_ARPROT(gmem1_ARPROT),
    .m_axi_gmem1_ARQOS(gmem1_ARQOS),
    .m_axi_gmem1_ARREGION(gmem1_ARREGION),
    .m_axi_gmem1_ARUSER(gmem1_ARUSER),
    .m_axi_gmem1_RVALID(gmem1_RVALID),
    .m_axi_gmem1_RREADY(gmem1_RREADY),
    .m_axi_gmem1_RDATA(gmem1_RDATA),
    .m_axi_gmem1_RLAST(gmem1_RLAST),
    .m_axi_gmem1_RID(gmem1_RID),
    .m_axi_gmem1_RUSER(gmem1_RUSER),
    .m_axi_gmem1_RRESP(gmem1_RRESP),
    .m_axi_gmem1_BVALID(gmem1_BVALID),
    .m_axi_gmem1_BREADY(gmem1_BREADY),
    .m_axi_gmem1_BRESP(gmem1_BRESP),
    .m_axi_gmem1_BID(gmem1_BID),
    .m_axi_gmem1_BUSER(gmem1_BUSER),
    .m_axi_gmem2_AWVALID(gmem2_AWVALID),
    .m_axi_gmem2_AWREADY(gmem2_AWREADY),
    .m_axi_gmem2_AWADDR(gmem2_AWADDR),
    .m_axi_gmem2_AWID(gmem2_AWID),
    .m_axi_gmem2_AWLEN(gmem2_AWLEN),
    .m_axi_gmem2_AWSIZE(gmem2_AWSIZE),
    .m_axi_gmem2_AWBURST(gmem2_AWBURST),
    .m_axi_gmem2_AWLOCK(gmem2_AWLOCK),
    .m_axi_gmem2_AWCACHE(gmem2_AWCACHE),
    .m_axi_gmem2_AWPROT(gmem2_AWPROT),
    .m_axi_gmem2_AWQOS(gmem2_AWQOS),
    .m_axi_gmem2_AWREGION(gmem2_AWREGION),
    .m_axi_gmem2_AWUSER(gmem2_AWUSER),
    .m_axi_gmem2_WVALID(gmem2_WVALID),
    .m_axi_gmem2_WREADY(gmem2_WREADY),
    .m_axi_gmem2_WDATA(gmem2_WDATA),
    .m_axi_gmem2_WSTRB(gmem2_WSTRB),
    .m_axi_gmem2_WLAST(gmem2_WLAST),
    .m_axi_gmem2_WID(gmem2_WID),
    .m_axi_gmem2_WUSER(gmem2_WUSER),
    .m_axi_gmem2_ARVALID(gmem2_ARVALID),
    .m_axi_gmem2_ARREADY(gmem2_ARREADY),
    .m_axi_gmem2_ARADDR(gmem2_ARADDR),
    .m_axi_gmem2_ARID(gmem2_ARID),
    .m_axi_gmem2_ARLEN(gmem2_ARLEN),
    .m_axi_gmem2_ARSIZE(gmem2_ARSIZE),
    .m_axi_gmem2_ARBURST(gmem2_ARBURST),
    .m_axi_gmem2_ARLOCK(gmem2_ARLOCK),
    .m_axi_gmem2_ARCACHE(gmem2_ARCACHE),
    .m_axi_gmem2_ARPROT(gmem2_ARPROT),
    .m_axi_gmem2_ARQOS(gmem2_ARQOS),
    .m_axi_gmem2_ARREGION(gmem2_ARREGION),
    .m_axi_gmem2_ARUSER(gmem2_ARUSER),
    .m_axi_gmem2_RVALID(gmem2_RVALID),
    .m_axi_gmem2_RREADY(gmem2_RREADY),
    .m_axi_gmem2_RDATA(gmem2_RDATA),
    .m_axi_gmem2_RLAST(gmem2_RLAST),
    .m_axi_gmem2_RID(gmem2_RID),
    .m_axi_gmem2_RUSER(gmem2_RUSER),
    .m_axi_gmem2_RRESP(gmem2_RRESP),
    .m_axi_gmem2_BVALID(gmem2_BVALID),
    .m_axi_gmem2_BREADY(gmem2_BREADY),
    .m_axi_gmem2_BRESP(gmem2_BRESP),
    .m_axi_gmem2_BID(gmem2_BID),
    .m_axi_gmem2_BUSER(gmem2_BUSER));

// Assignment for control signal
assign ap_clk = AESL_clock;
assign ap_rst_n = dut_rst;
assign ap_rst_n_n = ~dut_rst;
assign AESL_reset = rst;
assign AESL_start = start;
assign AESL_ce = ce;
assign AESL_continue = tb_continue;
  assign AESL_slave_write_start_in = slave_start_status  & control_write_data_finish;
  assign AESL_slave_start = AESL_slave_write_start_finish;
  assign AESL_done = slave_done_status ;

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
    begin
        slave_start_status <= 1;
    end
    else begin
        if (AESL_start == 1 ) begin
            start_rise = 1;
        end
        if (start_rise == 1 && AESL_done == 1 ) begin
            slave_start_status <= 1;
        end
        if (AESL_slave_write_start_in == 1 && AESL_done == 0) begin 
            slave_start_status <= 0;
            start_rise = 0;
        end
    end
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
    begin
        AESL_slave_ready <= 0;
        ready_rise = 0;
    end
    else begin
        if (AESL_ready == 1 ) begin
            ready_rise = 1;
        end
        if (ready_rise == 1 && AESL_done_delay == 1 ) begin
            AESL_slave_ready <= 1;
        end
        if (AESL_slave_ready == 1) begin 
            AESL_slave_ready <= 0;
            ready_rise = 0;
        end
    end
end

always @ (posedge AESL_clock)
begin
    if (AESL_done == 1) begin
        slave_done_status <= 0;
    end
    else if (AESL_slave_output_done == 1 ) begin
        slave_done_status <= 1;
    end
end









wire    AESL_axi_master_gmem0_ready;
wire    AESL_axi_master_gmem0_done;
AESL_axi_master_gmem0 AESL_AXI_MASTER_gmem0(
    .clk   (AESL_clock),
    .reset (AESL_reset),
    .TRAN_gmem0_AWVALID (gmem0_AWVALID),
    .TRAN_gmem0_AWREADY (gmem0_AWREADY),
    .TRAN_gmem0_AWADDR (gmem0_AWADDR),
    .TRAN_gmem0_AWID (gmem0_AWID),
    .TRAN_gmem0_AWLEN (gmem0_AWLEN),
    .TRAN_gmem0_AWSIZE (gmem0_AWSIZE),
    .TRAN_gmem0_AWBURST (gmem0_AWBURST),
    .TRAN_gmem0_AWLOCK (gmem0_AWLOCK),
    .TRAN_gmem0_AWCACHE (gmem0_AWCACHE),
    .TRAN_gmem0_AWPROT (gmem0_AWPROT),
    .TRAN_gmem0_AWQOS (gmem0_AWQOS),
    .TRAN_gmem0_AWREGION (gmem0_AWREGION),
    .TRAN_gmem0_AWUSER (gmem0_AWUSER),
    .TRAN_gmem0_WVALID (gmem0_WVALID),
    .TRAN_gmem0_WREADY (gmem0_WREADY),
    .TRAN_gmem0_WDATA (gmem0_WDATA),
    .TRAN_gmem0_WSTRB (gmem0_WSTRB),
    .TRAN_gmem0_WLAST (gmem0_WLAST),
    .TRAN_gmem0_WID (gmem0_WID),
    .TRAN_gmem0_WUSER (gmem0_WUSER),
    .TRAN_gmem0_ARVALID (gmem0_ARVALID),
    .TRAN_gmem0_ARREADY (gmem0_ARREADY),
    .TRAN_gmem0_ARADDR (gmem0_ARADDR),
    .TRAN_gmem0_ARID (gmem0_ARID),
    .TRAN_gmem0_ARLEN (gmem0_ARLEN),
    .TRAN_gmem0_ARSIZE (gmem0_ARSIZE),
    .TRAN_gmem0_ARBURST (gmem0_ARBURST),
    .TRAN_gmem0_ARLOCK (gmem0_ARLOCK),
    .TRAN_gmem0_ARCACHE (gmem0_ARCACHE),
    .TRAN_gmem0_ARPROT (gmem0_ARPROT),
    .TRAN_gmem0_ARQOS (gmem0_ARQOS),
    .TRAN_gmem0_ARREGION (gmem0_ARREGION),
    .TRAN_gmem0_ARUSER (gmem0_ARUSER),
    .TRAN_gmem0_RVALID (gmem0_RVALID),
    .TRAN_gmem0_RREADY (gmem0_RREADY),
    .TRAN_gmem0_RDATA (gmem0_RDATA),
    .TRAN_gmem0_RLAST (gmem0_RLAST),
    .TRAN_gmem0_RID (gmem0_RID),
    .TRAN_gmem0_RUSER (gmem0_RUSER),
    .TRAN_gmem0_RRESP (gmem0_RRESP),
    .TRAN_gmem0_BVALID (gmem0_BVALID),
    .TRAN_gmem0_BREADY (gmem0_BREADY),
    .TRAN_gmem0_BRESP (gmem0_BRESP),
    .TRAN_gmem0_BID (gmem0_BID),
    .TRAN_gmem0_BUSER (gmem0_BUSER),
    .ready (AESL_axi_master_gmem0_ready),
    .done  (AESL_axi_master_gmem0_done)
);
assign    AESL_axi_master_gmem0_ready    =   ready;
assign    AESL_axi_master_gmem0_done    =   AESL_done_delay;
wire    AESL_axi_master_gmem1_ready;
wire    AESL_axi_master_gmem1_done;
AESL_axi_master_gmem1 AESL_AXI_MASTER_gmem1(
    .clk   (AESL_clock),
    .reset (AESL_reset),
    .TRAN_gmem1_AWVALID (gmem1_AWVALID),
    .TRAN_gmem1_AWREADY (gmem1_AWREADY),
    .TRAN_gmem1_AWADDR (gmem1_AWADDR),
    .TRAN_gmem1_AWID (gmem1_AWID),
    .TRAN_gmem1_AWLEN (gmem1_AWLEN),
    .TRAN_gmem1_AWSIZE (gmem1_AWSIZE),
    .TRAN_gmem1_AWBURST (gmem1_AWBURST),
    .TRAN_gmem1_AWLOCK (gmem1_AWLOCK),
    .TRAN_gmem1_AWCACHE (gmem1_AWCACHE),
    .TRAN_gmem1_AWPROT (gmem1_AWPROT),
    .TRAN_gmem1_AWQOS (gmem1_AWQOS),
    .TRAN_gmem1_AWREGION (gmem1_AWREGION),
    .TRAN_gmem1_AWUSER (gmem1_AWUSER),
    .TRAN_gmem1_WVALID (gmem1_WVALID),
    .TRAN_gmem1_WREADY (gmem1_WREADY),
    .TRAN_gmem1_WDATA (gmem1_WDATA),
    .TRAN_gmem1_WSTRB (gmem1_WSTRB),
    .TRAN_gmem1_WLAST (gmem1_WLAST),
    .TRAN_gmem1_WID (gmem1_WID),
    .TRAN_gmem1_WUSER (gmem1_WUSER),
    .TRAN_gmem1_ARVALID (gmem1_ARVALID),
    .TRAN_gmem1_ARREADY (gmem1_ARREADY),
    .TRAN_gmem1_ARADDR (gmem1_ARADDR),
    .TRAN_gmem1_ARID (gmem1_ARID),
    .TRAN_gmem1_ARLEN (gmem1_ARLEN),
    .TRAN_gmem1_ARSIZE (gmem1_ARSIZE),
    .TRAN_gmem1_ARBURST (gmem1_ARBURST),
    .TRAN_gmem1_ARLOCK (gmem1_ARLOCK),
    .TRAN_gmem1_ARCACHE (gmem1_ARCACHE),
    .TRAN_gmem1_ARPROT (gmem1_ARPROT),
    .TRAN_gmem1_ARQOS (gmem1_ARQOS),
    .TRAN_gmem1_ARREGION (gmem1_ARREGION),
    .TRAN_gmem1_ARUSER (gmem1_ARUSER),
    .TRAN_gmem1_RVALID (gmem1_RVALID),
    .TRAN_gmem1_RREADY (gmem1_RREADY),
    .TRAN_gmem1_RDATA (gmem1_RDATA),
    .TRAN_gmem1_RLAST (gmem1_RLAST),
    .TRAN_gmem1_RID (gmem1_RID),
    .TRAN_gmem1_RUSER (gmem1_RUSER),
    .TRAN_gmem1_RRESP (gmem1_RRESP),
    .TRAN_gmem1_BVALID (gmem1_BVALID),
    .TRAN_gmem1_BREADY (gmem1_BREADY),
    .TRAN_gmem1_BRESP (gmem1_BRESP),
    .TRAN_gmem1_BID (gmem1_BID),
    .TRAN_gmem1_BUSER (gmem1_BUSER),
    .ready (AESL_axi_master_gmem1_ready),
    .done  (AESL_axi_master_gmem1_done)
);
assign    AESL_axi_master_gmem1_ready    =   ready;
assign    AESL_axi_master_gmem1_done    =   AESL_done_delay;
wire    AESL_axi_master_gmem2_ready;
wire    AESL_axi_master_gmem2_done;
AESL_axi_master_gmem2 AESL_AXI_MASTER_gmem2(
    .clk   (AESL_clock),
    .reset (AESL_reset),
    .TRAN_gmem2_AWVALID (gmem2_AWVALID),
    .TRAN_gmem2_AWREADY (gmem2_AWREADY),
    .TRAN_gmem2_AWADDR (gmem2_AWADDR),
    .TRAN_gmem2_AWID (gmem2_AWID),
    .TRAN_gmem2_AWLEN (gmem2_AWLEN),
    .TRAN_gmem2_AWSIZE (gmem2_AWSIZE),
    .TRAN_gmem2_AWBURST (gmem2_AWBURST),
    .TRAN_gmem2_AWLOCK (gmem2_AWLOCK),
    .TRAN_gmem2_AWCACHE (gmem2_AWCACHE),
    .TRAN_gmem2_AWPROT (gmem2_AWPROT),
    .TRAN_gmem2_AWQOS (gmem2_AWQOS),
    .TRAN_gmem2_AWREGION (gmem2_AWREGION),
    .TRAN_gmem2_AWUSER (gmem2_AWUSER),
    .TRAN_gmem2_WVALID (gmem2_WVALID),
    .TRAN_gmem2_WREADY (gmem2_WREADY),
    .TRAN_gmem2_WDATA (gmem2_WDATA),
    .TRAN_gmem2_WSTRB (gmem2_WSTRB),
    .TRAN_gmem2_WLAST (gmem2_WLAST),
    .TRAN_gmem2_WID (gmem2_WID),
    .TRAN_gmem2_WUSER (gmem2_WUSER),
    .TRAN_gmem2_ARVALID (gmem2_ARVALID),
    .TRAN_gmem2_ARREADY (gmem2_ARREADY),
    .TRAN_gmem2_ARADDR (gmem2_ARADDR),
    .TRAN_gmem2_ARID (gmem2_ARID),
    .TRAN_gmem2_ARLEN (gmem2_ARLEN),
    .TRAN_gmem2_ARSIZE (gmem2_ARSIZE),
    .TRAN_gmem2_ARBURST (gmem2_ARBURST),
    .TRAN_gmem2_ARLOCK (gmem2_ARLOCK),
    .TRAN_gmem2_ARCACHE (gmem2_ARCACHE),
    .TRAN_gmem2_ARPROT (gmem2_ARPROT),
    .TRAN_gmem2_ARQOS (gmem2_ARQOS),
    .TRAN_gmem2_ARREGION (gmem2_ARREGION),
    .TRAN_gmem2_ARUSER (gmem2_ARUSER),
    .TRAN_gmem2_RVALID (gmem2_RVALID),
    .TRAN_gmem2_RREADY (gmem2_RREADY),
    .TRAN_gmem2_RDATA (gmem2_RDATA),
    .TRAN_gmem2_RLAST (gmem2_RLAST),
    .TRAN_gmem2_RID (gmem2_RID),
    .TRAN_gmem2_RUSER (gmem2_RUSER),
    .TRAN_gmem2_RRESP (gmem2_RRESP),
    .TRAN_gmem2_BVALID (gmem2_BVALID),
    .TRAN_gmem2_BREADY (gmem2_BREADY),
    .TRAN_gmem2_BRESP (gmem2_BRESP),
    .TRAN_gmem2_BID (gmem2_BID),
    .TRAN_gmem2_BUSER (gmem2_BUSER),
    .ready (AESL_axi_master_gmem2_ready),
    .done  (AESL_axi_master_gmem2_done)
);
assign    AESL_axi_master_gmem2_ready    =   ready;
assign    AESL_axi_master_gmem2_done    =   AESL_done_delay;

AESL_axi_slave_control AESL_AXI_SLAVE_control(
    .clk   (AESL_clock),
    .reset (AESL_reset),
    .TRAN_s_axi_control_AWADDR (control_AWADDR),
    .TRAN_s_axi_control_AWVALID (control_AWVALID),
    .TRAN_s_axi_control_AWREADY (control_AWREADY),
    .TRAN_s_axi_control_WVALID (control_WVALID),
    .TRAN_s_axi_control_WREADY (control_WREADY),
    .TRAN_s_axi_control_WDATA (control_WDATA),
    .TRAN_s_axi_control_WSTRB (control_WSTRB),
    .TRAN_s_axi_control_ARADDR (control_ARADDR),
    .TRAN_s_axi_control_ARVALID (control_ARVALID),
    .TRAN_s_axi_control_ARREADY (control_ARREADY),
    .TRAN_s_axi_control_RVALID (control_RVALID),
    .TRAN_s_axi_control_RREADY (control_RREADY),
    .TRAN_s_axi_control_RDATA (control_RDATA),
    .TRAN_s_axi_control_RRESP (control_RRESP),
    .TRAN_s_axi_control_BVALID (control_BVALID),
    .TRAN_s_axi_control_BREADY (control_BREADY),
    .TRAN_s_axi_control_BRESP (control_BRESP),
    .TRAN_control_interrupt (control_INTERRUPT),
    .TRAN_control_write_data_finish(control_write_data_finish),
    .TRAN_control_ready_out (AESL_ready),
    .TRAN_control_ready_in (AESL_slave_ready),
    .TRAN_control_done_out (AESL_slave_output_done),
    .TRAN_control_idle_out (AESL_idle),
    .TRAN_control_write_start_in     (AESL_slave_write_start_in),
    .TRAN_control_write_start_finish (AESL_slave_write_start_finish),
    .TRAN_control_transaction_done_in (AESL_done_delay),
    .TRAN_control_start_in  (AESL_slave_start)
);

initial begin : generate_AESL_ready_cnt_proc
    AESL_ready_cnt = 0;
    wait(AESL_reset === 1);
    while(AESL_ready_cnt != AUTOTB_TRANSACTION_NUM) begin
        while(AESL_ready !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        AESL_ready_cnt = AESL_ready_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
end

    event next_trigger_ready_cnt;
    
    initial begin : gen_ready_cnt
        ready_cnt = 0;
        wait (AESL_reset === 1);
        forever begin
            @ (posedge AESL_clock);
            if (ready == 1) begin
                if (ready_cnt < AUTOTB_TRANSACTION_NUM) begin
                    ready_cnt = ready_cnt + 1;
                end
            end
            -> next_trigger_ready_cnt;
        end
    end
    
    wire all_finish = (done_cnt == AUTOTB_TRANSACTION_NUM);
    
    // done_cnt
    always @ (posedge AESL_clock) begin
        if (~AESL_reset) begin
            done_cnt <= 0;
        end else begin
            if (AESL_done == 1) begin
                if (done_cnt < AUTOTB_TRANSACTION_NUM) begin
                    done_cnt <= done_cnt + 1;
                end
            end
        end
    end
    
    initial begin : finish_simulation
        wait (all_finish == 1);
        // last transaction is saved at negedge right after last done
        repeat(6) @ (posedge AESL_clock);
        $finish;
    end
    
initial begin
    AESL_clock = 0;
    forever #`AUTOTB_CLOCK_PERIOD_DIV2 AESL_clock = ~AESL_clock;
end


reg end_gmem0;
reg [31:0] size_gmem0;
reg [31:0] size_gmem0_backup;
reg end_gmem1;
reg [31:0] size_gmem1;
reg [31:0] size_gmem1_backup;
reg end_a;
reg [31:0] size_a;
reg [31:0] size_a_backup;
reg end_b;
reg [31:0] size_b;
reg [31:0] size_b_backup;
reg end_c;
reg [31:0] size_c;
reg [31:0] size_c_backup;
reg end_a_row;
reg [31:0] size_a_row;
reg [31:0] size_a_row_backup;
reg end_a_col;
reg [31:0] size_a_col;
reg [31:0] size_a_col_backup;
reg end_b_col;
reg [31:0] size_b_col;
reg [31:0] size_b_col_backup;
reg end_gmem2;
reg [31:0] size_gmem2;
reg [31:0] size_gmem2_backup;

initial begin : initial_process
    integer proc_rand;
    rst = 0;
    # 100;
    repeat(0+3) @ (posedge AESL_clock);
    rst = 1;
end
initial begin : initial_process_for_dut_rst
    integer proc_rand;
    dut_rst = 0;
    # 100;
    repeat(3) @ (posedge AESL_clock);
    dut_rst = 1;
end
initial begin : start_process
    integer proc_rand;
    reg [31:0] start_cnt;
    ce = 1;
    start = 0;
    start_cnt = 0;
    wait (AESL_reset === 1);
    @ (posedge AESL_clock);
    #0 start = 1;
    start_cnt = start_cnt + 1;
    forever begin
        if (start_cnt >= AUTOTB_TRANSACTION_NUM + 1) begin
            #0 start = 0;
        end
        @ (posedge AESL_clock);
        if (AESL_ready) begin
            start_cnt = start_cnt + 1;
        end
    end
end

always @(AESL_done)
begin
    tb_continue = AESL_done;
end

initial begin : ready_initial_process
    ready_initial = 0;
    wait (AESL_start === 1);
    ready_initial = 1;
    @(posedge AESL_clock);
    ready_initial = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
      AESL_ready_delay = 0;
  else
      AESL_ready_delay = AESL_ready;
end
initial begin : ready_last_n_process
  ready_last_n = 1;
  wait(ready_cnt == AUTOTB_TRANSACTION_NUM)
  @(posedge AESL_clock);
  ready_last_n <= 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
      ready_delay_last_n = 0;
  else
      ready_delay_last_n <= ready_last_n;
end
assign ready = (ready_initial | AESL_ready_delay);
assign ready_wire = ready_initial | AESL_ready_delay;
initial begin : done_delay_last_n_process
  done_delay_last_n = 1;
  while(done_cnt < AUTOTB_TRANSACTION_NUM)
      @(posedge AESL_clock);
  # 0.1;
  done_delay_last_n = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
  begin
      AESL_done_delay <= 0;
      AESL_done_delay2 <= 0;
  end
  else begin
      AESL_done_delay <= AESL_done & done_delay_last_n;
      AESL_done_delay2 <= AESL_done_delay;
  end
end
always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
      interface_done = 0;
  else begin
      # 0.01;
      if(ready === 1 && ready_cnt > 0 && ready_cnt < AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else if(AESL_done_delay === 1 && done_cnt == AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else
          interface_done = 0;
  end
end
task write_binary;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;

reg dump_tvout_finish_gmem2;

initial begin : dump_tvout_runtime_sign_gmem2
    integer fp;
    dump_tvout_finish_gmem2 = 0;
    fp = $fopen(`AUTOTB_TVOUT_gmem2_out_wrapc, "wb");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_gmem2_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fclose(fp);
    wait (done_cnt == AUTOTB_TRANSACTION_NUM);
    repeat(5) @ (posedge AESL_clock);
    fp = $fopen(`AUTOTB_TVOUT_gmem2_out_wrapc, "ab");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_gmem2_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    write_binary(fp,64'h5a5aa5a50f0ff0f0,64);
    $fclose(fp);
    repeat(5) @ (posedge AESL_clock);
    dump_tvout_finish_gmem2 = 1;
end


////////////////////////////////////////////
// progress and performance
////////////////////////////////////////////

task wait_start();
    while (~AESL_start) begin
        @ (posedge AESL_clock);
    end
endtask

reg [31:0] clk_cnt = 0;
reg AESL_ready_p1;
reg AESL_start_p1;

always @ (posedge AESL_clock) begin
    if (AESL_reset == 0) begin
        clk_cnt <= 32'h0;
        AESL_ready_p1 <= 1'b0;
        AESL_start_p1 <= 1'b0;
    end
    else begin
        clk_cnt <= clk_cnt + 1;
        AESL_ready_p1 <= AESL_ready;
        AESL_start_p1 <= AESL_start;
    end
end

reg [31:0] start_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] start_cnt;
reg [31:0] ready_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] ap_ready_cnt;
reg [31:0] finish_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] finish_cnt;
reg [31:0] lat_total;
event report_progress;

always @(posedge AESL_clock)
begin
    if (finish_cnt == AUTOTB_TRANSACTION_NUM - 1 && AESL_done == 1'b1)
        lat_total = clk_cnt - start_timestamp[0];
end

initial begin
    start_cnt = 0;
    finish_cnt = 0;
    ap_ready_cnt = 0;
    wait (AESL_reset == 1);
    wait_start();
    start_timestamp[start_cnt] = clk_cnt;
    start_cnt = start_cnt + 1;
    if (AESL_done) begin
        finish_timestamp[finish_cnt] = clk_cnt;
        finish_cnt = finish_cnt + 1;
    end
    -> report_progress;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt < AUTOTB_TRANSACTION_NUM) begin
            if ((AESL_start && AESL_ready_p1)||(AESL_start && ~AESL_start_p1)) begin
                start_timestamp[start_cnt] = clk_cnt;
                start_cnt = start_cnt + 1;
            end
        end
        if (ap_ready_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_start_p1 && AESL_ready_p1) begin
                ready_timestamp[ap_ready_cnt] = clk_cnt;
                ap_ready_cnt = ap_ready_cnt + 1;
            end
        end
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                finish_timestamp[finish_cnt] = clk_cnt;
                finish_cnt = finish_cnt + 1;
            end
        end
        -> report_progress;
    end
end

reg [31:0] progress_timeout;

initial begin : simulation_progress
    real intra_progress;
    wait (AESL_reset == 1);
    progress_timeout = PROGRESS_TIMEOUT;
    $display("////////////////////////////////////////////////////////////////////////////////////");
    $display("// Inter-Transaction Progress: Completed Transaction / Total Transaction");
    $display("// Intra-Transaction Progress: Measured Latency / Latency Estimation * 100%%");
    $display("//");
    $display("// RTL Simulation : \"Inter-Transaction Progress\" [\"Intra-Transaction Progress\"] @ \"Simulation Time\"");
    $display("////////////////////////////////////////////////////////////////////////////////////");
    print_progress();
    while (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
        @ (report_progress);
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                print_progress();
                progress_timeout = PROGRESS_TIMEOUT;
            end else begin
                if (progress_timeout == 0) begin
                    print_progress();
                    progress_timeout = PROGRESS_TIMEOUT;
                end else begin
                    progress_timeout = progress_timeout - 1;
                end
            end
        end
    end
    print_progress();
    $display("////////////////////////////////////////////////////////////////////////////////////");
    calculate_performance();
end

task get_intra_progress(output real intra_progress);
    begin
        if (start_cnt > finish_cnt) begin
            intra_progress = clk_cnt - start_timestamp[finish_cnt];
        end else if(finish_cnt > 0) begin
            intra_progress = LATENCY_ESTIMATION;
        end else begin
            intra_progress = 0;
        end
        intra_progress = intra_progress / LATENCY_ESTIMATION;
    end
endtask

task print_progress();
    real intra_progress;
    begin
        if (LATENCY_ESTIMATION > 0) begin
            get_intra_progress(intra_progress);
            $display("// RTL Simulation : %0d / %0d [%2.2f%%] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, intra_progress * 100, $time);
        end else begin
            $display("// RTL Simulation : %0d / %0d [n/a] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, $time);
        end
    end
endtask

task calculate_performance();
    integer i;
    integer fp;
    reg [31:0] latency [0:AUTOTB_TRANSACTION_NUM - 1];
    reg [31:0] latency_min;
    reg [31:0] latency_max;
    reg [31:0] latency_total;
    reg [31:0] latency_average;
    reg [31:0] interval [0:AUTOTB_TRANSACTION_NUM - 2];
    reg [31:0] interval_min;
    reg [31:0] interval_max;
    reg [31:0] interval_total;
    reg [31:0] interval_average;
    reg [31:0] total_execute_time;
    begin
        latency_min = -1;
        latency_max = 0;
        latency_total = 0;
        interval_min = -1;
        interval_max = 0;
        interval_total = 0;
        total_execute_time = lat_total;

        for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
            // calculate latency
            latency[i] = finish_timestamp[i] - start_timestamp[i];
            if (latency[i] > latency_max) latency_max = latency[i];
            if (latency[i] < latency_min) latency_min = latency[i];
            latency_total = latency_total + latency[i];
            // calculate interval
            if (AUTOTB_TRANSACTION_NUM == 1) begin
                interval[i] = 0;
                interval_max = 0;
                interval_min = 0;
                interval_total = 0;
            end else if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                interval[i] = start_timestamp[i + 1] - start_timestamp[i];
                if (interval[i] > interval_max) interval_max = interval[i];
                if (interval[i] < interval_min) interval_min = interval[i];
                interval_total = interval_total + interval[i];
            end
        end

        latency_average = latency_total / AUTOTB_TRANSACTION_NUM;
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            interval_average = 0;
        end else begin
            interval_average = interval_total / (AUTOTB_TRANSACTION_NUM - 1);
        end

        fp = $fopen(`AUTOTB_LAT_RESULT_FILE, "w");

        $fdisplay(fp, "$MAX_LATENCY = \"%0d\"", latency_max);
        $fdisplay(fp, "$MIN_LATENCY = \"%0d\"", latency_min);
        $fdisplay(fp, "$AVER_LATENCY = \"%0d\"", latency_average);
        $fdisplay(fp, "$MAX_THROUGHPUT = \"%0d\"", interval_max);
        $fdisplay(fp, "$MIN_THROUGHPUT = \"%0d\"", interval_min);
        $fdisplay(fp, "$AVER_THROUGHPUT = \"%0d\"", interval_average);
        $fdisplay(fp, "$TOTAL_EXECUTE_TIME = \"%0d\"", total_execute_time);

        $fclose(fp);

        fp = $fopen(`AUTOTB_PER_RESULT_TRANS_FILE, "w");

        $fdisplay(fp, "%20s%16s%16s", "", "latency", "interval");
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            i = 0;
            $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
        end else begin
            for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
                if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                    $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
                end else begin
                    $fdisplay(fp, "transaction%8d:%16d               x", i, latency[i]);
                end
            end
        end

        $fclose(fp);
    end
endtask


////////////////////////////////////////////
// Dependence Check
////////////////////////////////////////////

`ifndef POST_SYN

`endif
///////////////////////////////////////////////////////
// dataflow status monitor
///////////////////////////////////////////////////////
dataflow_monitor U_dataflow_monitor(
    .clock(AESL_clock),
    .reset(~rst),
    .finish(all_finish));

`include "fifo_para.vh"

endmodule
