// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Fri Jun  2 19:19:44 2023
// Host        : josh-All-Series running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/josh/caravel-soc_fpga/vivado/vvd_caravel_fpga/vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_ps_0_0/design_1_caravel_ps_0_0_sim_netlist.v
// Design      : design_1_caravel_ps_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_caravel_ps_0_0,caravel_ps,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "HLS" *) 
(* X_CORE_INFO = "caravel_ps,Vivado 2022.1" *) (* hls_module = "yes" *) 
(* NotValidForBitStream *)
module design_1_caravel_ps_0_0
   (s_axi_control_AWADDR,
    s_axi_control_AWVALID,
    s_axi_control_AWREADY,
    s_axi_control_WDATA,
    s_axi_control_WSTRB,
    s_axi_control_WVALID,
    s_axi_control_WREADY,
    s_axi_control_BRESP,
    s_axi_control_BVALID,
    s_axi_control_BREADY,
    s_axi_control_ARADDR,
    s_axi_control_ARVALID,
    s_axi_control_ARREADY,
    s_axi_control_RDATA,
    s_axi_control_RRESP,
    s_axi_control_RVALID,
    s_axi_control_RREADY,
    mprj_in,
    mprj_out,
    mprj_en,
    ap_clk,
    ap_rst_n);
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR" *) input [5:0]s_axi_control_AWADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID" *) input s_axi_control_AWVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY" *) output s_axi_control_AWREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WDATA" *) input [31:0]s_axi_control_WDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB" *) input [3:0]s_axi_control_WSTRB;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WVALID" *) input s_axi_control_WVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WREADY" *) output s_axi_control_WREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BRESP" *) output [1:0]s_axi_control_BRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BVALID" *) output s_axi_control_BVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BREADY" *) input s_axi_control_BREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR" *) input [5:0]s_axi_control_ARADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID" *) input s_axi_control_ARVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY" *) output s_axi_control_ARREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RDATA" *) output [31:0]s_axi_control_RDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RRESP" *) output [1:0]s_axi_control_RRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RVALID" *) output s_axi_control_RVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 6, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 10000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s_axi_control_RREADY;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 mprj_in DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME mprj_in, LAYERED_METADATA undef" *) output [37:0]mprj_in;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 mprj_out DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME mprj_out, LAYERED_METADATA undef" *) input [37:0]mprj_out;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 mprj_en DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME mprj_en, LAYERED_METADATA undef" *) input [37:0]mprj_en;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_control, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input ap_rst_n;

  wire \<const0> ;
  wire ap_clk;
  wire ap_rst_n;
  wire [37:0]mprj_en;
  wire [37:0]mprj_in;
  wire [37:0]mprj_out;
  wire [5:0]s_axi_control_ARADDR;
  wire s_axi_control_ARREADY;
  wire s_axi_control_ARVALID;
  wire [5:0]s_axi_control_AWADDR;
  wire s_axi_control_AWREADY;
  wire s_axi_control_AWVALID;
  wire s_axi_control_BREADY;
  wire s_axi_control_BVALID;
  wire [31:0]s_axi_control_RDATA;
  wire s_axi_control_RREADY;
  wire s_axi_control_RVALID;
  wire [31:0]s_axi_control_WDATA;
  wire s_axi_control_WREADY;
  wire [3:0]s_axi_control_WSTRB;
  wire s_axi_control_WVALID;
  wire [1:0]NLW_inst_s_axi_control_BRESP_UNCONNECTED;
  wire [1:0]NLW_inst_s_axi_control_RRESP_UNCONNECTED;

  assign s_axi_control_BRESP[1] = \<const0> ;
  assign s_axi_control_BRESP[0] = \<const0> ;
  assign s_axi_control_RRESP[1] = \<const0> ;
  assign s_axi_control_RRESP[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_S_AXI_CONTROL_ADDR_WIDTH = "6" *) 
  (* C_S_AXI_CONTROL_DATA_WIDTH = "32" *) 
  (* C_S_AXI_CONTROL_WSTRB_WIDTH = "4" *) 
  (* C_S_AXI_DATA_WIDTH = "32" *) 
  (* C_S_AXI_WSTRB_WIDTH = "4" *) 
  (* SDX_KERNEL = "true" *) 
  (* SDX_KERNEL_SYNTH_INST = "inst" *) 
  (* SDX_KERNEL_TYPE = "hls" *) 
  design_1_caravel_ps_0_0_caravel_ps inst
       (.ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .mprj_en(mprj_en),
        .mprj_in(mprj_in),
        .mprj_out(mprj_out),
        .s_axi_control_ARADDR(s_axi_control_ARADDR),
        .s_axi_control_ARREADY(s_axi_control_ARREADY),
        .s_axi_control_ARVALID(s_axi_control_ARVALID),
        .s_axi_control_AWADDR(s_axi_control_AWADDR),
        .s_axi_control_AWREADY(s_axi_control_AWREADY),
        .s_axi_control_AWVALID(s_axi_control_AWVALID),
        .s_axi_control_BREADY(s_axi_control_BREADY),
        .s_axi_control_BRESP(NLW_inst_s_axi_control_BRESP_UNCONNECTED[1:0]),
        .s_axi_control_BVALID(s_axi_control_BVALID),
        .s_axi_control_RDATA(s_axi_control_RDATA),
        .s_axi_control_RREADY(s_axi_control_RREADY),
        .s_axi_control_RRESP(NLW_inst_s_axi_control_RRESP_UNCONNECTED[1:0]),
        .s_axi_control_RVALID(s_axi_control_RVALID),
        .s_axi_control_WDATA(s_axi_control_WDATA),
        .s_axi_control_WREADY(s_axi_control_WREADY),
        .s_axi_control_WSTRB(s_axi_control_WSTRB),
        .s_axi_control_WVALID(s_axi_control_WVALID));
endmodule

