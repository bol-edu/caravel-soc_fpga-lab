// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Fri Jun  2 19:19:17 2023
// Host        : josh-All-Series running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/josh/caravel-soc_fpga/vivado/vvd_caravel_fpga/vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_caravel_0_0/design_1_caravel_0_0_stub.v
// Design      : design_1_caravel_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "caravel,Vivado 2022.1" *)
module design_1_caravel_0_0(gpio, mprj_i, mprj_o, mprj_en, clock, resetb, 
  flash_csb, flash_clk, flash_io0, flash_io1)
/* synthesis syn_black_box black_box_pad_pin="gpio,mprj_i[37:0],mprj_o[37:0],mprj_en[37:0],clock,resetb,flash_csb,flash_clk,flash_io0,flash_io1" */;
  inout gpio;
  input [37:0]mprj_i;
  output [37:0]mprj_o;
  output [37:0]mprj_en;
  input clock;
  input resetb;
  output flash_csb;
  output flash_clk;
  output flash_io0;
  input flash_io1;
endmodule
