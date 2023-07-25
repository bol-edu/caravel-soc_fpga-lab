// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Fri Jun  2 19:17:57 2023
// Host        : josh-All-Series running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/josh/caravel-soc_fpga/vivado/vvd_caravel_fpga/vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_read_romcode_0_0/design_1_read_romcode_0_0_stub.v
// Design      : design_1_read_romcode_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "read_romcode,Vivado 2022.1" *)
module design_1_read_romcode_0_0(s_axi_control_AWADDR, 
  s_axi_control_AWVALID, s_axi_control_AWREADY, s_axi_control_WDATA, s_axi_control_WSTRB, 
  s_axi_control_WVALID, s_axi_control_WREADY, s_axi_control_BRESP, s_axi_control_BVALID, 
  s_axi_control_BREADY, s_axi_control_ARADDR, s_axi_control_ARVALID, 
  s_axi_control_ARREADY, s_axi_control_RDATA, s_axi_control_RRESP, s_axi_control_RVALID, 
  s_axi_control_RREADY, ap_clk, ap_rst_n, interrupt, m_axi_BUS0_AWADDR, m_axi_BUS0_AWLEN, 
  m_axi_BUS0_AWSIZE, m_axi_BUS0_AWBURST, m_axi_BUS0_AWLOCK, m_axi_BUS0_AWREGION, 
  m_axi_BUS0_AWCACHE, m_axi_BUS0_AWPROT, m_axi_BUS0_AWQOS, m_axi_BUS0_AWVALID, 
  m_axi_BUS0_AWREADY, m_axi_BUS0_WDATA, m_axi_BUS0_WSTRB, m_axi_BUS0_WLAST, 
  m_axi_BUS0_WVALID, m_axi_BUS0_WREADY, m_axi_BUS0_BRESP, m_axi_BUS0_BVALID, 
  m_axi_BUS0_BREADY, m_axi_BUS0_ARADDR, m_axi_BUS0_ARLEN, m_axi_BUS0_ARSIZE, 
  m_axi_BUS0_ARBURST, m_axi_BUS0_ARLOCK, m_axi_BUS0_ARREGION, m_axi_BUS0_ARCACHE, 
  m_axi_BUS0_ARPROT, m_axi_BUS0_ARQOS, m_axi_BUS0_ARVALID, m_axi_BUS0_ARREADY, 
  m_axi_BUS0_RDATA, m_axi_BUS0_RRESP, m_axi_BUS0_RLAST, m_axi_BUS0_RVALID, 
  m_axi_BUS0_RREADY, internal_bram_Clk_A, internal_bram_Rst_A, internal_bram_EN_A, 
  internal_bram_WEN_A, internal_bram_Addr_A, internal_bram_Din_A, internal_bram_Dout_A)
