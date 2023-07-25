// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:hls:read_romcode:0.0
// IP Revision: 1

(* X_CORE_INFO = "read_romcode,Vivado 2022.1" *)
(* CHECK_LICENSE_TYPE = "design_1_read_romcode_0_0,read_romcode,{}" *)
(* CORE_GENERATION_INFO = "design_1_read_romcode_0_0,read_romcode,{x_ipProduct=Vivado 2022.1,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=read_romcode,x_ipVersion=0.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_S_AXI_CONTROL_ADDR_WIDTH=6,C_S_AXI_CONTROL_DATA_WIDTH=32,C_M_AXI_BUS0_ID_WIDTH=1,C_M_AXI_BUS0_ADDR_WIDTH=64,C_M_AXI_BUS0_DATA_WIDTH=32,C_M_AXI_BUS0_AWUSER_WIDTH=1,C_M_AXI_BUS0_ARUSER_WIDTH=1,C_M_AXI_BUS0_WUSER_WIDTH=1,C_M_AXI_BUS0_RUSER_WIDTH=1,C_M_AXI_BUS0_BUSER_WIDTH=1,C_M_AXI_BUS0_USER_VALU\
E=0x00000000,C_M_AXI_BUS0_PROT_VALUE=000,C_M_AXI_BUS0_CACHE_VALUE=0011}" *)
(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_read_romcode_0_0 (
  s_axi_control_AWADDR,
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
  internal_bram_Dout_A
);

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR" *)
input wire [5 : 0] s_axi_control_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID" *)
input wire s_axi_control_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY" *)
output wire s_axi_control_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WDATA" *)
input wire [31 : 0] s_axi_control_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB" *)
input wire [3 : 0] s_axi_control_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WVALID" *)
input wire s_axi_control_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WREADY" *)
output wire s_axi_control_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BRESP" *)
output wire [1 : 0] s_axi_control_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BVALID" *)
output wire s_axi_control_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BREADY" *)
input wire s_axi_control_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR" *)
input wire [5 : 0] s_axi_control_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID" *)
input wire s_axi_control_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY" *)
output wire s_axi_control_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RDATA" *)
output wire [31 : 0] s_axi_control_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RRESP" *)
output wire [1 : 0] s_axi_control_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RVALID" *)
output wire s_axi_control_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 6, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 10000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_TH\
READS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RREADY" *)
input wire s_axi_control_RREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_control:m_axi_BUS0, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *)
output wire interrupt;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWADDR" *)
output wire [63 : 0] m_axi_BUS0_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWLEN" *)
output wire [7 : 0] m_axi_BUS0_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWSIZE" *)
output wire [2 : 0] m_axi_BUS0_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWBURST" *)
output wire [1 : 0] m_axi_BUS0_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWLOCK" *)
output wire [1 : 0] m_axi_BUS0_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWREGION" *)
output wire [3 : 0] m_axi_BUS0_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWCACHE" *)
output wire [3 : 0] m_axi_BUS0_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWPROT" *)
output wire [2 : 0] m_axi_BUS0_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWQOS" *)
output wire [3 : 0] m_axi_BUS0_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWVALID" *)
output wire m_axi_BUS0_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 AWREADY" *)
input wire m_axi_BUS0_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 WDATA" *)
output wire [31 : 0] m_axi_BUS0_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 WSTRB" *)
output wire [3 : 0] m_axi_BUS0_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 WLAST" *)
output wire m_axi_BUS0_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 WVALID" *)
output wire m_axi_BUS0_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 WREADY" *)
input wire m_axi_BUS0_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 BRESP" *)
input wire [1 : 0] m_axi_BUS0_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 BVALID" *)
input wire m_axi_BUS0_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 BREADY" *)
output wire m_axi_BUS0_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARADDR" *)
output wire [63 : 0] m_axi_BUS0_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARLEN" *)
output wire [7 : 0] m_axi_BUS0_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARSIZE" *)
output wire [2 : 0] m_axi_BUS0_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARBURST" *)
output wire [1 : 0] m_axi_BUS0_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARLOCK" *)
output wire [1 : 0] m_axi_BUS0_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARREGION" *)
output wire [3 : 0] m_axi_BUS0_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARCACHE" *)
output wire [3 : 0] m_axi_BUS0_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARPROT" *)
output wire [2 : 0] m_axi_BUS0_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARQOS" *)
output wire [3 : 0] m_axi_BUS0_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARVALID" *)
output wire m_axi_BUS0_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 ARREADY" *)
input wire m_axi_BUS0_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 RDATA" *)
input wire [31 : 0] m_axi_BUS0_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 RRESP" *)
input wire [1 : 0] m_axi_BUS0_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 RLAST" *)
input wire m_axi_BUS0_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 RVALID" *)
input wire m_axi_BUS0_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_BUS0, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 64, MAX_WRITE_BURST_LENGTH 16, MAX_BURST_LENGTH 256, PROTOCOL AXI4, READ_WRITE_MODE READ_ONLY, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, FREQ_HZ 10000000, ID_WIDTH 0, ADDR_WIDTH 64, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.0, CLK_DOMAIN desi\
gn_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_BUS0 RREADY" *)
output wire m_axi_BUS0_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 internal_bram_PORTA CLK" *)
output wire internal_bram_Clk_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 internal_bram_PORTA RST" *)
output wire internal_bram_Rst_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 internal_bram_PORTA EN" *)
output wire internal_bram_EN_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 internal_bram_PORTA WE" *)
output wire [3 : 0] internal_bram_WEN_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 internal_bram_PORTA ADDR" *)
output wire [31 : 0] internal_bram_Addr_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 internal_bram_PORTA DIN" *)
output wire [31 : 0] internal_bram_Din_A;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME internal_bram_PORTA, MEM_WIDTH 32, MEM_SIZE 8192, MASTER_TYPE BRAM_CTRL, MEM_ECC NONE, READ_LATENCY 1" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 internal_bram_PORTA DOUT" *)
input wire [31 : 0] internal_bram_Dout_A;

