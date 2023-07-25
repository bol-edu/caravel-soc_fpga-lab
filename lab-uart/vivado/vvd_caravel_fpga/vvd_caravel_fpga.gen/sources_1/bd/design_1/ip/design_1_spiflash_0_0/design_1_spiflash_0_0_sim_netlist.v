// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Fri Jun  2 19:17:38 2023
// Host        : josh-All-Series running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/josh/caravel-soc_fpga/vivado/vvd_caravel_fpga/vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_spiflash_0_0/design_1_spiflash_0_0_sim_netlist.v
// Design      : design_1_spiflash_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_spiflash_0_0,spiflash,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "spiflash,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module design_1_spiflash_0_0
   (ap_clk,
    ap_rst,
    romcode_Addr_A,
    romcode_EN_A,
    romcode_WEN_A,
    romcode_Din_A,
    romcode_Dout_A,
    romcode_Clk_A,
    romcode_Rst_A,
    csb,
    spiclk,
    io0,
    io1);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input ap_rst;
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

  wire \<const0> ;
  wire ap_clk;
  wire ap_rst;
  wire csb;
  wire [0:0]io0;
  wire io1;
  wire [23:0]\^romcode_Addr_A ;
  wire [31:0]romcode_Dout_A;
  wire romcode_EN_A;
  wire spiclk;

  assign romcode_Addr_A[31] = \<const0> ;
  assign romcode_Addr_A[30] = \<const0> ;
  assign romcode_Addr_A[29] = \<const0> ;
  assign romcode_Addr_A[28] = \<const0> ;
  assign romcode_Addr_A[27] = \<const0> ;
  assign romcode_Addr_A[26] = \<const0> ;
  assign romcode_Addr_A[25] = \<const0> ;
  assign romcode_Addr_A[24] = \<const0> ;
  assign romcode_Addr_A[23:0] = \^romcode_Addr_A [23:0];
  assign romcode_Clk_A = ap_clk;
  assign romcode_Din_A[31] = \<const0> ;
  assign romcode_Din_A[30] = \<const0> ;
  assign romcode_Din_A[29] = \<const0> ;
  assign romcode_Din_A[28] = \<const0> ;
  assign romcode_Din_A[27] = \<const0> ;
  assign romcode_Din_A[26] = \<const0> ;
  assign romcode_Din_A[25] = \<const0> ;
  assign romcode_Din_A[24] = \<const0> ;
  assign romcode_Din_A[23] = \<const0> ;
  assign romcode_Din_A[22] = \<const0> ;
  assign romcode_Din_A[21] = \<const0> ;
  assign romcode_Din_A[20] = \<const0> ;
  assign romcode_Din_A[19] = \<const0> ;
  assign romcode_Din_A[18] = \<const0> ;
  assign romcode_Din_A[17] = \<const0> ;
  assign romcode_Din_A[16] = \<const0> ;
  assign romcode_Din_A[15] = \<const0> ;
  assign romcode_Din_A[14] = \<const0> ;
  assign romcode_Din_A[13] = \<const0> ;
  assign romcode_Din_A[12] = \<const0> ;
  assign romcode_Din_A[11] = \<const0> ;
  assign romcode_Din_A[10] = \<const0> ;
  assign romcode_Din_A[9] = \<const0> ;
  assign romcode_Din_A[8] = \<const0> ;
  assign romcode_Din_A[7] = \<const0> ;
  assign romcode_Din_A[6] = \<const0> ;
  assign romcode_Din_A[5] = \<const0> ;
  assign romcode_Din_A[4] = \<const0> ;
  assign romcode_Din_A[3] = \<const0> ;
  assign romcode_Din_A[2] = \<const0> ;
  assign romcode_Din_A[1] = \<const0> ;
  assign romcode_Din_A[0] = \<const0> ;
  assign romcode_Rst_A = ap_rst;
  assign romcode_WEN_A[3] = \<const0> ;
  assign romcode_WEN_A[2] = \<const0> ;
  assign romcode_WEN_A[1] = \<const0> ;
  assign romcode_WEN_A[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  design_1_spiflash_0_0_spiflash inst
       (.\bytecount_reg[6]_0 (romcode_EN_A),
        .csb(csb),
        .io0(io0),
        .io1(io1),
        .romcode_Addr_A(\^romcode_Addr_A ),
        .romcode_Dout_A(romcode_Dout_A),
        .spiclk(spiclk));
endmodule

(* ORIG_REF_NAME = "spiflash" *) 
module design_1_spiflash_0_0_spiflash
   (romcode_Addr_A,
    io1,
    \bytecount_reg[6]_0 ,
    spiclk,
    csb,
    io0,
    romcode_Dout_A);
  output [23:0]romcode_Addr_A;
  output io1;
  output \bytecount_reg[6]_0 ;
  input spiclk;
  input csb;
  input [0:0]io0;
  input [31:0]romcode_Dout_A;

  wire [2:0]bitcount;
  wire \bitcount[0]_i_1_n_0 ;
  wire \bitcount[1]_i_1_n_0 ;
  wire \bitcount[2]_i_1_n_0 ;
  wire [7:1]buffer_next;
  wire \bytecount[0]_i_3_n_0 ;
  wire [12:0]bytecount_reg;
  wire \bytecount_reg[0]_i_2_n_0 ;
  wire \bytecount_reg[0]_i_2_n_1 ;
  wire \bytecount_reg[0]_i_2_n_2 ;
  wire \bytecount_reg[0]_i_2_n_3 ;
  wire \bytecount_reg[0]_i_2_n_4 ;
  wire \bytecount_reg[0]_i_2_n_5 ;
  wire \bytecount_reg[0]_i_2_n_6 ;
  wire \bytecount_reg[0]_i_2_n_7 ;
  wire \bytecount_reg[12]_i_1_n_7 ;
  wire \bytecount_reg[4]_i_1_n_0 ;
  wire \bytecount_reg[4]_i_1_n_1 ;
  wire \bytecount_reg[4]_i_1_n_2 ;
  wire \bytecount_reg[4]_i_1_n_3 ;
  wire \bytecount_reg[4]_i_1_n_4 ;
  wire \bytecount_reg[4]_i_1_n_5 ;
  wire \bytecount_reg[4]_i_1_n_6 ;
  wire \bytecount_reg[4]_i_1_n_7 ;
  wire \bytecount_reg[6]_0 ;
  wire \bytecount_reg[8]_i_1_n_0 ;
  wire \bytecount_reg[8]_i_1_n_1 ;
  wire \bytecount_reg[8]_i_1_n_2 ;
  wire \bytecount_reg[8]_i_1_n_3 ;
  wire \bytecount_reg[8]_i_1_n_4 ;
  wire \bytecount_reg[8]_i_1_n_5 ;
  wire \bytecount_reg[8]_i_1_n_6 ;
  wire \bytecount_reg[8]_i_1_n_7 ;
  wire csb;
  wire [0:0]io0;
  wire io1;
  wire [6:0]outbuf;
  wire \outbuf[0]_i_1_n_0 ;
  wire \outbuf[0]_i_2_n_0 ;
  wire \outbuf[1]_i_1_n_0 ;
  wire \outbuf[1]_i_2_n_0 ;
  wire \outbuf[2]_i_1_n_0 ;
  wire \outbuf[2]_i_2_n_0 ;
  wire \outbuf[3]_i_1_n_0 ;
  wire \outbuf[3]_i_2_n_0 ;
  wire \outbuf[4]_i_1_n_0 ;
  wire \outbuf[4]_i_2_n_0 ;
  wire \outbuf[5]_i_1_n_0 ;
  wire \outbuf[5]_i_2_n_0 ;
  wire \outbuf[6]_i_1_n_0 ;
  wire \outbuf[6]_i_2_n_0 ;
  wire \outbuf[7]_i_1_n_0 ;
  wire \outbuf[7]_i_2_n_0 ;
  wire [23:0]p_1_in;
  wire [23:0]romcode_Addr_A;
  wire [31:0]romcode_Dout_A;
  wire romcode_EN_A_INST_0_i_1_n_0;
  wire romcode_EN_A_INST_0_i_2_n_0;
  wire sel;
  wire [23:1]spi_addr0;
  wire spi_addr0_carry__0_n_0;
  wire spi_addr0_carry__0_n_1;
  wire spi_addr0_carry__0_n_2;
  wire spi_addr0_carry__0_n_3;
  wire spi_addr0_carry__1_n_0;
  wire spi_addr0_carry__1_n_1;
  wire spi_addr0_carry__1_n_2;
  wire spi_addr0_carry__1_n_3;
  wire spi_addr0_carry__2_n_0;
  wire spi_addr0_carry__2_n_1;
  wire spi_addr0_carry__2_n_2;
  wire spi_addr0_carry__2_n_3;
  wire spi_addr0_carry__3_n_0;
  wire spi_addr0_carry__3_n_1;
  wire spi_addr0_carry__3_n_2;
  wire spi_addr0_carry__3_n_3;
  wire spi_addr0_carry__4_n_2;
  wire spi_addr0_carry__4_n_3;
  wire spi_addr0_carry_n_0;
  wire spi_addr0_carry_n_1;
  wire spi_addr0_carry_n_2;
  wire spi_addr0_carry_n_3;
  wire \spi_addr[15]_i_1_n_0 ;
  wire \spi_addr[15]_i_3_n_0 ;
  wire \spi_addr[15]_i_4_n_0 ;
  wire \spi_addr[23]_i_1_n_0 ;
  wire \spi_addr[23]_i_3_n_0 ;
  wire \spi_addr[23]_i_4_n_0 ;
  wire \spi_addr[23]_i_5_n_0 ;
  wire \spi_addr[23]_i_6_n_0 ;
  wire \spi_addr[23]_i_7_n_0 ;
  wire \spi_addr[7]_i_1_n_0 ;
  wire \spi_cmd[7]_i_1_n_0 ;
  wire \spi_cmd_reg_n_0_[0] ;
  wire \spi_cmd_reg_n_0_[1] ;
  wire \spi_cmd_reg_n_0_[2] ;
  wire \spi_cmd_reg_n_0_[3] ;
  wire \spi_cmd_reg_n_0_[4] ;
  wire \spi_cmd_reg_n_0_[5] ;
  wire \spi_cmd_reg_n_0_[6] ;
  wire \spi_cmd_reg_n_0_[7] ;
  wire spiclk;
  wire [3:0]\NLW_bytecount_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_bytecount_reg[12]_i_1_O_UNCONNECTED ;
  wire [3:2]NLW_spi_addr0_carry__4_CO_UNCONNECTED;
  wire [3:3]NLW_spi_addr0_carry__4_O_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \bitcount[0]_i_1 
       (.I0(bitcount[0]),
        .O(\bitcount[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \bitcount[1]_i_1 
       (.I0(bitcount[0]),
        .I1(bitcount[1]),
        .O(\bitcount[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \bitcount[2]_i_1 
       (.I0(bitcount[0]),
        .I1(bitcount[1]),
        .I2(bitcount[2]),
        .O(\bitcount[2]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \bitcount_reg[0] 
       (.C(spiclk),
        .CE(1'b1),
        .CLR(csb),
        .D(\bitcount[0]_i_1_n_0 ),
        .Q(bitcount[0]));
  FDCE #(
    .INIT(1'b0)) 
    \bitcount_reg[1] 
       (.C(spiclk),
        .CE(1'b1),
        .CLR(csb),
        .D(\bitcount[1]_i_1_n_0 ),
        .Q(bitcount[1]));
  FDCE #(
    .INIT(1'b0)) 
    \bitcount_reg[2] 
       (.C(spiclk),
        .CE(1'b1),
        .CLR(csb),
        .D(\bitcount[2]_i_1_n_0 ),
        .Q(bitcount[2]));
  FDCE \buffer_reg[0] 
       (.C(spiclk),
        .CE(1'b1),
        .CLR(csb),
        .D(io0),
        .Q(buffer_next[1]));
  FDCE \buffer_reg[1] 
       (.C(spiclk),
        .CE(1'b1),
        .CLR(csb),
        .D(buffer_next[1]),
        .Q(buffer_next[2]));
  FDCE \buffer_reg[2] 
       (.C(spiclk),
        .CE(1'b1),
        .CLR(csb),
        .D(buffer_next[2]),
        .Q(buffer_next[3]));
  FDCE \buffer_reg[3] 
       (.C(spiclk),
        .CE(1'b1),
        .CLR(csb),
        .D(buffer_next[3]),
        .Q(buffer_next[4]));
  FDCE \buffer_reg[4] 
       (.C(spiclk),
        .CE(1'b1),
        .CLR(csb),
        .D(buffer_next[4]),
        .Q(buffer_next[5]));
  FDCE \buffer_reg[5] 
       (.C(spiclk),
        .CE(1'b1),
        .CLR(csb),
        .D(buffer_next[5]),
        .Q(buffer_next[6]));
  FDCE \buffer_reg[6] 
       (.C(spiclk),
        .CE(1'b1),
        .CLR(csb),
        .D(buffer_next[6]),
        .Q(buffer_next[7]));
  LUT3 #(
    .INIT(8'h80)) 
    \bytecount[0]_i_1 
       (.I0(bitcount[2]),
        .I1(bitcount[1]),
        .I2(bitcount[0]),
        .O(sel));
  LUT1 #(
    .INIT(2'h1)) 
    \bytecount[0]_i_3 
       (.I0(bytecount_reg[0]),
        .O(\bytecount[0]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \bytecount_reg[0] 
       (.C(spiclk),
        .CE(sel),
        .CLR(csb),
        .D(\bytecount_reg[0]_i_2_n_7 ),
        .Q(bytecount_reg[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \bytecount_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\bytecount_reg[0]_i_2_n_0 ,\bytecount_reg[0]_i_2_n_1 ,\bytecount_reg[0]_i_2_n_2 ,\bytecount_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\bytecount_reg[0]_i_2_n_4 ,\bytecount_reg[0]_i_2_n_5 ,\bytecount_reg[0]_i_2_n_6 ,\bytecount_reg[0]_i_2_n_7 }),
        .S({bytecount_reg[3:1],\bytecount[0]_i_3_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \bytecount_reg[10] 
       (.C(spiclk),
        .CE(sel),
        .CLR(csb),
        .D(\bytecount_reg[8]_i_1_n_5 ),
        .Q(bytecount_reg[10]));
  FDCE #(
    .INIT(1'b0)) 
    \bytecount_reg[11] 
       (.C(spiclk),
        .CE(sel),
        .CLR(csb),
        .D(\bytecount_reg[8]_i_1_n_4 ),
        .Q(bytecount_reg[11]));
  FDCE #(
    .INIT(1'b0)) 
    \bytecount_reg[12] 
       (.C(spiclk),
        .CE(sel),
        .CLR(csb),
        .D(\bytecount_reg[12]_i_1_n_7 ),
        .Q(bytecount_reg[12]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \bytecount_reg[12]_i_1 
       (.CI(\bytecount_reg[8]_i_1_n_0 ),
        .CO(\NLW_bytecount_reg[12]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_bytecount_reg[12]_i_1_O_UNCONNECTED [3:1],\bytecount_reg[12]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,bytecount_reg[12]}));
  FDCE #(
    .INIT(1'b0)) 
    \bytecount_reg[1] 
       (.C(spiclk),
        .CE(sel),
        .CLR(csb),
        .D(\bytecount_reg[0]_i_2_n_6 ),
        .Q(bytecount_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \bytecount_reg[2] 
       (.C(spiclk),
        .CE(sel),
        .CLR(csb),
        .D(\bytecount_reg[0]_i_2_n_5 ),
        .Q(bytecount_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \bytecount_reg[3] 
       (.C(spiclk),
        .CE(sel),
        .CLR(csb),
        .D(\bytecount_reg[0]_i_2_n_4 ),
        .Q(bytecount_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \bytecount_reg[4] 
       (.C(spiclk),
        .CE(sel),
        .CLR(csb),
        .D(\bytecount_reg[4]_i_1_n_7 ),
        .Q(bytecount_reg[4]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \bytecount_reg[4]_i_1 
       (.CI(\bytecount_reg[0]_i_2_n_0 ),
        .CO({\bytecount_reg[4]_i_1_n_0 ,\bytecount_reg[4]_i_1_n_1 ,\bytecount_reg[4]_i_1_n_2 ,\bytecount_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\bytecount_reg[4]_i_1_n_4 ,\bytecount_reg[4]_i_1_n_5 ,\bytecount_reg[4]_i_1_n_6 ,\bytecount_reg[4]_i_1_n_7 }),
        .S(bytecount_reg[7:4]));
  FDCE #(
    .INIT(1'b0)) 
    \bytecount_reg[5] 
       (.C(spiclk),
        .CE(sel),
        .CLR(csb),
        .D(\bytecount_reg[4]_i_1_n_6 ),
        .Q(bytecount_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \bytecount_reg[6] 
       (.C(spiclk),
        .CE(sel),
        .CLR(csb),
        .D(\bytecount_reg[4]_i_1_n_5 ),
        .Q(bytecount_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \bytecount_reg[7] 
       (.C(spiclk),
        .CE(sel),
        .CLR(csb),
        .D(\bytecount_reg[4]_i_1_n_4 ),
        .Q(bytecount_reg[7]));
  FDCE #(
    .INIT(1'b0)) 
    \bytecount_reg[8] 
       (.C(spiclk),
        .CE(sel),
        .CLR(csb),
        .D(\bytecount_reg[8]_i_1_n_7 ),
        .Q(bytecount_reg[8]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \bytecount_reg[8]_i_1 
       (.CI(\bytecount_reg[4]_i_1_n_0 ),
        .CO({\bytecount_reg[8]_i_1_n_0 ,\bytecount_reg[8]_i_1_n_1 ,\bytecount_reg[8]_i_1_n_2 ,\bytecount_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\bytecount_reg[8]_i_1_n_4 ,\bytecount_reg[8]_i_1_n_5 ,\bytecount_reg[8]_i_1_n_6 ,\bytecount_reg[8]_i_1_n_7 }),
        .S(bytecount_reg[11:8]));
  FDCE #(
    .INIT(1'b0)) 
    \bytecount_reg[9] 
       (.C(spiclk),
        .CE(sel),
        .CLR(csb),
        .D(\bytecount_reg[8]_i_1_n_6 ),
        .Q(bytecount_reg[9]));
  LUT5 #(
    .INIT(32'h00000008)) 
    \outbuf[0]_i_1 
       (.I0(\outbuf[0]_i_2_n_0 ),
        .I1(\bytecount_reg[6]_0 ),
        .I2(bitcount[1]),
        .I3(bitcount[0]),
        .I4(bitcount[2]),
        .O(\outbuf[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCAAF0FFCCAAF000)) 
    \outbuf[0]_i_2 
       (.I0(romcode_Dout_A[16]),
        .I1(romcode_Dout_A[24]),
        .I2(romcode_Dout_A[8]),
        .I3(romcode_Addr_A[0]),
        .I4(romcode_Addr_A[1]),
        .I5(romcode_Dout_A[0]),
        .O(\outbuf[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAA8AAAA)) 
    \outbuf[1]_i_1 
       (.I0(outbuf[0]),
        .I1(bitcount[2]),
        .I2(bitcount[0]),
        .I3(bitcount[1]),
        .I4(\bytecount_reg[6]_0 ),
        .I5(\outbuf[1]_i_2_n_0 ),
        .O(\outbuf[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCAAF0FFCCAAF000)) 
    \outbuf[1]_i_2 
       (.I0(romcode_Dout_A[17]),
        .I1(romcode_Dout_A[25]),
        .I2(romcode_Dout_A[9]),
        .I3(romcode_Addr_A[0]),
        .I4(romcode_Addr_A[1]),
        .I5(romcode_Dout_A[1]),
        .O(\outbuf[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAA8AAAA)) 
    \outbuf[2]_i_1 
       (.I0(outbuf[1]),
        .I1(bitcount[2]),
        .I2(bitcount[0]),
        .I3(bitcount[1]),
        .I4(\bytecount_reg[6]_0 ),
        .I5(\outbuf[2]_i_2_n_0 ),
        .O(\outbuf[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCAAF0FFCCAAF000)) 
    \outbuf[2]_i_2 
       (.I0(romcode_Dout_A[18]),
        .I1(romcode_Dout_A[26]),
        .I2(romcode_Dout_A[10]),
        .I3(romcode_Addr_A[0]),
        .I4(romcode_Addr_A[1]),
        .I5(romcode_Dout_A[2]),
        .O(\outbuf[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAA8AAAA)) 
    \outbuf[3]_i_1 
       (.I0(outbuf[2]),
        .I1(bitcount[2]),
        .I2(bitcount[0]),
        .I3(bitcount[1]),
        .I4(\bytecount_reg[6]_0 ),
        .I5(\outbuf[3]_i_2_n_0 ),
        .O(\outbuf[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCAAF0FFCCAAF000)) 
    \outbuf[3]_i_2 
       (.I0(romcode_Dout_A[19]),
        .I1(romcode_Dout_A[27]),
        .I2(romcode_Dout_A[11]),
        .I3(romcode_Addr_A[0]),
        .I4(romcode_Addr_A[1]),
        .I5(romcode_Dout_A[3]),
        .O(\outbuf[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAA8AAAA)) 
    \outbuf[4]_i_1 
       (.I0(outbuf[3]),
        .I1(bitcount[2]),
        .I2(bitcount[0]),
        .I3(bitcount[1]),
        .I4(\bytecount_reg[6]_0 ),
        .I5(\outbuf[4]_i_2_n_0 ),
        .O(\outbuf[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCAAF0FFCCAAF000)) 
    \outbuf[4]_i_2 
       (.I0(romcode_Dout_A[20]),
        .I1(romcode_Dout_A[28]),
        .I2(romcode_Dout_A[12]),
        .I3(romcode_Addr_A[0]),
        .I4(romcode_Addr_A[1]),
        .I5(romcode_Dout_A[4]),
        .O(\outbuf[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAA8AAAA)) 
    \outbuf[5]_i_1 
       (.I0(outbuf[4]),
        .I1(bitcount[2]),
        .I2(bitcount[0]),
        .I3(bitcount[1]),
        .I4(\bytecount_reg[6]_0 ),
        .I5(\outbuf[5]_i_2_n_0 ),
        .O(\outbuf[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \outbuf[5]_i_2 
       (.I0(romcode_Dout_A[5]),
        .I1(romcode_Dout_A[13]),
        .I2(romcode_Dout_A[21]),
        .I3(romcode_Addr_A[1]),
        .I4(romcode_Addr_A[0]),
        .I5(romcode_Dout_A[29]),
        .O(\outbuf[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAA8AAAA)) 
    \outbuf[6]_i_1 
       (.I0(outbuf[5]),
        .I1(bitcount[2]),
        .I2(bitcount[0]),
        .I3(bitcount[1]),
        .I4(\bytecount_reg[6]_0 ),
        .I5(\outbuf[6]_i_2_n_0 ),
        .O(\outbuf[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \outbuf[6]_i_2 
       (.I0(romcode_Dout_A[6]),
        .I1(romcode_Dout_A[14]),
        .I2(romcode_Dout_A[22]),
        .I3(romcode_Addr_A[1]),
        .I4(romcode_Addr_A[0]),
        .I5(romcode_Dout_A[30]),
        .O(\outbuf[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAAAA8AAAA)) 
    \outbuf[7]_i_1 
       (.I0(outbuf[6]),
        .I1(bitcount[2]),
        .I2(bitcount[0]),
        .I3(bitcount[1]),
        .I4(\bytecount_reg[6]_0 ),
        .I5(\outbuf[7]_i_2_n_0 ),
        .O(\outbuf[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \outbuf[7]_i_2 
       (.I0(romcode_Dout_A[7]),
        .I1(romcode_Dout_A[15]),
        .I2(romcode_Dout_A[23]),
        .I3(romcode_Addr_A[1]),
        .I4(romcode_Addr_A[0]),
        .I5(romcode_Dout_A[31]),
        .O(\outbuf[7]_i_2_n_0 ));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \outbuf_reg[0] 
       (.C(spiclk),
        .CE(1'b1),
        .CLR(csb),
        .D(\outbuf[0]_i_1_n_0 ),
        .Q(outbuf[0]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \outbuf_reg[1] 
       (.C(spiclk),
        .CE(1'b1),
        .CLR(csb),
        .D(\outbuf[1]_i_1_n_0 ),
        .Q(outbuf[1]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \outbuf_reg[2] 
       (.C(spiclk),
        .CE(1'b1),
        .CLR(csb),
        .D(\outbuf[2]_i_1_n_0 ),
        .Q(outbuf[2]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \outbuf_reg[3] 
       (.C(spiclk),
        .CE(1'b1),
        .CLR(csb),
        .D(\outbuf[3]_i_1_n_0 ),
        .Q(outbuf[3]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \outbuf_reg[4] 
       (.C(spiclk),
        .CE(1'b1),
        .CLR(csb),
        .D(\outbuf[4]_i_1_n_0 ),
        .Q(outbuf[4]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \outbuf_reg[5] 
       (.C(spiclk),
        .CE(1'b1),
        .CLR(csb),
        .D(\outbuf[5]_i_1_n_0 ),
        .Q(outbuf[5]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \outbuf_reg[6] 
       (.C(spiclk),
        .CE(1'b1),
        .CLR(csb),
        .D(\outbuf[6]_i_1_n_0 ),
        .Q(outbuf[6]));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    \outbuf_reg[7] 
       (.C(spiclk),
        .CE(1'b1),
        .CLR(csb),
        .D(\outbuf[7]_i_1_n_0 ),
        .Q(io1));
  LUT4 #(
    .INIT(16'hFFFE)) 
    romcode_EN_A_INST_0
       (.I0(romcode_EN_A_INST_0_i_1_n_0),
        .I1(bytecount_reg[6]),
        .I2(bytecount_reg[2]),
        .I3(romcode_EN_A_INST_0_i_2_n_0),
        .O(\bytecount_reg[6]_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    romcode_EN_A_INST_0_i_1
       (.I0(bytecount_reg[8]),
        .I1(bytecount_reg[7]),
        .I2(bytecount_reg[5]),
        .I3(bytecount_reg[3]),
        .I4(bytecount_reg[4]),
        .O(romcode_EN_A_INST_0_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    romcode_EN_A_INST_0_i_2
       (.I0(bytecount_reg[10]),
        .I1(bytecount_reg[11]),
        .I2(bytecount_reg[12]),
        .I3(bytecount_reg[9]),
        .O(romcode_EN_A_INST_0_i_2_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 spi_addr0_carry
       (.CI(1'b0),
        .CO({spi_addr0_carry_n_0,spi_addr0_carry_n_1,spi_addr0_carry_n_2,spi_addr0_carry_n_3}),
        .CYINIT(romcode_Addr_A[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(spi_addr0[4:1]),
        .S(romcode_Addr_A[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 spi_addr0_carry__0
       (.CI(spi_addr0_carry_n_0),
        .CO({spi_addr0_carry__0_n_0,spi_addr0_carry__0_n_1,spi_addr0_carry__0_n_2,spi_addr0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(spi_addr0[8:5]),
        .S(romcode_Addr_A[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 spi_addr0_carry__1
       (.CI(spi_addr0_carry__0_n_0),
        .CO({spi_addr0_carry__1_n_0,spi_addr0_carry__1_n_1,spi_addr0_carry__1_n_2,spi_addr0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(spi_addr0[12:9]),
        .S(romcode_Addr_A[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 spi_addr0_carry__2
       (.CI(spi_addr0_carry__1_n_0),
        .CO({spi_addr0_carry__2_n_0,spi_addr0_carry__2_n_1,spi_addr0_carry__2_n_2,spi_addr0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(spi_addr0[16:13]),
        .S(romcode_Addr_A[16:13]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 spi_addr0_carry__3
       (.CI(spi_addr0_carry__2_n_0),
        .CO({spi_addr0_carry__3_n_0,spi_addr0_carry__3_n_1,spi_addr0_carry__3_n_2,spi_addr0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(spi_addr0[20:17]),
        .S(romcode_Addr_A[20:17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 spi_addr0_carry__4
       (.CI(spi_addr0_carry__3_n_0),
        .CO({NLW_spi_addr0_carry__4_CO_UNCONNECTED[3:2],spi_addr0_carry__4_n_2,spi_addr0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_spi_addr0_carry__4_O_UNCONNECTED[3],spi_addr0[23:21]}),
        .S({1'b0,romcode_Addr_A[23:21]}));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h3A)) 
    \spi_addr[0]_i_1 
       (.I0(io0),
        .I1(romcode_Addr_A[0]),
        .I2(\spi_addr[23]_i_3_n_0 ),
        .O(p_1_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[10]_i_1 
       (.I0(spi_addr0[10]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(buffer_next[2]),
        .O(p_1_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[11]_i_1 
       (.I0(spi_addr0[11]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(buffer_next[3]),
        .O(p_1_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[12]_i_1 
       (.I0(spi_addr0[12]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(buffer_next[4]),
        .O(p_1_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[13]_i_1 
       (.I0(spi_addr0[13]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(buffer_next[5]),
        .O(p_1_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[14]_i_1 
       (.I0(spi_addr0[14]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(buffer_next[6]),
        .O(p_1_in[14]));
  LUT6 #(
    .INIT(64'hAAAAAAAA00000008)) 
    \spi_addr[15]_i_1 
       (.I0(\spi_addr[15]_i_3_n_0 ),
        .I1(\spi_addr[23]_i_5_n_0 ),
        .I2(bytecount_reg[0]),
        .I3(bytecount_reg[2]),
        .I4(\spi_addr[15]_i_4_n_0 ),
        .I5(\spi_addr[23]_i_3_n_0 ),
        .O(\spi_addr[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[15]_i_2 
       (.I0(spi_addr0[15]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(buffer_next[7]),
        .O(p_1_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \spi_addr[15]_i_3 
       (.I0(bitcount[0]),
        .I1(bitcount[1]),
        .I2(bitcount[2]),
        .I3(csb),
        .O(\spi_addr[15]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFEFFFF)) 
    \spi_addr[15]_i_4 
       (.I0(bytecount_reg[9]),
        .I1(bytecount_reg[12]),
        .I2(bytecount_reg[11]),
        .I3(bytecount_reg[10]),
        .I4(bytecount_reg[1]),
        .O(\spi_addr[15]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[16]_i_1 
       (.I0(spi_addr0[16]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(io0),
        .O(p_1_in[16]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[17]_i_1 
       (.I0(spi_addr0[17]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(buffer_next[1]),
        .O(p_1_in[17]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[18]_i_1 
       (.I0(spi_addr0[18]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(buffer_next[2]),
        .O(p_1_in[18]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[19]_i_1 
       (.I0(spi_addr0[19]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(buffer_next[3]),
        .O(p_1_in[19]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[1]_i_1 
       (.I0(spi_addr0[1]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(buffer_next[1]),
        .O(p_1_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[20]_i_1 
       (.I0(spi_addr0[20]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(buffer_next[4]),
        .O(p_1_in[20]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[21]_i_1 
       (.I0(spi_addr0[21]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(buffer_next[5]),
        .O(p_1_in[21]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[22]_i_1 
       (.I0(spi_addr0[22]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(buffer_next[6]),
        .O(p_1_in[22]));
  LUT6 #(
    .INIT(64'h4040444040404040)) 
    \spi_addr[23]_i_1 
       (.I0(csb),
        .I1(sel),
        .I2(\spi_addr[23]_i_3_n_0 ),
        .I3(bytecount_reg[0]),
        .I4(\spi_addr[23]_i_4_n_0 ),
        .I5(\spi_addr[23]_i_5_n_0 ),
        .O(\spi_addr[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[23]_i_2 
       (.I0(spi_addr0[23]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(buffer_next[7]),
        .O(p_1_in[23]));
  LUT6 #(
    .INIT(64'h000000000000FFFE)) 
    \spi_addr[23]_i_3 
       (.I0(romcode_EN_A_INST_0_i_2_n_0),
        .I1(bytecount_reg[2]),
        .I2(bytecount_reg[6]),
        .I3(romcode_EN_A_INST_0_i_1_n_0),
        .I4(\spi_addr[23]_i_6_n_0 ),
        .I5(\spi_addr[23]_i_7_n_0 ),
        .O(\spi_addr[23]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \spi_addr[23]_i_4 
       (.I0(bytecount_reg[9]),
        .I1(bytecount_reg[12]),
        .I2(bytecount_reg[11]),
        .I3(bytecount_reg[10]),
        .I4(bytecount_reg[2]),
        .I5(bytecount_reg[1]),
        .O(\spi_addr[23]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \spi_addr[23]_i_5 
       (.I0(bytecount_reg[6]),
        .I1(bytecount_reg[4]),
        .I2(bytecount_reg[3]),
        .I3(bytecount_reg[5]),
        .I4(bytecount_reg[7]),
        .I5(bytecount_reg[8]),
        .O(\spi_addr[23]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \spi_addr[23]_i_6 
       (.I0(\spi_cmd_reg_n_0_[6] ),
        .I1(\spi_cmd_reg_n_0_[5] ),
        .I2(\spi_cmd_reg_n_0_[0] ),
        .I3(\spi_cmd_reg_n_0_[2] ),
        .O(\spi_addr[23]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \spi_addr[23]_i_7 
       (.I0(\spi_cmd_reg_n_0_[7] ),
        .I1(\spi_cmd_reg_n_0_[4] ),
        .I2(\spi_cmd_reg_n_0_[1] ),
        .I3(\spi_cmd_reg_n_0_[3] ),
        .O(\spi_addr[23]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[2]_i_1 
       (.I0(spi_addr0[2]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(buffer_next[2]),
        .O(p_1_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[3]_i_1 
       (.I0(spi_addr0[3]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(buffer_next[3]),
        .O(p_1_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[4]_i_1 
       (.I0(spi_addr0[4]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(buffer_next[4]),
        .O(p_1_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[5]_i_1 
       (.I0(spi_addr0[5]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(buffer_next[5]),
        .O(p_1_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[6]_i_1 
       (.I0(spi_addr0[6]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(buffer_next[6]),
        .O(p_1_in[6]));
  LUT6 #(
    .INIT(64'hAAAAAAAA00000800)) 
    \spi_addr[7]_i_1 
       (.I0(\spi_addr[15]_i_3_n_0 ),
        .I1(\spi_addr[23]_i_5_n_0 ),
        .I2(bytecount_reg[2]),
        .I3(bytecount_reg[0]),
        .I4(\spi_addr[15]_i_4_n_0 ),
        .I5(\spi_addr[23]_i_3_n_0 ),
        .O(\spi_addr[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[7]_i_2 
       (.I0(spi_addr0[7]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(buffer_next[7]),
        .O(p_1_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[8]_i_1 
       (.I0(spi_addr0[8]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(io0),
        .O(p_1_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \spi_addr[9]_i_1 
       (.I0(spi_addr0[9]),
        .I1(\spi_addr[23]_i_3_n_0 ),
        .I2(buffer_next[1]),
        .O(p_1_in[9]));
  FDRE \spi_addr_reg[0] 
       (.C(spiclk),
        .CE(\spi_addr[7]_i_1_n_0 ),
        .D(p_1_in[0]),
        .Q(romcode_Addr_A[0]),
        .R(1'b0));
  FDRE \spi_addr_reg[10] 
       (.C(spiclk),
        .CE(\spi_addr[15]_i_1_n_0 ),
        .D(p_1_in[10]),
        .Q(romcode_Addr_A[10]),
        .R(1'b0));
  FDRE \spi_addr_reg[11] 
       (.C(spiclk),
        .CE(\spi_addr[15]_i_1_n_0 ),
        .D(p_1_in[11]),
        .Q(romcode_Addr_A[11]),
        .R(1'b0));
  FDRE \spi_addr_reg[12] 
       (.C(spiclk),
        .CE(\spi_addr[15]_i_1_n_0 ),
        .D(p_1_in[12]),
        .Q(romcode_Addr_A[12]),
        .R(1'b0));
  FDRE \spi_addr_reg[13] 
       (.C(spiclk),
        .CE(\spi_addr[15]_i_1_n_0 ),
        .D(p_1_in[13]),
        .Q(romcode_Addr_A[13]),
        .R(1'b0));
  FDRE \spi_addr_reg[14] 
       (.C(spiclk),
        .CE(\spi_addr[15]_i_1_n_0 ),
        .D(p_1_in[14]),
        .Q(romcode_Addr_A[14]),
        .R(1'b0));
  FDRE \spi_addr_reg[15] 
       (.C(spiclk),
        .CE(\spi_addr[15]_i_1_n_0 ),
        .D(p_1_in[15]),
        .Q(romcode_Addr_A[15]),
        .R(1'b0));
  FDRE \spi_addr_reg[16] 
       (.C(spiclk),
        .CE(\spi_addr[23]_i_1_n_0 ),
        .D(p_1_in[16]),
        .Q(romcode_Addr_A[16]),
        .R(1'b0));
  FDRE \spi_addr_reg[17] 
       (.C(spiclk),
        .CE(\spi_addr[23]_i_1_n_0 ),
        .D(p_1_in[17]),
        .Q(romcode_Addr_A[17]),
        .R(1'b0));
  FDRE \spi_addr_reg[18] 
       (.C(spiclk),
        .CE(\spi_addr[23]_i_1_n_0 ),
        .D(p_1_in[18]),
        .Q(romcode_Addr_A[18]),
        .R(1'b0));
  FDRE \spi_addr_reg[19] 
       (.C(spiclk),
        .CE(\spi_addr[23]_i_1_n_0 ),
        .D(p_1_in[19]),
        .Q(romcode_Addr_A[19]),
        .R(1'b0));
  FDRE \spi_addr_reg[1] 
       (.C(spiclk),
        .CE(\spi_addr[7]_i_1_n_0 ),
        .D(p_1_in[1]),
        .Q(romcode_Addr_A[1]),
        .R(1'b0));
  FDRE \spi_addr_reg[20] 
       (.C(spiclk),
        .CE(\spi_addr[23]_i_1_n_0 ),
        .D(p_1_in[20]),
        .Q(romcode_Addr_A[20]),
        .R(1'b0));
  FDRE \spi_addr_reg[21] 
       (.C(spiclk),
        .CE(\spi_addr[23]_i_1_n_0 ),
        .D(p_1_in[21]),
        .Q(romcode_Addr_A[21]),
        .R(1'b0));
  FDRE \spi_addr_reg[22] 
       (.C(spiclk),
        .CE(\spi_addr[23]_i_1_n_0 ),
        .D(p_1_in[22]),
        .Q(romcode_Addr_A[22]),
        .R(1'b0));
  FDRE \spi_addr_reg[23] 
       (.C(spiclk),
        .CE(\spi_addr[23]_i_1_n_0 ),
        .D(p_1_in[23]),
        .Q(romcode_Addr_A[23]),
        .R(1'b0));
  FDRE \spi_addr_reg[2] 
       (.C(spiclk),
        .CE(\spi_addr[7]_i_1_n_0 ),
        .D(p_1_in[2]),
        .Q(romcode_Addr_A[2]),
        .R(1'b0));
  FDRE \spi_addr_reg[3] 
       (.C(spiclk),
        .CE(\spi_addr[7]_i_1_n_0 ),
        .D(p_1_in[3]),
        .Q(romcode_Addr_A[3]),
        .R(1'b0));
  FDRE \spi_addr_reg[4] 
       (.C(spiclk),
        .CE(\spi_addr[7]_i_1_n_0 ),
        .D(p_1_in[4]),
        .Q(romcode_Addr_A[4]),
        .R(1'b0));
  FDRE \spi_addr_reg[5] 
       (.C(spiclk),
        .CE(\spi_addr[7]_i_1_n_0 ),
        .D(p_1_in[5]),
        .Q(romcode_Addr_A[5]),
        .R(1'b0));
  FDRE \spi_addr_reg[6] 
       (.C(spiclk),
        .CE(\spi_addr[7]_i_1_n_0 ),
        .D(p_1_in[6]),
        .Q(romcode_Addr_A[6]),
        .R(1'b0));
  FDRE \spi_addr_reg[7] 
       (.C(spiclk),
        .CE(\spi_addr[7]_i_1_n_0 ),
        .D(p_1_in[7]),
        .Q(romcode_Addr_A[7]),
        .R(1'b0));
  FDRE \spi_addr_reg[8] 
       (.C(spiclk),
        .CE(\spi_addr[15]_i_1_n_0 ),
        .D(p_1_in[8]),
        .Q(romcode_Addr_A[8]),
        .R(1'b0));
  FDRE \spi_addr_reg[9] 
       (.C(spiclk),
        .CE(\spi_addr[15]_i_1_n_0 ),
        .D(p_1_in[9]),
        .Q(romcode_Addr_A[9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00000008)) 
    \spi_cmd[7]_i_1 
       (.I0(\spi_addr[23]_i_5_n_0 ),
        .I1(sel),
        .I2(csb),
        .I3(bytecount_reg[0]),
        .I4(\spi_addr[23]_i_4_n_0 ),
        .O(\spi_cmd[7]_i_1_n_0 ));
  FDRE \spi_cmd_reg[0] 
       (.C(spiclk),
        .CE(\spi_cmd[7]_i_1_n_0 ),
        .D(io0),
        .Q(\spi_cmd_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \spi_cmd_reg[1] 
       (.C(spiclk),
        .CE(\spi_cmd[7]_i_1_n_0 ),
        .D(buffer_next[1]),
        .Q(\spi_cmd_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \spi_cmd_reg[2] 
       (.C(spiclk),
        .CE(\spi_cmd[7]_i_1_n_0 ),
        .D(buffer_next[2]),
        .Q(\spi_cmd_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \spi_cmd_reg[3] 
       (.C(spiclk),
        .CE(\spi_cmd[7]_i_1_n_0 ),
        .D(buffer_next[3]),
        .Q(\spi_cmd_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \spi_cmd_reg[4] 
       (.C(spiclk),
        .CE(\spi_cmd[7]_i_1_n_0 ),
        .D(buffer_next[4]),
        .Q(\spi_cmd_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \spi_cmd_reg[5] 
       (.C(spiclk),
        .CE(\spi_cmd[7]_i_1_n_0 ),
        .D(buffer_next[5]),
        .Q(\spi_cmd_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \spi_cmd_reg[6] 
       (.C(spiclk),
        .CE(\spi_cmd[7]_i_1_n_0 ),
        .D(buffer_next[6]),
        .Q(\spi_cmd_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \spi_cmd_reg[7] 
       (.C(spiclk),
        .CE(\spi_cmd[7]_i_1_n_0 ),
        .D(buffer_next[7]),
        .Q(\spi_cmd_reg_n_0_[7] ),
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