/* synthesis syn_black_box black_box_pad_pin="s_axi_control_AWADDR[5:0],s_axi_control_AWVALID,s_axi_control_AWREADY,s_axi_control_WDATA[31:0],s_axi_control_WSTRB[3:0],s_axi_control_WVALID,s_axi_control_WREADY,s_axi_control_BRESP[1:0],s_axi_control_BVALID,s_axi_control_BREADY,s_axi_control_ARADDR[5:0],s_axi_control_ARVALID,s_axi_control_ARREADY,s_axi_control_RDATA[31:0],s_axi_control_RRESP[1:0],s_axi_control_RVALID,s_axi_control_RREADY,ap_clk,ap_rst_n,interrupt,m_axi_BUS0_AWADDR[63:0],m_axi_BUS0_AWLEN[7:0],m_axi_BUS0_AWSIZE[2:0],m_axi_BUS0_AWBURST[1:0],m_axi_BUS0_AWLOCK[1:0],m_axi_BUS0_AWREGION[3:0],m_axi_BUS0_AWCACHE[3:0],m_axi_BUS0_AWPROT[2:0],m_axi_BUS0_AWQOS[3:0],m_axi_BUS0_AWVALID,m_axi_BUS0_AWREADY,m_axi_BUS0_WDATA[31:0],m_axi_BUS0_WSTRB[3:0],m_axi_BUS0_WLAST,m_axi_BUS0_WVALID,m_axi_BUS0_WREADY,m_axi_BUS0_BRESP[1:0],m_axi_BUS0_BVALID,m_axi_BUS0_BREADY,m_axi_BUS0_ARADDR[63:0],m_axi_BUS0_ARLEN[7:0],m_axi_BUS0_ARSIZE[2:0],m_axi_BUS0_ARBURST[1:0],m_axi_BUS0_ARLOCK[1:0],m_axi_BUS0_ARREGION[3:0],m_axi_BUS0_ARCACHE[3:0],m_axi_BUS0_ARPROT[2:0],m_axi_BUS0_ARQOS[3:0],m_axi_BUS0_ARVALID,m_axi_BUS0_ARREADY,m_axi_BUS0_RDATA[31:0],m_axi_BUS0_RRESP[1:0],m_axi_BUS0_RLAST,m_axi_BUS0_RVALID,m_axi_BUS0_RREADY,internal_bram_Clk_A,internal_bram_Rst_A,internal_bram_EN_A,internal_bram_WEN_A[3:0],internal_bram_Addr_A[31:0],internal_bram_Din_A[31:0],internal_bram_Dout_A[31:0]" */;
  input [5:0]s_axi_control_AWADDR;
  input s_axi_control_AWVALID;
  output s_axi_control_AWREADY;
  input [31:0]s_axi_control_WDATA;
  input [3:0]s_axi_control_WSTRB;
  input s_axi_control_WVALID;
  output s_axi_control_WREADY;
  output [1:0]s_axi_control_BRESP;
  output s_axi_control_BVALID;
  input s_axi_control_BREADY;
  input [5:0]s_axi_control_ARADDR;
  input s_axi_control_ARVALID;
  output s_axi_control_ARREADY;
  output [31:0]s_axi_control_RDATA;
  output [1:0]s_axi_control_RRESP;
  output s_axi_control_RVALID;
  input s_axi_control_RREADY;
  input ap_clk;
  input ap_rst_n;
  output interrupt;
  output [63:0]m_axi_BUS0_AWADDR;
  output [7:0]m_axi_BUS0_AWLEN;
  output [2:0]m_axi_BUS0_AWSIZE;
  output [1:0]m_axi_BUS0_AWBURST;
  output [1:0]m_axi_BUS0_AWLOCK;
  output [3:0]m_axi_BUS0_AWREGION;
  output [3:0]m_axi_BUS0_AWCACHE;
  output [2:0]m_axi_BUS0_AWPROT;
  output [3:0]m_axi_BUS0_AWQOS;
  output m_axi_BUS0_AWVALID;
  input m_axi_BUS0_AWREADY;
  output [31:0]m_axi_BUS0_WDATA;
  output [3:0]m_axi_BUS0_WSTRB;
  output m_axi_BUS0_WLAST;
  output m_axi_BUS0_WVALID;
  input m_axi_BUS0_WREADY;
  input [1:0]m_axi_BUS0_BRESP;
  input m_axi_BUS0_BVALID;
  output m_axi_BUS0_BREADY;
  output [63:0]m_axi_BUS0_ARADDR;
  output [7:0]m_axi_BUS0_ARLEN;
  output [2:0]m_axi_BUS0_ARSIZE;
  output [1:0]m_axi_BUS0_ARBURST;
  output [1:0]m_axi_BUS0_ARLOCK;
  output [3:0]m_axi_BUS0_ARREGION;
  output [3:0]m_axi_BUS0_ARCACHE;
  output [2:0]m_axi_BUS0_ARPROT;
  output [3:0]m_axi_BUS0_ARQOS;
  output m_axi_BUS0_ARVALID;
  input m_axi_BUS0_ARREADY;
  input [31:0]m_axi_BUS0_RDATA;
  input [1:0]m_axi_BUS0_RRESP;
  input m_axi_BUS0_RLAST;
  input m_axi_BUS0_RVALID;
  output m_axi_BUS0_RREADY;
  output internal_bram_Clk_A;
  output internal_bram_Rst_A;
  output internal_bram_EN_A;
  output [3:0]internal_bram_WEN_A;
  output [31:0]internal_bram_Addr_A;
  output [31:0]internal_bram_Din_A;
  input [31:0]internal_bram_Dout_A;
endmodule
