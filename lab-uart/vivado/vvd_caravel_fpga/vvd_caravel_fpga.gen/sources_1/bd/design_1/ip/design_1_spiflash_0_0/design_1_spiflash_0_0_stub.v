// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Fri Jun  2 19:17:38 2023
// Host        : josh-All-Series running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/josh/caravel-soc_fpga/vivado/vvd_caravel_fpga/vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_spiflash_0_0/design_1_spiflash_0_0_stub.v
// Design      : design_1_spiflash_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "spiflash,Vivado 2022.1" *)
module design_1_spiflash_0_0(ap_clk, ap_rst, romcode_Addr_A, romcode_EN_A, 
  romcode_WEN_A, romcode_Din_A, romcode_Dout_A, romcode_Clk_A, romcode_Rst_A, csb, spiclk, io0, 
  io1)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst,romcode_Addr_A[31:0],romcode_EN_A,romcode_WEN_A[3:0],romcode_Din_A[31:0],romcode_Dout_A[31:0],romcode_Clk_A,romcode_Rst_A,csb,spiclk,io0[0:0],io1" */;
  input ap_clk;
  input ap_rst;
  output [31:0]romcode_Addr_A;
  output romcode_EN_A;
  output [3:0]romcode_WEN_A;
  output [31:0]romcode_Din_A;
  input [31:0]romcode_Dout_A;
  output romcode_Clk_A;
  output romcode_Rst_A;
  input csb;
  input spiclk;
  input [0:0]io0;
  output io1;
endmodule