(* C_S_AXI_CONTROL_ADDR_WIDTH = "6" *) (* C_S_AXI_CONTROL_DATA_WIDTH = "32" *) (* C_S_AXI_CONTROL_WSTRB_WIDTH = "4" *) 
(* C_S_AXI_DATA_WIDTH = "32" *) (* C_S_AXI_WSTRB_WIDTH = "4" *) (* ORIG_REF_NAME = "caravel_ps" *) 
(* hls_module = "yes" *) 
module design_1_caravel_ps_0_0_caravel_ps
   (mprj_in,
    mprj_out,
    mprj_en,
    s_axi_control_AWVALID,
    s_axi_control_AWREADY,
    s_axi_control_AWADDR,
    s_axi_control_WVALID,
    s_axi_control_WREADY,
    s_axi_control_WDATA,
    s_axi_control_WSTRB,
    s_axi_control_ARVALID,
    s_axi_control_ARREADY,
    s_axi_control_ARADDR,
    s_axi_control_RVALID,
    s_axi_control_RREADY,
    s_axi_control_RDATA,
    s_axi_control_RRESP,
    s_axi_control_BVALID,
    s_axi_control_BREADY,
    s_axi_control_BRESP,
    ap_clk,
    ap_rst_n);
  output [37:0]mprj_in;
  input [37:0]mprj_out;
  input [37:0]mprj_en;
  input s_axi_control_AWVALID;
  output s_axi_control_AWREADY;
  input [5:0]s_axi_control_AWADDR;
  input s_axi_control_WVALID;
  output s_axi_control_WREADY;
  input [31:0]s_axi_control_WDATA;
  input [3:0]s_axi_control_WSTRB;
  input s_axi_control_ARVALID;
  output s_axi_control_ARREADY;
  input [5:0]s_axi_control_ARADDR;
  output s_axi_control_RVALID;
  input s_axi_control_RREADY;
  output [31:0]s_axi_control_RDATA;
  output [1:0]s_axi_control_RRESP;
  output s_axi_control_BVALID;
  input s_axi_control_BREADY;
  output [1:0]s_axi_control_BRESP;
  input ap_clk;
  input ap_rst_n;

  wire \<const0> ;
  wire ap_clk;
  wire ap_rst_n;
  wire [37:0]mprj_en;
  wire [37:0]mprj_in;
  wire [37:0]mprj_out;
  wire [5:0]s_axi_control_ARADDR;
  wire s_axi_control_ARREADY;
  wire s_axi_control_ARVALID;
  wire [5:0]s_axi_control_AWADDR;
  wire s_axi_control_AWREADY;
  wire s_axi_control_AWVALID;
  wire s_axi_control_BREADY;
  wire s_axi_control_BVALID;
  wire [31:0]s_axi_control_RDATA;
  wire s_axi_control_RREADY;
  wire s_axi_control_RVALID;
  wire [31:0]s_axi_control_WDATA;
  wire s_axi_control_WREADY;
  wire [3:0]s_axi_control_WSTRB;
  wire s_axi_control_WVALID;

  assign s_axi_control_BRESP[1] = \<const0> ;
  assign s_axi_control_BRESP[0] = \<const0> ;
  assign s_axi_control_RRESP[1] = \<const0> ;
  assign s_axi_control_RRESP[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  design_1_caravel_ps_0_0_caravel_ps_control_s_axi control_s_axi_U
       (.\FSM_onehot_rstate_reg[1]_0 (s_axi_control_ARREADY),
        .\FSM_onehot_wstate_reg[1]_0 (s_axi_control_AWREADY),
        .\FSM_onehot_wstate_reg[2]_0 (s_axi_control_WREADY),
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .mprj_en(mprj_en),
        .mprj_in(mprj_in),
        .mprj_out(mprj_out),
        .s_axi_control_ARADDR(s_axi_control_ARADDR),
        .s_axi_control_ARVALID(s_axi_control_ARVALID),
        .s_axi_control_AWADDR(s_axi_control_AWADDR),
        .s_axi_control_AWVALID(s_axi_control_AWVALID),
        .s_axi_control_BREADY(s_axi_control_BREADY),
        .s_axi_control_BVALID(s_axi_control_BVALID),
        .s_axi_control_RDATA(s_axi_control_RDATA),
        .s_axi_control_RREADY(s_axi_control_RREADY),
        .s_axi_control_RVALID(s_axi_control_RVALID),
        .s_axi_control_WDATA(s_axi_control_WDATA),
        .s_axi_control_WSTRB(s_axi_control_WSTRB),
        .s_axi_control_WVALID(s_axi_control_WVALID));
endmodule

(* ORIG_REF_NAME = "caravel_ps_control_s_axi" *) 
module design_1_caravel_ps_0_0_caravel_ps_control_s_axi
   (s_axi_control_BVALID,
    \FSM_onehot_wstate_reg[2]_0 ,
    \FSM_onehot_wstate_reg[1]_0 ,
    s_axi_control_RVALID,
    \FSM_onehot_rstate_reg[1]_0 ,
    s_axi_control_RDATA,
    mprj_in,
    ap_clk,
    ap_rst_n,
    s_axi_control_AWADDR,
    mprj_out,
    mprj_en,
    s_axi_control_AWVALID,
    s_axi_control_BREADY,
    s_axi_control_WVALID,
    s_axi_control_ARVALID,
    s_axi_control_RREADY,
    s_axi_control_WDATA,
    s_axi_control_WSTRB,
    s_axi_control_ARADDR);
  output s_axi_control_BVALID;
  output \FSM_onehot_wstate_reg[2]_0 ;
  output \FSM_onehot_wstate_reg[1]_0 ;
  output s_axi_control_RVALID;
  output \FSM_onehot_rstate_reg[1]_0 ;
  output [31:0]s_axi_control_RDATA;
  output [37:0]mprj_in;
  input ap_clk;
  input ap_rst_n;
  input [5:0]s_axi_control_AWADDR;
  input [37:0]mprj_out;
  input [37:0]mprj_en;
  input s_axi_control_AWVALID;
  input s_axi_control_BREADY;
  input s_axi_control_WVALID;
  input s_axi_control_ARVALID;
  input s_axi_control_RREADY;
  input [31:0]s_axi_control_WDATA;
  input [3:0]s_axi_control_WSTRB;
  input [5:0]s_axi_control_ARADDR;

  wire \FSM_onehot_rstate[1]_i_1_n_0 ;
  wire \FSM_onehot_rstate[2]_i_1_n_0 ;
  wire \FSM_onehot_rstate_reg[1]_0 ;
  wire \FSM_onehot_wstate[1]_i_2_n_0 ;
  wire \FSM_onehot_wstate[2]_i_1_n_0 ;
  wire \FSM_onehot_wstate[3]_i_1_n_0 ;
  wire \FSM_onehot_wstate_reg[1]_0 ;
  wire \FSM_onehot_wstate_reg[2]_0 ;
  wire ap_clk;
  wire ap_rst_n;
  wire ap_rst_n_inv;
  wire ar_hs;
  wire [5:0]data3;
  wire [5:0]data6;
  wire \int_ps_mprj_en_reg_n_0_[0] ;
  wire \int_ps_mprj_en_reg_n_0_[10] ;
  wire \int_ps_mprj_en_reg_n_0_[11] ;
  wire \int_ps_mprj_en_reg_n_0_[12] ;
  wire \int_ps_mprj_en_reg_n_0_[13] ;
  wire \int_ps_mprj_en_reg_n_0_[14] ;
  wire \int_ps_mprj_en_reg_n_0_[15] ;
  wire \int_ps_mprj_en_reg_n_0_[16] ;
  wire \int_ps_mprj_en_reg_n_0_[17] ;
  wire \int_ps_mprj_en_reg_n_0_[18] ;
  wire \int_ps_mprj_en_reg_n_0_[19] ;
  wire \int_ps_mprj_en_reg_n_0_[1] ;
  wire \int_ps_mprj_en_reg_n_0_[20] ;
  wire \int_ps_mprj_en_reg_n_0_[21] ;
  wire \int_ps_mprj_en_reg_n_0_[22] ;
  wire \int_ps_mprj_en_reg_n_0_[23] ;
  wire \int_ps_mprj_en_reg_n_0_[24] ;
  wire \int_ps_mprj_en_reg_n_0_[25] ;
  wire \int_ps_mprj_en_reg_n_0_[26] ;
  wire \int_ps_mprj_en_reg_n_0_[27] ;
  wire \int_ps_mprj_en_reg_n_0_[28] ;
  wire \int_ps_mprj_en_reg_n_0_[29] ;
  wire \int_ps_mprj_en_reg_n_0_[2] ;
  wire \int_ps_mprj_en_reg_n_0_[30] ;
  wire \int_ps_mprj_en_reg_n_0_[31] ;
  wire \int_ps_mprj_en_reg_n_0_[3] ;
  wire \int_ps_mprj_en_reg_n_0_[4] ;
  wire \int_ps_mprj_en_reg_n_0_[5] ;
  wire \int_ps_mprj_en_reg_n_0_[6] ;
  wire \int_ps_mprj_en_reg_n_0_[7] ;
  wire \int_ps_mprj_en_reg_n_0_[8] ;
  wire \int_ps_mprj_en_reg_n_0_[9] ;
  wire int_ps_mprj_in;
  wire int_ps_mprj_in3_out;
  wire \int_ps_mprj_in[0]_i_1_n_0 ;
  wire \int_ps_mprj_in[10]_i_1_n_0 ;
  wire \int_ps_mprj_in[11]_i_1_n_0 ;
  wire \int_ps_mprj_in[12]_i_1_n_0 ;
  wire \int_ps_mprj_in[13]_i_1_n_0 ;
  wire \int_ps_mprj_in[14]_i_1_n_0 ;
  wire \int_ps_mprj_in[15]_i_1_n_0 ;
  wire \int_ps_mprj_in[16]_i_1_n_0 ;
  wire \int_ps_mprj_in[17]_i_1_n_0 ;
  wire \int_ps_mprj_in[18]_i_1_n_0 ;
  wire \int_ps_mprj_in[19]_i_1_n_0 ;
  wire \int_ps_mprj_in[1]_i_1_n_0 ;
  wire \int_ps_mprj_in[20]_i_1_n_0 ;
  wire \int_ps_mprj_in[21]_i_1_n_0 ;
  wire \int_ps_mprj_in[22]_i_1_n_0 ;
  wire \int_ps_mprj_in[23]_i_1_n_0 ;
  wire \int_ps_mprj_in[24]_i_1_n_0 ;
  wire \int_ps_mprj_in[25]_i_1_n_0 ;
  wire \int_ps_mprj_in[26]_i_1_n_0 ;
  wire \int_ps_mprj_in[27]_i_1_n_0 ;
  wire \int_ps_mprj_in[28]_i_1_n_0 ;
  wire \int_ps_mprj_in[29]_i_1_n_0 ;
  wire \int_ps_mprj_in[2]_i_1_n_0 ;
  wire \int_ps_mprj_in[30]_i_1_n_0 ;
  wire \int_ps_mprj_in[31]_i_2_n_0 ;
  wire \int_ps_mprj_in[31]_i_3_n_0 ;
  wire \int_ps_mprj_in[32]_i_1_n_0 ;
  wire \int_ps_mprj_in[33]_i_1_n_0 ;
  wire \int_ps_mprj_in[34]_i_1_n_0 ;
  wire \int_ps_mprj_in[35]_i_1_n_0 ;
  wire \int_ps_mprj_in[36]_i_1_n_0 ;
  wire \int_ps_mprj_in[37]_i_2_n_0 ;
  wire \int_ps_mprj_in[3]_i_1_n_0 ;
  wire \int_ps_mprj_in[4]_i_1_n_0 ;
  wire \int_ps_mprj_in[5]_i_1_n_0 ;
  wire \int_ps_mprj_in[6]_i_1_n_0 ;
  wire \int_ps_mprj_in[7]_i_1_n_0 ;
  wire \int_ps_mprj_in[8]_i_1_n_0 ;
  wire \int_ps_mprj_in[9]_i_1_n_0 ;
  wire \int_ps_mprj_in_reg_n_0_[0] ;
  wire \int_ps_mprj_in_reg_n_0_[37] ;
  wire int_ps_mprj_out_ap_vld;
  wire \int_ps_mprj_out_reg_n_0_[0] ;
  wire \int_ps_mprj_out_reg_n_0_[10] ;
  wire \int_ps_mprj_out_reg_n_0_[11] ;
  wire \int_ps_mprj_out_reg_n_0_[12] ;
  wire \int_ps_mprj_out_reg_n_0_[13] ;
  wire \int_ps_mprj_out_reg_n_0_[14] ;
  wire \int_ps_mprj_out_reg_n_0_[15] ;
  wire \int_ps_mprj_out_reg_n_0_[16] ;
  wire \int_ps_mprj_out_reg_n_0_[17] ;
  wire \int_ps_mprj_out_reg_n_0_[18] ;
  wire \int_ps_mprj_out_reg_n_0_[19] ;
  wire \int_ps_mprj_out_reg_n_0_[1] ;
  wire \int_ps_mprj_out_reg_n_0_[20] ;
  wire \int_ps_mprj_out_reg_n_0_[21] ;
  wire \int_ps_mprj_out_reg_n_0_[22] ;
  wire \int_ps_mprj_out_reg_n_0_[23] ;
  wire \int_ps_mprj_out_reg_n_0_[24] ;
  wire \int_ps_mprj_out_reg_n_0_[25] ;
  wire \int_ps_mprj_out_reg_n_0_[26] ;
  wire \int_ps_mprj_out_reg_n_0_[27] ;
  wire \int_ps_mprj_out_reg_n_0_[28] ;
  wire \int_ps_mprj_out_reg_n_0_[29] ;
  wire \int_ps_mprj_out_reg_n_0_[2] ;
  wire \int_ps_mprj_out_reg_n_0_[30] ;
  wire \int_ps_mprj_out_reg_n_0_[31] ;
  wire \int_ps_mprj_out_reg_n_0_[3] ;
  wire \int_ps_mprj_out_reg_n_0_[4] ;
  wire \int_ps_mprj_out_reg_n_0_[5] ;
  wire \int_ps_mprj_out_reg_n_0_[6] ;
  wire \int_ps_mprj_out_reg_n_0_[7] ;
  wire \int_ps_mprj_out_reg_n_0_[8] ;
  wire \int_ps_mprj_out_reg_n_0_[9] ;
  wire [37:0]mprj_en;
  wire [37:0]mprj_in;
  wire [37:0]mprj_out;
  wire [31:0]rdata;
  wire \rdata[0]_i_2_n_0 ;
  wire \rdata[0]_i_3_n_0 ;
  wire \rdata[0]_i_4_n_0 ;
  wire \rdata[0]_i_5_n_0 ;
  wire \rdata[1]_i_2_n_0 ;
  wire \rdata[1]_i_3_n_0 ;
  wire \rdata[2]_i_2_n_0 ;
  wire \rdata[2]_i_3_n_0 ;
  wire \rdata[31]_i_3_n_0 ;
  wire \rdata[31]_i_4_n_0 ;
  wire \rdata[31]_i_5_n_0 ;
  wire \rdata[3]_i_2_n_0 ;
  wire \rdata[3]_i_3_n_0 ;
  wire \rdata[4]_i_2_n_0 ;
  wire \rdata[4]_i_3_n_0 ;
  wire \rdata[5]_i_2_n_0 ;
  wire \rdata[5]_i_3_n_0 ;
  wire \rdata[5]_i_4_n_0 ;
  wire \rdata[5]_i_5_n_0 ;
  wire \rdata[5]_i_6_n_0 ;
  wire [5:0]s_axi_control_ARADDR;
  wire s_axi_control_ARVALID;
  wire [5:0]s_axi_control_AWADDR;
  wire s_axi_control_AWVALID;
  wire s_axi_control_BREADY;
  wire s_axi_control_BVALID;
  wire [31:0]s_axi_control_RDATA;
  wire s_axi_control_RREADY;
  wire s_axi_control_RVALID;
  wire [31:0]s_axi_control_WDATA;
  wire [3:0]s_axi_control_WSTRB;
  wire s_axi_control_WVALID;
  wire tmp_100_fu_1263_p3;
  wire tmp_103_fu_1295_p3;
  wire tmp_106_fu_1327_p3;
  wire tmp_10_fu_303_p3;
  wire tmp_13_fu_335_p3;
  wire tmp_16_fu_367_p3;
  wire tmp_19_fu_399_p3;
  wire tmp_1_fu_207_p3;
  wire tmp_22_fu_431_p3;
  wire tmp_25_fu_463_p3;
  wire tmp_28_fu_495_p3;
  wire tmp_31_fu_527_p3;
  wire tmp_34_fu_559_p3;
  wire tmp_37_fu_591_p3;
  wire tmp_40_fu_623_p3;
  wire tmp_43_fu_655_p3;
  wire tmp_46_fu_687_p3;
  wire tmp_49_fu_719_p3;
  wire tmp_4_fu_239_p3;
  wire tmp_52_fu_751_p3;
  wire tmp_55_fu_783_p3;
  wire tmp_58_fu_815_p3;
  wire tmp_61_fu_847_p3;
  wire tmp_64_fu_879_p3;
  wire tmp_67_fu_911_p3;
  wire tmp_70_fu_943_p3;
  wire tmp_73_fu_975_p3;
  wire tmp_76_fu_1007_p3;
  wire tmp_79_fu_1039_p3;
  wire tmp_7_fu_271_p3;
  wire tmp_82_fu_1071_p3;
  wire tmp_85_fu_1103_p3;
  wire tmp_88_fu_1135_p3;
  wire tmp_91_fu_1167_p3;
  wire tmp_94_fu_1199_p3;
  wire tmp_97_fu_1231_p3;
  wire waddr;
  wire \waddr_reg_n_0_[0] ;
  wire \waddr_reg_n_0_[1] ;
  wire \waddr_reg_n_0_[2] ;
  wire \waddr_reg_n_0_[3] ;
  wire \waddr_reg_n_0_[4] ;
  wire \waddr_reg_n_0_[5] ;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hF747)) 
    \FSM_onehot_rstate[1]_i_1 
       (.I0(s_axi_control_ARVALID),
        .I1(\FSM_onehot_rstate_reg[1]_0 ),
        .I2(s_axi_control_RVALID),
        .I3(s_axi_control_RREADY),
        .O(\FSM_onehot_rstate[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_rstate[2]_i_1 
       (.I0(s_axi_control_ARVALID),
        .I1(\FSM_onehot_rstate_reg[1]_0 ),
        .I2(s_axi_control_RREADY),
        .I3(s_axi_control_RVALID),
        .O(\FSM_onehot_rstate[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "RDIDLE:010,RDDATA:100,iSTATE:001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_rstate_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_rstate[1]_i_1_n_0 ),
        .Q(\FSM_onehot_rstate_reg[1]_0 ),
        .R(ap_rst_n_inv));
  (* FSM_ENCODED_STATES = "RDIDLE:010,RDDATA:100,iSTATE:001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_rstate_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_rstate[2]_i_1_n_0 ),
        .Q(s_axi_control_RVALID),
        .R(ap_rst_n_inv));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_wstate[1]_i_1 
       (.I0(ap_rst_n),
        .O(ap_rst_n_inv));
  LUT5 #(
    .INIT(32'h8F888FBB)) 
    \FSM_onehot_wstate[1]_i_2 
       (.I0(s_axi_control_BREADY),
        .I1(s_axi_control_BVALID),
        .I2(s_axi_control_AWVALID),
        .I3(\FSM_onehot_wstate_reg[1]_0 ),
        .I4(\FSM_onehot_wstate_reg[2]_0 ),
        .O(\FSM_onehot_wstate[1]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \FSM_onehot_wstate[2]_i_1 
       (.I0(s_axi_control_AWVALID),
        .I1(\FSM_onehot_wstate_reg[1]_0 ),
        .I2(\FSM_onehot_wstate_reg[2]_0 ),
        .I3(s_axi_control_WVALID),
        .O(\FSM_onehot_wstate[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF444)) 
    \FSM_onehot_wstate[3]_i_1 
       (.I0(s_axi_control_BREADY),
        .I1(s_axi_control_BVALID),
        .I2(s_axi_control_WVALID),
        .I3(\FSM_onehot_wstate_reg[2]_0 ),
        .O(\FSM_onehot_wstate[3]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_wstate[1]_i_2_n_0 ),
        .Q(\FSM_onehot_wstate_reg[1]_0 ),
        .R(ap_rst_n_inv));
  (* FSM_ENCODED_STATES = "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_wstate[2]_i_1_n_0 ),
        .Q(\FSM_onehot_wstate_reg[2]_0 ),
        .R(ap_rst_n_inv));
  (* FSM_ENCODED_STATES = "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[3] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_wstate[3]_i_1_n_0 ),
        .Q(s_axi_control_BVALID),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[0]),
        .Q(\int_ps_mprj_en_reg_n_0_[0] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[10] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[10]),
        .Q(\int_ps_mprj_en_reg_n_0_[10] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[11] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[11]),
        .Q(\int_ps_mprj_en_reg_n_0_[11] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[12] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[12]),
        .Q(\int_ps_mprj_en_reg_n_0_[12] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[13] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[13]),
        .Q(\int_ps_mprj_en_reg_n_0_[13] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[14] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[14]),
        .Q(\int_ps_mprj_en_reg_n_0_[14] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[15] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[15]),
        .Q(\int_ps_mprj_en_reg_n_0_[15] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[16] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[16]),
        .Q(\int_ps_mprj_en_reg_n_0_[16] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[17] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[17]),
        .Q(\int_ps_mprj_en_reg_n_0_[17] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[18] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[18]),
        .Q(\int_ps_mprj_en_reg_n_0_[18] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[19] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[19]),
        .Q(\int_ps_mprj_en_reg_n_0_[19] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[1]),
        .Q(\int_ps_mprj_en_reg_n_0_[1] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[20] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[20]),
        .Q(\int_ps_mprj_en_reg_n_0_[20] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[21] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[21]),
        .Q(\int_ps_mprj_en_reg_n_0_[21] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[22] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[22]),
        .Q(\int_ps_mprj_en_reg_n_0_[22] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[23] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[23]),
        .Q(\int_ps_mprj_en_reg_n_0_[23] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[24] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[24]),
        .Q(\int_ps_mprj_en_reg_n_0_[24] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[25] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[25]),
        .Q(\int_ps_mprj_en_reg_n_0_[25] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[26] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[26]),
        .Q(\int_ps_mprj_en_reg_n_0_[26] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[27] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[27]),
        .Q(\int_ps_mprj_en_reg_n_0_[27] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[28] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[28]),
        .Q(\int_ps_mprj_en_reg_n_0_[28] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[29] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[29]),
        .Q(\int_ps_mprj_en_reg_n_0_[29] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[2]),
        .Q(\int_ps_mprj_en_reg_n_0_[2] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[30] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[30]),
        .Q(\int_ps_mprj_en_reg_n_0_[30] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[31] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[31]),
        .Q(\int_ps_mprj_en_reg_n_0_[31] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[32] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[32]),
        .Q(data6[0]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[33] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[33]),
        .Q(data6[1]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[34] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[34]),
        .Q(data6[2]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[35] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[35]),
        .Q(data6[3]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[36] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[36]),
        .Q(data6[4]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[37] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[37]),
        .Q(data6[5]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[3] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[3]),
        .Q(\int_ps_mprj_en_reg_n_0_[3] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[4] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[4]),
        .Q(\int_ps_mprj_en_reg_n_0_[4] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[5] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[5]),
        .Q(\int_ps_mprj_en_reg_n_0_[5] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[6] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[6]),
        .Q(\int_ps_mprj_en_reg_n_0_[6] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[7] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[7]),
        .Q(\int_ps_mprj_en_reg_n_0_[7] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[8] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[8]),
        .Q(\int_ps_mprj_en_reg_n_0_[8] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_en_reg[9] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_en[9]),
        .Q(\int_ps_mprj_en_reg_n_0_[9] ),
        .R(ap_rst_n_inv));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[0]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_ps_mprj_in_reg_n_0_[0] ),
        .O(\int_ps_mprj_in[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[10]_i_1 
       (.I0(s_axi_control_WDATA[10]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(tmp_28_fu_495_p3),
        .O(\int_ps_mprj_in[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[11]_i_1 
       (.I0(s_axi_control_WDATA[11]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(tmp_31_fu_527_p3),
        .O(\int_ps_mprj_in[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[12]_i_1 
       (.I0(s_axi_control_WDATA[12]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(tmp_34_fu_559_p3),
        .O(\int_ps_mprj_in[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[13]_i_1 
       (.I0(s_axi_control_WDATA[13]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(tmp_37_fu_591_p3),
        .O(\int_ps_mprj_in[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[14]_i_1 
       (.I0(s_axi_control_WDATA[14]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(tmp_40_fu_623_p3),
        .O(\int_ps_mprj_in[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[15]_i_1 
       (.I0(s_axi_control_WDATA[15]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(tmp_43_fu_655_p3),
        .O(\int_ps_mprj_in[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[16]_i_1 
       (.I0(s_axi_control_WDATA[16]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(tmp_46_fu_687_p3),
        .O(\int_ps_mprj_in[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[17]_i_1 
       (.I0(s_axi_control_WDATA[17]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(tmp_49_fu_719_p3),
        .O(\int_ps_mprj_in[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[18]_i_1 
       (.I0(s_axi_control_WDATA[18]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(tmp_52_fu_751_p3),
        .O(\int_ps_mprj_in[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[19]_i_1 
       (.I0(s_axi_control_WDATA[19]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(tmp_55_fu_783_p3),
        .O(\int_ps_mprj_in[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[1]_i_1 
       (.I0(s_axi_control_WDATA[1]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(tmp_1_fu_207_p3),
        .O(\int_ps_mprj_in[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[20]_i_1 
       (.I0(s_axi_control_WDATA[20]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(tmp_58_fu_815_p3),
        .O(\int_ps_mprj_in[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[21]_i_1 
       (.I0(s_axi_control_WDATA[21]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(tmp_61_fu_847_p3),
        .O(\int_ps_mprj_in[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[22]_i_1 
       (.I0(s_axi_control_WDATA[22]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(tmp_64_fu_879_p3),
        .O(\int_ps_mprj_in[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[23]_i_1 
       (.I0(s_axi_control_WDATA[23]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(tmp_67_fu_911_p3),
        .O(\int_ps_mprj_in[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[24]_i_1 
       (.I0(s_axi_control_WDATA[24]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(tmp_70_fu_943_p3),
        .O(\int_ps_mprj_in[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[25]_i_1 
       (.I0(s_axi_control_WDATA[25]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(tmp_73_fu_975_p3),
        .O(\int_ps_mprj_in[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[26]_i_1 
       (.I0(s_axi_control_WDATA[26]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(tmp_76_fu_1007_p3),
        .O(\int_ps_mprj_in[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[27]_i_1 
       (.I0(s_axi_control_WDATA[27]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(tmp_79_fu_1039_p3),
        .O(\int_ps_mprj_in[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[28]_i_1 
       (.I0(s_axi_control_WDATA[28]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(tmp_82_fu_1071_p3),
        .O(\int_ps_mprj_in[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[29]_i_1 
       (.I0(s_axi_control_WDATA[29]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(tmp_85_fu_1103_p3),
        .O(\int_ps_mprj_in[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[2]_i_1 
       (.I0(s_axi_control_WDATA[2]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(tmp_4_fu_239_p3),
        .O(\int_ps_mprj_in[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[30]_i_1 
       (.I0(s_axi_control_WDATA[30]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(tmp_88_fu_1135_p3),
        .O(\int_ps_mprj_in[30]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \int_ps_mprj_in[31]_i_1 
       (.I0(\FSM_onehot_wstate_reg[2]_0 ),
        .I1(\int_ps_mprj_in[31]_i_3_n_0 ),
        .I2(\waddr_reg_n_0_[2] ),
        .O(int_ps_mprj_in3_out));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[31]_i_2 
       (.I0(s_axi_control_WDATA[31]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(tmp_91_fu_1167_p3),
        .O(\int_ps_mprj_in[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000001000000000)) 
    \int_ps_mprj_in[31]_i_3 
       (.I0(\waddr_reg_n_0_[1] ),
        .I1(\waddr_reg_n_0_[0] ),
        .I2(\waddr_reg_n_0_[4] ),
        .I3(\waddr_reg_n_0_[3] ),
        .I4(\waddr_reg_n_0_[5] ),
        .I5(s_axi_control_WVALID),
        .O(\int_ps_mprj_in[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[32]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(tmp_94_fu_1199_p3),
        .O(\int_ps_mprj_in[32]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[33]_i_1 
       (.I0(s_axi_control_WDATA[1]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(tmp_97_fu_1231_p3),
        .O(\int_ps_mprj_in[33]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[34]_i_1 
       (.I0(s_axi_control_WDATA[2]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(tmp_100_fu_1263_p3),
        .O(\int_ps_mprj_in[34]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[35]_i_1 
       (.I0(s_axi_control_WDATA[3]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(tmp_103_fu_1295_p3),
        .O(\int_ps_mprj_in[35]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[36]_i_1 
       (.I0(s_axi_control_WDATA[4]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(tmp_106_fu_1327_p3),
        .O(\int_ps_mprj_in[36]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \int_ps_mprj_in[37]_i_1 
       (.I0(\FSM_onehot_wstate_reg[2]_0 ),
        .I1(\int_ps_mprj_in[31]_i_3_n_0 ),
        .I2(\waddr_reg_n_0_[2] ),
        .O(int_ps_mprj_in));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[37]_i_2 
       (.I0(s_axi_control_WDATA[5]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_ps_mprj_in_reg_n_0_[37] ),
        .O(\int_ps_mprj_in[37]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[3]_i_1 
       (.I0(s_axi_control_WDATA[3]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(tmp_7_fu_271_p3),
        .O(\int_ps_mprj_in[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[4]_i_1 
       (.I0(s_axi_control_WDATA[4]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(tmp_10_fu_303_p3),
        .O(\int_ps_mprj_in[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[5]_i_1 
       (.I0(s_axi_control_WDATA[5]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(tmp_13_fu_335_p3),
        .O(\int_ps_mprj_in[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[6]_i_1 
       (.I0(s_axi_control_WDATA[6]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(tmp_16_fu_367_p3),
        .O(\int_ps_mprj_in[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[7]_i_1 
       (.I0(s_axi_control_WDATA[7]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(tmp_19_fu_399_p3),
        .O(\int_ps_mprj_in[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[8]_i_1 
       (.I0(s_axi_control_WDATA[8]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(tmp_22_fu_431_p3),
        .O(\int_ps_mprj_in[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ps_mprj_in[9]_i_1 
       (.I0(s_axi_control_WDATA[9]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(tmp_25_fu_463_p3),
        .O(\int_ps_mprj_in[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[0] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[0]_i_1_n_0 ),
        .Q(\int_ps_mprj_in_reg_n_0_[0] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[10] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[10]_i_1_n_0 ),
        .Q(tmp_28_fu_495_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[11] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[11]_i_1_n_0 ),
        .Q(tmp_31_fu_527_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[12] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[12]_i_1_n_0 ),
        .Q(tmp_34_fu_559_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[13] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[13]_i_1_n_0 ),
        .Q(tmp_37_fu_591_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[14] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[14]_i_1_n_0 ),
        .Q(tmp_40_fu_623_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[15] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[15]_i_1_n_0 ),
        .Q(tmp_43_fu_655_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[16] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[16]_i_1_n_0 ),
        .Q(tmp_46_fu_687_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[17] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[17]_i_1_n_0 ),
        .Q(tmp_49_fu_719_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[18] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[18]_i_1_n_0 ),
        .Q(tmp_52_fu_751_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[19] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[19]_i_1_n_0 ),
        .Q(tmp_55_fu_783_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[1] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[1]_i_1_n_0 ),
        .Q(tmp_1_fu_207_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[20] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[20]_i_1_n_0 ),
        .Q(tmp_58_fu_815_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[21] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[21]_i_1_n_0 ),
        .Q(tmp_61_fu_847_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[22] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[22]_i_1_n_0 ),
        .Q(tmp_64_fu_879_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[23] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[23]_i_1_n_0 ),
        .Q(tmp_67_fu_911_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[24] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[24]_i_1_n_0 ),
        .Q(tmp_70_fu_943_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[25] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[25]_i_1_n_0 ),
        .Q(tmp_73_fu_975_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[26] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[26]_i_1_n_0 ),
        .Q(tmp_76_fu_1007_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[27] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[27]_i_1_n_0 ),
        .Q(tmp_79_fu_1039_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[28] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[28]_i_1_n_0 ),
        .Q(tmp_82_fu_1071_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[29] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[29]_i_1_n_0 ),
        .Q(tmp_85_fu_1103_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[2] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[2]_i_1_n_0 ),
        .Q(tmp_4_fu_239_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[30] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[30]_i_1_n_0 ),
        .Q(tmp_88_fu_1135_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[31] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[31]_i_2_n_0 ),
        .Q(tmp_91_fu_1167_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[32] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in),
        .D(\int_ps_mprj_in[32]_i_1_n_0 ),
        .Q(tmp_94_fu_1199_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[33] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in),
        .D(\int_ps_mprj_in[33]_i_1_n_0 ),
        .Q(tmp_97_fu_1231_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[34] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in),
        .D(\int_ps_mprj_in[34]_i_1_n_0 ),
        .Q(tmp_100_fu_1263_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[35] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in),
        .D(\int_ps_mprj_in[35]_i_1_n_0 ),
        .Q(tmp_103_fu_1295_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[36] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in),
        .D(\int_ps_mprj_in[36]_i_1_n_0 ),
        .Q(tmp_106_fu_1327_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[37] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in),
        .D(\int_ps_mprj_in[37]_i_2_n_0 ),
        .Q(\int_ps_mprj_in_reg_n_0_[37] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[3] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[3]_i_1_n_0 ),
        .Q(tmp_7_fu_271_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[4] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[4]_i_1_n_0 ),
        .Q(tmp_10_fu_303_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[5] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[5]_i_1_n_0 ),
        .Q(tmp_13_fu_335_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[6] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[6]_i_1_n_0 ),
        .Q(tmp_16_fu_367_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[7] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[7]_i_1_n_0 ),
        .Q(tmp_19_fu_399_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[8] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[8]_i_1_n_0 ),
        .Q(tmp_22_fu_431_p3),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_in_reg[9] 
       (.C(ap_clk),
        .CE(int_ps_mprj_in3_out),
        .D(\int_ps_mprj_in[9]_i_1_n_0 ),
        .Q(tmp_25_fu_463_p3),
        .R(ap_rst_n_inv));
  FDRE int_ps_mprj_out_ap_vld_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(1'b1),
        .Q(int_ps_mprj_out_ap_vld),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[0]),
        .Q(\int_ps_mprj_out_reg_n_0_[0] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[10] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[10]),
        .Q(\int_ps_mprj_out_reg_n_0_[10] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[11] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[11]),
        .Q(\int_ps_mprj_out_reg_n_0_[11] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[12] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[12]),
        .Q(\int_ps_mprj_out_reg_n_0_[12] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[13] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[13]),
        .Q(\int_ps_mprj_out_reg_n_0_[13] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[14] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[14]),
        .Q(\int_ps_mprj_out_reg_n_0_[14] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[15] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[15]),
        .Q(\int_ps_mprj_out_reg_n_0_[15] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[16] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[16]),
        .Q(\int_ps_mprj_out_reg_n_0_[16] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[17] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[17]),
        .Q(\int_ps_mprj_out_reg_n_0_[17] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[18] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[18]),
        .Q(\int_ps_mprj_out_reg_n_0_[18] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[19] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[19]),
        .Q(\int_ps_mprj_out_reg_n_0_[19] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[1]),
        .Q(\int_ps_mprj_out_reg_n_0_[1] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[20] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[20]),
        .Q(\int_ps_mprj_out_reg_n_0_[20] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[21] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[21]),
        .Q(\int_ps_mprj_out_reg_n_0_[21] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[22] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[22]),
        .Q(\int_ps_mprj_out_reg_n_0_[22] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[23] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[23]),
        .Q(\int_ps_mprj_out_reg_n_0_[23] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[24] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[24]),
        .Q(\int_ps_mprj_out_reg_n_0_[24] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[25] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[25]),
        .Q(\int_ps_mprj_out_reg_n_0_[25] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[26] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[26]),
        .Q(\int_ps_mprj_out_reg_n_0_[26] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[27] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[27]),
        .Q(\int_ps_mprj_out_reg_n_0_[27] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[28] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[28]),
        .Q(\int_ps_mprj_out_reg_n_0_[28] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[29] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[29]),
        .Q(\int_ps_mprj_out_reg_n_0_[29] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[2]),
        .Q(\int_ps_mprj_out_reg_n_0_[2] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[30] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[30]),
        .Q(\int_ps_mprj_out_reg_n_0_[30] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[31] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[31]),
        .Q(\int_ps_mprj_out_reg_n_0_[31] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[32] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[32]),
        .Q(data3[0]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[33] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[33]),
        .Q(data3[1]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[34] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[34]),
        .Q(data3[2]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[35] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[35]),
        .Q(data3[3]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[36] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[36]),
        .Q(data3[4]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[37] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[37]),
        .Q(data3[5]),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[3] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[3]),
        .Q(\int_ps_mprj_out_reg_n_0_[3] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[4] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[4]),
        .Q(\int_ps_mprj_out_reg_n_0_[4] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[5] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[5]),
        .Q(\int_ps_mprj_out_reg_n_0_[5] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[6] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[6]),
        .Q(\int_ps_mprj_out_reg_n_0_[6] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[7] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[7]),
        .Q(\int_ps_mprj_out_reg_n_0_[7] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[8] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[8]),
        .Q(\int_ps_mprj_out_reg_n_0_[8] ),
        .R(ap_rst_n_inv));
  FDRE #(
    .INIT(1'b0)) 
    \int_ps_mprj_out_reg[9] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(mprj_out[9]),
        .Q(\int_ps_mprj_out_reg_n_0_[9] ),
        .R(ap_rst_n_inv));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[0]_INST_0 
       (.I0(mprj_out[0]),
        .I1(mprj_en[0]),
        .I2(\int_ps_mprj_in_reg_n_0_[0] ),
        .O(mprj_in[0]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[10]_INST_0 
       (.I0(mprj_out[10]),
        .I1(mprj_en[10]),
        .I2(tmp_28_fu_495_p3),
        .O(mprj_in[10]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[11]_INST_0 
       (.I0(mprj_out[11]),
        .I1(mprj_en[11]),
        .I2(tmp_31_fu_527_p3),
        .O(mprj_in[11]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[12]_INST_0 
       (.I0(mprj_out[12]),
        .I1(mprj_en[12]),
        .I2(tmp_34_fu_559_p3),
        .O(mprj_in[12]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[13]_INST_0 
       (.I0(mprj_out[13]),
        .I1(mprj_en[13]),
        .I2(tmp_37_fu_591_p3),
        .O(mprj_in[13]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[14]_INST_0 
       (.I0(mprj_out[14]),
        .I1(mprj_en[14]),
        .I2(tmp_40_fu_623_p3),
        .O(mprj_in[14]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[15]_INST_0 
       (.I0(mprj_out[15]),
        .I1(mprj_en[15]),
        .I2(tmp_43_fu_655_p3),
        .O(mprj_in[15]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[16]_INST_0 
       (.I0(mprj_out[16]),
        .I1(mprj_en[16]),
        .I2(tmp_46_fu_687_p3),
        .O(mprj_in[16]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[17]_INST_0 
       (.I0(mprj_out[17]),
        .I1(mprj_en[17]),
        .I2(tmp_49_fu_719_p3),
        .O(mprj_in[17]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[18]_INST_0 
       (.I0(mprj_out[18]),
        .I1(mprj_en[18]),
        .I2(tmp_52_fu_751_p3),
        .O(mprj_in[18]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[19]_INST_0 
       (.I0(mprj_out[19]),
        .I1(mprj_en[19]),
        .I2(tmp_55_fu_783_p3),
        .O(mprj_in[19]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[1]_INST_0 
       (.I0(mprj_out[1]),
        .I1(mprj_en[1]),
        .I2(tmp_1_fu_207_p3),
        .O(mprj_in[1]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[20]_INST_0 
       (.I0(mprj_out[20]),
        .I1(mprj_en[20]),
        .I2(tmp_58_fu_815_p3),
        .O(mprj_in[20]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[21]_INST_0 
       (.I0(mprj_out[21]),
        .I1(mprj_en[21]),
        .I2(tmp_61_fu_847_p3),
        .O(mprj_in[21]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[22]_INST_0 
       (.I0(mprj_out[22]),
        .I1(mprj_en[22]),
        .I2(tmp_64_fu_879_p3),
        .O(mprj_in[22]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[23]_INST_0 
       (.I0(mprj_out[23]),
        .I1(mprj_en[23]),
        .I2(tmp_67_fu_911_p3),
        .O(mprj_in[23]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[24]_INST_0 
       (.I0(mprj_out[24]),
        .I1(mprj_en[24]),
        .I2(tmp_70_fu_943_p3),
        .O(mprj_in[24]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[25]_INST_0 
       (.I0(mprj_out[25]),
        .I1(mprj_en[25]),
        .I2(tmp_73_fu_975_p3),
        .O(mprj_in[25]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[26]_INST_0 
       (.I0(mprj_out[26]),
        .I1(mprj_en[26]),
        .I2(tmp_76_fu_1007_p3),
        .O(mprj_in[26]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[27]_INST_0 
       (.I0(mprj_out[27]),
        .I1(mprj_en[27]),
        .I2(tmp_79_fu_1039_p3),
        .O(mprj_in[27]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[28]_INST_0 
       (.I0(mprj_out[28]),
        .I1(mprj_en[28]),
        .I2(tmp_82_fu_1071_p3),
        .O(mprj_in[28]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[29]_INST_0 
       (.I0(mprj_out[29]),
        .I1(mprj_en[29]),
        .I2(tmp_85_fu_1103_p3),
        .O(mprj_in[29]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[2]_INST_0 
       (.I0(mprj_out[2]),
        .I1(mprj_en[2]),
        .I2(tmp_4_fu_239_p3),
        .O(mprj_in[2]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[30]_INST_0 
       (.I0(mprj_out[30]),
        .I1(mprj_en[30]),
        .I2(tmp_88_fu_1135_p3),
        .O(mprj_in[30]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[31]_INST_0 
       (.I0(mprj_out[31]),
        .I1(mprj_en[31]),
        .I2(tmp_91_fu_1167_p3),
        .O(mprj_in[31]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[32]_INST_0 
       (.I0(mprj_out[32]),
        .I1(mprj_en[32]),
        .I2(tmp_94_fu_1199_p3),
        .O(mprj_in[32]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[33]_INST_0 
       (.I0(mprj_out[33]),
        .I1(mprj_en[33]),
        .I2(tmp_97_fu_1231_p3),
        .O(mprj_in[33]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[34]_INST_0 
       (.I0(mprj_out[34]),
        .I1(mprj_en[34]),
        .I2(tmp_100_fu_1263_p3),
        .O(mprj_in[34]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[35]_INST_0 
       (.I0(mprj_out[35]),
        .I1(mprj_en[35]),
        .I2(tmp_103_fu_1295_p3),
        .O(mprj_in[35]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[36]_INST_0 
       (.I0(mprj_out[36]),
        .I1(mprj_en[36]),
        .I2(tmp_106_fu_1327_p3),
        .O(mprj_in[36]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[37]_INST_0 
       (.I0(mprj_out[37]),
        .I1(mprj_en[37]),
        .I2(\int_ps_mprj_in_reg_n_0_[37] ),
        .O(mprj_in[37]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[3]_INST_0 
       (.I0(mprj_out[3]),
        .I1(mprj_en[3]),
        .I2(tmp_7_fu_271_p3),
        .O(mprj_in[3]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[4]_INST_0 
       (.I0(mprj_out[4]),
        .I1(mprj_en[4]),
        .I2(tmp_10_fu_303_p3),
        .O(mprj_in[4]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[5]_INST_0 
       (.I0(mprj_out[5]),
        .I1(mprj_en[5]),
        .I2(tmp_13_fu_335_p3),
        .O(mprj_in[5]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[6]_INST_0 
       (.I0(mprj_out[6]),
        .I1(mprj_en[6]),
        .I2(tmp_16_fu_367_p3),
        .O(mprj_in[6]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[7]_INST_0 
       (.I0(mprj_out[7]),
        .I1(mprj_en[7]),
        .I2(tmp_19_fu_399_p3),
        .O(mprj_in[7]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[8]_INST_0 
       (.I0(mprj_out[8]),
        .I1(mprj_en[8]),
        .I2(tmp_22_fu_431_p3),
        .O(mprj_in[8]));
  LUT3 #(
    .INIT(8'hB8)) 
    \mprj_in[9]_INST_0 
       (.I0(mprj_out[9]),
        .I1(mprj_en[9]),
        .I2(tmp_25_fu_463_p3),
        .O(mprj_in[9]));
  LUT3 #(
    .INIT(8'hFE)) 
    \rdata[0]_i_1 
       (.I0(\rdata[0]_i_2_n_0 ),
        .I1(\rdata[0]_i_3_n_0 ),
        .I2(\rdata[0]_i_4_n_0 ),
        .O(rdata[0]));
  LUT6 #(
    .INIT(64'h8008000000000000)) 
    \rdata[0]_i_2 
       (.I0(\rdata[0]_i_5_n_0 ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(s_axi_control_ARADDR[3]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(int_ps_mprj_out_ap_vld),
        .I5(s_axi_control_ARADDR[2]),
        .O(\rdata[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[0]_i_3 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(\int_ps_mprj_in_reg_n_0_[0] ),
        .I2(\rdata[5]_i_6_n_0 ),
        .I3(tmp_94_fu_1199_p3),
        .I4(\int_ps_mprj_out_reg_n_0_[0] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(\rdata[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[0]_i_4 
       (.I0(\rdata[5]_i_4_n_0 ),
        .I1(data3[0]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[0] ),
        .I4(data6[0]),
        .I5(\rdata[5]_i_5_n_0 ),
        .O(\rdata[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \rdata[0]_i_5 
       (.I0(s_axi_control_ARADDR[0]),
        .I1(s_axi_control_ARADDR[1]),
        .O(\rdata[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[10]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_28_fu_495_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[10] ),
        .I4(\int_ps_mprj_out_reg_n_0_[10] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[10]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[11]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_31_fu_527_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[11] ),
        .I4(\int_ps_mprj_out_reg_n_0_[11] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[11]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[12]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_34_fu_559_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[12] ),
        .I4(\int_ps_mprj_out_reg_n_0_[12] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[12]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[13]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_37_fu_591_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[13] ),
        .I4(\int_ps_mprj_out_reg_n_0_[13] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[13]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[14]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_40_fu_623_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[14] ),
        .I4(\int_ps_mprj_out_reg_n_0_[14] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[14]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[15]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_43_fu_655_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[15] ),
        .I4(\int_ps_mprj_out_reg_n_0_[15] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[15]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[16]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_46_fu_687_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[16] ),
        .I4(\int_ps_mprj_out_reg_n_0_[16] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[16]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[17]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_49_fu_719_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[17] ),
        .I4(\int_ps_mprj_out_reg_n_0_[17] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[17]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[18]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_52_fu_751_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[18] ),
        .I4(\int_ps_mprj_out_reg_n_0_[18] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[18]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[19]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_55_fu_783_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[19] ),
        .I4(\int_ps_mprj_out_reg_n_0_[19] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[19]));
  LUT2 #(
    .INIT(4'hE)) 
    \rdata[1]_i_1 
       (.I0(\rdata[1]_i_2_n_0 ),
        .I1(\rdata[1]_i_3_n_0 ),
        .O(rdata[1]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[1]_i_2 
       (.I0(\rdata[5]_i_4_n_0 ),
        .I1(data3[1]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[1] ),
        .I4(data6[1]),
        .I5(\rdata[5]_i_5_n_0 ),
        .O(\rdata[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[1]_i_3 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_1_fu_207_p3),
        .I2(\rdata[5]_i_6_n_0 ),
        .I3(tmp_97_fu_1231_p3),
        .I4(\int_ps_mprj_out_reg_n_0_[1] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(\rdata[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[20]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_58_fu_815_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[20] ),
        .I4(\int_ps_mprj_out_reg_n_0_[20] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[20]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[21]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_61_fu_847_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[21] ),
        .I4(\int_ps_mprj_out_reg_n_0_[21] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[21]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[22]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_64_fu_879_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[22] ),
        .I4(\int_ps_mprj_out_reg_n_0_[22] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[22]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[23]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_67_fu_911_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[23] ),
        .I4(\int_ps_mprj_out_reg_n_0_[23] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[23]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[24]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_70_fu_943_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[24] ),
        .I4(\int_ps_mprj_out_reg_n_0_[24] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[24]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[25]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_73_fu_975_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[25] ),
        .I4(\int_ps_mprj_out_reg_n_0_[25] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[25]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[26]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_76_fu_1007_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[26] ),
        .I4(\int_ps_mprj_out_reg_n_0_[26] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[26]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[27]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_79_fu_1039_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[27] ),
        .I4(\int_ps_mprj_out_reg_n_0_[27] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[27]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[28]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_82_fu_1071_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[28] ),
        .I4(\int_ps_mprj_out_reg_n_0_[28] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[28]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[29]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_85_fu_1103_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[29] ),
        .I4(\int_ps_mprj_out_reg_n_0_[29] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[29]));
  LUT2 #(
    .INIT(4'hE)) 
    \rdata[2]_i_1 
       (.I0(\rdata[2]_i_2_n_0 ),
        .I1(\rdata[2]_i_3_n_0 ),
        .O(rdata[2]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[2]_i_2 
       (.I0(\rdata[5]_i_4_n_0 ),
        .I1(data3[2]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[2] ),
        .I4(data6[2]),
        .I5(\rdata[5]_i_5_n_0 ),
        .O(\rdata[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[2]_i_3 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_4_fu_239_p3),
        .I2(\rdata[5]_i_6_n_0 ),
        .I3(tmp_100_fu_1263_p3),
        .I4(\int_ps_mprj_out_reg_n_0_[2] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(\rdata[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[30]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_88_fu_1135_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[30] ),
        .I4(\int_ps_mprj_out_reg_n_0_[30] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[30]));
  LUT2 #(
    .INIT(4'h8)) 
    \rdata[31]_i_1 
       (.I0(s_axi_control_ARVALID),
        .I1(\FSM_onehot_rstate_reg[1]_0 ),
        .O(ar_hs));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[31]_i_2 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_91_fu_1167_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[31] ),
        .I4(\int_ps_mprj_out_reg_n_0_[31] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[31]));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    \rdata[31]_i_3 
       (.I0(s_axi_control_ARADDR[2]),
        .I1(s_axi_control_ARADDR[1]),
        .I2(s_axi_control_ARADDR[0]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(s_axi_control_ARADDR[5]),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000004000000000)) 
    \rdata[31]_i_4 
       (.I0(s_axi_control_ARADDR[3]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(s_axi_control_ARADDR[2]),
        .I3(s_axi_control_ARADDR[1]),
        .I4(s_axi_control_ARADDR[0]),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000080000)) 
    \rdata[31]_i_5 
       (.I0(s_axi_control_ARADDR[3]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(s_axi_control_ARADDR[0]),
        .I3(s_axi_control_ARADDR[1]),
        .I4(s_axi_control_ARADDR[2]),
        .I5(s_axi_control_ARADDR[5]),
        .O(\rdata[31]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \rdata[3]_i_1 
       (.I0(\rdata[3]_i_2_n_0 ),
        .I1(\rdata[3]_i_3_n_0 ),
        .O(rdata[3]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[3]_i_2 
       (.I0(\rdata[5]_i_4_n_0 ),
        .I1(data3[3]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[3] ),
        .I4(data6[3]),
        .I5(\rdata[5]_i_5_n_0 ),
        .O(\rdata[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[3]_i_3 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_7_fu_271_p3),
        .I2(\rdata[5]_i_6_n_0 ),
        .I3(tmp_103_fu_1295_p3),
        .I4(\int_ps_mprj_out_reg_n_0_[3] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(\rdata[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \rdata[4]_i_1 
       (.I0(\rdata[4]_i_2_n_0 ),
        .I1(\rdata[4]_i_3_n_0 ),
        .O(rdata[4]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[4]_i_2 
       (.I0(\rdata[5]_i_4_n_0 ),
        .I1(data3[4]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[4] ),
        .I4(data6[4]),
        .I5(\rdata[5]_i_5_n_0 ),
        .O(\rdata[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[4]_i_3 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_10_fu_303_p3),
        .I2(\rdata[5]_i_6_n_0 ),
        .I3(tmp_106_fu_1327_p3),
        .I4(\int_ps_mprj_out_reg_n_0_[4] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(\rdata[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \rdata[5]_i_1 
       (.I0(\rdata[5]_i_2_n_0 ),
        .I1(\rdata[5]_i_3_n_0 ),
        .O(rdata[5]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[5]_i_2 
       (.I0(\rdata[5]_i_4_n_0 ),
        .I1(data3[5]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[5] ),
        .I4(data6[5]),
        .I5(\rdata[5]_i_5_n_0 ),
        .O(\rdata[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[5]_i_3 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_13_fu_335_p3),
        .I2(\rdata[5]_i_6_n_0 ),
        .I3(\int_ps_mprj_in_reg_n_0_[37] ),
        .I4(\int_ps_mprj_out_reg_n_0_[5] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(\rdata[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \rdata[5]_i_4 
       (.I0(s_axi_control_ARADDR[4]),
        .I1(s_axi_control_ARADDR[3]),
        .I2(s_axi_control_ARADDR[5]),
        .I3(s_axi_control_ARADDR[1]),
        .I4(s_axi_control_ARADDR[0]),
        .I5(s_axi_control_ARADDR[2]),
        .O(\rdata[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \rdata[5]_i_5 
       (.I0(s_axi_control_ARADDR[5]),
        .I1(s_axi_control_ARADDR[3]),
        .I2(s_axi_control_ARADDR[2]),
        .I3(s_axi_control_ARADDR[1]),
        .I4(s_axi_control_ARADDR[0]),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000001000000000)) 
    \rdata[5]_i_6 
       (.I0(s_axi_control_ARADDR[5]),
        .I1(s_axi_control_ARADDR[3]),
        .I2(s_axi_control_ARADDR[2]),
        .I3(s_axi_control_ARADDR[1]),
        .I4(s_axi_control_ARADDR[0]),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[5]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[6]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_16_fu_367_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[6] ),
        .I4(\int_ps_mprj_out_reg_n_0_[6] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[6]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[7]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_19_fu_399_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[7] ),
        .I4(\int_ps_mprj_out_reg_n_0_[7] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[7]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[8]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_22_fu_431_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[8] ),
        .I4(\int_ps_mprj_out_reg_n_0_[8] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[8]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[9]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(tmp_25_fu_463_p3),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(\int_ps_mprj_en_reg_n_0_[9] ),
        .I4(\int_ps_mprj_out_reg_n_0_[9] ),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(rdata[9]));
  FDRE \rdata_reg[0] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[0]),
        .Q(s_axi_control_RDATA[0]),
        .R(1'b0));
  FDRE \rdata_reg[10] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[10]),
        .Q(s_axi_control_RDATA[10]),
        .R(1'b0));
  FDRE \rdata_reg[11] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[11]),
        .Q(s_axi_control_RDATA[11]),
        .R(1'b0));
  FDRE \rdata_reg[12] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[12]),
        .Q(s_axi_control_RDATA[12]),
        .R(1'b0));
  FDRE \rdata_reg[13] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[13]),
        .Q(s_axi_control_RDATA[13]),
        .R(1'b0));
  FDRE \rdata_reg[14] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[14]),
        .Q(s_axi_control_RDATA[14]),
        .R(1'b0));
  FDRE \rdata_reg[15] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[15]),
        .Q(s_axi_control_RDATA[15]),
        .R(1'b0));
  FDRE \rdata_reg[16] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[16]),
        .Q(s_axi_control_RDATA[16]),
        .R(1'b0));
  FDRE \rdata_reg[17] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[17]),
        .Q(s_axi_control_RDATA[17]),
        .R(1'b0));
  FDRE \rdata_reg[18] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[18]),
        .Q(s_axi_control_RDATA[18]),
        .R(1'b0));
  FDRE \rdata_reg[19] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[19]),
        .Q(s_axi_control_RDATA[19]),
        .R(1'b0));
  FDRE \rdata_reg[1] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[1]),
        .Q(s_axi_control_RDATA[1]),
        .R(1'b0));
  FDRE \rdata_reg[20] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[20]),
        .Q(s_axi_control_RDATA[20]),
        .R(1'b0));
  FDRE \rdata_reg[21] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[21]),
        .Q(s_axi_control_RDATA[21]),
        .R(1'b0));
  FDRE \rdata_reg[22] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[22]),
        .Q(s_axi_control_RDATA[22]),
        .R(1'b0));
  FDRE \rdata_reg[23] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[23]),
        .Q(s_axi_control_RDATA[23]),
        .R(1'b0));
  FDRE \rdata_reg[24] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[24]),
        .Q(s_axi_control_RDATA[24]),
        .R(1'b0));
  FDRE \rdata_reg[25] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[25]),
        .Q(s_axi_control_RDATA[25]),
        .R(1'b0));
  FDRE \rdata_reg[26] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[26]),
        .Q(s_axi_control_RDATA[26]),
        .R(1'b0));
  FDRE \rdata_reg[27] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[27]),
        .Q(s_axi_control_RDATA[27]),
        .R(1'b0));
  FDRE \rdata_reg[28] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[28]),
        .Q(s_axi_control_RDATA[28]),
        .R(1'b0));
  FDRE \rdata_reg[29] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[29]),
        .Q(s_axi_control_RDATA[29]),
        .R(1'b0));
  FDRE \rdata_reg[2] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[2]),
        .Q(s_axi_control_RDATA[2]),
        .R(1'b0));
  FDRE \rdata_reg[30] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[30]),
        .Q(s_axi_control_RDATA[30]),
        .R(1'b0));
  FDRE \rdata_reg[31] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[31]),
        .Q(s_axi_control_RDATA[31]),
        .R(1'b0));
  FDRE \rdata_reg[3] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[3]),
        .Q(s_axi_control_RDATA[3]),
        .R(1'b0));
  FDRE \rdata_reg[4] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[4]),
        .Q(s_axi_control_RDATA[4]),
        .R(1'b0));
  FDRE \rdata_reg[5] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[5]),
        .Q(s_axi_control_RDATA[5]),
        .R(1'b0));
  FDRE \rdata_reg[6] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[6]),
        .Q(s_axi_control_RDATA[6]),
        .R(1'b0));
  FDRE \rdata_reg[7] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[7]),
        .Q(s_axi_control_RDATA[7]),
        .R(1'b0));
  FDRE \rdata_reg[8] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[8]),
        .Q(s_axi_control_RDATA[8]),
        .R(1'b0));
  FDRE \rdata_reg[9] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(rdata[9]),
        .Q(s_axi_control_RDATA[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    \waddr[5]_i_1 
       (.I0(s_axi_control_AWVALID),
        .I1(\FSM_onehot_wstate_reg[1]_0 ),
        .O(waddr));
  FDRE \waddr_reg[0] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_control_AWADDR[0]),
        .Q(\waddr_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \waddr_reg[1] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_control_AWADDR[1]),
        .Q(\waddr_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \waddr_reg[2] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_control_AWADDR[2]),
        .Q(\waddr_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \waddr_reg[3] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_control_AWADDR[3]),
        .Q(\waddr_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \waddr_reg[4] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_control_AWADDR[4]),
        .Q(\waddr_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \waddr_reg[5] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_control_AWADDR[5]),
        .Q(\waddr_reg_n_0_[5] ),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
