// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Fri Jun  2 19:17:58 2023
// Host        : josh-All-Series running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/josh/caravel-soc_fpga/vivado/vvd_caravel_fpga/vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/design_1_read_romcode_0_0_sim_netlist.v
// Design      : design_1_read_romcode_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_read_romcode_0_0,read_romcode,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "HLS" *) 
(* X_CORE_INFO = "read_romcode,Vivado 2022.1" *) (* hls_module = "yes" *) 
(* NotValidForBitStream *)
module design_1_read_romcode_0_0
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
    ap_clk,
    ap_rst_n,
    interrupt,
    m_axi_BUS0_AWADDR,
    m_axi_BUS0_AWLEN,
    m_axi_BUS0_AWSIZE,
    m_axi_BUS0_AWBURST,
    m_axi_BUS0_AWLOCK,
    m_axi_BUS0_AWREGION,
    m_axi_BUS0_AWCACHE,
    m_axi_BUS0_AWPROT,
    m_axi_BUS0_AWQOS,
    m_axi_BUS0_AWVALID,
    m_axi_BUS0_AWREADY,
    m_axi_BUS0_WDATA,
    m_axi_BUS0_WSTRB,
    m_axi_BUS0_WLAST,
    m_axi_BUS0_WVALID,
    m_axi_BUS0_WREADY,
    m_axi_BUS0_BRESP,
    m_axi_BUS0_BVALID,
    m_axi_BUS0_BREADY,
    m_axi_BUS0_ARADDR,
    m_axi_BUS0_ARLEN,
    m_axi_BUS0_ARSIZE,
    m_axi_BUS0_ARBURST,
    m_axi_BUS0_ARLOCK,
    m_axi_BUS0_ARREGION,
    m_axi_BUS0_ARCACHE,
    m_axi_BUS0_ARPROT,
    m_axi_BUS0_ARQOS,
    m_axi_BUS0_ARVALID,
    m_axi_BUS0_ARREADY,
    m_axi_BUS0_RDATA,
    m_axi_BUS0_RRESP,
    m_axi_BUS0_RLAST,
    m_axi_BUS0_RVALID,
    m_axi_BUS0_RREADY,
    internal_bram_Clk_A,
    internal_bram_Rst_A,
    internal_bram_EN_A,
    internal_bram_WEN_A,
    internal_bram_Addr_A,
    internal_bram_Din_A,
    internal_bram_Dout_A);
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_control:m_axi_BUS0, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input ap_rst_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1" *) output interrupt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWADDR" *) output [63:0]m_axi_BUS0_AWADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWLEN" *) output [7:0]m_axi_BUS0_AWLEN;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWSIZE" *) output [2:0]m_axi_BUS0_AWSIZE;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWBURST" *) output [1:0]m_axi_BUS0_AWBURST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWLOCK" *) output [1:0]m_axi_BUS0_AWLOCK;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWREGION" *) output [3:0]m_axi_BUS0_AWREGION;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWCACHE" *) output [3:0]m_axi_BUS0_AWCACHE;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWPROT" *) output [2:0]m_axi_BUS0_AWPROT;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWQOS" *) output [3:0]m_axi_BUS0_AWQOS;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWVALID" *) output m_axi_BUS0_AWVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWREADY" *) input m_axi_BUS0_AWREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 WDATA" *) output [31:0]m_axi_BUS0_WDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 WSTRB" *) output [3:0]m_axi_BUS0_WSTRB;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 WLAST" *) output m_axi_BUS0_WLAST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 WVALID" *) output m_axi_BUS0_WVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 WREADY" *) input m_axi_BUS0_WREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 BRESP" *) input [1:0]m_axi_BUS0_BRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 BVALID" *) input m_axi_BUS0_BVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 BREADY" *) output m_axi_BUS0_BREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARADDR" *) output [63:0]m_axi_BUS0_ARADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARLEN" *) output [7:0]m_axi_BUS0_ARLEN;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARSIZE" *) output [2:0]m_axi_BUS0_ARSIZE;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARBURST" *) output [1:0]m_axi_BUS0_ARBURST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARLOCK" *) output [1:0]m_axi_BUS0_ARLOCK;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARREGION" *) output [3:0]m_axi_BUS0_ARREGION;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARCACHE" *) output [3:0]m_axi_BUS0_ARCACHE;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARPROT" *) output [2:0]m_axi_BUS0_ARPROT;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARQOS" *) output [3:0]m_axi_BUS0_ARQOS;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARVALID" *) output m_axi_BUS0_ARVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARREADY" *) input m_axi_BUS0_ARREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 RDATA" *) input [31:0]m_axi_BUS0_RDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 RRESP" *) input [1:0]m_axi_BUS0_RRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 RLAST" *) input m_axi_BUS0_RLAST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 RVALID" *) input m_axi_BUS0_RVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_BUS0, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 64, MAX_WRITE_BURST_LENGTH 16, MAX_BURST_LENGTH 256, PROTOCOL AXI4, READ_WRITE_MODE READ_ONLY, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, FREQ_HZ 10000000, ID_WIDTH 0, ADDR_WIDTH 64, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output m_axi_BUS0_RREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 internal_bram_PORTA CLK" *) output internal_bram_Clk_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 internal_bram_PORTA RST" *) output internal_bram_Rst_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 internal_bram_PORTA EN" *) output internal_bram_EN_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 internal_bram_PORTA WE" *) output [3:0]internal_bram_WEN_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 internal_bram_PORTA ADDR" *) output [31:0]internal_bram_Addr_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 internal_bram_PORTA DIN" *) output [31:0]internal_bram_Din_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 internal_bram_PORTA DOUT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME internal_bram_PORTA, MEM_WIDTH 32, MEM_SIZE 8192, MASTER_TYPE BRAM_CTRL, MEM_ECC NONE, READ_LATENCY 1" *) input [31:0]internal_bram_Dout_A;

  wire \<const0> ;
  wire \<const1> ;
  wire ap_clk;
  wire ap_rst_n;
  wire [13:2]\^internal_bram_Addr_A ;
  wire internal_bram_Clk_A;
  wire [31:0]internal_bram_Din_A;
  wire internal_bram_EN_A;
  wire internal_bram_Rst_A;
  wire [3:0]internal_bram_WEN_A;
  wire interrupt;
  wire [63:2]\^m_axi_BUS0_ARADDR ;
  wire [5:0]\^m_axi_BUS0_ARLEN ;
  wire m_axi_BUS0_ARREADY;
  wire m_axi_BUS0_ARVALID;
  wire m_axi_BUS0_BREADY;
  wire m_axi_BUS0_BVALID;
  wire [31:0]m_axi_BUS0_RDATA;
  wire m_axi_BUS0_RLAST;
  wire m_axi_BUS0_RREADY;
  wire m_axi_BUS0_RVALID;
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
  wire NLW_inst_m_axi_BUS0_AWVALID_UNCONNECTED;
  wire NLW_inst_m_axi_BUS0_WLAST_UNCONNECTED;
  wire NLW_inst_m_axi_BUS0_WVALID_UNCONNECTED;
  wire [31:0]NLW_inst_internal_bram_Addr_A_UNCONNECTED;
  wire [1:0]NLW_inst_m_axi_BUS0_ARADDR_UNCONNECTED;
  wire [1:0]NLW_inst_m_axi_BUS0_ARBURST_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_BUS0_ARCACHE_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_BUS0_ARID_UNCONNECTED;
  wire [7:6]NLW_inst_m_axi_BUS0_ARLEN_UNCONNECTED;
  wire [1:0]NLW_inst_m_axi_BUS0_ARLOCK_UNCONNECTED;
  wire [2:0]NLW_inst_m_axi_BUS0_ARPROT_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_BUS0_ARQOS_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_BUS0_ARREGION_UNCONNECTED;
  wire [2:0]NLW_inst_m_axi_BUS0_ARSIZE_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_BUS0_ARUSER_UNCONNECTED;
  wire [63:0]NLW_inst_m_axi_BUS0_AWADDR_UNCONNECTED;
  wire [1:0]NLW_inst_m_axi_BUS0_AWBURST_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_BUS0_AWCACHE_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_BUS0_AWID_UNCONNECTED;
  wire [7:0]NLW_inst_m_axi_BUS0_AWLEN_UNCONNECTED;
  wire [1:0]NLW_inst_m_axi_BUS0_AWLOCK_UNCONNECTED;
  wire [2:0]NLW_inst_m_axi_BUS0_AWPROT_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_BUS0_AWQOS_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_BUS0_AWREGION_UNCONNECTED;
  wire [2:0]NLW_inst_m_axi_BUS0_AWSIZE_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_BUS0_AWUSER_UNCONNECTED;
  wire [31:0]NLW_inst_m_axi_BUS0_WDATA_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_BUS0_WID_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_BUS0_WSTRB_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_BUS0_WUSER_UNCONNECTED;
  wire [1:0]NLW_inst_s_axi_control_BRESP_UNCONNECTED;
  wire [1:0]NLW_inst_s_axi_control_RRESP_UNCONNECTED;

  assign internal_bram_Addr_A[31] = \<const0> ;
  assign internal_bram_Addr_A[30] = \<const0> ;
  assign internal_bram_Addr_A[29] = \<const0> ;
  assign internal_bram_Addr_A[28] = \<const0> ;
  assign internal_bram_Addr_A[27] = \<const0> ;
  assign internal_bram_Addr_A[26] = \<const0> ;
  assign internal_bram_Addr_A[25] = \<const0> ;
  assign internal_bram_Addr_A[24] = \<const0> ;
  assign internal_bram_Addr_A[23] = \<const0> ;
  assign internal_bram_Addr_A[22] = \<const0> ;
  assign internal_bram_Addr_A[21] = \<const0> ;
  assign internal_bram_Addr_A[20] = \<const0> ;
  assign internal_bram_Addr_A[19] = \<const0> ;
  assign internal_bram_Addr_A[18] = \<const0> ;
  assign internal_bram_Addr_A[17] = \<const0> ;
  assign internal_bram_Addr_A[16] = \<const0> ;
  assign internal_bram_Addr_A[15] = \<const0> ;
  assign internal_bram_Addr_A[14] = \<const0> ;
  assign internal_bram_Addr_A[13:2] = \^internal_bram_Addr_A [13:2];
  assign internal_bram_Addr_A[1] = \<const0> ;
  assign internal_bram_Addr_A[0] = \<const0> ;
  assign m_axi_BUS0_ARADDR[63:2] = \^m_axi_BUS0_ARADDR [63:2];
  assign m_axi_BUS0_ARADDR[1] = \<const0> ;
  assign m_axi_BUS0_ARADDR[0] = \<const0> ;
  assign m_axi_BUS0_ARBURST[1] = \<const0> ;
  assign m_axi_BUS0_ARBURST[0] = \<const1> ;
  assign m_axi_BUS0_ARCACHE[3] = \<const0> ;
  assign m_axi_BUS0_ARCACHE[2] = \<const0> ;
  assign m_axi_BUS0_ARCACHE[1] = \<const1> ;
  assign m_axi_BUS0_ARCACHE[0] = \<const1> ;
  assign m_axi_BUS0_ARLEN[7] = \<const0> ;
  assign m_axi_BUS0_ARLEN[6] = \<const0> ;
  assign m_axi_BUS0_ARLEN[5:0] = \^m_axi_BUS0_ARLEN [5:0];
  assign m_axi_BUS0_ARLOCK[1] = \<const0> ;
  assign m_axi_BUS0_ARLOCK[0] = \<const0> ;
  assign m_axi_BUS0_ARPROT[2] = \<const0> ;
  assign m_axi_BUS0_ARPROT[1] = \<const0> ;
  assign m_axi_BUS0_ARPROT[0] = \<const0> ;
  assign m_axi_BUS0_ARQOS[3] = \<const0> ;
  assign m_axi_BUS0_ARQOS[2] = \<const0> ;
  assign m_axi_BUS0_ARQOS[1] = \<const0> ;
  assign m_axi_BUS0_ARQOS[0] = \<const0> ;
  assign m_axi_BUS0_ARREGION[3] = \<const0> ;
  assign m_axi_BUS0_ARREGION[2] = \<const0> ;
  assign m_axi_BUS0_ARREGION[1] = \<const0> ;
  assign m_axi_BUS0_ARREGION[0] = \<const0> ;
  assign m_axi_BUS0_ARSIZE[2] = \<const0> ;
  assign m_axi_BUS0_ARSIZE[1] = \<const1> ;
  assign m_axi_BUS0_ARSIZE[0] = \<const0> ;
  assign m_axi_BUS0_AWADDR[63] = \<const0> ;
  assign m_axi_BUS0_AWADDR[62] = \<const0> ;
  assign m_axi_BUS0_AWADDR[61] = \<const0> ;
  assign m_axi_BUS0_AWADDR[60] = \<const0> ;
  assign m_axi_BUS0_AWADDR[59] = \<const0> ;
  assign m_axi_BUS0_AWADDR[58] = \<const0> ;
  assign m_axi_BUS0_AWADDR[57] = \<const0> ;
  assign m_axi_BUS0_AWADDR[56] = \<const0> ;
  assign m_axi_BUS0_AWADDR[55] = \<const0> ;
  assign m_axi_BUS0_AWADDR[54] = \<const0> ;
  assign m_axi_BUS0_AWADDR[53] = \<const0> ;
  assign m_axi_BUS0_AWADDR[52] = \<const0> ;
  assign m_axi_BUS0_AWADDR[51] = \<const0> ;
  assign m_axi_BUS0_AWADDR[50] = \<const0> ;
  assign m_axi_BUS0_AWADDR[49] = \<const0> ;
  assign m_axi_BUS0_AWADDR[48] = \<const0> ;
  assign m_axi_BUS0_AWADDR[47] = \<const0> ;
  assign m_axi_BUS0_AWADDR[46] = \<const0> ;
  assign m_axi_BUS0_AWADDR[45] = \<const0> ;
  assign m_axi_BUS0_AWADDR[44] = \<const0> ;
  assign m_axi_BUS0_AWADDR[43] = \<const0> ;
  assign m_axi_BUS0_AWADDR[42] = \<const0> ;
  assign m_axi_BUS0_AWADDR[41] = \<const0> ;
  assign m_axi_BUS0_AWADDR[40] = \<const0> ;
  assign m_axi_BUS0_AWADDR[39] = \<const0> ;
  assign m_axi_BUS0_AWADDR[38] = \<const0> ;
  assign m_axi_BUS0_AWADDR[37] = \<const0> ;
  assign m_axi_BUS0_AWADDR[36] = \<const0> ;
  assign m_axi_BUS0_AWADDR[35] = \<const0> ;
  assign m_axi_BUS0_AWADDR[34] = \<const0> ;
  assign m_axi_BUS0_AWADDR[33] = \<const0> ;
  assign m_axi_BUS0_AWADDR[32] = \<const0> ;
  assign m_axi_BUS0_AWADDR[31] = \<const0> ;
  assign m_axi_BUS0_AWADDR[30] = \<const0> ;
  assign m_axi_BUS0_AWADDR[29] = \<const0> ;
  assign m_axi_BUS0_AWADDR[28] = \<const0> ;
  assign m_axi_BUS0_AWADDR[27] = \<const0> ;
  assign m_axi_BUS0_AWADDR[26] = \<const0> ;
  assign m_axi_BUS0_AWADDR[25] = \<const0> ;
  assign m_axi_BUS0_AWADDR[24] = \<const0> ;
  assign m_axi_BUS0_AWADDR[23] = \<const0> ;
  assign m_axi_BUS0_AWADDR[22] = \<const0> ;
  assign m_axi_BUS0_AWADDR[21] = \<const0> ;
  assign m_axi_BUS0_AWADDR[20] = \<const0> ;
  assign m_axi_BUS0_AWADDR[19] = \<const0> ;
  assign m_axi_BUS0_AWADDR[18] = \<const0> ;
  assign m_axi_BUS0_AWADDR[17] = \<const0> ;
  assign m_axi_BUS0_AWADDR[16] = \<const0> ;
  assign m_axi_BUS0_AWADDR[15] = \<const0> ;
  assign m_axi_BUS0_AWADDR[14] = \<const0> ;
  assign m_axi_BUS0_AWADDR[13] = \<const0> ;
  assign m_axi_BUS0_AWADDR[12] = \<const0> ;
  assign m_axi_BUS0_AWADDR[11] = \<const0> ;
  assign m_axi_BUS0_AWADDR[10] = \<const0> ;
  assign m_axi_BUS0_AWADDR[9] = \<const0> ;
  assign m_axi_BUS0_AWADDR[8] = \<const0> ;
  assign m_axi_BUS0_AWADDR[7] = \<const0> ;
  assign m_axi_BUS0_AWADDR[6] = \<const0> ;
  assign m_axi_BUS0_AWADDR[5] = \<const0> ;
  assign m_axi_BUS0_AWADDR[4] = \<const0> ;
  assign m_axi_BUS0_AWADDR[3] = \<const0> ;
  assign m_axi_BUS0_AWADDR[2] = \<const0> ;
  assign m_axi_BUS0_AWADDR[1] = \<const0> ;
  assign m_axi_BUS0_AWADDR[0] = \<const0> ;
  assign m_axi_BUS0_AWBURST[1] = \<const0> ;
  assign m_axi_BUS0_AWBURST[0] = \<const1> ;
  assign m_axi_BUS0_AWCACHE[3] = \<const0> ;
  assign m_axi_BUS0_AWCACHE[2] = \<const0> ;
  assign m_axi_BUS0_AWCACHE[1] = \<const1> ;
  assign m_axi_BUS0_AWCACHE[0] = \<const1> ;
  assign m_axi_BUS0_AWLEN[7] = \<const0> ;
  assign m_axi_BUS0_AWLEN[6] = \<const0> ;
  assign m_axi_BUS0_AWLEN[5] = \<const0> ;
  assign m_axi_BUS0_AWLEN[4] = \<const0> ;
  assign m_axi_BUS0_AWLEN[3] = \<const0> ;
  assign m_axi_BUS0_AWLEN[2] = \<const0> ;
  assign m_axi_BUS0_AWLEN[1] = \<const0> ;
  assign m_axi_BUS0_AWLEN[0] = \<const0> ;
  assign m_axi_BUS0_AWLOCK[1] = \<const0> ;
  assign m_axi_BUS0_AWLOCK[0] = \<const0> ;
  assign m_axi_BUS0_AWPROT[2] = \<const0> ;
  assign m_axi_BUS0_AWPROT[1] = \<const0> ;
  assign m_axi_BUS0_AWPROT[0] = \<const0> ;
  assign m_axi_BUS0_AWQOS[3] = \<const0> ;
  assign m_axi_BUS0_AWQOS[2] = \<const0> ;
  assign m_axi_BUS0_AWQOS[1] = \<const0> ;
  assign m_axi_BUS0_AWQOS[0] = \<const0> ;
  assign m_axi_BUS0_AWREGION[3] = \<const0> ;
  assign m_axi_BUS0_AWREGION[2] = \<const0> ;
  assign m_axi_BUS0_AWREGION[1] = \<const0> ;
  assign m_axi_BUS0_AWREGION[0] = \<const0> ;
  assign m_axi_BUS0_AWSIZE[2] = \<const0> ;
  assign m_axi_BUS0_AWSIZE[1] = \<const1> ;
  assign m_axi_BUS0_AWSIZE[0] = \<const0> ;
  assign m_axi_BUS0_AWVALID = \<const0> ;
  assign m_axi_BUS0_WDATA[31] = \<const0> ;
  assign m_axi_BUS0_WDATA[30] = \<const0> ;
  assign m_axi_BUS0_WDATA[29] = \<const0> ;
  assign m_axi_BUS0_WDATA[28] = \<const0> ;
  assign m_axi_BUS0_WDATA[27] = \<const0> ;
  assign m_axi_BUS0_WDATA[26] = \<const0> ;
  assign m_axi_BUS0_WDATA[25] = \<const0> ;
  assign m_axi_BUS0_WDATA[24] = \<const0> ;
  assign m_axi_BUS0_WDATA[23] = \<const0> ;
  assign m_axi_BUS0_WDATA[22] = \<const0> ;
  assign m_axi_BUS0_WDATA[21] = \<const0> ;
  assign m_axi_BUS0_WDATA[20] = \<const0> ;
  assign m_axi_BUS0_WDATA[19] = \<const0> ;
  assign m_axi_BUS0_WDATA[18] = \<const0> ;
  assign m_axi_BUS0_WDATA[17] = \<const0> ;
  assign m_axi_BUS0_WDATA[16] = \<const0> ;
  assign m_axi_BUS0_WDATA[15] = \<const0> ;
  assign m_axi_BUS0_WDATA[14] = \<const0> ;
  assign m_axi_BUS0_WDATA[13] = \<const0> ;
  assign m_axi_BUS0_WDATA[12] = \<const0> ;
  assign m_axi_BUS0_WDATA[11] = \<const0> ;
  assign m_axi_BUS0_WDATA[10] = \<const0> ;
  assign m_axi_BUS0_WDATA[9] = \<const0> ;
  assign m_axi_BUS0_WDATA[8] = \<const0> ;
  assign m_axi_BUS0_WDATA[7] = \<const0> ;
  assign m_axi_BUS0_WDATA[6] = \<const0> ;
  assign m_axi_BUS0_WDATA[5] = \<const0> ;
  assign m_axi_BUS0_WDATA[4] = \<const0> ;
  assign m_axi_BUS0_WDATA[3] = \<const0> ;
  assign m_axi_BUS0_WDATA[2] = \<const0> ;
  assign m_axi_BUS0_WDATA[1] = \<const0> ;
  assign m_axi_BUS0_WDATA[0] = \<const0> ;
  assign m_axi_BUS0_WLAST = \<const0> ;
  assign m_axi_BUS0_WSTRB[3] = \<const0> ;
  assign m_axi_BUS0_WSTRB[2] = \<const0> ;
  assign m_axi_BUS0_WSTRB[1] = \<const0> ;
  assign m_axi_BUS0_WSTRB[0] = \<const0> ;
  assign m_axi_BUS0_WVALID = \<const0> ;
  assign s_axi_control_BRESP[1] = \<const0> ;
  assign s_axi_control_BRESP[0] = \<const0> ;
  assign s_axi_control_RRESP[1] = \<const0> ;
  assign s_axi_control_RRESP[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* C_M_AXI_BUS0_ADDR_WIDTH = "64" *) 
  (* C_M_AXI_BUS0_ARUSER_WIDTH = "1" *) 
  (* C_M_AXI_BUS0_AWUSER_WIDTH = "1" *) 
  (* C_M_AXI_BUS0_BUSER_WIDTH = "1" *) 
  (* C_M_AXI_BUS0_CACHE_VALUE = "4'b0011" *) 
  (* C_M_AXI_BUS0_DATA_WIDTH = "32" *) 
  (* C_M_AXI_BUS0_ID_WIDTH = "1" *) 
  (* C_M_AXI_BUS0_PROT_VALUE = "3'b000" *) 
  (* C_M_AXI_BUS0_RUSER_WIDTH = "1" *) 
  (* C_M_AXI_BUS0_USER_VALUE = "0" *) 
  (* C_M_AXI_BUS0_WSTRB_WIDTH = "4" *) 
  (* C_M_AXI_BUS0_WUSER_WIDTH = "1" *) 
  (* C_M_AXI_DATA_WIDTH = "32" *) 
  (* C_M_AXI_WSTRB_WIDTH = "4" *) 
  (* C_S_AXI_CONTROL_ADDR_WIDTH = "6" *) 
  (* C_S_AXI_CONTROL_DATA_WIDTH = "32" *) 
  (* C_S_AXI_CONTROL_WSTRB_WIDTH = "4" *) 
  (* C_S_AXI_DATA_WIDTH = "32" *) 
  (* C_S_AXI_WSTRB_WIDTH = "4" *) 
  (* SDX_KERNEL = "true" *) 
  (* SDX_KERNEL_SYNTH_INST = "inst" *) 
  (* SDX_KERNEL_TYPE = "hls" *) 
  (* ap_ST_fsm_state1 = "10'b0000000001" *) 
  (* ap_ST_fsm_state10 = "10'b1000000000" *) 
  (* ap_ST_fsm_state2 = "10'b0000000010" *) 
  (* ap_ST_fsm_state3 = "10'b0000000100" *) 
  (* ap_ST_fsm_state4 = "10'b0000001000" *) 
  (* ap_ST_fsm_state5 = "10'b0000010000" *) 
  (* ap_ST_fsm_state6 = "10'b0000100000" *) 
  (* ap_ST_fsm_state7 = "10'b0001000000" *) 
  (* ap_ST_fsm_state8 = "10'b0010000000" *) 
  (* ap_ST_fsm_state9 = "10'b0100000000" *) 
  design_1_read_romcode_0_0_read_romcode inst
       (.ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .internal_bram_Addr_A({NLW_inst_internal_bram_Addr_A_UNCONNECTED[31:14],\^internal_bram_Addr_A ,NLW_inst_internal_bram_Addr_A_UNCONNECTED[1:0]}),
        .internal_bram_Clk_A(internal_bram_Clk_A),
        .internal_bram_Din_A(internal_bram_Din_A),
        .internal_bram_Dout_A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .internal_bram_EN_A(internal_bram_EN_A),
        .internal_bram_Rst_A(internal_bram_Rst_A),
        .internal_bram_WEN_A(internal_bram_WEN_A),
        .interrupt(interrupt),
        .m_axi_BUS0_ARADDR({\^m_axi_BUS0_ARADDR ,NLW_inst_m_axi_BUS0_ARADDR_UNCONNECTED[1:0]}),
        .m_axi_BUS0_ARBURST(NLW_inst_m_axi_BUS0_ARBURST_UNCONNECTED[1:0]),
        .m_axi_BUS0_ARCACHE(NLW_inst_m_axi_BUS0_ARCACHE_UNCONNECTED[3:0]),
        .m_axi_BUS0_ARID(NLW_inst_m_axi_BUS0_ARID_UNCONNECTED[0]),
        .m_axi_BUS0_ARLEN({NLW_inst_m_axi_BUS0_ARLEN_UNCONNECTED[7:6],\^m_axi_BUS0_ARLEN }),
        .m_axi_BUS0_ARLOCK(NLW_inst_m_axi_BUS0_ARLOCK_UNCONNECTED[1:0]),
        .m_axi_BUS0_ARPROT(NLW_inst_m_axi_BUS0_ARPROT_UNCONNECTED[2:0]),
        .m_axi_BUS0_ARQOS(NLW_inst_m_axi_BUS0_ARQOS_UNCONNECTED[3:0]),
        .m_axi_BUS0_ARREADY(m_axi_BUS0_ARREADY),
        .m_axi_BUS0_ARREGION(NLW_inst_m_axi_BUS0_ARREGION_UNCONNECTED[3:0]),
        .m_axi_BUS0_ARSIZE(NLW_inst_m_axi_BUS0_ARSIZE_UNCONNECTED[2:0]),
        .m_axi_BUS0_ARUSER(NLW_inst_m_axi_BUS0_ARUSER_UNCONNECTED[0]),
        .m_axi_BUS0_ARVALID(m_axi_BUS0_ARVALID),
        .m_axi_BUS0_AWADDR(NLW_inst_m_axi_BUS0_AWADDR_UNCONNECTED[63:0]),
        .m_axi_BUS0_AWBURST(NLW_inst_m_axi_BUS0_AWBURST_UNCONNECTED[1:0]),
        .m_axi_BUS0_AWCACHE(NLW_inst_m_axi_BUS0_AWCACHE_UNCONNECTED[3:0]),
        .m_axi_BUS0_AWID(NLW_inst_m_axi_BUS0_AWID_UNCONNECTED[0]),
        .m_axi_BUS0_AWLEN(NLW_inst_m_axi_BUS0_AWLEN_UNCONNECTED[7:0]),
        .m_axi_BUS0_AWLOCK(NLW_inst_m_axi_BUS0_AWLOCK_UNCONNECTED[1:0]),
        .m_axi_BUS0_AWPROT(NLW_inst_m_axi_BUS0_AWPROT_UNCONNECTED[2:0]),
        .m_axi_BUS0_AWQOS(NLW_inst_m_axi_BUS0_AWQOS_UNCONNECTED[3:0]),
        .m_axi_BUS0_AWREADY(1'b0),
        .m_axi_BUS0_AWREGION(NLW_inst_m_axi_BUS0_AWREGION_UNCONNECTED[3:0]),
        .m_axi_BUS0_AWSIZE(NLW_inst_m_axi_BUS0_AWSIZE_UNCONNECTED[2:0]),
        .m_axi_BUS0_AWUSER(NLW_inst_m_axi_BUS0_AWUSER_UNCONNECTED[0]),
        .m_axi_BUS0_AWVALID(NLW_inst_m_axi_BUS0_AWVALID_UNCONNECTED),
        .m_axi_BUS0_BID(1'b0),
        .m_axi_BUS0_BREADY(m_axi_BUS0_BREADY),
        .m_axi_BUS0_BRESP({1'b0,1'b0}),
        .m_axi_BUS0_BUSER(1'b0),
        .m_axi_BUS0_BVALID(m_axi_BUS0_BVALID),
        .m_axi_BUS0_RDATA(m_axi_BUS0_RDATA),
        .m_axi_BUS0_RID(1'b0),
        .m_axi_BUS0_RLAST(m_axi_BUS0_RLAST),
        .m_axi_BUS0_RREADY(m_axi_BUS0_RREADY),
        .m_axi_BUS0_RRESP({1'b0,1'b0}),
        .m_axi_BUS0_RUSER(1'b0),
        .m_axi_BUS0_RVALID(m_axi_BUS0_RVALID),
        .m_axi_BUS0_WDATA(NLW_inst_m_axi_BUS0_WDATA_UNCONNECTED[31:0]),
        .m_axi_BUS0_WID(NLW_inst_m_axi_BUS0_WID_UNCONNECTED[0]),
        .m_axi_BUS0_WLAST(NLW_inst_m_axi_BUS0_WLAST_UNCONNECTED),
        .m_axi_BUS0_WREADY(1'b0),
        .m_axi_BUS0_WSTRB(NLW_inst_m_axi_BUS0_WSTRB_UNCONNECTED[3:0]),
        .m_axi_BUS0_WUSER(NLW_inst_m_axi_BUS0_WUSER_UNCONNECTED[0]),
        .m_axi_BUS0_WVALID(NLW_inst_m_axi_BUS0_WVALID_UNCONNECTED),
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

(* C_M_AXI_BUS0_ADDR_WIDTH = "64" *) (* C_M_AXI_BUS0_ARUSER_WIDTH = "1" *) (* C_M_AXI_BUS0_AWUSER_WIDTH = "1" *) 
(* C_M_AXI_BUS0_BUSER_WIDTH = "1" *) (* C_M_AXI_BUS0_CACHE_VALUE = "4'b0011" *) (* C_M_AXI_BUS0_DATA_WIDTH = "32" *) 
(* C_M_AXI_BUS0_ID_WIDTH = "1" *) (* C_M_AXI_BUS0_PROT_VALUE = "3'b000" *) (* C_M_AXI_BUS0_RUSER_WIDTH = "1" *) 
(* C_M_AXI_BUS0_USER_VALUE = "0" *) (* C_M_AXI_BUS0_WSTRB_WIDTH = "4" *) (* C_M_AXI_BUS0_WUSER_WIDTH = "1" *) 
(* C_M_AXI_DATA_WIDTH = "32" *) (* C_M_AXI_WSTRB_WIDTH = "4" *) (* C_S_AXI_CONTROL_ADDR_WIDTH = "6" *) 
(* C_S_AXI_CONTROL_DATA_WIDTH = "32" *) (* C_S_AXI_CONTROL_WSTRB_WIDTH = "4" *) (* C_S_AXI_DATA_WIDTH = "32" *) 
(* C_S_AXI_WSTRB_WIDTH = "4" *) (* ORIG_REF_NAME = "read_romcode" *) (* ap_ST_fsm_state1 = "10'b0000000001" *) 
(* ap_ST_fsm_state10 = "10'b1000000000" *) (* ap_ST_fsm_state2 = "10'b0000000010" *) (* ap_ST_fsm_state3 = "10'b0000000100" *) 
(* ap_ST_fsm_state4 = "10'b0000001000" *) (* ap_ST_fsm_state5 = "10'b0000010000" *) (* ap_ST_fsm_state6 = "10'b0000100000" *) 
(* ap_ST_fsm_state7 = "10'b0001000000" *) (* ap_ST_fsm_state8 = "10'b0010000000" *) (* ap_ST_fsm_state9 = "10'b0100000000" *) 
(* hls_module = "yes" *) 
module design_1_read_romcode_0_0_read_romcode
   (ap_clk,
    ap_rst_n,
    m_axi_BUS0_AWVALID,
    m_axi_BUS0_AWREADY,
    m_axi_BUS0_AWADDR,
    m_axi_BUS0_AWID,
    m_axi_BUS0_AWLEN,
    m_axi_BUS0_AWSIZE,
    m_axi_BUS0_AWBURST,
    m_axi_BUS0_AWLOCK,
    m_axi_BUS0_AWCACHE,
    m_axi_BUS0_AWPROT,
    m_axi_BUS0_AWQOS,
    m_axi_BUS0_AWREGION,
    m_axi_BUS0_AWUSER,
    m_axi_BUS0_WVALID,
    m_axi_BUS0_WREADY,
    m_axi_BUS0_WDATA,
    m_axi_BUS0_WSTRB,
    m_axi_BUS0_WLAST,
    m_axi_BUS0_WID,
    m_axi_BUS0_WUSER,
    m_axi_BUS0_ARVALID,
    m_axi_BUS0_ARREADY,
    m_axi_BUS0_ARADDR,
    m_axi_BUS0_ARID,
    m_axi_BUS0_ARLEN,
    m_axi_BUS0_ARSIZE,
    m_axi_BUS0_ARBURST,
    m_axi_BUS0_ARLOCK,
    m_axi_BUS0_ARCACHE,
    m_axi_BUS0_ARPROT,
    m_axi_BUS0_ARQOS,
    m_axi_BUS0_ARREGION,
    m_axi_BUS0_ARUSER,
    m_axi_BUS0_RVALID,
    m_axi_BUS0_RREADY,
    m_axi_BUS0_RDATA,
    m_axi_BUS0_RLAST,
    m_axi_BUS0_RID,
    m_axi_BUS0_RUSER,
    m_axi_BUS0_RRESP,
    m_axi_BUS0_BVALID,
    m_axi_BUS0_BREADY,
    m_axi_BUS0_BRESP,
    m_axi_BUS0_BID,
    m_axi_BUS0_BUSER,
    internal_bram_Addr_A,
    internal_bram_EN_A,
    internal_bram_WEN_A,
    internal_bram_Din_A,
    internal_bram_Dout_A,
    internal_bram_Clk_A,
    internal_bram_Rst_A,
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
    interrupt);
  input ap_clk;
  input ap_rst_n;
  output m_axi_BUS0_AWVALID;
  input m_axi_BUS0_AWREADY;
  output [63:0]m_axi_BUS0_AWADDR;
  output [0:0]m_axi_BUS0_AWID;
  output [7:0]m_axi_BUS0_AWLEN;
  output [2:0]m_axi_BUS0_AWSIZE;
  output [1:0]m_axi_BUS0_AWBURST;
  output [1:0]m_axi_BUS0_AWLOCK;
  output [3:0]m_axi_BUS0_AWCACHE;
  output [2:0]m_axi_BUS0_AWPROT;
  output [3:0]m_axi_BUS0_AWQOS;
  output [3:0]m_axi_BUS0_AWREGION;
  output [0:0]m_axi_BUS0_AWUSER;
  output m_axi_BUS0_WVALID;
  input m_axi_BUS0_WREADY;
  output [31:0]m_axi_BUS0_WDATA;
  output [3:0]m_axi_BUS0_WSTRB;
  output m_axi_BUS0_WLAST;
  output [0:0]m_axi_BUS0_WID;
  output [0:0]m_axi_BUS0_WUSER;
  output m_axi_BUS0_ARVALID;
  input m_axi_BUS0_ARREADY;
  output [63:0]m_axi_BUS0_ARADDR;
  output [0:0]m_axi_BUS0_ARID;
  output [7:0]m_axi_BUS0_ARLEN;
  output [2:0]m_axi_BUS0_ARSIZE;
  output [1:0]m_axi_BUS0_ARBURST;
  output [1:0]m_axi_BUS0_ARLOCK;
  output [3:0]m_axi_BUS0_ARCACHE;
  output [2:0]m_axi_BUS0_ARPROT;
  output [3:0]m_axi_BUS0_ARQOS;
  output [3:0]m_axi_BUS0_ARREGION;
  output [0:0]m_axi_BUS0_ARUSER;
  input m_axi_BUS0_RVALID;
  output m_axi_BUS0_RREADY;
  input [31:0]m_axi_BUS0_RDATA;
  input m_axi_BUS0_RLAST;
  input [0:0]m_axi_BUS0_RID;
  input [0:0]m_axi_BUS0_RUSER;
  input [1:0]m_axi_BUS0_RRESP;
  input m_axi_BUS0_BVALID;
  output m_axi_BUS0_BREADY;
  input [1:0]m_axi_BUS0_BRESP;
  input [0:0]m_axi_BUS0_BID;
  input [0:0]m_axi_BUS0_BUSER;
  output [31:0]internal_bram_Addr_A;
  output internal_bram_EN_A;
  output [3:0]internal_bram_WEN_A;
  output [31:0]internal_bram_Din_A;
  input [31:0]internal_bram_Dout_A;
  output internal_bram_Clk_A;
  output internal_bram_Rst_A;
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
  output interrupt;

  wire \<const0> ;
  wire [31:0]BUS0_RDATA;
  wire BUS0_RVALID;
  wire BUS0_m_axi_U_n_69;
  wire \ap_CS_fsm[1]_i_3_n_2 ;
  wire \ap_CS_fsm_reg_n_2_[2] ;
  wire \ap_CS_fsm_reg_n_2_[3] ;
  wire \ap_CS_fsm_reg_n_2_[4] ;
  wire \ap_CS_fsm_reg_n_2_[5] ;
  wire \ap_CS_fsm_reg_n_2_[6] ;
  wire \ap_CS_fsm_reg_n_2_[7] ;
  wire ap_CS_fsm_state1;
  wire ap_CS_fsm_state10;
  wire ap_CS_fsm_state2;
  wire ap_CS_fsm_state9;
  wire [9:0]ap_NS_fsm;
  wire ap_clk;
  wire ap_done;
  wire ap_rst_n;
  wire control_s_axi_U_n_3;
  wire control_s_axi_U_n_72;
  wire control_s_axi_U_n_73;
  wire control_s_axi_U_n_74;
  wire control_s_axi_U_n_75;
  wire control_s_axi_U_n_76;
  wire control_s_axi_U_n_77;
  wire control_s_axi_U_n_78;
  wire control_s_axi_U_n_79;
  wire control_s_axi_U_n_80;
  wire control_s_axi_U_n_81;
  wire control_s_axi_U_n_82;
  wire control_s_axi_U_n_83;
  wire grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg;
  wire grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_n_3;
  wire grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_n_7;
  wire \icmp_ln31_reg_153_reg_n_2_[0] ;
  wire [13:2]\^internal_bram_Addr_A ;
  wire [31:0]internal_bram_Din_A;
  wire internal_bram_EN_A;
  wire internal_bram_Rst_A;
  wire interrupt;
  wire \load_unit/burst_ready ;
  wire \load_unit/ready_for_outstanding ;
  wire [63:2]\^m_axi_BUS0_ARADDR ;
  wire [5:0]\^m_axi_BUS0_ARLEN ;
  wire m_axi_BUS0_ARREADY;
  wire m_axi_BUS0_ARVALID;
  wire m_axi_BUS0_BREADY;
  wire m_axi_BUS0_BVALID;
  wire [31:0]m_axi_BUS0_RDATA;
  wire m_axi_BUS0_RLAST;
  wire m_axi_BUS0_RREADY;
  wire m_axi_BUS0_RVALID;
  wire [63:2]romcode;
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
  wire [11:11]sel0;
  wire [11:0]select_ln26_reg_147;
  wire [61:0]sext_ln31_fu_131_p1;

  assign internal_bram_Addr_A[31] = \<const0> ;
  assign internal_bram_Addr_A[30] = \<const0> ;
  assign internal_bram_Addr_A[29] = \<const0> ;
  assign internal_bram_Addr_A[28] = \<const0> ;
  assign internal_bram_Addr_A[27] = \<const0> ;
  assign internal_bram_Addr_A[26] = \<const0> ;
  assign internal_bram_Addr_A[25] = \<const0> ;
  assign internal_bram_Addr_A[24] = \<const0> ;
  assign internal_bram_Addr_A[23] = \<const0> ;
  assign internal_bram_Addr_A[22] = \<const0> ;
  assign internal_bram_Addr_A[21] = \<const0> ;
  assign internal_bram_Addr_A[20] = \<const0> ;
  assign internal_bram_Addr_A[19] = \<const0> ;
  assign internal_bram_Addr_A[18] = \<const0> ;
  assign internal_bram_Addr_A[17] = \<const0> ;
  assign internal_bram_Addr_A[16] = \<const0> ;
  assign internal_bram_Addr_A[15] = \<const0> ;
  assign internal_bram_Addr_A[14] = \<const0> ;
  assign internal_bram_Addr_A[13:2] = \^internal_bram_Addr_A [13:2];
  assign internal_bram_Addr_A[1] = \<const0> ;
  assign internal_bram_Addr_A[0] = \<const0> ;
  assign internal_bram_Clk_A = ap_clk;
  assign internal_bram_WEN_A[3] = internal_bram_EN_A;
  assign internal_bram_WEN_A[2] = internal_bram_EN_A;
  assign internal_bram_WEN_A[1] = internal_bram_EN_A;
  assign internal_bram_WEN_A[0] = internal_bram_EN_A;
  assign m_axi_BUS0_ARADDR[63:2] = \^m_axi_BUS0_ARADDR [63:2];
  assign m_axi_BUS0_ARADDR[1] = \<const0> ;
  assign m_axi_BUS0_ARADDR[0] = \<const0> ;
  assign m_axi_BUS0_ARBURST[1] = \<const0> ;
  assign m_axi_BUS0_ARBURST[0] = \<const0> ;
  assign m_axi_BUS0_ARCACHE[3] = \<const0> ;
  assign m_axi_BUS0_ARCACHE[2] = \<const0> ;
  assign m_axi_BUS0_ARCACHE[1] = \<const0> ;
  assign m_axi_BUS0_ARCACHE[0] = \<const0> ;
  assign m_axi_BUS0_ARID[0] = \<const0> ;
  assign m_axi_BUS0_ARLEN[7] = \<const0> ;
  assign m_axi_BUS0_ARLEN[6] = \<const0> ;
  assign m_axi_BUS0_ARLEN[5:0] = \^m_axi_BUS0_ARLEN [5:0];
  assign m_axi_BUS0_ARLOCK[1] = \<const0> ;
  assign m_axi_BUS0_ARLOCK[0] = \<const0> ;
  assign m_axi_BUS0_ARPROT[2] = \<const0> ;
  assign m_axi_BUS0_ARPROT[1] = \<const0> ;
  assign m_axi_BUS0_ARPROT[0] = \<const0> ;
  assign m_axi_BUS0_ARQOS[3] = \<const0> ;
  assign m_axi_BUS0_ARQOS[2] = \<const0> ;
  assign m_axi_BUS0_ARQOS[1] = \<const0> ;
  assign m_axi_BUS0_ARQOS[0] = \<const0> ;
  assign m_axi_BUS0_ARREGION[3] = \<const0> ;
  assign m_axi_BUS0_ARREGION[2] = \<const0> ;
  assign m_axi_BUS0_ARREGION[1] = \<const0> ;
  assign m_axi_BUS0_ARREGION[0] = \<const0> ;
  assign m_axi_BUS0_ARSIZE[2] = \<const0> ;
  assign m_axi_BUS0_ARSIZE[1] = \<const0> ;
  assign m_axi_BUS0_ARSIZE[0] = \<const0> ;
  assign m_axi_BUS0_ARUSER[0] = \<const0> ;
  assign m_axi_BUS0_AWADDR[63] = \<const0> ;
  assign m_axi_BUS0_AWADDR[62] = \<const0> ;
  assign m_axi_BUS0_AWADDR[61] = \<const0> ;
  assign m_axi_BUS0_AWADDR[60] = \<const0> ;
  assign m_axi_BUS0_AWADDR[59] = \<const0> ;
  assign m_axi_BUS0_AWADDR[58] = \<const0> ;
  assign m_axi_BUS0_AWADDR[57] = \<const0> ;
  assign m_axi_BUS0_AWADDR[56] = \<const0> ;
  assign m_axi_BUS0_AWADDR[55] = \<const0> ;
  assign m_axi_BUS0_AWADDR[54] = \<const0> ;
  assign m_axi_BUS0_AWADDR[53] = \<const0> ;
  assign m_axi_BUS0_AWADDR[52] = \<const0> ;
  assign m_axi_BUS0_AWADDR[51] = \<const0> ;
  assign m_axi_BUS0_AWADDR[50] = \<const0> ;
  assign m_axi_BUS0_AWADDR[49] = \<const0> ;
  assign m_axi_BUS0_AWADDR[48] = \<const0> ;
  assign m_axi_BUS0_AWADDR[47] = \<const0> ;
  assign m_axi_BUS0_AWADDR[46] = \<const0> ;
  assign m_axi_BUS0_AWADDR[45] = \<const0> ;
  assign m_axi_BUS0_AWADDR[44] = \<const0> ;
  assign m_axi_BUS0_AWADDR[43] = \<const0> ;
  assign m_axi_BUS0_AWADDR[42] = \<const0> ;
  assign m_axi_BUS0_AWADDR[41] = \<const0> ;
  assign m_axi_BUS0_AWADDR[40] = \<const0> ;
  assign m_axi_BUS0_AWADDR[39] = \<const0> ;
  assign m_axi_BUS0_AWADDR[38] = \<const0> ;
  assign m_axi_BUS0_AWADDR[37] = \<const0> ;
  assign m_axi_BUS0_AWADDR[36] = \<const0> ;
  assign m_axi_BUS0_AWADDR[35] = \<const0> ;
  assign m_axi_BUS0_AWADDR[34] = \<const0> ;
  assign m_axi_BUS0_AWADDR[33] = \<const0> ;
  assign m_axi_BUS0_AWADDR[32] = \<const0> ;
  assign m_axi_BUS0_AWADDR[31] = \<const0> ;
  assign m_axi_BUS0_AWADDR[30] = \<const0> ;
  assign m_axi_BUS0_AWADDR[29] = \<const0> ;
  assign m_axi_BUS0_AWADDR[28] = \<const0> ;
  assign m_axi_BUS0_AWADDR[27] = \<const0> ;
  assign m_axi_BUS0_AWADDR[26] = \<const0> ;
  assign m_axi_BUS0_AWADDR[25] = \<const0> ;
  assign m_axi_BUS0_AWADDR[24] = \<const0> ;
  assign m_axi_BUS0_AWADDR[23] = \<const0> ;
  assign m_axi_BUS0_AWADDR[22] = \<const0> ;
  assign m_axi_BUS0_AWADDR[21] = \<const0> ;
  assign m_axi_BUS0_AWADDR[20] = \<const0> ;
  assign m_axi_BUS0_AWADDR[19] = \<const0> ;
  assign m_axi_BUS0_AWADDR[18] = \<const0> ;
  assign m_axi_BUS0_AWADDR[17] = \<const0> ;
  assign m_axi_BUS0_AWADDR[16] = \<const0> ;
  assign m_axi_BUS0_AWADDR[15] = \<const0> ;
  assign m_axi_BUS0_AWADDR[14] = \<const0> ;
  assign m_axi_BUS0_AWADDR[13] = \<const0> ;
  assign m_axi_BUS0_AWADDR[12] = \<const0> ;
  assign m_axi_BUS0_AWADDR[11] = \<const0> ;
  assign m_axi_BUS0_AWADDR[10] = \<const0> ;
  assign m_axi_BUS0_AWADDR[9] = \<const0> ;
  assign m_axi_BUS0_AWADDR[8] = \<const0> ;
  assign m_axi_BUS0_AWADDR[7] = \<const0> ;
  assign m_axi_BUS0_AWADDR[6] = \<const0> ;
  assign m_axi_BUS0_AWADDR[5] = \<const0> ;
  assign m_axi_BUS0_AWADDR[4] = \<const0> ;
  assign m_axi_BUS0_AWADDR[3] = \<const0> ;
  assign m_axi_BUS0_AWADDR[2] = \<const0> ;
  assign m_axi_BUS0_AWADDR[1] = \<const0> ;
  assign m_axi_BUS0_AWADDR[0] = \<const0> ;
  assign m_axi_BUS0_AWBURST[1] = \<const0> ;
  assign m_axi_BUS0_AWBURST[0] = \<const0> ;
  assign m_axi_BUS0_AWCACHE[3] = \<const0> ;
  assign m_axi_BUS0_AWCACHE[2] = \<const0> ;
  assign m_axi_BUS0_AWCACHE[1] = \<const0> ;
  assign m_axi_BUS0_AWCACHE[0] = \<const0> ;
  assign m_axi_BUS0_AWID[0] = \<const0> ;
  assign m_axi_BUS0_AWLEN[7] = \<const0> ;
  assign m_axi_BUS0_AWLEN[6] = \<const0> ;
  assign m_axi_BUS0_AWLEN[5] = \<const0> ;
  assign m_axi_BUS0_AWLEN[4] = \<const0> ;
  assign m_axi_BUS0_AWLEN[3] = \<const0> ;
  assign m_axi_BUS0_AWLEN[2] = \<const0> ;
  assign m_axi_BUS0_AWLEN[1] = \<const0> ;
  assign m_axi_BUS0_AWLEN[0] = \<const0> ;
  assign m_axi_BUS0_AWLOCK[1] = \<const0> ;
  assign m_axi_BUS0_AWLOCK[0] = \<const0> ;
  assign m_axi_BUS0_AWPROT[2] = \<const0> ;
  assign m_axi_BUS0_AWPROT[1] = \<const0> ;
  assign m_axi_BUS0_AWPROT[0] = \<const0> ;
  assign m_axi_BUS0_AWQOS[3] = \<const0> ;
  assign m_axi_BUS0_AWQOS[2] = \<const0> ;
  assign m_axi_BUS0_AWQOS[1] = \<const0> ;
  assign m_axi_BUS0_AWQOS[0] = \<const0> ;
  assign m_axi_BUS0_AWREGION[3] = \<const0> ;
  assign m_axi_BUS0_AWREGION[2] = \<const0> ;
  assign m_axi_BUS0_AWREGION[1] = \<const0> ;
  assign m_axi_BUS0_AWREGION[0] = \<const0> ;
  assign m_axi_BUS0_AWSIZE[2] = \<const0> ;
  assign m_axi_BUS0_AWSIZE[1] = \<const0> ;
  assign m_axi_BUS0_AWSIZE[0] = \<const0> ;
  assign m_axi_BUS0_AWUSER[0] = \<const0> ;
  assign m_axi_BUS0_AWVALID = \<const0> ;
  assign m_axi_BUS0_WDATA[31] = \<const0> ;
  assign m_axi_BUS0_WDATA[30] = \<const0> ;
  assign m_axi_BUS0_WDATA[29] = \<const0> ;
  assign m_axi_BUS0_WDATA[28] = \<const0> ;
  assign m_axi_BUS0_WDATA[27] = \<const0> ;
  assign m_axi_BUS0_WDATA[26] = \<const0> ;
  assign m_axi_BUS0_WDATA[25] = \<const0> ;
  assign m_axi_BUS0_WDATA[24] = \<const0> ;
  assign m_axi_BUS0_WDATA[23] = \<const0> ;
  assign m_axi_BUS0_WDATA[22] = \<const0> ;
  assign m_axi_BUS0_WDATA[21] = \<const0> ;
  assign m_axi_BUS0_WDATA[20] = \<const0> ;
  assign m_axi_BUS0_WDATA[19] = \<const0> ;
  assign m_axi_BUS0_WDATA[18] = \<const0> ;
  assign m_axi_BUS0_WDATA[17] = \<const0> ;
  assign m_axi_BUS0_WDATA[16] = \<const0> ;
  assign m_axi_BUS0_WDATA[15] = \<const0> ;
  assign m_axi_BUS0_WDATA[14] = \<const0> ;
  assign m_axi_BUS0_WDATA[13] = \<const0> ;
  assign m_axi_BUS0_WDATA[12] = \<const0> ;
  assign m_axi_BUS0_WDATA[11] = \<const0> ;
  assign m_axi_BUS0_WDATA[10] = \<const0> ;
  assign m_axi_BUS0_WDATA[9] = \<const0> ;
  assign m_axi_BUS0_WDATA[8] = \<const0> ;
  assign m_axi_BUS0_WDATA[7] = \<const0> ;
  assign m_axi_BUS0_WDATA[6] = \<const0> ;
  assign m_axi_BUS0_WDATA[5] = \<const0> ;
  assign m_axi_BUS0_WDATA[4] = \<const0> ;
  assign m_axi_BUS0_WDATA[3] = \<const0> ;
  assign m_axi_BUS0_WDATA[2] = \<const0> ;
  assign m_axi_BUS0_WDATA[1] = \<const0> ;
  assign m_axi_BUS0_WDATA[0] = \<const0> ;
  assign m_axi_BUS0_WID[0] = \<const0> ;
  assign m_axi_BUS0_WLAST = \<const0> ;
  assign m_axi_BUS0_WSTRB[3] = \<const0> ;
  assign m_axi_BUS0_WSTRB[2] = \<const0> ;
  assign m_axi_BUS0_WSTRB[1] = \<const0> ;
  assign m_axi_BUS0_WSTRB[0] = \<const0> ;
  assign m_axi_BUS0_WUSER[0] = \<const0> ;
  assign m_axi_BUS0_WVALID = \<const0> ;
  assign s_axi_control_BRESP[1] = \<const0> ;
  assign s_axi_control_BRESP[0] = \<const0> ;
  assign s_axi_control_RRESP[1] = \<const0> ;
  assign s_axi_control_RRESP[0] = \<const0> ;
  design_1_read_romcode_0_0_read_romcode_BUS0_m_axi BUS0_m_axi_U
       (.BUS0_RVALID(BUS0_RVALID),
        .D({m_axi_BUS0_RLAST,m_axi_BUS0_RDATA}),
        .Q({ap_CS_fsm_state10,\ap_CS_fsm_reg_n_2_[6] ,\ap_CS_fsm_reg_n_2_[5] ,\ap_CS_fsm_reg_n_2_[4] ,ap_CS_fsm_state2}),
        .\ap_CS_fsm_reg[2] (\icmp_ln31_reg_153_reg_n_2_[0] ),
        .ap_NS_fsm(ap_NS_fsm[2]),
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .\could_multi_bursts.ARVALID_Dummy_reg (m_axi_BUS0_ARVALID),
        .dout({\load_unit/burst_ready ,BUS0_RDATA}),
        .\dout_reg[61] (sext_ln31_fu_131_p1),
        .dout_vld_reg(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_n_3),
        .full_n_reg(BUS0_m_axi_U_n_69),
        .m_axi_BUS0_ARADDR(\^m_axi_BUS0_ARADDR ),
        .m_axi_BUS0_ARLEN(\^m_axi_BUS0_ARLEN ),
        .m_axi_BUS0_ARREADY(m_axi_BUS0_ARREADY),
        .m_axi_BUS0_BREADY(m_axi_BUS0_BREADY),
        .m_axi_BUS0_BVALID(m_axi_BUS0_BVALID),
        .m_axi_BUS0_RVALID(m_axi_BUS0_RVALID),
        .ready_for_outstanding(\load_unit/ready_for_outstanding ),
        .reset(internal_bram_Rst_A),
        .s_ready_t_reg(m_axi_BUS0_RREADY),
        .select_ln26_reg_147(select_ln26_reg_147));
  GND GND
       (.G(\<const0> ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF8)) 
    \ap_CS_fsm[1]_i_3 
       (.I0(\icmp_ln31_reg_153_reg_n_2_[0] ),
        .I1(ap_CS_fsm_state2),
        .I2(ap_CS_fsm_state9),
        .I3(\ap_CS_fsm_reg_n_2_[2] ),
        .I4(\ap_CS_fsm_reg_n_2_[7] ),
        .I5(\ap_CS_fsm_reg_n_2_[3] ),
        .O(\ap_CS_fsm[1]_i_3_n_2 ));
  (* FSM_ENCODING = "none" *) 
  FDSE #(
    .INIT(1'b1)) 
    \ap_CS_fsm_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[0]),
        .Q(ap_CS_fsm_state1),
        .S(internal_bram_Rst_A));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[1]),
        .Q(ap_CS_fsm_state2),
        .R(internal_bram_Rst_A));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[2]),
        .Q(\ap_CS_fsm_reg_n_2_[2] ),
        .R(internal_bram_Rst_A));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[3] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\ap_CS_fsm_reg_n_2_[2] ),
        .Q(\ap_CS_fsm_reg_n_2_[3] ),
        .R(internal_bram_Rst_A));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[4] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\ap_CS_fsm_reg_n_2_[3] ),
        .Q(\ap_CS_fsm_reg_n_2_[4] ),
        .R(internal_bram_Rst_A));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[5] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\ap_CS_fsm_reg_n_2_[4] ),
        .Q(\ap_CS_fsm_reg_n_2_[5] ),
        .R(internal_bram_Rst_A));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[6] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\ap_CS_fsm_reg_n_2_[5] ),
        .Q(\ap_CS_fsm_reg_n_2_[6] ),
        .R(internal_bram_Rst_A));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[7] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\ap_CS_fsm_reg_n_2_[6] ),
        .Q(\ap_CS_fsm_reg_n_2_[7] ),
        .R(internal_bram_Rst_A));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[8] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\ap_CS_fsm_reg_n_2_[7] ),
        .Q(ap_CS_fsm_state9),
        .R(internal_bram_Rst_A));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[9] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[9]),
        .Q(ap_CS_fsm_state10),
        .R(internal_bram_Rst_A));
  design_1_read_romcode_0_0_read_romcode_control_s_axi control_s_axi_U
       (.D(ap_NS_fsm[1:0]),
        .\FSM_onehot_rstate_reg[1]_0 (s_axi_control_ARREADY),
        .\FSM_onehot_wstate_reg[1]_0 (s_axi_control_AWREADY),
        .\FSM_onehot_wstate_reg[2]_0 (s_axi_control_WREADY),
        .Q(ap_CS_fsm_state1),
        .SR(internal_bram_Rst_A),
        .\ap_CS_fsm_reg[1] (BUS0_m_axi_U_n_69),
        .\ap_CS_fsm_reg[1]_0 (\ap_CS_fsm[1]_i_3_n_2 ),
        .ap_clk(ap_clk),
        .ap_done(ap_done),
        .\icmp_ln31_reg_153_reg[0] (control_s_axi_U_n_83),
        .\icmp_ln31_reg_153_reg[0]_0 (\icmp_ln31_reg_153_reg_n_2_[0] ),
        .\int_length_r_reg[10]_0 ({control_s_axi_U_n_72,control_s_axi_U_n_73,control_s_axi_U_n_74,control_s_axi_U_n_75,control_s_axi_U_n_76,control_s_axi_U_n_77,control_s_axi_U_n_78,control_s_axi_U_n_79,control_s_axi_U_n_80,control_s_axi_U_n_81,control_s_axi_U_n_82}),
        .\int_length_r_reg[11]_0 (control_s_axi_U_n_3),
        .\int_romcode_reg[63]_0 (romcode),
        .interrupt(interrupt),
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
        .s_axi_control_WVALID(s_axi_control_WVALID),
        .sel0(sel0));
  design_1_read_romcode_0_0_read_romcode_read_romcode_Pipeline_VITIS_LOOP_31_1 grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84
       (.BUS0_RVALID(BUS0_RVALID),
        .D(ap_NS_fsm[9]),
        .Q({ap_CS_fsm_state10,ap_CS_fsm_state9,ap_CS_fsm_state2}),
        .\ap_CS_fsm_reg[8] (grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_n_7),
        .\ap_CS_fsm_reg[9] (\icmp_ln31_reg_153_reg_n_2_[0] ),
        .ap_clk(ap_clk),
        .ap_done(ap_done),
        .ap_rst_n(ap_rst_n),
        .dout({\load_unit/burst_ready ,BUS0_RDATA}),
        .dout_vld_reg(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_n_3),
        .grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .internal_bram_Addr_A(\^internal_bram_Addr_A ),
        .internal_bram_Din_A(internal_bram_Din_A),
        .internal_bram_EN_A(internal_bram_EN_A),
        .internal_bram_Rst_A(internal_bram_Rst_A),
        .ready_for_outstanding(\load_unit/ready_for_outstanding ),
        .select_ln26_reg_147(select_ln26_reg_147));
  FDRE #(
    .INIT(1'b0)) 
    grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_n_7),
        .Q(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .R(internal_bram_Rst_A));
  FDRE \icmp_ln31_reg_153_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(control_s_axi_U_n_83),
        .Q(\icmp_ln31_reg_153_reg_n_2_[0] ),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[10]),
        .Q(sext_ln31_fu_131_p1[8]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[11] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[11]),
        .Q(sext_ln31_fu_131_p1[9]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[12] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[12]),
        .Q(sext_ln31_fu_131_p1[10]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[13] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[13]),
        .Q(sext_ln31_fu_131_p1[11]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[14] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[14]),
        .Q(sext_ln31_fu_131_p1[12]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[15] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[15]),
        .Q(sext_ln31_fu_131_p1[13]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[16] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[16]),
        .Q(sext_ln31_fu_131_p1[14]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[17] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[17]),
        .Q(sext_ln31_fu_131_p1[15]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[18] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[18]),
        .Q(sext_ln31_fu_131_p1[16]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[19] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[19]),
        .Q(sext_ln31_fu_131_p1[17]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[20] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[20]),
        .Q(sext_ln31_fu_131_p1[18]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[21] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[21]),
        .Q(sext_ln31_fu_131_p1[19]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[22] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[22]),
        .Q(sext_ln31_fu_131_p1[20]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[23] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[23]),
        .Q(sext_ln31_fu_131_p1[21]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[24] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[24]),
        .Q(sext_ln31_fu_131_p1[22]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[25] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[25]),
        .Q(sext_ln31_fu_131_p1[23]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[26] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[26]),
        .Q(sext_ln31_fu_131_p1[24]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[27] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[27]),
        .Q(sext_ln31_fu_131_p1[25]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[28] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[28]),
        .Q(sext_ln31_fu_131_p1[26]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[29] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[29]),
        .Q(sext_ln31_fu_131_p1[27]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[2]),
        .Q(sext_ln31_fu_131_p1[0]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[30] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[30]),
        .Q(sext_ln31_fu_131_p1[28]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[31] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[31]),
        .Q(sext_ln31_fu_131_p1[29]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[32] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[32]),
        .Q(sext_ln31_fu_131_p1[30]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[33] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[33]),
        .Q(sext_ln31_fu_131_p1[31]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[34] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[34]),
        .Q(sext_ln31_fu_131_p1[32]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[35] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[35]),
        .Q(sext_ln31_fu_131_p1[33]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[36] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[36]),
        .Q(sext_ln31_fu_131_p1[34]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[37] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[37]),
        .Q(sext_ln31_fu_131_p1[35]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[38] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[38]),
        .Q(sext_ln31_fu_131_p1[36]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[39] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[39]),
        .Q(sext_ln31_fu_131_p1[37]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[3]),
        .Q(sext_ln31_fu_131_p1[1]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[40] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[40]),
        .Q(sext_ln31_fu_131_p1[38]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[41] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[41]),
        .Q(sext_ln31_fu_131_p1[39]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[42] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[42]),
        .Q(sext_ln31_fu_131_p1[40]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[43] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[43]),
        .Q(sext_ln31_fu_131_p1[41]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[44] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[44]),
        .Q(sext_ln31_fu_131_p1[42]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[45] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[45]),
        .Q(sext_ln31_fu_131_p1[43]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[46] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[46]),
        .Q(sext_ln31_fu_131_p1[44]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[47] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[47]),
        .Q(sext_ln31_fu_131_p1[45]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[48] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[48]),
        .Q(sext_ln31_fu_131_p1[46]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[49] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[49]),
        .Q(sext_ln31_fu_131_p1[47]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[4]),
        .Q(sext_ln31_fu_131_p1[2]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[50] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[50]),
        .Q(sext_ln31_fu_131_p1[48]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[51] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[51]),
        .Q(sext_ln31_fu_131_p1[49]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[52] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[52]),
        .Q(sext_ln31_fu_131_p1[50]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[53] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[53]),
        .Q(sext_ln31_fu_131_p1[51]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[54] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[54]),
        .Q(sext_ln31_fu_131_p1[52]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[55] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[55]),
        .Q(sext_ln31_fu_131_p1[53]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[56] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[56]),
        .Q(sext_ln31_fu_131_p1[54]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[57] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[57]),
        .Q(sext_ln31_fu_131_p1[55]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[58] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[58]),
        .Q(sext_ln31_fu_131_p1[56]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[59] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[59]),
        .Q(sext_ln31_fu_131_p1[57]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[5]),
        .Q(sext_ln31_fu_131_p1[3]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[60] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[60]),
        .Q(sext_ln31_fu_131_p1[58]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[61] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[61]),
        .Q(sext_ln31_fu_131_p1[59]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[62] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[62]),
        .Q(sext_ln31_fu_131_p1[60]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[63] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[63]),
        .Q(sext_ln31_fu_131_p1[61]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[6]),
        .Q(sext_ln31_fu_131_p1[4]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[7]),
        .Q(sext_ln31_fu_131_p1[5]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[8]),
        .Q(sext_ln31_fu_131_p1[6]),
        .R(1'b0));
  FDRE \romcode_read_reg_142_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(romcode[9]),
        .Q(sext_ln31_fu_131_p1[7]),
        .R(1'b0));
  FDRE \select_ln26_reg_147_reg[0] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(control_s_axi_U_n_82),
        .Q(select_ln26_reg_147[0]),
        .R(control_s_axi_U_n_3));
  FDRE \select_ln26_reg_147_reg[10] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(control_s_axi_U_n_72),
        .Q(select_ln26_reg_147[10]),
        .R(control_s_axi_U_n_3));
  FDRE \select_ln26_reg_147_reg[11] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(sel0),
        .Q(select_ln26_reg_147[11]),
        .R(1'b0));
  FDRE \select_ln26_reg_147_reg[1] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(control_s_axi_U_n_81),
        .Q(select_ln26_reg_147[1]),
        .R(control_s_axi_U_n_3));
  FDRE \select_ln26_reg_147_reg[2] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(control_s_axi_U_n_80),
        .Q(select_ln26_reg_147[2]),
        .R(control_s_axi_U_n_3));
  FDRE \select_ln26_reg_147_reg[3] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(control_s_axi_U_n_79),
        .Q(select_ln26_reg_147[3]),
        .R(control_s_axi_U_n_3));
  FDRE \select_ln26_reg_147_reg[4] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(control_s_axi_U_n_78),
        .Q(select_ln26_reg_147[4]),
        .R(control_s_axi_U_n_3));
  FDRE \select_ln26_reg_147_reg[5] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(control_s_axi_U_n_77),
        .Q(select_ln26_reg_147[5]),
        .R(control_s_axi_U_n_3));
  FDRE \select_ln26_reg_147_reg[6] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(control_s_axi_U_n_76),
        .Q(select_ln26_reg_147[6]),
        .R(control_s_axi_U_n_3));
  FDRE \select_ln26_reg_147_reg[7] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(control_s_axi_U_n_75),
        .Q(select_ln26_reg_147[7]),
        .R(control_s_axi_U_n_3));
  FDRE \select_ln26_reg_147_reg[8] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(control_s_axi_U_n_74),
        .Q(select_ln26_reg_147[8]),
        .R(control_s_axi_U_n_3));
  FDRE \select_ln26_reg_147_reg[9] 
       (.C(ap_clk),
        .CE(ap_CS_fsm_state1),
        .D(control_s_axi_U_n_73),
        .Q(select_ln26_reg_147[9]),
        .R(control_s_axi_U_n_3));
endmodule

(* ORIG_REF_NAME = "read_romcode_BUS0_m_axi" *) 
module design_1_read_romcode_0_0_read_romcode_BUS0_m_axi
   (reset,
    BUS0_RVALID,
    s_ready_t_reg,
    \could_multi_bursts.ARVALID_Dummy_reg ,
    m_axi_BUS0_ARADDR,
    ap_NS_fsm,
    full_n_reg,
    m_axi_BUS0_ARLEN,
    m_axi_BUS0_BREADY,
    dout,
    ap_clk,
    ready_for_outstanding,
    ap_rst_n,
    dout_vld_reg,
    Q,
    \dout_reg[61] ,
    select_ln26_reg_147,
    \ap_CS_fsm_reg[2] ,
    m_axi_BUS0_ARREADY,
    m_axi_BUS0_RVALID,
    D,
    m_axi_BUS0_BVALID);
  output reset;
  output BUS0_RVALID;
  output s_ready_t_reg;
  output \could_multi_bursts.ARVALID_Dummy_reg ;
  output [61:0]m_axi_BUS0_ARADDR;
  output [0:0]ap_NS_fsm;
  output full_n_reg;
  output [5:0]m_axi_BUS0_ARLEN;
  output m_axi_BUS0_BREADY;
  output [32:0]dout;
  input ap_clk;
  input ready_for_outstanding;
  input ap_rst_n;
  input dout_vld_reg;
  input [4:0]Q;
  input [61:0]\dout_reg[61] ;
  input [11:0]select_ln26_reg_147;
  input \ap_CS_fsm_reg[2] ;
  input m_axi_BUS0_ARREADY;
  input m_axi_BUS0_RVALID;
  input [32:0]D;
  input m_axi_BUS0_BVALID;

  wire [63:2]ARADDR_Dummy;
  wire [31:2]ARLEN_Dummy;
  wire ARREADY_Dummy;
  wire ARVALID_Dummy;
  wire BUS0_RVALID;
  wire [32:0]D;
  wire [4:0]Q;
  wire RBURST_READY_Dummy;
  wire [31:0]RDATA_Dummy;
  wire [0:0]RLAST_Dummy;
  wire RREADY_Dummy;
  wire RVALID_Dummy;
  wire \ap_CS_fsm_reg[2] ;
  wire [0:0]ap_NS_fsm;
  wire ap_clk;
  wire ap_rst_n;
  wire \buff_rdata/push ;
  wire burst_end;
  wire \could_multi_bursts.ARVALID_Dummy_reg ;
  wire [32:0]dout;
  wire [61:0]\dout_reg[61] ;
  wire dout_vld_reg;
  wire full_n_reg;
  wire [61:0]m_axi_BUS0_ARADDR;
  wire [5:0]m_axi_BUS0_ARLEN;
  wire m_axi_BUS0_ARREADY;
  wire m_axi_BUS0_BREADY;
  wire m_axi_BUS0_BVALID;
  wire m_axi_BUS0_RVALID;
  wire ready_for_outstanding;
  wire reset;
  wire s_ready_t_reg;
  wire [11:0]select_ln26_reg_147;

  design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_read bus_read
       (.ARREADY_Dummy(ARREADY_Dummy),
        .ARVALID_Dummy(ARVALID_Dummy),
        .D({ARLEN_Dummy[31],ARLEN_Dummy[13:2],ARADDR_Dummy}),
        .Q({burst_end,RDATA_Dummy}),
        .RBURST_READY_Dummy(RBURST_READY_Dummy),
        .RREADY_Dummy(RREADY_Dummy),
        .SR(reset),
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .\could_multi_bursts.ARVALID_Dummy_reg_0 (\could_multi_bursts.ARVALID_Dummy_reg ),
        .\data_p2_reg[32] (D),
        .din(RLAST_Dummy),
        .m_axi_BUS0_ARADDR(m_axi_BUS0_ARADDR),
        .m_axi_BUS0_ARLEN(m_axi_BUS0_ARLEN),
        .m_axi_BUS0_ARREADY(m_axi_BUS0_ARREADY),
        .m_axi_BUS0_RVALID(m_axi_BUS0_RVALID),
        .s_ready_t_reg(s_ready_t_reg),
        .\state_reg[0] (RVALID_Dummy),
        .we(\buff_rdata/push ));
  design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_write bus_write
       (.SR(reset),
        .ap_clk(ap_clk),
        .m_axi_BUS0_BREADY(m_axi_BUS0_BREADY),
        .m_axi_BUS0_BVALID(m_axi_BUS0_BVALID));
  design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_load load_unit
       (.ARREADY_Dummy(ARREADY_Dummy),
        .ARVALID_Dummy(ARVALID_Dummy),
        .BUS0_RVALID(BUS0_RVALID),
        .D({ARLEN_Dummy[31],ARLEN_Dummy[13:2],ARADDR_Dummy}),
        .Q(Q),
        .RBURST_READY_Dummy(RBURST_READY_Dummy),
        .RREADY_Dummy(RREADY_Dummy),
        .SR(reset),
        .\ap_CS_fsm_reg[2] (\ap_CS_fsm_reg[2] ),
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .din({burst_end,RLAST_Dummy,RDATA_Dummy}),
        .dout(dout),
        .\dout_reg[61] (\dout_reg[61] ),
        .dout_vld_reg(dout_vld_reg),
        .full_n_reg(full_n_reg),
        .\icmp_ln31_reg_153_reg[0] (ap_NS_fsm),
        .\mOutPtr_reg[10] (RVALID_Dummy),
        .ready_for_outstanding(ready_for_outstanding),
        .select_ln26_reg_147(select_ln26_reg_147),
        .we(\buff_rdata/push ));
endmodule

(* ORIG_REF_NAME = "read_romcode_BUS0_m_axi_fifo" *) 
module design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_fifo
   (\icmp_ln31_reg_153_reg[0] ,
    E,
    Q,
    full_n_reg_0,
    S,
    \dout_reg[70] ,
    \dout_reg[66] ,
    \dout_reg[75] ,
    s_ready_t_reg,
    SR,
    ap_clk,
    ap_rst_n,
    ARREADY_Dummy,
    tmp_valid_reg,
    \ap_CS_fsm_reg[1] ,
    \dout_reg[61] ,
    select_ln26_reg_147,
    \ap_CS_fsm_reg[2] );
  output \icmp_ln31_reg_153_reg[0] ;
  output [0:0]E;
  output [73:0]Q;
  output full_n_reg_0;
  output [3:0]S;
  output [3:0]\dout_reg[70] ;
  output [2:0]\dout_reg[66] ;
  output [0:0]\dout_reg[75] ;
  output s_ready_t_reg;
  input [0:0]SR;
  input ap_clk;
  input ap_rst_n;
  input ARREADY_Dummy;
  input tmp_valid_reg;
  input [4:0]\ap_CS_fsm_reg[1] ;
  input [61:0]\dout_reg[61] ;
  input [11:0]select_ln26_reg_147;
  input \ap_CS_fsm_reg[2] ;

  wire ARREADY_Dummy;
  wire BUS0_ARREADY;
  wire [0:0]E;
  wire [73:0]Q;
  wire [3:0]S;
  wire [0:0]SR;
  wire [4:0]\ap_CS_fsm_reg[1] ;
  wire \ap_CS_fsm_reg[2] ;
  wire ap_clk;
  wire ap_rst_n;
  wire [61:0]\dout_reg[61] ;
  wire [2:0]\dout_reg[66] ;
  wire [3:0]\dout_reg[70] ;
  wire [0:0]\dout_reg[75] ;
  wire dout_vld_i_1_n_2;
  wire empty_n_i_1_n_2;
  wire empty_n_i_2_n_2;
  wire empty_n_reg_n_2;
  wire full_n_i_1_n_2;
  wire full_n_reg_0;
  wire \icmp_ln31_reg_153_reg[0] ;
  wire \mOutPtr[0]_i_1_n_2 ;
  wire \mOutPtr[1]_i_1__0_n_2 ;
  wire \mOutPtr[2]_i_1__0_n_2 ;
  wire \mOutPtr[3]_i_1_n_2 ;
  wire \mOutPtr[3]_i_2_n_2 ;
  wire \mOutPtr_reg_n_2_[0] ;
  wire \mOutPtr_reg_n_2_[1] ;
  wire \mOutPtr_reg_n_2_[2] ;
  wire \mOutPtr_reg_n_2_[3] ;
  wire p_1_in;
  wire pop;
  wire \raddr[0]_i_1_n_2 ;
  wire \raddr[1]_i_1_n_2 ;
  wire \raddr[2]_i_1_n_2 ;
  wire \raddr_reg_n_2_[0] ;
  wire \raddr_reg_n_2_[1] ;
  wire \raddr_reg_n_2_[2] ;
  wire rreq_valid;
  wire s_ready_t_reg;
  wire [11:0]select_ln26_reg_147;
  wire tmp_valid_reg;

  design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_srl U_fifo_srl
       (.ARREADY_Dummy(ARREADY_Dummy),
        .BUS0_ARREADY(BUS0_ARREADY),
        .E(E),
        .Q(Q),
        .S(S),
        .SR(SR),
        .\ap_CS_fsm_reg[2] (\ap_CS_fsm_reg[2] ),
        .\ap_CS_fsm_reg[2]_0 (\ap_CS_fsm_reg[1] [0]),
        .ap_clk(ap_clk),
        .\dout_reg[0]_0 (empty_n_reg_n_2),
        .\dout_reg[61]_0 (\dout_reg[61] ),
        .\dout_reg[66]_0 (\dout_reg[66] ),
        .\dout_reg[70]_0 (\dout_reg[70] ),
        .\dout_reg[75]_0 (\dout_reg[75] ),
        .\dout_reg[75]_1 (\raddr_reg_n_2_[0] ),
        .\dout_reg[75]_2 (\raddr_reg_n_2_[1] ),
        .\icmp_ln31_reg_153_reg[0] (\icmp_ln31_reg_153_reg[0] ),
        .pop(pop),
        .rreq_valid(rreq_valid),
        .s_ready_t_reg(s_ready_t_reg),
        .select_ln26_reg_147(select_ln26_reg_147),
        .tmp_valid_reg(tmp_valid_reg));
  LUT6 #(
    .INIT(64'h0000000000000007)) 
    \ap_CS_fsm[1]_i_2 
       (.I0(BUS0_ARREADY),
        .I1(\ap_CS_fsm_reg[1] [0]),
        .I2(\ap_CS_fsm_reg[1] [4]),
        .I3(\ap_CS_fsm_reg[1] [1]),
        .I4(\ap_CS_fsm_reg[1] [2]),
        .I5(\ap_CS_fsm_reg[1] [3]),
        .O(full_n_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT4 #(
    .INIT(16'hAEAA)) 
    dout_vld_i_1
       (.I0(empty_n_reg_n_2),
        .I1(tmp_valid_reg),
        .I2(ARREADY_Dummy),
        .I3(rreq_valid),
        .O(dout_vld_i_1_n_2));
  FDRE #(
    .INIT(1'b0)) 
    dout_vld_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(dout_vld_i_1_n_2),
        .Q(rreq_valid),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFFFBFF00FFFB00)) 
    empty_n_i_1
       (.I0(\mOutPtr_reg_n_2_[1] ),
        .I1(\mOutPtr_reg_n_2_[0] ),
        .I2(empty_n_i_2_n_2),
        .I3(pop),
        .I4(\icmp_ln31_reg_153_reg[0] ),
        .I5(empty_n_reg_n_2),
        .O(empty_n_i_1_n_2));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT2 #(
    .INIT(4'hE)) 
    empty_n_i_2
       (.I0(\mOutPtr_reg_n_2_[2] ),
        .I1(\mOutPtr_reg_n_2_[3] ),
        .O(empty_n_i_2_n_2));
  FDRE #(
    .INIT(1'b0)) 
    empty_n_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(empty_n_i_1_n_2),
        .Q(empty_n_reg_n_2),
        .R(SR));
  LUT5 #(
    .INIT(32'hFFDF5FD5)) 
    full_n_i_1
       (.I0(ap_rst_n),
        .I1(p_1_in),
        .I2(\icmp_ln31_reg_153_reg[0] ),
        .I3(pop),
        .I4(BUS0_ARREADY),
        .O(full_n_i_1_n_2));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT4 #(
    .INIT(16'hFFF7)) 
    full_n_i_2
       (.I0(\mOutPtr_reg_n_2_[1] ),
        .I1(\mOutPtr_reg_n_2_[0] ),
        .I2(\mOutPtr_reg_n_2_[3] ),
        .I3(\mOutPtr_reg_n_2_[2] ),
        .O(p_1_in));
  FDRE #(
    .INIT(1'b1)) 
    full_n_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(full_n_i_1_n_2),
        .Q(BUS0_ARREADY),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \mOutPtr[0]_i_1 
       (.I0(\mOutPtr_reg_n_2_[0] ),
        .O(\mOutPtr[0]_i_1_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT4 #(
    .INIT(16'hB44B)) 
    \mOutPtr[1]_i_1__0 
       (.I0(pop),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .I2(\mOutPtr_reg_n_2_[1] ),
        .I3(\mOutPtr_reg_n_2_[0] ),
        .O(\mOutPtr[1]_i_1__0_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT5 #(
    .INIT(32'hA96AA9A9)) 
    \mOutPtr[2]_i_1__0 
       (.I0(\mOutPtr_reg_n_2_[2] ),
        .I1(\mOutPtr_reg_n_2_[1] ),
        .I2(\mOutPtr_reg_n_2_[0] ),
        .I3(pop),
        .I4(\icmp_ln31_reg_153_reg[0] ),
        .O(\mOutPtr[2]_i_1__0_n_2 ));
  LUT5 #(
    .INIT(32'h20FFDF00)) 
    \mOutPtr[3]_i_1 
       (.I0(rreq_valid),
        .I1(ARREADY_Dummy),
        .I2(tmp_valid_reg),
        .I3(empty_n_reg_n_2),
        .I4(\icmp_ln31_reg_153_reg[0] ),
        .O(\mOutPtr[3]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'hAA6AAAAAAAAA99A9)) 
    \mOutPtr[3]_i_2 
       (.I0(\mOutPtr_reg_n_2_[3] ),
        .I1(\mOutPtr_reg_n_2_[2] ),
        .I2(\icmp_ln31_reg_153_reg[0] ),
        .I3(pop),
        .I4(\mOutPtr_reg_n_2_[0] ),
        .I5(\mOutPtr_reg_n_2_[1] ),
        .O(\mOutPtr[3]_i_2_n_2 ));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[0] 
       (.C(ap_clk),
        .CE(\mOutPtr[3]_i_1_n_2 ),
        .D(\mOutPtr[0]_i_1_n_2 ),
        .Q(\mOutPtr_reg_n_2_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[1] 
       (.C(ap_clk),
        .CE(\mOutPtr[3]_i_1_n_2 ),
        .D(\mOutPtr[1]_i_1__0_n_2 ),
        .Q(\mOutPtr_reg_n_2_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[2] 
       (.C(ap_clk),
        .CE(\mOutPtr[3]_i_1_n_2 ),
        .D(\mOutPtr[2]_i_1__0_n_2 ),
        .Q(\mOutPtr_reg_n_2_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[3] 
       (.C(ap_clk),
        .CE(\mOutPtr[3]_i_1_n_2 ),
        .D(\mOutPtr[3]_i_2_n_2 ),
        .Q(\mOutPtr_reg_n_2_[3] ),
        .R(SR));
  LUT6 #(
    .INIT(64'h9999BBBB66624440)) 
    \raddr[0]_i_1 
       (.I0(\icmp_ln31_reg_153_reg[0] ),
        .I1(pop),
        .I2(\raddr_reg_n_2_[1] ),
        .I3(\raddr_reg_n_2_[2] ),
        .I4(empty_n_reg_n_2),
        .I5(\raddr_reg_n_2_[0] ),
        .O(\raddr[0]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'hF0F05AF0F00CF0F0)) 
    \raddr[1]_i_1 
       (.I0(empty_n_reg_n_2),
        .I1(\raddr_reg_n_2_[2] ),
        .I2(\raddr_reg_n_2_[1] ),
        .I3(\raddr_reg_n_2_[0] ),
        .I4(pop),
        .I5(\icmp_ln31_reg_153_reg[0] ),
        .O(\raddr[1]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'hCCCC6CCCCCC0CCCC)) 
    \raddr[2]_i_1 
       (.I0(empty_n_reg_n_2),
        .I1(\raddr_reg_n_2_[2] ),
        .I2(\raddr_reg_n_2_[1] ),
        .I3(\raddr_reg_n_2_[0] ),
        .I4(pop),
        .I5(\icmp_ln31_reg_153_reg[0] ),
        .O(\raddr[2]_i_1_n_2 ));
  FDRE #(
    .INIT(1'b0)) 
    \raddr_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\raddr[0]_i_1_n_2 ),
        .Q(\raddr_reg_n_2_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \raddr_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\raddr[1]_i_1_n_2 ),
        .Q(\raddr_reg_n_2_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \raddr_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\raddr[2]_i_1_n_2 ),
        .Q(\raddr_reg_n_2_[2] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \tmp_addr[63]_i_1 
       (.I0(rreq_valid),
        .I1(ARREADY_Dummy),
        .I2(tmp_valid_reg),
        .O(E));
endmodule

(* ORIG_REF_NAME = "read_romcode_BUS0_m_axi_fifo" *) 
module design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_fifo__parameterized1
   (SR,
    \sect_len_buf_reg[7] ,
    \could_multi_bursts.loop_cnt_reg[3] ,
    din,
    ap_clk,
    ap_rst_n,
    empty_n_reg_0,
    m_axi_BUS0_ARREADY,
    \mOutPtr_reg[0]_0 ,
    fifo_rctl_ready,
    \mOutPtr_reg[0]_1 ,
    Q,
    \dout_reg[0] ,
    RREADY_Dummy,
    \dout_reg[0]_0 ,
    \sect_cnt[51]_i_3 ,
    \sect_cnt[51]_i_3_0 );
  output [0:0]SR;
  output \sect_len_buf_reg[7] ;
  output \could_multi_bursts.loop_cnt_reg[3] ;
  output [0:0]din;
  input ap_clk;
  input ap_rst_n;
  input empty_n_reg_0;
  input m_axi_BUS0_ARREADY;
  input \mOutPtr_reg[0]_0 ;
  input fifo_rctl_ready;
  input \mOutPtr_reg[0]_1 ;
  input [0:0]Q;
  input [0:0]\dout_reg[0] ;
  input RREADY_Dummy;
  input \dout_reg[0]_0 ;
  input [3:0]\sect_cnt[51]_i_3 ;
  input [3:0]\sect_cnt[51]_i_3_0 ;

  wire [0:0]Q;
  wire RREADY_Dummy;
  wire [0:0]SR;
  wire ap_clk;
  wire ap_rst_n;
  wire burst_valid;
  wire \could_multi_bursts.loop_cnt_reg[3] ;
  wire [0:0]din;
  wire [0:0]\dout_reg[0] ;
  wire \dout_reg[0]_0 ;
  wire dout_vld_i_1__2_n_2;
  wire empty_n_i_1_n_2;
  wire empty_n_i_2__2_n_2;
  wire empty_n_reg_0;
  wire empty_n_reg_n_2;
  wire fifo_rctl_ready;
  wire full_n_i_1__2_n_2;
  wire full_n_i_2__2_n_2;
  wire full_n_reg_n_2;
  wire \mOutPtr[0]_i_1__2_n_2 ;
  wire \mOutPtr[1]_i_1__1_n_2 ;
  wire \mOutPtr[2]_i_1__1_n_2 ;
  wire \mOutPtr[3]_i_1__0_n_2 ;
  wire \mOutPtr[4]_i_1_n_2 ;
  wire \mOutPtr[4]_i_2_n_2 ;
  wire \mOutPtr_reg[0]_0 ;
  wire \mOutPtr_reg[0]_1 ;
  wire \mOutPtr_reg_n_2_[0] ;
  wire \mOutPtr_reg_n_2_[1] ;
  wire \mOutPtr_reg_n_2_[2] ;
  wire \mOutPtr_reg_n_2_[3] ;
  wire \mOutPtr_reg_n_2_[4] ;
  wire m_axi_BUS0_ARREADY;
  wire p_12_in;
  wire p_8_in;
  wire pop;
  wire \raddr[0]_i_1_n_2 ;
  wire \raddr[1]_i_1_n_2 ;
  wire \raddr[2]_i_1_n_2 ;
  wire \raddr[3]_i_1_n_2 ;
  wire \raddr[3]_i_2_n_2 ;
  wire \raddr[3]_i_3_n_2 ;
  wire [3:0]raddr_reg;
  wire [3:0]\sect_cnt[51]_i_3 ;
  wire [3:0]\sect_cnt[51]_i_3_0 ;
  wire \sect_len_buf_reg[7] ;

  design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_srl__parameterized0 U_fifo_srl
       (.Q(raddr_reg),
        .RREADY_Dummy(RREADY_Dummy),
        .SR(SR),
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .burst_valid(burst_valid),
        .\could_multi_bursts.loop_cnt_reg[3] (\could_multi_bursts.loop_cnt_reg[3] ),
        .din(din),
        .\dout_reg[0]_0 (empty_n_reg_n_2),
        .\dout_reg[0]_1 (Q),
        .\dout_reg[0]_2 (\dout_reg[0] ),
        .\dout_reg[0]_3 (full_n_reg_n_2),
        .\dout_reg[0]_4 (\mOutPtr_reg[0]_1 ),
        .\dout_reg[0]_5 (\mOutPtr_reg[0]_0 ),
        .\dout_reg[0]_6 (\dout_reg[0]_0 ),
        .fifo_rctl_ready(fifo_rctl_ready),
        .m_axi_BUS0_ARREADY(m_axi_BUS0_ARREADY),
        .pop(pop),
        .\sect_cnt[51]_i_3 (\sect_cnt[51]_i_3 ),
        .\sect_cnt[51]_i_3_0 (\sect_cnt[51]_i_3_0 ),
        .\sect_len_buf_reg[7] (\sect_len_buf_reg[7] ));
  LUT5 #(
    .INIT(32'hFFFF2AAA)) 
    dout_vld_i_1__2
       (.I0(burst_valid),
        .I1(RREADY_Dummy),
        .I2(\dout_reg[0] ),
        .I3(Q),
        .I4(empty_n_reg_n_2),
        .O(dout_vld_i_1__2_n_2));
  FDRE #(
    .INIT(1'b0)) 
    dout_vld_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(dout_vld_i_1__2_n_2),
        .Q(burst_valid),
        .R(SR));
  LUT5 #(
    .INIT(32'hBBFB8838)) 
    empty_n_i_1
       (.I0(empty_n_i_2__2_n_2),
        .I1(pop),
        .I2(full_n_reg_n_2),
        .I3(empty_n_reg_0),
        .I4(empty_n_reg_n_2),
        .O(empty_n_i_1_n_2));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFD)) 
    empty_n_i_2__2
       (.I0(\mOutPtr_reg_n_2_[0] ),
        .I1(\mOutPtr_reg_n_2_[1] ),
        .I2(\mOutPtr_reg_n_2_[2] ),
        .I3(\mOutPtr_reg_n_2_[4] ),
        .I4(\mOutPtr_reg_n_2_[3] ),
        .O(empty_n_i_2__2_n_2));
  FDRE #(
    .INIT(1'b0)) 
    empty_n_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(empty_n_i_1_n_2),
        .Q(empty_n_reg_n_2),
        .R(SR));
  LUT5 #(
    .INIT(32'hFFFFFD55)) 
    full_n_i_1__2
       (.I0(ap_rst_n),
        .I1(full_n_i_2__2_n_2),
        .I2(empty_n_reg_0),
        .I3(full_n_reg_n_2),
        .I4(pop),
        .O(full_n_i_1__2_n_2));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFFFFF7F)) 
    full_n_i_2__2
       (.I0(\mOutPtr_reg_n_2_[1] ),
        .I1(\mOutPtr_reg_n_2_[3] ),
        .I2(\mOutPtr_reg_n_2_[2] ),
        .I3(\mOutPtr_reg_n_2_[0] ),
        .I4(\mOutPtr_reg_n_2_[4] ),
        .O(full_n_i_2__2_n_2));
  FDRE #(
    .INIT(1'b1)) 
    full_n_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(full_n_i_1__2_n_2),
        .Q(full_n_reg_n_2),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \mOutPtr[0]_i_1__2 
       (.I0(\mOutPtr_reg_n_2_[0] ),
        .O(\mOutPtr[0]_i_1__2_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \mOutPtr[1]_i_1__1 
       (.I0(p_12_in),
        .I1(\mOutPtr_reg_n_2_[1] ),
        .I2(\mOutPtr_reg_n_2_[0] ),
        .O(\mOutPtr[1]_i_1__1_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h6AA9)) 
    \mOutPtr[2]_i_1__1 
       (.I0(\mOutPtr_reg_n_2_[2] ),
        .I1(\mOutPtr_reg_n_2_[1] ),
        .I2(\mOutPtr_reg_n_2_[0] ),
        .I3(p_12_in),
        .O(\mOutPtr[2]_i_1__1_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6AAAAAA9)) 
    \mOutPtr[3]_i_1__0 
       (.I0(\mOutPtr_reg_n_2_[3] ),
        .I1(\mOutPtr_reg_n_2_[0] ),
        .I2(\mOutPtr_reg_n_2_[1] ),
        .I3(\mOutPtr_reg_n_2_[2] ),
        .I4(p_12_in),
        .O(\mOutPtr[3]_i_1__0_n_2 ));
  LUT6 #(
    .INIT(64'h65AAAAAAAAAAAAAA)) 
    \mOutPtr[4]_i_1 
       (.I0(pop),
        .I1(m_axi_BUS0_ARREADY),
        .I2(\mOutPtr_reg[0]_0 ),
        .I3(fifo_rctl_ready),
        .I4(\mOutPtr_reg[0]_1 ),
        .I5(full_n_reg_n_2),
        .O(\mOutPtr[4]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAA9)) 
    \mOutPtr[4]_i_2 
       (.I0(\mOutPtr_reg_n_2_[4] ),
        .I1(\mOutPtr_reg_n_2_[3] ),
        .I2(p_12_in),
        .I3(\mOutPtr_reg_n_2_[2] ),
        .I4(\mOutPtr_reg_n_2_[1] ),
        .I5(\mOutPtr_reg_n_2_[0] ),
        .O(\mOutPtr[4]_i_2_n_2 ));
  LUT6 #(
    .INIT(64'h00000000B0000000)) 
    \mOutPtr[4]_i_3 
       (.I0(m_axi_BUS0_ARREADY),
        .I1(\mOutPtr_reg[0]_0 ),
        .I2(fifo_rctl_ready),
        .I3(\mOutPtr_reg[0]_1 ),
        .I4(full_n_reg_n_2),
        .I5(pop),
        .O(p_12_in));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[0] 
       (.C(ap_clk),
        .CE(\mOutPtr[4]_i_1_n_2 ),
        .D(\mOutPtr[0]_i_1__2_n_2 ),
        .Q(\mOutPtr_reg_n_2_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[1] 
       (.C(ap_clk),
        .CE(\mOutPtr[4]_i_1_n_2 ),
        .D(\mOutPtr[1]_i_1__1_n_2 ),
        .Q(\mOutPtr_reg_n_2_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[2] 
       (.C(ap_clk),
        .CE(\mOutPtr[4]_i_1_n_2 ),
        .D(\mOutPtr[2]_i_1__1_n_2 ),
        .Q(\mOutPtr_reg_n_2_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[3] 
       (.C(ap_clk),
        .CE(\mOutPtr[4]_i_1_n_2 ),
        .D(\mOutPtr[3]_i_1__0_n_2 ),
        .Q(\mOutPtr_reg_n_2_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[4] 
       (.C(ap_clk),
        .CE(\mOutPtr[4]_i_1_n_2 ),
        .D(\mOutPtr[4]_i_2_n_2 ),
        .Q(\mOutPtr_reg_n_2_[4] ),
        .R(SR));
  LUT1 #(
    .INIT(2'h1)) 
    \raddr[0]_i_1 
       (.I0(raddr_reg[0]),
        .O(\raddr[0]_i_1_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    \raddr[1]_i_1 
       (.I0(p_12_in),
        .I1(empty_n_reg_n_2),
        .I2(raddr_reg[1]),
        .I3(raddr_reg[0]),
        .O(\raddr[1]_i_1_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h6AAAAA95)) 
    \raddr[2]_i_1 
       (.I0(raddr_reg[2]),
        .I1(p_12_in),
        .I2(empty_n_reg_n_2),
        .I3(raddr_reg[1]),
        .I4(raddr_reg[0]),
        .O(\raddr[2]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEAAAAAAAA)) 
    \raddr[3]_i_1 
       (.I0(\raddr[3]_i_3_n_2 ),
        .I1(raddr_reg[2]),
        .I2(raddr_reg[3]),
        .I3(raddr_reg[1]),
        .I4(raddr_reg[0]),
        .I5(p_8_in),
        .O(\raddr[3]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAA95)) 
    \raddr[3]_i_2 
       (.I0(raddr_reg[3]),
        .I1(p_12_in),
        .I2(empty_n_reg_n_2),
        .I3(raddr_reg[1]),
        .I4(raddr_reg[0]),
        .I5(raddr_reg[2]),
        .O(\raddr[3]_i_2_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \raddr[3]_i_3 
       (.I0(empty_n_reg_n_2),
        .I1(p_12_in),
        .O(\raddr[3]_i_3_n_2 ));
  LUT6 #(
    .INIT(64'h20AAAAAAAAAAAAAA)) 
    \raddr[3]_i_4 
       (.I0(pop),
        .I1(m_axi_BUS0_ARREADY),
        .I2(\mOutPtr_reg[0]_0 ),
        .I3(fifo_rctl_ready),
        .I4(\mOutPtr_reg[0]_1 ),
        .I5(full_n_reg_n_2),
        .O(p_8_in));
  FDRE #(
    .INIT(1'b0)) 
    \raddr_reg[0] 
       (.C(ap_clk),
        .CE(\raddr[3]_i_1_n_2 ),
        .D(\raddr[0]_i_1_n_2 ),
        .Q(raddr_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \raddr_reg[1] 
       (.C(ap_clk),
        .CE(\raddr[3]_i_1_n_2 ),
        .D(\raddr[1]_i_1_n_2 ),
        .Q(raddr_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \raddr_reg[2] 
       (.C(ap_clk),
        .CE(\raddr[3]_i_1_n_2 ),
        .D(\raddr[2]_i_1_n_2 ),
        .Q(raddr_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \raddr_reg[3] 
       (.C(ap_clk),
        .CE(\raddr[3]_i_1_n_2 ),
        .D(\raddr[3]_i_2_n_2 ),
        .Q(raddr_reg[3]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "read_romcode_BUS0_m_axi_fifo" *) 
module design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_fifo__parameterized1_0
   (fifo_rctl_ready,
    m_axi_BUS0_ARREADY_0,
    E,
    D,
    rreq_handling_reg,
    rreq_handling_reg_0,
    \could_multi_bursts.sect_handling_reg ,
    rreq_handling_reg_1,
    \could_multi_bursts.sect_handling_reg_0 ,
    ap_rst_n_0,
    \could_multi_bursts.sect_handling_reg_1 ,
    rreq_handling_reg_2,
    ap_rst_n_1,
    \could_multi_bursts.sect_handling_reg_2 ,
    \could_multi_bursts.sect_handling_reg_3 ,
    \could_multi_bursts.sect_handling_reg_4 ,
    \could_multi_bursts.sect_handling_reg_5 ,
    \could_multi_bursts.sect_handling_reg_6 ,
    \could_multi_bursts.sect_handling_reg_7 ,
    \could_multi_bursts.sect_handling_reg_8 ,
    \could_multi_bursts.sect_handling_reg_9 ,
    \beat_len_reg[0] ,
    \end_addr_reg[3] ,
    \end_addr_reg[4] ,
    \beat_len_reg[3] ,
    \beat_len_reg[4] ,
    \start_addr_reg[7] ,
    \beat_len_reg[6] ,
    \start_addr_reg[9] ,
    \beat_len_reg[8] ,
    \beat_len_reg[9] ,
    SR,
    ap_clk,
    ap_rst_n,
    RBURST_READY_Dummy,
    \could_multi_bursts.ARVALID_Dummy_reg ,
    \could_multi_bursts.ARVALID_Dummy_reg_0 ,
    m_axi_BUS0_ARREADY,
    sect_cnt0,
    Q,
    CO,
    \could_multi_bursts.sect_handling_reg_10 ,
    \sect_cnt_reg[1] ,
    \could_multi_bursts.sect_handling_reg_11 ,
    \sect_addr_buf_reg[2] ,
    last_sect_buf_reg,
    last_sect_buf_reg_0,
    \could_multi_bursts.arlen_buf_reg[5] ,
    \sect_len_buf_reg[9] ,
    \sect_len_buf_reg[9]_0 ,
    \sect_len_buf_reg[9]_1 );
  output fifo_rctl_ready;
  output m_axi_BUS0_ARREADY_0;
  output [0:0]E;
  output [50:0]D;
  output rreq_handling_reg;
  output [0:0]rreq_handling_reg_0;
  output \could_multi_bursts.sect_handling_reg ;
  output rreq_handling_reg_1;
  output [0:0]\could_multi_bursts.sect_handling_reg_0 ;
  output [0:0]ap_rst_n_0;
  output \could_multi_bursts.sect_handling_reg_1 ;
  output rreq_handling_reg_2;
  output [0:0]ap_rst_n_1;
  output \could_multi_bursts.sect_handling_reg_2 ;
  output \could_multi_bursts.sect_handling_reg_3 ;
  output \could_multi_bursts.sect_handling_reg_4 ;
  output \could_multi_bursts.sect_handling_reg_5 ;
  output \could_multi_bursts.sect_handling_reg_6 ;
  output \could_multi_bursts.sect_handling_reg_7 ;
  output \could_multi_bursts.sect_handling_reg_8 ;
  output \could_multi_bursts.sect_handling_reg_9 ;
  output \beat_len_reg[0] ;
  output \end_addr_reg[3] ;
  output \end_addr_reg[4] ;
  output \beat_len_reg[3] ;
  output \beat_len_reg[4] ;
  output \start_addr_reg[7] ;
  output \beat_len_reg[6] ;
  output \start_addr_reg[9] ;
  output \beat_len_reg[8] ;
  output \beat_len_reg[9] ;
  input [0:0]SR;
  input ap_clk;
  input ap_rst_n;
  input RBURST_READY_Dummy;
  input \could_multi_bursts.ARVALID_Dummy_reg ;
  input \could_multi_bursts.ARVALID_Dummy_reg_0 ;
  input m_axi_BUS0_ARREADY;
  input [50:0]sect_cnt0;
  input [50:0]Q;
  input [0:0]CO;
  input \could_multi_bursts.sect_handling_reg_10 ;
  input [0:0]\sect_cnt_reg[1] ;
  input \could_multi_bursts.sect_handling_reg_11 ;
  input [0:0]\sect_addr_buf_reg[2] ;
  input last_sect_buf_reg;
  input last_sect_buf_reg_0;
  input [5:0]\could_multi_bursts.arlen_buf_reg[5] ;
  input [9:0]\sect_len_buf_reg[9] ;
  input [9:0]\sect_len_buf_reg[9]_0 ;
  input [9:0]\sect_len_buf_reg[9]_1 ;

  wire [0:0]CO;
  wire [50:0]D;
  wire [0:0]E;
  wire [50:0]Q;
  wire RBURST_READY_Dummy;
  wire [0:0]SR;
  wire ap_clk;
  wire ap_rst_n;
  wire [0:0]ap_rst_n_0;
  wire [0:0]ap_rst_n_1;
  wire \beat_len_reg[0] ;
  wire \beat_len_reg[3] ;
  wire \beat_len_reg[4] ;
  wire \beat_len_reg[6] ;
  wire \beat_len_reg[8] ;
  wire \beat_len_reg[9] ;
  wire \could_multi_bursts.ARVALID_Dummy_reg ;
  wire \could_multi_bursts.ARVALID_Dummy_reg_0 ;
  wire [5:0]\could_multi_bursts.arlen_buf_reg[5] ;
  wire \could_multi_bursts.sect_handling_reg ;
  wire [0:0]\could_multi_bursts.sect_handling_reg_0 ;
  wire \could_multi_bursts.sect_handling_reg_1 ;
  wire \could_multi_bursts.sect_handling_reg_10 ;
  wire \could_multi_bursts.sect_handling_reg_11 ;
  wire \could_multi_bursts.sect_handling_reg_2 ;
  wire \could_multi_bursts.sect_handling_reg_3 ;
  wire \could_multi_bursts.sect_handling_reg_4 ;
  wire \could_multi_bursts.sect_handling_reg_5 ;
  wire \could_multi_bursts.sect_handling_reg_6 ;
  wire \could_multi_bursts.sect_handling_reg_7 ;
  wire \could_multi_bursts.sect_handling_reg_8 ;
  wire \could_multi_bursts.sect_handling_reg_9 ;
  wire dout_vld_i_1__1_n_2;
  wire empty_n_i_1_n_2;
  wire empty_n_i_2__1_n_2;
  wire empty_n_reg_n_2;
  wire \end_addr_reg[3] ;
  wire \end_addr_reg[4] ;
  wire fifo_rctl_ready;
  wire full_n_i_1__1_n_2;
  wire full_n_i_2__1_n_2;
  wire last_sect_buf_reg;
  wire last_sect_buf_reg_0;
  wire \mOutPtr[0]_i_1__1_n_2 ;
  wire \mOutPtr[1]_i_1__2_n_2 ;
  wire \mOutPtr[2]_i_1__2_n_2 ;
  wire \mOutPtr[3]_i_1__1_n_2 ;
  wire \mOutPtr[4]_i_1__1_n_2 ;
  wire \mOutPtr[4]_i_2__0_n_2 ;
  wire \mOutPtr_reg_n_2_[0] ;
  wire \mOutPtr_reg_n_2_[1] ;
  wire \mOutPtr_reg_n_2_[2] ;
  wire \mOutPtr_reg_n_2_[3] ;
  wire \mOutPtr_reg_n_2_[4] ;
  wire m_axi_BUS0_ARREADY;
  wire m_axi_BUS0_ARREADY_0;
  wire need_rlast;
  wire p_12_in;
  wire pop;
  wire rreq_handling_reg;
  wire [0:0]rreq_handling_reg_0;
  wire rreq_handling_reg_1;
  wire rreq_handling_reg_2;
  wire [0:0]\sect_addr_buf_reg[2] ;
  wire [50:0]sect_cnt0;
  wire [0:0]\sect_cnt_reg[1] ;
  wire [9:0]\sect_len_buf_reg[9] ;
  wire [9:0]\sect_len_buf_reg[9]_0 ;
  wire [9:0]\sect_len_buf_reg[9]_1 ;
  wire \start_addr_reg[7] ;
  wire \start_addr_reg[9] ;

  LUT4 #(
    .INIT(16'hD0FF)) 
    \FSM_sequential_state[1]_i_2 
       (.I0(CO),
        .I1(\could_multi_bursts.sect_handling_reg ),
        .I2(\could_multi_bursts.sect_handling_reg_10 ),
        .I3(\sect_cnt_reg[1] ),
        .O(rreq_handling_reg));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h88F8)) 
    \could_multi_bursts.ARVALID_Dummy_i_1 
       (.I0(\could_multi_bursts.ARVALID_Dummy_reg ),
        .I1(fifo_rctl_ready),
        .I2(\could_multi_bursts.ARVALID_Dummy_reg_0 ),
        .I3(m_axi_BUS0_ARREADY),
        .O(\could_multi_bursts.sect_handling_reg_1 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h8808)) 
    \could_multi_bursts.araddr_buf[63]_i_1 
       (.I0(\could_multi_bursts.ARVALID_Dummy_reg ),
        .I1(fifo_rctl_ready),
        .I2(\could_multi_bursts.ARVALID_Dummy_reg_0 ),
        .I3(m_axi_BUS0_ARREADY),
        .O(E));
  LUT6 #(
    .INIT(64'hFFFFFFFF80800080)) 
    \could_multi_bursts.arlen_buf[0]_i_1 
       (.I0(\could_multi_bursts.sect_handling_reg_11 ),
        .I1(\could_multi_bursts.ARVALID_Dummy_reg ),
        .I2(fifo_rctl_ready),
        .I3(\could_multi_bursts.ARVALID_Dummy_reg_0 ),
        .I4(m_axi_BUS0_ARREADY),
        .I5(\could_multi_bursts.arlen_buf_reg[5] [0]),
        .O(\could_multi_bursts.sect_handling_reg_4 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF80800080)) 
    \could_multi_bursts.arlen_buf[1]_i_1 
       (.I0(\could_multi_bursts.sect_handling_reg_11 ),
        .I1(\could_multi_bursts.ARVALID_Dummy_reg ),
        .I2(fifo_rctl_ready),
        .I3(\could_multi_bursts.ARVALID_Dummy_reg_0 ),
        .I4(m_axi_BUS0_ARREADY),
        .I5(\could_multi_bursts.arlen_buf_reg[5] [1]),
        .O(\could_multi_bursts.sect_handling_reg_5 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF80800080)) 
    \could_multi_bursts.arlen_buf[2]_i_1 
       (.I0(\could_multi_bursts.sect_handling_reg_11 ),
        .I1(\could_multi_bursts.ARVALID_Dummy_reg ),
        .I2(fifo_rctl_ready),
        .I3(\could_multi_bursts.ARVALID_Dummy_reg_0 ),
        .I4(m_axi_BUS0_ARREADY),
        .I5(\could_multi_bursts.arlen_buf_reg[5] [2]),
        .O(\could_multi_bursts.sect_handling_reg_6 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF80800080)) 
    \could_multi_bursts.arlen_buf[3]_i_1 
       (.I0(\could_multi_bursts.sect_handling_reg_11 ),
        .I1(\could_multi_bursts.ARVALID_Dummy_reg ),
        .I2(fifo_rctl_ready),
        .I3(\could_multi_bursts.ARVALID_Dummy_reg_0 ),
        .I4(m_axi_BUS0_ARREADY),
        .I5(\could_multi_bursts.arlen_buf_reg[5] [3]),
        .O(\could_multi_bursts.sect_handling_reg_7 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF80800080)) 
    \could_multi_bursts.arlen_buf[4]_i_1 
       (.I0(\could_multi_bursts.sect_handling_reg_11 ),
        .I1(\could_multi_bursts.ARVALID_Dummy_reg ),
        .I2(fifo_rctl_ready),
        .I3(\could_multi_bursts.ARVALID_Dummy_reg_0 ),
        .I4(m_axi_BUS0_ARREADY),
        .I5(\could_multi_bursts.arlen_buf_reg[5] [4]),
        .O(\could_multi_bursts.sect_handling_reg_8 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h8808)) 
    \could_multi_bursts.arlen_buf[5]_i_1 
       (.I0(\could_multi_bursts.ARVALID_Dummy_reg ),
        .I1(fifo_rctl_ready),
        .I2(\could_multi_bursts.ARVALID_Dummy_reg_0 ),
        .I3(m_axi_BUS0_ARREADY),
        .O(\could_multi_bursts.sect_handling_reg_3 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF80800080)) 
    \could_multi_bursts.arlen_buf[5]_i_2 
       (.I0(\could_multi_bursts.sect_handling_reg_11 ),
        .I1(\could_multi_bursts.ARVALID_Dummy_reg ),
        .I2(fifo_rctl_ready),
        .I3(\could_multi_bursts.ARVALID_Dummy_reg_0 ),
        .I4(m_axi_BUS0_ARREADY),
        .I5(\could_multi_bursts.arlen_buf_reg[5] [5]),
        .O(\could_multi_bursts.sect_handling_reg_9 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \could_multi_bursts.loop_cnt[3]_i_1 
       (.I0(ap_rst_n),
        .I1(\could_multi_bursts.sect_handling_reg ),
        .O(ap_rst_n_0));
  LUT6 #(
    .INIT(64'hEAFAEAFAFAFAEAFA)) 
    \could_multi_bursts.sect_handling_i_1 
       (.I0(\could_multi_bursts.sect_handling_reg_10 ),
        .I1(\could_multi_bursts.sect_handling_reg_11 ),
        .I2(\could_multi_bursts.ARVALID_Dummy_reg ),
        .I3(fifo_rctl_ready),
        .I4(\could_multi_bursts.ARVALID_Dummy_reg_0 ),
        .I5(m_axi_BUS0_ARREADY),
        .O(rreq_handling_reg_2));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    dout_vld_i_1__1
       (.I0(RBURST_READY_Dummy),
        .I1(need_rlast),
        .I2(empty_n_reg_n_2),
        .O(dout_vld_i_1__1_n_2));
  FDRE #(
    .INIT(1'b0)) 
    dout_vld_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(dout_vld_i_1__1_n_2),
        .Q(need_rlast),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h8C88FFFF)) 
    empty_n_i_1
       (.I0(empty_n_i_2__1_n_2),
        .I1(empty_n_reg_n_2),
        .I2(RBURST_READY_Dummy),
        .I3(need_rlast),
        .I4(m_axi_BUS0_ARREADY_0),
        .O(empty_n_i_1_n_2));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFD)) 
    empty_n_i_2__1
       (.I0(\mOutPtr_reg_n_2_[0] ),
        .I1(\mOutPtr_reg_n_2_[1] ),
        .I2(\mOutPtr_reg_n_2_[2] ),
        .I3(\mOutPtr_reg_n_2_[4] ),
        .I4(\mOutPtr_reg_n_2_[3] ),
        .O(empty_n_i_2__1_n_2));
  FDRE #(
    .INIT(1'b0)) 
    empty_n_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(empty_n_i_1_n_2),
        .Q(empty_n_reg_n_2),
        .R(SR));
  LUT5 #(
    .INIT(32'hFFFDF55D)) 
    full_n_i_1__1
       (.I0(ap_rst_n),
        .I1(full_n_i_2__1_n_2),
        .I2(m_axi_BUS0_ARREADY_0),
        .I3(pop),
        .I4(fifo_rctl_ready),
        .O(full_n_i_1__1_n_2));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hFFFFFF7F)) 
    full_n_i_2__1
       (.I0(\mOutPtr_reg_n_2_[1] ),
        .I1(\mOutPtr_reg_n_2_[3] ),
        .I2(\mOutPtr_reg_n_2_[2] ),
        .I3(\mOutPtr_reg_n_2_[0] ),
        .I4(\mOutPtr_reg_n_2_[4] ),
        .O(full_n_i_2__1_n_2));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    full_n_i_3
       (.I0(empty_n_reg_n_2),
        .I1(RBURST_READY_Dummy),
        .I2(need_rlast),
        .O(pop));
  FDRE #(
    .INIT(1'b1)) 
    full_n_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(full_n_i_1__1_n_2),
        .Q(fifo_rctl_ready),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \mOutPtr[0]_i_1__1 
       (.I0(\mOutPtr_reg_n_2_[0] ),
        .O(\mOutPtr[0]_i_1__1_n_2 ));
  LUT6 #(
    .INIT(64'hFF8A00750075FF8A)) 
    \mOutPtr[1]_i_1__2 
       (.I0(empty_n_reg_n_2),
        .I1(RBURST_READY_Dummy),
        .I2(need_rlast),
        .I3(m_axi_BUS0_ARREADY_0),
        .I4(\mOutPtr_reg_n_2_[1] ),
        .I5(\mOutPtr_reg_n_2_[0] ),
        .O(\mOutPtr[1]_i_1__2_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h6AA9)) 
    \mOutPtr[2]_i_1__2 
       (.I0(\mOutPtr_reg_n_2_[2] ),
        .I1(\mOutPtr_reg_n_2_[1] ),
        .I2(\mOutPtr_reg_n_2_[0] ),
        .I3(p_12_in),
        .O(\mOutPtr[2]_i_1__2_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h6AAAAAA9)) 
    \mOutPtr[3]_i_1__1 
       (.I0(\mOutPtr_reg_n_2_[3] ),
        .I1(\mOutPtr_reg_n_2_[0] ),
        .I2(\mOutPtr_reg_n_2_[1] ),
        .I3(\mOutPtr_reg_n_2_[2] ),
        .I4(p_12_in),
        .O(\mOutPtr[3]_i_1__1_n_2 ));
  LUT4 #(
    .INIT(16'h8A75)) 
    \mOutPtr[4]_i_1__1 
       (.I0(empty_n_reg_n_2),
        .I1(RBURST_READY_Dummy),
        .I2(need_rlast),
        .I3(m_axi_BUS0_ARREADY_0),
        .O(\mOutPtr[4]_i_1__1_n_2 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAA9)) 
    \mOutPtr[4]_i_2__0 
       (.I0(\mOutPtr_reg_n_2_[4] ),
        .I1(\mOutPtr_reg_n_2_[3] ),
        .I2(p_12_in),
        .I3(\mOutPtr_reg_n_2_[2] ),
        .I4(\mOutPtr_reg_n_2_[1] ),
        .I5(\mOutPtr_reg_n_2_[0] ),
        .O(\mOutPtr[4]_i_2__0_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h4FFF)) 
    \mOutPtr[4]_i_3__0 
       (.I0(m_axi_BUS0_ARREADY),
        .I1(\could_multi_bursts.ARVALID_Dummy_reg_0 ),
        .I2(fifo_rctl_ready),
        .I3(\could_multi_bursts.ARVALID_Dummy_reg ),
        .O(m_axi_BUS0_ARREADY_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0455)) 
    \mOutPtr[4]_i_4 
       (.I0(m_axi_BUS0_ARREADY_0),
        .I1(need_rlast),
        .I2(RBURST_READY_Dummy),
        .I3(empty_n_reg_n_2),
        .O(p_12_in));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[0] 
       (.C(ap_clk),
        .CE(\mOutPtr[4]_i_1__1_n_2 ),
        .D(\mOutPtr[0]_i_1__1_n_2 ),
        .Q(\mOutPtr_reg_n_2_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[1] 
       (.C(ap_clk),
        .CE(\mOutPtr[4]_i_1__1_n_2 ),
        .D(\mOutPtr[1]_i_1__2_n_2 ),
        .Q(\mOutPtr_reg_n_2_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[2] 
       (.C(ap_clk),
        .CE(\mOutPtr[4]_i_1__1_n_2 ),
        .D(\mOutPtr[2]_i_1__2_n_2 ),
        .Q(\mOutPtr_reg_n_2_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[3] 
       (.C(ap_clk),
        .CE(\mOutPtr[4]_i_1__1_n_2 ),
        .D(\mOutPtr[3]_i_1__1_n_2 ),
        .Q(\mOutPtr_reg_n_2_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[4] 
       (.C(ap_clk),
        .CE(\mOutPtr[4]_i_1__1_n_2 ),
        .D(\mOutPtr[4]_i_2__0_n_2 ),
        .Q(\mOutPtr_reg_n_2_[4] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'h1F)) 
    \sect_addr_buf[11]_i_1 
       (.I0(\could_multi_bursts.sect_handling_reg ),
        .I1(\sect_addr_buf_reg[2] ),
        .I2(ap_rst_n),
        .O(ap_rst_n_1));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \sect_addr_buf[63]_i_1 
       (.I0(\could_multi_bursts.sect_handling_reg ),
        .O(\could_multi_bursts.sect_handling_reg_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[10]_i_1 
       (.I0(sect_cnt0[9]),
        .I1(rreq_handling_reg),
        .I2(Q[9]),
        .O(D[9]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[11]_i_1 
       (.I0(sect_cnt0[10]),
        .I1(rreq_handling_reg),
        .I2(Q[10]),
        .O(D[10]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[12]_i_1 
       (.I0(sect_cnt0[11]),
        .I1(rreq_handling_reg),
        .I2(Q[11]),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[13]_i_1 
       (.I0(sect_cnt0[12]),
        .I1(rreq_handling_reg),
        .I2(Q[12]),
        .O(D[12]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[14]_i_1 
       (.I0(sect_cnt0[13]),
        .I1(rreq_handling_reg),
        .I2(Q[13]),
        .O(D[13]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[15]_i_1 
       (.I0(sect_cnt0[14]),
        .I1(rreq_handling_reg),
        .I2(Q[14]),
        .O(D[14]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[16]_i_1 
       (.I0(sect_cnt0[15]),
        .I1(rreq_handling_reg),
        .I2(Q[15]),
        .O(D[15]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[17]_i_1 
       (.I0(sect_cnt0[16]),
        .I1(rreq_handling_reg),
        .I2(Q[16]),
        .O(D[16]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[18]_i_1 
       (.I0(sect_cnt0[17]),
        .I1(rreq_handling_reg),
        .I2(Q[17]),
        .O(D[17]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[19]_i_1 
       (.I0(sect_cnt0[18]),
        .I1(rreq_handling_reg),
        .I2(Q[18]),
        .O(D[18]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[1]_i_1 
       (.I0(sect_cnt0[0]),
        .I1(rreq_handling_reg),
        .I2(Q[0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[20]_i_1 
       (.I0(sect_cnt0[19]),
        .I1(rreq_handling_reg),
        .I2(Q[19]),
        .O(D[19]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[21]_i_1 
       (.I0(sect_cnt0[20]),
        .I1(rreq_handling_reg),
        .I2(Q[20]),
        .O(D[20]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[22]_i_1 
       (.I0(sect_cnt0[21]),
        .I1(rreq_handling_reg),
        .I2(Q[21]),
        .O(D[21]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[23]_i_1 
       (.I0(sect_cnt0[22]),
        .I1(rreq_handling_reg),
        .I2(Q[22]),
        .O(D[22]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[24]_i_1 
       (.I0(sect_cnt0[23]),
        .I1(rreq_handling_reg),
        .I2(Q[23]),
        .O(D[23]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[25]_i_1 
       (.I0(sect_cnt0[24]),
        .I1(rreq_handling_reg),
        .I2(Q[24]),
        .O(D[24]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[26]_i_1 
       (.I0(sect_cnt0[25]),
        .I1(rreq_handling_reg),
        .I2(Q[25]),
        .O(D[25]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[27]_i_1 
       (.I0(sect_cnt0[26]),
        .I1(rreq_handling_reg),
        .I2(Q[26]),
        .O(D[26]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[28]_i_1 
       (.I0(sect_cnt0[27]),
        .I1(rreq_handling_reg),
        .I2(Q[27]),
        .O(D[27]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[29]_i_1 
       (.I0(sect_cnt0[28]),
        .I1(rreq_handling_reg),
        .I2(Q[28]),
        .O(D[28]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[2]_i_1 
       (.I0(sect_cnt0[1]),
        .I1(rreq_handling_reg),
        .I2(Q[1]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[30]_i_1 
       (.I0(sect_cnt0[29]),
        .I1(rreq_handling_reg),
        .I2(Q[29]),
        .O(D[29]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[31]_i_1 
       (.I0(sect_cnt0[30]),
        .I1(rreq_handling_reg),
        .I2(Q[30]),
        .O(D[30]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[32]_i_1 
       (.I0(sect_cnt0[31]),
        .I1(rreq_handling_reg),
        .I2(Q[31]),
        .O(D[31]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[33]_i_1 
       (.I0(sect_cnt0[32]),
        .I1(rreq_handling_reg),
        .I2(Q[32]),
        .O(D[32]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[34]_i_1 
       (.I0(sect_cnt0[33]),
        .I1(rreq_handling_reg),
        .I2(Q[33]),
        .O(D[33]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[35]_i_1 
       (.I0(sect_cnt0[34]),
        .I1(rreq_handling_reg),
        .I2(Q[34]),
        .O(D[34]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[36]_i_1 
       (.I0(sect_cnt0[35]),
        .I1(rreq_handling_reg),
        .I2(Q[35]),
        .O(D[35]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[37]_i_1 
       (.I0(sect_cnt0[36]),
        .I1(rreq_handling_reg),
        .I2(Q[36]),
        .O(D[36]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[38]_i_1 
       (.I0(sect_cnt0[37]),
        .I1(rreq_handling_reg),
        .I2(Q[37]),
        .O(D[37]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[39]_i_1 
       (.I0(sect_cnt0[38]),
        .I1(rreq_handling_reg),
        .I2(Q[38]),
        .O(D[38]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[3]_i_1 
       (.I0(sect_cnt0[2]),
        .I1(rreq_handling_reg),
        .I2(Q[2]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[40]_i_1 
       (.I0(sect_cnt0[39]),
        .I1(rreq_handling_reg),
        .I2(Q[39]),
        .O(D[39]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[41]_i_1 
       (.I0(sect_cnt0[40]),
        .I1(rreq_handling_reg),
        .I2(Q[40]),
        .O(D[40]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[42]_i_1 
       (.I0(sect_cnt0[41]),
        .I1(rreq_handling_reg),
        .I2(Q[41]),
        .O(D[41]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[43]_i_1 
       (.I0(sect_cnt0[42]),
        .I1(rreq_handling_reg),
        .I2(Q[42]),
        .O(D[42]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[44]_i_1 
       (.I0(sect_cnt0[43]),
        .I1(rreq_handling_reg),
        .I2(Q[43]),
        .O(D[43]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[45]_i_1 
       (.I0(sect_cnt0[44]),
        .I1(rreq_handling_reg),
        .I2(Q[44]),
        .O(D[44]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[46]_i_1 
       (.I0(sect_cnt0[45]),
        .I1(rreq_handling_reg),
        .I2(Q[45]),
        .O(D[45]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[47]_i_1 
       (.I0(sect_cnt0[46]),
        .I1(rreq_handling_reg),
        .I2(Q[46]),
        .O(D[46]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[48]_i_1 
       (.I0(sect_cnt0[47]),
        .I1(rreq_handling_reg),
        .I2(Q[47]),
        .O(D[47]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[49]_i_1 
       (.I0(sect_cnt0[48]),
        .I1(rreq_handling_reg),
        .I2(Q[48]),
        .O(D[48]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[4]_i_1 
       (.I0(sect_cnt0[3]),
        .I1(rreq_handling_reg),
        .I2(Q[3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[50]_i_1 
       (.I0(sect_cnt0[49]),
        .I1(rreq_handling_reg),
        .I2(Q[49]),
        .O(D[49]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[51]_i_2 
       (.I0(sect_cnt0[50]),
        .I1(rreq_handling_reg),
        .I2(Q[50]),
        .O(D[50]));
  LUT5 #(
    .INIT(32'hFE00FFFF)) 
    \sect_cnt[51]_i_3 
       (.I0(last_sect_buf_reg),
        .I1(last_sect_buf_reg_0),
        .I2(m_axi_BUS0_ARREADY_0),
        .I3(\could_multi_bursts.ARVALID_Dummy_reg ),
        .I4(\could_multi_bursts.sect_handling_reg_10 ),
        .O(\could_multi_bursts.sect_handling_reg ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[5]_i_1 
       (.I0(sect_cnt0[4]),
        .I1(rreq_handling_reg),
        .I2(Q[4]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[6]_i_1 
       (.I0(sect_cnt0[5]),
        .I1(rreq_handling_reg),
        .I2(Q[5]),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[7]_i_1 
       (.I0(sect_cnt0[6]),
        .I1(rreq_handling_reg),
        .I2(Q[6]),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[8]_i_1 
       (.I0(sect_cnt0[7]),
        .I1(rreq_handling_reg),
        .I2(Q[7]),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_cnt[9]_i_1 
       (.I0(sect_cnt0[8]),
        .I1(rreq_handling_reg),
        .I2(Q[8]),
        .O(D[8]));
  LUT6 #(
    .INIT(64'hF333C101FF3FCD0D)) 
    \sect_len_buf[0]_i_1 
       (.I0(\could_multi_bursts.sect_handling_reg ),
        .I1(\sect_addr_buf_reg[2] ),
        .I2(CO),
        .I3(\sect_len_buf_reg[9] [0]),
        .I4(\sect_len_buf_reg[9]_0 [0]),
        .I5(\sect_len_buf_reg[9]_1 [0]),
        .O(\beat_len_reg[0] ));
  LUT6 #(
    .INIT(64'hF3C13301FFCD3F0D)) 
    \sect_len_buf[1]_i_1 
       (.I0(\could_multi_bursts.sect_handling_reg ),
        .I1(\sect_addr_buf_reg[2] ),
        .I2(CO),
        .I3(\sect_len_buf_reg[9]_0 [1]),
        .I4(\sect_len_buf_reg[9] [1]),
        .I5(\sect_len_buf_reg[9]_1 [1]),
        .O(\end_addr_reg[3] ));
  LUT6 #(
    .INIT(64'hF3C1FFCD33013F0D)) 
    \sect_len_buf[2]_i_1 
       (.I0(\could_multi_bursts.sect_handling_reg ),
        .I1(\sect_addr_buf_reg[2] ),
        .I2(CO),
        .I3(\sect_len_buf_reg[9]_0 [2]),
        .I4(\sect_len_buf_reg[9]_1 [2]),
        .I5(\sect_len_buf_reg[9] [2]),
        .O(\end_addr_reg[4] ));
  LUT6 #(
    .INIT(64'hF333C101FF3FCD0D)) 
    \sect_len_buf[3]_i_1 
       (.I0(\could_multi_bursts.sect_handling_reg ),
        .I1(\sect_addr_buf_reg[2] ),
        .I2(CO),
        .I3(\sect_len_buf_reg[9] [3]),
        .I4(\sect_len_buf_reg[9]_0 [3]),
        .I5(\sect_len_buf_reg[9]_1 [3]),
        .O(\beat_len_reg[3] ));
  LUT6 #(
    .INIT(64'hF333C101FF3FCD0D)) 
    \sect_len_buf[4]_i_1 
       (.I0(\could_multi_bursts.sect_handling_reg ),
        .I1(\sect_addr_buf_reg[2] ),
        .I2(CO),
        .I3(\sect_len_buf_reg[9] [4]),
        .I4(\sect_len_buf_reg[9]_0 [4]),
        .I5(\sect_len_buf_reg[9]_1 [4]),
        .O(\beat_len_reg[4] ));
  LUT6 #(
    .INIT(64'hF3FFC1CD333F010D)) 
    \sect_len_buf[5]_i_1 
       (.I0(\could_multi_bursts.sect_handling_reg ),
        .I1(\sect_addr_buf_reg[2] ),
        .I2(CO),
        .I3(\sect_len_buf_reg[9]_1 [5]),
        .I4(\sect_len_buf_reg[9]_0 [5]),
        .I5(\sect_len_buf_reg[9] [5]),
        .O(\start_addr_reg[7] ));
  LUT6 #(
    .INIT(64'hF333C101FF3FCD0D)) 
    \sect_len_buf[6]_i_1 
       (.I0(\could_multi_bursts.sect_handling_reg ),
        .I1(\sect_addr_buf_reg[2] ),
        .I2(CO),
        .I3(\sect_len_buf_reg[9] [6]),
        .I4(\sect_len_buf_reg[9]_0 [6]),
        .I5(\sect_len_buf_reg[9]_1 [6]),
        .O(\beat_len_reg[6] ));
  LUT6 #(
    .INIT(64'hF3FFC1CD333F010D)) 
    \sect_len_buf[7]_i_1 
       (.I0(\could_multi_bursts.sect_handling_reg ),
        .I1(\sect_addr_buf_reg[2] ),
        .I2(CO),
        .I3(\sect_len_buf_reg[9]_1 [7]),
        .I4(\sect_len_buf_reg[9]_0 [7]),
        .I5(\sect_len_buf_reg[9] [7]),
        .O(\start_addr_reg[9] ));
  LUT6 #(
    .INIT(64'hF333C101FF3FCD0D)) 
    \sect_len_buf[8]_i_1 
       (.I0(\could_multi_bursts.sect_handling_reg ),
        .I1(\sect_addr_buf_reg[2] ),
        .I2(CO),
        .I3(\sect_len_buf_reg[9] [8]),
        .I4(\sect_len_buf_reg[9]_0 [8]),
        .I5(\sect_len_buf_reg[9]_1 [8]),
        .O(\beat_len_reg[8] ));
  LUT1 #(
    .INIT(2'h1)) 
    \sect_len_buf[9]_i_1 
       (.I0(\could_multi_bursts.sect_handling_reg ),
        .O(\could_multi_bursts.sect_handling_reg_2 ));
  LUT6 #(
    .INIT(64'hF333C101FF3FCD0D)) 
    \sect_len_buf[9]_i_2 
       (.I0(\could_multi_bursts.sect_handling_reg ),
        .I1(\sect_addr_buf_reg[2] ),
        .I2(CO),
        .I3(\sect_len_buf_reg[9] [9]),
        .I4(\sect_len_buf_reg[9]_0 [9]),
        .I5(\sect_len_buf_reg[9]_1 [9]),
        .O(\beat_len_reg[9] ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \start_addr[63]_i_1 
       (.I0(rreq_handling_reg),
        .O(rreq_handling_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \state[1]_i_2 
       (.I0(\could_multi_bursts.sect_handling_reg_10 ),
        .I1(\could_multi_bursts.sect_handling_reg ),
        .I2(CO),
        .O(rreq_handling_reg_1));
endmodule

(* ORIG_REF_NAME = "read_romcode_BUS0_m_axi_fifo" *) 
module design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_fifo__parameterized3
   (BUS0_RVALID,
    full_n_reg_0,
    dout,
    SR,
    ap_clk,
    ap_rst_n,
    \mOutPtr_reg[10]_0 ,
    dout_vld_reg_0,
    we,
    din);
  output BUS0_RVALID;
  output full_n_reg_0;
  output [32:0]dout;
  input [0:0]SR;
  input ap_clk;
  input ap_rst_n;
  input [0:0]\mOutPtr_reg[10]_0 ;
  input dout_vld_reg_0;
  input we;
  input [33:0]din;

  wire BUS0_RVALID;
  wire [0:0]SR;
  wire ap_clk;
  wire ap_rst_n;
  wire [33:0]din;
  wire [32:0]dout;
  wire dout_vld_i_1__0_n_2;
  wire dout_vld_reg_0;
  wire empty_n_i_1_n_2;
  wire empty_n_i_2__0_n_2;
  wire empty_n_i_3_n_2;
  wire empty_n_i_4_n_2;
  wire empty_n_reg_n_2;
  wire full_n_i_1__0_n_2;
  wire full_n_i_2__0_n_2;
  wire full_n_i_3__0_n_2;
  wire full_n_i_4_n_2;
  wire full_n_reg_0;
  wire \mOutPtr[0]_i_1__0_n_2 ;
  wire \mOutPtr[10]_i_1_n_2 ;
  wire \mOutPtr[10]_i_2_n_2 ;
  wire \mOutPtr[10]_i_3_n_2 ;
  wire \mOutPtr[10]_i_4_n_2 ;
  wire \mOutPtr[1]_i_1_n_2 ;
  wire \mOutPtr[2]_i_1_n_2 ;
  wire \mOutPtr[3]_i_1__2_n_2 ;
  wire \mOutPtr[4]_i_1__0_n_2 ;
  wire \mOutPtr[5]_i_1_n_2 ;
  wire \mOutPtr[5]_i_2_n_2 ;
  wire \mOutPtr[5]_i_3_n_2 ;
  wire \mOutPtr[6]_i_1_n_2 ;
  wire \mOutPtr[7]_i_1_n_2 ;
  wire \mOutPtr[7]_i_2_n_2 ;
  wire \mOutPtr[7]_i_3_n_2 ;
  wire \mOutPtr[8]_i_1_n_2 ;
  wire \mOutPtr[9]_i_1_n_2 ;
  wire \mOutPtr[9]_i_2_n_2 ;
  wire [0:0]\mOutPtr_reg[10]_0 ;
  wire \mOutPtr_reg_n_2_[0] ;
  wire \mOutPtr_reg_n_2_[10] ;
  wire \mOutPtr_reg_n_2_[1] ;
  wire \mOutPtr_reg_n_2_[2] ;
  wire \mOutPtr_reg_n_2_[3] ;
  wire \mOutPtr_reg_n_2_[4] ;
  wire \mOutPtr_reg_n_2_[5] ;
  wire \mOutPtr_reg_n_2_[6] ;
  wire \mOutPtr_reg_n_2_[7] ;
  wire \mOutPtr_reg_n_2_[8] ;
  wire \mOutPtr_reg_n_2_[9] ;
  wire pop;
  wire \raddr_reg_n_2_[0] ;
  wire \raddr_reg_n_2_[1] ;
  wire \raddr_reg_n_2_[2] ;
  wire \raddr_reg_n_2_[3] ;
  wire \raddr_reg_n_2_[4] ;
  wire \raddr_reg_n_2_[5] ;
  wire \raddr_reg_n_2_[6] ;
  wire \raddr_reg_n_2_[7] ;
  wire \raddr_reg_n_2_[8] ;
  wire \raddr_reg_n_2_[9] ;
  wire [9:0]rnext;
  wire \waddr[0]_i_1_n_2 ;
  wire \waddr[1]_i_1_n_2 ;
  wire \waddr[2]_i_1_n_2 ;
  wire \waddr[3]_i_1_n_2 ;
  wire \waddr[3]_i_2_n_2 ;
  wire \waddr[4]_i_1_n_2 ;
  wire \waddr[5]_i_1__0_n_2 ;
  wire \waddr[5]_i_2_n_2 ;
  wire \waddr[5]_i_3_n_2 ;
  wire \waddr[6]_i_1_n_2 ;
  wire \waddr[7]_i_1_n_2 ;
  wire \waddr[8]_i_1_n_2 ;
  wire \waddr[9]_i_1_n_2 ;
  wire \waddr[9]_i_2_n_2 ;
  wire \waddr_reg_n_2_[0] ;
  wire \waddr_reg_n_2_[1] ;
  wire \waddr_reg_n_2_[2] ;
  wire \waddr_reg_n_2_[3] ;
  wire \waddr_reg_n_2_[4] ;
  wire \waddr_reg_n_2_[5] ;
  wire \waddr_reg_n_2_[6] ;
  wire \waddr_reg_n_2_[7] ;
  wire \waddr_reg_n_2_[8] ;
  wire \waddr_reg_n_2_[9] ;
  wire we;

  design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_mem__parameterized0 U_fifo_mem
       (.BUS0_RVALID(BUS0_RVALID),
        .Q({\waddr_reg_n_2_[9] ,\waddr_reg_n_2_[8] ,\waddr_reg_n_2_[7] ,\waddr_reg_n_2_[6] ,\waddr_reg_n_2_[5] ,\waddr_reg_n_2_[4] ,\waddr_reg_n_2_[3] ,\waddr_reg_n_2_[2] ,\waddr_reg_n_2_[1] ,\waddr_reg_n_2_[0] }),
        .SR(SR),
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .din(din),
        .dout(dout),
        .pop(pop),
        .\raddr_reg_reg[1]_0 (\raddr_reg_n_2_[0] ),
        .\raddr_reg_reg[1]_1 (\raddr_reg_n_2_[1] ),
        .\raddr_reg_reg[2]_0 (\raddr_reg_n_2_[2] ),
        .\raddr_reg_reg[4]_0 (\raddr_reg_n_2_[3] ),
        .\raddr_reg_reg[4]_1 (\raddr_reg_n_2_[4] ),
        .\raddr_reg_reg[5]_0 (\raddr_reg_n_2_[5] ),
        .\raddr_reg_reg[6]_0 (\raddr_reg_n_2_[6] ),
        .\raddr_reg_reg[7]_0 (\raddr_reg_n_2_[7] ),
        .\raddr_reg_reg[9]_0 (\raddr_reg_n_2_[8] ),
        .\raddr_reg_reg[9]_1 (\raddr_reg_n_2_[9] ),
        .\raddr_reg_reg[9]_2 (empty_n_reg_n_2),
        .\raddr_reg_reg[9]_3 (dout_vld_reg_0),
        .rnext(rnext),
        .we(we));
  LUT3 #(
    .INIT(8'hF2)) 
    dout_vld_i_1__0
       (.I0(BUS0_RVALID),
        .I1(dout_vld_reg_0),
        .I2(empty_n_reg_n_2),
        .O(dout_vld_i_1__0_n_2));
  FDRE #(
    .INIT(1'b0)) 
    dout_vld_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(dout_vld_i_1__0_n_2),
        .Q(BUS0_RVALID),
        .R(SR));
  LUT5 #(
    .INIT(32'hEAFF2AC0)) 
    empty_n_i_1
       (.I0(empty_n_i_2__0_n_2),
        .I1(full_n_reg_0),
        .I2(\mOutPtr_reg[10]_0 ),
        .I3(pop),
        .I4(empty_n_reg_n_2),
        .O(empty_n_i_1_n_2));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    empty_n_i_2__0
       (.I0(\mOutPtr_reg_n_2_[2] ),
        .I1(\mOutPtr_reg_n_2_[5] ),
        .I2(\mOutPtr_reg_n_2_[6] ),
        .I3(empty_n_i_3_n_2),
        .I4(empty_n_i_4_n_2),
        .O(empty_n_i_2__0_n_2));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    empty_n_i_3
       (.I0(\mOutPtr_reg_n_2_[9] ),
        .I1(\mOutPtr_reg_n_2_[8] ),
        .I2(\mOutPtr_reg_n_2_[0] ),
        .I3(\mOutPtr_reg_n_2_[7] ),
        .O(empty_n_i_3_n_2));
  LUT4 #(
    .INIT(16'hFFFE)) 
    empty_n_i_4
       (.I0(\mOutPtr_reg_n_2_[3] ),
        .I1(\mOutPtr_reg_n_2_[1] ),
        .I2(\mOutPtr_reg_n_2_[10] ),
        .I3(\mOutPtr_reg_n_2_[4] ),
        .O(empty_n_i_4_n_2));
  FDRE #(
    .INIT(1'b0)) 
    empty_n_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(empty_n_i_1_n_2),
        .Q(empty_n_reg_n_2),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT5 #(
    .INIT(32'hFDFFF5F5)) 
    full_n_i_1__0
       (.I0(ap_rst_n),
        .I1(full_n_i_2__0_n_2),
        .I2(pop),
        .I3(\mOutPtr_reg[10]_0 ),
        .I4(full_n_reg_0),
        .O(full_n_i_1__0_n_2));
  LUT5 #(
    .INIT(32'hFFFFFF7F)) 
    full_n_i_2__0
       (.I0(\mOutPtr_reg_n_2_[4] ),
        .I1(\mOutPtr_reg_n_2_[1] ),
        .I2(\mOutPtr_reg_n_2_[5] ),
        .I3(full_n_i_3__0_n_2),
        .I4(full_n_i_4_n_2),
        .O(full_n_i_2__0_n_2));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    full_n_i_3__0
       (.I0(\mOutPtr_reg_n_2_[9] ),
        .I1(\mOutPtr_reg_n_2_[8] ),
        .I2(\mOutPtr_reg_n_2_[7] ),
        .I3(\mOutPtr_reg_n_2_[3] ),
        .O(full_n_i_3__0_n_2));
  LUT4 #(
    .INIT(16'hFFDF)) 
    full_n_i_4
       (.I0(\mOutPtr_reg_n_2_[2] ),
        .I1(\mOutPtr_reg_n_2_[10] ),
        .I2(\mOutPtr_reg_n_2_[6] ),
        .I3(\mOutPtr_reg_n_2_[0] ),
        .O(full_n_i_4_n_2));
  FDRE #(
    .INIT(1'b1)) 
    full_n_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(full_n_i_1__0_n_2),
        .Q(full_n_reg_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \mOutPtr[0]_i_1__0 
       (.I0(\mOutPtr_reg_n_2_[0] ),
        .O(\mOutPtr[0]_i_1__0_n_2 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \mOutPtr[10]_i_1 
       (.I0(pop),
        .I1(\mOutPtr_reg[10]_0 ),
        .I2(full_n_reg_0),
        .O(\mOutPtr[10]_i_1_n_2 ));
  LUT5 #(
    .INIT(32'h6AAA6AA5)) 
    \mOutPtr[10]_i_2 
       (.I0(\mOutPtr_reg_n_2_[10] ),
        .I1(\mOutPtr[10]_i_3_n_2 ),
        .I2(\mOutPtr_reg_n_2_[9] ),
        .I3(\mOutPtr_reg_n_2_[8] ),
        .I4(\mOutPtr[10]_i_4_n_2 ),
        .O(\mOutPtr[10]_i_2_n_2 ));
  LUT6 #(
    .INIT(64'h0000000020000000)) 
    \mOutPtr[10]_i_3 
       (.I0(\mOutPtr_reg_n_2_[7] ),
        .I1(\mOutPtr[7]_i_3_n_2 ),
        .I2(\mOutPtr_reg_n_2_[6] ),
        .I3(full_n_reg_0),
        .I4(\mOutPtr_reg[10]_0 ),
        .I5(pop),
        .O(\mOutPtr[10]_i_3_n_2 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFAAEA)) 
    \mOutPtr[10]_i_4 
       (.I0(\mOutPtr_reg_n_2_[7] ),
        .I1(full_n_reg_0),
        .I2(\mOutPtr_reg[10]_0 ),
        .I3(pop),
        .I4(\mOutPtr[7]_i_2_n_2 ),
        .I5(\mOutPtr_reg_n_2_[6] ),
        .O(\mOutPtr[10]_i_4_n_2 ));
  LUT5 #(
    .INIT(32'hBF4040BF)) 
    \mOutPtr[1]_i_1 
       (.I0(pop),
        .I1(\mOutPtr_reg[10]_0 ),
        .I2(full_n_reg_0),
        .I3(\mOutPtr_reg_n_2_[1] ),
        .I4(\mOutPtr_reg_n_2_[0] ),
        .O(\mOutPtr[1]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'hA96AA9A9A9A9A9A9)) 
    \mOutPtr[2]_i_1 
       (.I0(\mOutPtr_reg_n_2_[2] ),
        .I1(\mOutPtr_reg_n_2_[1] ),
        .I2(\mOutPtr_reg_n_2_[0] ),
        .I3(pop),
        .I4(\mOutPtr_reg[10]_0 ),
        .I5(full_n_reg_0),
        .O(\mOutPtr[2]_i_1_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT5 #(
    .INIT(32'h6AAAAAA9)) 
    \mOutPtr[3]_i_1__2 
       (.I0(\mOutPtr_reg_n_2_[3] ),
        .I1(\mOutPtr_reg_n_2_[2] ),
        .I2(\mOutPtr_reg_n_2_[0] ),
        .I3(\mOutPtr_reg_n_2_[1] ),
        .I4(\mOutPtr[9]_i_2_n_2 ),
        .O(\mOutPtr[3]_i_1__2_n_2 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAA9)) 
    \mOutPtr[4]_i_1__0 
       (.I0(\mOutPtr_reg_n_2_[4] ),
        .I1(\mOutPtr_reg_n_2_[3] ),
        .I2(\mOutPtr_reg_n_2_[1] ),
        .I3(\mOutPtr_reg_n_2_[0] ),
        .I4(\mOutPtr_reg_n_2_[2] ),
        .I5(\mOutPtr[9]_i_2_n_2 ),
        .O(\mOutPtr[4]_i_1__0_n_2 ));
  LUT6 #(
    .INIT(64'h9999A99999995999)) 
    \mOutPtr[5]_i_1 
       (.I0(\mOutPtr_reg_n_2_[5] ),
        .I1(\mOutPtr[5]_i_2_n_2 ),
        .I2(full_n_reg_0),
        .I3(\mOutPtr_reg[10]_0 ),
        .I4(pop),
        .I5(\mOutPtr[5]_i_3_n_2 ),
        .O(\mOutPtr[5]_i_1_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \mOutPtr[5]_i_2 
       (.I0(\mOutPtr_reg_n_2_[4] ),
        .I1(\mOutPtr_reg_n_2_[2] ),
        .I2(\mOutPtr_reg_n_2_[1] ),
        .I3(\mOutPtr_reg_n_2_[0] ),
        .I4(\mOutPtr_reg_n_2_[3] ),
        .O(\mOutPtr[5]_i_2_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \mOutPtr[5]_i_3 
       (.I0(\mOutPtr_reg_n_2_[3] ),
        .I1(\mOutPtr_reg_n_2_[1] ),
        .I2(\mOutPtr_reg_n_2_[0] ),
        .I3(\mOutPtr_reg_n_2_[2] ),
        .I4(\mOutPtr_reg_n_2_[4] ),
        .O(\mOutPtr[5]_i_3_n_2 ));
  LUT6 #(
    .INIT(64'hA9AAAAAA59555555)) 
    \mOutPtr[6]_i_1 
       (.I0(\mOutPtr_reg_n_2_[6] ),
        .I1(\mOutPtr[7]_i_3_n_2 ),
        .I2(pop),
        .I3(\mOutPtr_reg[10]_0 ),
        .I4(full_n_reg_0),
        .I5(\mOutPtr[7]_i_2_n_2 ),
        .O(\mOutPtr[6]_i_1_n_2 ));
  LUT5 #(
    .INIT(32'hCCC93CC9)) 
    \mOutPtr[7]_i_1 
       (.I0(\mOutPtr[7]_i_2_n_2 ),
        .I1(\mOutPtr_reg_n_2_[7] ),
        .I2(\mOutPtr[9]_i_2_n_2 ),
        .I3(\mOutPtr_reg_n_2_[6] ),
        .I4(\mOutPtr[7]_i_3_n_2 ),
        .O(\mOutPtr[7]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \mOutPtr[7]_i_2 
       (.I0(\mOutPtr_reg_n_2_[5] ),
        .I1(\mOutPtr_reg_n_2_[3] ),
        .I2(\mOutPtr_reg_n_2_[0] ),
        .I3(\mOutPtr_reg_n_2_[1] ),
        .I4(\mOutPtr_reg_n_2_[2] ),
        .I5(\mOutPtr_reg_n_2_[4] ),
        .O(\mOutPtr[7]_i_2_n_2 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \mOutPtr[7]_i_3 
       (.I0(\mOutPtr_reg_n_2_[4] ),
        .I1(\mOutPtr_reg_n_2_[2] ),
        .I2(\mOutPtr_reg_n_2_[0] ),
        .I3(\mOutPtr_reg_n_2_[1] ),
        .I4(\mOutPtr_reg_n_2_[3] ),
        .I5(\mOutPtr_reg_n_2_[5] ),
        .O(\mOutPtr[7]_i_3_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'h59)) 
    \mOutPtr[8]_i_1 
       (.I0(\mOutPtr_reg_n_2_[8] ),
        .I1(\mOutPtr[10]_i_4_n_2 ),
        .I2(\mOutPtr[10]_i_3_n_2 ),
        .O(\mOutPtr[8]_i_1_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT5 #(
    .INIT(32'h55999A99)) 
    \mOutPtr[9]_i_1 
       (.I0(\mOutPtr_reg_n_2_[9] ),
        .I1(\mOutPtr[10]_i_4_n_2 ),
        .I2(\mOutPtr[9]_i_2_n_2 ),
        .I3(\mOutPtr_reg_n_2_[8] ),
        .I4(\mOutPtr[10]_i_3_n_2 ),
        .O(\mOutPtr[9]_i_1_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \mOutPtr[9]_i_2 
       (.I0(pop),
        .I1(\mOutPtr_reg[10]_0 ),
        .I2(full_n_reg_0),
        .O(\mOutPtr[9]_i_2_n_2 ));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[0] 
       (.C(ap_clk),
        .CE(\mOutPtr[10]_i_1_n_2 ),
        .D(\mOutPtr[0]_i_1__0_n_2 ),
        .Q(\mOutPtr_reg_n_2_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[10] 
       (.C(ap_clk),
        .CE(\mOutPtr[10]_i_1_n_2 ),
        .D(\mOutPtr[10]_i_2_n_2 ),
        .Q(\mOutPtr_reg_n_2_[10] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[1] 
       (.C(ap_clk),
        .CE(\mOutPtr[10]_i_1_n_2 ),
        .D(\mOutPtr[1]_i_1_n_2 ),
        .Q(\mOutPtr_reg_n_2_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[2] 
       (.C(ap_clk),
        .CE(\mOutPtr[10]_i_1_n_2 ),
        .D(\mOutPtr[2]_i_1_n_2 ),
        .Q(\mOutPtr_reg_n_2_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[3] 
       (.C(ap_clk),
        .CE(\mOutPtr[10]_i_1_n_2 ),
        .D(\mOutPtr[3]_i_1__2_n_2 ),
        .Q(\mOutPtr_reg_n_2_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[4] 
       (.C(ap_clk),
        .CE(\mOutPtr[10]_i_1_n_2 ),
        .D(\mOutPtr[4]_i_1__0_n_2 ),
        .Q(\mOutPtr_reg_n_2_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[5] 
       (.C(ap_clk),
        .CE(\mOutPtr[10]_i_1_n_2 ),
        .D(\mOutPtr[5]_i_1_n_2 ),
        .Q(\mOutPtr_reg_n_2_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[6] 
       (.C(ap_clk),
        .CE(\mOutPtr[10]_i_1_n_2 ),
        .D(\mOutPtr[6]_i_1_n_2 ),
        .Q(\mOutPtr_reg_n_2_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[7] 
       (.C(ap_clk),
        .CE(\mOutPtr[10]_i_1_n_2 ),
        .D(\mOutPtr[7]_i_1_n_2 ),
        .Q(\mOutPtr_reg_n_2_[7] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[8] 
       (.C(ap_clk),
        .CE(\mOutPtr[10]_i_1_n_2 ),
        .D(\mOutPtr[8]_i_1_n_2 ),
        .Q(\mOutPtr_reg_n_2_[8] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \mOutPtr_reg[9] 
       (.C(ap_clk),
        .CE(\mOutPtr[10]_i_1_n_2 ),
        .D(\mOutPtr[9]_i_1_n_2 ),
        .Q(\mOutPtr_reg_n_2_[9] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \raddr_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[0]),
        .Q(\raddr_reg_n_2_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \raddr_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[1]),
        .Q(\raddr_reg_n_2_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \raddr_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[2]),
        .Q(\raddr_reg_n_2_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \raddr_reg[3] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[3]),
        .Q(\raddr_reg_n_2_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \raddr_reg[4] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[4]),
        .Q(\raddr_reg_n_2_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \raddr_reg[5] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[5]),
        .Q(\raddr_reg_n_2_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \raddr_reg[6] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[6]),
        .Q(\raddr_reg_n_2_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \raddr_reg[7] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[7]),
        .Q(\raddr_reg_n_2_[7] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \raddr_reg[8] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[8]),
        .Q(\raddr_reg_n_2_[8] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \raddr_reg[9] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[9]),
        .Q(\raddr_reg_n_2_[9] ),
        .R(SR));
  LUT6 #(
    .INIT(64'h2333333333333333)) 
    \waddr[0]_i_1 
       (.I0(\waddr[9]_i_2_n_2 ),
        .I1(\waddr_reg_n_2_[0] ),
        .I2(\waddr_reg_n_2_[7] ),
        .I3(\waddr_reg_n_2_[6] ),
        .I4(\waddr_reg_n_2_[9] ),
        .I5(\waddr_reg_n_2_[8] ),
        .O(\waddr[0]_i_1_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT5 #(
    .INIT(32'h00FFBF00)) 
    \waddr[1]_i_1 
       (.I0(\waddr[3]_i_2_n_2 ),
        .I1(\waddr_reg_n_2_[3] ),
        .I2(\waddr_reg_n_2_[2] ),
        .I3(\waddr_reg_n_2_[1] ),
        .I4(\waddr_reg_n_2_[0] ),
        .O(\waddr[1]_i_1_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT5 #(
    .INIT(32'h3C34CCCC)) 
    \waddr[2]_i_1 
       (.I0(\waddr_reg_n_2_[3] ),
        .I1(\waddr_reg_n_2_[2] ),
        .I2(\waddr_reg_n_2_[0] ),
        .I3(\waddr[3]_i_2_n_2 ),
        .I4(\waddr_reg_n_2_[1] ),
        .O(\waddr[2]_i_1_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT5 #(
    .INIT(32'h6C64CCCC)) 
    \waddr[3]_i_1 
       (.I0(\waddr_reg_n_2_[2] ),
        .I1(\waddr_reg_n_2_[3] ),
        .I2(\waddr_reg_n_2_[0] ),
        .I3(\waddr[3]_i_2_n_2 ),
        .I4(\waddr_reg_n_2_[1] ),
        .O(\waddr[3]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \waddr[3]_i_2 
       (.I0(\waddr_reg_n_2_[8] ),
        .I1(\waddr_reg_n_2_[9] ),
        .I2(\waddr_reg_n_2_[6] ),
        .I3(\waddr_reg_n_2_[7] ),
        .I4(\waddr_reg_n_2_[5] ),
        .I5(\waddr_reg_n_2_[4] ),
        .O(\waddr[3]_i_2_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT5 #(
    .INIT(32'hF0F0FC1C)) 
    \waddr[4]_i_1 
       (.I0(\waddr_reg_n_2_[5] ),
        .I1(\waddr_reg_n_2_[0] ),
        .I2(\waddr_reg_n_2_[4] ),
        .I3(\waddr[5]_i_2_n_2 ),
        .I4(\waddr[5]_i_3_n_2 ),
        .O(\waddr[4]_i_1_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT5 #(
    .INIT(32'hF0F0F858)) 
    \waddr[5]_i_1__0 
       (.I0(\waddr_reg_n_2_[4] ),
        .I1(\waddr_reg_n_2_[0] ),
        .I2(\waddr_reg_n_2_[5] ),
        .I3(\waddr[5]_i_2_n_2 ),
        .I4(\waddr[5]_i_3_n_2 ),
        .O(\waddr[5]_i_1__0_n_2 ));
  LUT5 #(
    .INIT(32'h00007FFF)) 
    \waddr[5]_i_2 
       (.I0(\waddr_reg_n_2_[8] ),
        .I1(\waddr_reg_n_2_[9] ),
        .I2(\waddr_reg_n_2_[6] ),
        .I3(\waddr_reg_n_2_[7] ),
        .I4(\waddr_reg_n_2_[0] ),
        .O(\waddr[5]_i_2_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \waddr[5]_i_3 
       (.I0(\waddr_reg_n_2_[3] ),
        .I1(\waddr_reg_n_2_[2] ),
        .I2(\waddr_reg_n_2_[1] ),
        .O(\waddr[5]_i_3_n_2 ));
  LUT6 #(
    .INIT(64'hFF00FF7F00FF0000)) 
    \waddr[6]_i_1 
       (.I0(\waddr_reg_n_2_[9] ),
        .I1(\waddr_reg_n_2_[8] ),
        .I2(\waddr_reg_n_2_[7] ),
        .I3(\waddr[9]_i_2_n_2 ),
        .I4(\waddr_reg_n_2_[0] ),
        .I5(\waddr_reg_n_2_[6] ),
        .O(\waddr[6]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'hAABFFFFF55000000)) 
    \waddr[7]_i_1 
       (.I0(\waddr[9]_i_2_n_2 ),
        .I1(\waddr_reg_n_2_[9] ),
        .I2(\waddr_reg_n_2_[8] ),
        .I3(\waddr_reg_n_2_[0] ),
        .I4(\waddr_reg_n_2_[6] ),
        .I5(\waddr_reg_n_2_[7] ),
        .O(\waddr[7]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'hF01CF0F0F0F0F0F0)) 
    \waddr[8]_i_1 
       (.I0(\waddr_reg_n_2_[9] ),
        .I1(\waddr_reg_n_2_[0] ),
        .I2(\waddr_reg_n_2_[8] ),
        .I3(\waddr[9]_i_2_n_2 ),
        .I4(\waddr_reg_n_2_[7] ),
        .I5(\waddr_reg_n_2_[6] ),
        .O(\waddr[8]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'hF7FFF7FF08000000)) 
    \waddr[9]_i_1 
       (.I0(\waddr_reg_n_2_[6] ),
        .I1(\waddr_reg_n_2_[7] ),
        .I2(\waddr[9]_i_2_n_2 ),
        .I3(\waddr_reg_n_2_[8] ),
        .I4(\waddr_reg_n_2_[0] ),
        .I5(\waddr_reg_n_2_[9] ),
        .O(\waddr[9]_i_1_n_2 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \waddr[9]_i_2 
       (.I0(\waddr_reg_n_2_[1] ),
        .I1(\waddr_reg_n_2_[2] ),
        .I2(\waddr_reg_n_2_[3] ),
        .I3(\waddr_reg_n_2_[5] ),
        .I4(\waddr_reg_n_2_[4] ),
        .O(\waddr[9]_i_2_n_2 ));
  FDRE #(
    .INIT(1'b0)) 
    \waddr_reg[0] 
       (.C(ap_clk),
        .CE(we),
        .D(\waddr[0]_i_1_n_2 ),
        .Q(\waddr_reg_n_2_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \waddr_reg[1] 
       (.C(ap_clk),
        .CE(we),
        .D(\waddr[1]_i_1_n_2 ),
        .Q(\waddr_reg_n_2_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \waddr_reg[2] 
       (.C(ap_clk),
        .CE(we),
        .D(\waddr[2]_i_1_n_2 ),
        .Q(\waddr_reg_n_2_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \waddr_reg[3] 
       (.C(ap_clk),
        .CE(we),
        .D(\waddr[3]_i_1_n_2 ),
        .Q(\waddr_reg_n_2_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \waddr_reg[4] 
       (.C(ap_clk),
        .CE(we),
        .D(\waddr[4]_i_1_n_2 ),
        .Q(\waddr_reg_n_2_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \waddr_reg[5] 
       (.C(ap_clk),
        .CE(we),
        .D(\waddr[5]_i_1__0_n_2 ),
        .Q(\waddr_reg_n_2_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \waddr_reg[6] 
       (.C(ap_clk),
        .CE(we),
        .D(\waddr[6]_i_1_n_2 ),
        .Q(\waddr_reg_n_2_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \waddr_reg[7] 
       (.C(ap_clk),
        .CE(we),
        .D(\waddr[7]_i_1_n_2 ),
        .Q(\waddr_reg_n_2_[7] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \waddr_reg[8] 
       (.C(ap_clk),
        .CE(we),
        .D(\waddr[8]_i_1_n_2 ),
        .Q(\waddr_reg_n_2_[8] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \waddr_reg[9] 
       (.C(ap_clk),
        .CE(we),
        .D(\waddr[9]_i_1_n_2 ),
        .Q(\waddr_reg_n_2_[9] ),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "read_romcode_BUS0_m_axi_load" *) 
module design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_load
   (BUS0_RVALID,
    RREADY_Dummy,
    ARVALID_Dummy,
    RBURST_READY_Dummy,
    \icmp_ln31_reg_153_reg[0] ,
    full_n_reg,
    D,
    dout,
    SR,
    ap_clk,
    ready_for_outstanding,
    ap_rst_n,
    \mOutPtr_reg[10] ,
    dout_vld_reg,
    ARREADY_Dummy,
    Q,
    \dout_reg[61] ,
    select_ln26_reg_147,
    \ap_CS_fsm_reg[2] ,
    we,
    din);
  output BUS0_RVALID;
  output RREADY_Dummy;
  output ARVALID_Dummy;
  output RBURST_READY_Dummy;
  output \icmp_ln31_reg_153_reg[0] ;
  output full_n_reg;
  output [74:0]D;
  output [32:0]dout;
  input [0:0]SR;
  input ap_clk;
  input ready_for_outstanding;
  input ap_rst_n;
  input [0:0]\mOutPtr_reg[10] ;
  input dout_vld_reg;
  input ARREADY_Dummy;
  input [4:0]Q;
  input [61:0]\dout_reg[61] ;
  input [11:0]select_ln26_reg_147;
  input \ap_CS_fsm_reg[2] ;
  input we;
  input [33:0]din;

  wire ARREADY_Dummy;
  wire ARVALID_Dummy;
  wire BUS0_RVALID;
  wire [74:0]D;
  wire [4:0]Q;
  wire RBURST_READY_Dummy;
  wire RREADY_Dummy;
  wire [0:0]SR;
  wire \ap_CS_fsm_reg[2] ;
  wire ap_clk;
  wire ap_rst_n;
  wire [33:0]din;
  wire [32:0]dout;
  wire [61:0]\dout_reg[61] ;
  wire dout_vld_reg;
  wire fifo_rreq_n_16;
  wire fifo_rreq_n_17;
  wire fifo_rreq_n_18;
  wire fifo_rreq_n_19;
  wire fifo_rreq_n_20;
  wire fifo_rreq_n_21;
  wire fifo_rreq_n_22;
  wire fifo_rreq_n_23;
  wire fifo_rreq_n_24;
  wire fifo_rreq_n_25;
  wire fifo_rreq_n_26;
  wire fifo_rreq_n_27;
  wire fifo_rreq_n_28;
  wire fifo_rreq_n_29;
  wire fifo_rreq_n_30;
  wire fifo_rreq_n_31;
  wire fifo_rreq_n_32;
  wire fifo_rreq_n_33;
  wire fifo_rreq_n_34;
  wire fifo_rreq_n_35;
  wire fifo_rreq_n_36;
  wire fifo_rreq_n_37;
  wire fifo_rreq_n_38;
  wire fifo_rreq_n_39;
  wire fifo_rreq_n_40;
  wire fifo_rreq_n_41;
  wire fifo_rreq_n_42;
  wire fifo_rreq_n_43;
  wire fifo_rreq_n_44;
  wire fifo_rreq_n_45;
  wire fifo_rreq_n_46;
  wire fifo_rreq_n_47;
  wire fifo_rreq_n_48;
  wire fifo_rreq_n_49;
  wire fifo_rreq_n_50;
  wire fifo_rreq_n_51;
  wire fifo_rreq_n_52;
  wire fifo_rreq_n_53;
  wire fifo_rreq_n_54;
  wire fifo_rreq_n_55;
  wire fifo_rreq_n_56;
  wire fifo_rreq_n_57;
  wire fifo_rreq_n_58;
  wire fifo_rreq_n_59;
  wire fifo_rreq_n_60;
  wire fifo_rreq_n_61;
  wire fifo_rreq_n_62;
  wire fifo_rreq_n_63;
  wire fifo_rreq_n_64;
  wire fifo_rreq_n_65;
  wire fifo_rreq_n_66;
  wire fifo_rreq_n_67;
  wire fifo_rreq_n_68;
  wire fifo_rreq_n_69;
  wire fifo_rreq_n_70;
  wire fifo_rreq_n_71;
  wire fifo_rreq_n_72;
  wire fifo_rreq_n_73;
  wire fifo_rreq_n_74;
  wire fifo_rreq_n_75;
  wire fifo_rreq_n_76;
  wire fifo_rreq_n_77;
  wire fifo_rreq_n_79;
  wire fifo_rreq_n_80;
  wire fifo_rreq_n_81;
  wire fifo_rreq_n_82;
  wire fifo_rreq_n_83;
  wire fifo_rreq_n_84;
  wire fifo_rreq_n_85;
  wire fifo_rreq_n_86;
  wire fifo_rreq_n_87;
  wire fifo_rreq_n_88;
  wire fifo_rreq_n_89;
  wire fifo_rreq_n_90;
  wire fifo_rreq_n_91;
  wire full_n_reg;
  wire \icmp_ln31_reg_153_reg[0] ;
  wire [0:0]\mOutPtr_reg[10] ;
  wire next_rreq;
  wire ready_for_outstanding;
  wire [11:0]rreq_len;
  wire [11:0]select_ln26_reg_147;
  wire [31:2]tmp_len0;
  wire tmp_len0_carry__0_n_2;
  wire tmp_len0_carry__0_n_3;
  wire tmp_len0_carry__0_n_4;
  wire tmp_len0_carry__0_n_5;
  wire tmp_len0_carry__1_n_2;
  wire tmp_len0_carry__1_n_3;
  wire tmp_len0_carry__1_n_4;
  wire tmp_len0_carry__1_n_5;
  wire tmp_len0_carry__2_n_5;
  wire tmp_len0_carry_n_2;
  wire tmp_len0_carry_n_3;
  wire tmp_len0_carry_n_4;
  wire tmp_len0_carry_n_5;
  wire we;
  wire [0:0]NLW_tmp_len0_carry_O_UNCONNECTED;
  wire [3:1]NLW_tmp_len0_carry__2_CO_UNCONNECTED;
  wire [3:2]NLW_tmp_len0_carry__2_O_UNCONNECTED;

  design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_fifo__parameterized3 buff_rdata
       (.BUS0_RVALID(BUS0_RVALID),
        .SR(SR),
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .din(din),
        .dout(dout),
        .dout_vld_reg_0(dout_vld_reg),
        .full_n_reg_0(RREADY_Dummy),
        .\mOutPtr_reg[10]_0 (\mOutPtr_reg[10] ),
        .we(we));
  design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_fifo fifo_rreq
       (.ARREADY_Dummy(ARREADY_Dummy),
        .E(next_rreq),
        .Q({rreq_len,fifo_rreq_n_16,fifo_rreq_n_17,fifo_rreq_n_18,fifo_rreq_n_19,fifo_rreq_n_20,fifo_rreq_n_21,fifo_rreq_n_22,fifo_rreq_n_23,fifo_rreq_n_24,fifo_rreq_n_25,fifo_rreq_n_26,fifo_rreq_n_27,fifo_rreq_n_28,fifo_rreq_n_29,fifo_rreq_n_30,fifo_rreq_n_31,fifo_rreq_n_32,fifo_rreq_n_33,fifo_rreq_n_34,fifo_rreq_n_35,fifo_rreq_n_36,fifo_rreq_n_37,fifo_rreq_n_38,fifo_rreq_n_39,fifo_rreq_n_40,fifo_rreq_n_41,fifo_rreq_n_42,fifo_rreq_n_43,fifo_rreq_n_44,fifo_rreq_n_45,fifo_rreq_n_46,fifo_rreq_n_47,fifo_rreq_n_48,fifo_rreq_n_49,fifo_rreq_n_50,fifo_rreq_n_51,fifo_rreq_n_52,fifo_rreq_n_53,fifo_rreq_n_54,fifo_rreq_n_55,fifo_rreq_n_56,fifo_rreq_n_57,fifo_rreq_n_58,fifo_rreq_n_59,fifo_rreq_n_60,fifo_rreq_n_61,fifo_rreq_n_62,fifo_rreq_n_63,fifo_rreq_n_64,fifo_rreq_n_65,fifo_rreq_n_66,fifo_rreq_n_67,fifo_rreq_n_68,fifo_rreq_n_69,fifo_rreq_n_70,fifo_rreq_n_71,fifo_rreq_n_72,fifo_rreq_n_73,fifo_rreq_n_74,fifo_rreq_n_75,fifo_rreq_n_76,fifo_rreq_n_77}),
        .S({fifo_rreq_n_79,fifo_rreq_n_80,fifo_rreq_n_81,fifo_rreq_n_82}),
        .SR(SR),
        .\ap_CS_fsm_reg[1] (Q),
        .\ap_CS_fsm_reg[2] (\ap_CS_fsm_reg[2] ),
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .\dout_reg[61] (\dout_reg[61] ),
        .\dout_reg[66] ({fifo_rreq_n_87,fifo_rreq_n_88,fifo_rreq_n_89}),
        .\dout_reg[70] ({fifo_rreq_n_83,fifo_rreq_n_84,fifo_rreq_n_85,fifo_rreq_n_86}),
        .\dout_reg[75] (fifo_rreq_n_90),
        .full_n_reg_0(full_n_reg),
        .\icmp_ln31_reg_153_reg[0] (\icmp_ln31_reg_153_reg[0] ),
        .s_ready_t_reg(fifo_rreq_n_91),
        .select_ln26_reg_147(select_ln26_reg_147),
        .tmp_valid_reg(ARVALID_Dummy));
  FDRE ready_for_outstanding_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ready_for_outstanding),
        .Q(RBURST_READY_Dummy),
        .R(SR));
  FDRE \tmp_addr_reg[10] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_69),
        .Q(D[8]),
        .R(SR));
  FDRE \tmp_addr_reg[11] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_68),
        .Q(D[9]),
        .R(SR));
  FDRE \tmp_addr_reg[12] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_67),
        .Q(D[10]),
        .R(SR));
  FDRE \tmp_addr_reg[13] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_66),
        .Q(D[11]),
        .R(SR));
  FDRE \tmp_addr_reg[14] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_65),
        .Q(D[12]),
        .R(SR));
  FDRE \tmp_addr_reg[15] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_64),
        .Q(D[13]),
        .R(SR));
  FDRE \tmp_addr_reg[16] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_63),
        .Q(D[14]),
        .R(SR));
  FDRE \tmp_addr_reg[17] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_62),
        .Q(D[15]),
        .R(SR));
  FDRE \tmp_addr_reg[18] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_61),
        .Q(D[16]),
        .R(SR));
  FDRE \tmp_addr_reg[19] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_60),
        .Q(D[17]),
        .R(SR));
  FDRE \tmp_addr_reg[20] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_59),
        .Q(D[18]),
        .R(SR));
  FDRE \tmp_addr_reg[21] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_58),
        .Q(D[19]),
        .R(SR));
  FDRE \tmp_addr_reg[22] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_57),
        .Q(D[20]),
        .R(SR));
  FDRE \tmp_addr_reg[23] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_56),
        .Q(D[21]),
        .R(SR));
  FDRE \tmp_addr_reg[24] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_55),
        .Q(D[22]),
        .R(SR));
  FDRE \tmp_addr_reg[25] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_54),
        .Q(D[23]),
        .R(SR));
  FDRE \tmp_addr_reg[26] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_53),
        .Q(D[24]),
        .R(SR));
  FDRE \tmp_addr_reg[27] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_52),
        .Q(D[25]),
        .R(SR));
  FDRE \tmp_addr_reg[28] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_51),
        .Q(D[26]),
        .R(SR));
  FDRE \tmp_addr_reg[29] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_50),
        .Q(D[27]),
        .R(SR));
  FDRE \tmp_addr_reg[2] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_77),
        .Q(D[0]),
        .R(SR));
  FDRE \tmp_addr_reg[30] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_49),
        .Q(D[28]),
        .R(SR));
  FDRE \tmp_addr_reg[31] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_48),
        .Q(D[29]),
        .R(SR));
  FDRE \tmp_addr_reg[32] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_47),
        .Q(D[30]),
        .R(SR));
  FDRE \tmp_addr_reg[33] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_46),
        .Q(D[31]),
        .R(SR));
  FDRE \tmp_addr_reg[34] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_45),
        .Q(D[32]),
        .R(SR));
  FDRE \tmp_addr_reg[35] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_44),
        .Q(D[33]),
        .R(SR));
  FDRE \tmp_addr_reg[36] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_43),
        .Q(D[34]),
        .R(SR));
  FDRE \tmp_addr_reg[37] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_42),
        .Q(D[35]),
        .R(SR));
  FDRE \tmp_addr_reg[38] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_41),
        .Q(D[36]),
        .R(SR));
  FDRE \tmp_addr_reg[39] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_40),
        .Q(D[37]),
        .R(SR));
  FDRE \tmp_addr_reg[3] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_76),
        .Q(D[1]),
        .R(SR));
  FDRE \tmp_addr_reg[40] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_39),
        .Q(D[38]),
        .R(SR));
  FDRE \tmp_addr_reg[41] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_38),
        .Q(D[39]),
        .R(SR));
  FDRE \tmp_addr_reg[42] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_37),
        .Q(D[40]),
        .R(SR));
  FDRE \tmp_addr_reg[43] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_36),
        .Q(D[41]),
        .R(SR));
  FDRE \tmp_addr_reg[44] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_35),
        .Q(D[42]),
        .R(SR));
  FDRE \tmp_addr_reg[45] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_34),
        .Q(D[43]),
        .R(SR));
  FDRE \tmp_addr_reg[46] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_33),
        .Q(D[44]),
        .R(SR));
  FDRE \tmp_addr_reg[47] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_32),
        .Q(D[45]),
        .R(SR));
  FDRE \tmp_addr_reg[48] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_31),
        .Q(D[46]),
        .R(SR));
  FDRE \tmp_addr_reg[49] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_30),
        .Q(D[47]),
        .R(SR));
  FDRE \tmp_addr_reg[4] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_75),
        .Q(D[2]),
        .R(SR));
  FDRE \tmp_addr_reg[50] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_29),
        .Q(D[48]),
        .R(SR));
  FDRE \tmp_addr_reg[51] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_28),
        .Q(D[49]),
        .R(SR));
  FDRE \tmp_addr_reg[52] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_27),
        .Q(D[50]),
        .R(SR));
  FDRE \tmp_addr_reg[53] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_26),
        .Q(D[51]),
        .R(SR));
  FDRE \tmp_addr_reg[54] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_25),
        .Q(D[52]),
        .R(SR));
  FDRE \tmp_addr_reg[55] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_24),
        .Q(D[53]),
        .R(SR));
  FDRE \tmp_addr_reg[56] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_23),
        .Q(D[54]),
        .R(SR));
  FDRE \tmp_addr_reg[57] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_22),
        .Q(D[55]),
        .R(SR));
  FDRE \tmp_addr_reg[58] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_21),
        .Q(D[56]),
        .R(SR));
  FDRE \tmp_addr_reg[59] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_20),
        .Q(D[57]),
        .R(SR));
  FDRE \tmp_addr_reg[5] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_74),
        .Q(D[3]),
        .R(SR));
  FDRE \tmp_addr_reg[60] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_19),
        .Q(D[58]),
        .R(SR));
  FDRE \tmp_addr_reg[61] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_18),
        .Q(D[59]),
        .R(SR));
  FDRE \tmp_addr_reg[62] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_17),
        .Q(D[60]),
        .R(SR));
  FDRE \tmp_addr_reg[63] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_16),
        .Q(D[61]),
        .R(SR));
  FDRE \tmp_addr_reg[6] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_73),
        .Q(D[4]),
        .R(SR));
  FDRE \tmp_addr_reg[7] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_72),
        .Q(D[5]),
        .R(SR));
  FDRE \tmp_addr_reg[8] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_71),
        .Q(D[6]),
        .R(SR));
  FDRE \tmp_addr_reg[9] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(fifo_rreq_n_70),
        .Q(D[7]),
        .R(SR));
  CARRY4 tmp_len0_carry
       (.CI(1'b0),
        .CO({tmp_len0_carry_n_2,tmp_len0_carry_n_3,tmp_len0_carry_n_4,tmp_len0_carry_n_5}),
        .CYINIT(1'b0),
        .DI({rreq_len[2:0],1'b0}),
        .O({tmp_len0[4:2],NLW_tmp_len0_carry_O_UNCONNECTED[0]}),
        .S({fifo_rreq_n_87,fifo_rreq_n_88,fifo_rreq_n_89,1'b1}));
  CARRY4 tmp_len0_carry__0
       (.CI(tmp_len0_carry_n_2),
        .CO({tmp_len0_carry__0_n_2,tmp_len0_carry__0_n_3,tmp_len0_carry__0_n_4,tmp_len0_carry__0_n_5}),
        .CYINIT(1'b0),
        .DI(rreq_len[6:3]),
        .O(tmp_len0[8:5]),
        .S({fifo_rreq_n_83,fifo_rreq_n_84,fifo_rreq_n_85,fifo_rreq_n_86}));
  CARRY4 tmp_len0_carry__1
       (.CI(tmp_len0_carry__0_n_2),
        .CO({tmp_len0_carry__1_n_2,tmp_len0_carry__1_n_3,tmp_len0_carry__1_n_4,tmp_len0_carry__1_n_5}),
        .CYINIT(1'b0),
        .DI(rreq_len[10:7]),
        .O(tmp_len0[12:9]),
        .S({fifo_rreq_n_79,fifo_rreq_n_80,fifo_rreq_n_81,fifo_rreq_n_82}));
  CARRY4 tmp_len0_carry__2
       (.CI(tmp_len0_carry__1_n_2),
        .CO({NLW_tmp_len0_carry__2_CO_UNCONNECTED[3:1],tmp_len0_carry__2_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,rreq_len[11]}),
        .O({NLW_tmp_len0_carry__2_O_UNCONNECTED[3:2],tmp_len0[31],tmp_len0[13]}),
        .S({1'b0,1'b0,1'b1,fifo_rreq_n_90}));
  FDRE \tmp_len_reg[10] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(tmp_len0[10]),
        .Q(D[70]),
        .R(SR));
  FDRE \tmp_len_reg[11] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(tmp_len0[11]),
        .Q(D[71]),
        .R(SR));
  FDRE \tmp_len_reg[12] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(tmp_len0[12]),
        .Q(D[72]),
        .R(SR));
  FDRE \tmp_len_reg[13] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(tmp_len0[13]),
        .Q(D[73]),
        .R(SR));
  FDRE \tmp_len_reg[2] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(tmp_len0[2]),
        .Q(D[62]),
        .R(SR));
  FDRE \tmp_len_reg[31] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(tmp_len0[31]),
        .Q(D[74]),
        .R(SR));
  FDRE \tmp_len_reg[3] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(tmp_len0[3]),
        .Q(D[63]),
        .R(SR));
  FDRE \tmp_len_reg[4] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(tmp_len0[4]),
        .Q(D[64]),
        .R(SR));
  FDRE \tmp_len_reg[5] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(tmp_len0[5]),
        .Q(D[65]),
        .R(SR));
  FDRE \tmp_len_reg[6] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(tmp_len0[6]),
        .Q(D[66]),
        .R(SR));
  FDRE \tmp_len_reg[7] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(tmp_len0[7]),
        .Q(D[67]),
        .R(SR));
  FDRE \tmp_len_reg[8] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(tmp_len0[8]),
        .Q(D[68]),
        .R(SR));
  FDRE \tmp_len_reg[9] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(tmp_len0[9]),
        .Q(D[69]),
        .R(SR));
  FDRE tmp_valid_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(fifo_rreq_n_91),
        .Q(ARVALID_Dummy),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "read_romcode_BUS0_m_axi_mem" *) 
module design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_mem__parameterized0
   (rnext,
    pop,
    dout,
    \raddr_reg_reg[9]_0 ,
    \raddr_reg_reg[9]_1 ,
    \raddr_reg_reg[6]_0 ,
    \raddr_reg_reg[1]_0 ,
    \raddr_reg_reg[1]_1 ,
    \raddr_reg_reg[7]_0 ,
    \raddr_reg_reg[5]_0 ,
    \raddr_reg_reg[4]_0 ,
    \raddr_reg_reg[4]_1 ,
    \raddr_reg_reg[2]_0 ,
    \raddr_reg_reg[9]_2 ,
    \raddr_reg_reg[9]_3 ,
    BUS0_RVALID,
    ap_rst_n,
    ap_clk,
    we,
    SR,
    Q,
    din);
  output [9:0]rnext;
  output pop;
  output [32:0]dout;
  input \raddr_reg_reg[9]_0 ;
  input \raddr_reg_reg[9]_1 ;
  input \raddr_reg_reg[6]_0 ;
  input \raddr_reg_reg[1]_0 ;
  input \raddr_reg_reg[1]_1 ;
  input \raddr_reg_reg[7]_0 ;
  input \raddr_reg_reg[5]_0 ;
  input \raddr_reg_reg[4]_0 ;
  input \raddr_reg_reg[4]_1 ;
  input \raddr_reg_reg[2]_0 ;
  input \raddr_reg_reg[9]_2 ;
  input \raddr_reg_reg[9]_3 ;
  input BUS0_RVALID;
  input ap_rst_n;
  input ap_clk;
  input we;
  input [0:0]SR;
  input [9:0]Q;
  input [33:0]din;

  wire BUS0_RVALID;
  wire [9:0]Q;
  wire [0:0]SR;
  wire ap_clk;
  wire ap_rst_n;
  wire [33:0]din;
  wire [32:0]dout;
  wire mem_reg_i_2_n_2;
  wire mem_reg_n_77;
  wire pop;
  wire [9:0]raddr_reg;
  wire \raddr_reg[3]_i_2_n_2 ;
  wire \raddr_reg[4]_i_2_n_2 ;
  wire \raddr_reg[5]_i_2_n_2 ;
  wire \raddr_reg[5]_i_3_n_2 ;
  wire \raddr_reg[7]_i_2_n_2 ;
  wire \raddr_reg[7]_i_3_n_2 ;
  wire \raddr_reg[7]_i_4_n_2 ;
  wire \raddr_reg[8]_i_2_n_2 ;
  wire \raddr_reg[8]_i_3_n_2 ;
  wire \raddr_reg[9]_i_2_n_2 ;
  wire \raddr_reg[9]_i_3_n_2 ;
  wire \raddr_reg[9]_i_4_n_2 ;
  wire \raddr_reg_reg[1]_0 ;
  wire \raddr_reg_reg[1]_1 ;
  wire \raddr_reg_reg[2]_0 ;
  wire \raddr_reg_reg[4]_0 ;
  wire \raddr_reg_reg[4]_1 ;
  wire \raddr_reg_reg[5]_0 ;
  wire \raddr_reg_reg[6]_0 ;
  wire \raddr_reg_reg[7]_0 ;
  wire \raddr_reg_reg[9]_0 ;
  wire \raddr_reg_reg[9]_1 ;
  wire \raddr_reg_reg[9]_2 ;
  wire \raddr_reg_reg[9]_3 ;
  wire [9:0]rnext;
  wire we;
  wire NLW_mem_reg_CASCADEOUTA_UNCONNECTED;
  wire NLW_mem_reg_CASCADEOUTB_UNCONNECTED;
  wire NLW_mem_reg_DBITERR_UNCONNECTED;
  wire NLW_mem_reg_INJECTDBITERR_UNCONNECTED;
  wire NLW_mem_reg_INJECTSBITERR_UNCONNECTED;
  wire NLW_mem_reg_SBITERR_UNCONNECTED;
  wire [31:0]NLW_mem_reg_DOADO_UNCONNECTED;
  wire [3:0]NLW_mem_reg_DOPADOP_UNCONNECTED;
  wire [3:2]NLW_mem_reg_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_mem_reg_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_mem_reg_RDADDRECC_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d32" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d32" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "34782" *) 
  (* RTL_RAM_NAME = "inst/BUS0_m_axi_U/load_unit/buff_rdata/U_fifo_mem/mem_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "33" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    mem_reg
       (.ADDRARDADDR({1'b1,Q,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,raddr_reg,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b1),
        .CASCADEOUTA(NLW_mem_reg_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_mem_reg_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(ap_clk),
        .CLKBWRCLK(ap_clk),
        .DBITERR(NLW_mem_reg_DBITERR_UNCONNECTED),
        .DIADI(din[31:0]),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,din[33:32]}),
        .DIPBDIP({1'b0,1'b0,1'b1,1'b1}),
        .DOADO(NLW_mem_reg_DOADO_UNCONNECTED[31:0]),
        .DOBDO(dout[31:0]),
        .DOPADOP(NLW_mem_reg_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP({NLW_mem_reg_DOPBDOP_UNCONNECTED[3:2],dout[32],mem_reg_n_77}),
        .ECCPARITY(NLW_mem_reg_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(we),
        .ENBWREN(mem_reg_i_2_n_2),
        .INJECTDBITERR(NLW_mem_reg_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_mem_reg_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_mem_reg_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(SR),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_mem_reg_SBITERR_UNCONNECTED),
        .WEA({1'b1,1'b1,1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT2 #(
    .INIT(4'hB)) 
    mem_reg_i_2
       (.I0(pop),
        .I1(ap_rst_n),
        .O(mem_reg_i_2_n_2));
  LUT3 #(
    .INIT(8'h8A)) 
    mem_reg_i_4
       (.I0(\raddr_reg_reg[9]_2 ),
        .I1(\raddr_reg_reg[9]_3 ),
        .I2(BUS0_RVALID),
        .O(pop));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'h26)) 
    \raddr_reg[0]_i_1 
       (.I0(\raddr_reg_reg[1]_0 ),
        .I1(pop),
        .I2(\raddr_reg[3]_i_2_n_2 ),
        .O(rnext[0]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT4 #(
    .INIT(16'h06CC)) 
    \raddr_reg[1]_i_1 
       (.I0(\raddr_reg_reg[1]_0 ),
        .I1(\raddr_reg_reg[1]_1 ),
        .I2(\raddr_reg[3]_i_2_n_2 ),
        .I3(pop),
        .O(rnext[1]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT5 #(
    .INIT(32'h006CCCCC)) 
    \raddr_reg[2]_i_1 
       (.I0(\raddr_reg_reg[1]_0 ),
        .I1(\raddr_reg_reg[2]_0 ),
        .I2(\raddr_reg_reg[1]_1 ),
        .I3(\raddr_reg[3]_i_2_n_2 ),
        .I4(pop),
        .O(rnext[2]));
  LUT5 #(
    .INIT(32'h00CC9DCC)) 
    \raddr_reg[3]_i_1 
       (.I0(\raddr_reg[4]_i_2_n_2 ),
        .I1(\raddr_reg_reg[4]_0 ),
        .I2(\raddr_reg[7]_i_3_n_2 ),
        .I3(pop),
        .I4(\raddr_reg[3]_i_2_n_2 ),
        .O(rnext[3]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \raddr_reg[3]_i_2 
       (.I0(\raddr_reg[9]_i_4_n_2 ),
        .I1(\raddr_reg_reg[7]_0 ),
        .I2(\raddr_reg_reg[9]_0 ),
        .I3(\raddr_reg_reg[9]_1 ),
        .I4(\raddr_reg_reg[2]_0 ),
        .I5(\raddr_reg_reg[1]_1 ),
        .O(\raddr_reg[3]_i_2_n_2 ));
  LUT6 #(
    .INIT(64'hE0EE0E00FFFF0000)) 
    \raddr_reg[4]_i_1 
       (.I0(\raddr_reg[7]_i_3_n_2 ),
        .I1(\raddr_reg[7]_i_4_n_2 ),
        .I2(\raddr_reg[4]_i_2_n_2 ),
        .I3(\raddr_reg_reg[4]_0 ),
        .I4(\raddr_reg_reg[4]_1 ),
        .I5(pop),
        .O(rnext[4]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \raddr_reg[4]_i_2 
       (.I0(\raddr_reg_reg[1]_1 ),
        .I1(\raddr_reg_reg[2]_0 ),
        .I2(\raddr_reg_reg[1]_0 ),
        .O(\raddr_reg[4]_i_2_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \raddr_reg[5]_i_1 
       (.I0(\raddr_reg[5]_i_2_n_2 ),
        .I1(pop),
        .I2(\raddr_reg_reg[5]_0 ),
        .O(rnext[5]));
  LUT6 #(
    .INIT(64'hF708F408FF00FFFF)) 
    \raddr_reg[5]_i_2 
       (.I0(\raddr_reg_reg[4]_1 ),
        .I1(\raddr_reg_reg[1]_0 ),
        .I2(\raddr_reg[5]_i_3_n_2 ),
        .I3(\raddr_reg_reg[5]_0 ),
        .I4(\raddr_reg[7]_i_3_n_2 ),
        .I5(\raddr_reg_reg[4]_0 ),
        .O(\raddr_reg[5]_i_2_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \raddr_reg[5]_i_3 
       (.I0(\raddr_reg_reg[2]_0 ),
        .I1(\raddr_reg_reg[1]_1 ),
        .O(\raddr_reg[5]_i_3_n_2 ));
  LUT5 #(
    .INIT(32'h7F0F0070)) 
    \raddr_reg[6]_i_1 
       (.I0(\raddr_reg[9]_i_3_n_2 ),
        .I1(\raddr_reg_reg[9]_1 ),
        .I2(pop),
        .I3(\raddr_reg[7]_i_2_n_2 ),
        .I4(\raddr_reg_reg[6]_0 ),
        .O(rnext[6]));
  LUT6 #(
    .INIT(64'hA6A6A600AAAAAAAA)) 
    \raddr_reg[7]_i_1 
       (.I0(\raddr_reg_reg[7]_0 ),
        .I1(\raddr_reg_reg[6]_0 ),
        .I2(\raddr_reg[7]_i_2_n_2 ),
        .I3(\raddr_reg[7]_i_3_n_2 ),
        .I4(\raddr_reg[7]_i_4_n_2 ),
        .I5(pop),
        .O(rnext[7]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \raddr_reg[7]_i_2 
       (.I0(\raddr_reg_reg[1]_0 ),
        .I1(\raddr_reg_reg[2]_0 ),
        .I2(\raddr_reg_reg[1]_1 ),
        .I3(\raddr_reg_reg[4]_0 ),
        .I4(\raddr_reg_reg[5]_0 ),
        .I5(\raddr_reg_reg[4]_1 ),
        .O(\raddr_reg[7]_i_2_n_2 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \raddr_reg[7]_i_3 
       (.I0(\raddr_reg_reg[6]_0 ),
        .I1(\raddr_reg_reg[7]_0 ),
        .I2(\raddr_reg_reg[9]_0 ),
        .I3(\raddr_reg_reg[9]_1 ),
        .I4(\raddr_reg_reg[5]_0 ),
        .I5(\raddr_reg_reg[4]_1 ),
        .O(\raddr_reg[7]_i_3_n_2 ));
  LUT6 #(
    .INIT(64'hF7FFFFFFF7F7F7F7)) 
    \raddr_reg[7]_i_4 
       (.I0(\raddr_reg_reg[2]_0 ),
        .I1(\raddr_reg_reg[1]_1 ),
        .I2(\raddr_reg_reg[1]_0 ),
        .I3(\raddr_reg_reg[4]_0 ),
        .I4(\raddr_reg_reg[4]_1 ),
        .I5(\raddr_reg_reg[5]_0 ),
        .O(\raddr_reg[7]_i_4_n_2 ));
  LUT6 #(
    .INIT(64'h09AA09AA09AAFFAA)) 
    \raddr_reg[8]_i_1 
       (.I0(\raddr_reg_reg[9]_0 ),
        .I1(\raddr_reg[9]_i_2_n_2 ),
        .I2(\raddr_reg[8]_i_2_n_2 ),
        .I3(pop),
        .I4(\raddr_reg_reg[6]_0 ),
        .I5(\raddr_reg[8]_i_3_n_2 ),
        .O(rnext[8]));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \raddr_reg[8]_i_2 
       (.I0(\raddr_reg_reg[7]_0 ),
        .I1(\raddr_reg_reg[9]_0 ),
        .I2(\raddr_reg_reg[9]_1 ),
        .I3(\raddr_reg_reg[5]_0 ),
        .I4(\raddr_reg_reg[4]_1 ),
        .I5(\raddr_reg[7]_i_4_n_2 ),
        .O(\raddr_reg[8]_i_2_n_2 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \raddr_reg[8]_i_3 
       (.I0(\raddr_reg_reg[7]_0 ),
        .I1(\raddr_reg_reg[9]_0 ),
        .I2(\raddr_reg_reg[9]_1 ),
        .O(\raddr_reg[8]_i_3_n_2 ));
  LUT5 #(
    .INIT(32'h0DFF2200)) 
    \raddr_reg[9]_i_1 
       (.I0(\raddr_reg_reg[9]_0 ),
        .I1(\raddr_reg[9]_i_2_n_2 ),
        .I2(\raddr_reg[9]_i_3_n_2 ),
        .I3(pop),
        .I4(\raddr_reg_reg[9]_1 ),
        .O(rnext[9]));
  LUT6 #(
    .INIT(64'hFF7FFFFFFFFFFFFF)) 
    \raddr_reg[9]_i_2 
       (.I0(\raddr_reg_reg[4]_1 ),
        .I1(\raddr_reg_reg[5]_0 ),
        .I2(\raddr_reg_reg[4]_0 ),
        .I3(\raddr_reg[4]_i_2_n_2 ),
        .I4(\raddr_reg_reg[6]_0 ),
        .I5(\raddr_reg_reg[7]_0 ),
        .O(\raddr_reg[9]_i_2_n_2 ));
  LUT6 #(
    .INIT(64'h2000000000000000)) 
    \raddr_reg[9]_i_3 
       (.I0(\raddr_reg[9]_i_4_n_2 ),
        .I1(\raddr_reg_reg[1]_0 ),
        .I2(\raddr_reg_reg[1]_1 ),
        .I3(\raddr_reg_reg[2]_0 ),
        .I4(\raddr_reg_reg[9]_0 ),
        .I5(\raddr_reg_reg[7]_0 ),
        .O(\raddr_reg[9]_i_3_n_2 ));
  LUT6 #(
    .INIT(64'h8000000080808080)) 
    \raddr_reg[9]_i_4 
       (.I0(\raddr_reg_reg[4]_0 ),
        .I1(\raddr_reg_reg[5]_0 ),
        .I2(\raddr_reg_reg[4]_1 ),
        .I3(\raddr_reg_reg[7]_0 ),
        .I4(\raddr_reg_reg[6]_0 ),
        .I5(\raddr_reg_reg[9]_0 ),
        .O(\raddr_reg[9]_i_4_n_2 ));
  FDRE \raddr_reg_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[0]),
        .Q(raddr_reg[0]),
        .R(1'b0));
  FDRE \raddr_reg_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[1]),
        .Q(raddr_reg[1]),
        .R(1'b0));
  FDRE \raddr_reg_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[2]),
        .Q(raddr_reg[2]),
        .R(1'b0));
  FDRE \raddr_reg_reg[3] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[3]),
        .Q(raddr_reg[3]),
        .R(1'b0));
  FDRE \raddr_reg_reg[4] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[4]),
        .Q(raddr_reg[4]),
        .R(1'b0));
  FDRE \raddr_reg_reg[5] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[5]),
        .Q(raddr_reg[5]),
        .R(1'b0));
  FDRE \raddr_reg_reg[6] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[6]),
        .Q(raddr_reg[6]),
        .R(1'b0));
  FDRE \raddr_reg_reg[7] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[7]),
        .Q(raddr_reg[7]),
        .R(1'b0));
  FDRE \raddr_reg_reg[8] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[8]),
        .Q(raddr_reg[8]),
        .R(1'b0));
  FDRE \raddr_reg_reg[9] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(rnext[9]),
        .Q(raddr_reg[9]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "read_romcode_BUS0_m_axi_read" *) 
module design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_read
   (SR,
    ARREADY_Dummy,
    s_ready_t_reg,
    \could_multi_bursts.ARVALID_Dummy_reg_0 ,
    m_axi_BUS0_ARADDR,
    Q,
    \state_reg[0] ,
    we,
    din,
    m_axi_BUS0_ARLEN,
    ap_clk,
    ap_rst_n,
    m_axi_BUS0_ARREADY,
    RREADY_Dummy,
    ARVALID_Dummy,
    RBURST_READY_Dummy,
    m_axi_BUS0_RVALID,
    D,
    \data_p2_reg[32] );
  output [0:0]SR;
  output ARREADY_Dummy;
  output s_ready_t_reg;
  output \could_multi_bursts.ARVALID_Dummy_reg_0 ;
  output [61:0]m_axi_BUS0_ARADDR;
  output [32:0]Q;
  output [0:0]\state_reg[0] ;
  output we;
  output [0:0]din;
  output [5:0]m_axi_BUS0_ARLEN;
  input ap_clk;
  input ap_rst_n;
  input m_axi_BUS0_ARREADY;
  input RREADY_Dummy;
  input ARVALID_Dummy;
  input RBURST_READY_Dummy;
  input m_axi_BUS0_RVALID;
  input [74:0]D;
  input [32:0]\data_p2_reg[32] ;

  wire ARREADY_Dummy;
  wire ARVALID_Dummy;
  wire [74:0]D;
  wire [32:0]Q;
  wire RBURST_READY_Dummy;
  wire RREADY_Dummy;
  wire [0:0]SR;
  wire ap_clk;
  wire ap_rst_n;
  wire [63:2]araddr_tmp0;
  wire [9:0]beat_len;
  wire \could_multi_bursts.ARVALID_Dummy_reg_0 ;
  wire \could_multi_bursts.araddr_buf[4]_i_3_n_2 ;
  wire \could_multi_bursts.araddr_buf[4]_i_4_n_2 ;
  wire \could_multi_bursts.araddr_buf[4]_i_5_n_2 ;
  wire \could_multi_bursts.araddr_buf[8]_i_3_n_2 ;
  wire \could_multi_bursts.araddr_buf[8]_i_4_n_2 ;
  wire \could_multi_bursts.araddr_buf[8]_i_5_n_2 ;
  wire \could_multi_bursts.araddr_buf[8]_i_6_n_2 ;
  wire \could_multi_bursts.araddr_buf[8]_i_7_n_2 ;
  wire \could_multi_bursts.araddr_buf_reg[12]_i_2_n_2 ;
  wire \could_multi_bursts.araddr_buf_reg[12]_i_2_n_3 ;
  wire \could_multi_bursts.araddr_buf_reg[12]_i_2_n_4 ;
  wire \could_multi_bursts.araddr_buf_reg[12]_i_2_n_5 ;
  wire \could_multi_bursts.araddr_buf_reg[16]_i_2_n_2 ;
  wire \could_multi_bursts.araddr_buf_reg[16]_i_2_n_3 ;
  wire \could_multi_bursts.araddr_buf_reg[16]_i_2_n_4 ;
  wire \could_multi_bursts.araddr_buf_reg[16]_i_2_n_5 ;
  wire \could_multi_bursts.araddr_buf_reg[20]_i_2_n_2 ;
  wire \could_multi_bursts.araddr_buf_reg[20]_i_2_n_3 ;
  wire \could_multi_bursts.araddr_buf_reg[20]_i_2_n_4 ;
  wire \could_multi_bursts.araddr_buf_reg[20]_i_2_n_5 ;
  wire \could_multi_bursts.araddr_buf_reg[24]_i_2_n_2 ;
  wire \could_multi_bursts.araddr_buf_reg[24]_i_2_n_3 ;
  wire \could_multi_bursts.araddr_buf_reg[24]_i_2_n_4 ;
  wire \could_multi_bursts.araddr_buf_reg[24]_i_2_n_5 ;
  wire \could_multi_bursts.araddr_buf_reg[28]_i_2_n_2 ;
  wire \could_multi_bursts.araddr_buf_reg[28]_i_2_n_3 ;
  wire \could_multi_bursts.araddr_buf_reg[28]_i_2_n_4 ;
  wire \could_multi_bursts.araddr_buf_reg[28]_i_2_n_5 ;
  wire \could_multi_bursts.araddr_buf_reg[32]_i_2_n_2 ;
  wire \could_multi_bursts.araddr_buf_reg[32]_i_2_n_3 ;
  wire \could_multi_bursts.araddr_buf_reg[32]_i_2_n_4 ;
  wire \could_multi_bursts.araddr_buf_reg[32]_i_2_n_5 ;
  wire \could_multi_bursts.araddr_buf_reg[36]_i_2_n_2 ;
  wire \could_multi_bursts.araddr_buf_reg[36]_i_2_n_3 ;
  wire \could_multi_bursts.araddr_buf_reg[36]_i_2_n_4 ;
  wire \could_multi_bursts.araddr_buf_reg[36]_i_2_n_5 ;
  wire \could_multi_bursts.araddr_buf_reg[40]_i_2_n_2 ;
  wire \could_multi_bursts.araddr_buf_reg[40]_i_2_n_3 ;
  wire \could_multi_bursts.araddr_buf_reg[40]_i_2_n_4 ;
  wire \could_multi_bursts.araddr_buf_reg[40]_i_2_n_5 ;
  wire \could_multi_bursts.araddr_buf_reg[44]_i_2_n_2 ;
  wire \could_multi_bursts.araddr_buf_reg[44]_i_2_n_3 ;
  wire \could_multi_bursts.araddr_buf_reg[44]_i_2_n_4 ;
  wire \could_multi_bursts.araddr_buf_reg[44]_i_2_n_5 ;
  wire \could_multi_bursts.araddr_buf_reg[48]_i_2_n_2 ;
  wire \could_multi_bursts.araddr_buf_reg[48]_i_2_n_3 ;
  wire \could_multi_bursts.araddr_buf_reg[48]_i_2_n_4 ;
  wire \could_multi_bursts.araddr_buf_reg[48]_i_2_n_5 ;
  wire \could_multi_bursts.araddr_buf_reg[4]_i_2_n_2 ;
  wire \could_multi_bursts.araddr_buf_reg[4]_i_2_n_3 ;
  wire \could_multi_bursts.araddr_buf_reg[4]_i_2_n_4 ;
  wire \could_multi_bursts.araddr_buf_reg[4]_i_2_n_5 ;
  wire \could_multi_bursts.araddr_buf_reg[52]_i_2_n_2 ;
  wire \could_multi_bursts.araddr_buf_reg[52]_i_2_n_3 ;
  wire \could_multi_bursts.araddr_buf_reg[52]_i_2_n_4 ;
  wire \could_multi_bursts.araddr_buf_reg[52]_i_2_n_5 ;
  wire \could_multi_bursts.araddr_buf_reg[56]_i_2_n_2 ;
  wire \could_multi_bursts.araddr_buf_reg[56]_i_2_n_3 ;
  wire \could_multi_bursts.araddr_buf_reg[56]_i_2_n_4 ;
  wire \could_multi_bursts.araddr_buf_reg[56]_i_2_n_5 ;
  wire \could_multi_bursts.araddr_buf_reg[60]_i_2_n_2 ;
  wire \could_multi_bursts.araddr_buf_reg[60]_i_2_n_3 ;
  wire \could_multi_bursts.araddr_buf_reg[60]_i_2_n_4 ;
  wire \could_multi_bursts.araddr_buf_reg[60]_i_2_n_5 ;
  wire \could_multi_bursts.araddr_buf_reg[63]_i_3_n_4 ;
  wire \could_multi_bursts.araddr_buf_reg[63]_i_3_n_5 ;
  wire \could_multi_bursts.araddr_buf_reg[8]_i_2_n_2 ;
  wire \could_multi_bursts.araddr_buf_reg[8]_i_2_n_3 ;
  wire \could_multi_bursts.araddr_buf_reg[8]_i_2_n_4 ;
  wire \could_multi_bursts.araddr_buf_reg[8]_i_2_n_5 ;
  wire [3:0]\could_multi_bursts.loop_cnt_reg ;
  wire \could_multi_bursts.sect_handling_reg_n_2 ;
  wire [32:0]\data_p2_reg[32] ;
  wire [0:0]din;
  wire \end_addr[13]_i_2_n_2 ;
  wire \end_addr[13]_i_3_n_2 ;
  wire \end_addr[13]_i_4_n_2 ;
  wire \end_addr[13]_i_5_n_2 ;
  wire \end_addr[17]_i_2_n_2 ;
  wire \end_addr[17]_i_3_n_2 ;
  wire \end_addr[17]_i_4_n_2 ;
  wire \end_addr[17]_i_5_n_2 ;
  wire \end_addr[21]_i_2_n_2 ;
  wire \end_addr[21]_i_3_n_2 ;
  wire \end_addr[21]_i_4_n_2 ;
  wire \end_addr[21]_i_5_n_2 ;
  wire \end_addr[25]_i_2_n_2 ;
  wire \end_addr[25]_i_3_n_2 ;
  wire \end_addr[25]_i_4_n_2 ;
  wire \end_addr[25]_i_5_n_2 ;
  wire \end_addr[29]_i_2_n_2 ;
  wire \end_addr[29]_i_3_n_2 ;
  wire \end_addr[29]_i_4_n_2 ;
  wire \end_addr[29]_i_5_n_2 ;
  wire \end_addr[33]_i_2_n_2 ;
  wire \end_addr[33]_i_3_n_2 ;
  wire \end_addr[5]_i_2_n_2 ;
  wire \end_addr[5]_i_3_n_2 ;
  wire \end_addr[5]_i_4_n_2 ;
  wire \end_addr[5]_i_5_n_2 ;
  wire \end_addr[9]_i_2_n_2 ;
  wire \end_addr[9]_i_3_n_2 ;
  wire \end_addr[9]_i_4_n_2 ;
  wire \end_addr[9]_i_5_n_2 ;
  wire \end_addr_reg_n_2_[10] ;
  wire \end_addr_reg_n_2_[11] ;
  wire \end_addr_reg_n_2_[2] ;
  wire \end_addr_reg_n_2_[3] ;
  wire \end_addr_reg_n_2_[4] ;
  wire \end_addr_reg_n_2_[5] ;
  wire \end_addr_reg_n_2_[6] ;
  wire \end_addr_reg_n_2_[7] ;
  wire \end_addr_reg_n_2_[8] ;
  wire \end_addr_reg_n_2_[9] ;
  wire fifo_burst_n_3;
  wire fifo_burst_n_4;
  wire fifo_rctl_n_10;
  wire fifo_rctl_n_11;
  wire fifo_rctl_n_12;
  wire fifo_rctl_n_13;
  wire fifo_rctl_n_14;
  wire fifo_rctl_n_15;
  wire fifo_rctl_n_16;
  wire fifo_rctl_n_17;
  wire fifo_rctl_n_18;
  wire fifo_rctl_n_19;
  wire fifo_rctl_n_20;
  wire fifo_rctl_n_21;
  wire fifo_rctl_n_22;
  wire fifo_rctl_n_23;
  wire fifo_rctl_n_24;
  wire fifo_rctl_n_25;
  wire fifo_rctl_n_26;
  wire fifo_rctl_n_27;
  wire fifo_rctl_n_28;
  wire fifo_rctl_n_29;
  wire fifo_rctl_n_3;
  wire fifo_rctl_n_30;
  wire fifo_rctl_n_31;
  wire fifo_rctl_n_32;
  wire fifo_rctl_n_33;
  wire fifo_rctl_n_34;
  wire fifo_rctl_n_35;
  wire fifo_rctl_n_36;
  wire fifo_rctl_n_37;
  wire fifo_rctl_n_38;
  wire fifo_rctl_n_39;
  wire fifo_rctl_n_40;
  wire fifo_rctl_n_41;
  wire fifo_rctl_n_42;
  wire fifo_rctl_n_43;
  wire fifo_rctl_n_44;
  wire fifo_rctl_n_45;
  wire fifo_rctl_n_46;
  wire fifo_rctl_n_47;
  wire fifo_rctl_n_48;
  wire fifo_rctl_n_49;
  wire fifo_rctl_n_5;
  wire fifo_rctl_n_50;
  wire fifo_rctl_n_51;
  wire fifo_rctl_n_52;
  wire fifo_rctl_n_53;
  wire fifo_rctl_n_54;
  wire fifo_rctl_n_55;
  wire fifo_rctl_n_56;
  wire fifo_rctl_n_58;
  wire fifo_rctl_n_59;
  wire fifo_rctl_n_6;
  wire fifo_rctl_n_61;
  wire fifo_rctl_n_62;
  wire fifo_rctl_n_63;
  wire fifo_rctl_n_64;
  wire fifo_rctl_n_65;
  wire fifo_rctl_n_66;
  wire fifo_rctl_n_67;
  wire fifo_rctl_n_68;
  wire fifo_rctl_n_69;
  wire fifo_rctl_n_7;
  wire fifo_rctl_n_70;
  wire fifo_rctl_n_71;
  wire fifo_rctl_n_72;
  wire fifo_rctl_n_73;
  wire fifo_rctl_n_74;
  wire fifo_rctl_n_75;
  wire fifo_rctl_n_76;
  wire fifo_rctl_n_77;
  wire fifo_rctl_n_78;
  wire fifo_rctl_n_79;
  wire fifo_rctl_n_8;
  wire fifo_rctl_n_80;
  wire fifo_rctl_n_81;
  wire fifo_rctl_n_82;
  wire fifo_rctl_n_9;
  wire fifo_rctl_ready;
  wire first_sect;
  wire first_sect_carry__0_i_1_n_2;
  wire first_sect_carry__0_i_2_n_2;
  wire first_sect_carry__0_i_3_n_2;
  wire first_sect_carry__0_i_4_n_2;
  wire first_sect_carry__0_n_2;
  wire first_sect_carry__0_n_3;
  wire first_sect_carry__0_n_4;
  wire first_sect_carry__0_n_5;
  wire first_sect_carry__1_i_1_n_2;
  wire first_sect_carry__1_i_2_n_2;
  wire first_sect_carry__1_i_3_n_2;
  wire first_sect_carry__1_i_4_n_2;
  wire first_sect_carry__1_n_2;
  wire first_sect_carry__1_n_3;
  wire first_sect_carry__1_n_4;
  wire first_sect_carry__1_n_5;
  wire first_sect_carry__2_i_1_n_2;
  wire first_sect_carry__2_i_2_n_2;
  wire first_sect_carry__2_i_3_n_2;
  wire first_sect_carry__2_i_4_n_2;
  wire first_sect_carry__2_n_2;
  wire first_sect_carry__2_n_3;
  wire first_sect_carry__2_n_4;
  wire first_sect_carry__2_n_5;
  wire first_sect_carry__3_i_1_n_2;
  wire first_sect_carry__3_i_2_n_2;
  wire first_sect_carry__3_n_5;
  wire first_sect_carry_i_1_n_2;
  wire first_sect_carry_i_2_n_2;
  wire first_sect_carry_i_3_n_2;
  wire first_sect_carry_i_4_n_2;
  wire first_sect_carry_n_2;
  wire first_sect_carry_n_3;
  wire first_sect_carry_n_4;
  wire first_sect_carry_n_5;
  wire last_sect;
  wire last_sect_buf_reg_n_2;
  wire last_sect_carry__0_i_1_n_2;
  wire last_sect_carry__0_i_2_n_2;
  wire last_sect_carry__0_i_3_n_2;
  wire last_sect_carry__0_i_4_n_2;
  wire last_sect_carry__0_n_2;
  wire last_sect_carry__0_n_3;
  wire last_sect_carry__0_n_4;
  wire last_sect_carry__0_n_5;
  wire last_sect_carry__1_i_1_n_2;
  wire last_sect_carry__1_i_2_n_2;
  wire last_sect_carry__1_i_3_n_2;
  wire last_sect_carry__1_i_4_n_2;
  wire last_sect_carry__1_n_2;
  wire last_sect_carry__1_n_3;
  wire last_sect_carry__1_n_4;
  wire last_sect_carry__1_n_5;
  wire last_sect_carry__2_i_1_n_2;
  wire last_sect_carry__2_i_2_n_2;
  wire last_sect_carry__2_i_3_n_2;
  wire last_sect_carry__2_i_4_n_2;
  wire last_sect_carry__2_n_2;
  wire last_sect_carry__2_n_3;
  wire last_sect_carry__2_n_4;
  wire last_sect_carry__2_n_5;
  wire last_sect_carry__3_i_1_n_2;
  wire last_sect_carry__3_i_2_n_2;
  wire last_sect_carry__3_n_5;
  wire last_sect_carry_i_1_n_2;
  wire last_sect_carry_i_2_n_2;
  wire last_sect_carry_i_3_n_2;
  wire last_sect_carry_i_4_n_2;
  wire last_sect_carry_n_2;
  wire last_sect_carry_n_3;
  wire last_sect_carry_n_4;
  wire last_sect_carry_n_5;
  wire [61:0]m_axi_BUS0_ARADDR;
  wire [5:0]m_axi_BUS0_ARLEN;
  wire m_axi_BUS0_ARREADY;
  wire m_axi_BUS0_RVALID;
  wire next_rreq;
  wire [3:0]p_0_in;
  wire [51:0]p_0_in0_in;
  wire [51:0]p_0_in_0;
  wire p_13_in;
  wire p_14_in;
  wire [11:2]p_1_in;
  wire [63:2]p_1_out;
  wire rreq_handling_reg_n_2;
  wire rreq_valid;
  wire rs_rreq_n_10;
  wire rs_rreq_n_100;
  wire rs_rreq_n_101;
  wire rs_rreq_n_102;
  wire rs_rreq_n_103;
  wire rs_rreq_n_104;
  wire rs_rreq_n_105;
  wire rs_rreq_n_106;
  wire rs_rreq_n_107;
  wire rs_rreq_n_108;
  wire rs_rreq_n_109;
  wire rs_rreq_n_11;
  wire rs_rreq_n_110;
  wire rs_rreq_n_111;
  wire rs_rreq_n_112;
  wire rs_rreq_n_113;
  wire rs_rreq_n_114;
  wire rs_rreq_n_115;
  wire rs_rreq_n_116;
  wire rs_rreq_n_117;
  wire rs_rreq_n_118;
  wire rs_rreq_n_119;
  wire rs_rreq_n_12;
  wire rs_rreq_n_120;
  wire rs_rreq_n_121;
  wire rs_rreq_n_122;
  wire rs_rreq_n_123;
  wire rs_rreq_n_124;
  wire rs_rreq_n_125;
  wire rs_rreq_n_126;
  wire rs_rreq_n_127;
  wire rs_rreq_n_128;
  wire rs_rreq_n_129;
  wire rs_rreq_n_13;
  wire rs_rreq_n_130;
  wire rs_rreq_n_131;
  wire rs_rreq_n_132;
  wire rs_rreq_n_133;
  wire rs_rreq_n_134;
  wire rs_rreq_n_135;
  wire rs_rreq_n_136;
  wire rs_rreq_n_137;
  wire rs_rreq_n_138;
  wire rs_rreq_n_139;
  wire rs_rreq_n_14;
  wire rs_rreq_n_141;
  wire rs_rreq_n_142;
  wire rs_rreq_n_143;
  wire rs_rreq_n_144;
  wire rs_rreq_n_15;
  wire rs_rreq_n_16;
  wire rs_rreq_n_17;
  wire rs_rreq_n_18;
  wire rs_rreq_n_19;
  wire rs_rreq_n_20;
  wire rs_rreq_n_21;
  wire rs_rreq_n_22;
  wire rs_rreq_n_23;
  wire rs_rreq_n_24;
  wire rs_rreq_n_25;
  wire rs_rreq_n_26;
  wire rs_rreq_n_27;
  wire rs_rreq_n_28;
  wire rs_rreq_n_29;
  wire rs_rreq_n_3;
  wire rs_rreq_n_30;
  wire rs_rreq_n_31;
  wire rs_rreq_n_32;
  wire rs_rreq_n_33;
  wire rs_rreq_n_34;
  wire rs_rreq_n_35;
  wire rs_rreq_n_36;
  wire rs_rreq_n_37;
  wire rs_rreq_n_38;
  wire rs_rreq_n_39;
  wire rs_rreq_n_4;
  wire rs_rreq_n_40;
  wire rs_rreq_n_41;
  wire rs_rreq_n_42;
  wire rs_rreq_n_43;
  wire rs_rreq_n_44;
  wire rs_rreq_n_45;
  wire rs_rreq_n_46;
  wire rs_rreq_n_47;
  wire rs_rreq_n_48;
  wire rs_rreq_n_49;
  wire rs_rreq_n_5;
  wire rs_rreq_n_50;
  wire rs_rreq_n_51;
  wire rs_rreq_n_52;
  wire rs_rreq_n_53;
  wire rs_rreq_n_54;
  wire rs_rreq_n_55;
  wire rs_rreq_n_56;
  wire rs_rreq_n_57;
  wire rs_rreq_n_58;
  wire rs_rreq_n_59;
  wire rs_rreq_n_6;
  wire rs_rreq_n_60;
  wire rs_rreq_n_61;
  wire rs_rreq_n_62;
  wire rs_rreq_n_63;
  wire rs_rreq_n_64;
  wire rs_rreq_n_65;
  wire rs_rreq_n_66;
  wire rs_rreq_n_67;
  wire rs_rreq_n_7;
  wire rs_rreq_n_78;
  wire rs_rreq_n_79;
  wire rs_rreq_n_8;
  wire rs_rreq_n_80;
  wire rs_rreq_n_81;
  wire rs_rreq_n_82;
  wire rs_rreq_n_83;
  wire rs_rreq_n_84;
  wire rs_rreq_n_85;
  wire rs_rreq_n_86;
  wire rs_rreq_n_87;
  wire rs_rreq_n_88;
  wire rs_rreq_n_89;
  wire rs_rreq_n_9;
  wire rs_rreq_n_90;
  wire rs_rreq_n_91;
  wire rs_rreq_n_92;
  wire rs_rreq_n_93;
  wire rs_rreq_n_94;
  wire rs_rreq_n_95;
  wire rs_rreq_n_96;
  wire rs_rreq_n_97;
  wire rs_rreq_n_98;
  wire rs_rreq_n_99;
  wire s_ready_t_reg;
  wire [63:2]sect_addr;
  wire \sect_addr_buf_reg_n_2_[10] ;
  wire \sect_addr_buf_reg_n_2_[11] ;
  wire \sect_addr_buf_reg_n_2_[12] ;
  wire \sect_addr_buf_reg_n_2_[13] ;
  wire \sect_addr_buf_reg_n_2_[14] ;
  wire \sect_addr_buf_reg_n_2_[15] ;
  wire \sect_addr_buf_reg_n_2_[16] ;
  wire \sect_addr_buf_reg_n_2_[17] ;
  wire \sect_addr_buf_reg_n_2_[18] ;
  wire \sect_addr_buf_reg_n_2_[19] ;
  wire \sect_addr_buf_reg_n_2_[20] ;
  wire \sect_addr_buf_reg_n_2_[21] ;
  wire \sect_addr_buf_reg_n_2_[22] ;
  wire \sect_addr_buf_reg_n_2_[23] ;
  wire \sect_addr_buf_reg_n_2_[24] ;
  wire \sect_addr_buf_reg_n_2_[25] ;
  wire \sect_addr_buf_reg_n_2_[26] ;
  wire \sect_addr_buf_reg_n_2_[27] ;
  wire \sect_addr_buf_reg_n_2_[28] ;
  wire \sect_addr_buf_reg_n_2_[29] ;
  wire \sect_addr_buf_reg_n_2_[2] ;
  wire \sect_addr_buf_reg_n_2_[30] ;
  wire \sect_addr_buf_reg_n_2_[31] ;
  wire \sect_addr_buf_reg_n_2_[32] ;
  wire \sect_addr_buf_reg_n_2_[33] ;
  wire \sect_addr_buf_reg_n_2_[34] ;
  wire \sect_addr_buf_reg_n_2_[35] ;
  wire \sect_addr_buf_reg_n_2_[36] ;
  wire \sect_addr_buf_reg_n_2_[37] ;
  wire \sect_addr_buf_reg_n_2_[38] ;
  wire \sect_addr_buf_reg_n_2_[39] ;
  wire \sect_addr_buf_reg_n_2_[3] ;
  wire \sect_addr_buf_reg_n_2_[40] ;
  wire \sect_addr_buf_reg_n_2_[41] ;
  wire \sect_addr_buf_reg_n_2_[42] ;
  wire \sect_addr_buf_reg_n_2_[43] ;
  wire \sect_addr_buf_reg_n_2_[44] ;
  wire \sect_addr_buf_reg_n_2_[45] ;
  wire \sect_addr_buf_reg_n_2_[46] ;
  wire \sect_addr_buf_reg_n_2_[47] ;
  wire \sect_addr_buf_reg_n_2_[48] ;
  wire \sect_addr_buf_reg_n_2_[49] ;
  wire \sect_addr_buf_reg_n_2_[4] ;
  wire \sect_addr_buf_reg_n_2_[50] ;
  wire \sect_addr_buf_reg_n_2_[51] ;
  wire \sect_addr_buf_reg_n_2_[52] ;
  wire \sect_addr_buf_reg_n_2_[53] ;
  wire \sect_addr_buf_reg_n_2_[54] ;
  wire \sect_addr_buf_reg_n_2_[55] ;
  wire \sect_addr_buf_reg_n_2_[56] ;
  wire \sect_addr_buf_reg_n_2_[57] ;
  wire \sect_addr_buf_reg_n_2_[58] ;
  wire \sect_addr_buf_reg_n_2_[59] ;
  wire \sect_addr_buf_reg_n_2_[5] ;
  wire \sect_addr_buf_reg_n_2_[60] ;
  wire \sect_addr_buf_reg_n_2_[61] ;
  wire \sect_addr_buf_reg_n_2_[62] ;
  wire \sect_addr_buf_reg_n_2_[63] ;
  wire \sect_addr_buf_reg_n_2_[6] ;
  wire \sect_addr_buf_reg_n_2_[7] ;
  wire \sect_addr_buf_reg_n_2_[8] ;
  wire \sect_addr_buf_reg_n_2_[9] ;
  wire [51:1]sect_cnt0;
  wire sect_cnt0_carry__0_n_2;
  wire sect_cnt0_carry__0_n_3;
  wire sect_cnt0_carry__0_n_4;
  wire sect_cnt0_carry__0_n_5;
  wire sect_cnt0_carry__10_n_2;
  wire sect_cnt0_carry__10_n_3;
  wire sect_cnt0_carry__10_n_4;
  wire sect_cnt0_carry__10_n_5;
  wire sect_cnt0_carry__11_n_4;
  wire sect_cnt0_carry__11_n_5;
  wire sect_cnt0_carry__1_n_2;
  wire sect_cnt0_carry__1_n_3;
  wire sect_cnt0_carry__1_n_4;
  wire sect_cnt0_carry__1_n_5;
  wire sect_cnt0_carry__2_n_2;
  wire sect_cnt0_carry__2_n_3;
  wire sect_cnt0_carry__2_n_4;
  wire sect_cnt0_carry__2_n_5;
  wire sect_cnt0_carry__3_n_2;
  wire sect_cnt0_carry__3_n_3;
  wire sect_cnt0_carry__3_n_4;
  wire sect_cnt0_carry__3_n_5;
  wire sect_cnt0_carry__4_n_2;
  wire sect_cnt0_carry__4_n_3;
  wire sect_cnt0_carry__4_n_4;
  wire sect_cnt0_carry__4_n_5;
  wire sect_cnt0_carry__5_n_2;
  wire sect_cnt0_carry__5_n_3;
  wire sect_cnt0_carry__5_n_4;
  wire sect_cnt0_carry__5_n_5;
  wire sect_cnt0_carry__6_n_2;
  wire sect_cnt0_carry__6_n_3;
  wire sect_cnt0_carry__6_n_4;
  wire sect_cnt0_carry__6_n_5;
  wire sect_cnt0_carry__7_n_2;
  wire sect_cnt0_carry__7_n_3;
  wire sect_cnt0_carry__7_n_4;
  wire sect_cnt0_carry__7_n_5;
  wire sect_cnt0_carry__8_n_2;
  wire sect_cnt0_carry__8_n_3;
  wire sect_cnt0_carry__8_n_4;
  wire sect_cnt0_carry__8_n_5;
  wire sect_cnt0_carry__9_n_2;
  wire sect_cnt0_carry__9_n_3;
  wire sect_cnt0_carry__9_n_4;
  wire sect_cnt0_carry__9_n_5;
  wire sect_cnt0_carry_n_2;
  wire sect_cnt0_carry_n_3;
  wire sect_cnt0_carry_n_4;
  wire sect_cnt0_carry_n_5;
  wire \sect_cnt_reg_n_2_[0] ;
  wire \sect_cnt_reg_n_2_[10] ;
  wire \sect_cnt_reg_n_2_[11] ;
  wire \sect_cnt_reg_n_2_[12] ;
  wire \sect_cnt_reg_n_2_[13] ;
  wire \sect_cnt_reg_n_2_[14] ;
  wire \sect_cnt_reg_n_2_[15] ;
  wire \sect_cnt_reg_n_2_[16] ;
  wire \sect_cnt_reg_n_2_[17] ;
  wire \sect_cnt_reg_n_2_[18] ;
  wire \sect_cnt_reg_n_2_[19] ;
  wire \sect_cnt_reg_n_2_[1] ;
  wire \sect_cnt_reg_n_2_[20] ;
  wire \sect_cnt_reg_n_2_[21] ;
  wire \sect_cnt_reg_n_2_[22] ;
  wire \sect_cnt_reg_n_2_[23] ;
  wire \sect_cnt_reg_n_2_[24] ;
  wire \sect_cnt_reg_n_2_[25] ;
  wire \sect_cnt_reg_n_2_[26] ;
  wire \sect_cnt_reg_n_2_[27] ;
  wire \sect_cnt_reg_n_2_[28] ;
  wire \sect_cnt_reg_n_2_[29] ;
  wire \sect_cnt_reg_n_2_[2] ;
  wire \sect_cnt_reg_n_2_[30] ;
  wire \sect_cnt_reg_n_2_[31] ;
  wire \sect_cnt_reg_n_2_[32] ;
  wire \sect_cnt_reg_n_2_[33] ;
  wire \sect_cnt_reg_n_2_[34] ;
  wire \sect_cnt_reg_n_2_[35] ;
  wire \sect_cnt_reg_n_2_[36] ;
  wire \sect_cnt_reg_n_2_[37] ;
  wire \sect_cnt_reg_n_2_[38] ;
  wire \sect_cnt_reg_n_2_[39] ;
  wire \sect_cnt_reg_n_2_[3] ;
  wire \sect_cnt_reg_n_2_[40] ;
  wire \sect_cnt_reg_n_2_[41] ;
  wire \sect_cnt_reg_n_2_[42] ;
  wire \sect_cnt_reg_n_2_[43] ;
  wire \sect_cnt_reg_n_2_[44] ;
  wire \sect_cnt_reg_n_2_[45] ;
  wire \sect_cnt_reg_n_2_[46] ;
  wire \sect_cnt_reg_n_2_[47] ;
  wire \sect_cnt_reg_n_2_[48] ;
  wire \sect_cnt_reg_n_2_[49] ;
  wire \sect_cnt_reg_n_2_[4] ;
  wire \sect_cnt_reg_n_2_[50] ;
  wire \sect_cnt_reg_n_2_[51] ;
  wire \sect_cnt_reg_n_2_[5] ;
  wire \sect_cnt_reg_n_2_[6] ;
  wire \sect_cnt_reg_n_2_[7] ;
  wire \sect_cnt_reg_n_2_[8] ;
  wire \sect_cnt_reg_n_2_[9] ;
  wire \sect_len_buf_reg_n_2_[0] ;
  wire \sect_len_buf_reg_n_2_[1] ;
  wire \sect_len_buf_reg_n_2_[2] ;
  wire \sect_len_buf_reg_n_2_[3] ;
  wire \sect_len_buf_reg_n_2_[4] ;
  wire \sect_len_buf_reg_n_2_[5] ;
  wire \sect_len_buf_reg_n_2_[6] ;
  wire \sect_len_buf_reg_n_2_[7] ;
  wire \sect_len_buf_reg_n_2_[8] ;
  wire \sect_len_buf_reg_n_2_[9] ;
  wire \start_addr_reg_n_2_[10] ;
  wire \start_addr_reg_n_2_[11] ;
  wire \start_addr_reg_n_2_[2] ;
  wire \start_addr_reg_n_2_[3] ;
  wire \start_addr_reg_n_2_[4] ;
  wire \start_addr_reg_n_2_[5] ;
  wire \start_addr_reg_n_2_[6] ;
  wire \start_addr_reg_n_2_[7] ;
  wire \start_addr_reg_n_2_[8] ;
  wire \start_addr_reg_n_2_[9] ;
  wire [0:0]\state_reg[0] ;
  wire we;
  wire [0:0]\NLW_could_multi_bursts.araddr_buf_reg[4]_i_2_O_UNCONNECTED ;
  wire [3:2]\NLW_could_multi_bursts.araddr_buf_reg[63]_i_3_CO_UNCONNECTED ;
  wire [3:3]\NLW_could_multi_bursts.araddr_buf_reg[63]_i_3_O_UNCONNECTED ;
  wire [3:0]NLW_first_sect_carry_O_UNCONNECTED;
  wire [3:0]NLW_first_sect_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_first_sect_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_first_sect_carry__2_O_UNCONNECTED;
  wire [3:2]NLW_first_sect_carry__3_CO_UNCONNECTED;
  wire [3:0]NLW_first_sect_carry__3_O_UNCONNECTED;
  wire [3:0]NLW_last_sect_carry_O_UNCONNECTED;
  wire [3:0]NLW_last_sect_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_last_sect_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_last_sect_carry__2_O_UNCONNECTED;
  wire [3:2]NLW_last_sect_carry__3_CO_UNCONNECTED;
  wire [3:0]NLW_last_sect_carry__3_O_UNCONNECTED;
  wire [3:2]NLW_sect_cnt0_carry__11_CO_UNCONNECTED;
  wire [3:3]NLW_sect_cnt0_carry__11_O_UNCONNECTED;

  FDRE \beat_len_reg[0] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(p_1_in[2]),
        .Q(beat_len[0]),
        .R(SR));
  FDRE \beat_len_reg[1] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(p_1_in[3]),
        .Q(beat_len[1]),
        .R(SR));
  FDRE \beat_len_reg[2] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(p_1_in[4]),
        .Q(beat_len[2]),
        .R(SR));
  FDRE \beat_len_reg[3] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(p_1_in[5]),
        .Q(beat_len[3]),
        .R(SR));
  FDRE \beat_len_reg[4] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(p_1_in[6]),
        .Q(beat_len[4]),
        .R(SR));
  FDRE \beat_len_reg[5] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(p_1_in[7]),
        .Q(beat_len[5]),
        .R(SR));
  FDRE \beat_len_reg[6] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(p_1_in[8]),
        .Q(beat_len[6]),
        .R(SR));
  FDRE \beat_len_reg[7] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(p_1_in[9]),
        .Q(beat_len[7]),
        .R(SR));
  FDRE \beat_len_reg[8] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(p_1_in[10]),
        .Q(beat_len[8]),
        .R(SR));
  FDRE \beat_len_reg[9] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(p_1_in[11]),
        .Q(beat_len[9]),
        .R(SR));
  FDRE \could_multi_bursts.ARVALID_Dummy_reg 
       (.C(ap_clk),
        .CE(1'b1),
        .D(fifo_rctl_n_62),
        .Q(\could_multi_bursts.ARVALID_Dummy_reg_0 ),
        .R(SR));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[10]_i_1 
       (.I0(araddr_tmp0[10]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[10] ),
        .O(p_1_out[10]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[11]_i_1 
       (.I0(araddr_tmp0[11]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[11] ),
        .O(p_1_out[11]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[12]_i_1 
       (.I0(araddr_tmp0[12]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[12] ),
        .O(p_1_out[12]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[13]_i_1 
       (.I0(araddr_tmp0[13]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[13] ),
        .O(p_1_out[13]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[14]_i_1 
       (.I0(araddr_tmp0[14]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[14] ),
        .O(p_1_out[14]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[15]_i_1 
       (.I0(araddr_tmp0[15]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[15] ),
        .O(p_1_out[15]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[16]_i_1 
       (.I0(araddr_tmp0[16]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[16] ),
        .O(p_1_out[16]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[17]_i_1 
       (.I0(araddr_tmp0[17]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[17] ),
        .O(p_1_out[17]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[18]_i_1 
       (.I0(araddr_tmp0[18]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[18] ),
        .O(p_1_out[18]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[19]_i_1 
       (.I0(araddr_tmp0[19]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[19] ),
        .O(p_1_out[19]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[20]_i_1 
       (.I0(araddr_tmp0[20]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[20] ),
        .O(p_1_out[20]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[21]_i_1 
       (.I0(araddr_tmp0[21]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[21] ),
        .O(p_1_out[21]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[22]_i_1 
       (.I0(araddr_tmp0[22]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[22] ),
        .O(p_1_out[22]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[23]_i_1 
       (.I0(araddr_tmp0[23]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[23] ),
        .O(p_1_out[23]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[24]_i_1 
       (.I0(araddr_tmp0[24]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[24] ),
        .O(p_1_out[24]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[25]_i_1 
       (.I0(araddr_tmp0[25]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[25] ),
        .O(p_1_out[25]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[26]_i_1 
       (.I0(araddr_tmp0[26]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[26] ),
        .O(p_1_out[26]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[27]_i_1 
       (.I0(araddr_tmp0[27]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[27] ),
        .O(p_1_out[27]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[28]_i_1 
       (.I0(araddr_tmp0[28]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[28] ),
        .O(p_1_out[28]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[29]_i_1 
       (.I0(araddr_tmp0[29]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[29] ),
        .O(p_1_out[29]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[2]_i_1 
       (.I0(araddr_tmp0[2]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[2] ),
        .O(p_1_out[2]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[30]_i_1 
       (.I0(araddr_tmp0[30]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[30] ),
        .O(p_1_out[30]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[31]_i_1 
       (.I0(araddr_tmp0[31]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[31] ),
        .O(p_1_out[31]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[32]_i_1 
       (.I0(araddr_tmp0[32]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[32] ),
        .O(p_1_out[32]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[33]_i_1 
       (.I0(araddr_tmp0[33]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[33] ),
        .O(p_1_out[33]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[34]_i_1 
       (.I0(araddr_tmp0[34]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[34] ),
        .O(p_1_out[34]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[35]_i_1 
       (.I0(araddr_tmp0[35]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[35] ),
        .O(p_1_out[35]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[36]_i_1 
       (.I0(araddr_tmp0[36]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[36] ),
        .O(p_1_out[36]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[37]_i_1 
       (.I0(araddr_tmp0[37]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[37] ),
        .O(p_1_out[37]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[38]_i_1 
       (.I0(araddr_tmp0[38]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[38] ),
        .O(p_1_out[38]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[39]_i_1 
       (.I0(araddr_tmp0[39]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[39] ),
        .O(p_1_out[39]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[3]_i_1 
       (.I0(araddr_tmp0[3]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[3] ),
        .O(p_1_out[3]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[40]_i_1 
       (.I0(araddr_tmp0[40]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[40] ),
        .O(p_1_out[40]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[41]_i_1 
       (.I0(araddr_tmp0[41]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[41] ),
        .O(p_1_out[41]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[42]_i_1 
       (.I0(araddr_tmp0[42]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[42] ),
        .O(p_1_out[42]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[43]_i_1 
       (.I0(araddr_tmp0[43]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[43] ),
        .O(p_1_out[43]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[44]_i_1 
       (.I0(araddr_tmp0[44]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[44] ),
        .O(p_1_out[44]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[45]_i_1 
       (.I0(araddr_tmp0[45]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[45] ),
        .O(p_1_out[45]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[46]_i_1 
       (.I0(araddr_tmp0[46]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[46] ),
        .O(p_1_out[46]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[47]_i_1 
       (.I0(araddr_tmp0[47]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[47] ),
        .O(p_1_out[47]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[48]_i_1 
       (.I0(araddr_tmp0[48]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[48] ),
        .O(p_1_out[48]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[49]_i_1 
       (.I0(araddr_tmp0[49]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[49] ),
        .O(p_1_out[49]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[4]_i_1 
       (.I0(araddr_tmp0[4]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[4] ),
        .O(p_1_out[4]));
  LUT4 #(
    .INIT(16'h956A)) 
    \could_multi_bursts.araddr_buf[4]_i_3 
       (.I0(m_axi_BUS0_ARADDR[2]),
        .I1(m_axi_BUS0_ARLEN[1]),
        .I2(m_axi_BUS0_ARLEN[0]),
        .I3(m_axi_BUS0_ARLEN[2]),
        .O(\could_multi_bursts.araddr_buf[4]_i_3_n_2 ));
  LUT3 #(
    .INIT(8'h96)) 
    \could_multi_bursts.araddr_buf[4]_i_4 
       (.I0(m_axi_BUS0_ARADDR[1]),
        .I1(m_axi_BUS0_ARLEN[0]),
        .I2(m_axi_BUS0_ARLEN[1]),
        .O(\could_multi_bursts.araddr_buf[4]_i_4_n_2 ));
  LUT2 #(
    .INIT(4'h9)) 
    \could_multi_bursts.araddr_buf[4]_i_5 
       (.I0(m_axi_BUS0_ARADDR[0]),
        .I1(m_axi_BUS0_ARLEN[0]),
        .O(\could_multi_bursts.araddr_buf[4]_i_5_n_2 ));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[50]_i_1 
       (.I0(araddr_tmp0[50]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[50] ),
        .O(p_1_out[50]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[51]_i_1 
       (.I0(araddr_tmp0[51]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[51] ),
        .O(p_1_out[51]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[52]_i_1 
       (.I0(araddr_tmp0[52]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[52] ),
        .O(p_1_out[52]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[53]_i_1 
       (.I0(araddr_tmp0[53]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[53] ),
        .O(p_1_out[53]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[54]_i_1 
       (.I0(araddr_tmp0[54]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[54] ),
        .O(p_1_out[54]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[55]_i_1 
       (.I0(araddr_tmp0[55]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[55] ),
        .O(p_1_out[55]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[56]_i_1 
       (.I0(araddr_tmp0[56]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[56] ),
        .O(p_1_out[56]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[57]_i_1 
       (.I0(araddr_tmp0[57]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[57] ),
        .O(p_1_out[57]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[58]_i_1 
       (.I0(araddr_tmp0[58]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[58] ),
        .O(p_1_out[58]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[59]_i_1 
       (.I0(araddr_tmp0[59]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[59] ),
        .O(p_1_out[59]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[5]_i_1 
       (.I0(araddr_tmp0[5]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[5] ),
        .O(p_1_out[5]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[60]_i_1 
       (.I0(araddr_tmp0[60]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[60] ),
        .O(p_1_out[60]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[61]_i_1 
       (.I0(araddr_tmp0[61]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[61] ),
        .O(p_1_out[61]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[62]_i_1 
       (.I0(araddr_tmp0[62]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[62] ),
        .O(p_1_out[62]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[63]_i_2 
       (.I0(araddr_tmp0[63]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[63] ),
        .O(p_1_out[63]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[6]_i_1 
       (.I0(araddr_tmp0[6]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[6] ),
        .O(p_1_out[6]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[7]_i_1 
       (.I0(araddr_tmp0[7]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[7] ),
        .O(p_1_out[7]));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[8]_i_1 
       (.I0(araddr_tmp0[8]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[8] ),
        .O(p_1_out[8]));
  LUT3 #(
    .INIT(8'h6A)) 
    \could_multi_bursts.araddr_buf[8]_i_3 
       (.I0(m_axi_BUS0_ARADDR[6]),
        .I1(\could_multi_bursts.araddr_buf[8]_i_7_n_2 ),
        .I2(m_axi_BUS0_ARLEN[5]),
        .O(\could_multi_bursts.araddr_buf[8]_i_3_n_2 ));
  LUT3 #(
    .INIT(8'h96)) 
    \could_multi_bursts.araddr_buf[8]_i_4 
       (.I0(m_axi_BUS0_ARADDR[5]),
        .I1(\could_multi_bursts.araddr_buf[8]_i_7_n_2 ),
        .I2(m_axi_BUS0_ARLEN[5]),
        .O(\could_multi_bursts.araddr_buf[8]_i_4_n_2 ));
  LUT6 #(
    .INIT(64'h955555556AAAAAAA)) 
    \could_multi_bursts.araddr_buf[8]_i_5 
       (.I0(m_axi_BUS0_ARADDR[4]),
        .I1(m_axi_BUS0_ARLEN[3]),
        .I2(m_axi_BUS0_ARLEN[1]),
        .I3(m_axi_BUS0_ARLEN[0]),
        .I4(m_axi_BUS0_ARLEN[2]),
        .I5(m_axi_BUS0_ARLEN[4]),
        .O(\could_multi_bursts.araddr_buf[8]_i_5_n_2 ));
  LUT5 #(
    .INIT(32'h95556AAA)) 
    \could_multi_bursts.araddr_buf[8]_i_6 
       (.I0(m_axi_BUS0_ARADDR[3]),
        .I1(m_axi_BUS0_ARLEN[2]),
        .I2(m_axi_BUS0_ARLEN[0]),
        .I3(m_axi_BUS0_ARLEN[1]),
        .I4(m_axi_BUS0_ARLEN[3]),
        .O(\could_multi_bursts.araddr_buf[8]_i_6_n_2 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \could_multi_bursts.araddr_buf[8]_i_7 
       (.I0(m_axi_BUS0_ARLEN[4]),
        .I1(m_axi_BUS0_ARLEN[2]),
        .I2(m_axi_BUS0_ARLEN[0]),
        .I3(m_axi_BUS0_ARLEN[1]),
        .I4(m_axi_BUS0_ARLEN[3]),
        .O(\could_multi_bursts.araddr_buf[8]_i_7_n_2 ));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAA8)) 
    \could_multi_bursts.araddr_buf[9]_i_1 
       (.I0(araddr_tmp0[9]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .I3(\could_multi_bursts.loop_cnt_reg [3]),
        .I4(\could_multi_bursts.loop_cnt_reg [2]),
        .I5(\sect_addr_buf_reg_n_2_[9] ),
        .O(p_1_out[9]));
  FDRE \could_multi_bursts.araddr_buf_reg[10] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[10]),
        .Q(m_axi_BUS0_ARADDR[8]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[11] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[11]),
        .Q(m_axi_BUS0_ARADDR[9]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[12] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[12]),
        .Q(m_axi_BUS0_ARADDR[10]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \could_multi_bursts.araddr_buf_reg[12]_i_2 
       (.CI(\could_multi_bursts.araddr_buf_reg[8]_i_2_n_2 ),
        .CO({\could_multi_bursts.araddr_buf_reg[12]_i_2_n_2 ,\could_multi_bursts.araddr_buf_reg[12]_i_2_n_3 ,\could_multi_bursts.araddr_buf_reg[12]_i_2_n_4 ,\could_multi_bursts.araddr_buf_reg[12]_i_2_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,m_axi_BUS0_ARADDR[8:7]}),
        .O(araddr_tmp0[12:9]),
        .S(m_axi_BUS0_ARADDR[10:7]));
  FDRE \could_multi_bursts.araddr_buf_reg[13] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[13]),
        .Q(m_axi_BUS0_ARADDR[11]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[14] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[14]),
        .Q(m_axi_BUS0_ARADDR[12]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[15] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[15]),
        .Q(m_axi_BUS0_ARADDR[13]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[16] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[16]),
        .Q(m_axi_BUS0_ARADDR[14]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \could_multi_bursts.araddr_buf_reg[16]_i_2 
       (.CI(\could_multi_bursts.araddr_buf_reg[12]_i_2_n_2 ),
        .CO({\could_multi_bursts.araddr_buf_reg[16]_i_2_n_2 ,\could_multi_bursts.araddr_buf_reg[16]_i_2_n_3 ,\could_multi_bursts.araddr_buf_reg[16]_i_2_n_4 ,\could_multi_bursts.araddr_buf_reg[16]_i_2_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(araddr_tmp0[16:13]),
        .S(m_axi_BUS0_ARADDR[14:11]));
  FDRE \could_multi_bursts.araddr_buf_reg[17] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[17]),
        .Q(m_axi_BUS0_ARADDR[15]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[18] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[18]),
        .Q(m_axi_BUS0_ARADDR[16]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[19] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[19]),
        .Q(m_axi_BUS0_ARADDR[17]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[20] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[20]),
        .Q(m_axi_BUS0_ARADDR[18]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \could_multi_bursts.araddr_buf_reg[20]_i_2 
       (.CI(\could_multi_bursts.araddr_buf_reg[16]_i_2_n_2 ),
        .CO({\could_multi_bursts.araddr_buf_reg[20]_i_2_n_2 ,\could_multi_bursts.araddr_buf_reg[20]_i_2_n_3 ,\could_multi_bursts.araddr_buf_reg[20]_i_2_n_4 ,\could_multi_bursts.araddr_buf_reg[20]_i_2_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(araddr_tmp0[20:17]),
        .S(m_axi_BUS0_ARADDR[18:15]));
  FDRE \could_multi_bursts.araddr_buf_reg[21] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[21]),
        .Q(m_axi_BUS0_ARADDR[19]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[22] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[22]),
        .Q(m_axi_BUS0_ARADDR[20]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[23] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[23]),
        .Q(m_axi_BUS0_ARADDR[21]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[24] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[24]),
        .Q(m_axi_BUS0_ARADDR[22]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \could_multi_bursts.araddr_buf_reg[24]_i_2 
       (.CI(\could_multi_bursts.araddr_buf_reg[20]_i_2_n_2 ),
        .CO({\could_multi_bursts.araddr_buf_reg[24]_i_2_n_2 ,\could_multi_bursts.araddr_buf_reg[24]_i_2_n_3 ,\could_multi_bursts.araddr_buf_reg[24]_i_2_n_4 ,\could_multi_bursts.araddr_buf_reg[24]_i_2_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(araddr_tmp0[24:21]),
        .S(m_axi_BUS0_ARADDR[22:19]));
  FDRE \could_multi_bursts.araddr_buf_reg[25] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[25]),
        .Q(m_axi_BUS0_ARADDR[23]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[26] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[26]),
        .Q(m_axi_BUS0_ARADDR[24]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[27] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[27]),
        .Q(m_axi_BUS0_ARADDR[25]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[28] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[28]),
        .Q(m_axi_BUS0_ARADDR[26]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \could_multi_bursts.araddr_buf_reg[28]_i_2 
       (.CI(\could_multi_bursts.araddr_buf_reg[24]_i_2_n_2 ),
        .CO({\could_multi_bursts.araddr_buf_reg[28]_i_2_n_2 ,\could_multi_bursts.araddr_buf_reg[28]_i_2_n_3 ,\could_multi_bursts.araddr_buf_reg[28]_i_2_n_4 ,\could_multi_bursts.araddr_buf_reg[28]_i_2_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(araddr_tmp0[28:25]),
        .S(m_axi_BUS0_ARADDR[26:23]));
  FDRE \could_multi_bursts.araddr_buf_reg[29] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[29]),
        .Q(m_axi_BUS0_ARADDR[27]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[2] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[2]),
        .Q(m_axi_BUS0_ARADDR[0]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[30] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[30]),
        .Q(m_axi_BUS0_ARADDR[28]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[31] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[31]),
        .Q(m_axi_BUS0_ARADDR[29]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[32] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[32]),
        .Q(m_axi_BUS0_ARADDR[30]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \could_multi_bursts.araddr_buf_reg[32]_i_2 
       (.CI(\could_multi_bursts.araddr_buf_reg[28]_i_2_n_2 ),
        .CO({\could_multi_bursts.araddr_buf_reg[32]_i_2_n_2 ,\could_multi_bursts.araddr_buf_reg[32]_i_2_n_3 ,\could_multi_bursts.araddr_buf_reg[32]_i_2_n_4 ,\could_multi_bursts.araddr_buf_reg[32]_i_2_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(araddr_tmp0[32:29]),
        .S(m_axi_BUS0_ARADDR[30:27]));
  FDRE \could_multi_bursts.araddr_buf_reg[33] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[33]),
        .Q(m_axi_BUS0_ARADDR[31]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[34] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[34]),
        .Q(m_axi_BUS0_ARADDR[32]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[35] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[35]),
        .Q(m_axi_BUS0_ARADDR[33]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[36] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[36]),
        .Q(m_axi_BUS0_ARADDR[34]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \could_multi_bursts.araddr_buf_reg[36]_i_2 
       (.CI(\could_multi_bursts.araddr_buf_reg[32]_i_2_n_2 ),
        .CO({\could_multi_bursts.araddr_buf_reg[36]_i_2_n_2 ,\could_multi_bursts.araddr_buf_reg[36]_i_2_n_3 ,\could_multi_bursts.araddr_buf_reg[36]_i_2_n_4 ,\could_multi_bursts.araddr_buf_reg[36]_i_2_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(araddr_tmp0[36:33]),
        .S(m_axi_BUS0_ARADDR[34:31]));
  FDRE \could_multi_bursts.araddr_buf_reg[37] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[37]),
        .Q(m_axi_BUS0_ARADDR[35]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[38] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[38]),
        .Q(m_axi_BUS0_ARADDR[36]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[39] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[39]),
        .Q(m_axi_BUS0_ARADDR[37]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[3] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[3]),
        .Q(m_axi_BUS0_ARADDR[1]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[40] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[40]),
        .Q(m_axi_BUS0_ARADDR[38]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \could_multi_bursts.araddr_buf_reg[40]_i_2 
       (.CI(\could_multi_bursts.araddr_buf_reg[36]_i_2_n_2 ),
        .CO({\could_multi_bursts.araddr_buf_reg[40]_i_2_n_2 ,\could_multi_bursts.araddr_buf_reg[40]_i_2_n_3 ,\could_multi_bursts.araddr_buf_reg[40]_i_2_n_4 ,\could_multi_bursts.araddr_buf_reg[40]_i_2_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(araddr_tmp0[40:37]),
        .S(m_axi_BUS0_ARADDR[38:35]));
  FDRE \could_multi_bursts.araddr_buf_reg[41] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[41]),
        .Q(m_axi_BUS0_ARADDR[39]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[42] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[42]),
        .Q(m_axi_BUS0_ARADDR[40]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[43] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[43]),
        .Q(m_axi_BUS0_ARADDR[41]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[44] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[44]),
        .Q(m_axi_BUS0_ARADDR[42]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \could_multi_bursts.araddr_buf_reg[44]_i_2 
       (.CI(\could_multi_bursts.araddr_buf_reg[40]_i_2_n_2 ),
        .CO({\could_multi_bursts.araddr_buf_reg[44]_i_2_n_2 ,\could_multi_bursts.araddr_buf_reg[44]_i_2_n_3 ,\could_multi_bursts.araddr_buf_reg[44]_i_2_n_4 ,\could_multi_bursts.araddr_buf_reg[44]_i_2_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(araddr_tmp0[44:41]),
        .S(m_axi_BUS0_ARADDR[42:39]));
  FDRE \could_multi_bursts.araddr_buf_reg[45] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[45]),
        .Q(m_axi_BUS0_ARADDR[43]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[46] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[46]),
        .Q(m_axi_BUS0_ARADDR[44]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[47] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[47]),
        .Q(m_axi_BUS0_ARADDR[45]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[48] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[48]),
        .Q(m_axi_BUS0_ARADDR[46]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \could_multi_bursts.araddr_buf_reg[48]_i_2 
       (.CI(\could_multi_bursts.araddr_buf_reg[44]_i_2_n_2 ),
        .CO({\could_multi_bursts.araddr_buf_reg[48]_i_2_n_2 ,\could_multi_bursts.araddr_buf_reg[48]_i_2_n_3 ,\could_multi_bursts.araddr_buf_reg[48]_i_2_n_4 ,\could_multi_bursts.araddr_buf_reg[48]_i_2_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(araddr_tmp0[48:45]),
        .S(m_axi_BUS0_ARADDR[46:43]));
  FDRE \could_multi_bursts.araddr_buf_reg[49] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[49]),
        .Q(m_axi_BUS0_ARADDR[47]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[4] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[4]),
        .Q(m_axi_BUS0_ARADDR[2]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \could_multi_bursts.araddr_buf_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\could_multi_bursts.araddr_buf_reg[4]_i_2_n_2 ,\could_multi_bursts.araddr_buf_reg[4]_i_2_n_3 ,\could_multi_bursts.araddr_buf_reg[4]_i_2_n_4 ,\could_multi_bursts.araddr_buf_reg[4]_i_2_n_5 }),
        .CYINIT(1'b0),
        .DI({m_axi_BUS0_ARADDR[2:0],1'b0}),
        .O({araddr_tmp0[4:2],\NLW_could_multi_bursts.araddr_buf_reg[4]_i_2_O_UNCONNECTED [0]}),
        .S({\could_multi_bursts.araddr_buf[4]_i_3_n_2 ,\could_multi_bursts.araddr_buf[4]_i_4_n_2 ,\could_multi_bursts.araddr_buf[4]_i_5_n_2 ,1'b0}));
  FDRE \could_multi_bursts.araddr_buf_reg[50] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[50]),
        .Q(m_axi_BUS0_ARADDR[48]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[51] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[51]),
        .Q(m_axi_BUS0_ARADDR[49]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[52] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[52]),
        .Q(m_axi_BUS0_ARADDR[50]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \could_multi_bursts.araddr_buf_reg[52]_i_2 
       (.CI(\could_multi_bursts.araddr_buf_reg[48]_i_2_n_2 ),
        .CO({\could_multi_bursts.araddr_buf_reg[52]_i_2_n_2 ,\could_multi_bursts.araddr_buf_reg[52]_i_2_n_3 ,\could_multi_bursts.araddr_buf_reg[52]_i_2_n_4 ,\could_multi_bursts.araddr_buf_reg[52]_i_2_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(araddr_tmp0[52:49]),
        .S(m_axi_BUS0_ARADDR[50:47]));
  FDRE \could_multi_bursts.araddr_buf_reg[53] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[53]),
        .Q(m_axi_BUS0_ARADDR[51]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[54] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[54]),
        .Q(m_axi_BUS0_ARADDR[52]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[55] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[55]),
        .Q(m_axi_BUS0_ARADDR[53]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[56] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[56]),
        .Q(m_axi_BUS0_ARADDR[54]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \could_multi_bursts.araddr_buf_reg[56]_i_2 
       (.CI(\could_multi_bursts.araddr_buf_reg[52]_i_2_n_2 ),
        .CO({\could_multi_bursts.araddr_buf_reg[56]_i_2_n_2 ,\could_multi_bursts.araddr_buf_reg[56]_i_2_n_3 ,\could_multi_bursts.araddr_buf_reg[56]_i_2_n_4 ,\could_multi_bursts.araddr_buf_reg[56]_i_2_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(araddr_tmp0[56:53]),
        .S(m_axi_BUS0_ARADDR[54:51]));
  FDRE \could_multi_bursts.araddr_buf_reg[57] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[57]),
        .Q(m_axi_BUS0_ARADDR[55]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[58] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[58]),
        .Q(m_axi_BUS0_ARADDR[56]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[59] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[59]),
        .Q(m_axi_BUS0_ARADDR[57]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[5] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[5]),
        .Q(m_axi_BUS0_ARADDR[3]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[60] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[60]),
        .Q(m_axi_BUS0_ARADDR[58]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \could_multi_bursts.araddr_buf_reg[60]_i_2 
       (.CI(\could_multi_bursts.araddr_buf_reg[56]_i_2_n_2 ),
        .CO({\could_multi_bursts.araddr_buf_reg[60]_i_2_n_2 ,\could_multi_bursts.araddr_buf_reg[60]_i_2_n_3 ,\could_multi_bursts.araddr_buf_reg[60]_i_2_n_4 ,\could_multi_bursts.araddr_buf_reg[60]_i_2_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(araddr_tmp0[60:57]),
        .S(m_axi_BUS0_ARADDR[58:55]));
  FDRE \could_multi_bursts.araddr_buf_reg[61] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[61]),
        .Q(m_axi_BUS0_ARADDR[59]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[62] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[62]),
        .Q(m_axi_BUS0_ARADDR[60]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[63] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[63]),
        .Q(m_axi_BUS0_ARADDR[61]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \could_multi_bursts.araddr_buf_reg[63]_i_3 
       (.CI(\could_multi_bursts.araddr_buf_reg[60]_i_2_n_2 ),
        .CO({\NLW_could_multi_bursts.araddr_buf_reg[63]_i_3_CO_UNCONNECTED [3:2],\could_multi_bursts.araddr_buf_reg[63]_i_3_n_4 ,\could_multi_bursts.araddr_buf_reg[63]_i_3_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_could_multi_bursts.araddr_buf_reg[63]_i_3_O_UNCONNECTED [3],araddr_tmp0[63:61]}),
        .S({1'b0,m_axi_BUS0_ARADDR[61:59]}));
  FDRE \could_multi_bursts.araddr_buf_reg[6] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[6]),
        .Q(m_axi_BUS0_ARADDR[4]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[7] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[7]),
        .Q(m_axi_BUS0_ARADDR[5]),
        .R(SR));
  FDRE \could_multi_bursts.araddr_buf_reg[8] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[8]),
        .Q(m_axi_BUS0_ARADDR[6]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \could_multi_bursts.araddr_buf_reg[8]_i_2 
       (.CI(\could_multi_bursts.araddr_buf_reg[4]_i_2_n_2 ),
        .CO({\could_multi_bursts.araddr_buf_reg[8]_i_2_n_2 ,\could_multi_bursts.araddr_buf_reg[8]_i_2_n_3 ,\could_multi_bursts.araddr_buf_reg[8]_i_2_n_4 ,\could_multi_bursts.araddr_buf_reg[8]_i_2_n_5 }),
        .CYINIT(1'b0),
        .DI(m_axi_BUS0_ARADDR[6:3]),
        .O(araddr_tmp0[8:5]),
        .S({\could_multi_bursts.araddr_buf[8]_i_3_n_2 ,\could_multi_bursts.araddr_buf[8]_i_4_n_2 ,\could_multi_bursts.araddr_buf[8]_i_5_n_2 ,\could_multi_bursts.araddr_buf[8]_i_6_n_2 }));
  FDRE \could_multi_bursts.araddr_buf_reg[9] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_1_out[9]),
        .Q(m_axi_BUS0_ARADDR[7]),
        .R(SR));
  FDRE \could_multi_bursts.arlen_buf_reg[0] 
       (.C(ap_clk),
        .CE(fifo_rctl_n_66),
        .D(fifo_rctl_n_67),
        .Q(m_axi_BUS0_ARLEN[0]),
        .R(SR));
  FDRE \could_multi_bursts.arlen_buf_reg[1] 
       (.C(ap_clk),
        .CE(fifo_rctl_n_66),
        .D(fifo_rctl_n_68),
        .Q(m_axi_BUS0_ARLEN[1]),
        .R(SR));
  FDRE \could_multi_bursts.arlen_buf_reg[2] 
       (.C(ap_clk),
        .CE(fifo_rctl_n_66),
        .D(fifo_rctl_n_69),
        .Q(m_axi_BUS0_ARLEN[2]),
        .R(SR));
  FDRE \could_multi_bursts.arlen_buf_reg[3] 
       (.C(ap_clk),
        .CE(fifo_rctl_n_66),
        .D(fifo_rctl_n_70),
        .Q(m_axi_BUS0_ARLEN[3]),
        .R(SR));
  FDRE \could_multi_bursts.arlen_buf_reg[4] 
       (.C(ap_clk),
        .CE(fifo_rctl_n_66),
        .D(fifo_rctl_n_71),
        .Q(m_axi_BUS0_ARLEN[4]),
        .R(SR));
  FDRE \could_multi_bursts.arlen_buf_reg[5] 
       (.C(ap_clk),
        .CE(fifo_rctl_n_66),
        .D(fifo_rctl_n_72),
        .Q(m_axi_BUS0_ARLEN[5]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \could_multi_bursts.loop_cnt[0]_i_1 
       (.I0(\could_multi_bursts.loop_cnt_reg [0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \could_multi_bursts.loop_cnt[1]_i_1 
       (.I0(\could_multi_bursts.loop_cnt_reg [1]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \could_multi_bursts.loop_cnt[2]_i_1 
       (.I0(\could_multi_bursts.loop_cnt_reg [2]),
        .I1(\could_multi_bursts.loop_cnt_reg [0]),
        .I2(\could_multi_bursts.loop_cnt_reg [1]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \could_multi_bursts.loop_cnt[3]_i_2 
       (.I0(\could_multi_bursts.loop_cnt_reg [3]),
        .I1(\could_multi_bursts.loop_cnt_reg [1]),
        .I2(\could_multi_bursts.loop_cnt_reg [0]),
        .I3(\could_multi_bursts.loop_cnt_reg [2]),
        .O(p_0_in[3]));
  FDRE \could_multi_bursts.loop_cnt_reg[0] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_0_in[0]),
        .Q(\could_multi_bursts.loop_cnt_reg [0]),
        .R(fifo_rctl_n_61));
  FDRE \could_multi_bursts.loop_cnt_reg[1] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_0_in[1]),
        .Q(\could_multi_bursts.loop_cnt_reg [1]),
        .R(fifo_rctl_n_61));
  FDRE \could_multi_bursts.loop_cnt_reg[2] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_0_in[2]),
        .Q(\could_multi_bursts.loop_cnt_reg [2]),
        .R(fifo_rctl_n_61));
  FDRE \could_multi_bursts.loop_cnt_reg[3] 
       (.C(ap_clk),
        .CE(p_13_in),
        .D(p_0_in[3]),
        .Q(\could_multi_bursts.loop_cnt_reg [3]),
        .R(fifo_rctl_n_61));
  FDRE \could_multi_bursts.sect_handling_reg 
       (.C(ap_clk),
        .CE(1'b1),
        .D(fifo_rctl_n_63),
        .Q(\could_multi_bursts.sect_handling_reg_n_2 ),
        .R(SR));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[13]_i_2 
       (.I0(rs_rreq_n_128),
        .I1(rs_rreq_n_66),
        .O(\end_addr[13]_i_2_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[13]_i_3 
       (.I0(rs_rreq_n_129),
        .I1(rs_rreq_n_67),
        .O(\end_addr[13]_i_3_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[13]_i_4 
       (.I0(rs_rreq_n_130),
        .I1(p_1_in[11]),
        .O(\end_addr[13]_i_4_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[13]_i_5 
       (.I0(rs_rreq_n_131),
        .I1(p_1_in[10]),
        .O(\end_addr[13]_i_5_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[17]_i_2 
       (.I0(rs_rreq_n_124),
        .I1(rs_rreq_n_65),
        .O(\end_addr[17]_i_2_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[17]_i_3 
       (.I0(rs_rreq_n_125),
        .I1(rs_rreq_n_65),
        .O(\end_addr[17]_i_3_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[17]_i_4 
       (.I0(rs_rreq_n_126),
        .I1(rs_rreq_n_65),
        .O(\end_addr[17]_i_4_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[17]_i_5 
       (.I0(rs_rreq_n_127),
        .I1(rs_rreq_n_65),
        .O(\end_addr[17]_i_5_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[21]_i_2 
       (.I0(rs_rreq_n_120),
        .I1(rs_rreq_n_65),
        .O(\end_addr[21]_i_2_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[21]_i_3 
       (.I0(rs_rreq_n_121),
        .I1(rs_rreq_n_65),
        .O(\end_addr[21]_i_3_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[21]_i_4 
       (.I0(rs_rreq_n_122),
        .I1(rs_rreq_n_65),
        .O(\end_addr[21]_i_4_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[21]_i_5 
       (.I0(rs_rreq_n_123),
        .I1(rs_rreq_n_65),
        .O(\end_addr[21]_i_5_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[25]_i_2 
       (.I0(rs_rreq_n_116),
        .I1(rs_rreq_n_65),
        .O(\end_addr[25]_i_2_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[25]_i_3 
       (.I0(rs_rreq_n_117),
        .I1(rs_rreq_n_65),
        .O(\end_addr[25]_i_3_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[25]_i_4 
       (.I0(rs_rreq_n_118),
        .I1(rs_rreq_n_65),
        .O(\end_addr[25]_i_4_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[25]_i_5 
       (.I0(rs_rreq_n_119),
        .I1(rs_rreq_n_65),
        .O(\end_addr[25]_i_5_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[29]_i_2 
       (.I0(rs_rreq_n_112),
        .I1(rs_rreq_n_65),
        .O(\end_addr[29]_i_2_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[29]_i_3 
       (.I0(rs_rreq_n_113),
        .I1(rs_rreq_n_65),
        .O(\end_addr[29]_i_3_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[29]_i_4 
       (.I0(rs_rreq_n_114),
        .I1(rs_rreq_n_65),
        .O(\end_addr[29]_i_4_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[29]_i_5 
       (.I0(rs_rreq_n_115),
        .I1(rs_rreq_n_65),
        .O(\end_addr[29]_i_5_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[33]_i_2 
       (.I0(rs_rreq_n_110),
        .I1(rs_rreq_n_65),
        .O(\end_addr[33]_i_2_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[33]_i_3 
       (.I0(rs_rreq_n_111),
        .I1(rs_rreq_n_65),
        .O(\end_addr[33]_i_3_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[5]_i_2 
       (.I0(rs_rreq_n_136),
        .I1(p_1_in[5]),
        .O(\end_addr[5]_i_2_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[5]_i_3 
       (.I0(rs_rreq_n_137),
        .I1(p_1_in[4]),
        .O(\end_addr[5]_i_3_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[5]_i_4 
       (.I0(rs_rreq_n_138),
        .I1(p_1_in[3]),
        .O(\end_addr[5]_i_4_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[5]_i_5 
       (.I0(rs_rreq_n_139),
        .I1(p_1_in[2]),
        .O(\end_addr[5]_i_5_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[9]_i_2 
       (.I0(rs_rreq_n_132),
        .I1(p_1_in[9]),
        .O(\end_addr[9]_i_2_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[9]_i_3 
       (.I0(rs_rreq_n_133),
        .I1(p_1_in[8]),
        .O(\end_addr[9]_i_3_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[9]_i_4 
       (.I0(rs_rreq_n_134),
        .I1(p_1_in[7]),
        .O(\end_addr[9]_i_4_n_2 ));
  LUT2 #(
    .INIT(4'h6)) 
    \end_addr[9]_i_5 
       (.I0(rs_rreq_n_135),
        .I1(p_1_in[6]),
        .O(\end_addr[9]_i_5_n_2 ));
  FDRE \end_addr_reg[10] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_56),
        .Q(\end_addr_reg_n_2_[10] ),
        .R(SR));
  FDRE \end_addr_reg[11] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_55),
        .Q(\end_addr_reg_n_2_[11] ),
        .R(SR));
  FDRE \end_addr_reg[12] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_54),
        .Q(p_0_in0_in[0]),
        .R(SR));
  FDRE \end_addr_reg[13] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_53),
        .Q(p_0_in0_in[1]),
        .R(SR));
  FDRE \end_addr_reg[14] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_52),
        .Q(p_0_in0_in[2]),
        .R(SR));
  FDRE \end_addr_reg[15] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_51),
        .Q(p_0_in0_in[3]),
        .R(SR));
  FDRE \end_addr_reg[16] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_50),
        .Q(p_0_in0_in[4]),
        .R(SR));
  FDRE \end_addr_reg[17] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_49),
        .Q(p_0_in0_in[5]),
        .R(SR));
  FDRE \end_addr_reg[18] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_48),
        .Q(p_0_in0_in[6]),
        .R(SR));
  FDRE \end_addr_reg[19] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_47),
        .Q(p_0_in0_in[7]),
        .R(SR));
  FDRE \end_addr_reg[20] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_46),
        .Q(p_0_in0_in[8]),
        .R(SR));
  FDRE \end_addr_reg[21] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_45),
        .Q(p_0_in0_in[9]),
        .R(SR));
  FDRE \end_addr_reg[22] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_44),
        .Q(p_0_in0_in[10]),
        .R(SR));
  FDRE \end_addr_reg[23] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_43),
        .Q(p_0_in0_in[11]),
        .R(SR));
  FDRE \end_addr_reg[24] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_42),
        .Q(p_0_in0_in[12]),
        .R(SR));
  FDRE \end_addr_reg[25] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_41),
        .Q(p_0_in0_in[13]),
        .R(SR));
  FDRE \end_addr_reg[26] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_40),
        .Q(p_0_in0_in[14]),
        .R(SR));
  FDRE \end_addr_reg[27] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_39),
        .Q(p_0_in0_in[15]),
        .R(SR));
  FDRE \end_addr_reg[28] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_38),
        .Q(p_0_in0_in[16]),
        .R(SR));
  FDRE \end_addr_reg[29] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_37),
        .Q(p_0_in0_in[17]),
        .R(SR));
  FDRE \end_addr_reg[2] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_64),
        .Q(\end_addr_reg_n_2_[2] ),
        .R(SR));
  FDRE \end_addr_reg[30] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_36),
        .Q(p_0_in0_in[18]),
        .R(SR));
  FDRE \end_addr_reg[31] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_35),
        .Q(p_0_in0_in[19]),
        .R(SR));
  FDRE \end_addr_reg[32] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_34),
        .Q(p_0_in0_in[20]),
        .R(SR));
  FDRE \end_addr_reg[33] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_33),
        .Q(p_0_in0_in[21]),
        .R(SR));
  FDRE \end_addr_reg[34] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_32),
        .Q(p_0_in0_in[22]),
        .R(SR));
  FDRE \end_addr_reg[35] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_31),
        .Q(p_0_in0_in[23]),
        .R(SR));
  FDRE \end_addr_reg[36] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_30),
        .Q(p_0_in0_in[24]),
        .R(SR));
  FDRE \end_addr_reg[37] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_29),
        .Q(p_0_in0_in[25]),
        .R(SR));
  FDRE \end_addr_reg[38] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_28),
        .Q(p_0_in0_in[26]),
        .R(SR));
  FDRE \end_addr_reg[39] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_27),
        .Q(p_0_in0_in[27]),
        .R(SR));
  FDRE \end_addr_reg[3] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_63),
        .Q(\end_addr_reg_n_2_[3] ),
        .R(SR));
  FDRE \end_addr_reg[40] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_26),
        .Q(p_0_in0_in[28]),
        .R(SR));
  FDRE \end_addr_reg[41] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_25),
        .Q(p_0_in0_in[29]),
        .R(SR));
  FDRE \end_addr_reg[42] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_24),
        .Q(p_0_in0_in[30]),
        .R(SR));
  FDRE \end_addr_reg[43] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_23),
        .Q(p_0_in0_in[31]),
        .R(SR));
  FDRE \end_addr_reg[44] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_22),
        .Q(p_0_in0_in[32]),
        .R(SR));
  FDRE \end_addr_reg[45] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_21),
        .Q(p_0_in0_in[33]),
        .R(SR));
  FDRE \end_addr_reg[46] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_20),
        .Q(p_0_in0_in[34]),
        .R(SR));
  FDRE \end_addr_reg[47] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_19),
        .Q(p_0_in0_in[35]),
        .R(SR));
  FDRE \end_addr_reg[48] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_18),
        .Q(p_0_in0_in[36]),
        .R(SR));
  FDRE \end_addr_reg[49] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_17),
        .Q(p_0_in0_in[37]),
        .R(SR));
  FDRE \end_addr_reg[4] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_62),
        .Q(\end_addr_reg_n_2_[4] ),
        .R(SR));
  FDRE \end_addr_reg[50] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_16),
        .Q(p_0_in0_in[38]),
        .R(SR));
  FDRE \end_addr_reg[51] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_15),
        .Q(p_0_in0_in[39]),
        .R(SR));
  FDRE \end_addr_reg[52] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_14),
        .Q(p_0_in0_in[40]),
        .R(SR));
  FDRE \end_addr_reg[53] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_13),
        .Q(p_0_in0_in[41]),
        .R(SR));
  FDRE \end_addr_reg[54] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_12),
        .Q(p_0_in0_in[42]),
        .R(SR));
  FDRE \end_addr_reg[55] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_11),
        .Q(p_0_in0_in[43]),
        .R(SR));
  FDRE \end_addr_reg[56] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_10),
        .Q(p_0_in0_in[44]),
        .R(SR));
  FDRE \end_addr_reg[57] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_9),
        .Q(p_0_in0_in[45]),
        .R(SR));
  FDRE \end_addr_reg[58] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_8),
        .Q(p_0_in0_in[46]),
        .R(SR));
  FDRE \end_addr_reg[59] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_7),
        .Q(p_0_in0_in[47]),
        .R(SR));
  FDRE \end_addr_reg[5] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_61),
        .Q(\end_addr_reg_n_2_[5] ),
        .R(SR));
  FDRE \end_addr_reg[60] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_6),
        .Q(p_0_in0_in[48]),
        .R(SR));
  FDRE \end_addr_reg[61] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_5),
        .Q(p_0_in0_in[49]),
        .R(SR));
  FDRE \end_addr_reg[62] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_4),
        .Q(p_0_in0_in[50]),
        .R(SR));
  FDRE \end_addr_reg[63] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_3),
        .Q(p_0_in0_in[51]),
        .R(SR));
  FDRE \end_addr_reg[6] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_60),
        .Q(\end_addr_reg_n_2_[6] ),
        .R(SR));
  FDRE \end_addr_reg[7] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_59),
        .Q(\end_addr_reg_n_2_[7] ),
        .R(SR));
  FDRE \end_addr_reg[8] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_58),
        .Q(\end_addr_reg_n_2_[8] ),
        .R(SR));
  FDRE \end_addr_reg[9] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_57),
        .Q(\end_addr_reg_n_2_[9] ),
        .R(SR));
  design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_fifo__parameterized1 fifo_burst
       (.Q(Q[32]),
        .RREADY_Dummy(RREADY_Dummy),
        .SR(SR),
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .\could_multi_bursts.loop_cnt_reg[3] (fifo_burst_n_4),
        .din(din),
        .\dout_reg[0] (\state_reg[0] ),
        .\dout_reg[0]_0 (last_sect_buf_reg_n_2),
        .empty_n_reg_0(fifo_rctl_n_3),
        .fifo_rctl_ready(fifo_rctl_ready),
        .\mOutPtr_reg[0]_0 (\could_multi_bursts.ARVALID_Dummy_reg_0 ),
        .\mOutPtr_reg[0]_1 (\could_multi_bursts.sect_handling_reg_n_2 ),
        .m_axi_BUS0_ARREADY(m_axi_BUS0_ARREADY),
        .\sect_cnt[51]_i_3 ({\sect_len_buf_reg_n_2_[9] ,\sect_len_buf_reg_n_2_[8] ,\sect_len_buf_reg_n_2_[7] ,\sect_len_buf_reg_n_2_[6] }),
        .\sect_cnt[51]_i_3_0 (\could_multi_bursts.loop_cnt_reg ),
        .\sect_len_buf_reg[7] (fifo_burst_n_3));
  design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_fifo__parameterized1_0 fifo_rctl
       (.CO(last_sect),
        .D({fifo_rctl_n_5,fifo_rctl_n_6,fifo_rctl_n_7,fifo_rctl_n_8,fifo_rctl_n_9,fifo_rctl_n_10,fifo_rctl_n_11,fifo_rctl_n_12,fifo_rctl_n_13,fifo_rctl_n_14,fifo_rctl_n_15,fifo_rctl_n_16,fifo_rctl_n_17,fifo_rctl_n_18,fifo_rctl_n_19,fifo_rctl_n_20,fifo_rctl_n_21,fifo_rctl_n_22,fifo_rctl_n_23,fifo_rctl_n_24,fifo_rctl_n_25,fifo_rctl_n_26,fifo_rctl_n_27,fifo_rctl_n_28,fifo_rctl_n_29,fifo_rctl_n_30,fifo_rctl_n_31,fifo_rctl_n_32,fifo_rctl_n_33,fifo_rctl_n_34,fifo_rctl_n_35,fifo_rctl_n_36,fifo_rctl_n_37,fifo_rctl_n_38,fifo_rctl_n_39,fifo_rctl_n_40,fifo_rctl_n_41,fifo_rctl_n_42,fifo_rctl_n_43,fifo_rctl_n_44,fifo_rctl_n_45,fifo_rctl_n_46,fifo_rctl_n_47,fifo_rctl_n_48,fifo_rctl_n_49,fifo_rctl_n_50,fifo_rctl_n_51,fifo_rctl_n_52,fifo_rctl_n_53,fifo_rctl_n_54,fifo_rctl_n_55}),
        .E(p_13_in),
        .Q({rs_rreq_n_78,rs_rreq_n_79,rs_rreq_n_80,rs_rreq_n_81,rs_rreq_n_82,rs_rreq_n_83,rs_rreq_n_84,rs_rreq_n_85,rs_rreq_n_86,rs_rreq_n_87,rs_rreq_n_88,rs_rreq_n_89,rs_rreq_n_90,rs_rreq_n_91,rs_rreq_n_92,rs_rreq_n_93,rs_rreq_n_94,rs_rreq_n_95,rs_rreq_n_96,rs_rreq_n_97,rs_rreq_n_98,rs_rreq_n_99,rs_rreq_n_100,rs_rreq_n_101,rs_rreq_n_102,rs_rreq_n_103,rs_rreq_n_104,rs_rreq_n_105,rs_rreq_n_106,rs_rreq_n_107,rs_rreq_n_108,rs_rreq_n_109,rs_rreq_n_110,rs_rreq_n_111,rs_rreq_n_112,rs_rreq_n_113,rs_rreq_n_114,rs_rreq_n_115,rs_rreq_n_116,rs_rreq_n_117,rs_rreq_n_118,rs_rreq_n_119,rs_rreq_n_120,rs_rreq_n_121,rs_rreq_n_122,rs_rreq_n_123,rs_rreq_n_124,rs_rreq_n_125,rs_rreq_n_126,rs_rreq_n_127,rs_rreq_n_128}),
        .RBURST_READY_Dummy(RBURST_READY_Dummy),
        .SR(SR),
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .ap_rst_n_0(fifo_rctl_n_61),
        .ap_rst_n_1(fifo_rctl_n_64),
        .\beat_len_reg[0] (fifo_rctl_n_73),
        .\beat_len_reg[3] (fifo_rctl_n_76),
        .\beat_len_reg[4] (fifo_rctl_n_77),
        .\beat_len_reg[6] (fifo_rctl_n_79),
        .\beat_len_reg[8] (fifo_rctl_n_81),
        .\beat_len_reg[9] (fifo_rctl_n_82),
        .\could_multi_bursts.ARVALID_Dummy_reg (\could_multi_bursts.sect_handling_reg_n_2 ),
        .\could_multi_bursts.ARVALID_Dummy_reg_0 (\could_multi_bursts.ARVALID_Dummy_reg_0 ),
        .\could_multi_bursts.arlen_buf_reg[5] ({\sect_len_buf_reg_n_2_[5] ,\sect_len_buf_reg_n_2_[4] ,\sect_len_buf_reg_n_2_[3] ,\sect_len_buf_reg_n_2_[2] ,\sect_len_buf_reg_n_2_[1] ,\sect_len_buf_reg_n_2_[0] }),
        .\could_multi_bursts.sect_handling_reg (fifo_rctl_n_58),
        .\could_multi_bursts.sect_handling_reg_0 (p_14_in),
        .\could_multi_bursts.sect_handling_reg_1 (fifo_rctl_n_62),
        .\could_multi_bursts.sect_handling_reg_10 (rreq_handling_reg_n_2),
        .\could_multi_bursts.sect_handling_reg_11 (fifo_burst_n_3),
        .\could_multi_bursts.sect_handling_reg_2 (fifo_rctl_n_65),
        .\could_multi_bursts.sect_handling_reg_3 (fifo_rctl_n_66),
        .\could_multi_bursts.sect_handling_reg_4 (fifo_rctl_n_67),
        .\could_multi_bursts.sect_handling_reg_5 (fifo_rctl_n_68),
        .\could_multi_bursts.sect_handling_reg_6 (fifo_rctl_n_69),
        .\could_multi_bursts.sect_handling_reg_7 (fifo_rctl_n_70),
        .\could_multi_bursts.sect_handling_reg_8 (fifo_rctl_n_71),
        .\could_multi_bursts.sect_handling_reg_9 (fifo_rctl_n_72),
        .\end_addr_reg[3] (fifo_rctl_n_74),
        .\end_addr_reg[4] (fifo_rctl_n_75),
        .fifo_rctl_ready(fifo_rctl_ready),
        .last_sect_buf_reg(fifo_burst_n_4),
        .last_sect_buf_reg_0(rs_rreq_n_143),
        .m_axi_BUS0_ARREADY(m_axi_BUS0_ARREADY),
        .m_axi_BUS0_ARREADY_0(fifo_rctl_n_3),
        .rreq_handling_reg(fifo_rctl_n_56),
        .rreq_handling_reg_0(next_rreq),
        .rreq_handling_reg_1(fifo_rctl_n_59),
        .rreq_handling_reg_2(fifo_rctl_n_63),
        .\sect_addr_buf_reg[2] (first_sect),
        .sect_cnt0(sect_cnt0),
        .\sect_cnt_reg[1] (rreq_valid),
        .\sect_len_buf_reg[9] (beat_len),
        .\sect_len_buf_reg[9]_0 ({\end_addr_reg_n_2_[11] ,\end_addr_reg_n_2_[10] ,\end_addr_reg_n_2_[9] ,\end_addr_reg_n_2_[8] ,\end_addr_reg_n_2_[7] ,\end_addr_reg_n_2_[6] ,\end_addr_reg_n_2_[5] ,\end_addr_reg_n_2_[4] ,\end_addr_reg_n_2_[3] ,\end_addr_reg_n_2_[2] }),
        .\sect_len_buf_reg[9]_1 ({\start_addr_reg_n_2_[11] ,\start_addr_reg_n_2_[10] ,\start_addr_reg_n_2_[9] ,\start_addr_reg_n_2_[8] ,\start_addr_reg_n_2_[7] ,\start_addr_reg_n_2_[6] ,\start_addr_reg_n_2_[5] ,\start_addr_reg_n_2_[4] ,\start_addr_reg_n_2_[3] ,\start_addr_reg_n_2_[2] }),
        .\start_addr_reg[7] (fifo_rctl_n_78),
        .\start_addr_reg[9] (fifo_rctl_n_80));
  CARRY4 first_sect_carry
       (.CI(1'b0),
        .CO({first_sect_carry_n_2,first_sect_carry_n_3,first_sect_carry_n_4,first_sect_carry_n_5}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_first_sect_carry_O_UNCONNECTED[3:0]),
        .S({first_sect_carry_i_1_n_2,first_sect_carry_i_2_n_2,first_sect_carry_i_3_n_2,first_sect_carry_i_4_n_2}));
  CARRY4 first_sect_carry__0
       (.CI(first_sect_carry_n_2),
        .CO({first_sect_carry__0_n_2,first_sect_carry__0_n_3,first_sect_carry__0_n_4,first_sect_carry__0_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_first_sect_carry__0_O_UNCONNECTED[3:0]),
        .S({first_sect_carry__0_i_1_n_2,first_sect_carry__0_i_2_n_2,first_sect_carry__0_i_3_n_2,first_sect_carry__0_i_4_n_2}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    first_sect_carry__0_i_1
       (.I0(p_0_in_0[22]),
        .I1(\sect_cnt_reg_n_2_[22] ),
        .I2(p_0_in_0[23]),
        .I3(\sect_cnt_reg_n_2_[23] ),
        .I4(\sect_cnt_reg_n_2_[21] ),
        .I5(p_0_in_0[21]),
        .O(first_sect_carry__0_i_1_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    first_sect_carry__0_i_2
       (.I0(p_0_in_0[19]),
        .I1(\sect_cnt_reg_n_2_[19] ),
        .I2(p_0_in_0[20]),
        .I3(\sect_cnt_reg_n_2_[20] ),
        .I4(\sect_cnt_reg_n_2_[18] ),
        .I5(p_0_in_0[18]),
        .O(first_sect_carry__0_i_2_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    first_sect_carry__0_i_3
       (.I0(p_0_in_0[15]),
        .I1(\sect_cnt_reg_n_2_[15] ),
        .I2(p_0_in_0[17]),
        .I3(\sect_cnt_reg_n_2_[17] ),
        .I4(\sect_cnt_reg_n_2_[16] ),
        .I5(p_0_in_0[16]),
        .O(first_sect_carry__0_i_3_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    first_sect_carry__0_i_4
       (.I0(p_0_in_0[14]),
        .I1(\sect_cnt_reg_n_2_[14] ),
        .I2(p_0_in_0[12]),
        .I3(\sect_cnt_reg_n_2_[12] ),
        .I4(p_0_in_0[13]),
        .I5(\sect_cnt_reg_n_2_[13] ),
        .O(first_sect_carry__0_i_4_n_2));
  CARRY4 first_sect_carry__1
       (.CI(first_sect_carry__0_n_2),
        .CO({first_sect_carry__1_n_2,first_sect_carry__1_n_3,first_sect_carry__1_n_4,first_sect_carry__1_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_first_sect_carry__1_O_UNCONNECTED[3:0]),
        .S({first_sect_carry__1_i_1_n_2,first_sect_carry__1_i_2_n_2,first_sect_carry__1_i_3_n_2,first_sect_carry__1_i_4_n_2}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    first_sect_carry__1_i_1
       (.I0(p_0_in_0[35]),
        .I1(\sect_cnt_reg_n_2_[35] ),
        .I2(p_0_in_0[33]),
        .I3(\sect_cnt_reg_n_2_[33] ),
        .I4(p_0_in_0[34]),
        .I5(\sect_cnt_reg_n_2_[34] ),
        .O(first_sect_carry__1_i_1_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    first_sect_carry__1_i_2
       (.I0(p_0_in_0[32]),
        .I1(\sect_cnt_reg_n_2_[32] ),
        .I2(p_0_in_0[31]),
        .I3(\sect_cnt_reg_n_2_[31] ),
        .I4(p_0_in_0[30]),
        .I5(\sect_cnt_reg_n_2_[30] ),
        .O(first_sect_carry__1_i_2_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    first_sect_carry__1_i_3
       (.I0(p_0_in_0[29]),
        .I1(\sect_cnt_reg_n_2_[29] ),
        .I2(p_0_in_0[27]),
        .I3(\sect_cnt_reg_n_2_[27] ),
        .I4(p_0_in_0[28]),
        .I5(\sect_cnt_reg_n_2_[28] ),
        .O(first_sect_carry__1_i_3_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    first_sect_carry__1_i_4
       (.I0(p_0_in_0[26]),
        .I1(\sect_cnt_reg_n_2_[26] ),
        .I2(p_0_in_0[24]),
        .I3(\sect_cnt_reg_n_2_[24] ),
        .I4(p_0_in_0[25]),
        .I5(\sect_cnt_reg_n_2_[25] ),
        .O(first_sect_carry__1_i_4_n_2));
  CARRY4 first_sect_carry__2
       (.CI(first_sect_carry__1_n_2),
        .CO({first_sect_carry__2_n_2,first_sect_carry__2_n_3,first_sect_carry__2_n_4,first_sect_carry__2_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_first_sect_carry__2_O_UNCONNECTED[3:0]),
        .S({first_sect_carry__2_i_1_n_2,first_sect_carry__2_i_2_n_2,first_sect_carry__2_i_3_n_2,first_sect_carry__2_i_4_n_2}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    first_sect_carry__2_i_1
       (.I0(p_0_in_0[45]),
        .I1(\sect_cnt_reg_n_2_[45] ),
        .I2(p_0_in_0[47]),
        .I3(\sect_cnt_reg_n_2_[47] ),
        .I4(\sect_cnt_reg_n_2_[46] ),
        .I5(p_0_in_0[46]),
        .O(first_sect_carry__2_i_1_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    first_sect_carry__2_i_2
       (.I0(p_0_in_0[43]),
        .I1(\sect_cnt_reg_n_2_[43] ),
        .I2(p_0_in_0[44]),
        .I3(\sect_cnt_reg_n_2_[44] ),
        .I4(\sect_cnt_reg_n_2_[42] ),
        .I5(p_0_in_0[42]),
        .O(first_sect_carry__2_i_2_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    first_sect_carry__2_i_3
       (.I0(p_0_in_0[40]),
        .I1(\sect_cnt_reg_n_2_[40] ),
        .I2(p_0_in_0[41]),
        .I3(\sect_cnt_reg_n_2_[41] ),
        .I4(\sect_cnt_reg_n_2_[39] ),
        .I5(p_0_in_0[39]),
        .O(first_sect_carry__2_i_3_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    first_sect_carry__2_i_4
       (.I0(p_0_in_0[38]),
        .I1(\sect_cnt_reg_n_2_[38] ),
        .I2(p_0_in_0[36]),
        .I3(\sect_cnt_reg_n_2_[36] ),
        .I4(p_0_in_0[37]),
        .I5(\sect_cnt_reg_n_2_[37] ),
        .O(first_sect_carry__2_i_4_n_2));
  CARRY4 first_sect_carry__3
       (.CI(first_sect_carry__2_n_2),
        .CO({NLW_first_sect_carry__3_CO_UNCONNECTED[3:2],first_sect,first_sect_carry__3_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_first_sect_carry__3_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,first_sect_carry__3_i_1_n_2,first_sect_carry__3_i_2_n_2}));
  LUT2 #(
    .INIT(4'h9)) 
    first_sect_carry__3_i_1
       (.I0(p_0_in_0[51]),
        .I1(\sect_cnt_reg_n_2_[51] ),
        .O(first_sect_carry__3_i_1_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    first_sect_carry__3_i_2
       (.I0(p_0_in_0[49]),
        .I1(\sect_cnt_reg_n_2_[49] ),
        .I2(p_0_in_0[50]),
        .I3(\sect_cnt_reg_n_2_[50] ),
        .I4(p_0_in_0[48]),
        .I5(\sect_cnt_reg_n_2_[48] ),
        .O(first_sect_carry__3_i_2_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    first_sect_carry_i_1
       (.I0(p_0_in_0[10]),
        .I1(\sect_cnt_reg_n_2_[10] ),
        .I2(p_0_in_0[11]),
        .I3(\sect_cnt_reg_n_2_[11] ),
        .I4(\sect_cnt_reg_n_2_[9] ),
        .I5(p_0_in_0[9]),
        .O(first_sect_carry_i_1_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    first_sect_carry_i_2
       (.I0(p_0_in_0[8]),
        .I1(\sect_cnt_reg_n_2_[8] ),
        .I2(p_0_in_0[6]),
        .I3(\sect_cnt_reg_n_2_[6] ),
        .I4(p_0_in_0[7]),
        .I5(\sect_cnt_reg_n_2_[7] ),
        .O(first_sect_carry_i_2_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    first_sect_carry_i_3
       (.I0(p_0_in_0[5]),
        .I1(\sect_cnt_reg_n_2_[5] ),
        .I2(p_0_in_0[3]),
        .I3(\sect_cnt_reg_n_2_[3] ),
        .I4(p_0_in_0[4]),
        .I5(\sect_cnt_reg_n_2_[4] ),
        .O(first_sect_carry_i_3_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    first_sect_carry_i_4
       (.I0(p_0_in_0[1]),
        .I1(\sect_cnt_reg_n_2_[1] ),
        .I2(p_0_in_0[2]),
        .I3(\sect_cnt_reg_n_2_[2] ),
        .I4(p_0_in_0[0]),
        .I5(\sect_cnt_reg_n_2_[0] ),
        .O(first_sect_carry_i_4_n_2));
  FDRE last_sect_buf_reg
       (.C(ap_clk),
        .CE(p_14_in),
        .D(last_sect),
        .Q(last_sect_buf_reg_n_2),
        .R(SR));
  CARRY4 last_sect_carry
       (.CI(1'b0),
        .CO({last_sect_carry_n_2,last_sect_carry_n_3,last_sect_carry_n_4,last_sect_carry_n_5}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_last_sect_carry_O_UNCONNECTED[3:0]),
        .S({last_sect_carry_i_1_n_2,last_sect_carry_i_2_n_2,last_sect_carry_i_3_n_2,last_sect_carry_i_4_n_2}));
  CARRY4 last_sect_carry__0
       (.CI(last_sect_carry_n_2),
        .CO({last_sect_carry__0_n_2,last_sect_carry__0_n_3,last_sect_carry__0_n_4,last_sect_carry__0_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_last_sect_carry__0_O_UNCONNECTED[3:0]),
        .S({last_sect_carry__0_i_1_n_2,last_sect_carry__0_i_2_n_2,last_sect_carry__0_i_3_n_2,last_sect_carry__0_i_4_n_2}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    last_sect_carry__0_i_1
       (.I0(\sect_cnt_reg_n_2_[21] ),
        .I1(p_0_in0_in[21]),
        .I2(\sect_cnt_reg_n_2_[22] ),
        .I3(p_0_in0_in[22]),
        .I4(p_0_in0_in[23]),
        .I5(\sect_cnt_reg_n_2_[23] ),
        .O(last_sect_carry__0_i_1_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    last_sect_carry__0_i_2
       (.I0(\sect_cnt_reg_n_2_[18] ),
        .I1(p_0_in0_in[18]),
        .I2(\sect_cnt_reg_n_2_[19] ),
        .I3(p_0_in0_in[19]),
        .I4(p_0_in0_in[20]),
        .I5(\sect_cnt_reg_n_2_[20] ),
        .O(last_sect_carry__0_i_2_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    last_sect_carry__0_i_3
       (.I0(\sect_cnt_reg_n_2_[15] ),
        .I1(p_0_in0_in[15]),
        .I2(\sect_cnt_reg_n_2_[16] ),
        .I3(p_0_in0_in[16]),
        .I4(p_0_in0_in[17]),
        .I5(\sect_cnt_reg_n_2_[17] ),
        .O(last_sect_carry__0_i_3_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    last_sect_carry__0_i_4
       (.I0(p_0_in0_in[14]),
        .I1(\sect_cnt_reg_n_2_[14] ),
        .I2(\sect_cnt_reg_n_2_[12] ),
        .I3(p_0_in0_in[12]),
        .I4(\sect_cnt_reg_n_2_[13] ),
        .I5(p_0_in0_in[13]),
        .O(last_sect_carry__0_i_4_n_2));
  CARRY4 last_sect_carry__1
       (.CI(last_sect_carry__0_n_2),
        .CO({last_sect_carry__1_n_2,last_sect_carry__1_n_3,last_sect_carry__1_n_4,last_sect_carry__1_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_last_sect_carry__1_O_UNCONNECTED[3:0]),
        .S({last_sect_carry__1_i_1_n_2,last_sect_carry__1_i_2_n_2,last_sect_carry__1_i_3_n_2,last_sect_carry__1_i_4_n_2}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    last_sect_carry__1_i_1
       (.I0(p_0_in0_in[35]),
        .I1(\sect_cnt_reg_n_2_[35] ),
        .I2(\sect_cnt_reg_n_2_[33] ),
        .I3(p_0_in0_in[33]),
        .I4(\sect_cnt_reg_n_2_[34] ),
        .I5(p_0_in0_in[34]),
        .O(last_sect_carry__1_i_1_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    last_sect_carry__1_i_2
       (.I0(p_0_in0_in[32]),
        .I1(\sect_cnt_reg_n_2_[32] ),
        .I2(\sect_cnt_reg_n_2_[31] ),
        .I3(p_0_in0_in[31]),
        .I4(\sect_cnt_reg_n_2_[30] ),
        .I5(p_0_in0_in[30]),
        .O(last_sect_carry__1_i_2_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    last_sect_carry__1_i_3
       (.I0(p_0_in0_in[29]),
        .I1(\sect_cnt_reg_n_2_[29] ),
        .I2(\sect_cnt_reg_n_2_[27] ),
        .I3(p_0_in0_in[27]),
        .I4(\sect_cnt_reg_n_2_[28] ),
        .I5(p_0_in0_in[28]),
        .O(last_sect_carry__1_i_3_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    last_sect_carry__1_i_4
       (.I0(p_0_in0_in[26]),
        .I1(\sect_cnt_reg_n_2_[26] ),
        .I2(\sect_cnt_reg_n_2_[24] ),
        .I3(p_0_in0_in[24]),
        .I4(\sect_cnt_reg_n_2_[25] ),
        .I5(p_0_in0_in[25]),
        .O(last_sect_carry__1_i_4_n_2));
  CARRY4 last_sect_carry__2
       (.CI(last_sect_carry__1_n_2),
        .CO({last_sect_carry__2_n_2,last_sect_carry__2_n_3,last_sect_carry__2_n_4,last_sect_carry__2_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_last_sect_carry__2_O_UNCONNECTED[3:0]),
        .S({last_sect_carry__2_i_1_n_2,last_sect_carry__2_i_2_n_2,last_sect_carry__2_i_3_n_2,last_sect_carry__2_i_4_n_2}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    last_sect_carry__2_i_1
       (.I0(\sect_cnt_reg_n_2_[45] ),
        .I1(p_0_in0_in[45]),
        .I2(\sect_cnt_reg_n_2_[46] ),
        .I3(p_0_in0_in[46]),
        .I4(p_0_in0_in[47]),
        .I5(\sect_cnt_reg_n_2_[47] ),
        .O(last_sect_carry__2_i_1_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    last_sect_carry__2_i_2
       (.I0(\sect_cnt_reg_n_2_[42] ),
        .I1(p_0_in0_in[42]),
        .I2(\sect_cnt_reg_n_2_[43] ),
        .I3(p_0_in0_in[43]),
        .I4(p_0_in0_in[44]),
        .I5(\sect_cnt_reg_n_2_[44] ),
        .O(last_sect_carry__2_i_2_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    last_sect_carry__2_i_3
       (.I0(\sect_cnt_reg_n_2_[39] ),
        .I1(p_0_in0_in[39]),
        .I2(\sect_cnt_reg_n_2_[40] ),
        .I3(p_0_in0_in[40]),
        .I4(p_0_in0_in[41]),
        .I5(\sect_cnt_reg_n_2_[41] ),
        .O(last_sect_carry__2_i_3_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    last_sect_carry__2_i_4
       (.I0(p_0_in0_in[38]),
        .I1(\sect_cnt_reg_n_2_[38] ),
        .I2(\sect_cnt_reg_n_2_[36] ),
        .I3(p_0_in0_in[36]),
        .I4(\sect_cnt_reg_n_2_[37] ),
        .I5(p_0_in0_in[37]),
        .O(last_sect_carry__2_i_4_n_2));
  CARRY4 last_sect_carry__3
       (.CI(last_sect_carry__2_n_2),
        .CO({NLW_last_sect_carry__3_CO_UNCONNECTED[3:2],last_sect,last_sect_carry__3_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_last_sect_carry__3_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,last_sect_carry__3_i_1_n_2,last_sect_carry__3_i_2_n_2}));
  LUT2 #(
    .INIT(4'h9)) 
    last_sect_carry__3_i_1
       (.I0(p_0_in0_in[51]),
        .I1(\sect_cnt_reg_n_2_[51] ),
        .O(last_sect_carry__3_i_1_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    last_sect_carry__3_i_2
       (.I0(p_0_in0_in[49]),
        .I1(\sect_cnt_reg_n_2_[49] ),
        .I2(\sect_cnt_reg_n_2_[50] ),
        .I3(p_0_in0_in[50]),
        .I4(\sect_cnt_reg_n_2_[48] ),
        .I5(p_0_in0_in[48]),
        .O(last_sect_carry__3_i_2_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    last_sect_carry_i_1
       (.I0(\sect_cnt_reg_n_2_[9] ),
        .I1(p_0_in0_in[9]),
        .I2(\sect_cnt_reg_n_2_[10] ),
        .I3(p_0_in0_in[10]),
        .I4(p_0_in0_in[11]),
        .I5(\sect_cnt_reg_n_2_[11] ),
        .O(last_sect_carry_i_1_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    last_sect_carry_i_2
       (.I0(p_0_in0_in[8]),
        .I1(\sect_cnt_reg_n_2_[8] ),
        .I2(\sect_cnt_reg_n_2_[6] ),
        .I3(p_0_in0_in[6]),
        .I4(\sect_cnt_reg_n_2_[7] ),
        .I5(p_0_in0_in[7]),
        .O(last_sect_carry_i_2_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    last_sect_carry_i_3
       (.I0(p_0_in0_in[5]),
        .I1(\sect_cnt_reg_n_2_[5] ),
        .I2(\sect_cnt_reg_n_2_[4] ),
        .I3(p_0_in0_in[4]),
        .I4(\sect_cnt_reg_n_2_[3] ),
        .I5(p_0_in0_in[3]),
        .O(last_sect_carry_i_3_n_2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    last_sect_carry_i_4
       (.I0(p_0_in0_in[1]),
        .I1(\sect_cnt_reg_n_2_[1] ),
        .I2(\sect_cnt_reg_n_2_[2] ),
        .I3(p_0_in0_in[2]),
        .I4(\sect_cnt_reg_n_2_[0] ),
        .I5(p_0_in0_in[0]),
        .O(last_sect_carry_i_4_n_2));
  FDRE rreq_handling_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(rs_rreq_n_144),
        .Q(rreq_handling_reg_n_2),
        .R(SR));
  design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_reg_slice__parameterized2 rs_rdata
       (.Q(\state_reg[0] ),
        .RREADY_Dummy(RREADY_Dummy),
        .SR(SR),
        .ap_clk(ap_clk),
        .\data_p1_reg[32]_0 (Q),
        .\data_p2_reg[32]_0 (\data_p2_reg[32] ),
        .m_axi_BUS0_RVALID(m_axi_BUS0_RVALID),
        .s_ready_t_reg_0(s_ready_t_reg),
        .we(we));
  design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_reg_slice rs_rreq
       (.ARVALID_Dummy(ARVALID_Dummy),
        .CO(last_sect),
        .D({rs_rreq_n_3,rs_rreq_n_4,rs_rreq_n_5,rs_rreq_n_6,rs_rreq_n_7,rs_rreq_n_8,rs_rreq_n_9,rs_rreq_n_10,rs_rreq_n_11,rs_rreq_n_12,rs_rreq_n_13,rs_rreq_n_14,rs_rreq_n_15,rs_rreq_n_16,rs_rreq_n_17,rs_rreq_n_18,rs_rreq_n_19,rs_rreq_n_20,rs_rreq_n_21,rs_rreq_n_22,rs_rreq_n_23,rs_rreq_n_24,rs_rreq_n_25,rs_rreq_n_26,rs_rreq_n_27,rs_rreq_n_28,rs_rreq_n_29,rs_rreq_n_30,rs_rreq_n_31,rs_rreq_n_32,rs_rreq_n_33,rs_rreq_n_34,rs_rreq_n_35,rs_rreq_n_36,rs_rreq_n_37,rs_rreq_n_38,rs_rreq_n_39,rs_rreq_n_40,rs_rreq_n_41,rs_rreq_n_42,rs_rreq_n_43,rs_rreq_n_44,rs_rreq_n_45,rs_rreq_n_46,rs_rreq_n_47,rs_rreq_n_48,rs_rreq_n_49,rs_rreq_n_50,rs_rreq_n_51,rs_rreq_n_52,rs_rreq_n_53,rs_rreq_n_54,rs_rreq_n_55,rs_rreq_n_56,rs_rreq_n_57,rs_rreq_n_58,rs_rreq_n_59,rs_rreq_n_60,rs_rreq_n_61,rs_rreq_n_62,rs_rreq_n_63,rs_rreq_n_64}),
        .E(rs_rreq_n_142),
        .Q({rs_rreq_n_65,rs_rreq_n_66,rs_rreq_n_67,p_1_in,rs_rreq_n_78,rs_rreq_n_79,rs_rreq_n_80,rs_rreq_n_81,rs_rreq_n_82,rs_rreq_n_83,rs_rreq_n_84,rs_rreq_n_85,rs_rreq_n_86,rs_rreq_n_87,rs_rreq_n_88,rs_rreq_n_89,rs_rreq_n_90,rs_rreq_n_91,rs_rreq_n_92,rs_rreq_n_93,rs_rreq_n_94,rs_rreq_n_95,rs_rreq_n_96,rs_rreq_n_97,rs_rreq_n_98,rs_rreq_n_99,rs_rreq_n_100,rs_rreq_n_101,rs_rreq_n_102,rs_rreq_n_103,rs_rreq_n_104,rs_rreq_n_105,rs_rreq_n_106,rs_rreq_n_107,rs_rreq_n_108,rs_rreq_n_109,rs_rreq_n_110,rs_rreq_n_111,rs_rreq_n_112,rs_rreq_n_113,rs_rreq_n_114,rs_rreq_n_115,rs_rreq_n_116,rs_rreq_n_117,rs_rreq_n_118,rs_rreq_n_119,rs_rreq_n_120,rs_rreq_n_121,rs_rreq_n_122,rs_rreq_n_123,rs_rreq_n_124,rs_rreq_n_125,rs_rreq_n_126,rs_rreq_n_127,rs_rreq_n_128,rs_rreq_n_129,rs_rreq_n_130,rs_rreq_n_131,rs_rreq_n_132,rs_rreq_n_133,rs_rreq_n_134,rs_rreq_n_135,rs_rreq_n_136,rs_rreq_n_137,rs_rreq_n_138,rs_rreq_n_139}),
        .S({\end_addr[5]_i_2_n_2 ,\end_addr[5]_i_3_n_2 ,\end_addr[5]_i_4_n_2 ,\end_addr[5]_i_5_n_2 }),
        .SR(SR),
        .ap_clk(ap_clk),
        .\could_multi_bursts.loop_cnt_reg[2] (rs_rreq_n_143),
        .\data_p1_reg[12]_0 (rs_rreq_n_141),
        .\data_p2_reg[78]_0 (D),
        .\end_addr_reg[13] ({\end_addr[13]_i_2_n_2 ,\end_addr[13]_i_3_n_2 ,\end_addr[13]_i_4_n_2 ,\end_addr[13]_i_5_n_2 }),
        .\end_addr_reg[17] ({\end_addr[17]_i_2_n_2 ,\end_addr[17]_i_3_n_2 ,\end_addr[17]_i_4_n_2 ,\end_addr[17]_i_5_n_2 }),
        .\end_addr_reg[21] ({\end_addr[21]_i_2_n_2 ,\end_addr[21]_i_3_n_2 ,\end_addr[21]_i_4_n_2 ,\end_addr[21]_i_5_n_2 }),
        .\end_addr_reg[25] ({\end_addr[25]_i_2_n_2 ,\end_addr[25]_i_3_n_2 ,\end_addr[25]_i_4_n_2 ,\end_addr[25]_i_5_n_2 }),
        .\end_addr_reg[29] ({\end_addr[29]_i_2_n_2 ,\end_addr[29]_i_3_n_2 ,\end_addr[29]_i_4_n_2 ,\end_addr[29]_i_5_n_2 }),
        .\end_addr_reg[33] ({\end_addr[33]_i_2_n_2 ,\end_addr[33]_i_3_n_2 }),
        .\end_addr_reg[9] ({\end_addr[9]_i_2_n_2 ,\end_addr[9]_i_3_n_2 ,\end_addr[9]_i_4_n_2 ,\end_addr[9]_i_5_n_2 }),
        .rreq_handling_reg(rs_rreq_n_144),
        .rreq_handling_reg_0(rreq_handling_reg_n_2),
        .rreq_handling_reg_1(fifo_rctl_n_58),
        .s_ready_t_reg_0(ARREADY_Dummy),
        .s_ready_t_reg_1(fifo_rctl_n_56),
        .\sect_cnt[51]_i_3 (\could_multi_bursts.loop_cnt_reg [2:1]),
        .\sect_cnt[51]_i_3_0 ({\sect_len_buf_reg_n_2_[8] ,\sect_len_buf_reg_n_2_[7] }),
        .\sect_cnt_reg[0] (\sect_cnt_reg_n_2_[0] ),
        .\state_reg[0]_0 (rreq_valid),
        .\state_reg[0]_1 (fifo_rctl_n_59));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sect_addr_buf[10]_i_1 
       (.I0(first_sect),
        .I1(\start_addr_reg_n_2_[10] ),
        .O(sect_addr[10]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sect_addr_buf[11]_i_2 
       (.I0(first_sect),
        .I1(\start_addr_reg_n_2_[11] ),
        .O(sect_addr[11]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[12]_i_1 
       (.I0(p_0_in_0[0]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[0] ),
        .O(sect_addr[12]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[13]_i_1 
       (.I0(p_0_in_0[1]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[1] ),
        .O(sect_addr[13]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[14]_i_1 
       (.I0(p_0_in_0[2]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[2] ),
        .O(sect_addr[14]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[15]_i_1 
       (.I0(p_0_in_0[3]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[3] ),
        .O(sect_addr[15]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[16]_i_1 
       (.I0(p_0_in_0[4]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[4] ),
        .O(sect_addr[16]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[17]_i_1 
       (.I0(p_0_in_0[5]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[5] ),
        .O(sect_addr[17]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[18]_i_1 
       (.I0(p_0_in_0[6]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[6] ),
        .O(sect_addr[18]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[19]_i_1 
       (.I0(p_0_in_0[7]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[7] ),
        .O(sect_addr[19]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[20]_i_1 
       (.I0(p_0_in_0[8]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[8] ),
        .O(sect_addr[20]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[21]_i_1 
       (.I0(p_0_in_0[9]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[9] ),
        .O(sect_addr[21]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[22]_i_1 
       (.I0(p_0_in_0[10]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[10] ),
        .O(sect_addr[22]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[23]_i_1 
       (.I0(p_0_in_0[11]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[11] ),
        .O(sect_addr[23]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[24]_i_1 
       (.I0(p_0_in_0[12]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[12] ),
        .O(sect_addr[24]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[25]_i_1 
       (.I0(p_0_in_0[13]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[13] ),
        .O(sect_addr[25]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[26]_i_1 
       (.I0(p_0_in_0[14]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[14] ),
        .O(sect_addr[26]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[27]_i_1 
       (.I0(p_0_in_0[15]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[15] ),
        .O(sect_addr[27]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[28]_i_1 
       (.I0(p_0_in_0[16]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[16] ),
        .O(sect_addr[28]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[29]_i_1 
       (.I0(p_0_in_0[17]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[17] ),
        .O(sect_addr[29]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sect_addr_buf[2]_i_1 
       (.I0(first_sect),
        .I1(\start_addr_reg_n_2_[2] ),
        .O(sect_addr[2]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[30]_i_1 
       (.I0(p_0_in_0[18]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[18] ),
        .O(sect_addr[30]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[31]_i_1 
       (.I0(p_0_in_0[19]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[19] ),
        .O(sect_addr[31]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[32]_i_1 
       (.I0(p_0_in_0[20]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[20] ),
        .O(sect_addr[32]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[33]_i_1 
       (.I0(p_0_in_0[21]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[21] ),
        .O(sect_addr[33]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[34]_i_1 
       (.I0(p_0_in_0[22]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[22] ),
        .O(sect_addr[34]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[35]_i_1 
       (.I0(p_0_in_0[23]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[23] ),
        .O(sect_addr[35]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[36]_i_1 
       (.I0(p_0_in_0[24]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[24] ),
        .O(sect_addr[36]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[37]_i_1 
       (.I0(p_0_in_0[25]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[25] ),
        .O(sect_addr[37]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[38]_i_1 
       (.I0(p_0_in_0[26]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[26] ),
        .O(sect_addr[38]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[39]_i_1 
       (.I0(p_0_in_0[27]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[27] ),
        .O(sect_addr[39]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sect_addr_buf[3]_i_1 
       (.I0(first_sect),
        .I1(\start_addr_reg_n_2_[3] ),
        .O(sect_addr[3]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[40]_i_1 
       (.I0(p_0_in_0[28]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[28] ),
        .O(sect_addr[40]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[41]_i_1 
       (.I0(p_0_in_0[29]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[29] ),
        .O(sect_addr[41]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[42]_i_1 
       (.I0(p_0_in_0[30]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[30] ),
        .O(sect_addr[42]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[43]_i_1 
       (.I0(p_0_in_0[31]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[31] ),
        .O(sect_addr[43]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[44]_i_1 
       (.I0(p_0_in_0[32]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[32] ),
        .O(sect_addr[44]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[45]_i_1 
       (.I0(p_0_in_0[33]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[33] ),
        .O(sect_addr[45]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[46]_i_1 
       (.I0(p_0_in_0[34]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[34] ),
        .O(sect_addr[46]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[47]_i_1 
       (.I0(p_0_in_0[35]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[35] ),
        .O(sect_addr[47]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[48]_i_1 
       (.I0(p_0_in_0[36]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[36] ),
        .O(sect_addr[48]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[49]_i_1 
       (.I0(p_0_in_0[37]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[37] ),
        .O(sect_addr[49]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sect_addr_buf[4]_i_1 
       (.I0(first_sect),
        .I1(\start_addr_reg_n_2_[4] ),
        .O(sect_addr[4]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[50]_i_1 
       (.I0(p_0_in_0[38]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[38] ),
        .O(sect_addr[50]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[51]_i_1 
       (.I0(p_0_in_0[39]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[39] ),
        .O(sect_addr[51]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[52]_i_1 
       (.I0(p_0_in_0[40]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[40] ),
        .O(sect_addr[52]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[53]_i_1 
       (.I0(p_0_in_0[41]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[41] ),
        .O(sect_addr[53]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[54]_i_1 
       (.I0(p_0_in_0[42]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[42] ),
        .O(sect_addr[54]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[55]_i_1 
       (.I0(p_0_in_0[43]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[43] ),
        .O(sect_addr[55]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[56]_i_1 
       (.I0(p_0_in_0[44]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[44] ),
        .O(sect_addr[56]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[57]_i_1 
       (.I0(p_0_in_0[45]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[45] ),
        .O(sect_addr[57]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[58]_i_1 
       (.I0(p_0_in_0[46]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[46] ),
        .O(sect_addr[58]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[59]_i_1 
       (.I0(p_0_in_0[47]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[47] ),
        .O(sect_addr[59]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sect_addr_buf[5]_i_1 
       (.I0(first_sect),
        .I1(\start_addr_reg_n_2_[5] ),
        .O(sect_addr[5]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[60]_i_1 
       (.I0(p_0_in_0[48]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[48] ),
        .O(sect_addr[60]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[61]_i_1 
       (.I0(p_0_in_0[49]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[49] ),
        .O(sect_addr[61]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[62]_i_1 
       (.I0(p_0_in_0[50]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[50] ),
        .O(sect_addr[62]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \sect_addr_buf[63]_i_2 
       (.I0(p_0_in_0[51]),
        .I1(first_sect),
        .I2(\sect_cnt_reg_n_2_[51] ),
        .O(sect_addr[63]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sect_addr_buf[6]_i_1 
       (.I0(first_sect),
        .I1(\start_addr_reg_n_2_[6] ),
        .O(sect_addr[6]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sect_addr_buf[7]_i_1 
       (.I0(first_sect),
        .I1(\start_addr_reg_n_2_[7] ),
        .O(sect_addr[7]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sect_addr_buf[8]_i_1 
       (.I0(first_sect),
        .I1(\start_addr_reg_n_2_[8] ),
        .O(sect_addr[8]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sect_addr_buf[9]_i_1 
       (.I0(first_sect),
        .I1(\start_addr_reg_n_2_[9] ),
        .O(sect_addr[9]));
  FDRE \sect_addr_buf_reg[10] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[10]),
        .Q(\sect_addr_buf_reg_n_2_[10] ),
        .R(fifo_rctl_n_64));
  FDRE \sect_addr_buf_reg[11] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[11]),
        .Q(\sect_addr_buf_reg_n_2_[11] ),
        .R(fifo_rctl_n_64));
  FDRE \sect_addr_buf_reg[12] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[12]),
        .Q(\sect_addr_buf_reg_n_2_[12] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[13] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[13]),
        .Q(\sect_addr_buf_reg_n_2_[13] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[14] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[14]),
        .Q(\sect_addr_buf_reg_n_2_[14] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[15] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[15]),
        .Q(\sect_addr_buf_reg_n_2_[15] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[16] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[16]),
        .Q(\sect_addr_buf_reg_n_2_[16] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[17] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[17]),
        .Q(\sect_addr_buf_reg_n_2_[17] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[18] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[18]),
        .Q(\sect_addr_buf_reg_n_2_[18] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[19] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[19]),
        .Q(\sect_addr_buf_reg_n_2_[19] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[20] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[20]),
        .Q(\sect_addr_buf_reg_n_2_[20] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[21] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[21]),
        .Q(\sect_addr_buf_reg_n_2_[21] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[22] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[22]),
        .Q(\sect_addr_buf_reg_n_2_[22] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[23] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[23]),
        .Q(\sect_addr_buf_reg_n_2_[23] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[24] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[24]),
        .Q(\sect_addr_buf_reg_n_2_[24] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[25] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[25]),
        .Q(\sect_addr_buf_reg_n_2_[25] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[26] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[26]),
        .Q(\sect_addr_buf_reg_n_2_[26] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[27] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[27]),
        .Q(\sect_addr_buf_reg_n_2_[27] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[28] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[28]),
        .Q(\sect_addr_buf_reg_n_2_[28] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[29] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[29]),
        .Q(\sect_addr_buf_reg_n_2_[29] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[2] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[2]),
        .Q(\sect_addr_buf_reg_n_2_[2] ),
        .R(fifo_rctl_n_64));
  FDRE \sect_addr_buf_reg[30] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[30]),
        .Q(\sect_addr_buf_reg_n_2_[30] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[31] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[31]),
        .Q(\sect_addr_buf_reg_n_2_[31] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[32] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[32]),
        .Q(\sect_addr_buf_reg_n_2_[32] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[33] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[33]),
        .Q(\sect_addr_buf_reg_n_2_[33] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[34] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[34]),
        .Q(\sect_addr_buf_reg_n_2_[34] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[35] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[35]),
        .Q(\sect_addr_buf_reg_n_2_[35] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[36] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[36]),
        .Q(\sect_addr_buf_reg_n_2_[36] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[37] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[37]),
        .Q(\sect_addr_buf_reg_n_2_[37] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[38] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[38]),
        .Q(\sect_addr_buf_reg_n_2_[38] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[39] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[39]),
        .Q(\sect_addr_buf_reg_n_2_[39] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[3] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[3]),
        .Q(\sect_addr_buf_reg_n_2_[3] ),
        .R(fifo_rctl_n_64));
  FDRE \sect_addr_buf_reg[40] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[40]),
        .Q(\sect_addr_buf_reg_n_2_[40] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[41] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[41]),
        .Q(\sect_addr_buf_reg_n_2_[41] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[42] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[42]),
        .Q(\sect_addr_buf_reg_n_2_[42] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[43] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[43]),
        .Q(\sect_addr_buf_reg_n_2_[43] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[44] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[44]),
        .Q(\sect_addr_buf_reg_n_2_[44] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[45] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[45]),
        .Q(\sect_addr_buf_reg_n_2_[45] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[46] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[46]),
        .Q(\sect_addr_buf_reg_n_2_[46] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[47] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[47]),
        .Q(\sect_addr_buf_reg_n_2_[47] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[48] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[48]),
        .Q(\sect_addr_buf_reg_n_2_[48] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[49] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[49]),
        .Q(\sect_addr_buf_reg_n_2_[49] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[4] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[4]),
        .Q(\sect_addr_buf_reg_n_2_[4] ),
        .R(fifo_rctl_n_64));
  FDRE \sect_addr_buf_reg[50] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[50]),
        .Q(\sect_addr_buf_reg_n_2_[50] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[51] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[51]),
        .Q(\sect_addr_buf_reg_n_2_[51] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[52] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[52]),
        .Q(\sect_addr_buf_reg_n_2_[52] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[53] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[53]),
        .Q(\sect_addr_buf_reg_n_2_[53] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[54] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[54]),
        .Q(\sect_addr_buf_reg_n_2_[54] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[55] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[55]),
        .Q(\sect_addr_buf_reg_n_2_[55] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[56] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[56]),
        .Q(\sect_addr_buf_reg_n_2_[56] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[57] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[57]),
        .Q(\sect_addr_buf_reg_n_2_[57] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[58] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[58]),
        .Q(\sect_addr_buf_reg_n_2_[58] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[59] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[59]),
        .Q(\sect_addr_buf_reg_n_2_[59] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[5] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[5]),
        .Q(\sect_addr_buf_reg_n_2_[5] ),
        .R(fifo_rctl_n_64));
  FDRE \sect_addr_buf_reg[60] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[60]),
        .Q(\sect_addr_buf_reg_n_2_[60] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[61] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[61]),
        .Q(\sect_addr_buf_reg_n_2_[61] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[62] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[62]),
        .Q(\sect_addr_buf_reg_n_2_[62] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[63] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[63]),
        .Q(\sect_addr_buf_reg_n_2_[63] ),
        .R(SR));
  FDRE \sect_addr_buf_reg[6] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[6]),
        .Q(\sect_addr_buf_reg_n_2_[6] ),
        .R(fifo_rctl_n_64));
  FDRE \sect_addr_buf_reg[7] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[7]),
        .Q(\sect_addr_buf_reg_n_2_[7] ),
        .R(fifo_rctl_n_64));
  FDRE \sect_addr_buf_reg[8] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[8]),
        .Q(\sect_addr_buf_reg_n_2_[8] ),
        .R(fifo_rctl_n_64));
  FDRE \sect_addr_buf_reg[9] 
       (.C(ap_clk),
        .CE(p_14_in),
        .D(sect_addr[9]),
        .Q(\sect_addr_buf_reg_n_2_[9] ),
        .R(fifo_rctl_n_64));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sect_cnt0_carry
       (.CI(1'b0),
        .CO({sect_cnt0_carry_n_2,sect_cnt0_carry_n_3,sect_cnt0_carry_n_4,sect_cnt0_carry_n_5}),
        .CYINIT(\sect_cnt_reg_n_2_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sect_cnt0[4:1]),
        .S({\sect_cnt_reg_n_2_[4] ,\sect_cnt_reg_n_2_[3] ,\sect_cnt_reg_n_2_[2] ,\sect_cnt_reg_n_2_[1] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sect_cnt0_carry__0
       (.CI(sect_cnt0_carry_n_2),
        .CO({sect_cnt0_carry__0_n_2,sect_cnt0_carry__0_n_3,sect_cnt0_carry__0_n_4,sect_cnt0_carry__0_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sect_cnt0[8:5]),
        .S({\sect_cnt_reg_n_2_[8] ,\sect_cnt_reg_n_2_[7] ,\sect_cnt_reg_n_2_[6] ,\sect_cnt_reg_n_2_[5] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sect_cnt0_carry__1
       (.CI(sect_cnt0_carry__0_n_2),
        .CO({sect_cnt0_carry__1_n_2,sect_cnt0_carry__1_n_3,sect_cnt0_carry__1_n_4,sect_cnt0_carry__1_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sect_cnt0[12:9]),
        .S({\sect_cnt_reg_n_2_[12] ,\sect_cnt_reg_n_2_[11] ,\sect_cnt_reg_n_2_[10] ,\sect_cnt_reg_n_2_[9] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sect_cnt0_carry__10
       (.CI(sect_cnt0_carry__9_n_2),
        .CO({sect_cnt0_carry__10_n_2,sect_cnt0_carry__10_n_3,sect_cnt0_carry__10_n_4,sect_cnt0_carry__10_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sect_cnt0[48:45]),
        .S({\sect_cnt_reg_n_2_[48] ,\sect_cnt_reg_n_2_[47] ,\sect_cnt_reg_n_2_[46] ,\sect_cnt_reg_n_2_[45] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sect_cnt0_carry__11
       (.CI(sect_cnt0_carry__10_n_2),
        .CO({NLW_sect_cnt0_carry__11_CO_UNCONNECTED[3:2],sect_cnt0_carry__11_n_4,sect_cnt0_carry__11_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_sect_cnt0_carry__11_O_UNCONNECTED[3],sect_cnt0[51:49]}),
        .S({1'b0,\sect_cnt_reg_n_2_[51] ,\sect_cnt_reg_n_2_[50] ,\sect_cnt_reg_n_2_[49] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sect_cnt0_carry__2
       (.CI(sect_cnt0_carry__1_n_2),
        .CO({sect_cnt0_carry__2_n_2,sect_cnt0_carry__2_n_3,sect_cnt0_carry__2_n_4,sect_cnt0_carry__2_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sect_cnt0[16:13]),
        .S({\sect_cnt_reg_n_2_[16] ,\sect_cnt_reg_n_2_[15] ,\sect_cnt_reg_n_2_[14] ,\sect_cnt_reg_n_2_[13] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sect_cnt0_carry__3
       (.CI(sect_cnt0_carry__2_n_2),
        .CO({sect_cnt0_carry__3_n_2,sect_cnt0_carry__3_n_3,sect_cnt0_carry__3_n_4,sect_cnt0_carry__3_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sect_cnt0[20:17]),
        .S({\sect_cnt_reg_n_2_[20] ,\sect_cnt_reg_n_2_[19] ,\sect_cnt_reg_n_2_[18] ,\sect_cnt_reg_n_2_[17] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sect_cnt0_carry__4
       (.CI(sect_cnt0_carry__3_n_2),
        .CO({sect_cnt0_carry__4_n_2,sect_cnt0_carry__4_n_3,sect_cnt0_carry__4_n_4,sect_cnt0_carry__4_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sect_cnt0[24:21]),
        .S({\sect_cnt_reg_n_2_[24] ,\sect_cnt_reg_n_2_[23] ,\sect_cnt_reg_n_2_[22] ,\sect_cnt_reg_n_2_[21] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sect_cnt0_carry__5
       (.CI(sect_cnt0_carry__4_n_2),
        .CO({sect_cnt0_carry__5_n_2,sect_cnt0_carry__5_n_3,sect_cnt0_carry__5_n_4,sect_cnt0_carry__5_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sect_cnt0[28:25]),
        .S({\sect_cnt_reg_n_2_[28] ,\sect_cnt_reg_n_2_[27] ,\sect_cnt_reg_n_2_[26] ,\sect_cnt_reg_n_2_[25] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sect_cnt0_carry__6
       (.CI(sect_cnt0_carry__5_n_2),
        .CO({sect_cnt0_carry__6_n_2,sect_cnt0_carry__6_n_3,sect_cnt0_carry__6_n_4,sect_cnt0_carry__6_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sect_cnt0[32:29]),
        .S({\sect_cnt_reg_n_2_[32] ,\sect_cnt_reg_n_2_[31] ,\sect_cnt_reg_n_2_[30] ,\sect_cnt_reg_n_2_[29] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sect_cnt0_carry__7
       (.CI(sect_cnt0_carry__6_n_2),
        .CO({sect_cnt0_carry__7_n_2,sect_cnt0_carry__7_n_3,sect_cnt0_carry__7_n_4,sect_cnt0_carry__7_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sect_cnt0[36:33]),
        .S({\sect_cnt_reg_n_2_[36] ,\sect_cnt_reg_n_2_[35] ,\sect_cnt_reg_n_2_[34] ,\sect_cnt_reg_n_2_[33] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sect_cnt0_carry__8
       (.CI(sect_cnt0_carry__7_n_2),
        .CO({sect_cnt0_carry__8_n_2,sect_cnt0_carry__8_n_3,sect_cnt0_carry__8_n_4,sect_cnt0_carry__8_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sect_cnt0[40:37]),
        .S({\sect_cnt_reg_n_2_[40] ,\sect_cnt_reg_n_2_[39] ,\sect_cnt_reg_n_2_[38] ,\sect_cnt_reg_n_2_[37] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sect_cnt0_carry__9
       (.CI(sect_cnt0_carry__8_n_2),
        .CO({sect_cnt0_carry__9_n_2,sect_cnt0_carry__9_n_3,sect_cnt0_carry__9_n_4,sect_cnt0_carry__9_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(sect_cnt0[44:41]),
        .S({\sect_cnt_reg_n_2_[44] ,\sect_cnt_reg_n_2_[43] ,\sect_cnt_reg_n_2_[42] ,\sect_cnt_reg_n_2_[41] }));
  FDRE \sect_cnt_reg[0] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(rs_rreq_n_141),
        .Q(\sect_cnt_reg_n_2_[0] ),
        .R(SR));
  FDRE \sect_cnt_reg[10] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_46),
        .Q(\sect_cnt_reg_n_2_[10] ),
        .R(SR));
  FDRE \sect_cnt_reg[11] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_45),
        .Q(\sect_cnt_reg_n_2_[11] ),
        .R(SR));
  FDRE \sect_cnt_reg[12] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_44),
        .Q(\sect_cnt_reg_n_2_[12] ),
        .R(SR));
  FDRE \sect_cnt_reg[13] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_43),
        .Q(\sect_cnt_reg_n_2_[13] ),
        .R(SR));
  FDRE \sect_cnt_reg[14] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_42),
        .Q(\sect_cnt_reg_n_2_[14] ),
        .R(SR));
  FDRE \sect_cnt_reg[15] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_41),
        .Q(\sect_cnt_reg_n_2_[15] ),
        .R(SR));
  FDRE \sect_cnt_reg[16] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_40),
        .Q(\sect_cnt_reg_n_2_[16] ),
        .R(SR));
  FDRE \sect_cnt_reg[17] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_39),
        .Q(\sect_cnt_reg_n_2_[17] ),
        .R(SR));
  FDRE \sect_cnt_reg[18] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_38),
        .Q(\sect_cnt_reg_n_2_[18] ),
        .R(SR));
  FDRE \sect_cnt_reg[19] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_37),
        .Q(\sect_cnt_reg_n_2_[19] ),
        .R(SR));
  FDRE \sect_cnt_reg[1] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_55),
        .Q(\sect_cnt_reg_n_2_[1] ),
        .R(SR));
  FDRE \sect_cnt_reg[20] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_36),
        .Q(\sect_cnt_reg_n_2_[20] ),
        .R(SR));
  FDRE \sect_cnt_reg[21] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_35),
        .Q(\sect_cnt_reg_n_2_[21] ),
        .R(SR));
  FDRE \sect_cnt_reg[22] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_34),
        .Q(\sect_cnt_reg_n_2_[22] ),
        .R(SR));
  FDRE \sect_cnt_reg[23] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_33),
        .Q(\sect_cnt_reg_n_2_[23] ),
        .R(SR));
  FDRE \sect_cnt_reg[24] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_32),
        .Q(\sect_cnt_reg_n_2_[24] ),
        .R(SR));
  FDRE \sect_cnt_reg[25] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_31),
        .Q(\sect_cnt_reg_n_2_[25] ),
        .R(SR));
  FDRE \sect_cnt_reg[26] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_30),
        .Q(\sect_cnt_reg_n_2_[26] ),
        .R(SR));
  FDRE \sect_cnt_reg[27] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_29),
        .Q(\sect_cnt_reg_n_2_[27] ),
        .R(SR));
  FDRE \sect_cnt_reg[28] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_28),
        .Q(\sect_cnt_reg_n_2_[28] ),
        .R(SR));
  FDRE \sect_cnt_reg[29] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_27),
        .Q(\sect_cnt_reg_n_2_[29] ),
        .R(SR));
  FDRE \sect_cnt_reg[2] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_54),
        .Q(\sect_cnt_reg_n_2_[2] ),
        .R(SR));
  FDRE \sect_cnt_reg[30] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_26),
        .Q(\sect_cnt_reg_n_2_[30] ),
        .R(SR));
  FDRE \sect_cnt_reg[31] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_25),
        .Q(\sect_cnt_reg_n_2_[31] ),
        .R(SR));
  FDRE \sect_cnt_reg[32] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_24),
        .Q(\sect_cnt_reg_n_2_[32] ),
        .R(SR));
  FDRE \sect_cnt_reg[33] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_23),
        .Q(\sect_cnt_reg_n_2_[33] ),
        .R(SR));
  FDRE \sect_cnt_reg[34] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_22),
        .Q(\sect_cnt_reg_n_2_[34] ),
        .R(SR));
  FDRE \sect_cnt_reg[35] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_21),
        .Q(\sect_cnt_reg_n_2_[35] ),
        .R(SR));
  FDRE \sect_cnt_reg[36] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_20),
        .Q(\sect_cnt_reg_n_2_[36] ),
        .R(SR));
  FDRE \sect_cnt_reg[37] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_19),
        .Q(\sect_cnt_reg_n_2_[37] ),
        .R(SR));
  FDRE \sect_cnt_reg[38] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_18),
        .Q(\sect_cnt_reg_n_2_[38] ),
        .R(SR));
  FDRE \sect_cnt_reg[39] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_17),
        .Q(\sect_cnt_reg_n_2_[39] ),
        .R(SR));
  FDRE \sect_cnt_reg[3] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_53),
        .Q(\sect_cnt_reg_n_2_[3] ),
        .R(SR));
  FDRE \sect_cnt_reg[40] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_16),
        .Q(\sect_cnt_reg_n_2_[40] ),
        .R(SR));
  FDRE \sect_cnt_reg[41] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_15),
        .Q(\sect_cnt_reg_n_2_[41] ),
        .R(SR));
  FDRE \sect_cnt_reg[42] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_14),
        .Q(\sect_cnt_reg_n_2_[42] ),
        .R(SR));
  FDRE \sect_cnt_reg[43] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_13),
        .Q(\sect_cnt_reg_n_2_[43] ),
        .R(SR));
  FDRE \sect_cnt_reg[44] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_12),
        .Q(\sect_cnt_reg_n_2_[44] ),
        .R(SR));
  FDRE \sect_cnt_reg[45] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_11),
        .Q(\sect_cnt_reg_n_2_[45] ),
        .R(SR));
  FDRE \sect_cnt_reg[46] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_10),
        .Q(\sect_cnt_reg_n_2_[46] ),
        .R(SR));
  FDRE \sect_cnt_reg[47] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_9),
        .Q(\sect_cnt_reg_n_2_[47] ),
        .R(SR));
  FDRE \sect_cnt_reg[48] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_8),
        .Q(\sect_cnt_reg_n_2_[48] ),
        .R(SR));
  FDRE \sect_cnt_reg[49] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_7),
        .Q(\sect_cnt_reg_n_2_[49] ),
        .R(SR));
  FDRE \sect_cnt_reg[4] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_52),
        .Q(\sect_cnt_reg_n_2_[4] ),
        .R(SR));
  FDRE \sect_cnt_reg[50] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_6),
        .Q(\sect_cnt_reg_n_2_[50] ),
        .R(SR));
  FDRE \sect_cnt_reg[51] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_5),
        .Q(\sect_cnt_reg_n_2_[51] ),
        .R(SR));
  FDRE \sect_cnt_reg[5] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_51),
        .Q(\sect_cnt_reg_n_2_[5] ),
        .R(SR));
  FDRE \sect_cnt_reg[6] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_50),
        .Q(\sect_cnt_reg_n_2_[6] ),
        .R(SR));
  FDRE \sect_cnt_reg[7] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_49),
        .Q(\sect_cnt_reg_n_2_[7] ),
        .R(SR));
  FDRE \sect_cnt_reg[8] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_48),
        .Q(\sect_cnt_reg_n_2_[8] ),
        .R(SR));
  FDRE \sect_cnt_reg[9] 
       (.C(ap_clk),
        .CE(rs_rreq_n_142),
        .D(fifo_rctl_n_47),
        .Q(\sect_cnt_reg_n_2_[9] ),
        .R(SR));
  FDRE \sect_len_buf_reg[0] 
       (.C(ap_clk),
        .CE(fifo_rctl_n_65),
        .D(fifo_rctl_n_73),
        .Q(\sect_len_buf_reg_n_2_[0] ),
        .R(SR));
  FDRE \sect_len_buf_reg[1] 
       (.C(ap_clk),
        .CE(fifo_rctl_n_65),
        .D(fifo_rctl_n_74),
        .Q(\sect_len_buf_reg_n_2_[1] ),
        .R(SR));
  FDRE \sect_len_buf_reg[2] 
       (.C(ap_clk),
        .CE(fifo_rctl_n_65),
        .D(fifo_rctl_n_75),
        .Q(\sect_len_buf_reg_n_2_[2] ),
        .R(SR));
  FDRE \sect_len_buf_reg[3] 
       (.C(ap_clk),
        .CE(fifo_rctl_n_65),
        .D(fifo_rctl_n_76),
        .Q(\sect_len_buf_reg_n_2_[3] ),
        .R(SR));
  FDRE \sect_len_buf_reg[4] 
       (.C(ap_clk),
        .CE(fifo_rctl_n_65),
        .D(fifo_rctl_n_77),
        .Q(\sect_len_buf_reg_n_2_[4] ),
        .R(SR));
  FDRE \sect_len_buf_reg[5] 
       (.C(ap_clk),
        .CE(fifo_rctl_n_65),
        .D(fifo_rctl_n_78),
        .Q(\sect_len_buf_reg_n_2_[5] ),
        .R(SR));
  FDRE \sect_len_buf_reg[6] 
       (.C(ap_clk),
        .CE(fifo_rctl_n_65),
        .D(fifo_rctl_n_79),
        .Q(\sect_len_buf_reg_n_2_[6] ),
        .R(SR));
  FDRE \sect_len_buf_reg[7] 
       (.C(ap_clk),
        .CE(fifo_rctl_n_65),
        .D(fifo_rctl_n_80),
        .Q(\sect_len_buf_reg_n_2_[7] ),
        .R(SR));
  FDRE \sect_len_buf_reg[8] 
       (.C(ap_clk),
        .CE(fifo_rctl_n_65),
        .D(fifo_rctl_n_81),
        .Q(\sect_len_buf_reg_n_2_[8] ),
        .R(SR));
  FDRE \sect_len_buf_reg[9] 
       (.C(ap_clk),
        .CE(fifo_rctl_n_65),
        .D(fifo_rctl_n_82),
        .Q(\sect_len_buf_reg_n_2_[9] ),
        .R(SR));
  FDRE \start_addr_reg[10] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_131),
        .Q(\start_addr_reg_n_2_[10] ),
        .R(SR));
  FDRE \start_addr_reg[11] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_130),
        .Q(\start_addr_reg_n_2_[11] ),
        .R(SR));
  FDRE \start_addr_reg[12] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_129),
        .Q(p_0_in_0[0]),
        .R(SR));
  FDRE \start_addr_reg[13] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_128),
        .Q(p_0_in_0[1]),
        .R(SR));
  FDRE \start_addr_reg[14] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_127),
        .Q(p_0_in_0[2]),
        .R(SR));
  FDRE \start_addr_reg[15] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_126),
        .Q(p_0_in_0[3]),
        .R(SR));
  FDRE \start_addr_reg[16] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_125),
        .Q(p_0_in_0[4]),
        .R(SR));
  FDRE \start_addr_reg[17] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_124),
        .Q(p_0_in_0[5]),
        .R(SR));
  FDRE \start_addr_reg[18] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_123),
        .Q(p_0_in_0[6]),
        .R(SR));
  FDRE \start_addr_reg[19] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_122),
        .Q(p_0_in_0[7]),
        .R(SR));
  FDRE \start_addr_reg[20] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_121),
        .Q(p_0_in_0[8]),
        .R(SR));
  FDRE \start_addr_reg[21] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_120),
        .Q(p_0_in_0[9]),
        .R(SR));
  FDRE \start_addr_reg[22] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_119),
        .Q(p_0_in_0[10]),
        .R(SR));
  FDRE \start_addr_reg[23] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_118),
        .Q(p_0_in_0[11]),
        .R(SR));
  FDRE \start_addr_reg[24] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_117),
        .Q(p_0_in_0[12]),
        .R(SR));
  FDRE \start_addr_reg[25] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_116),
        .Q(p_0_in_0[13]),
        .R(SR));
  FDRE \start_addr_reg[26] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_115),
        .Q(p_0_in_0[14]),
        .R(SR));
  FDRE \start_addr_reg[27] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_114),
        .Q(p_0_in_0[15]),
        .R(SR));
  FDRE \start_addr_reg[28] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_113),
        .Q(p_0_in_0[16]),
        .R(SR));
  FDRE \start_addr_reg[29] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_112),
        .Q(p_0_in_0[17]),
        .R(SR));
  FDRE \start_addr_reg[2] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_139),
        .Q(\start_addr_reg_n_2_[2] ),
        .R(SR));
  FDRE \start_addr_reg[30] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_111),
        .Q(p_0_in_0[18]),
        .R(SR));
  FDRE \start_addr_reg[31] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_110),
        .Q(p_0_in_0[19]),
        .R(SR));
  FDRE \start_addr_reg[32] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_109),
        .Q(p_0_in_0[20]),
        .R(SR));
  FDRE \start_addr_reg[33] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_108),
        .Q(p_0_in_0[21]),
        .R(SR));
  FDRE \start_addr_reg[34] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_107),
        .Q(p_0_in_0[22]),
        .R(SR));
  FDRE \start_addr_reg[35] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_106),
        .Q(p_0_in_0[23]),
        .R(SR));
  FDRE \start_addr_reg[36] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_105),
        .Q(p_0_in_0[24]),
        .R(SR));
  FDRE \start_addr_reg[37] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_104),
        .Q(p_0_in_0[25]),
        .R(SR));
  FDRE \start_addr_reg[38] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_103),
        .Q(p_0_in_0[26]),
        .R(SR));
  FDRE \start_addr_reg[39] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_102),
        .Q(p_0_in_0[27]),
        .R(SR));
  FDRE \start_addr_reg[3] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_138),
        .Q(\start_addr_reg_n_2_[3] ),
        .R(SR));
  FDRE \start_addr_reg[40] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_101),
        .Q(p_0_in_0[28]),
        .R(SR));
  FDRE \start_addr_reg[41] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_100),
        .Q(p_0_in_0[29]),
        .R(SR));
  FDRE \start_addr_reg[42] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_99),
        .Q(p_0_in_0[30]),
        .R(SR));
  FDRE \start_addr_reg[43] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_98),
        .Q(p_0_in_0[31]),
        .R(SR));
  FDRE \start_addr_reg[44] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_97),
        .Q(p_0_in_0[32]),
        .R(SR));
  FDRE \start_addr_reg[45] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_96),
        .Q(p_0_in_0[33]),
        .R(SR));
  FDRE \start_addr_reg[46] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_95),
        .Q(p_0_in_0[34]),
        .R(SR));
  FDRE \start_addr_reg[47] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_94),
        .Q(p_0_in_0[35]),
        .R(SR));
  FDRE \start_addr_reg[48] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_93),
        .Q(p_0_in_0[36]),
        .R(SR));
  FDRE \start_addr_reg[49] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_92),
        .Q(p_0_in_0[37]),
        .R(SR));
  FDRE \start_addr_reg[4] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_137),
        .Q(\start_addr_reg_n_2_[4] ),
        .R(SR));
  FDRE \start_addr_reg[50] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_91),
        .Q(p_0_in_0[38]),
        .R(SR));
  FDRE \start_addr_reg[51] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_90),
        .Q(p_0_in_0[39]),
        .R(SR));
  FDRE \start_addr_reg[52] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_89),
        .Q(p_0_in_0[40]),
        .R(SR));
  FDRE \start_addr_reg[53] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_88),
        .Q(p_0_in_0[41]),
        .R(SR));
  FDRE \start_addr_reg[54] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_87),
        .Q(p_0_in_0[42]),
        .R(SR));
  FDRE \start_addr_reg[55] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_86),
        .Q(p_0_in_0[43]),
        .R(SR));
  FDRE \start_addr_reg[56] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_85),
        .Q(p_0_in_0[44]),
        .R(SR));
  FDRE \start_addr_reg[57] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_84),
        .Q(p_0_in_0[45]),
        .R(SR));
  FDRE \start_addr_reg[58] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_83),
        .Q(p_0_in_0[46]),
        .R(SR));
  FDRE \start_addr_reg[59] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_82),
        .Q(p_0_in_0[47]),
        .R(SR));
  FDRE \start_addr_reg[5] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_136),
        .Q(\start_addr_reg_n_2_[5] ),
        .R(SR));
  FDRE \start_addr_reg[60] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_81),
        .Q(p_0_in_0[48]),
        .R(SR));
  FDRE \start_addr_reg[61] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_80),
        .Q(p_0_in_0[49]),
        .R(SR));
  FDRE \start_addr_reg[62] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_79),
        .Q(p_0_in_0[50]),
        .R(SR));
  FDRE \start_addr_reg[63] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_78),
        .Q(p_0_in_0[51]),
        .R(SR));
  FDRE \start_addr_reg[6] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_135),
        .Q(\start_addr_reg_n_2_[6] ),
        .R(SR));
  FDRE \start_addr_reg[7] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_134),
        .Q(\start_addr_reg_n_2_[7] ),
        .R(SR));
  FDRE \start_addr_reg[8] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_133),
        .Q(\start_addr_reg_n_2_[8] ),
        .R(SR));
  FDRE \start_addr_reg[9] 
       (.C(ap_clk),
        .CE(next_rreq),
        .D(rs_rreq_n_132),
        .Q(\start_addr_reg_n_2_[9] ),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "read_romcode_BUS0_m_axi_reg_slice" *) 
module design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_reg_slice
   (s_ready_t_reg_0,
    D,
    Q,
    \state_reg[0]_0 ,
    \data_p1_reg[12]_0 ,
    E,
    \could_multi_bursts.loop_cnt_reg[2] ,
    rreq_handling_reg,
    SR,
    ap_clk,
    S,
    \end_addr_reg[9] ,
    \end_addr_reg[13] ,
    \end_addr_reg[17] ,
    \end_addr_reg[21] ,
    \end_addr_reg[25] ,
    \end_addr_reg[29] ,
    \end_addr_reg[33] ,
    s_ready_t_reg_1,
    ARVALID_Dummy,
    \state_reg[0]_1 ,
    \sect_cnt_reg[0] ,
    rreq_handling_reg_0,
    rreq_handling_reg_1,
    \sect_cnt[51]_i_3 ,
    \sect_cnt[51]_i_3_0 ,
    \data_p2_reg[78]_0 ,
    CO);
  output s_ready_t_reg_0;
  output [61:0]D;
  output [74:0]Q;
  output [0:0]\state_reg[0]_0 ;
  output [0:0]\data_p1_reg[12]_0 ;
  output [0:0]E;
  output \could_multi_bursts.loop_cnt_reg[2] ;
  output rreq_handling_reg;
  input [0:0]SR;
  input ap_clk;
  input [3:0]S;
  input [3:0]\end_addr_reg[9] ;
  input [3:0]\end_addr_reg[13] ;
  input [3:0]\end_addr_reg[17] ;
  input [3:0]\end_addr_reg[21] ;
  input [3:0]\end_addr_reg[25] ;
  input [3:0]\end_addr_reg[29] ;
  input [1:0]\end_addr_reg[33] ;
  input s_ready_t_reg_1;
  input ARVALID_Dummy;
  input \state_reg[0]_1 ;
  input [0:0]\sect_cnt_reg[0] ;
  input rreq_handling_reg_0;
  input rreq_handling_reg_1;
  input [1:0]\sect_cnt[51]_i_3 ;
  input [1:0]\sect_cnt[51]_i_3_0 ;
  input [74:0]\data_p2_reg[78]_0 ;
  input [0:0]CO;

  wire ARVALID_Dummy;
  wire [0:0]CO;
  wire [61:0]D;
  wire [0:0]E;
  wire [74:0]Q;
  wire [3:0]S;
  wire [0:0]SR;
  wire ap_clk;
  wire \could_multi_bursts.loop_cnt_reg[2] ;
  wire \data_p1[10]_i_1_n_2 ;
  wire \data_p1[11]_i_1_n_2 ;
  wire \data_p1[12]_i_1_n_2 ;
  wire \data_p1[13]_i_1_n_2 ;
  wire \data_p1[14]_i_1_n_2 ;
  wire \data_p1[15]_i_1_n_2 ;
  wire \data_p1[16]_i_1_n_2 ;
  wire \data_p1[17]_i_1_n_2 ;
  wire \data_p1[18]_i_1_n_2 ;
  wire \data_p1[19]_i_1_n_2 ;
  wire \data_p1[20]_i_1_n_2 ;
  wire \data_p1[21]_i_1_n_2 ;
  wire \data_p1[22]_i_1_n_2 ;
  wire \data_p1[23]_i_1_n_2 ;
  wire \data_p1[24]_i_1_n_2 ;
  wire \data_p1[25]_i_1_n_2 ;
  wire \data_p1[26]_i_1_n_2 ;
  wire \data_p1[27]_i_1_n_2 ;
  wire \data_p1[28]_i_1_n_2 ;
  wire \data_p1[29]_i_1_n_2 ;
  wire \data_p1[2]_i_1_n_2 ;
  wire \data_p1[30]_i_1_n_2 ;
  wire \data_p1[31]_i_1_n_2 ;
  wire \data_p1[32]_i_1_n_2 ;
  wire \data_p1[33]_i_1_n_2 ;
  wire \data_p1[34]_i_1_n_2 ;
  wire \data_p1[35]_i_1_n_2 ;
  wire \data_p1[36]_i_1_n_2 ;
  wire \data_p1[37]_i_1_n_2 ;
  wire \data_p1[38]_i_1_n_2 ;
  wire \data_p1[39]_i_1_n_2 ;
  wire \data_p1[3]_i_1_n_2 ;
  wire \data_p1[40]_i_1_n_2 ;
  wire \data_p1[41]_i_1_n_2 ;
  wire \data_p1[42]_i_1_n_2 ;
  wire \data_p1[43]_i_1_n_2 ;
  wire \data_p1[44]_i_1_n_2 ;
  wire \data_p1[45]_i_1_n_2 ;
  wire \data_p1[46]_i_1_n_2 ;
  wire \data_p1[47]_i_1_n_2 ;
  wire \data_p1[48]_i_1_n_2 ;
  wire \data_p1[49]_i_1_n_2 ;
  wire \data_p1[4]_i_1_n_2 ;
  wire \data_p1[50]_i_1_n_2 ;
  wire \data_p1[51]_i_1_n_2 ;
  wire \data_p1[52]_i_1_n_2 ;
  wire \data_p1[53]_i_1_n_2 ;
  wire \data_p1[54]_i_1_n_2 ;
  wire \data_p1[55]_i_1_n_2 ;
  wire \data_p1[56]_i_1_n_2 ;
  wire \data_p1[57]_i_1_n_2 ;
  wire \data_p1[58]_i_1_n_2 ;
  wire \data_p1[59]_i_1_n_2 ;
  wire \data_p1[5]_i_1_n_2 ;
  wire \data_p1[60]_i_1_n_2 ;
  wire \data_p1[61]_i_1_n_2 ;
  wire \data_p1[62]_i_1_n_2 ;
  wire \data_p1[63]_i_1_n_2 ;
  wire \data_p1[66]_i_1_n_2 ;
  wire \data_p1[67]_i_1_n_2 ;
  wire \data_p1[68]_i_1_n_2 ;
  wire \data_p1[69]_i_1_n_2 ;
  wire \data_p1[6]_i_1_n_2 ;
  wire \data_p1[70]_i_1_n_2 ;
  wire \data_p1[71]_i_1_n_2 ;
  wire \data_p1[72]_i_1_n_2 ;
  wire \data_p1[73]_i_1_n_2 ;
  wire \data_p1[74]_i_1_n_2 ;
  wire \data_p1[75]_i_1_n_2 ;
  wire \data_p1[76]_i_1_n_2 ;
  wire \data_p1[77]_i_1_n_2 ;
  wire \data_p1[7]_i_1_n_2 ;
  wire \data_p1[8]_i_1_n_2 ;
  wire \data_p1[95]_i_2_n_2 ;
  wire \data_p1[9]_i_1_n_2 ;
  wire [0:0]\data_p1_reg[12]_0 ;
  wire [78:2]data_p2;
  wire [74:0]\data_p2_reg[78]_0 ;
  wire [3:0]\end_addr_reg[13] ;
  wire \end_addr_reg[13]_i_1_n_2 ;
  wire \end_addr_reg[13]_i_1_n_3 ;
  wire \end_addr_reg[13]_i_1_n_4 ;
  wire \end_addr_reg[13]_i_1_n_5 ;
  wire [3:0]\end_addr_reg[17] ;
  wire \end_addr_reg[17]_i_1_n_2 ;
  wire \end_addr_reg[17]_i_1_n_3 ;
  wire \end_addr_reg[17]_i_1_n_4 ;
  wire \end_addr_reg[17]_i_1_n_5 ;
  wire [3:0]\end_addr_reg[21] ;
  wire \end_addr_reg[21]_i_1_n_2 ;
  wire \end_addr_reg[21]_i_1_n_3 ;
  wire \end_addr_reg[21]_i_1_n_4 ;
  wire \end_addr_reg[21]_i_1_n_5 ;
  wire [3:0]\end_addr_reg[25] ;
  wire \end_addr_reg[25]_i_1_n_2 ;
  wire \end_addr_reg[25]_i_1_n_3 ;
  wire \end_addr_reg[25]_i_1_n_4 ;
  wire \end_addr_reg[25]_i_1_n_5 ;
  wire [3:0]\end_addr_reg[29] ;
  wire \end_addr_reg[29]_i_1_n_2 ;
  wire \end_addr_reg[29]_i_1_n_3 ;
  wire \end_addr_reg[29]_i_1_n_4 ;
  wire \end_addr_reg[29]_i_1_n_5 ;
  wire [1:0]\end_addr_reg[33] ;
  wire \end_addr_reg[33]_i_1_n_2 ;
  wire \end_addr_reg[33]_i_1_n_3 ;
  wire \end_addr_reg[33]_i_1_n_4 ;
  wire \end_addr_reg[33]_i_1_n_5 ;
  wire \end_addr_reg[37]_i_1_n_2 ;
  wire \end_addr_reg[37]_i_1_n_3 ;
  wire \end_addr_reg[37]_i_1_n_4 ;
  wire \end_addr_reg[37]_i_1_n_5 ;
  wire \end_addr_reg[41]_i_1_n_2 ;
  wire \end_addr_reg[41]_i_1_n_3 ;
  wire \end_addr_reg[41]_i_1_n_4 ;
  wire \end_addr_reg[41]_i_1_n_5 ;
  wire \end_addr_reg[45]_i_1_n_2 ;
  wire \end_addr_reg[45]_i_1_n_3 ;
  wire \end_addr_reg[45]_i_1_n_4 ;
  wire \end_addr_reg[45]_i_1_n_5 ;
  wire \end_addr_reg[49]_i_1_n_2 ;
  wire \end_addr_reg[49]_i_1_n_3 ;
  wire \end_addr_reg[49]_i_1_n_4 ;
  wire \end_addr_reg[49]_i_1_n_5 ;
  wire \end_addr_reg[53]_i_1_n_2 ;
  wire \end_addr_reg[53]_i_1_n_3 ;
  wire \end_addr_reg[53]_i_1_n_4 ;
  wire \end_addr_reg[53]_i_1_n_5 ;
  wire \end_addr_reg[57]_i_1_n_2 ;
  wire \end_addr_reg[57]_i_1_n_3 ;
  wire \end_addr_reg[57]_i_1_n_4 ;
  wire \end_addr_reg[57]_i_1_n_5 ;
  wire \end_addr_reg[5]_i_1_n_2 ;
  wire \end_addr_reg[5]_i_1_n_3 ;
  wire \end_addr_reg[5]_i_1_n_4 ;
  wire \end_addr_reg[5]_i_1_n_5 ;
  wire \end_addr_reg[61]_i_1_n_2 ;
  wire \end_addr_reg[61]_i_1_n_3 ;
  wire \end_addr_reg[61]_i_1_n_4 ;
  wire \end_addr_reg[61]_i_1_n_5 ;
  wire \end_addr_reg[63]_i_1_n_5 ;
  wire [3:0]\end_addr_reg[9] ;
  wire \end_addr_reg[9]_i_1_n_2 ;
  wire \end_addr_reg[9]_i_1_n_3 ;
  wire \end_addr_reg[9]_i_1_n_4 ;
  wire \end_addr_reg[9]_i_1_n_5 ;
  wire load_p1;
  wire load_p2;
  wire [1:0]next__0;
  wire rreq_handling_reg;
  wire rreq_handling_reg_0;
  wire rreq_handling_reg_1;
  wire s_ready_t_i_1__0_n_2;
  wire s_ready_t_reg_0;
  wire s_ready_t_reg_1;
  wire [1:0]\sect_cnt[51]_i_3 ;
  wire [1:0]\sect_cnt[51]_i_3_0 ;
  wire [0:0]\sect_cnt_reg[0] ;
  wire [1:1]state;
  wire \state[0]_i_1_n_2 ;
  wire \state[1]_i_1_n_2 ;
  wire [1:0]state__0;
  wire [0:0]\state_reg[0]_0 ;
  wire \state_reg[0]_1 ;
  wire [3:1]\NLW_end_addr_reg[63]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_end_addr_reg[63]_i_1_O_UNCONNECTED ;

  LUT4 #(
    .INIT(16'h4808)) 
    \FSM_sequential_state[0]_i_1__0 
       (.I0(state__0[0]),
        .I1(s_ready_t_reg_1),
        .I2(state__0[1]),
        .I3(ARVALID_Dummy),
        .O(next__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT5 #(
    .INIT(32'h032E300C)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(s_ready_t_reg_0),
        .I1(state__0[0]),
        .I2(s_ready_t_reg_1),
        .I3(state__0[1]),
        .I4(ARVALID_Dummy),
        .O(next__0[1]));
  (* FSM_ENCODED_STATES = "ZERO:00,TWO:01,ONE:10" *) 
  FDRE \FSM_sequential_state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(next__0[0]),
        .Q(state__0[0]),
        .R(SR));
  (* FSM_ENCODED_STATES = "ZERO:00,TWO:01,ONE:10" *) 
  FDRE \FSM_sequential_state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(next__0[1]),
        .Q(state__0[1]),
        .R(SR));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[10]_i_1 
       (.I0(\data_p2_reg[78]_0 [8]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[10]),
        .O(\data_p1[10]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[11]_i_1 
       (.I0(\data_p2_reg[78]_0 [9]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[11]),
        .O(\data_p1[11]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[12]_i_1 
       (.I0(\data_p2_reg[78]_0 [10]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[12]),
        .O(\data_p1[12]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[13]_i_1 
       (.I0(\data_p2_reg[78]_0 [11]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[13]),
        .O(\data_p1[13]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[14]_i_1 
       (.I0(\data_p2_reg[78]_0 [12]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[14]),
        .O(\data_p1[14]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[15]_i_1 
       (.I0(\data_p2_reg[78]_0 [13]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[15]),
        .O(\data_p1[15]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[16]_i_1 
       (.I0(\data_p2_reg[78]_0 [14]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[16]),
        .O(\data_p1[16]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[17]_i_1 
       (.I0(\data_p2_reg[78]_0 [15]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[17]),
        .O(\data_p1[17]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[18]_i_1 
       (.I0(\data_p2_reg[78]_0 [16]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[18]),
        .O(\data_p1[18]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[19]_i_1 
       (.I0(\data_p2_reg[78]_0 [17]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[19]),
        .O(\data_p1[19]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[20]_i_1 
       (.I0(\data_p2_reg[78]_0 [18]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[20]),
        .O(\data_p1[20]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[21]_i_1 
       (.I0(\data_p2_reg[78]_0 [19]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[21]),
        .O(\data_p1[21]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[22]_i_1 
       (.I0(\data_p2_reg[78]_0 [20]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[22]),
        .O(\data_p1[22]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[23]_i_1 
       (.I0(\data_p2_reg[78]_0 [21]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[23]),
        .O(\data_p1[23]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[24]_i_1 
       (.I0(\data_p2_reg[78]_0 [22]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[24]),
        .O(\data_p1[24]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[25]_i_1 
       (.I0(\data_p2_reg[78]_0 [23]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[25]),
        .O(\data_p1[25]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[26]_i_1 
       (.I0(\data_p2_reg[78]_0 [24]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[26]),
        .O(\data_p1[26]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[27]_i_1 
       (.I0(\data_p2_reg[78]_0 [25]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[27]),
        .O(\data_p1[27]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[28]_i_1 
       (.I0(\data_p2_reg[78]_0 [26]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[28]),
        .O(\data_p1[28]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[29]_i_1 
       (.I0(\data_p2_reg[78]_0 [27]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[29]),
        .O(\data_p1[29]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[2]_i_1 
       (.I0(\data_p2_reg[78]_0 [0]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[2]),
        .O(\data_p1[2]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[30]_i_1 
       (.I0(\data_p2_reg[78]_0 [28]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[30]),
        .O(\data_p1[30]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[31]_i_1 
       (.I0(\data_p2_reg[78]_0 [29]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[31]),
        .O(\data_p1[31]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[32]_i_1 
       (.I0(\data_p2_reg[78]_0 [30]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[32]),
        .O(\data_p1[32]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[33]_i_1 
       (.I0(\data_p2_reg[78]_0 [31]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[33]),
        .O(\data_p1[33]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[34]_i_1 
       (.I0(\data_p2_reg[78]_0 [32]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[34]),
        .O(\data_p1[34]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[35]_i_1 
       (.I0(\data_p2_reg[78]_0 [33]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[35]),
        .O(\data_p1[35]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[36]_i_1 
       (.I0(\data_p2_reg[78]_0 [34]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[36]),
        .O(\data_p1[36]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[37]_i_1 
       (.I0(\data_p2_reg[78]_0 [35]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[37]),
        .O(\data_p1[37]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[38]_i_1 
       (.I0(\data_p2_reg[78]_0 [36]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[38]),
        .O(\data_p1[38]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[39]_i_1 
       (.I0(\data_p2_reg[78]_0 [37]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[39]),
        .O(\data_p1[39]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[3]_i_1 
       (.I0(\data_p2_reg[78]_0 [1]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[3]),
        .O(\data_p1[3]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[40]_i_1 
       (.I0(\data_p2_reg[78]_0 [38]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[40]),
        .O(\data_p1[40]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[41]_i_1 
       (.I0(\data_p2_reg[78]_0 [39]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[41]),
        .O(\data_p1[41]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[42]_i_1 
       (.I0(\data_p2_reg[78]_0 [40]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[42]),
        .O(\data_p1[42]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[43]_i_1 
       (.I0(\data_p2_reg[78]_0 [41]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[43]),
        .O(\data_p1[43]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[44]_i_1 
       (.I0(\data_p2_reg[78]_0 [42]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[44]),
        .O(\data_p1[44]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[45]_i_1 
       (.I0(\data_p2_reg[78]_0 [43]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[45]),
        .O(\data_p1[45]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[46]_i_1 
       (.I0(\data_p2_reg[78]_0 [44]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[46]),
        .O(\data_p1[46]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[47]_i_1 
       (.I0(\data_p2_reg[78]_0 [45]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[47]),
        .O(\data_p1[47]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[48]_i_1 
       (.I0(\data_p2_reg[78]_0 [46]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[48]),
        .O(\data_p1[48]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[49]_i_1 
       (.I0(\data_p2_reg[78]_0 [47]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[49]),
        .O(\data_p1[49]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[4]_i_1 
       (.I0(\data_p2_reg[78]_0 [2]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[4]),
        .O(\data_p1[4]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[50]_i_1 
       (.I0(\data_p2_reg[78]_0 [48]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[50]),
        .O(\data_p1[50]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[51]_i_1 
       (.I0(\data_p2_reg[78]_0 [49]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[51]),
        .O(\data_p1[51]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[52]_i_1 
       (.I0(\data_p2_reg[78]_0 [50]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[52]),
        .O(\data_p1[52]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[53]_i_1 
       (.I0(\data_p2_reg[78]_0 [51]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[53]),
        .O(\data_p1[53]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[54]_i_1 
       (.I0(\data_p2_reg[78]_0 [52]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[54]),
        .O(\data_p1[54]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[55]_i_1 
       (.I0(\data_p2_reg[78]_0 [53]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[55]),
        .O(\data_p1[55]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[56]_i_1 
       (.I0(\data_p2_reg[78]_0 [54]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[56]),
        .O(\data_p1[56]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[57]_i_1 
       (.I0(\data_p2_reg[78]_0 [55]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[57]),
        .O(\data_p1[57]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[58]_i_1 
       (.I0(\data_p2_reg[78]_0 [56]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[58]),
        .O(\data_p1[58]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[59]_i_1 
       (.I0(\data_p2_reg[78]_0 [57]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[59]),
        .O(\data_p1[59]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[5]_i_1 
       (.I0(\data_p2_reg[78]_0 [3]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[5]),
        .O(\data_p1[5]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[60]_i_1 
       (.I0(\data_p2_reg[78]_0 [58]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[60]),
        .O(\data_p1[60]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[61]_i_1 
       (.I0(\data_p2_reg[78]_0 [59]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[61]),
        .O(\data_p1[61]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[62]_i_1 
       (.I0(\data_p2_reg[78]_0 [60]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[62]),
        .O(\data_p1[62]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[63]_i_1 
       (.I0(\data_p2_reg[78]_0 [61]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[63]),
        .O(\data_p1[63]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[66]_i_1 
       (.I0(\data_p2_reg[78]_0 [62]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[66]),
        .O(\data_p1[66]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[67]_i_1 
       (.I0(\data_p2_reg[78]_0 [63]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[67]),
        .O(\data_p1[67]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[68]_i_1 
       (.I0(\data_p2_reg[78]_0 [64]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[68]),
        .O(\data_p1[68]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[69]_i_1 
       (.I0(\data_p2_reg[78]_0 [65]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[69]),
        .O(\data_p1[69]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[6]_i_1 
       (.I0(\data_p2_reg[78]_0 [4]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[6]),
        .O(\data_p1[6]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[70]_i_1 
       (.I0(\data_p2_reg[78]_0 [66]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[70]),
        .O(\data_p1[70]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[71]_i_1 
       (.I0(\data_p2_reg[78]_0 [67]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[71]),
        .O(\data_p1[71]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[72]_i_1 
       (.I0(\data_p2_reg[78]_0 [68]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[72]),
        .O(\data_p1[72]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[73]_i_1 
       (.I0(\data_p2_reg[78]_0 [69]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[73]),
        .O(\data_p1[73]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[74]_i_1 
       (.I0(\data_p2_reg[78]_0 [70]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[74]),
        .O(\data_p1[74]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[75]_i_1 
       (.I0(\data_p2_reg[78]_0 [71]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[75]),
        .O(\data_p1[75]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[76]_i_1 
       (.I0(\data_p2_reg[78]_0 [72]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[76]),
        .O(\data_p1[76]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[77]_i_1 
       (.I0(\data_p2_reg[78]_0 [73]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[77]),
        .O(\data_p1[77]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[7]_i_1 
       (.I0(\data_p2_reg[78]_0 [5]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[7]),
        .O(\data_p1[7]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[8]_i_1 
       (.I0(\data_p2_reg[78]_0 [6]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[8]),
        .O(\data_p1[8]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'h045C)) 
    \data_p1[95]_i_1 
       (.I0(s_ready_t_reg_1),
        .I1(ARVALID_Dummy),
        .I2(state__0[0]),
        .I3(state__0[1]),
        .O(load_p1));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[95]_i_2 
       (.I0(\data_p2_reg[78]_0 [74]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[78]),
        .O(\data_p1[95]_i_2_n_2 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \data_p1[9]_i_1 
       (.I0(\data_p2_reg[78]_0 [7]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(data_p2[9]),
        .O(\data_p1[9]_i_1_n_2 ));
  FDRE \data_p1_reg[10] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[10]_i_1_n_2 ),
        .Q(Q[8]),
        .R(1'b0));
  FDRE \data_p1_reg[11] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[11]_i_1_n_2 ),
        .Q(Q[9]),
        .R(1'b0));
  FDRE \data_p1_reg[12] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[12]_i_1_n_2 ),
        .Q(Q[10]),
        .R(1'b0));
  FDRE \data_p1_reg[13] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[13]_i_1_n_2 ),
        .Q(Q[11]),
        .R(1'b0));
  FDRE \data_p1_reg[14] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[14]_i_1_n_2 ),
        .Q(Q[12]),
        .R(1'b0));
  FDRE \data_p1_reg[15] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[15]_i_1_n_2 ),
        .Q(Q[13]),
        .R(1'b0));
  FDRE \data_p1_reg[16] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[16]_i_1_n_2 ),
        .Q(Q[14]),
        .R(1'b0));
  FDRE \data_p1_reg[17] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[17]_i_1_n_2 ),
        .Q(Q[15]),
        .R(1'b0));
  FDRE \data_p1_reg[18] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[18]_i_1_n_2 ),
        .Q(Q[16]),
        .R(1'b0));
  FDRE \data_p1_reg[19] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[19]_i_1_n_2 ),
        .Q(Q[17]),
        .R(1'b0));
  FDRE \data_p1_reg[20] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[20]_i_1_n_2 ),
        .Q(Q[18]),
        .R(1'b0));
  FDRE \data_p1_reg[21] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[21]_i_1_n_2 ),
        .Q(Q[19]),
        .R(1'b0));
  FDRE \data_p1_reg[22] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[22]_i_1_n_2 ),
        .Q(Q[20]),
        .R(1'b0));
  FDRE \data_p1_reg[23] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[23]_i_1_n_2 ),
        .Q(Q[21]),
        .R(1'b0));
  FDRE \data_p1_reg[24] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[24]_i_1_n_2 ),
        .Q(Q[22]),
        .R(1'b0));
  FDRE \data_p1_reg[25] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[25]_i_1_n_2 ),
        .Q(Q[23]),
        .R(1'b0));
  FDRE \data_p1_reg[26] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[26]_i_1_n_2 ),
        .Q(Q[24]),
        .R(1'b0));
  FDRE \data_p1_reg[27] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[27]_i_1_n_2 ),
        .Q(Q[25]),
        .R(1'b0));
  FDRE \data_p1_reg[28] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[28]_i_1_n_2 ),
        .Q(Q[26]),
        .R(1'b0));
  FDRE \data_p1_reg[29] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[29]_i_1_n_2 ),
        .Q(Q[27]),
        .R(1'b0));
  FDRE \data_p1_reg[2] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[2]_i_1_n_2 ),
        .Q(Q[0]),
        .R(1'b0));
  FDRE \data_p1_reg[30] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[30]_i_1_n_2 ),
        .Q(Q[28]),
        .R(1'b0));
  FDRE \data_p1_reg[31] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[31]_i_1_n_2 ),
        .Q(Q[29]),
        .R(1'b0));
  FDRE \data_p1_reg[32] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[32]_i_1_n_2 ),
        .Q(Q[30]),
        .R(1'b0));
  FDRE \data_p1_reg[33] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[33]_i_1_n_2 ),
        .Q(Q[31]),
        .R(1'b0));
  FDRE \data_p1_reg[34] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[34]_i_1_n_2 ),
        .Q(Q[32]),
        .R(1'b0));
  FDRE \data_p1_reg[35] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[35]_i_1_n_2 ),
        .Q(Q[33]),
        .R(1'b0));
  FDRE \data_p1_reg[36] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[36]_i_1_n_2 ),
        .Q(Q[34]),
        .R(1'b0));
  FDRE \data_p1_reg[37] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[37]_i_1_n_2 ),
        .Q(Q[35]),
        .R(1'b0));
  FDRE \data_p1_reg[38] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[38]_i_1_n_2 ),
        .Q(Q[36]),
        .R(1'b0));
  FDRE \data_p1_reg[39] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[39]_i_1_n_2 ),
        .Q(Q[37]),
        .R(1'b0));
  FDRE \data_p1_reg[3] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[3]_i_1_n_2 ),
        .Q(Q[1]),
        .R(1'b0));
  FDRE \data_p1_reg[40] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[40]_i_1_n_2 ),
        .Q(Q[38]),
        .R(1'b0));
  FDRE \data_p1_reg[41] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[41]_i_1_n_2 ),
        .Q(Q[39]),
        .R(1'b0));
  FDRE \data_p1_reg[42] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[42]_i_1_n_2 ),
        .Q(Q[40]),
        .R(1'b0));
  FDRE \data_p1_reg[43] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[43]_i_1_n_2 ),
        .Q(Q[41]),
        .R(1'b0));
  FDRE \data_p1_reg[44] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[44]_i_1_n_2 ),
        .Q(Q[42]),
        .R(1'b0));
  FDRE \data_p1_reg[45] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[45]_i_1_n_2 ),
        .Q(Q[43]),
        .R(1'b0));
  FDRE \data_p1_reg[46] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[46]_i_1_n_2 ),
        .Q(Q[44]),
        .R(1'b0));
  FDRE \data_p1_reg[47] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[47]_i_1_n_2 ),
        .Q(Q[45]),
        .R(1'b0));
  FDRE \data_p1_reg[48] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[48]_i_1_n_2 ),
        .Q(Q[46]),
        .R(1'b0));
  FDRE \data_p1_reg[49] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[49]_i_1_n_2 ),
        .Q(Q[47]),
        .R(1'b0));
  FDRE \data_p1_reg[4] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[4]_i_1_n_2 ),
        .Q(Q[2]),
        .R(1'b0));
  FDRE \data_p1_reg[50] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[50]_i_1_n_2 ),
        .Q(Q[48]),
        .R(1'b0));
  FDRE \data_p1_reg[51] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[51]_i_1_n_2 ),
        .Q(Q[49]),
        .R(1'b0));
  FDRE \data_p1_reg[52] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[52]_i_1_n_2 ),
        .Q(Q[50]),
        .R(1'b0));
  FDRE \data_p1_reg[53] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[53]_i_1_n_2 ),
        .Q(Q[51]),
        .R(1'b0));
  FDRE \data_p1_reg[54] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[54]_i_1_n_2 ),
        .Q(Q[52]),
        .R(1'b0));
  FDRE \data_p1_reg[55] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[55]_i_1_n_2 ),
        .Q(Q[53]),
        .R(1'b0));
  FDRE \data_p1_reg[56] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[56]_i_1_n_2 ),
        .Q(Q[54]),
        .R(1'b0));
  FDRE \data_p1_reg[57] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[57]_i_1_n_2 ),
        .Q(Q[55]),
        .R(1'b0));
  FDRE \data_p1_reg[58] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[58]_i_1_n_2 ),
        .Q(Q[56]),
        .R(1'b0));
  FDRE \data_p1_reg[59] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[59]_i_1_n_2 ),
        .Q(Q[57]),
        .R(1'b0));
  FDRE \data_p1_reg[5] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[5]_i_1_n_2 ),
        .Q(Q[3]),
        .R(1'b0));
  FDRE \data_p1_reg[60] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[60]_i_1_n_2 ),
        .Q(Q[58]),
        .R(1'b0));
  FDRE \data_p1_reg[61] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[61]_i_1_n_2 ),
        .Q(Q[59]),
        .R(1'b0));
  FDRE \data_p1_reg[62] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[62]_i_1_n_2 ),
        .Q(Q[60]),
        .R(1'b0));
  FDRE \data_p1_reg[63] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[63]_i_1_n_2 ),
        .Q(Q[61]),
        .R(1'b0));
  FDRE \data_p1_reg[66] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[66]_i_1_n_2 ),
        .Q(Q[62]),
        .R(1'b0));
  FDRE \data_p1_reg[67] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[67]_i_1_n_2 ),
        .Q(Q[63]),
        .R(1'b0));
  FDRE \data_p1_reg[68] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[68]_i_1_n_2 ),
        .Q(Q[64]),
        .R(1'b0));
  FDRE \data_p1_reg[69] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[69]_i_1_n_2 ),
        .Q(Q[65]),
        .R(1'b0));
  FDRE \data_p1_reg[6] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[6]_i_1_n_2 ),
        .Q(Q[4]),
        .R(1'b0));
  FDRE \data_p1_reg[70] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[70]_i_1_n_2 ),
        .Q(Q[66]),
        .R(1'b0));
  FDRE \data_p1_reg[71] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[71]_i_1_n_2 ),
        .Q(Q[67]),
        .R(1'b0));
  FDRE \data_p1_reg[72] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[72]_i_1_n_2 ),
        .Q(Q[68]),
        .R(1'b0));
  FDRE \data_p1_reg[73] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[73]_i_1_n_2 ),
        .Q(Q[69]),
        .R(1'b0));
  FDRE \data_p1_reg[74] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[74]_i_1_n_2 ),
        .Q(Q[70]),
        .R(1'b0));
  FDRE \data_p1_reg[75] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[75]_i_1_n_2 ),
        .Q(Q[71]),
        .R(1'b0));
  FDRE \data_p1_reg[76] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[76]_i_1_n_2 ),
        .Q(Q[72]),
        .R(1'b0));
  FDRE \data_p1_reg[77] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[77]_i_1_n_2 ),
        .Q(Q[73]),
        .R(1'b0));
  FDRE \data_p1_reg[7] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[7]_i_1_n_2 ),
        .Q(Q[5]),
        .R(1'b0));
  FDRE \data_p1_reg[8] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[8]_i_1_n_2 ),
        .Q(Q[6]),
        .R(1'b0));
  FDRE \data_p1_reg[95] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[95]_i_2_n_2 ),
        .Q(Q[74]),
        .R(1'b0));
  FDRE \data_p1_reg[9] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[9]_i_1_n_2 ),
        .Q(Q[7]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    \data_p2[78]_i_1 
       (.I0(s_ready_t_reg_0),
        .I1(ARVALID_Dummy),
        .O(load_p2));
  FDRE \data_p2_reg[10] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [8]),
        .Q(data_p2[10]),
        .R(1'b0));
  FDRE \data_p2_reg[11] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [9]),
        .Q(data_p2[11]),
        .R(1'b0));
  FDRE \data_p2_reg[12] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [10]),
        .Q(data_p2[12]),
        .R(1'b0));
  FDRE \data_p2_reg[13] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [11]),
        .Q(data_p2[13]),
        .R(1'b0));
  FDRE \data_p2_reg[14] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [12]),
        .Q(data_p2[14]),
        .R(1'b0));
  FDRE \data_p2_reg[15] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [13]),
        .Q(data_p2[15]),
        .R(1'b0));
  FDRE \data_p2_reg[16] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [14]),
        .Q(data_p2[16]),
        .R(1'b0));
  FDRE \data_p2_reg[17] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [15]),
        .Q(data_p2[17]),
        .R(1'b0));
  FDRE \data_p2_reg[18] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [16]),
        .Q(data_p2[18]),
        .R(1'b0));
  FDRE \data_p2_reg[19] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [17]),
        .Q(data_p2[19]),
        .R(1'b0));
  FDRE \data_p2_reg[20] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [18]),
        .Q(data_p2[20]),
        .R(1'b0));
  FDRE \data_p2_reg[21] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [19]),
        .Q(data_p2[21]),
        .R(1'b0));
  FDRE \data_p2_reg[22] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [20]),
        .Q(data_p2[22]),
        .R(1'b0));
  FDRE \data_p2_reg[23] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [21]),
        .Q(data_p2[23]),
        .R(1'b0));
  FDRE \data_p2_reg[24] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [22]),
        .Q(data_p2[24]),
        .R(1'b0));
  FDRE \data_p2_reg[25] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [23]),
        .Q(data_p2[25]),
        .R(1'b0));
  FDRE \data_p2_reg[26] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [24]),
        .Q(data_p2[26]),
        .R(1'b0));
  FDRE \data_p2_reg[27] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [25]),
        .Q(data_p2[27]),
        .R(1'b0));
  FDRE \data_p2_reg[28] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [26]),
        .Q(data_p2[28]),
        .R(1'b0));
  FDRE \data_p2_reg[29] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [27]),
        .Q(data_p2[29]),
        .R(1'b0));
  FDRE \data_p2_reg[2] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [0]),
        .Q(data_p2[2]),
        .R(1'b0));
  FDRE \data_p2_reg[30] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [28]),
        .Q(data_p2[30]),
        .R(1'b0));
  FDRE \data_p2_reg[31] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [29]),
        .Q(data_p2[31]),
        .R(1'b0));
  FDRE \data_p2_reg[32] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [30]),
        .Q(data_p2[32]),
        .R(1'b0));
  FDRE \data_p2_reg[33] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [31]),
        .Q(data_p2[33]),
        .R(1'b0));
  FDRE \data_p2_reg[34] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [32]),
        .Q(data_p2[34]),
        .R(1'b0));
  FDRE \data_p2_reg[35] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [33]),
        .Q(data_p2[35]),
        .R(1'b0));
  FDRE \data_p2_reg[36] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [34]),
        .Q(data_p2[36]),
        .R(1'b0));
  FDRE \data_p2_reg[37] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [35]),
        .Q(data_p2[37]),
        .R(1'b0));
  FDRE \data_p2_reg[38] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [36]),
        .Q(data_p2[38]),
        .R(1'b0));
  FDRE \data_p2_reg[39] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [37]),
        .Q(data_p2[39]),
        .R(1'b0));
  FDRE \data_p2_reg[3] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [1]),
        .Q(data_p2[3]),
        .R(1'b0));
  FDRE \data_p2_reg[40] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [38]),
        .Q(data_p2[40]),
        .R(1'b0));
  FDRE \data_p2_reg[41] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [39]),
        .Q(data_p2[41]),
        .R(1'b0));
  FDRE \data_p2_reg[42] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [40]),
        .Q(data_p2[42]),
        .R(1'b0));
  FDRE \data_p2_reg[43] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [41]),
        .Q(data_p2[43]),
        .R(1'b0));
  FDRE \data_p2_reg[44] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [42]),
        .Q(data_p2[44]),
        .R(1'b0));
  FDRE \data_p2_reg[45] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [43]),
        .Q(data_p2[45]),
        .R(1'b0));
  FDRE \data_p2_reg[46] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [44]),
        .Q(data_p2[46]),
        .R(1'b0));
  FDRE \data_p2_reg[47] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [45]),
        .Q(data_p2[47]),
        .R(1'b0));
  FDRE \data_p2_reg[48] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [46]),
        .Q(data_p2[48]),
        .R(1'b0));
  FDRE \data_p2_reg[49] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [47]),
        .Q(data_p2[49]),
        .R(1'b0));
  FDRE \data_p2_reg[4] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [2]),
        .Q(data_p2[4]),
        .R(1'b0));
  FDRE \data_p2_reg[50] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [48]),
        .Q(data_p2[50]),
        .R(1'b0));
  FDRE \data_p2_reg[51] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [49]),
        .Q(data_p2[51]),
        .R(1'b0));
  FDRE \data_p2_reg[52] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [50]),
        .Q(data_p2[52]),
        .R(1'b0));
  FDRE \data_p2_reg[53] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [51]),
        .Q(data_p2[53]),
        .R(1'b0));
  FDRE \data_p2_reg[54] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [52]),
        .Q(data_p2[54]),
        .R(1'b0));
  FDRE \data_p2_reg[55] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [53]),
        .Q(data_p2[55]),
        .R(1'b0));
  FDRE \data_p2_reg[56] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [54]),
        .Q(data_p2[56]),
        .R(1'b0));
  FDRE \data_p2_reg[57] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [55]),
        .Q(data_p2[57]),
        .R(1'b0));
  FDRE \data_p2_reg[58] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [56]),
        .Q(data_p2[58]),
        .R(1'b0));
  FDRE \data_p2_reg[59] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [57]),
        .Q(data_p2[59]),
        .R(1'b0));
  FDRE \data_p2_reg[5] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [3]),
        .Q(data_p2[5]),
        .R(1'b0));
  FDRE \data_p2_reg[60] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [58]),
        .Q(data_p2[60]),
        .R(1'b0));
  FDRE \data_p2_reg[61] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [59]),
        .Q(data_p2[61]),
        .R(1'b0));
  FDRE \data_p2_reg[62] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [60]),
        .Q(data_p2[62]),
        .R(1'b0));
  FDRE \data_p2_reg[63] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [61]),
        .Q(data_p2[63]),
        .R(1'b0));
  FDRE \data_p2_reg[66] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [62]),
        .Q(data_p2[66]),
        .R(1'b0));
  FDRE \data_p2_reg[67] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [63]),
        .Q(data_p2[67]),
        .R(1'b0));
  FDRE \data_p2_reg[68] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [64]),
        .Q(data_p2[68]),
        .R(1'b0));
  FDRE \data_p2_reg[69] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [65]),
        .Q(data_p2[69]),
        .R(1'b0));
  FDRE \data_p2_reg[6] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [4]),
        .Q(data_p2[6]),
        .R(1'b0));
  FDRE \data_p2_reg[70] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [66]),
        .Q(data_p2[70]),
        .R(1'b0));
  FDRE \data_p2_reg[71] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [67]),
        .Q(data_p2[71]),
        .R(1'b0));
  FDRE \data_p2_reg[72] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [68]),
        .Q(data_p2[72]),
        .R(1'b0));
  FDRE \data_p2_reg[73] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [69]),
        .Q(data_p2[73]),
        .R(1'b0));
  FDRE \data_p2_reg[74] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [70]),
        .Q(data_p2[74]),
        .R(1'b0));
  FDRE \data_p2_reg[75] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [71]),
        .Q(data_p2[75]),
        .R(1'b0));
  FDRE \data_p2_reg[76] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [72]),
        .Q(data_p2[76]),
        .R(1'b0));
  FDRE \data_p2_reg[77] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [73]),
        .Q(data_p2[77]),
        .R(1'b0));
  FDRE \data_p2_reg[78] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [74]),
        .Q(data_p2[78]),
        .R(1'b0));
  FDRE \data_p2_reg[7] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [5]),
        .Q(data_p2[7]),
        .R(1'b0));
  FDRE \data_p2_reg[8] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [6]),
        .Q(data_p2[8]),
        .R(1'b0));
  FDRE \data_p2_reg[9] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[78]_0 [7]),
        .Q(data_p2[9]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \end_addr_reg[13]_i_1 
       (.CI(\end_addr_reg[9]_i_1_n_2 ),
        .CO({\end_addr_reg[13]_i_1_n_2 ,\end_addr_reg[13]_i_1_n_3 ,\end_addr_reg[13]_i_1_n_4 ,\end_addr_reg[13]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI(Q[11:8]),
        .O(D[11:8]),
        .S(\end_addr_reg[13] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \end_addr_reg[17]_i_1 
       (.CI(\end_addr_reg[13]_i_1_n_2 ),
        .CO({\end_addr_reg[17]_i_1_n_2 ,\end_addr_reg[17]_i_1_n_3 ,\end_addr_reg[17]_i_1_n_4 ,\end_addr_reg[17]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI(Q[15:12]),
        .O(D[15:12]),
        .S(\end_addr_reg[17] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \end_addr_reg[21]_i_1 
       (.CI(\end_addr_reg[17]_i_1_n_2 ),
        .CO({\end_addr_reg[21]_i_1_n_2 ,\end_addr_reg[21]_i_1_n_3 ,\end_addr_reg[21]_i_1_n_4 ,\end_addr_reg[21]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI(Q[19:16]),
        .O(D[19:16]),
        .S(\end_addr_reg[21] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \end_addr_reg[25]_i_1 
       (.CI(\end_addr_reg[21]_i_1_n_2 ),
        .CO({\end_addr_reg[25]_i_1_n_2 ,\end_addr_reg[25]_i_1_n_3 ,\end_addr_reg[25]_i_1_n_4 ,\end_addr_reg[25]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI(Q[23:20]),
        .O(D[23:20]),
        .S(\end_addr_reg[25] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \end_addr_reg[29]_i_1 
       (.CI(\end_addr_reg[25]_i_1_n_2 ),
        .CO({\end_addr_reg[29]_i_1_n_2 ,\end_addr_reg[29]_i_1_n_3 ,\end_addr_reg[29]_i_1_n_4 ,\end_addr_reg[29]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI(Q[27:24]),
        .O(D[27:24]),
        .S(\end_addr_reg[29] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \end_addr_reg[33]_i_1 
       (.CI(\end_addr_reg[29]_i_1_n_2 ),
        .CO({\end_addr_reg[33]_i_1_n_2 ,\end_addr_reg[33]_i_1_n_3 ,\end_addr_reg[33]_i_1_n_4 ,\end_addr_reg[33]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,Q[29:28]}),
        .O(D[31:28]),
        .S({Q[31:30],\end_addr_reg[33] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \end_addr_reg[37]_i_1 
       (.CI(\end_addr_reg[33]_i_1_n_2 ),
        .CO({\end_addr_reg[37]_i_1_n_2 ,\end_addr_reg[37]_i_1_n_3 ,\end_addr_reg[37]_i_1_n_4 ,\end_addr_reg[37]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[35:32]),
        .S(Q[35:32]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \end_addr_reg[41]_i_1 
       (.CI(\end_addr_reg[37]_i_1_n_2 ),
        .CO({\end_addr_reg[41]_i_1_n_2 ,\end_addr_reg[41]_i_1_n_3 ,\end_addr_reg[41]_i_1_n_4 ,\end_addr_reg[41]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[39:36]),
        .S(Q[39:36]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \end_addr_reg[45]_i_1 
       (.CI(\end_addr_reg[41]_i_1_n_2 ),
        .CO({\end_addr_reg[45]_i_1_n_2 ,\end_addr_reg[45]_i_1_n_3 ,\end_addr_reg[45]_i_1_n_4 ,\end_addr_reg[45]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[43:40]),
        .S(Q[43:40]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \end_addr_reg[49]_i_1 
       (.CI(\end_addr_reg[45]_i_1_n_2 ),
        .CO({\end_addr_reg[49]_i_1_n_2 ,\end_addr_reg[49]_i_1_n_3 ,\end_addr_reg[49]_i_1_n_4 ,\end_addr_reg[49]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[47:44]),
        .S(Q[47:44]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \end_addr_reg[53]_i_1 
       (.CI(\end_addr_reg[49]_i_1_n_2 ),
        .CO({\end_addr_reg[53]_i_1_n_2 ,\end_addr_reg[53]_i_1_n_3 ,\end_addr_reg[53]_i_1_n_4 ,\end_addr_reg[53]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[51:48]),
        .S(Q[51:48]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \end_addr_reg[57]_i_1 
       (.CI(\end_addr_reg[53]_i_1_n_2 ),
        .CO({\end_addr_reg[57]_i_1_n_2 ,\end_addr_reg[57]_i_1_n_3 ,\end_addr_reg[57]_i_1_n_4 ,\end_addr_reg[57]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[55:52]),
        .S(Q[55:52]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \end_addr_reg[5]_i_1 
       (.CI(1'b0),
        .CO({\end_addr_reg[5]_i_1_n_2 ,\end_addr_reg[5]_i_1_n_3 ,\end_addr_reg[5]_i_1_n_4 ,\end_addr_reg[5]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI(Q[3:0]),
        .O(D[3:0]),
        .S(S));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \end_addr_reg[61]_i_1 
       (.CI(\end_addr_reg[57]_i_1_n_2 ),
        .CO({\end_addr_reg[61]_i_1_n_2 ,\end_addr_reg[61]_i_1_n_3 ,\end_addr_reg[61]_i_1_n_4 ,\end_addr_reg[61]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[59:56]),
        .S(Q[59:56]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \end_addr_reg[63]_i_1 
       (.CI(\end_addr_reg[61]_i_1_n_2 ),
        .CO({\NLW_end_addr_reg[63]_i_1_CO_UNCONNECTED [3:1],\end_addr_reg[63]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_end_addr_reg[63]_i_1_O_UNCONNECTED [3:2],D[61:60]}),
        .S({1'b0,1'b0,Q[61:60]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \end_addr_reg[9]_i_1 
       (.CI(\end_addr_reg[5]_i_1_n_2 ),
        .CO({\end_addr_reg[9]_i_1_n_2 ,\end_addr_reg[9]_i_1_n_3 ,\end_addr_reg[9]_i_1_n_4 ,\end_addr_reg[9]_i_1_n_5 }),
        .CYINIT(1'b0),
        .DI(Q[7:4]),
        .O(D[7:4]),
        .S(\end_addr_reg[9] ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'hEECE)) 
    rreq_handling_i_1
       (.I0(rreq_handling_reg_0),
        .I1(\state_reg[0]_0 ),
        .I2(CO),
        .I3(rreq_handling_reg_1),
        .O(rreq_handling_reg));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT5 #(
    .INIT(32'hF7FF0555)) 
    s_ready_t_i_1__0
       (.I0(state__0[1]),
        .I1(ARVALID_Dummy),
        .I2(state__0[0]),
        .I3(s_ready_t_reg_1),
        .I4(s_ready_t_reg_0),
        .O(s_ready_t_i_1__0_n_2));
  FDRE s_ready_t_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(s_ready_t_i_1__0_n_2),
        .Q(s_ready_t_reg_0),
        .R(SR));
  LUT3 #(
    .INIT(8'h2E)) 
    \sect_cnt[0]_i_1 
       (.I0(Q[10]),
        .I1(s_ready_t_reg_1),
        .I2(\sect_cnt_reg[0] ),
        .O(\data_p1_reg[12]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'h4F)) 
    \sect_cnt[51]_i_1 
       (.I0(rreq_handling_reg_0),
        .I1(\state_reg[0]_0 ),
        .I2(rreq_handling_reg_1),
        .O(E));
  LUT4 #(
    .INIT(16'h6FF6)) 
    \sect_cnt[51]_i_4 
       (.I0(\sect_cnt[51]_i_3 [1]),
        .I1(\sect_cnt[51]_i_3_0 [1]),
        .I2(\sect_cnt[51]_i_3 [0]),
        .I3(\sect_cnt[51]_i_3_0 [0]),
        .O(\could_multi_bursts.loop_cnt_reg[2] ));
  LUT5 #(
    .INIT(32'hFF80CF80)) 
    \state[0]_i_1 
       (.I0(s_ready_t_reg_0),
        .I1(ARVALID_Dummy),
        .I2(state),
        .I3(\state_reg[0]_0 ),
        .I4(\state_reg[0]_1 ),
        .O(\state[0]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'h5DFF)) 
    \state[1]_i_1 
       (.I0(\state_reg[0]_1 ),
        .I1(state),
        .I2(ARVALID_Dummy),
        .I3(\state_reg[0]_0 ),
        .O(\state[1]_i_1_n_2 ));
  FDRE \state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\state[0]_i_1_n_2 ),
        .Q(\state_reg[0]_0 ),
        .R(SR));
  FDSE \state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\state[1]_i_1_n_2 ),
        .Q(state),
        .S(SR));
endmodule

(* ORIG_REF_NAME = "read_romcode_BUS0_m_axi_reg_slice" *) 
module design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_reg_slice__parameterized1
   (m_axi_BUS0_BREADY,
    m_axi_BUS0_BVALID,
    SR,
    ap_clk);
  output m_axi_BUS0_BREADY;
  input m_axi_BUS0_BVALID;
  input [0:0]SR;
  input ap_clk;

  wire \FSM_sequential_state[1]_i_1__1_n_2 ;
  wire [0:0]SR;
  wire ap_clk;
  wire m_axi_BUS0_BREADY;
  wire m_axi_BUS0_BVALID;
  wire [0:0]next__0;
  wire s_ready_t_i_1_n_2;
  wire [1:0]state__0;

  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT4 #(
    .INIT(16'h0038)) 
    \FSM_sequential_state[1]_i_1__1 
       (.I0(m_axi_BUS0_BREADY),
        .I1(m_axi_BUS0_BVALID),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(\FSM_sequential_state[1]_i_1__1_n_2 ));
  (* FSM_ENCODED_STATES = "ZERO:00,TWO:01,ONE:10" *) 
  FDRE \FSM_sequential_state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(next__0),
        .Q(state__0[0]),
        .R(SR));
  (* FSM_ENCODED_STATES = "ZERO:00,TWO:01,ONE:10" *) 
  FDRE \FSM_sequential_state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_sequential_state[1]_i_1__1_n_2 ),
        .Q(state__0[1]),
        .R(SR));
  LUT3 #(
    .INIT(8'h62)) 
    \__3/i_ 
       (.I0(state__0[0]),
        .I1(state__0[1]),
        .I2(m_axi_BUS0_BVALID),
        .O(next__0));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT4 #(
    .INIT(16'hCC4F)) 
    s_ready_t_i_1
       (.I0(m_axi_BUS0_BVALID),
        .I1(m_axi_BUS0_BREADY),
        .I2(state__0[1]),
        .I3(state__0[0]),
        .O(s_ready_t_i_1_n_2));
  FDRE s_ready_t_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(s_ready_t_i_1_n_2),
        .Q(m_axi_BUS0_BREADY),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "read_romcode_BUS0_m_axi_reg_slice" *) 
module design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_reg_slice__parameterized2
   (s_ready_t_reg_0,
    we,
    Q,
    \data_p1_reg[32]_0 ,
    SR,
    ap_clk,
    RREADY_Dummy,
    m_axi_BUS0_RVALID,
    \data_p2_reg[32]_0 );
  output s_ready_t_reg_0;
  output we;
  output [0:0]Q;
  output [32:0]\data_p1_reg[32]_0 ;
  input [0:0]SR;
  input ap_clk;
  input RREADY_Dummy;
  input m_axi_BUS0_RVALID;
  input [32:0]\data_p2_reg[32]_0 ;

  wire [0:0]Q;
  wire RREADY_Dummy;
  wire [0:0]SR;
  wire ap_clk;
  wire \data_p1[0]_i_1_n_2 ;
  wire \data_p1[10]_i_1__0_n_2 ;
  wire \data_p1[11]_i_1__0_n_2 ;
  wire \data_p1[12]_i_1__0_n_2 ;
  wire \data_p1[13]_i_1__0_n_2 ;
  wire \data_p1[14]_i_1__0_n_2 ;
  wire \data_p1[15]_i_1__0_n_2 ;
  wire \data_p1[16]_i_1__0_n_2 ;
  wire \data_p1[17]_i_1__0_n_2 ;
  wire \data_p1[18]_i_1__0_n_2 ;
  wire \data_p1[19]_i_1__0_n_2 ;
  wire \data_p1[1]_i_1_n_2 ;
  wire \data_p1[20]_i_1__0_n_2 ;
  wire \data_p1[21]_i_1__0_n_2 ;
  wire \data_p1[22]_i_1__0_n_2 ;
  wire \data_p1[23]_i_1__0_n_2 ;
  wire \data_p1[24]_i_1__0_n_2 ;
  wire \data_p1[25]_i_1__0_n_2 ;
  wire \data_p1[26]_i_1__0_n_2 ;
  wire \data_p1[27]_i_1__0_n_2 ;
  wire \data_p1[28]_i_1__0_n_2 ;
  wire \data_p1[29]_i_1__0_n_2 ;
  wire \data_p1[2]_i_1__0_n_2 ;
  wire \data_p1[30]_i_1__0_n_2 ;
  wire \data_p1[31]_i_1__0_n_2 ;
  wire \data_p1[32]_i_2_n_2 ;
  wire \data_p1[3]_i_1__0_n_2 ;
  wire \data_p1[4]_i_1__0_n_2 ;
  wire \data_p1[5]_i_1__0_n_2 ;
  wire \data_p1[6]_i_1__0_n_2 ;
  wire \data_p1[7]_i_1__0_n_2 ;
  wire \data_p1[8]_i_1__0_n_2 ;
  wire \data_p1[9]_i_1__0_n_2 ;
  wire [32:0]\data_p1_reg[32]_0 ;
  wire [32:0]\data_p2_reg[32]_0 ;
  wire \data_p2_reg_n_2_[0] ;
  wire \data_p2_reg_n_2_[10] ;
  wire \data_p2_reg_n_2_[11] ;
  wire \data_p2_reg_n_2_[12] ;
  wire \data_p2_reg_n_2_[13] ;
  wire \data_p2_reg_n_2_[14] ;
  wire \data_p2_reg_n_2_[15] ;
  wire \data_p2_reg_n_2_[16] ;
  wire \data_p2_reg_n_2_[17] ;
  wire \data_p2_reg_n_2_[18] ;
  wire \data_p2_reg_n_2_[19] ;
  wire \data_p2_reg_n_2_[1] ;
  wire \data_p2_reg_n_2_[20] ;
  wire \data_p2_reg_n_2_[21] ;
  wire \data_p2_reg_n_2_[22] ;
  wire \data_p2_reg_n_2_[23] ;
  wire \data_p2_reg_n_2_[24] ;
  wire \data_p2_reg_n_2_[25] ;
  wire \data_p2_reg_n_2_[26] ;
  wire \data_p2_reg_n_2_[27] ;
  wire \data_p2_reg_n_2_[28] ;
  wire \data_p2_reg_n_2_[29] ;
  wire \data_p2_reg_n_2_[2] ;
  wire \data_p2_reg_n_2_[30] ;
  wire \data_p2_reg_n_2_[31] ;
  wire \data_p2_reg_n_2_[32] ;
  wire \data_p2_reg_n_2_[3] ;
  wire \data_p2_reg_n_2_[4] ;
  wire \data_p2_reg_n_2_[5] ;
  wire \data_p2_reg_n_2_[6] ;
  wire \data_p2_reg_n_2_[7] ;
  wire \data_p2_reg_n_2_[8] ;
  wire \data_p2_reg_n_2_[9] ;
  wire load_p1;
  wire load_p2;
  wire m_axi_BUS0_RVALID;
  wire [1:0]next__0;
  wire s_ready_t_i_1__1_n_2;
  wire s_ready_t_reg_0;
  wire [1:1]state;
  wire \state[0]_i_1__0_n_2 ;
  wire \state[1]_i_1__0_n_2 ;
  wire [1:0]state__0;
  wire we;

  LUT4 #(
    .INIT(16'h0602)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(state__0[0]),
        .I1(state__0[1]),
        .I2(RREADY_Dummy),
        .I3(m_axi_BUS0_RVALID),
        .O(next__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT5 #(
    .INIT(32'h3E020C30)) 
    \FSM_sequential_state[1]_i_1__0 
       (.I0(s_ready_t_reg_0),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(RREADY_Dummy),
        .I4(m_axi_BUS0_RVALID),
        .O(next__0[1]));
  (* FSM_ENCODED_STATES = "ZERO:00,TWO:01,ONE:10" *) 
  FDRE \FSM_sequential_state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(next__0[0]),
        .Q(state__0[0]),
        .R(SR));
  (* FSM_ENCODED_STATES = "ZERO:00,TWO:01,ONE:10" *) 
  FDRE \FSM_sequential_state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(next__0[1]),
        .Q(state__0[1]),
        .R(SR));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[0]_i_1 
       (.I0(\data_p2_reg_n_2_[0] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [0]),
        .O(\data_p1[0]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[10]_i_1__0 
       (.I0(\data_p2_reg_n_2_[10] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [10]),
        .O(\data_p1[10]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[11]_i_1__0 
       (.I0(\data_p2_reg_n_2_[11] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [11]),
        .O(\data_p1[11]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[12]_i_1__0 
       (.I0(\data_p2_reg_n_2_[12] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [12]),
        .O(\data_p1[12]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[13]_i_1__0 
       (.I0(\data_p2_reg_n_2_[13] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [13]),
        .O(\data_p1[13]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[14]_i_1__0 
       (.I0(\data_p2_reg_n_2_[14] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [14]),
        .O(\data_p1[14]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[15]_i_1__0 
       (.I0(\data_p2_reg_n_2_[15] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [15]),
        .O(\data_p1[15]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[16]_i_1__0 
       (.I0(\data_p2_reg_n_2_[16] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [16]),
        .O(\data_p1[16]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[17]_i_1__0 
       (.I0(\data_p2_reg_n_2_[17] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [17]),
        .O(\data_p1[17]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[18]_i_1__0 
       (.I0(\data_p2_reg_n_2_[18] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [18]),
        .O(\data_p1[18]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[19]_i_1__0 
       (.I0(\data_p2_reg_n_2_[19] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [19]),
        .O(\data_p1[19]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[1]_i_1 
       (.I0(\data_p2_reg_n_2_[1] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [1]),
        .O(\data_p1[1]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[20]_i_1__0 
       (.I0(\data_p2_reg_n_2_[20] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [20]),
        .O(\data_p1[20]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[21]_i_1__0 
       (.I0(\data_p2_reg_n_2_[21] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [21]),
        .O(\data_p1[21]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[22]_i_1__0 
       (.I0(\data_p2_reg_n_2_[22] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [22]),
        .O(\data_p1[22]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[23]_i_1__0 
       (.I0(\data_p2_reg_n_2_[23] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [23]),
        .O(\data_p1[23]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[24]_i_1__0 
       (.I0(\data_p2_reg_n_2_[24] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [24]),
        .O(\data_p1[24]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[25]_i_1__0 
       (.I0(\data_p2_reg_n_2_[25] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [25]),
        .O(\data_p1[25]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[26]_i_1__0 
       (.I0(\data_p2_reg_n_2_[26] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [26]),
        .O(\data_p1[26]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[27]_i_1__0 
       (.I0(\data_p2_reg_n_2_[27] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [27]),
        .O(\data_p1[27]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[28]_i_1__0 
       (.I0(\data_p2_reg_n_2_[28] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [28]),
        .O(\data_p1[28]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[29]_i_1__0 
       (.I0(\data_p2_reg_n_2_[29] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [29]),
        .O(\data_p1[29]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[2]_i_1__0 
       (.I0(\data_p2_reg_n_2_[2] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [2]),
        .O(\data_p1[2]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[30]_i_1__0 
       (.I0(\data_p2_reg_n_2_[30] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [30]),
        .O(\data_p1[30]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[31]_i_1__0 
       (.I0(\data_p2_reg_n_2_[31] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [31]),
        .O(\data_p1[31]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'h4E04)) 
    \data_p1[32]_i_1__0 
       (.I0(state__0[0]),
        .I1(m_axi_BUS0_RVALID),
        .I2(state__0[1]),
        .I3(RREADY_Dummy),
        .O(load_p1));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[32]_i_2 
       (.I0(\data_p2_reg_n_2_[32] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [32]),
        .O(\data_p1[32]_i_2_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[3]_i_1__0 
       (.I0(\data_p2_reg_n_2_[3] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [3]),
        .O(\data_p1[3]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[4]_i_1__0 
       (.I0(\data_p2_reg_n_2_[4] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [4]),
        .O(\data_p1[4]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[5]_i_1__0 
       (.I0(\data_p2_reg_n_2_[5] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [5]),
        .O(\data_p1[5]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[6]_i_1__0 
       (.I0(\data_p2_reg_n_2_[6] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [6]),
        .O(\data_p1[6]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[7]_i_1__0 
       (.I0(\data_p2_reg_n_2_[7] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [7]),
        .O(\data_p1[7]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[8]_i_1__0 
       (.I0(\data_p2_reg_n_2_[8] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [8]),
        .O(\data_p1[8]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \data_p1[9]_i_1__0 
       (.I0(\data_p2_reg_n_2_[9] ),
        .I1(state__0[0]),
        .I2(state__0[1]),
        .I3(\data_p2_reg[32]_0 [9]),
        .O(\data_p1[9]_i_1__0_n_2 ));
  FDRE \data_p1_reg[0] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[0]_i_1_n_2 ),
        .Q(\data_p1_reg[32]_0 [0]),
        .R(1'b0));
  FDRE \data_p1_reg[10] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[10]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [10]),
        .R(1'b0));
  FDRE \data_p1_reg[11] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[11]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [11]),
        .R(1'b0));
  FDRE \data_p1_reg[12] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[12]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [12]),
        .R(1'b0));
  FDRE \data_p1_reg[13] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[13]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [13]),
        .R(1'b0));
  FDRE \data_p1_reg[14] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[14]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [14]),
        .R(1'b0));
  FDRE \data_p1_reg[15] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[15]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [15]),
        .R(1'b0));
  FDRE \data_p1_reg[16] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[16]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [16]),
        .R(1'b0));
  FDRE \data_p1_reg[17] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[17]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [17]),
        .R(1'b0));
  FDRE \data_p1_reg[18] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[18]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [18]),
        .R(1'b0));
  FDRE \data_p1_reg[19] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[19]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [19]),
        .R(1'b0));
  FDRE \data_p1_reg[1] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[1]_i_1_n_2 ),
        .Q(\data_p1_reg[32]_0 [1]),
        .R(1'b0));
  FDRE \data_p1_reg[20] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[20]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [20]),
        .R(1'b0));
  FDRE \data_p1_reg[21] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[21]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [21]),
        .R(1'b0));
  FDRE \data_p1_reg[22] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[22]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [22]),
        .R(1'b0));
  FDRE \data_p1_reg[23] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[23]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [23]),
        .R(1'b0));
  FDRE \data_p1_reg[24] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[24]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [24]),
        .R(1'b0));
  FDRE \data_p1_reg[25] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[25]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [25]),
        .R(1'b0));
  FDRE \data_p1_reg[26] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[26]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [26]),
        .R(1'b0));
  FDRE \data_p1_reg[27] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[27]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [27]),
        .R(1'b0));
  FDRE \data_p1_reg[28] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[28]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [28]),
        .R(1'b0));
  FDRE \data_p1_reg[29] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[29]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [29]),
        .R(1'b0));
  FDRE \data_p1_reg[2] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[2]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [2]),
        .R(1'b0));
  FDRE \data_p1_reg[30] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[30]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [30]),
        .R(1'b0));
  FDRE \data_p1_reg[31] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[31]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [31]),
        .R(1'b0));
  FDRE \data_p1_reg[32] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[32]_i_2_n_2 ),
        .Q(\data_p1_reg[32]_0 [32]),
        .R(1'b0));
  FDRE \data_p1_reg[3] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[3]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [3]),
        .R(1'b0));
  FDRE \data_p1_reg[4] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[4]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [4]),
        .R(1'b0));
  FDRE \data_p1_reg[5] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[5]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [5]),
        .R(1'b0));
  FDRE \data_p1_reg[6] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[6]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [6]),
        .R(1'b0));
  FDRE \data_p1_reg[7] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[7]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [7]),
        .R(1'b0));
  FDRE \data_p1_reg[8] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[8]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [8]),
        .R(1'b0));
  FDRE \data_p1_reg[9] 
       (.C(ap_clk),
        .CE(load_p1),
        .D(\data_p1[9]_i_1__0_n_2 ),
        .Q(\data_p1_reg[32]_0 [9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    \data_p2[32]_i_1 
       (.I0(m_axi_BUS0_RVALID),
        .I1(s_ready_t_reg_0),
        .O(load_p2));
  FDRE \data_p2_reg[0] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [0]),
        .Q(\data_p2_reg_n_2_[0] ),
        .R(1'b0));
  FDRE \data_p2_reg[10] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [10]),
        .Q(\data_p2_reg_n_2_[10] ),
        .R(1'b0));
  FDRE \data_p2_reg[11] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [11]),
        .Q(\data_p2_reg_n_2_[11] ),
        .R(1'b0));
  FDRE \data_p2_reg[12] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [12]),
        .Q(\data_p2_reg_n_2_[12] ),
        .R(1'b0));
  FDRE \data_p2_reg[13] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [13]),
        .Q(\data_p2_reg_n_2_[13] ),
        .R(1'b0));
  FDRE \data_p2_reg[14] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [14]),
        .Q(\data_p2_reg_n_2_[14] ),
        .R(1'b0));
  FDRE \data_p2_reg[15] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [15]),
        .Q(\data_p2_reg_n_2_[15] ),
        .R(1'b0));
  FDRE \data_p2_reg[16] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [16]),
        .Q(\data_p2_reg_n_2_[16] ),
        .R(1'b0));
  FDRE \data_p2_reg[17] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [17]),
        .Q(\data_p2_reg_n_2_[17] ),
        .R(1'b0));
  FDRE \data_p2_reg[18] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [18]),
        .Q(\data_p2_reg_n_2_[18] ),
        .R(1'b0));
  FDRE \data_p2_reg[19] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [19]),
        .Q(\data_p2_reg_n_2_[19] ),
        .R(1'b0));
  FDRE \data_p2_reg[1] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [1]),
        .Q(\data_p2_reg_n_2_[1] ),
        .R(1'b0));
  FDRE \data_p2_reg[20] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [20]),
        .Q(\data_p2_reg_n_2_[20] ),
        .R(1'b0));
  FDRE \data_p2_reg[21] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [21]),
        .Q(\data_p2_reg_n_2_[21] ),
        .R(1'b0));
  FDRE \data_p2_reg[22] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [22]),
        .Q(\data_p2_reg_n_2_[22] ),
        .R(1'b0));
  FDRE \data_p2_reg[23] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [23]),
        .Q(\data_p2_reg_n_2_[23] ),
        .R(1'b0));
  FDRE \data_p2_reg[24] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [24]),
        .Q(\data_p2_reg_n_2_[24] ),
        .R(1'b0));
  FDRE \data_p2_reg[25] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [25]),
        .Q(\data_p2_reg_n_2_[25] ),
        .R(1'b0));
  FDRE \data_p2_reg[26] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [26]),
        .Q(\data_p2_reg_n_2_[26] ),
        .R(1'b0));
  FDRE \data_p2_reg[27] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [27]),
        .Q(\data_p2_reg_n_2_[27] ),
        .R(1'b0));
  FDRE \data_p2_reg[28] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [28]),
        .Q(\data_p2_reg_n_2_[28] ),
        .R(1'b0));
  FDRE \data_p2_reg[29] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [29]),
        .Q(\data_p2_reg_n_2_[29] ),
        .R(1'b0));
  FDRE \data_p2_reg[2] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [2]),
        .Q(\data_p2_reg_n_2_[2] ),
        .R(1'b0));
  FDRE \data_p2_reg[30] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [30]),
        .Q(\data_p2_reg_n_2_[30] ),
        .R(1'b0));
  FDRE \data_p2_reg[31] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [31]),
        .Q(\data_p2_reg_n_2_[31] ),
        .R(1'b0));
  FDRE \data_p2_reg[32] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [32]),
        .Q(\data_p2_reg_n_2_[32] ),
        .R(1'b0));
  FDRE \data_p2_reg[3] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [3]),
        .Q(\data_p2_reg_n_2_[3] ),
        .R(1'b0));
  FDRE \data_p2_reg[4] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [4]),
        .Q(\data_p2_reg_n_2_[4] ),
        .R(1'b0));
  FDRE \data_p2_reg[5] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [5]),
        .Q(\data_p2_reg_n_2_[5] ),
        .R(1'b0));
  FDRE \data_p2_reg[6] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [6]),
        .Q(\data_p2_reg_n_2_[6] ),
        .R(1'b0));
  FDRE \data_p2_reg[7] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [7]),
        .Q(\data_p2_reg_n_2_[7] ),
        .R(1'b0));
  FDRE \data_p2_reg[8] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [8]),
        .Q(\data_p2_reg_n_2_[8] ),
        .R(1'b0));
  FDRE \data_p2_reg[9] 
       (.C(ap_clk),
        .CE(load_p2),
        .D(\data_p2_reg[32]_0 [9]),
        .Q(\data_p2_reg_n_2_[9] ),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    mem_reg_i_1
       (.I0(Q),
        .I1(RREADY_Dummy),
        .O(we));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT5 #(
    .INIT(32'hFFBF0F05)) 
    s_ready_t_i_1__1
       (.I0(state__0[0]),
        .I1(m_axi_BUS0_RVALID),
        .I2(state__0[1]),
        .I3(RREADY_Dummy),
        .I4(s_ready_t_reg_0),
        .O(s_ready_t_i_1__1_n_2));
  FDRE s_ready_t_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(s_ready_t_i_1__1_n_2),
        .Q(s_ready_t_reg_0),
        .R(SR));
  LUT5 #(
    .INIT(32'hFCCC4C4C)) 
    \state[0]_i_1__0 
       (.I0(RREADY_Dummy),
        .I1(Q),
        .I2(state),
        .I3(s_ready_t_reg_0),
        .I4(m_axi_BUS0_RVALID),
        .O(\state[0]_i_1__0_n_2 ));
  LUT4 #(
    .INIT(16'hFF4F)) 
    \state[1]_i_1__0 
       (.I0(m_axi_BUS0_RVALID),
        .I1(state),
        .I2(Q),
        .I3(RREADY_Dummy),
        .O(\state[1]_i_1__0_n_2 ));
  FDRE \state_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\state[0]_i_1__0_n_2 ),
        .Q(Q),
        .R(SR));
  FDSE \state_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\state[1]_i_1__0_n_2 ),
        .Q(state),
        .S(SR));
endmodule

(* ORIG_REF_NAME = "read_romcode_BUS0_m_axi_srl" *) 
module design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_srl
   (pop,
    Q,
    \icmp_ln31_reg_153_reg[0] ,
    S,
    \dout_reg[70]_0 ,
    \dout_reg[66]_0 ,
    \dout_reg[75]_0 ,
    s_ready_t_reg,
    \dout_reg[0]_0 ,
    tmp_valid_reg,
    ARREADY_Dummy,
    rreq_valid,
    E,
    \dout_reg[61]_0 ,
    select_ln26_reg_147,
    \ap_CS_fsm_reg[2] ,
    BUS0_ARREADY,
    \ap_CS_fsm_reg[2]_0 ,
    \dout_reg[75]_1 ,
    \dout_reg[75]_2 ,
    ap_clk,
    SR);
  output pop;
  output [73:0]Q;
  output \icmp_ln31_reg_153_reg[0] ;
  output [3:0]S;
  output [3:0]\dout_reg[70]_0 ;
  output [2:0]\dout_reg[66]_0 ;
  output [0:0]\dout_reg[75]_0 ;
  output s_ready_t_reg;
  input \dout_reg[0]_0 ;
  input tmp_valid_reg;
  input ARREADY_Dummy;
  input rreq_valid;
  input [0:0]E;
  input [61:0]\dout_reg[61]_0 ;
  input [11:0]select_ln26_reg_147;
  input \ap_CS_fsm_reg[2] ;
  input BUS0_ARREADY;
  input [0:0]\ap_CS_fsm_reg[2]_0 ;
  input \dout_reg[75]_1 ;
  input \dout_reg[75]_2 ;
  input ap_clk;
  input [0:0]SR;

  wire ARREADY_Dummy;
  wire [61:0]BUS0_ARADDR;
  wire [11:0]BUS0_ARLEN;
  wire BUS0_ARREADY;
  wire [0:0]E;
  wire [73:0]Q;
  wire [3:0]S;
  wire [0:0]SR;
  wire \ap_CS_fsm_reg[2] ;
  wire [0:0]\ap_CS_fsm_reg[2]_0 ;
  wire ap_clk;
  wire \dout_reg[0]_0 ;
  wire [61:0]\dout_reg[61]_0 ;
  wire [2:0]\dout_reg[66]_0 ;
  wire [3:0]\dout_reg[70]_0 ;
  wire [0:0]\dout_reg[75]_0 ;
  wire \dout_reg[75]_1 ;
  wire \dout_reg[75]_2 ;
  wire \icmp_ln31_reg_153_reg[0] ;
  wire \mem_reg[3][0]_srl4_n_2 ;
  wire \mem_reg[3][10]_srl4_n_2 ;
  wire \mem_reg[3][11]_srl4_n_2 ;
  wire \mem_reg[3][12]_srl4_n_2 ;
  wire \mem_reg[3][13]_srl4_n_2 ;
  wire \mem_reg[3][14]_srl4_n_2 ;
  wire \mem_reg[3][15]_srl4_n_2 ;
  wire \mem_reg[3][16]_srl4_n_2 ;
  wire \mem_reg[3][17]_srl4_n_2 ;
  wire \mem_reg[3][18]_srl4_n_2 ;
  wire \mem_reg[3][19]_srl4_n_2 ;
  wire \mem_reg[3][1]_srl4_n_2 ;
  wire \mem_reg[3][20]_srl4_n_2 ;
  wire \mem_reg[3][21]_srl4_n_2 ;
  wire \mem_reg[3][22]_srl4_n_2 ;
  wire \mem_reg[3][23]_srl4_n_2 ;
  wire \mem_reg[3][24]_srl4_n_2 ;
  wire \mem_reg[3][25]_srl4_n_2 ;
  wire \mem_reg[3][26]_srl4_n_2 ;
  wire \mem_reg[3][27]_srl4_n_2 ;
  wire \mem_reg[3][28]_srl4_n_2 ;
  wire \mem_reg[3][29]_srl4_n_2 ;
  wire \mem_reg[3][2]_srl4_n_2 ;
  wire \mem_reg[3][30]_srl4_n_2 ;
  wire \mem_reg[3][31]_srl4_n_2 ;
  wire \mem_reg[3][32]_srl4_n_2 ;
  wire \mem_reg[3][33]_srl4_n_2 ;
  wire \mem_reg[3][34]_srl4_n_2 ;
  wire \mem_reg[3][35]_srl4_n_2 ;
  wire \mem_reg[3][36]_srl4_n_2 ;
  wire \mem_reg[3][37]_srl4_n_2 ;
  wire \mem_reg[3][38]_srl4_n_2 ;
  wire \mem_reg[3][39]_srl4_n_2 ;
  wire \mem_reg[3][3]_srl4_n_2 ;
  wire \mem_reg[3][40]_srl4_n_2 ;
  wire \mem_reg[3][41]_srl4_n_2 ;
  wire \mem_reg[3][42]_srl4_n_2 ;
  wire \mem_reg[3][43]_srl4_n_2 ;
  wire \mem_reg[3][44]_srl4_n_2 ;
  wire \mem_reg[3][45]_srl4_n_2 ;
  wire \mem_reg[3][46]_srl4_n_2 ;
  wire \mem_reg[3][47]_srl4_n_2 ;
  wire \mem_reg[3][48]_srl4_n_2 ;
  wire \mem_reg[3][49]_srl4_n_2 ;
  wire \mem_reg[3][4]_srl4_n_2 ;
  wire \mem_reg[3][50]_srl4_n_2 ;
  wire \mem_reg[3][51]_srl4_n_2 ;
  wire \mem_reg[3][52]_srl4_n_2 ;
  wire \mem_reg[3][53]_srl4_n_2 ;
  wire \mem_reg[3][54]_srl4_n_2 ;
  wire \mem_reg[3][55]_srl4_n_2 ;
  wire \mem_reg[3][56]_srl4_n_2 ;
  wire \mem_reg[3][57]_srl4_n_2 ;
  wire \mem_reg[3][58]_srl4_n_2 ;
  wire \mem_reg[3][59]_srl4_n_2 ;
  wire \mem_reg[3][5]_srl4_n_2 ;
  wire \mem_reg[3][60]_srl4_n_2 ;
  wire \mem_reg[3][61]_srl4_n_2 ;
  wire \mem_reg[3][64]_srl4_n_2 ;
  wire \mem_reg[3][65]_srl4_n_2 ;
  wire \mem_reg[3][66]_srl4_n_2 ;
  wire \mem_reg[3][67]_srl4_n_2 ;
  wire \mem_reg[3][68]_srl4_n_2 ;
  wire \mem_reg[3][69]_srl4_n_2 ;
  wire \mem_reg[3][6]_srl4_n_2 ;
  wire \mem_reg[3][70]_srl4_n_2 ;
  wire \mem_reg[3][71]_srl4_n_2 ;
  wire \mem_reg[3][72]_srl4_n_2 ;
  wire \mem_reg[3][73]_srl4_n_2 ;
  wire \mem_reg[3][74]_srl4_n_2 ;
  wire \mem_reg[3][75]_srl4_n_2 ;
  wire \mem_reg[3][7]_srl4_n_2 ;
  wire \mem_reg[3][8]_srl4_n_2 ;
  wire \mem_reg[3][9]_srl4_n_2 ;
  wire pop;
  wire rreq_valid;
  wire s_ready_t_reg;
  wire [11:0]select_ln26_reg_147;
  wire tmp_valid0;
  wire tmp_valid_i_3_n_2;
  wire tmp_valid_i_4_n_2;
  wire tmp_valid_reg;

  LUT4 #(
    .INIT(16'hA2AA)) 
    \dout[75]_i_1 
       (.I0(\dout_reg[0]_0 ),
        .I1(tmp_valid_reg),
        .I2(ARREADY_Dummy),
        .I3(rreq_valid),
        .O(pop));
  FDRE \dout_reg[0] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][0]_srl4_n_2 ),
        .Q(Q[0]),
        .R(SR));
  FDRE \dout_reg[10] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][10]_srl4_n_2 ),
        .Q(Q[10]),
        .R(SR));
  FDRE \dout_reg[11] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][11]_srl4_n_2 ),
        .Q(Q[11]),
        .R(SR));
  FDRE \dout_reg[12] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][12]_srl4_n_2 ),
        .Q(Q[12]),
        .R(SR));
  FDRE \dout_reg[13] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][13]_srl4_n_2 ),
        .Q(Q[13]),
        .R(SR));
  FDRE \dout_reg[14] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][14]_srl4_n_2 ),
        .Q(Q[14]),
        .R(SR));
  FDRE \dout_reg[15] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][15]_srl4_n_2 ),
        .Q(Q[15]),
        .R(SR));
  FDRE \dout_reg[16] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][16]_srl4_n_2 ),
        .Q(Q[16]),
        .R(SR));
  FDRE \dout_reg[17] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][17]_srl4_n_2 ),
        .Q(Q[17]),
        .R(SR));
  FDRE \dout_reg[18] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][18]_srl4_n_2 ),
        .Q(Q[18]),
        .R(SR));
  FDRE \dout_reg[19] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][19]_srl4_n_2 ),
        .Q(Q[19]),
        .R(SR));
  FDRE \dout_reg[1] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][1]_srl4_n_2 ),
        .Q(Q[1]),
        .R(SR));
  FDRE \dout_reg[20] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][20]_srl4_n_2 ),
        .Q(Q[20]),
        .R(SR));
  FDRE \dout_reg[21] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][21]_srl4_n_2 ),
        .Q(Q[21]),
        .R(SR));
  FDRE \dout_reg[22] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][22]_srl4_n_2 ),
        .Q(Q[22]),
        .R(SR));
  FDRE \dout_reg[23] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][23]_srl4_n_2 ),
        .Q(Q[23]),
        .R(SR));
  FDRE \dout_reg[24] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][24]_srl4_n_2 ),
        .Q(Q[24]),
        .R(SR));
  FDRE \dout_reg[25] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][25]_srl4_n_2 ),
        .Q(Q[25]),
        .R(SR));
  FDRE \dout_reg[26] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][26]_srl4_n_2 ),
        .Q(Q[26]),
        .R(SR));
  FDRE \dout_reg[27] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][27]_srl4_n_2 ),
        .Q(Q[27]),
        .R(SR));
  FDRE \dout_reg[28] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][28]_srl4_n_2 ),
        .Q(Q[28]),
        .R(SR));
  FDRE \dout_reg[29] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][29]_srl4_n_2 ),
        .Q(Q[29]),
        .R(SR));
  FDRE \dout_reg[2] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][2]_srl4_n_2 ),
        .Q(Q[2]),
        .R(SR));
  FDRE \dout_reg[30] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][30]_srl4_n_2 ),
        .Q(Q[30]),
        .R(SR));
  FDRE \dout_reg[31] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][31]_srl4_n_2 ),
        .Q(Q[31]),
        .R(SR));
  FDRE \dout_reg[32] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][32]_srl4_n_2 ),
        .Q(Q[32]),
        .R(SR));
  FDRE \dout_reg[33] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][33]_srl4_n_2 ),
        .Q(Q[33]),
        .R(SR));
  FDRE \dout_reg[34] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][34]_srl4_n_2 ),
        .Q(Q[34]),
        .R(SR));
  FDRE \dout_reg[35] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][35]_srl4_n_2 ),
        .Q(Q[35]),
        .R(SR));
  FDRE \dout_reg[36] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][36]_srl4_n_2 ),
        .Q(Q[36]),
        .R(SR));
  FDRE \dout_reg[37] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][37]_srl4_n_2 ),
        .Q(Q[37]),
        .R(SR));
  FDRE \dout_reg[38] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][38]_srl4_n_2 ),
        .Q(Q[38]),
        .R(SR));
  FDRE \dout_reg[39] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][39]_srl4_n_2 ),
        .Q(Q[39]),
        .R(SR));
  FDRE \dout_reg[3] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][3]_srl4_n_2 ),
        .Q(Q[3]),
        .R(SR));
  FDRE \dout_reg[40] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][40]_srl4_n_2 ),
        .Q(Q[40]),
        .R(SR));
  FDRE \dout_reg[41] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][41]_srl4_n_2 ),
        .Q(Q[41]),
        .R(SR));
  FDRE \dout_reg[42] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][42]_srl4_n_2 ),
        .Q(Q[42]),
        .R(SR));
  FDRE \dout_reg[43] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][43]_srl4_n_2 ),
        .Q(Q[43]),
        .R(SR));
  FDRE \dout_reg[44] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][44]_srl4_n_2 ),
        .Q(Q[44]),
        .R(SR));
  FDRE \dout_reg[45] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][45]_srl4_n_2 ),
        .Q(Q[45]),
        .R(SR));
  FDRE \dout_reg[46] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][46]_srl4_n_2 ),
        .Q(Q[46]),
        .R(SR));
  FDRE \dout_reg[47] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][47]_srl4_n_2 ),
        .Q(Q[47]),
        .R(SR));
  FDRE \dout_reg[48] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][48]_srl4_n_2 ),
        .Q(Q[48]),
        .R(SR));
  FDRE \dout_reg[49] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][49]_srl4_n_2 ),
        .Q(Q[49]),
        .R(SR));
  FDRE \dout_reg[4] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][4]_srl4_n_2 ),
        .Q(Q[4]),
        .R(SR));
  FDRE \dout_reg[50] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][50]_srl4_n_2 ),
        .Q(Q[50]),
        .R(SR));
  FDRE \dout_reg[51] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][51]_srl4_n_2 ),
        .Q(Q[51]),
        .R(SR));
  FDRE \dout_reg[52] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][52]_srl4_n_2 ),
        .Q(Q[52]),
        .R(SR));
  FDRE \dout_reg[53] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][53]_srl4_n_2 ),
        .Q(Q[53]),
        .R(SR));
  FDRE \dout_reg[54] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][54]_srl4_n_2 ),
        .Q(Q[54]),
        .R(SR));
  FDRE \dout_reg[55] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][55]_srl4_n_2 ),
        .Q(Q[55]),
        .R(SR));
  FDRE \dout_reg[56] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][56]_srl4_n_2 ),
        .Q(Q[56]),
        .R(SR));
  FDRE \dout_reg[57] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][57]_srl4_n_2 ),
        .Q(Q[57]),
        .R(SR));
  FDRE \dout_reg[58] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][58]_srl4_n_2 ),
        .Q(Q[58]),
        .R(SR));
  FDRE \dout_reg[59] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][59]_srl4_n_2 ),
        .Q(Q[59]),
        .R(SR));
  FDRE \dout_reg[5] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][5]_srl4_n_2 ),
        .Q(Q[5]),
        .R(SR));
  FDRE \dout_reg[60] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][60]_srl4_n_2 ),
        .Q(Q[60]),
        .R(SR));
  FDRE \dout_reg[61] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][61]_srl4_n_2 ),
        .Q(Q[61]),
        .R(SR));
  FDRE \dout_reg[64] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][64]_srl4_n_2 ),
        .Q(Q[62]),
        .R(SR));
  FDRE \dout_reg[65] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][65]_srl4_n_2 ),
        .Q(Q[63]),
        .R(SR));
  FDRE \dout_reg[66] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][66]_srl4_n_2 ),
        .Q(Q[64]),
        .R(SR));
  FDRE \dout_reg[67] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][67]_srl4_n_2 ),
        .Q(Q[65]),
        .R(SR));
  FDRE \dout_reg[68] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][68]_srl4_n_2 ),
        .Q(Q[66]),
        .R(SR));
  FDRE \dout_reg[69] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][69]_srl4_n_2 ),
        .Q(Q[67]),
        .R(SR));
  FDRE \dout_reg[6] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][6]_srl4_n_2 ),
        .Q(Q[6]),
        .R(SR));
  FDRE \dout_reg[70] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][70]_srl4_n_2 ),
        .Q(Q[68]),
        .R(SR));
  FDRE \dout_reg[71] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][71]_srl4_n_2 ),
        .Q(Q[69]),
        .R(SR));
  FDRE \dout_reg[72] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][72]_srl4_n_2 ),
        .Q(Q[70]),
        .R(SR));
  FDRE \dout_reg[73] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][73]_srl4_n_2 ),
        .Q(Q[71]),
        .R(SR));
  FDRE \dout_reg[74] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][74]_srl4_n_2 ),
        .Q(Q[72]),
        .R(SR));
  FDRE \dout_reg[75] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][75]_srl4_n_2 ),
        .Q(Q[73]),
        .R(SR));
  FDRE \dout_reg[7] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][7]_srl4_n_2 ),
        .Q(Q[7]),
        .R(SR));
  FDRE \dout_reg[8] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][8]_srl4_n_2 ),
        .Q(Q[8]),
        .R(SR));
  FDRE \dout_reg[9] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[3][9]_srl4_n_2 ),
        .Q(Q[9]),
        .R(SR));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][0]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][0]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[0]),
        .Q(\mem_reg[3][0]_srl4_n_2 ));
  LUT3 #(
    .INIT(8'h40)) 
    \mem_reg[3][0]_srl4_i_1 
       (.I0(\ap_CS_fsm_reg[2] ),
        .I1(BUS0_ARREADY),
        .I2(\ap_CS_fsm_reg[2]_0 ),
        .O(\icmp_ln31_reg_153_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][0]_srl4_i_2 
       (.I0(\dout_reg[61]_0 [0]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[0]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][10]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][10]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[10]),
        .Q(\mem_reg[3][10]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][10]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [10]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[10]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][11]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][11]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[11]),
        .Q(\mem_reg[3][11]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][11]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [11]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[11]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][12]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][12]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[12]),
        .Q(\mem_reg[3][12]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][12]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [12]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[12]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][13]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][13]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[13]),
        .Q(\mem_reg[3][13]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][13]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [13]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[13]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][14]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][14]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[14]),
        .Q(\mem_reg[3][14]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][14]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [14]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[14]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][15]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][15]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[15]),
        .Q(\mem_reg[3][15]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][15]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [15]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[15]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][16]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][16]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[16]),
        .Q(\mem_reg[3][16]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][16]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [16]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[16]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][17]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][17]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[17]),
        .Q(\mem_reg[3][17]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][17]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [17]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[17]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][18]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][18]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[18]),
        .Q(\mem_reg[3][18]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][18]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [18]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[18]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][19]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][19]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[19]),
        .Q(\mem_reg[3][19]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][19]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [19]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[19]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][1]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][1]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[1]),
        .Q(\mem_reg[3][1]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][1]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [1]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[1]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][20]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][20]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[20]),
        .Q(\mem_reg[3][20]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][20]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [20]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[20]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][21]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][21]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[21]),
        .Q(\mem_reg[3][21]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][21]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [21]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[21]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][22]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][22]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[22]),
        .Q(\mem_reg[3][22]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][22]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [22]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[22]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][23]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][23]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[23]),
        .Q(\mem_reg[3][23]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][23]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [23]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[23]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][24]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][24]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[24]),
        .Q(\mem_reg[3][24]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][24]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [24]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[24]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][25]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][25]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[25]),
        .Q(\mem_reg[3][25]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][25]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [25]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[25]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][26]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][26]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[26]),
        .Q(\mem_reg[3][26]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][26]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [26]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[26]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][27]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][27]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[27]),
        .Q(\mem_reg[3][27]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][27]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [27]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[27]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][28]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][28]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[28]),
        .Q(\mem_reg[3][28]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][28]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [28]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[28]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][29]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][29]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[29]),
        .Q(\mem_reg[3][29]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][29]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [29]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[29]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][2]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][2]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[2]),
        .Q(\mem_reg[3][2]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][2]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [2]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[2]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][30]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][30]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[30]),
        .Q(\mem_reg[3][30]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][30]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [30]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[30]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][31]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][31]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[31]),
        .Q(\mem_reg[3][31]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][31]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [31]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[31]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][32]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][32]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[32]),
        .Q(\mem_reg[3][32]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][32]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [32]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[32]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][33]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][33]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[33]),
        .Q(\mem_reg[3][33]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][33]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [33]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[33]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][34]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][34]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[34]),
        .Q(\mem_reg[3][34]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][34]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [34]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[34]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][35]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][35]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[35]),
        .Q(\mem_reg[3][35]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][35]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [35]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[35]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][36]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][36]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[36]),
        .Q(\mem_reg[3][36]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][36]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [36]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[36]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][37]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][37]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[37]),
        .Q(\mem_reg[3][37]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][37]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [37]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[37]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][38]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][38]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[38]),
        .Q(\mem_reg[3][38]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][38]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [38]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[38]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][39]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][39]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[39]),
        .Q(\mem_reg[3][39]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][39]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [39]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[39]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][3]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][3]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[3]),
        .Q(\mem_reg[3][3]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][3]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [3]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[3]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][40]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][40]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[40]),
        .Q(\mem_reg[3][40]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][40]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [40]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[40]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][41]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][41]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[41]),
        .Q(\mem_reg[3][41]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][41]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [41]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[41]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][42]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][42]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[42]),
        .Q(\mem_reg[3][42]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][42]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [42]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[42]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][43]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][43]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[43]),
        .Q(\mem_reg[3][43]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][43]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [43]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[43]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][44]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][44]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[44]),
        .Q(\mem_reg[3][44]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][44]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [44]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[44]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][45]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][45]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[45]),
        .Q(\mem_reg[3][45]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][45]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [45]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[45]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][46]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][46]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[46]),
        .Q(\mem_reg[3][46]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][46]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [46]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[46]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][47]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][47]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[47]),
        .Q(\mem_reg[3][47]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][47]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [47]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[47]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][48]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][48]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[48]),
        .Q(\mem_reg[3][48]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][48]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [48]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[48]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][49]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][49]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[49]),
        .Q(\mem_reg[3][49]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][49]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [49]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[49]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][4]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][4]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[4]),
        .Q(\mem_reg[3][4]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][4]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [4]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[4]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][50]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][50]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[50]),
        .Q(\mem_reg[3][50]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][50]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [50]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[50]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][51]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][51]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[51]),
        .Q(\mem_reg[3][51]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][51]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [51]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[51]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][52]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][52]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[52]),
        .Q(\mem_reg[3][52]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][52]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [52]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[52]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][53]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][53]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[53]),
        .Q(\mem_reg[3][53]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][53]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [53]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[53]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][54]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][54]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[54]),
        .Q(\mem_reg[3][54]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][54]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [54]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[54]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][55]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][55]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[55]),
        .Q(\mem_reg[3][55]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][55]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [55]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[55]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][56]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][56]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[56]),
        .Q(\mem_reg[3][56]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][56]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [56]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[56]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][57]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][57]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[57]),
        .Q(\mem_reg[3][57]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][57]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [57]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[57]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][58]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][58]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[58]),
        .Q(\mem_reg[3][58]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][58]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [58]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[58]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][59]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][59]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[59]),
        .Q(\mem_reg[3][59]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][59]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [59]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[59]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][5]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][5]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[5]),
        .Q(\mem_reg[3][5]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][5]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [5]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[5]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][60]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][60]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[60]),
        .Q(\mem_reg[3][60]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][60]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [60]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[60]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][61]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][61]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[61]),
        .Q(\mem_reg[3][61]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][61]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [61]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[61]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][64]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][64]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARLEN[0]),
        .Q(\mem_reg[3][64]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][64]_srl4_i_1 
       (.I0(select_ln26_reg_147[0]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARLEN[0]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][65]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][65]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARLEN[1]),
        .Q(\mem_reg[3][65]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][65]_srl4_i_1 
       (.I0(select_ln26_reg_147[1]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARLEN[1]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][66]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][66]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARLEN[2]),
        .Q(\mem_reg[3][66]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][66]_srl4_i_1 
       (.I0(select_ln26_reg_147[2]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARLEN[2]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][67]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][67]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARLEN[3]),
        .Q(\mem_reg[3][67]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][67]_srl4_i_1 
       (.I0(select_ln26_reg_147[3]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARLEN[3]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][68]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][68]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARLEN[4]),
        .Q(\mem_reg[3][68]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][68]_srl4_i_1 
       (.I0(select_ln26_reg_147[4]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARLEN[4]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][69]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][69]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARLEN[5]),
        .Q(\mem_reg[3][69]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][69]_srl4_i_1 
       (.I0(select_ln26_reg_147[5]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARLEN[5]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][6]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][6]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[6]),
        .Q(\mem_reg[3][6]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][6]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [6]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[6]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][70]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][70]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARLEN[6]),
        .Q(\mem_reg[3][70]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][70]_srl4_i_1 
       (.I0(select_ln26_reg_147[6]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARLEN[6]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][71]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][71]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARLEN[7]),
        .Q(\mem_reg[3][71]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][71]_srl4_i_1 
       (.I0(select_ln26_reg_147[7]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARLEN[7]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][72]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][72]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARLEN[8]),
        .Q(\mem_reg[3][72]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][72]_srl4_i_1 
       (.I0(select_ln26_reg_147[8]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARLEN[8]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][73]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][73]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARLEN[9]),
        .Q(\mem_reg[3][73]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][73]_srl4_i_1 
       (.I0(select_ln26_reg_147[9]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARLEN[9]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][74]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][74]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARLEN[10]),
        .Q(\mem_reg[3][74]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][74]_srl4_i_1 
       (.I0(select_ln26_reg_147[10]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARLEN[10]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][75]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][75]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARLEN[11]),
        .Q(\mem_reg[3][75]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][75]_srl4_i_1 
       (.I0(select_ln26_reg_147[11]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARLEN[11]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][7]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][7]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[7]),
        .Q(\mem_reg[3][7]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][7]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [7]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[7]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][8]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][8]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[8]),
        .Q(\mem_reg[3][8]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][8]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [8]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[8]));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/load_unit/fifo_rreq/U_fifo_srl/mem_reg[3][9]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[3][9]_srl4 
       (.A0(\dout_reg[75]_1 ),
        .A1(\dout_reg[75]_2 ),
        .A2(1'b0),
        .A3(1'b0),
        .CE(\icmp_ln31_reg_153_reg[0] ),
        .CLK(ap_clk),
        .D(BUS0_ARADDR[9]),
        .Q(\mem_reg[3][9]_srl4_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mem_reg[3][9]_srl4_i_1 
       (.I0(\dout_reg[61]_0 [9]),
        .I1(\icmp_ln31_reg_153_reg[0] ),
        .O(BUS0_ARADDR[9]));
  LUT1 #(
    .INIT(2'h1)) 
    tmp_len0_carry__0_i_1
       (.I0(Q[68]),
        .O(\dout_reg[70]_0 [3]));
  LUT1 #(
    .INIT(2'h1)) 
    tmp_len0_carry__0_i_2
       (.I0(Q[67]),
        .O(\dout_reg[70]_0 [2]));
  LUT1 #(
    .INIT(2'h1)) 
    tmp_len0_carry__0_i_3
       (.I0(Q[66]),
        .O(\dout_reg[70]_0 [1]));
  LUT1 #(
    .INIT(2'h1)) 
    tmp_len0_carry__0_i_4
       (.I0(Q[65]),
        .O(\dout_reg[70]_0 [0]));
  LUT1 #(
    .INIT(2'h1)) 
    tmp_len0_carry__1_i_1
       (.I0(Q[72]),
        .O(S[3]));
  LUT1 #(
    .INIT(2'h1)) 
    tmp_len0_carry__1_i_2
       (.I0(Q[71]),
        .O(S[2]));
  LUT1 #(
    .INIT(2'h1)) 
    tmp_len0_carry__1_i_3
       (.I0(Q[70]),
        .O(S[1]));
  LUT1 #(
    .INIT(2'h1)) 
    tmp_len0_carry__1_i_4
       (.I0(Q[69]),
        .O(S[0]));
  LUT1 #(
    .INIT(2'h1)) 
    tmp_len0_carry__2_i_1
       (.I0(Q[73]),
        .O(\dout_reg[75]_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    tmp_len0_carry_i_1
       (.I0(Q[64]),
        .O(\dout_reg[66]_0 [2]));
  LUT1 #(
    .INIT(2'h1)) 
    tmp_len0_carry_i_2
       (.I0(Q[63]),
        .O(\dout_reg[66]_0 [1]));
  LUT1 #(
    .INIT(2'h1)) 
    tmp_len0_carry_i_3
       (.I0(Q[62]),
        .O(\dout_reg[66]_0 [0]));
  LUT3 #(
    .INIT(8'hDC)) 
    tmp_valid_i_1
       (.I0(ARREADY_Dummy),
        .I1(tmp_valid0),
        .I2(tmp_valid_reg),
        .O(s_ready_t_reg));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    tmp_valid_i_2
       (.I0(E),
        .I1(tmp_valid_i_3_n_2),
        .I2(Q[66]),
        .I3(Q[65]),
        .I4(Q[70]),
        .I5(Q[72]),
        .O(tmp_valid0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    tmp_valid_i_3
       (.I0(Q[63]),
        .I1(Q[67]),
        .I2(Q[62]),
        .I3(Q[64]),
        .I4(tmp_valid_i_4_n_2),
        .O(tmp_valid_i_3_n_2));
  LUT4 #(
    .INIT(16'hFFFE)) 
    tmp_valid_i_4
       (.I0(Q[69]),
        .I1(Q[71]),
        .I2(Q[68]),
        .I3(Q[73]),
        .O(tmp_valid_i_4_n_2));
endmodule

(* ORIG_REF_NAME = "read_romcode_BUS0_m_axi_srl" *) 
module design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_srl__parameterized0
   (SR,
    pop,
    \sect_len_buf_reg[7] ,
    \could_multi_bursts.loop_cnt_reg[3] ,
    din,
    Q,
    ap_clk,
    ap_rst_n,
    \dout_reg[0]_0 ,
    \dout_reg[0]_1 ,
    \dout_reg[0]_2 ,
    RREADY_Dummy,
    burst_valid,
    \dout_reg[0]_3 ,
    \dout_reg[0]_4 ,
    fifo_rctl_ready,
    \dout_reg[0]_5 ,
    m_axi_BUS0_ARREADY,
    \dout_reg[0]_6 ,
    \sect_cnt[51]_i_3 ,
    \sect_cnt[51]_i_3_0 );
  output [0:0]SR;
  output pop;
  output \sect_len_buf_reg[7] ;
  output \could_multi_bursts.loop_cnt_reg[3] ;
  output [0:0]din;
  input [3:0]Q;
  input ap_clk;
  input ap_rst_n;
  input \dout_reg[0]_0 ;
  input [0:0]\dout_reg[0]_1 ;
  input [0:0]\dout_reg[0]_2 ;
  input RREADY_Dummy;
  input burst_valid;
  input \dout_reg[0]_3 ;
  input \dout_reg[0]_4 ;
  input fifo_rctl_ready;
  input \dout_reg[0]_5 ;
  input m_axi_BUS0_ARREADY;
  input \dout_reg[0]_6 ;
  input [3:0]\sect_cnt[51]_i_3 ;
  input [3:0]\sect_cnt[51]_i_3_0 ;

  wire [3:0]Q;
  wire RREADY_Dummy;
  wire [0:0]SR;
  wire ap_clk;
  wire ap_rst_n;
  wire ar2r_info;
  wire burst_valid;
  wire \could_multi_bursts.loop_cnt_reg[3] ;
  wire [0:0]din;
  wire \dout_reg[0]_0 ;
  wire [0:0]\dout_reg[0]_1 ;
  wire [0:0]\dout_reg[0]_2 ;
  wire \dout_reg[0]_3 ;
  wire \dout_reg[0]_4 ;
  wire \dout_reg[0]_5 ;
  wire \dout_reg[0]_6 ;
  wire fifo_rctl_ready;
  wire last_burst;
  wire m_axi_BUS0_ARREADY;
  wire \mem_reg[14][0]_srl15_n_2 ;
  wire pop;
  wire push;
  wire [3:0]\sect_cnt[51]_i_3 ;
  wire [3:0]\sect_cnt[51]_i_3_0 ;
  wire \sect_len_buf_reg[7] ;

  LUT5 #(
    .INIT(32'hFFFF6FF6)) 
    \could_multi_bursts.arlen_buf[5]_i_3 
       (.I0(\sect_cnt[51]_i_3 [1]),
        .I1(\sect_cnt[51]_i_3_0 [1]),
        .I2(\sect_cnt[51]_i_3 [2]),
        .I3(\sect_cnt[51]_i_3_0 [2]),
        .I4(\could_multi_bursts.loop_cnt_reg[3] ),
        .O(\sect_len_buf_reg[7] ));
  LUT4 #(
    .INIT(16'h6FF6)) 
    \could_multi_bursts.arlen_buf[5]_i_4 
       (.I0(\sect_cnt[51]_i_3_0 [3]),
        .I1(\sect_cnt[51]_i_3 [3]),
        .I2(\sect_cnt[51]_i_3_0 [0]),
        .I3(\sect_cnt[51]_i_3 [0]),
        .O(\could_multi_bursts.loop_cnt_reg[3] ));
  LUT5 #(
    .INIT(32'h8000AAAA)) 
    \dout[0]_i_1 
       (.I0(\dout_reg[0]_0 ),
        .I1(\dout_reg[0]_1 ),
        .I2(\dout_reg[0]_2 ),
        .I3(RREADY_Dummy),
        .I4(burst_valid),
        .O(pop));
  FDRE \dout_reg[0] 
       (.C(ap_clk),
        .CE(pop),
        .D(\mem_reg[14][0]_srl15_n_2 ),
        .Q(last_burst),
        .R(SR));
  LUT1 #(
    .INIT(2'h1)) 
    internal_bram_Rst_A_INST_0
       (.I0(ap_rst_n),
        .O(SR));
  (* srl_bus_name = "inst/\BUS0_m_axi_U/bus_read/fifo_burst/U_fifo_srl/mem_reg[14] " *) 
  (* srl_name = "inst/\BUS0_m_axi_U/bus_read/fifo_burst/U_fifo_srl/mem_reg[14][0]_srl15 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \mem_reg[14][0]_srl15 
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .CE(push),
        .CLK(ap_clk),
        .D(ar2r_info),
        .Q(\mem_reg[14][0]_srl15_n_2 ));
  LUT5 #(
    .INIT(32'h80800080)) 
    \mem_reg[14][0]_srl15_i_1 
       (.I0(\dout_reg[0]_3 ),
        .I1(\dout_reg[0]_4 ),
        .I2(fifo_rctl_ready),
        .I3(\dout_reg[0]_5 ),
        .I4(m_axi_BUS0_ARREADY),
        .O(push));
  LUT2 #(
    .INIT(4'h2)) 
    \mem_reg[14][0]_srl15_i_2 
       (.I0(\dout_reg[0]_6 ),
        .I1(\sect_len_buf_reg[7] ),
        .O(ar2r_info));
  LUT3 #(
    .INIT(8'h80)) 
    mem_reg_i_3
       (.I0(last_burst),
        .I1(burst_valid),
        .I2(\dout_reg[0]_1 ),
        .O(din));
endmodule

(* ORIG_REF_NAME = "read_romcode_BUS0_m_axi_write" *) 
module design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_write
   (m_axi_BUS0_BREADY,
    m_axi_BUS0_BVALID,
    SR,
    ap_clk);
  output m_axi_BUS0_BREADY;
  input m_axi_BUS0_BVALID;
  input [0:0]SR;
  input ap_clk;

  wire [0:0]SR;
  wire ap_clk;
  wire m_axi_BUS0_BREADY;
  wire m_axi_BUS0_BVALID;

  design_1_read_romcode_0_0_read_romcode_BUS0_m_axi_reg_slice__parameterized1 rs_resp
       (.SR(SR),
        .ap_clk(ap_clk),
        .m_axi_BUS0_BREADY(m_axi_BUS0_BREADY),
        .m_axi_BUS0_BVALID(m_axi_BUS0_BVALID));
endmodule

(* ORIG_REF_NAME = "read_romcode_control_s_axi" *) 
module design_1_read_romcode_0_0_read_romcode_control_s_axi
   (interrupt,
    \int_length_r_reg[11]_0 ,
    D,
    \FSM_onehot_rstate_reg[1]_0 ,
    s_axi_control_RVALID,
    \FSM_onehot_wstate_reg[2]_0 ,
    s_axi_control_BVALID,
    \int_romcode_reg[63]_0 ,
    \int_length_r_reg[10]_0 ,
    \icmp_ln31_reg_153_reg[0] ,
    sel0,
    \FSM_onehot_wstate_reg[1]_0 ,
    s_axi_control_RDATA,
    SR,
    ap_clk,
    Q,
    ap_done,
    s_axi_control_ARVALID,
    s_axi_control_ARADDR,
    s_axi_control_RREADY,
    s_axi_control_WVALID,
    s_axi_control_BREADY,
    s_axi_control_WSTRB,
    s_axi_control_WDATA,
    \ap_CS_fsm_reg[1] ,
    \ap_CS_fsm_reg[1]_0 ,
    \icmp_ln31_reg_153_reg[0]_0 ,
    s_axi_control_AWVALID,
    s_axi_control_AWADDR);
  output interrupt;
  output \int_length_r_reg[11]_0 ;
  output [1:0]D;
  output \FSM_onehot_rstate_reg[1]_0 ;
  output s_axi_control_RVALID;
  output \FSM_onehot_wstate_reg[2]_0 ;
  output s_axi_control_BVALID;
  output [61:0]\int_romcode_reg[63]_0 ;
  output [10:0]\int_length_r_reg[10]_0 ;
  output \icmp_ln31_reg_153_reg[0] ;
  output [0:0]sel0;
  output \FSM_onehot_wstate_reg[1]_0 ;
  output [31:0]s_axi_control_RDATA;
  input [0:0]SR;
  input ap_clk;
  input [0:0]Q;
  input ap_done;
  input s_axi_control_ARVALID;
  input [5:0]s_axi_control_ARADDR;
  input s_axi_control_RREADY;
  input s_axi_control_WVALID;
  input s_axi_control_BREADY;
  input [3:0]s_axi_control_WSTRB;
  input [31:0]s_axi_control_WDATA;
  input \ap_CS_fsm_reg[1] ;
  input \ap_CS_fsm_reg[1]_0 ;
  input \icmp_ln31_reg_153_reg[0]_0 ;
  input s_axi_control_AWVALID;
  input [5:0]s_axi_control_AWADDR;

  wire [1:0]D;
  wire \FSM_onehot_rstate[1]_i_1_n_2 ;
  wire \FSM_onehot_rstate[2]_i_1_n_2 ;
  wire \FSM_onehot_rstate_reg[1]_0 ;
  wire \FSM_onehot_wstate[1]_i_1_n_2 ;
  wire \FSM_onehot_wstate[2]_i_1_n_2 ;
  wire \FSM_onehot_wstate[3]_i_1_n_2 ;
  wire \FSM_onehot_wstate_reg[1]_0 ;
  wire \FSM_onehot_wstate_reg[2]_0 ;
  wire [0:0]Q;
  wire [0:0]SR;
  wire \ap_CS_fsm_reg[1] ;
  wire \ap_CS_fsm_reg[1]_0 ;
  wire ap_clk;
  wire ap_done;
  wire ap_idle;
  wire ap_start;
  wire ar_hs;
  wire auto_restart_status_i_1_n_2;
  wire auto_restart_status_reg_n_2;
  wire [1:0]data3;
  wire \icmp_ln31_reg_153_reg[0] ;
  wire \icmp_ln31_reg_153_reg[0]_0 ;
  wire int_ap_ready;
  wire int_ap_ready_i_1_n_2;
  wire int_ap_start1;
  wire int_ap_start5_out;
  wire int_ap_start_i_1_n_2;
  wire int_ap_start_i_3_n_2;
  wire int_auto_restart_i_1_n_2;
  wire int_gie_i_1_n_2;
  wire int_gie_i_2_n_2;
  wire int_gie_reg_n_2;
  wire int_ier;
  wire \int_ier[0]_i_1_n_2 ;
  wire \int_ier[1]_i_1_n_2 ;
  wire \int_ier_reg_n_2_[0] ;
  wire \int_ier_reg_n_2_[1] ;
  wire int_interrupt0;
  wire \int_isr[0]_i_1_n_2 ;
  wire \int_isr[0]_i_2_n_2 ;
  wire \int_isr[1]_i_1_n_2 ;
  wire [31:0]int_length_r0;
  wire \int_length_r[31]_i_1_n_2 ;
  wire \int_length_r[31]_i_3_n_2 ;
  wire [10:0]\int_length_r_reg[10]_0 ;
  wire \int_length_r_reg[11]_0 ;
  wire \int_length_r_reg_n_2_[11] ;
  wire \int_length_r_reg_n_2_[12] ;
  wire \int_length_r_reg_n_2_[13] ;
  wire \int_length_r_reg_n_2_[14] ;
  wire \int_length_r_reg_n_2_[15] ;
  wire \int_length_r_reg_n_2_[16] ;
  wire \int_length_r_reg_n_2_[17] ;
  wire \int_length_r_reg_n_2_[18] ;
  wire \int_length_r_reg_n_2_[19] ;
  wire \int_length_r_reg_n_2_[20] ;
  wire \int_length_r_reg_n_2_[21] ;
  wire \int_length_r_reg_n_2_[22] ;
  wire \int_length_r_reg_n_2_[23] ;
  wire \int_length_r_reg_n_2_[24] ;
  wire \int_length_r_reg_n_2_[25] ;
  wire \int_length_r_reg_n_2_[26] ;
  wire \int_length_r_reg_n_2_[27] ;
  wire \int_length_r_reg_n_2_[28] ;
  wire \int_length_r_reg_n_2_[29] ;
  wire \int_length_r_reg_n_2_[30] ;
  wire \int_length_r_reg_n_2_[31] ;
  wire \int_romcode[31]_i_1_n_2 ;
  wire \int_romcode[63]_i_1_n_2 ;
  wire [31:0]int_romcode_reg0;
  wire [31:0]int_romcode_reg02_out;
  wire [61:0]\int_romcode_reg[63]_0 ;
  wire int_task_ap_done;
  wire int_task_ap_done_i_1_n_2;
  wire int_task_ap_done_i_2_n_2;
  wire interrupt;
  wire [31:0]p_0_in;
  wire [7:2]p_3_in;
  wire \rdata[0]_i_2_n_2 ;
  wire \rdata[0]_i_3_n_2 ;
  wire \rdata[1]_i_2_n_2 ;
  wire \rdata[1]_i_3_n_2 ;
  wire \rdata[2]_i_2_n_2 ;
  wire \rdata[31]_i_3_n_2 ;
  wire \rdata[31]_i_4_n_2 ;
  wire \rdata[31]_i_5_n_2 ;
  wire \rdata[3]_i_2_n_2 ;
  wire \rdata[7]_i_2_n_2 ;
  wire \rdata[9]_i_2_n_2 ;
  wire [1:0]romcode;
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
  wire [0:0]sel0;
  wire \select_ln26_reg_147[10]_i_2_n_2 ;
  wire \select_ln26_reg_147[10]_i_3_n_2 ;
  wire \select_ln26_reg_147[10]_i_4_n_2 ;
  wire \select_ln26_reg_147[11]_i_2_n_2 ;
  wire \select_ln26_reg_147[11]_i_3_n_2 ;
  wire \select_ln26_reg_147[11]_i_4_n_2 ;
  wire \select_ln26_reg_147[11]_i_5_n_2 ;
  wire \select_ln26_reg_147[11]_i_6_n_2 ;
  wire task_ap_done;
  wire waddr;
  wire \waddr_reg_n_2_[0] ;
  wire \waddr_reg_n_2_[1] ;
  wire \waddr_reg_n_2_[2] ;
  wire \waddr_reg_n_2_[3] ;
  wire \waddr_reg_n_2_[4] ;
  wire \waddr_reg_n_2_[5] ;

  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT4 #(
    .INIT(16'h8BFB)) 
    \FSM_onehot_rstate[1]_i_1 
       (.I0(s_axi_control_RREADY),
        .I1(s_axi_control_RVALID),
        .I2(\FSM_onehot_rstate_reg[1]_0 ),
        .I3(s_axi_control_ARVALID),
        .O(\FSM_onehot_rstate[1]_i_1_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_rstate[2]_i_1 
       (.I0(s_axi_control_ARVALID),
        .I1(\FSM_onehot_rstate_reg[1]_0 ),
        .I2(s_axi_control_RREADY),
        .I3(s_axi_control_RVALID),
        .O(\FSM_onehot_rstate[2]_i_1_n_2 ));
  (* FSM_ENCODED_STATES = "RDIDLE:010,RDDATA:100,iSTATE:001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_rstate_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_rstate[1]_i_1_n_2 ),
        .Q(\FSM_onehot_rstate_reg[1]_0 ),
        .R(SR));
  (* FSM_ENCODED_STATES = "RDIDLE:010,RDDATA:100,iSTATE:001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_rstate_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_rstate[2]_i_1_n_2 ),
        .Q(s_axi_control_RVALID),
        .R(SR));
  LUT5 #(
    .INIT(32'hFF272227)) 
    \FSM_onehot_wstate[1]_i_1 
       (.I0(\FSM_onehot_wstate_reg[1]_0 ),
        .I1(s_axi_control_AWVALID),
        .I2(\FSM_onehot_wstate_reg[2]_0 ),
        .I3(s_axi_control_BVALID),
        .I4(s_axi_control_BREADY),
        .O(\FSM_onehot_wstate[1]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_wstate[2]_i_1 
       (.I0(s_axi_control_AWVALID),
        .I1(\FSM_onehot_wstate_reg[1]_0 ),
        .I2(s_axi_control_WVALID),
        .I3(\FSM_onehot_wstate_reg[2]_0 ),
        .O(\FSM_onehot_wstate[2]_i_1_n_2 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_wstate[3]_i_1 
       (.I0(s_axi_control_WVALID),
        .I1(\FSM_onehot_wstate_reg[2]_0 ),
        .I2(s_axi_control_BREADY),
        .I3(s_axi_control_BVALID),
        .O(\FSM_onehot_wstate[3]_i_1_n_2 ));
  (* FSM_ENCODED_STATES = "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_wstate[1]_i_1_n_2 ),
        .Q(\FSM_onehot_wstate_reg[1]_0 ),
        .R(SR));
  (* FSM_ENCODED_STATES = "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_wstate[2]_i_1_n_2 ),
        .Q(\FSM_onehot_wstate_reg[2]_0 ),
        .R(SR));
  (* FSM_ENCODED_STATES = "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[3] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_wstate[3]_i_1_n_2 ),
        .Q(s_axi_control_BVALID),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    \ap_CS_fsm[0]_i_1 
       (.I0(ap_start),
        .I1(Q),
        .I2(ap_done),
        .O(D[0]));
  LUT4 #(
    .INIT(16'h88B8)) 
    \ap_CS_fsm[1]_i_1 
       (.I0(ap_start),
        .I1(Q),
        .I2(\ap_CS_fsm_reg[1] ),
        .I3(\ap_CS_fsm_reg[1]_0 ),
        .O(D[1]));
  LUT4 #(
    .INIT(16'hEFAA)) 
    auto_restart_status_i_1
       (.I0(p_3_in[7]),
        .I1(ap_start),
        .I2(Q),
        .I3(auto_restart_status_reg_n_2),
        .O(auto_restart_status_i_1_n_2));
  FDRE #(
    .INIT(1'b0)) 
    auto_restart_status_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(auto_restart_status_i_1_n_2),
        .Q(auto_restart_status_reg_n_2),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT5 #(
    .INIT(32'h222222E2)) 
    \icmp_ln31_reg_153[0]_i_1 
       (.I0(\icmp_ln31_reg_153_reg[0]_0 ),
        .I1(Q),
        .I2(\select_ln26_reg_147[10]_i_2_n_2 ),
        .I3(\int_length_r_reg_n_2_[11] ),
        .I4(\select_ln26_reg_147[11]_i_2_n_2 ),
        .O(\icmp_ln31_reg_153_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT2 #(
    .INIT(4'h2)) 
    int_ap_idle_i_1
       (.I0(Q),
        .I1(ap_start),
        .O(ap_idle));
  FDRE int_ap_idle_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_idle),
        .Q(p_3_in[2]),
        .R(SR));
  LUT6 #(
    .INIT(64'hEFFFEFEF00FF0000)) 
    int_ap_ready_i_1
       (.I0(s_axi_control_ARADDR[3]),
        .I1(s_axi_control_ARADDR[2]),
        .I2(\int_isr[0]_i_2_n_2 ),
        .I3(p_3_in[7]),
        .I4(ap_done),
        .I5(int_ap_ready),
        .O(int_ap_ready_i_1_n_2));
  FDRE #(
    .INIT(1'b0)) 
    int_ap_ready_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(int_ap_ready_i_1_n_2),
        .Q(int_ap_ready),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT4 #(
    .INIT(16'hFBF8)) 
    int_ap_start_i_1
       (.I0(p_3_in[7]),
        .I1(ap_done),
        .I2(int_ap_start5_out),
        .I3(ap_start),
        .O(int_ap_start_i_1_n_2));
  LUT6 #(
    .INIT(64'h0000000000000200)) 
    int_ap_start_i_2
       (.I0(s_axi_control_WDATA[0]),
        .I1(\waddr_reg_n_2_[2] ),
        .I2(int_ap_start_i_3_n_2),
        .I3(s_axi_control_WSTRB[0]),
        .I4(\waddr_reg_n_2_[4] ),
        .I5(\waddr_reg_n_2_[3] ),
        .O(int_ap_start5_out));
  LUT5 #(
    .INIT(32'hFEFFFFFF)) 
    int_ap_start_i_3
       (.I0(\waddr_reg_n_2_[0] ),
        .I1(\waddr_reg_n_2_[1] ),
        .I2(\waddr_reg_n_2_[5] ),
        .I3(s_axi_control_WVALID),
        .I4(\FSM_onehot_wstate_reg[2]_0 ),
        .O(int_ap_start_i_3_n_2));
  FDRE #(
    .INIT(1'b0)) 
    int_ap_start_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(int_ap_start_i_1_n_2),
        .Q(ap_start),
        .R(SR));
  LUT3 #(
    .INIT(8'hB8)) 
    int_auto_restart_i_1
       (.I0(s_axi_control_WDATA[7]),
        .I1(int_ap_start1),
        .I2(p_3_in[7]),
        .O(int_auto_restart_i_1_n_2));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    int_auto_restart_i_2
       (.I0(\waddr_reg_n_2_[3] ),
        .I1(\waddr_reg_n_2_[4] ),
        .I2(s_axi_control_WSTRB[0]),
        .I3(int_ap_start_i_3_n_2),
        .I4(\waddr_reg_n_2_[2] ),
        .O(int_ap_start1));
  FDRE #(
    .INIT(1'b0)) 
    int_auto_restart_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(int_auto_restart_i_1_n_2),
        .Q(p_3_in[7]),
        .R(SR));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    int_gie_i_1
       (.I0(s_axi_control_WDATA[0]),
        .I1(int_gie_i_2_n_2),
        .I2(\waddr_reg_n_2_[2] ),
        .I3(\waddr_reg_n_2_[3] ),
        .I4(int_gie_reg_n_2),
        .O(int_gie_i_1_n_2));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT3 #(
    .INIT(8'h04)) 
    int_gie_i_2
       (.I0(\waddr_reg_n_2_[4] ),
        .I1(s_axi_control_WSTRB[0]),
        .I2(int_ap_start_i_3_n_2),
        .O(int_gie_i_2_n_2));
  FDRE #(
    .INIT(1'b0)) 
    int_gie_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(int_gie_i_1_n_2),
        .Q(int_gie_reg_n_2),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ier[0]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(int_ier),
        .I2(\int_ier_reg_n_2_[0] ),
        .O(\int_ier[0]_i_1_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_ier[1]_i_1 
       (.I0(s_axi_control_WDATA[1]),
        .I1(int_ier),
        .I2(\int_ier_reg_n_2_[1] ),
        .O(\int_ier[1]_i_1_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \int_ier[1]_i_2 
       (.I0(\waddr_reg_n_2_[3] ),
        .I1(\waddr_reg_n_2_[4] ),
        .I2(s_axi_control_WSTRB[0]),
        .I3(int_ap_start_i_3_n_2),
        .I4(\waddr_reg_n_2_[2] ),
        .O(int_ier));
  FDRE #(
    .INIT(1'b0)) 
    \int_ier_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\int_ier[0]_i_1_n_2 ),
        .Q(\int_ier_reg_n_2_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_ier_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\int_ier[1]_i_1_n_2 ),
        .Q(\int_ier_reg_n_2_[1] ),
        .R(SR));
  LUT3 #(
    .INIT(8'hA8)) 
    int_interrupt_i_1
       (.I0(int_gie_reg_n_2),
        .I1(data3[1]),
        .I2(data3[0]),
        .O(int_interrupt0));
  FDRE #(
    .INIT(1'b0)) 
    int_interrupt_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(int_interrupt0),
        .Q(interrupt),
        .R(SR));
  LUT6 #(
    .INIT(64'h8FFFFFFF88888888)) 
    \int_isr[0]_i_1 
       (.I0(ap_done),
        .I1(\int_ier_reg_n_2_[0] ),
        .I2(s_axi_control_ARADDR[3]),
        .I3(s_axi_control_ARADDR[2]),
        .I4(\int_isr[0]_i_2_n_2 ),
        .I5(data3[0]),
        .O(\int_isr[0]_i_1_n_2 ));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \int_isr[0]_i_2 
       (.I0(s_axi_control_ARVALID),
        .I1(\FSM_onehot_rstate_reg[1]_0 ),
        .I2(s_axi_control_ARADDR[4]),
        .I3(s_axi_control_ARADDR[5]),
        .I4(s_axi_control_ARADDR[0]),
        .I5(s_axi_control_ARADDR[1]),
        .O(\int_isr[0]_i_2_n_2 ));
  LUT6 #(
    .INIT(64'hFF7F7F7FFF000000)) 
    \int_isr[1]_i_1 
       (.I0(s_axi_control_ARADDR[3]),
        .I1(s_axi_control_ARADDR[2]),
        .I2(\int_isr[0]_i_2_n_2 ),
        .I3(ap_done),
        .I4(\int_ier_reg_n_2_[1] ),
        .I5(data3[1]),
        .O(\int_isr[1]_i_1_n_2 ));
  FDRE #(
    .INIT(1'b0)) 
    \int_isr_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\int_isr[0]_i_1_n_2 ),
        .Q(data3[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_isr_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\int_isr[1]_i_1_n_2 ),
        .Q(data3[1]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair179" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[0]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_length_r_reg[10]_0 [0]),
        .O(int_length_r0[0]));
  (* SOFT_HLUTNM = "soft_lutpair174" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[10]_i_1 
       (.I0(s_axi_control_WDATA[10]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_length_r_reg[10]_0 [10]),
        .O(int_length_r0[10]));
  (* SOFT_HLUTNM = "soft_lutpair174" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[11]_i_1 
       (.I0(s_axi_control_WDATA[11]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_length_r_reg_n_2_[11] ),
        .O(int_length_r0[11]));
  (* SOFT_HLUTNM = "soft_lutpair173" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[12]_i_1 
       (.I0(s_axi_control_WDATA[12]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_length_r_reg_n_2_[12] ),
        .O(int_length_r0[12]));
  (* SOFT_HLUTNM = "soft_lutpair173" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[13]_i_1 
       (.I0(s_axi_control_WDATA[13]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_length_r_reg_n_2_[13] ),
        .O(int_length_r0[13]));
  (* SOFT_HLUTNM = "soft_lutpair172" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[14]_i_1 
       (.I0(s_axi_control_WDATA[14]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_length_r_reg_n_2_[14] ),
        .O(int_length_r0[14]));
  (* SOFT_HLUTNM = "soft_lutpair172" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[15]_i_1 
       (.I0(s_axi_control_WDATA[15]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_length_r_reg_n_2_[15] ),
        .O(int_length_r0[15]));
  (* SOFT_HLUTNM = "soft_lutpair171" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[16]_i_1 
       (.I0(s_axi_control_WDATA[16]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_length_r_reg_n_2_[16] ),
        .O(int_length_r0[16]));
  (* SOFT_HLUTNM = "soft_lutpair171" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[17]_i_1 
       (.I0(s_axi_control_WDATA[17]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_length_r_reg_n_2_[17] ),
        .O(int_length_r0[17]));
  (* SOFT_HLUTNM = "soft_lutpair170" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[18]_i_1 
       (.I0(s_axi_control_WDATA[18]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_length_r_reg_n_2_[18] ),
        .O(int_length_r0[18]));
  (* SOFT_HLUTNM = "soft_lutpair170" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[19]_i_1 
       (.I0(s_axi_control_WDATA[19]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_length_r_reg_n_2_[19] ),
        .O(int_length_r0[19]));
  (* SOFT_HLUTNM = "soft_lutpair179" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[1]_i_1 
       (.I0(s_axi_control_WDATA[1]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_length_r_reg[10]_0 [1]),
        .O(int_length_r0[1]));
  (* SOFT_HLUTNM = "soft_lutpair169" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[20]_i_1 
       (.I0(s_axi_control_WDATA[20]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_length_r_reg_n_2_[20] ),
        .O(int_length_r0[20]));
  (* SOFT_HLUTNM = "soft_lutpair169" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[21]_i_1 
       (.I0(s_axi_control_WDATA[21]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_length_r_reg_n_2_[21] ),
        .O(int_length_r0[21]));
  (* SOFT_HLUTNM = "soft_lutpair168" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[22]_i_1 
       (.I0(s_axi_control_WDATA[22]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_length_r_reg_n_2_[22] ),
        .O(int_length_r0[22]));
  (* SOFT_HLUTNM = "soft_lutpair168" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[23]_i_1 
       (.I0(s_axi_control_WDATA[23]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_length_r_reg_n_2_[23] ),
        .O(int_length_r0[23]));
  (* SOFT_HLUTNM = "soft_lutpair167" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[24]_i_1 
       (.I0(s_axi_control_WDATA[24]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_length_r_reg_n_2_[24] ),
        .O(int_length_r0[24]));
  (* SOFT_HLUTNM = "soft_lutpair167" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[25]_i_1 
       (.I0(s_axi_control_WDATA[25]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_length_r_reg_n_2_[25] ),
        .O(int_length_r0[25]));
  (* SOFT_HLUTNM = "soft_lutpair166" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[26]_i_1 
       (.I0(s_axi_control_WDATA[26]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_length_r_reg_n_2_[26] ),
        .O(int_length_r0[26]));
  (* SOFT_HLUTNM = "soft_lutpair166" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[27]_i_1 
       (.I0(s_axi_control_WDATA[27]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_length_r_reg_n_2_[27] ),
        .O(int_length_r0[27]));
  (* SOFT_HLUTNM = "soft_lutpair165" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[28]_i_1 
       (.I0(s_axi_control_WDATA[28]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_length_r_reg_n_2_[28] ),
        .O(int_length_r0[28]));
  (* SOFT_HLUTNM = "soft_lutpair165" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[29]_i_1 
       (.I0(s_axi_control_WDATA[29]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_length_r_reg_n_2_[29] ),
        .O(int_length_r0[29]));
  (* SOFT_HLUTNM = "soft_lutpair178" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[2]_i_1 
       (.I0(s_axi_control_WDATA[2]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_length_r_reg[10]_0 [2]),
        .O(int_length_r0[2]));
  (* SOFT_HLUTNM = "soft_lutpair164" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[30]_i_1 
       (.I0(s_axi_control_WDATA[30]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_length_r_reg_n_2_[30] ),
        .O(int_length_r0[30]));
  LUT3 #(
    .INIT(8'h80)) 
    \int_length_r[31]_i_1 
       (.I0(\int_length_r[31]_i_3_n_2 ),
        .I1(\waddr_reg_n_2_[3] ),
        .I2(\waddr_reg_n_2_[2] ),
        .O(\int_length_r[31]_i_1_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair164" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[31]_i_2 
       (.I0(s_axi_control_WDATA[31]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_length_r_reg_n_2_[31] ),
        .O(int_length_r0[31]));
  LUT6 #(
    .INIT(64'h0000000000000080)) 
    \int_length_r[31]_i_3 
       (.I0(\waddr_reg_n_2_[4] ),
        .I1(\FSM_onehot_wstate_reg[2]_0 ),
        .I2(s_axi_control_WVALID),
        .I3(\waddr_reg_n_2_[5] ),
        .I4(\waddr_reg_n_2_[1] ),
        .I5(\waddr_reg_n_2_[0] ),
        .O(\int_length_r[31]_i_3_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair178" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[3]_i_1 
       (.I0(s_axi_control_WDATA[3]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_length_r_reg[10]_0 [3]),
        .O(int_length_r0[3]));
  (* SOFT_HLUTNM = "soft_lutpair177" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[4]_i_1 
       (.I0(s_axi_control_WDATA[4]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_length_r_reg[10]_0 [4]),
        .O(int_length_r0[4]));
  (* SOFT_HLUTNM = "soft_lutpair177" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[5]_i_1 
       (.I0(s_axi_control_WDATA[5]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_length_r_reg[10]_0 [5]),
        .O(int_length_r0[5]));
  (* SOFT_HLUTNM = "soft_lutpair176" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[6]_i_1 
       (.I0(s_axi_control_WDATA[6]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_length_r_reg[10]_0 [6]),
        .O(int_length_r0[6]));
  (* SOFT_HLUTNM = "soft_lutpair176" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[7]_i_1 
       (.I0(s_axi_control_WDATA[7]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_length_r_reg[10]_0 [7]),
        .O(int_length_r0[7]));
  (* SOFT_HLUTNM = "soft_lutpair175" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[8]_i_1 
       (.I0(s_axi_control_WDATA[8]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_length_r_reg[10]_0 [8]),
        .O(int_length_r0[8]));
  (* SOFT_HLUTNM = "soft_lutpair175" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_length_r[9]_i_1 
       (.I0(s_axi_control_WDATA[9]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_length_r_reg[10]_0 [9]),
        .O(int_length_r0[9]));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[0] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[0]),
        .Q(\int_length_r_reg[10]_0 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[10] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[10]),
        .Q(\int_length_r_reg[10]_0 [10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[11] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[11]),
        .Q(\int_length_r_reg_n_2_[11] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[12] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[12]),
        .Q(\int_length_r_reg_n_2_[12] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[13] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[13]),
        .Q(\int_length_r_reg_n_2_[13] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[14] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[14]),
        .Q(\int_length_r_reg_n_2_[14] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[15] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[15]),
        .Q(\int_length_r_reg_n_2_[15] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[16] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[16]),
        .Q(\int_length_r_reg_n_2_[16] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[17] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[17]),
        .Q(\int_length_r_reg_n_2_[17] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[18] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[18]),
        .Q(\int_length_r_reg_n_2_[18] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[19] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[19]),
        .Q(\int_length_r_reg_n_2_[19] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[1] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[1]),
        .Q(\int_length_r_reg[10]_0 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[20] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[20]),
        .Q(\int_length_r_reg_n_2_[20] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[21] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[21]),
        .Q(\int_length_r_reg_n_2_[21] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[22] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[22]),
        .Q(\int_length_r_reg_n_2_[22] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[23] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[23]),
        .Q(\int_length_r_reg_n_2_[23] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[24] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[24]),
        .Q(\int_length_r_reg_n_2_[24] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[25] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[25]),
        .Q(\int_length_r_reg_n_2_[25] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[26] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[26]),
        .Q(\int_length_r_reg_n_2_[26] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[27] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[27]),
        .Q(\int_length_r_reg_n_2_[27] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[28] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[28]),
        .Q(\int_length_r_reg_n_2_[28] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[29] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[29]),
        .Q(\int_length_r_reg_n_2_[29] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[2] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[2]),
        .Q(\int_length_r_reg[10]_0 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[30] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[30]),
        .Q(\int_length_r_reg_n_2_[30] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[31] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[31]),
        .Q(\int_length_r_reg_n_2_[31] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[3] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[3]),
        .Q(\int_length_r_reg[10]_0 [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[4] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[4]),
        .Q(\int_length_r_reg[10]_0 [4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[5] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[5]),
        .Q(\int_length_r_reg[10]_0 [5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[6] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[6]),
        .Q(\int_length_r_reg[10]_0 [6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[7] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[7]),
        .Q(\int_length_r_reg[10]_0 [7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[8] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[8]),
        .Q(\int_length_r_reg[10]_0 [8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_length_r_reg[9] 
       (.C(ap_clk),
        .CE(\int_length_r[31]_i_1_n_2 ),
        .D(int_length_r0[9]),
        .Q(\int_length_r_reg[10]_0 [9]),
        .R(SR));
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[0]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(romcode[0]),
        .O(int_romcode_reg02_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair143" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[10]_i_1 
       (.I0(s_axi_control_WDATA[10]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_romcode_reg[63]_0 [8]),
        .O(int_romcode_reg02_out[10]));
  (* SOFT_HLUTNM = "soft_lutpair143" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[11]_i_1 
       (.I0(s_axi_control_WDATA[11]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_romcode_reg[63]_0 [9]),
        .O(int_romcode_reg02_out[11]));
  (* SOFT_HLUTNM = "soft_lutpair142" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[12]_i_1 
       (.I0(s_axi_control_WDATA[12]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_romcode_reg[63]_0 [10]),
        .O(int_romcode_reg02_out[12]));
  (* SOFT_HLUTNM = "soft_lutpair142" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[13]_i_1 
       (.I0(s_axi_control_WDATA[13]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_romcode_reg[63]_0 [11]),
        .O(int_romcode_reg02_out[13]));
  (* SOFT_HLUTNM = "soft_lutpair141" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[14]_i_1 
       (.I0(s_axi_control_WDATA[14]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_romcode_reg[63]_0 [12]),
        .O(int_romcode_reg02_out[14]));
  (* SOFT_HLUTNM = "soft_lutpair141" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[15]_i_1 
       (.I0(s_axi_control_WDATA[15]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_romcode_reg[63]_0 [13]),
        .O(int_romcode_reg02_out[15]));
  (* SOFT_HLUTNM = "soft_lutpair140" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[16]_i_1 
       (.I0(s_axi_control_WDATA[16]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_romcode_reg[63]_0 [14]),
        .O(int_romcode_reg02_out[16]));
  (* SOFT_HLUTNM = "soft_lutpair140" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[17]_i_1 
       (.I0(s_axi_control_WDATA[17]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_romcode_reg[63]_0 [15]),
        .O(int_romcode_reg02_out[17]));
  (* SOFT_HLUTNM = "soft_lutpair139" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[18]_i_1 
       (.I0(s_axi_control_WDATA[18]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_romcode_reg[63]_0 [16]),
        .O(int_romcode_reg02_out[18]));
  (* SOFT_HLUTNM = "soft_lutpair139" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[19]_i_1 
       (.I0(s_axi_control_WDATA[19]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_romcode_reg[63]_0 [17]),
        .O(int_romcode_reg02_out[19]));
  (* SOFT_HLUTNM = "soft_lutpair147" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[1]_i_1 
       (.I0(s_axi_control_WDATA[1]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(romcode[1]),
        .O(int_romcode_reg02_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair138" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[20]_i_1 
       (.I0(s_axi_control_WDATA[20]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_romcode_reg[63]_0 [18]),
        .O(int_romcode_reg02_out[20]));
  (* SOFT_HLUTNM = "soft_lutpair138" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[21]_i_1 
       (.I0(s_axi_control_WDATA[21]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_romcode_reg[63]_0 [19]),
        .O(int_romcode_reg02_out[21]));
  (* SOFT_HLUTNM = "soft_lutpair137" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[22]_i_1 
       (.I0(s_axi_control_WDATA[22]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_romcode_reg[63]_0 [20]),
        .O(int_romcode_reg02_out[22]));
  (* SOFT_HLUTNM = "soft_lutpair137" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[23]_i_1 
       (.I0(s_axi_control_WDATA[23]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_romcode_reg[63]_0 [21]),
        .O(int_romcode_reg02_out[23]));
  (* SOFT_HLUTNM = "soft_lutpair136" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[24]_i_1 
       (.I0(s_axi_control_WDATA[24]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_romcode_reg[63]_0 [22]),
        .O(int_romcode_reg02_out[24]));
  (* SOFT_HLUTNM = "soft_lutpair136" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[25]_i_1 
       (.I0(s_axi_control_WDATA[25]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_romcode_reg[63]_0 [23]),
        .O(int_romcode_reg02_out[25]));
  (* SOFT_HLUTNM = "soft_lutpair135" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[26]_i_1 
       (.I0(s_axi_control_WDATA[26]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_romcode_reg[63]_0 [24]),
        .O(int_romcode_reg02_out[26]));
  (* SOFT_HLUTNM = "soft_lutpair135" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[27]_i_1 
       (.I0(s_axi_control_WDATA[27]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_romcode_reg[63]_0 [25]),
        .O(int_romcode_reg02_out[27]));
  (* SOFT_HLUTNM = "soft_lutpair134" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[28]_i_1 
       (.I0(s_axi_control_WDATA[28]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_romcode_reg[63]_0 [26]),
        .O(int_romcode_reg02_out[28]));
  (* SOFT_HLUTNM = "soft_lutpair134" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[29]_i_1 
       (.I0(s_axi_control_WDATA[29]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_romcode_reg[63]_0 [27]),
        .O(int_romcode_reg02_out[29]));
  (* SOFT_HLUTNM = "soft_lutpair147" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[2]_i_1 
       (.I0(s_axi_control_WDATA[2]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_romcode_reg[63]_0 [0]),
        .O(int_romcode_reg02_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair133" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[30]_i_1 
       (.I0(s_axi_control_WDATA[30]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_romcode_reg[63]_0 [28]),
        .O(int_romcode_reg02_out[30]));
  LUT3 #(
    .INIT(8'h02)) 
    \int_romcode[31]_i_1 
       (.I0(\int_length_r[31]_i_3_n_2 ),
        .I1(\waddr_reg_n_2_[3] ),
        .I2(\waddr_reg_n_2_[2] ),
        .O(\int_romcode[31]_i_1_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair133" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[31]_i_2 
       (.I0(s_axi_control_WDATA[31]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_romcode_reg[63]_0 [29]),
        .O(int_romcode_reg02_out[31]));
  (* SOFT_HLUTNM = "soft_lutpair163" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[32]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_romcode_reg[63]_0 [30]),
        .O(int_romcode_reg0[0]));
  (* SOFT_HLUTNM = "soft_lutpair163" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[33]_i_1 
       (.I0(s_axi_control_WDATA[1]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_romcode_reg[63]_0 [31]),
        .O(int_romcode_reg0[1]));
  (* SOFT_HLUTNM = "soft_lutpair162" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[34]_i_1 
       (.I0(s_axi_control_WDATA[2]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_romcode_reg[63]_0 [32]),
        .O(int_romcode_reg0[2]));
  (* SOFT_HLUTNM = "soft_lutpair162" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[35]_i_1 
       (.I0(s_axi_control_WDATA[3]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_romcode_reg[63]_0 [33]),
        .O(int_romcode_reg0[3]));
  (* SOFT_HLUTNM = "soft_lutpair161" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[36]_i_1 
       (.I0(s_axi_control_WDATA[4]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_romcode_reg[63]_0 [34]),
        .O(int_romcode_reg0[4]));
  (* SOFT_HLUTNM = "soft_lutpair161" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[37]_i_1 
       (.I0(s_axi_control_WDATA[5]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_romcode_reg[63]_0 [35]),
        .O(int_romcode_reg0[5]));
  (* SOFT_HLUTNM = "soft_lutpair160" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[38]_i_1 
       (.I0(s_axi_control_WDATA[6]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_romcode_reg[63]_0 [36]),
        .O(int_romcode_reg0[6]));
  (* SOFT_HLUTNM = "soft_lutpair160" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[39]_i_1 
       (.I0(s_axi_control_WDATA[7]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_romcode_reg[63]_0 [37]),
        .O(int_romcode_reg0[7]));
  (* SOFT_HLUTNM = "soft_lutpair146" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[3]_i_1 
       (.I0(s_axi_control_WDATA[3]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_romcode_reg[63]_0 [1]),
        .O(int_romcode_reg02_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair159" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[40]_i_1 
       (.I0(s_axi_control_WDATA[8]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_romcode_reg[63]_0 [38]),
        .O(int_romcode_reg0[8]));
  (* SOFT_HLUTNM = "soft_lutpair159" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[41]_i_1 
       (.I0(s_axi_control_WDATA[9]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_romcode_reg[63]_0 [39]),
        .O(int_romcode_reg0[9]));
  (* SOFT_HLUTNM = "soft_lutpair158" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[42]_i_1 
       (.I0(s_axi_control_WDATA[10]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_romcode_reg[63]_0 [40]),
        .O(int_romcode_reg0[10]));
  (* SOFT_HLUTNM = "soft_lutpair158" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[43]_i_1 
       (.I0(s_axi_control_WDATA[11]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_romcode_reg[63]_0 [41]),
        .O(int_romcode_reg0[11]));
  (* SOFT_HLUTNM = "soft_lutpair157" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[44]_i_1 
       (.I0(s_axi_control_WDATA[12]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_romcode_reg[63]_0 [42]),
        .O(int_romcode_reg0[12]));
  (* SOFT_HLUTNM = "soft_lutpair157" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[45]_i_1 
       (.I0(s_axi_control_WDATA[13]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_romcode_reg[63]_0 [43]),
        .O(int_romcode_reg0[13]));
  (* SOFT_HLUTNM = "soft_lutpair156" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[46]_i_1 
       (.I0(s_axi_control_WDATA[14]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_romcode_reg[63]_0 [44]),
        .O(int_romcode_reg0[14]));
  (* SOFT_HLUTNM = "soft_lutpair156" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[47]_i_1 
       (.I0(s_axi_control_WDATA[15]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_romcode_reg[63]_0 [45]),
        .O(int_romcode_reg0[15]));
  (* SOFT_HLUTNM = "soft_lutpair155" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[48]_i_1 
       (.I0(s_axi_control_WDATA[16]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_romcode_reg[63]_0 [46]),
        .O(int_romcode_reg0[16]));
  (* SOFT_HLUTNM = "soft_lutpair155" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[49]_i_1 
       (.I0(s_axi_control_WDATA[17]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_romcode_reg[63]_0 [47]),
        .O(int_romcode_reg0[17]));
  (* SOFT_HLUTNM = "soft_lutpair146" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[4]_i_1 
       (.I0(s_axi_control_WDATA[4]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_romcode_reg[63]_0 [2]),
        .O(int_romcode_reg02_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair154" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[50]_i_1 
       (.I0(s_axi_control_WDATA[18]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_romcode_reg[63]_0 [48]),
        .O(int_romcode_reg0[18]));
  (* SOFT_HLUTNM = "soft_lutpair154" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[51]_i_1 
       (.I0(s_axi_control_WDATA[19]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_romcode_reg[63]_0 [49]),
        .O(int_romcode_reg0[19]));
  (* SOFT_HLUTNM = "soft_lutpair153" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[52]_i_1 
       (.I0(s_axi_control_WDATA[20]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_romcode_reg[63]_0 [50]),
        .O(int_romcode_reg0[20]));
  (* SOFT_HLUTNM = "soft_lutpair153" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[53]_i_1 
       (.I0(s_axi_control_WDATA[21]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_romcode_reg[63]_0 [51]),
        .O(int_romcode_reg0[21]));
  (* SOFT_HLUTNM = "soft_lutpair152" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[54]_i_1 
       (.I0(s_axi_control_WDATA[22]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_romcode_reg[63]_0 [52]),
        .O(int_romcode_reg0[22]));
  (* SOFT_HLUTNM = "soft_lutpair152" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[55]_i_1 
       (.I0(s_axi_control_WDATA[23]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\int_romcode_reg[63]_0 [53]),
        .O(int_romcode_reg0[23]));
  (* SOFT_HLUTNM = "soft_lutpair151" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[56]_i_1 
       (.I0(s_axi_control_WDATA[24]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_romcode_reg[63]_0 [54]),
        .O(int_romcode_reg0[24]));
  (* SOFT_HLUTNM = "soft_lutpair151" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[57]_i_1 
       (.I0(s_axi_control_WDATA[25]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_romcode_reg[63]_0 [55]),
        .O(int_romcode_reg0[25]));
  (* SOFT_HLUTNM = "soft_lutpair150" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[58]_i_1 
       (.I0(s_axi_control_WDATA[26]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_romcode_reg[63]_0 [56]),
        .O(int_romcode_reg0[26]));
  (* SOFT_HLUTNM = "soft_lutpair150" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[59]_i_1 
       (.I0(s_axi_control_WDATA[27]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_romcode_reg[63]_0 [57]),
        .O(int_romcode_reg0[27]));
  (* SOFT_HLUTNM = "soft_lutpair145" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[5]_i_1 
       (.I0(s_axi_control_WDATA[5]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_romcode_reg[63]_0 [3]),
        .O(int_romcode_reg02_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair149" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[60]_i_1 
       (.I0(s_axi_control_WDATA[28]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_romcode_reg[63]_0 [58]),
        .O(int_romcode_reg0[28]));
  (* SOFT_HLUTNM = "soft_lutpair149" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[61]_i_1 
       (.I0(s_axi_control_WDATA[29]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_romcode_reg[63]_0 [59]),
        .O(int_romcode_reg0[29]));
  (* SOFT_HLUTNM = "soft_lutpair148" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[62]_i_1 
       (.I0(s_axi_control_WDATA[30]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_romcode_reg[63]_0 [60]),
        .O(int_romcode_reg0[30]));
  LUT3 #(
    .INIT(8'h08)) 
    \int_romcode[63]_i_1 
       (.I0(\int_length_r[31]_i_3_n_2 ),
        .I1(\waddr_reg_n_2_[2] ),
        .I2(\waddr_reg_n_2_[3] ),
        .O(\int_romcode[63]_i_1_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair148" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[63]_i_2 
       (.I0(s_axi_control_WDATA[31]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\int_romcode_reg[63]_0 [61]),
        .O(int_romcode_reg0[31]));
  (* SOFT_HLUTNM = "soft_lutpair145" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[6]_i_1 
       (.I0(s_axi_control_WDATA[6]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_romcode_reg[63]_0 [4]),
        .O(int_romcode_reg02_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[7]_i_1 
       (.I0(s_axi_control_WDATA[7]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\int_romcode_reg[63]_0 [5]),
        .O(int_romcode_reg02_out[7]));
  (* SOFT_HLUTNM = "soft_lutpair144" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[8]_i_1 
       (.I0(s_axi_control_WDATA[8]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_romcode_reg[63]_0 [6]),
        .O(int_romcode_reg02_out[8]));
  (* SOFT_HLUTNM = "soft_lutpair144" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_romcode[9]_i_1 
       (.I0(s_axi_control_WDATA[9]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\int_romcode_reg[63]_0 [7]),
        .O(int_romcode_reg02_out[9]));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[0] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[0]),
        .Q(romcode[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[10] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[10]),
        .Q(\int_romcode_reg[63]_0 [8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[11] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[11]),
        .Q(\int_romcode_reg[63]_0 [9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[12] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[12]),
        .Q(\int_romcode_reg[63]_0 [10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[13] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[13]),
        .Q(\int_romcode_reg[63]_0 [11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[14] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[14]),
        .Q(\int_romcode_reg[63]_0 [12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[15] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[15]),
        .Q(\int_romcode_reg[63]_0 [13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[16] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[16]),
        .Q(\int_romcode_reg[63]_0 [14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[17] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[17]),
        .Q(\int_romcode_reg[63]_0 [15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[18] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[18]),
        .Q(\int_romcode_reg[63]_0 [16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[19] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[19]),
        .Q(\int_romcode_reg[63]_0 [17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[1] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[1]),
        .Q(romcode[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[20] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[20]),
        .Q(\int_romcode_reg[63]_0 [18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[21] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[21]),
        .Q(\int_romcode_reg[63]_0 [19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[22] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[22]),
        .Q(\int_romcode_reg[63]_0 [20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[23] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[23]),
        .Q(\int_romcode_reg[63]_0 [21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[24] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[24]),
        .Q(\int_romcode_reg[63]_0 [22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[25] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[25]),
        .Q(\int_romcode_reg[63]_0 [23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[26] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[26]),
        .Q(\int_romcode_reg[63]_0 [24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[27] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[27]),
        .Q(\int_romcode_reg[63]_0 [25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[28] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[28]),
        .Q(\int_romcode_reg[63]_0 [26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[29] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[29]),
        .Q(\int_romcode_reg[63]_0 [27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[2] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[2]),
        .Q(\int_romcode_reg[63]_0 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[30] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[30]),
        .Q(\int_romcode_reg[63]_0 [28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[31] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[31]),
        .Q(\int_romcode_reg[63]_0 [29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[32] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[0]),
        .Q(\int_romcode_reg[63]_0 [30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[33] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[1]),
        .Q(\int_romcode_reg[63]_0 [31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[34] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[2]),
        .Q(\int_romcode_reg[63]_0 [32]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[35] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[3]),
        .Q(\int_romcode_reg[63]_0 [33]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[36] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[4]),
        .Q(\int_romcode_reg[63]_0 [34]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[37] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[5]),
        .Q(\int_romcode_reg[63]_0 [35]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[38] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[6]),
        .Q(\int_romcode_reg[63]_0 [36]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[39] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[7]),
        .Q(\int_romcode_reg[63]_0 [37]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[3] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[3]),
        .Q(\int_romcode_reg[63]_0 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[40] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[8]),
        .Q(\int_romcode_reg[63]_0 [38]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[41] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[9]),
        .Q(\int_romcode_reg[63]_0 [39]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[42] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[10]),
        .Q(\int_romcode_reg[63]_0 [40]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[43] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[11]),
        .Q(\int_romcode_reg[63]_0 [41]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[44] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[12]),
        .Q(\int_romcode_reg[63]_0 [42]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[45] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[13]),
        .Q(\int_romcode_reg[63]_0 [43]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[46] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[14]),
        .Q(\int_romcode_reg[63]_0 [44]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[47] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[15]),
        .Q(\int_romcode_reg[63]_0 [45]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[48] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[16]),
        .Q(\int_romcode_reg[63]_0 [46]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[49] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[17]),
        .Q(\int_romcode_reg[63]_0 [47]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[4] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[4]),
        .Q(\int_romcode_reg[63]_0 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[50] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[18]),
        .Q(\int_romcode_reg[63]_0 [48]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[51] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[19]),
        .Q(\int_romcode_reg[63]_0 [49]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[52] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[20]),
        .Q(\int_romcode_reg[63]_0 [50]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[53] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[21]),
        .Q(\int_romcode_reg[63]_0 [51]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[54] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[22]),
        .Q(\int_romcode_reg[63]_0 [52]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[55] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[23]),
        .Q(\int_romcode_reg[63]_0 [53]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[56] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[24]),
        .Q(\int_romcode_reg[63]_0 [54]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[57] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[25]),
        .Q(\int_romcode_reg[63]_0 [55]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[58] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[26]),
        .Q(\int_romcode_reg[63]_0 [56]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[59] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[27]),
        .Q(\int_romcode_reg[63]_0 [57]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[5] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[5]),
        .Q(\int_romcode_reg[63]_0 [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[60] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[28]),
        .Q(\int_romcode_reg[63]_0 [58]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[61] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[29]),
        .Q(\int_romcode_reg[63]_0 [59]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[62] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[30]),
        .Q(\int_romcode_reg[63]_0 [60]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[63] 
       (.C(ap_clk),
        .CE(\int_romcode[63]_i_1_n_2 ),
        .D(int_romcode_reg0[31]),
        .Q(\int_romcode_reg[63]_0 [61]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[6] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[6]),
        .Q(\int_romcode_reg[63]_0 [4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[7] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[7]),
        .Q(\int_romcode_reg[63]_0 [5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[8] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[8]),
        .Q(\int_romcode_reg[63]_0 [6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \int_romcode_reg[9] 
       (.C(ap_clk),
        .CE(\int_romcode[31]_i_1_n_2 ),
        .D(int_romcode_reg02_out[9]),
        .Q(\int_romcode_reg[63]_0 [7]),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFFEFFFFFFF0000)) 
    int_task_ap_done_i_1
       (.I0(s_axi_control_ARADDR[3]),
        .I1(s_axi_control_ARADDR[2]),
        .I2(ar_hs),
        .I3(int_task_ap_done_i_2_n_2),
        .I4(task_ap_done),
        .I5(int_task_ap_done),
        .O(int_task_ap_done_i_1_n_2));
  LUT4 #(
    .INIT(16'h0001)) 
    int_task_ap_done_i_2
       (.I0(s_axi_control_ARADDR[1]),
        .I1(s_axi_control_ARADDR[0]),
        .I2(s_axi_control_ARADDR[5]),
        .I3(s_axi_control_ARADDR[4]),
        .O(int_task_ap_done_i_2_n_2));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT5 #(
    .INIT(32'h04FF0400)) 
    int_task_ap_done_i_3
       (.I0(ap_start),
        .I1(Q),
        .I2(p_3_in[2]),
        .I3(auto_restart_status_reg_n_2),
        .I4(ap_done),
        .O(task_ap_done));
  FDRE #(
    .INIT(1'b0)) 
    int_task_ap_done_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(int_task_ap_done_i_1_n_2),
        .Q(int_task_ap_done),
        .R(SR));
  LUT6 #(
    .INIT(64'h0303030303030305)) 
    \rdata[0]_i_1 
       (.I0(\rdata[0]_i_2_n_2 ),
        .I1(\rdata[0]_i_3_n_2 ),
        .I2(s_axi_control_ARADDR[5]),
        .I3(s_axi_control_ARADDR[0]),
        .I4(s_axi_control_ARADDR[1]),
        .I5(s_axi_control_ARADDR[4]),
        .O(p_0_in[0]));
  LUT6 #(
    .INIT(64'h553355330F000FFF)) 
    \rdata[0]_i_2 
       (.I0(ap_start),
        .I1(int_gie_reg_n_2),
        .I2(\int_ier_reg_n_2_[0] ),
        .I3(\rdata[31]_i_4_n_2 ),
        .I4(data3[0]),
        .I5(\rdata[31]_i_5_n_2 ),
        .O(\rdata[0]_i_2_n_2 ));
  LUT5 #(
    .INIT(32'h303F5F5F)) 
    \rdata[0]_i_3 
       (.I0(\int_length_r_reg[10]_0 [0]),
        .I1(romcode[0]),
        .I2(\rdata[31]_i_4_n_2 ),
        .I3(\int_romcode_reg[63]_0 [30]),
        .I4(\rdata[31]_i_5_n_2 ),
        .O(\rdata[0]_i_3_n_2 ));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[10]_i_1 
       (.I0(\int_romcode_reg[63]_0 [8]),
        .I1(\int_romcode_reg[63]_0 [40]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg[10]_0 [10]),
        .O(p_0_in[10]));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[11]_i_1 
       (.I0(\int_romcode_reg[63]_0 [9]),
        .I1(\int_romcode_reg[63]_0 [41]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg_n_2_[11] ),
        .O(p_0_in[11]));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[12]_i_1 
       (.I0(\int_romcode_reg[63]_0 [10]),
        .I1(\int_romcode_reg[63]_0 [42]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg_n_2_[12] ),
        .O(p_0_in[12]));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[13]_i_1 
       (.I0(\int_romcode_reg[63]_0 [11]),
        .I1(\int_romcode_reg[63]_0 [43]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg_n_2_[13] ),
        .O(p_0_in[13]));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[14]_i_1 
       (.I0(\int_romcode_reg[63]_0 [12]),
        .I1(\int_romcode_reg[63]_0 [44]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg_n_2_[14] ),
        .O(p_0_in[14]));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[15]_i_1 
       (.I0(\int_romcode_reg[63]_0 [13]),
        .I1(\int_romcode_reg[63]_0 [45]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg_n_2_[15] ),
        .O(p_0_in[15]));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[16]_i_1 
       (.I0(\int_romcode_reg[63]_0 [14]),
        .I1(\int_romcode_reg[63]_0 [46]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg_n_2_[16] ),
        .O(p_0_in[16]));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[17]_i_1 
       (.I0(\int_romcode_reg[63]_0 [15]),
        .I1(\int_romcode_reg[63]_0 [47]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg_n_2_[17] ),
        .O(p_0_in[17]));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[18]_i_1 
       (.I0(\int_romcode_reg[63]_0 [16]),
        .I1(\int_romcode_reg[63]_0 [48]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg_n_2_[18] ),
        .O(p_0_in[18]));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[19]_i_1 
       (.I0(\int_romcode_reg[63]_0 [17]),
        .I1(\int_romcode_reg[63]_0 [49]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg_n_2_[19] ),
        .O(p_0_in[19]));
  LUT6 #(
    .INIT(64'h0303030303030305)) 
    \rdata[1]_i_1 
       (.I0(\rdata[1]_i_2_n_2 ),
        .I1(\rdata[1]_i_3_n_2 ),
        .I2(s_axi_control_ARADDR[5]),
        .I3(s_axi_control_ARADDR[0]),
        .I4(s_axi_control_ARADDR[1]),
        .I5(s_axi_control_ARADDR[4]),
        .O(p_0_in[1]));
  LUT5 #(
    .INIT(32'h47CC47FF)) 
    \rdata[1]_i_2 
       (.I0(int_task_ap_done),
        .I1(\rdata[31]_i_5_n_2 ),
        .I2(\int_ier_reg_n_2_[1] ),
        .I3(\rdata[31]_i_4_n_2 ),
        .I4(data3[1]),
        .O(\rdata[1]_i_2_n_2 ));
  LUT5 #(
    .INIT(32'h303F5F5F)) 
    \rdata[1]_i_3 
       (.I0(\int_length_r_reg[10]_0 [1]),
        .I1(romcode[1]),
        .I2(\rdata[31]_i_4_n_2 ),
        .I3(\int_romcode_reg[63]_0 [31]),
        .I4(\rdata[31]_i_5_n_2 ),
        .O(\rdata[1]_i_3_n_2 ));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[20]_i_1 
       (.I0(\int_romcode_reg[63]_0 [18]),
        .I1(\int_romcode_reg[63]_0 [50]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg_n_2_[20] ),
        .O(p_0_in[20]));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[21]_i_1 
       (.I0(\int_romcode_reg[63]_0 [19]),
        .I1(\int_romcode_reg[63]_0 [51]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg_n_2_[21] ),
        .O(p_0_in[21]));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[22]_i_1 
       (.I0(\int_romcode_reg[63]_0 [20]),
        .I1(\int_romcode_reg[63]_0 [52]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg_n_2_[22] ),
        .O(p_0_in[22]));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[23]_i_1 
       (.I0(\int_romcode_reg[63]_0 [21]),
        .I1(\int_romcode_reg[63]_0 [53]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg_n_2_[23] ),
        .O(p_0_in[23]));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[24]_i_1 
       (.I0(\int_romcode_reg[63]_0 [22]),
        .I1(\int_romcode_reg[63]_0 [54]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg_n_2_[24] ),
        .O(p_0_in[24]));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[25]_i_1 
       (.I0(\int_romcode_reg[63]_0 [23]),
        .I1(\int_romcode_reg[63]_0 [55]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg_n_2_[25] ),
        .O(p_0_in[25]));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[26]_i_1 
       (.I0(\int_romcode_reg[63]_0 [24]),
        .I1(\int_romcode_reg[63]_0 [56]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg_n_2_[26] ),
        .O(p_0_in[26]));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[27]_i_1 
       (.I0(\int_romcode_reg[63]_0 [25]),
        .I1(\int_romcode_reg[63]_0 [57]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg_n_2_[27] ),
        .O(p_0_in[27]));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[28]_i_1 
       (.I0(\int_romcode_reg[63]_0 [26]),
        .I1(\int_romcode_reg[63]_0 [58]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg_n_2_[28] ),
        .O(p_0_in[28]));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[29]_i_1 
       (.I0(\int_romcode_reg[63]_0 [27]),
        .I1(\int_romcode_reg[63]_0 [59]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg_n_2_[29] ),
        .O(p_0_in[29]));
  LUT6 #(
    .INIT(64'hFFFFFFFF10000000)) 
    \rdata[2]_i_1 
       (.I0(s_axi_control_ARADDR[5]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\rdata[31]_i_5_n_2 ),
        .I3(\rdata[31]_i_4_n_2 ),
        .I4(p_3_in[2]),
        .I5(\rdata[2]_i_2_n_2 ),
        .O(p_0_in[2]));
  LUT6 #(
    .INIT(64'hAA80888022800080)) 
    \rdata[2]_i_2 
       (.I0(\rdata[31]_i_3_n_2 ),
        .I1(\rdata[31]_i_4_n_2 ),
        .I2(\int_length_r_reg[10]_0 [2]),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\int_romcode_reg[63]_0 [32]),
        .I5(\int_romcode_reg[63]_0 [0]),
        .O(\rdata[2]_i_2_n_2 ));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[30]_i_1 
       (.I0(\int_romcode_reg[63]_0 [28]),
        .I1(\int_romcode_reg[63]_0 [60]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg_n_2_[30] ),
        .O(p_0_in[30]));
  LUT2 #(
    .INIT(4'h8)) 
    \rdata[31]_i_1 
       (.I0(\FSM_onehot_rstate_reg[1]_0 ),
        .I1(s_axi_control_ARVALID),
        .O(ar_hs));
  LUT6 #(
    .INIT(64'hAA80888022800080)) 
    \rdata[31]_i_2 
       (.I0(\rdata[31]_i_3_n_2 ),
        .I1(\rdata[31]_i_4_n_2 ),
        .I2(\int_length_r_reg_n_2_[31] ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\int_romcode_reg[63]_0 [61]),
        .I5(\int_romcode_reg[63]_0 [29]),
        .O(p_0_in[31]));
  LUT4 #(
    .INIT(16'h5554)) 
    \rdata[31]_i_3 
       (.I0(s_axi_control_ARADDR[5]),
        .I1(s_axi_control_ARADDR[0]),
        .I2(s_axi_control_ARADDR[1]),
        .I3(s_axi_control_ARADDR[4]),
        .O(\rdata[31]_i_3_n_2 ));
  LUT5 #(
    .INIT(32'h10000111)) 
    \rdata[31]_i_4 
       (.I0(s_axi_control_ARADDR[1]),
        .I1(s_axi_control_ARADDR[0]),
        .I2(s_axi_control_ARADDR[3]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(s_axi_control_ARADDR[2]),
        .O(\rdata[31]_i_4_n_2 ));
  LUT3 #(
    .INIT(8'h01)) 
    \rdata[31]_i_5 
       (.I0(s_axi_control_ARADDR[3]),
        .I1(s_axi_control_ARADDR[1]),
        .I2(s_axi_control_ARADDR[0]),
        .O(\rdata[31]_i_5_n_2 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF10000000)) 
    \rdata[3]_i_1 
       (.I0(s_axi_control_ARADDR[5]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\rdata[31]_i_5_n_2 ),
        .I3(\rdata[31]_i_4_n_2 ),
        .I4(int_ap_ready),
        .I5(\rdata[3]_i_2_n_2 ),
        .O(p_0_in[3]));
  LUT6 #(
    .INIT(64'hAA80888022800080)) 
    \rdata[3]_i_2 
       (.I0(\rdata[31]_i_3_n_2 ),
        .I1(\rdata[31]_i_4_n_2 ),
        .I2(\int_length_r_reg[10]_0 [3]),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\int_romcode_reg[63]_0 [33]),
        .I5(\int_romcode_reg[63]_0 [1]),
        .O(\rdata[3]_i_2_n_2 ));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[4]_i_1 
       (.I0(\int_romcode_reg[63]_0 [2]),
        .I1(\int_romcode_reg[63]_0 [34]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg[10]_0 [4]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[5]_i_1 
       (.I0(\int_romcode_reg[63]_0 [3]),
        .I1(\int_romcode_reg[63]_0 [35]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg[10]_0 [5]),
        .O(p_0_in[5]));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[6]_i_1 
       (.I0(\int_romcode_reg[63]_0 [4]),
        .I1(\int_romcode_reg[63]_0 [36]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg[10]_0 [6]),
        .O(p_0_in[6]));
  LUT6 #(
    .INIT(64'hFFFFFFFF10000000)) 
    \rdata[7]_i_1 
       (.I0(s_axi_control_ARADDR[5]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\rdata[31]_i_5_n_2 ),
        .I3(\rdata[31]_i_4_n_2 ),
        .I4(p_3_in[7]),
        .I5(\rdata[7]_i_2_n_2 ),
        .O(p_0_in[7]));
  LUT6 #(
    .INIT(64'hAA80888022800080)) 
    \rdata[7]_i_2 
       (.I0(\rdata[31]_i_3_n_2 ),
        .I1(\rdata[31]_i_4_n_2 ),
        .I2(\int_length_r_reg[10]_0 [7]),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\int_romcode_reg[63]_0 [37]),
        .I5(\int_romcode_reg[63]_0 [5]),
        .O(\rdata[7]_i_2_n_2 ));
  LUT6 #(
    .INIT(64'hA0F0C000A000C000)) 
    \rdata[8]_i_1 
       (.I0(\int_romcode_reg[63]_0 [6]),
        .I1(\int_romcode_reg[63]_0 [38]),
        .I2(\rdata[31]_i_3_n_2 ),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\rdata[31]_i_4_n_2 ),
        .I5(\int_length_r_reg[10]_0 [8]),
        .O(p_0_in[8]));
  LUT6 #(
    .INIT(64'hFFFFFFFF10000000)) 
    \rdata[9]_i_1 
       (.I0(s_axi_control_ARADDR[5]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\rdata[31]_i_5_n_2 ),
        .I3(\rdata[31]_i_4_n_2 ),
        .I4(interrupt),
        .I5(\rdata[9]_i_2_n_2 ),
        .O(p_0_in[9]));
  LUT6 #(
    .INIT(64'hAA80888022800080)) 
    \rdata[9]_i_2 
       (.I0(\rdata[31]_i_3_n_2 ),
        .I1(\rdata[31]_i_4_n_2 ),
        .I2(\int_length_r_reg[10]_0 [9]),
        .I3(\rdata[31]_i_5_n_2 ),
        .I4(\int_romcode_reg[63]_0 [39]),
        .I5(\int_romcode_reg[63]_0 [7]),
        .O(\rdata[9]_i_2_n_2 ));
  FDRE \rdata_reg[0] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[0]),
        .Q(s_axi_control_RDATA[0]),
        .R(1'b0));
  FDRE \rdata_reg[10] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[10]),
        .Q(s_axi_control_RDATA[10]),
        .R(1'b0));
  FDRE \rdata_reg[11] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[11]),
        .Q(s_axi_control_RDATA[11]),
        .R(1'b0));
  FDRE \rdata_reg[12] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[12]),
        .Q(s_axi_control_RDATA[12]),
        .R(1'b0));
  FDRE \rdata_reg[13] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[13]),
        .Q(s_axi_control_RDATA[13]),
        .R(1'b0));
  FDRE \rdata_reg[14] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[14]),
        .Q(s_axi_control_RDATA[14]),
        .R(1'b0));
  FDRE \rdata_reg[15] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[15]),
        .Q(s_axi_control_RDATA[15]),
        .R(1'b0));
  FDRE \rdata_reg[16] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[16]),
        .Q(s_axi_control_RDATA[16]),
        .R(1'b0));
  FDRE \rdata_reg[17] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[17]),
        .Q(s_axi_control_RDATA[17]),
        .R(1'b0));
  FDRE \rdata_reg[18] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[18]),
        .Q(s_axi_control_RDATA[18]),
        .R(1'b0));
  FDRE \rdata_reg[19] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[19]),
        .Q(s_axi_control_RDATA[19]),
        .R(1'b0));
  FDRE \rdata_reg[1] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[1]),
        .Q(s_axi_control_RDATA[1]),
        .R(1'b0));
  FDRE \rdata_reg[20] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[20]),
        .Q(s_axi_control_RDATA[20]),
        .R(1'b0));
  FDRE \rdata_reg[21] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[21]),
        .Q(s_axi_control_RDATA[21]),
        .R(1'b0));
  FDRE \rdata_reg[22] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[22]),
        .Q(s_axi_control_RDATA[22]),
        .R(1'b0));
  FDRE \rdata_reg[23] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[23]),
        .Q(s_axi_control_RDATA[23]),
        .R(1'b0));
  FDRE \rdata_reg[24] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[24]),
        .Q(s_axi_control_RDATA[24]),
        .R(1'b0));
  FDRE \rdata_reg[25] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[25]),
        .Q(s_axi_control_RDATA[25]),
        .R(1'b0));
  FDRE \rdata_reg[26] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[26]),
        .Q(s_axi_control_RDATA[26]),
        .R(1'b0));
  FDRE \rdata_reg[27] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[27]),
        .Q(s_axi_control_RDATA[27]),
        .R(1'b0));
  FDRE \rdata_reg[28] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[28]),
        .Q(s_axi_control_RDATA[28]),
        .R(1'b0));
  FDRE \rdata_reg[29] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[29]),
        .Q(s_axi_control_RDATA[29]),
        .R(1'b0));
  FDRE \rdata_reg[2] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[2]),
        .Q(s_axi_control_RDATA[2]),
        .R(1'b0));
  FDRE \rdata_reg[30] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[30]),
        .Q(s_axi_control_RDATA[30]),
        .R(1'b0));
  FDRE \rdata_reg[31] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[31]),
        .Q(s_axi_control_RDATA[31]),
        .R(1'b0));
  FDRE \rdata_reg[3] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[3]),
        .Q(s_axi_control_RDATA[3]),
        .R(1'b0));
  FDRE \rdata_reg[4] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[4]),
        .Q(s_axi_control_RDATA[4]),
        .R(1'b0));
  FDRE \rdata_reg[5] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[5]),
        .Q(s_axi_control_RDATA[5]),
        .R(1'b0));
  FDRE \rdata_reg[6] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[6]),
        .Q(s_axi_control_RDATA[6]),
        .R(1'b0));
  FDRE \rdata_reg[7] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[7]),
        .Q(s_axi_control_RDATA[7]),
        .R(1'b0));
  FDRE \rdata_reg[8] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[8]),
        .Q(s_axi_control_RDATA[8]),
        .R(1'b0));
  FDRE \rdata_reg[9] 
       (.C(ap_clk),
        .CE(ar_hs),
        .D(p_0_in[9]),
        .Q(s_axi_control_RDATA[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT4 #(
    .INIT(16'hF200)) 
    \select_ln26_reg_147[10]_i_1 
       (.I0(\int_length_r_reg_n_2_[11] ),
        .I1(\select_ln26_reg_147[10]_i_2_n_2 ),
        .I2(\select_ln26_reg_147[11]_i_2_n_2 ),
        .I3(Q),
        .O(\int_length_r_reg[11]_0 ));
  LUT5 #(
    .INIT(32'h00000002)) 
    \select_ln26_reg_147[10]_i_2 
       (.I0(\select_ln26_reg_147[10]_i_3_n_2 ),
        .I1(\int_length_r_reg[10]_0 [6]),
        .I2(\int_length_r_reg[10]_0 [0]),
        .I3(\int_length_r_reg[10]_0 [8]),
        .I4(\select_ln26_reg_147[10]_i_4_n_2 ),
        .O(\select_ln26_reg_147[10]_i_2_n_2 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \select_ln26_reg_147[10]_i_3 
       (.I0(\int_length_r_reg[10]_0 [5]),
        .I1(\int_length_r_reg[10]_0 [7]),
        .I2(\int_length_r_reg[10]_0 [1]),
        .I3(\int_length_r_reg[10]_0 [9]),
        .O(\select_ln26_reg_147[10]_i_3_n_2 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \select_ln26_reg_147[10]_i_4 
       (.I0(\int_length_r_reg[10]_0 [3]),
        .I1(\int_length_r_reg[10]_0 [4]),
        .I2(\int_length_r_reg[10]_0 [2]),
        .I3(\int_length_r_reg[10]_0 [10]),
        .O(\select_ln26_reg_147[10]_i_4_n_2 ));
  LUT2 #(
    .INIT(4'hE)) 
    \select_ln26_reg_147[11]_i_1 
       (.I0(\select_ln26_reg_147[11]_i_2_n_2 ),
        .I1(\int_length_r_reg_n_2_[11] ),
        .O(sel0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \select_ln26_reg_147[11]_i_2 
       (.I0(\select_ln26_reg_147[11]_i_3_n_2 ),
        .I1(\int_length_r_reg_n_2_[31] ),
        .I2(\int_length_r_reg_n_2_[24] ),
        .I3(\int_length_r_reg_n_2_[21] ),
        .I4(\int_length_r_reg_n_2_[27] ),
        .I5(\select_ln26_reg_147[11]_i_4_n_2 ),
        .O(\select_ln26_reg_147[11]_i_2_n_2 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \select_ln26_reg_147[11]_i_3 
       (.I0(\int_length_r_reg_n_2_[30] ),
        .I1(\int_length_r_reg_n_2_[28] ),
        .I2(\int_length_r_reg_n_2_[20] ),
        .I3(\int_length_r_reg_n_2_[19] ),
        .O(\select_ln26_reg_147[11]_i_3_n_2 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \select_ln26_reg_147[11]_i_4 
       (.I0(\int_length_r_reg_n_2_[13] ),
        .I1(\int_length_r_reg_n_2_[23] ),
        .I2(\int_length_r_reg_n_2_[26] ),
        .I3(\int_length_r_reg_n_2_[18] ),
        .I4(\select_ln26_reg_147[11]_i_5_n_2 ),
        .I5(\select_ln26_reg_147[11]_i_6_n_2 ),
        .O(\select_ln26_reg_147[11]_i_4_n_2 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \select_ln26_reg_147[11]_i_5 
       (.I0(\int_length_r_reg_n_2_[12] ),
        .I1(\int_length_r_reg_n_2_[17] ),
        .I2(\int_length_r_reg_n_2_[25] ),
        .I3(\int_length_r_reg_n_2_[15] ),
        .O(\select_ln26_reg_147[11]_i_5_n_2 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \select_ln26_reg_147[11]_i_6 
       (.I0(\int_length_r_reg_n_2_[29] ),
        .I1(\int_length_r_reg_n_2_[16] ),
        .I2(\int_length_r_reg_n_2_[22] ),
        .I3(\int_length_r_reg_n_2_[14] ),
        .O(\select_ln26_reg_147[11]_i_6_n_2 ));
  LUT2 #(
    .INIT(4'h8)) 
    \waddr[5]_i_1 
       (.I0(\FSM_onehot_wstate_reg[1]_0 ),
        .I1(s_axi_control_AWVALID),
        .O(waddr));
  FDRE \waddr_reg[0] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_control_AWADDR[0]),
        .Q(\waddr_reg_n_2_[0] ),
        .R(1'b0));
  FDRE \waddr_reg[1] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_control_AWADDR[1]),
        .Q(\waddr_reg_n_2_[1] ),
        .R(1'b0));
  FDRE \waddr_reg[2] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_control_AWADDR[2]),
        .Q(\waddr_reg_n_2_[2] ),
        .R(1'b0));
  FDRE \waddr_reg[3] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_control_AWADDR[3]),
        .Q(\waddr_reg_n_2_[3] ),
        .R(1'b0));
  FDRE \waddr_reg[4] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_control_AWADDR[4]),
        .Q(\waddr_reg_n_2_[4] ),
        .R(1'b0));
  FDRE \waddr_reg[5] 
       (.C(ap_clk),
        .CE(waddr),
        .D(s_axi_control_AWADDR[5]),
        .Q(\waddr_reg_n_2_[5] ),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "read_romcode_flow_control_loop_pipe_sequential_init" *) 
module design_1_read_romcode_0_0_read_romcode_flow_control_loop_pipe_sequential_init
   (E,
    SR,
    grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_ready,
    D,
    ap_done,
    S,
    \i_fu_56_reg[11] ,
    ap_loop_init_int_reg_0,
    \i_fu_56_reg[4] ,
    \i_fu_56_reg[8] ,
    \i_fu_56_reg[11]_0 ,
    \ap_CS_fsm_reg[8] ,
    internal_bram_Rst_A,
    ap_clk,
    ap_loop_exit_ready_pp0_iter1_reg,
    ap_rst_n,
    ap_loop_init_int_reg_1,
    grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg,
    BUS0_RVALID,
    ap_enable_reg_pp0_iter1,
    icmp_ln31_reg_146,
    CO,
    \ap_CS_fsm_reg[9] ,
    Q,
    select_ln26_reg_147,
    \i_1_reg_141_reg[11] );
  output [0:0]E;
  output [0:0]SR;
  output grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_ready;
  output [0:0]D;
  output ap_done;
  output [3:0]S;
  output [11:0]\i_fu_56_reg[11] ;
  output [0:0]ap_loop_init_int_reg_0;
  output [3:0]\i_fu_56_reg[4] ;
  output [3:0]\i_fu_56_reg[8] ;
  output [2:0]\i_fu_56_reg[11]_0 ;
  output \ap_CS_fsm_reg[8] ;
  input internal_bram_Rst_A;
  input ap_clk;
  input ap_loop_exit_ready_pp0_iter1_reg;
  input ap_rst_n;
  input ap_loop_init_int_reg_1;
  input grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg;
  input BUS0_RVALID;
  input ap_enable_reg_pp0_iter1;
  input icmp_ln31_reg_146;
  input [0:0]CO;
  input \ap_CS_fsm_reg[9] ;
  input [2:0]Q;
  input [11:0]select_ln26_reg_147;
  input [11:0]\i_1_reg_141_reg[11] ;

  wire BUS0_RVALID;
  wire [0:0]CO;
  wire [0:0]D;
  wire [0:0]E;
  wire [2:0]Q;
  wire [3:0]S;
  wire [0:0]SR;
  wire \ap_CS_fsm[9]_i_2_n_2 ;
  wire \ap_CS_fsm_reg[8] ;
  wire \ap_CS_fsm_reg[9] ;
  wire ap_clk;
  wire ap_done;
  wire ap_done_cache;
  wire ap_done_cache_i_1_n_2;
  wire ap_enable_reg_pp0_iter1;
  wire ap_loop_exit_ready_pp0_iter1_reg;
  wire ap_loop_init_int;
  wire ap_loop_init_int_i_1_n_2;
  wire [0:0]ap_loop_init_int_reg_0;
  wire ap_loop_init_int_reg_1;
  wire ap_rst_n;
  wire grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_ready;
  wire grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg;
  wire [11:0]\i_1_reg_141_reg[11] ;
  wire [11:0]\i_fu_56_reg[11] ;
  wire [2:0]\i_fu_56_reg[11]_0 ;
  wire [3:0]\i_fu_56_reg[4] ;
  wire [3:0]\i_fu_56_reg[8] ;
  wire icmp_ln31_reg_146;
  wire internal_bram_Rst_A;
  wire [11:0]select_ln26_reg_147;

  LUT3 #(
    .INIT(8'h2A)) 
    add_ln31_fu_108_p2_carry__0_i_1
       (.I0(\i_1_reg_141_reg[11] [8]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[8] [3]));
  LUT3 #(
    .INIT(8'h2A)) 
    add_ln31_fu_108_p2_carry__0_i_2
       (.I0(\i_1_reg_141_reg[11] [7]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[8] [2]));
  LUT3 #(
    .INIT(8'h2A)) 
    add_ln31_fu_108_p2_carry__0_i_3
       (.I0(\i_1_reg_141_reg[11] [6]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[8] [1]));
  LUT3 #(
    .INIT(8'h2A)) 
    add_ln31_fu_108_p2_carry__0_i_4
       (.I0(\i_1_reg_141_reg[11] [5]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[8] [0]));
  LUT3 #(
    .INIT(8'h2A)) 
    add_ln31_fu_108_p2_carry__1_i_1
       (.I0(\i_1_reg_141_reg[11] [11]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[11]_0 [2]));
  LUT3 #(
    .INIT(8'h2A)) 
    add_ln31_fu_108_p2_carry__1_i_2
       (.I0(\i_1_reg_141_reg[11] [10]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[11]_0 [1]));
  LUT3 #(
    .INIT(8'h2A)) 
    add_ln31_fu_108_p2_carry__1_i_3
       (.I0(\i_1_reg_141_reg[11] [9]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[11]_0 [0]));
  LUT3 #(
    .INIT(8'h2A)) 
    add_ln31_fu_108_p2_carry_i_1
       (.I0(\i_1_reg_141_reg[11] [4]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[4] [3]));
  LUT3 #(
    .INIT(8'h2A)) 
    add_ln31_fu_108_p2_carry_i_2
       (.I0(\i_1_reg_141_reg[11] [3]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[4] [2]));
  LUT3 #(
    .INIT(8'h2A)) 
    add_ln31_fu_108_p2_carry_i_3
       (.I0(\i_1_reg_141_reg[11] [2]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[4] [1]));
  LUT3 #(
    .INIT(8'h2A)) 
    add_ln31_fu_108_p2_carry_i_4
       (.I0(\i_1_reg_141_reg[11] [1]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[4] [0]));
  LUT6 #(
    .INIT(64'h8A888A88AAAA8A88)) 
    \ap_CS_fsm[0]_i_2 
       (.I0(Q[2]),
        .I1(\ap_CS_fsm_reg[9] ),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .I3(ap_done_cache),
        .I4(ap_loop_exit_ready_pp0_iter1_reg),
        .I5(ap_loop_init_int_reg_1),
        .O(ap_done));
  LUT5 #(
    .INIT(32'hFFF8F8F8)) 
    \ap_CS_fsm[9]_i_1 
       (.I0(\ap_CS_fsm_reg[9] ),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(\ap_CS_fsm[9]_i_2_n_2 ),
        .I4(Q[2]),
        .O(D));
  LUT5 #(
    .INIT(32'h0000BB0B)) 
    \ap_CS_fsm[9]_i_2 
       (.I0(ap_loop_init_int_reg_1),
        .I1(ap_loop_exit_ready_pp0_iter1_reg),
        .I2(ap_done_cache),
        .I3(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .I4(\ap_CS_fsm_reg[9] ),
        .O(\ap_CS_fsm[9]_i_2_n_2 ));
  LUT6 #(
    .INIT(64'hFFDF5555FFCF0000)) 
    ap_done_cache_i_1
       (.I0(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .I1(BUS0_RVALID),
        .I2(ap_enable_reg_pp0_iter1),
        .I3(icmp_ln31_reg_146),
        .I4(ap_loop_exit_ready_pp0_iter1_reg),
        .I5(ap_done_cache),
        .O(ap_done_cache_i_1_n_2));
  FDRE #(
    .INIT(1'b0)) 
    ap_done_cache_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_done_cache_i_1_n_2),
        .Q(ap_done_cache),
        .R(internal_bram_Rst_A));
  (* SOFT_HLUTNM = "soft_lutpair180" *) 
  LUT5 #(
    .INIT(32'hAA8A0000)) 
    ap_loop_exit_ready_pp0_iter1_reg_i_1
       (.I0(CO),
        .I1(BUS0_RVALID),
        .I2(ap_enable_reg_pp0_iter1),
        .I3(icmp_ln31_reg_146),
        .I4(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_ready));
  LUT5 #(
    .INIT(32'hF3BBF3FB)) 
    ap_loop_init_int_i_1
       (.I0(ap_loop_exit_ready_pp0_iter1_reg),
        .I1(ap_rst_n),
        .I2(ap_loop_init_int),
        .I3(ap_loop_init_int_reg_1),
        .I4(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(ap_loop_init_int_i_1_n_2));
  FDRE #(
    .INIT(1'b1)) 
    ap_loop_init_int_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_loop_init_int_i_1_n_2),
        .Q(ap_loop_init_int),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAAAAAEAAEEEEEEEE)) 
    grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg_i_1
       (.I0(Q[1]),
        .I1(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .I2(icmp_ln31_reg_146),
        .I3(ap_enable_reg_pp0_iter1),
        .I4(BUS0_RVALID),
        .I5(CO),
        .O(\ap_CS_fsm_reg[8] ));
  LUT3 #(
    .INIT(8'h2A)) 
    \i_1_reg_141[0]_i_1 
       (.I0(\i_1_reg_141_reg[11] [0]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[11] [0]));
  (* SOFT_HLUTNM = "soft_lutpair184" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \i_1_reg_141[10]_i_1 
       (.I0(\i_1_reg_141_reg[11] [10]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[11] [10]));
  (* SOFT_HLUTNM = "soft_lutpair184" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \i_1_reg_141[11]_i_1 
       (.I0(\i_1_reg_141_reg[11] [11]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[11] [11]));
  (* SOFT_HLUTNM = "soft_lutpair182" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \i_1_reg_141[1]_i_1 
       (.I0(\i_1_reg_141_reg[11] [1]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[11] [1]));
  (* SOFT_HLUTNM = "soft_lutpair183" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \i_1_reg_141[2]_i_1 
       (.I0(\i_1_reg_141_reg[11] [2]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[11] [2]));
  (* SOFT_HLUTNM = "soft_lutpair181" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \i_1_reg_141[3]_i_1 
       (.I0(\i_1_reg_141_reg[11] [3]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[11] [3]));
  (* SOFT_HLUTNM = "soft_lutpair181" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \i_1_reg_141[4]_i_1 
       (.I0(\i_1_reg_141_reg[11] [4]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[11] [4]));
  (* SOFT_HLUTNM = "soft_lutpair182" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \i_1_reg_141[5]_i_1 
       (.I0(\i_1_reg_141_reg[11] [5]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[11] [5]));
  (* SOFT_HLUTNM = "soft_lutpair185" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \i_1_reg_141[6]_i_1 
       (.I0(\i_1_reg_141_reg[11] [6]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[11] [6]));
  (* SOFT_HLUTNM = "soft_lutpair185" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \i_1_reg_141[7]_i_1 
       (.I0(\i_1_reg_141_reg[11] [7]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[11] [7]));
  (* SOFT_HLUTNM = "soft_lutpair186" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \i_1_reg_141[8]_i_1 
       (.I0(\i_1_reg_141_reg[11] [8]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[11] [8]));
  (* SOFT_HLUTNM = "soft_lutpair183" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \i_1_reg_141[9]_i_1 
       (.I0(\i_1_reg_141_reg[11] [9]),
        .I1(ap_loop_init_int),
        .I2(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .O(\i_fu_56_reg[11] [9]));
  (* SOFT_HLUTNM = "soft_lutpair186" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \i_fu_56[0]_i_1 
       (.I0(ap_loop_init_int),
        .I1(\i_1_reg_141_reg[11] [0]),
        .O(ap_loop_init_int_reg_0));
  LUT6 #(
    .INIT(64'h8888808800000000)) 
    \i_fu_56[11]_i_1 
       (.I0(ap_loop_init_int),
        .I1(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .I2(icmp_ln31_reg_146),
        .I3(ap_enable_reg_pp0_iter1),
        .I4(BUS0_RVALID),
        .I5(CO),
        .O(SR));
  (* SOFT_HLUTNM = "soft_lutpair180" *) 
  LUT5 #(
    .INIT(32'h0000FB00)) 
    \i_fu_56[11]_i_2 
       (.I0(BUS0_RVALID),
        .I1(ap_enable_reg_pp0_iter1),
        .I2(icmp_ln31_reg_146),
        .I3(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .I4(CO),
        .O(E));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    icmp_ln31_fu_102_p2_carry_i_1
       (.I0(select_ln26_reg_147[10]),
        .I1(\i_fu_56_reg[11] [10]),
        .I2(select_ln26_reg_147[11]),
        .I3(\i_fu_56_reg[11] [11]),
        .I4(\i_fu_56_reg[11] [9]),
        .I5(select_ln26_reg_147[9]),
        .O(S[3]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    icmp_ln31_fu_102_p2_carry_i_2
       (.I0(select_ln26_reg_147[7]),
        .I1(\i_fu_56_reg[11] [7]),
        .I2(select_ln26_reg_147[8]),
        .I3(\i_fu_56_reg[11] [8]),
        .I4(\i_fu_56_reg[11] [6]),
        .I5(select_ln26_reg_147[6]),
        .O(S[2]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    icmp_ln31_fu_102_p2_carry_i_3
       (.I0(select_ln26_reg_147[4]),
        .I1(\i_fu_56_reg[11] [4]),
        .I2(select_ln26_reg_147[5]),
        .I3(\i_fu_56_reg[11] [5]),
        .I4(\i_fu_56_reg[11] [3]),
        .I5(select_ln26_reg_147[3]),
        .O(S[1]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    icmp_ln31_fu_102_p2_carry_i_4
       (.I0(select_ln26_reg_147[2]),
        .I1(\i_fu_56_reg[11] [2]),
        .I2(select_ln26_reg_147[0]),
        .I3(\i_fu_56_reg[11] [0]),
        .I4(\i_fu_56_reg[11] [1]),
        .I5(select_ln26_reg_147[1]),
        .O(S[0]));
endmodule

(* ORIG_REF_NAME = "read_romcode_read_romcode_Pipeline_VITIS_LOOP_31_1" *) 
module design_1_read_romcode_0_0_read_romcode_read_romcode_Pipeline_VITIS_LOOP_31_1
   (ready_for_outstanding,
    dout_vld_reg,
    internal_bram_EN_A,
    D,
    ap_done,
    \ap_CS_fsm_reg[8] ,
    internal_bram_Addr_A,
    internal_bram_Din_A,
    ap_clk,
    internal_bram_Rst_A,
    BUS0_RVALID,
    ap_rst_n,
    dout,
    Q,
    \ap_CS_fsm_reg[9] ,
    grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg,
    select_ln26_reg_147);
  output ready_for_outstanding;
  output dout_vld_reg;
  output internal_bram_EN_A;
  output [0:0]D;
  output ap_done;
  output \ap_CS_fsm_reg[8] ;
  output [11:0]internal_bram_Addr_A;
  output [31:0]internal_bram_Din_A;
  input ap_clk;
  input internal_bram_Rst_A;
  input BUS0_RVALID;
  input ap_rst_n;
  input [32:0]dout;
  input [2:0]Q;
  input \ap_CS_fsm_reg[9] ;
  input grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg;
  input [11:0]select_ln26_reg_147;

  wire BUS0_RVALID;
  wire [0:0]D;
  wire [2:0]Q;
  wire [11:0]add_ln31_fu_108_p2;
  wire add_ln31_fu_108_p2_carry__0_n_2;
  wire add_ln31_fu_108_p2_carry__0_n_3;
  wire add_ln31_fu_108_p2_carry__0_n_4;
  wire add_ln31_fu_108_p2_carry__0_n_5;
  wire add_ln31_fu_108_p2_carry__1_n_4;
  wire add_ln31_fu_108_p2_carry__1_n_5;
  wire add_ln31_fu_108_p2_carry_n_2;
  wire add_ln31_fu_108_p2_carry_n_3;
  wire add_ln31_fu_108_p2_carry_n_4;
  wire add_ln31_fu_108_p2_carry_n_5;
  wire \ap_CS_fsm_reg[8] ;
  wire \ap_CS_fsm_reg[9] ;
  wire ap_block_pp0_stage0_subdone;
  wire ap_clk;
  wire ap_done;
  wire ap_enable_reg_pp0_iter1;
  wire ap_enable_reg_pp0_iter1_i_1_n_2;
  wire ap_enable_reg_pp0_iter2;
  wire ap_enable_reg_pp0_iter2_i_1_n_2;
  wire ap_loop_exit_ready_pp0_iter1_reg;
  wire ap_loop_init_int_i_2_n_2;
  wire ap_rst_n;
  wire [11:0]ap_sig_allocacmp_i_1;
  wire [32:0]dout;
  wire dout_vld_reg;
  wire flow_control_loop_pipe_sequential_init_U_n_10;
  wire flow_control_loop_pipe_sequential_init_U_n_24;
  wire flow_control_loop_pipe_sequential_init_U_n_25;
  wire flow_control_loop_pipe_sequential_init_U_n_26;
  wire flow_control_loop_pipe_sequential_init_U_n_27;
  wire flow_control_loop_pipe_sequential_init_U_n_28;
  wire flow_control_loop_pipe_sequential_init_U_n_29;
  wire flow_control_loop_pipe_sequential_init_U_n_3;
  wire flow_control_loop_pipe_sequential_init_U_n_30;
  wire flow_control_loop_pipe_sequential_init_U_n_31;
  wire flow_control_loop_pipe_sequential_init_U_n_32;
  wire flow_control_loop_pipe_sequential_init_U_n_33;
  wire flow_control_loop_pipe_sequential_init_U_n_34;
  wire flow_control_loop_pipe_sequential_init_U_n_7;
  wire flow_control_loop_pipe_sequential_init_U_n_8;
  wire flow_control_loop_pipe_sequential_init_U_n_9;
  wire grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_ready;
  wire grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg;
  wire [11:0]i_1_reg_141;
  wire i_fu_56;
  wire \i_fu_56_reg_n_2_[0] ;
  wire \i_fu_56_reg_n_2_[10] ;
  wire \i_fu_56_reg_n_2_[11] ;
  wire \i_fu_56_reg_n_2_[1] ;
  wire \i_fu_56_reg_n_2_[2] ;
  wire \i_fu_56_reg_n_2_[3] ;
  wire \i_fu_56_reg_n_2_[4] ;
  wire \i_fu_56_reg_n_2_[5] ;
  wire \i_fu_56_reg_n_2_[6] ;
  wire \i_fu_56_reg_n_2_[7] ;
  wire \i_fu_56_reg_n_2_[8] ;
  wire \i_fu_56_reg_n_2_[9] ;
  wire icmp_ln31_fu_102_p2;
  wire icmp_ln31_fu_102_p2_carry_n_3;
  wire icmp_ln31_fu_102_p2_carry_n_4;
  wire icmp_ln31_fu_102_p2_carry_n_5;
  wire icmp_ln31_reg_146;
  wire [11:0]internal_bram_Addr_A;
  wire [31:0]internal_bram_Din_A;
  wire internal_bram_EN_A;
  wire internal_bram_Rst_A;
  wire p_2_in;
  wire ready_for_outstanding;
  wire [11:0]select_ln26_reg_147;
  wire [3:2]NLW_add_ln31_fu_108_p2_carry__1_CO_UNCONNECTED;
  wire [3:3]NLW_add_ln31_fu_108_p2_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_icmp_ln31_fu_102_p2_carry_O_UNCONNECTED;

  LUT3 #(
    .INIT(8'h45)) 
    \BUS0_addr_read_reg_150[31]_i_1 
       (.I0(icmp_ln31_reg_146),
        .I1(BUS0_RVALID),
        .I2(ap_enable_reg_pp0_iter1),
        .O(p_2_in));
  FDRE \BUS0_addr_read_reg_150_reg[0] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[0]),
        .Q(internal_bram_Din_A[0]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[10] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[10]),
        .Q(internal_bram_Din_A[10]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[11] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[11]),
        .Q(internal_bram_Din_A[11]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[12] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[12]),
        .Q(internal_bram_Din_A[12]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[13] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[13]),
        .Q(internal_bram_Din_A[13]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[14] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[14]),
        .Q(internal_bram_Din_A[14]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[15] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[15]),
        .Q(internal_bram_Din_A[15]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[16] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[16]),
        .Q(internal_bram_Din_A[16]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[17] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[17]),
        .Q(internal_bram_Din_A[17]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[18] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[18]),
        .Q(internal_bram_Din_A[18]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[19] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[19]),
        .Q(internal_bram_Din_A[19]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[1] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[1]),
        .Q(internal_bram_Din_A[1]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[20] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[20]),
        .Q(internal_bram_Din_A[20]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[21] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[21]),
        .Q(internal_bram_Din_A[21]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[22] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[22]),
        .Q(internal_bram_Din_A[22]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[23] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[23]),
        .Q(internal_bram_Din_A[23]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[24] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[24]),
        .Q(internal_bram_Din_A[24]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[25] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[25]),
        .Q(internal_bram_Din_A[25]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[26] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[26]),
        .Q(internal_bram_Din_A[26]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[27] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[27]),
        .Q(internal_bram_Din_A[27]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[28] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[28]),
        .Q(internal_bram_Din_A[28]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[29] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[29]),
        .Q(internal_bram_Din_A[29]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[2] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[2]),
        .Q(internal_bram_Din_A[2]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[30] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[30]),
        .Q(internal_bram_Din_A[30]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[31] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[31]),
        .Q(internal_bram_Din_A[31]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[3] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[3]),
        .Q(internal_bram_Din_A[3]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[4] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[4]),
        .Q(internal_bram_Din_A[4]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[5] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[5]),
        .Q(internal_bram_Din_A[5]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[6] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[6]),
        .Q(internal_bram_Din_A[6]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[7] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[7]),
        .Q(internal_bram_Din_A[7]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[8] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[8]),
        .Q(internal_bram_Din_A[8]),
        .R(1'b0));
  FDRE \BUS0_addr_read_reg_150_reg[9] 
       (.C(ap_clk),
        .CE(p_2_in),
        .D(dout[9]),
        .Q(internal_bram_Din_A[9]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 add_ln31_fu_108_p2_carry
       (.CI(1'b0),
        .CO({add_ln31_fu_108_p2_carry_n_2,add_ln31_fu_108_p2_carry_n_3,add_ln31_fu_108_p2_carry_n_4,add_ln31_fu_108_p2_carry_n_5}),
        .CYINIT(ap_sig_allocacmp_i_1[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(add_ln31_fu_108_p2[4:1]),
        .S({flow_control_loop_pipe_sequential_init_U_n_24,flow_control_loop_pipe_sequential_init_U_n_25,flow_control_loop_pipe_sequential_init_U_n_26,flow_control_loop_pipe_sequential_init_U_n_27}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 add_ln31_fu_108_p2_carry__0
       (.CI(add_ln31_fu_108_p2_carry_n_2),
        .CO({add_ln31_fu_108_p2_carry__0_n_2,add_ln31_fu_108_p2_carry__0_n_3,add_ln31_fu_108_p2_carry__0_n_4,add_ln31_fu_108_p2_carry__0_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(add_ln31_fu_108_p2[8:5]),
        .S({flow_control_loop_pipe_sequential_init_U_n_28,flow_control_loop_pipe_sequential_init_U_n_29,flow_control_loop_pipe_sequential_init_U_n_30,flow_control_loop_pipe_sequential_init_U_n_31}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 add_ln31_fu_108_p2_carry__1
       (.CI(add_ln31_fu_108_p2_carry__0_n_2),
        .CO({NLW_add_ln31_fu_108_p2_carry__1_CO_UNCONNECTED[3:2],add_ln31_fu_108_p2_carry__1_n_4,add_ln31_fu_108_p2_carry__1_n_5}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_add_ln31_fu_108_p2_carry__1_O_UNCONNECTED[3],add_ln31_fu_108_p2[11:9]}),
        .S({1'b0,flow_control_loop_pipe_sequential_init_U_n_32,flow_control_loop_pipe_sequential_init_U_n_33,flow_control_loop_pipe_sequential_init_U_n_34}));
  (* SOFT_HLUTNM = "soft_lutpair188" *) 
  LUT4 #(
    .INIT(16'hAABA)) 
    ap_enable_reg_pp0_iter1_i_1
       (.I0(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .I1(icmp_ln31_reg_146),
        .I2(ap_enable_reg_pp0_iter1),
        .I3(BUS0_RVALID),
        .O(ap_enable_reg_pp0_iter1_i_1_n_2));
  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter1_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_enable_reg_pp0_iter1_i_1_n_2),
        .Q(ap_enable_reg_pp0_iter1),
        .R(internal_bram_Rst_A));
  (* SOFT_HLUTNM = "soft_lutpair187" *) 
  LUT5 #(
    .INIT(32'h00E00000)) 
    ap_enable_reg_pp0_iter2_i_1
       (.I0(ap_enable_reg_pp0_iter2),
        .I1(BUS0_RVALID),
        .I2(ap_enable_reg_pp0_iter1),
        .I3(icmp_ln31_reg_146),
        .I4(ap_rst_n),
        .O(ap_enable_reg_pp0_iter2_i_1_n_2));
  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter2_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_enable_reg_pp0_iter2_i_1_n_2),
        .Q(ap_enable_reg_pp0_iter2),
        .R(1'b0));
  FDRE ap_loop_exit_ready_pp0_iter1_reg_reg
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_ready),
        .Q(ap_loop_exit_ready_pp0_iter1_reg),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair188" *) 
  LUT3 #(
    .INIT(8'h04)) 
    ap_loop_init_int_i_2
       (.I0(BUS0_RVALID),
        .I1(ap_enable_reg_pp0_iter1),
        .I2(icmp_ln31_reg_146),
        .O(ap_loop_init_int_i_2_n_2));
  LUT6 #(
    .INIT(64'h2022202000000000)) 
    dout_vld_i_2
       (.I0(BUS0_RVALID),
        .I1(icmp_ln31_reg_146),
        .I2(Q[1]),
        .I3(\ap_CS_fsm_reg[9] ),
        .I4(Q[2]),
        .I5(ap_enable_reg_pp0_iter1),
        .O(dout_vld_reg));
  design_1_read_romcode_0_0_read_romcode_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U
       (.BUS0_RVALID(BUS0_RVALID),
        .CO(icmp_ln31_fu_102_p2),
        .D(D),
        .E(i_fu_56),
        .Q(Q),
        .S({flow_control_loop_pipe_sequential_init_U_n_7,flow_control_loop_pipe_sequential_init_U_n_8,flow_control_loop_pipe_sequential_init_U_n_9,flow_control_loop_pipe_sequential_init_U_n_10}),
        .SR(flow_control_loop_pipe_sequential_init_U_n_3),
        .\ap_CS_fsm_reg[8] (\ap_CS_fsm_reg[8] ),
        .\ap_CS_fsm_reg[9] (\ap_CS_fsm_reg[9] ),
        .ap_clk(ap_clk),
        .ap_done(ap_done),
        .ap_enable_reg_pp0_iter1(ap_enable_reg_pp0_iter1),
        .ap_loop_exit_ready_pp0_iter1_reg(ap_loop_exit_ready_pp0_iter1_reg),
        .ap_loop_init_int_reg_0(add_ln31_fu_108_p2[0]),
        .ap_loop_init_int_reg_1(ap_loop_init_int_i_2_n_2),
        .ap_rst_n(ap_rst_n),
        .grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_ready(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_ready),
        .grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg(grp_read_romcode_Pipeline_VITIS_LOOP_31_1_fu_84_ap_start_reg),
        .\i_1_reg_141_reg[11] ({\i_fu_56_reg_n_2_[11] ,\i_fu_56_reg_n_2_[10] ,\i_fu_56_reg_n_2_[9] ,\i_fu_56_reg_n_2_[8] ,\i_fu_56_reg_n_2_[7] ,\i_fu_56_reg_n_2_[6] ,\i_fu_56_reg_n_2_[5] ,\i_fu_56_reg_n_2_[4] ,\i_fu_56_reg_n_2_[3] ,\i_fu_56_reg_n_2_[2] ,\i_fu_56_reg_n_2_[1] ,\i_fu_56_reg_n_2_[0] }),
        .\i_fu_56_reg[11] (ap_sig_allocacmp_i_1),
        .\i_fu_56_reg[11]_0 ({flow_control_loop_pipe_sequential_init_U_n_32,flow_control_loop_pipe_sequential_init_U_n_33,flow_control_loop_pipe_sequential_init_U_n_34}),
        .\i_fu_56_reg[4] ({flow_control_loop_pipe_sequential_init_U_n_24,flow_control_loop_pipe_sequential_init_U_n_25,flow_control_loop_pipe_sequential_init_U_n_26,flow_control_loop_pipe_sequential_init_U_n_27}),
        .\i_fu_56_reg[8] ({flow_control_loop_pipe_sequential_init_U_n_28,flow_control_loop_pipe_sequential_init_U_n_29,flow_control_loop_pipe_sequential_init_U_n_30,flow_control_loop_pipe_sequential_init_U_n_31}),
        .icmp_ln31_reg_146(icmp_ln31_reg_146),
        .internal_bram_Rst_A(internal_bram_Rst_A),
        .select_ln26_reg_147(select_ln26_reg_147));
  LUT3 #(
    .INIT(8'hFB)) 
    \i_1_reg_141_pp0_iter1_reg[11]_i_1 
       (.I0(icmp_ln31_reg_146),
        .I1(ap_enable_reg_pp0_iter1),
        .I2(BUS0_RVALID),
        .O(ap_block_pp0_stage0_subdone));
  FDRE \i_1_reg_141_pp0_iter1_reg_reg[0] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(i_1_reg_141[0]),
        .Q(internal_bram_Addr_A[0]),
        .R(1'b0));
  FDRE \i_1_reg_141_pp0_iter1_reg_reg[10] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(i_1_reg_141[10]),
        .Q(internal_bram_Addr_A[10]),
        .R(1'b0));
  FDRE \i_1_reg_141_pp0_iter1_reg_reg[11] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(i_1_reg_141[11]),
        .Q(internal_bram_Addr_A[11]),
        .R(1'b0));
  FDRE \i_1_reg_141_pp0_iter1_reg_reg[1] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(i_1_reg_141[1]),
        .Q(internal_bram_Addr_A[1]),
        .R(1'b0));
  FDRE \i_1_reg_141_pp0_iter1_reg_reg[2] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(i_1_reg_141[2]),
        .Q(internal_bram_Addr_A[2]),
        .R(1'b0));
  FDRE \i_1_reg_141_pp0_iter1_reg_reg[3] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(i_1_reg_141[3]),
        .Q(internal_bram_Addr_A[3]),
        .R(1'b0));
  FDRE \i_1_reg_141_pp0_iter1_reg_reg[4] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(i_1_reg_141[4]),
        .Q(internal_bram_Addr_A[4]),
        .R(1'b0));
  FDRE \i_1_reg_141_pp0_iter1_reg_reg[5] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(i_1_reg_141[5]),
        .Q(internal_bram_Addr_A[5]),
        .R(1'b0));
  FDRE \i_1_reg_141_pp0_iter1_reg_reg[6] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(i_1_reg_141[6]),
        .Q(internal_bram_Addr_A[6]),
        .R(1'b0));
  FDRE \i_1_reg_141_pp0_iter1_reg_reg[7] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(i_1_reg_141[7]),
        .Q(internal_bram_Addr_A[7]),
        .R(1'b0));
  FDRE \i_1_reg_141_pp0_iter1_reg_reg[8] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(i_1_reg_141[8]),
        .Q(internal_bram_Addr_A[8]),
        .R(1'b0));
  FDRE \i_1_reg_141_pp0_iter1_reg_reg[9] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(i_1_reg_141[9]),
        .Q(internal_bram_Addr_A[9]),
        .R(1'b0));
  FDRE \i_1_reg_141_reg[0] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(ap_sig_allocacmp_i_1[0]),
        .Q(i_1_reg_141[0]),
        .R(1'b0));
  FDRE \i_1_reg_141_reg[10] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(ap_sig_allocacmp_i_1[10]),
        .Q(i_1_reg_141[10]),
        .R(1'b0));
  FDRE \i_1_reg_141_reg[11] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(ap_sig_allocacmp_i_1[11]),
        .Q(i_1_reg_141[11]),
        .R(1'b0));
  FDRE \i_1_reg_141_reg[1] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(ap_sig_allocacmp_i_1[1]),
        .Q(i_1_reg_141[1]),
        .R(1'b0));
  FDRE \i_1_reg_141_reg[2] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(ap_sig_allocacmp_i_1[2]),
        .Q(i_1_reg_141[2]),
        .R(1'b0));
  FDRE \i_1_reg_141_reg[3] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(ap_sig_allocacmp_i_1[3]),
        .Q(i_1_reg_141[3]),
        .R(1'b0));
  FDRE \i_1_reg_141_reg[4] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(ap_sig_allocacmp_i_1[4]),
        .Q(i_1_reg_141[4]),
        .R(1'b0));
  FDRE \i_1_reg_141_reg[5] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(ap_sig_allocacmp_i_1[5]),
        .Q(i_1_reg_141[5]),
        .R(1'b0));
  FDRE \i_1_reg_141_reg[6] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(ap_sig_allocacmp_i_1[6]),
        .Q(i_1_reg_141[6]),
        .R(1'b0));
  FDRE \i_1_reg_141_reg[7] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(ap_sig_allocacmp_i_1[7]),
        .Q(i_1_reg_141[7]),
        .R(1'b0));
  FDRE \i_1_reg_141_reg[8] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(ap_sig_allocacmp_i_1[8]),
        .Q(i_1_reg_141[8]),
        .R(1'b0));
  FDRE \i_1_reg_141_reg[9] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(ap_sig_allocacmp_i_1[9]),
        .Q(i_1_reg_141[9]),
        .R(1'b0));
  FDRE \i_fu_56_reg[0] 
       (.C(ap_clk),
        .CE(i_fu_56),
        .D(add_ln31_fu_108_p2[0]),
        .Q(\i_fu_56_reg_n_2_[0] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_3));
  FDRE \i_fu_56_reg[10] 
       (.C(ap_clk),
        .CE(i_fu_56),
        .D(add_ln31_fu_108_p2[10]),
        .Q(\i_fu_56_reg_n_2_[10] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_3));
  FDRE \i_fu_56_reg[11] 
       (.C(ap_clk),
        .CE(i_fu_56),
        .D(add_ln31_fu_108_p2[11]),
        .Q(\i_fu_56_reg_n_2_[11] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_3));
  FDRE \i_fu_56_reg[1] 
       (.C(ap_clk),
        .CE(i_fu_56),
        .D(add_ln31_fu_108_p2[1]),
        .Q(\i_fu_56_reg_n_2_[1] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_3));
  FDRE \i_fu_56_reg[2] 
       (.C(ap_clk),
        .CE(i_fu_56),
        .D(add_ln31_fu_108_p2[2]),
        .Q(\i_fu_56_reg_n_2_[2] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_3));
  FDRE \i_fu_56_reg[3] 
       (.C(ap_clk),
        .CE(i_fu_56),
        .D(add_ln31_fu_108_p2[3]),
        .Q(\i_fu_56_reg_n_2_[3] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_3));
  FDRE \i_fu_56_reg[4] 
       (.C(ap_clk),
        .CE(i_fu_56),
        .D(add_ln31_fu_108_p2[4]),
        .Q(\i_fu_56_reg_n_2_[4] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_3));
  FDRE \i_fu_56_reg[5] 
       (.C(ap_clk),
        .CE(i_fu_56),
        .D(add_ln31_fu_108_p2[5]),
        .Q(\i_fu_56_reg_n_2_[5] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_3));
  FDRE \i_fu_56_reg[6] 
       (.C(ap_clk),
        .CE(i_fu_56),
        .D(add_ln31_fu_108_p2[6]),
        .Q(\i_fu_56_reg_n_2_[6] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_3));
  FDRE \i_fu_56_reg[7] 
       (.C(ap_clk),
        .CE(i_fu_56),
        .D(add_ln31_fu_108_p2[7]),
        .Q(\i_fu_56_reg_n_2_[7] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_3));
  FDRE \i_fu_56_reg[8] 
       (.C(ap_clk),
        .CE(i_fu_56),
        .D(add_ln31_fu_108_p2[8]),
        .Q(\i_fu_56_reg_n_2_[8] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_3));
  FDRE \i_fu_56_reg[9] 
       (.C(ap_clk),
        .CE(i_fu_56),
        .D(add_ln31_fu_108_p2[9]),
        .Q(\i_fu_56_reg_n_2_[9] ),
        .R(flow_control_loop_pipe_sequential_init_U_n_3));
  CARRY4 icmp_ln31_fu_102_p2_carry
       (.CI(1'b0),
        .CO({icmp_ln31_fu_102_p2,icmp_ln31_fu_102_p2_carry_n_3,icmp_ln31_fu_102_p2_carry_n_4,icmp_ln31_fu_102_p2_carry_n_5}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_icmp_ln31_fu_102_p2_carry_O_UNCONNECTED[3:0]),
        .S({flow_control_loop_pipe_sequential_init_U_n_7,flow_control_loop_pipe_sequential_init_U_n_8,flow_control_loop_pipe_sequential_init_U_n_9,flow_control_loop_pipe_sequential_init_U_n_10}));
  FDRE \icmp_ln31_reg_146_reg[0] 
       (.C(ap_clk),
        .CE(ap_block_pp0_stage0_subdone),
        .D(icmp_ln31_fu_102_p2),
        .Q(icmp_ln31_reg_146),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair187" *) 
  LUT4 #(
    .INIT(16'hAA8A)) 
    \internal_bram_WEN_A[0]_INST_0 
       (.I0(ap_enable_reg_pp0_iter2),
        .I1(icmp_ln31_reg_146),
        .I2(ap_enable_reg_pp0_iter1),
        .I3(BUS0_RVALID),
        .O(internal_bram_EN_A));
  LUT6 #(
    .INIT(64'h8888008000000000)) 
    ready_for_outstanding_i_1
       (.I0(dout[32]),
        .I1(ap_enable_reg_pp0_iter1),
        .I2(Q[2]),
        .I3(\ap_CS_fsm_reg[9] ),
        .I4(Q[1]),
        .I5(p_2_in),
        .O(ready_for_outstanding));
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
