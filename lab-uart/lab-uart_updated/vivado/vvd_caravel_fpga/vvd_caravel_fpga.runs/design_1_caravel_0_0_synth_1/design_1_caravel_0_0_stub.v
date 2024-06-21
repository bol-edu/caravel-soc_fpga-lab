// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Sat Nov 18 18:21:54 2023
// Host        : ubuntu2004 running 64-bit Ubuntu 20.04.4 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_caravel_0_0_stub.v
// Design      : design_1_caravel_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "caravel,Vivado 2022.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(gpio, mprj_i, mprj_o, mprj_en, clock, resetb, 
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