(* SDX_KERNEL = "true" *)
(* SDX_KERNEL_TYPE = "hls" *)
(* SDX_KERNEL_SYNTH_INST = "inst" *)
  read_romcode #(
    .C_S_AXI_CONTROL_ADDR_WIDTH(6),
    .C_S_AXI_CONTROL_DATA_WIDTH(32),
    .C_M_AXI_BUS0_ID_WIDTH(1),
    .C_M_AXI_BUS0_ADDR_WIDTH(64),
    .C_M_AXI_BUS0_DATA_WIDTH(32),
    .C_M_AXI_BUS0_AWUSER_WIDTH(1),
    .C_M_AXI_BUS0_ARUSER_WIDTH(1),
    .C_M_AXI_BUS0_WUSER_WIDTH(1),
    .C_M_AXI_BUS0_RUSER_WIDTH(1),
    .C_M_AXI_BUS0_BUSER_WIDTH(1),
    .C_M_AXI_BUS0_USER_VALUE(32'H00000000),
    .C_M_AXI_BUS0_PROT_VALUE(3'B000),
    .C_M_AXI_BUS0_CACHE_VALUE(4'B0011)
  ) inst (
    .s_axi_control_AWADDR(s_axi_control_AWADDR),
    .s_axi_control_AWVALID(s_axi_control_AWVALID),
    .s_axi_control_AWREADY(s_axi_control_AWREADY),
    .s_axi_control_WDATA(s_axi_control_WDATA),
    .s_axi_control_WSTRB(s_axi_control_WSTRB),
    .s_axi_control_WVALID(s_axi_control_WVALID),
    .s_axi_control_WREADY(s_axi_control_WREADY),
    .s_axi_control_BRESP(s_axi_control_BRESP),
    .s_axi_control_BVALID(s_axi_control_BVALID),
    .s_axi_control_BREADY(s_axi_control_BREADY),
    .s_axi_control_ARADDR(s_axi_control_ARADDR),
    .s_axi_control_ARVALID(s_axi_control_ARVALID),
    .s_axi_control_ARREADY(s_axi_control_ARREADY),
    .s_axi_control_RDATA(s_axi_control_RDATA),
    .s_axi_control_RRESP(s_axi_control_RRESP),
    .s_axi_control_RVALID(s_axi_control_RVALID),
    .s_axi_control_RREADY(s_axi_control_RREADY),
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .interrupt(interrupt),
    .m_axi_BUS0_AWID(),
    .m_axi_BUS0_AWADDR(m_axi_BUS0_AWADDR),
    .m_axi_BUS0_AWLEN(m_axi_BUS0_AWLEN),
    .m_axi_BUS0_AWSIZE(m_axi_BUS0_AWSIZE),
    .m_axi_BUS0_AWBURST(m_axi_BUS0_AWBURST),
    .m_axi_BUS0_AWLOCK(m_axi_BUS0_AWLOCK),
    .m_axi_BUS0_AWREGION(m_axi_BUS0_AWREGION),
    .m_axi_BUS0_AWCACHE(m_axi_BUS0_AWCACHE),
    .m_axi_BUS0_AWPROT(m_axi_BUS0_AWPROT),
    .m_axi_BUS0_AWQOS(m_axi_BUS0_AWQOS),
    .m_axi_BUS0_AWUSER(),
    .m_axi_BUS0_AWVALID(m_axi_BUS0_AWVALID),
    .m_axi_BUS0_AWREADY(m_axi_BUS0_AWREADY),
    .m_axi_BUS0_WID(),
    .m_axi_BUS0_WDATA(m_axi_BUS0_WDATA),
    .m_axi_BUS0_WSTRB(m_axi_BUS0_WSTRB),
    .m_axi_BUS0_WLAST(m_axi_BUS0_WLAST),
    .m_axi_BUS0_WUSER(),
    .m_axi_BUS0_WVALID(m_axi_BUS0_WVALID),
    .m_axi_BUS0_WREADY(m_axi_BUS0_WREADY),
    .m_axi_BUS0_BID(1'B0),
    .m_axi_BUS0_BRESP(m_axi_BUS0_BRESP),
    .m_axi_BUS0_BUSER(1'B0),
    .m_axi_BUS0_BVALID(m_axi_BUS0_BVALID),
    .m_axi_BUS0_BREADY(m_axi_BUS0_BREADY),
    .m_axi_BUS0_ARID(),
    .m_axi_BUS0_ARADDR(m_axi_BUS0_ARADDR),
    .m_axi_BUS0_ARLEN(m_axi_BUS0_ARLEN),
    .m_axi_BUS0_ARSIZE(m_axi_BUS0_ARSIZE),
    .m_axi_BUS0_ARBURST(m_axi_BUS0_ARBURST),
    .m_axi_BUS0_ARLOCK(m_axi_BUS0_ARLOCK),
    .m_axi_BUS0_ARREGION(m_axi_BUS0_ARREGION),
    .m_axi_BUS0_ARCACHE(m_axi_BUS0_ARCACHE),
    .m_axi_BUS0_ARPROT(m_axi_BUS0_ARPROT),
    .m_axi_BUS0_ARQOS(m_axi_BUS0_ARQOS),
    .m_axi_BUS0_ARUSER(),
    .m_axi_BUS0_ARVALID(m_axi_BUS0_ARVALID),
    .m_axi_BUS0_ARREADY(m_axi_BUS0_ARREADY),
    .m_axi_BUS0_RID(1'B0),
    .m_axi_BUS0_RDATA(m_axi_BUS0_RDATA),
    .m_axi_BUS0_RRESP(m_axi_BUS0_RRESP),
    .m_axi_BUS0_RLAST(m_axi_BUS0_RLAST),
    .m_axi_BUS0_RUSER(1'B0),
    .m_axi_BUS0_RVALID(m_axi_BUS0_RVALID),
    .m_axi_BUS0_RREADY(m_axi_BUS0_RREADY),
    .internal_bram_Clk_A(internal_bram_Clk_A),
    .internal_bram_Rst_A(internal_bram_Rst_A),
    .internal_bram_EN_A(internal_bram_EN_A),
    .internal_bram_WEN_A(internal_bram_WEN_A),
    .internal_bram_Addr_A(internal_bram_Addr_A),
    .internal_bram_Din_A(internal_bram_Din_A),
    .internal_bram_Dout_A(internal_bram_Dout_A)
  );
endmodule
