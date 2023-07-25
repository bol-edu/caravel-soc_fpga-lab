// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Tue Jun  6 16:39:55 2023
// Host        : josh-All-Series running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_axi_uartlite_0_0_sim_netlist.v
// Design      : design_1_axi_uartlite_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_address_decoder
   (\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]_0 ,
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ,
    Bus_RNW_reg_reg_0,
    fifo_wr,
    reset_TX_FIFO,
    reset_RX_FIFO,
    D,
    \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 ,
    \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3]_0 ,
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 ,
    \INFERRED_GEN.cnt_i_reg[4] ,
    ip2bus_error,
    \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_1 ,
    bus2ip_rdce,
    \s_axi_wdata[4] ,
    \FSM_onehot_state_reg[3] ,
    \FSM_onehot_state_reg[2] ,
    s_axi_aresetn_0,
    Bus_RNW_reg_reg_1,
    \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]_1 ,
    Q,
    s_axi_aclk,
    tx_Buffer_Full,
    s_axi_wdata,
    s_axi_rvalid_i_reg,
    state1__2,
    s_axi_wvalid,
    s_axi_awvalid,
    s_axi_arvalid,
    \s_axi_rdata_i_reg[0] ,
    out,
    tx_Buffer_Empty_Pre_reg,
    s_axi_aresetn,
    rx_Buffer_Full,
    enable_interrupts,
    status_reg,
    s_axi_rready,
    s_axi_rvalid,
    s_axi_bready,
    s_axi_bvalid,
    bus2ip_rnw_i,
    \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_2 ,
    \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_3 );
  output \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]_0 ;
  output \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ;
  output Bus_RNW_reg_reg_0;
  output fifo_wr;
  output reset_TX_FIFO;
  output reset_RX_FIFO;
  output [2:0]D;
  output \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 ;
  output \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3]_0 ;
  output [7:0]\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 ;
  output \INFERRED_GEN.cnt_i_reg[4] ;
  output ip2bus_error;
  output [0:0]\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_1 ;
  output [0:0]bus2ip_rdce;
  output \s_axi_wdata[4] ;
  output \FSM_onehot_state_reg[3] ;
  output \FSM_onehot_state_reg[2] ;
  output s_axi_aresetn_0;
  output Bus_RNW_reg_reg_1;
  output \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]_1 ;
  input Q;
  input s_axi_aclk;
  input tx_Buffer_Full;
  input [2:0]s_axi_wdata;
  input [3:0]s_axi_rvalid_i_reg;
  input state1__2;
  input s_axi_wvalid;
  input s_axi_awvalid;
  input s_axi_arvalid;
  input [0:0]\s_axi_rdata_i_reg[0] ;
  input [7:0]out;
  input [0:0]tx_Buffer_Empty_Pre_reg;
  input s_axi_aresetn;
  input rx_Buffer_Full;
  input enable_interrupts;
  input [1:0]status_reg;
  input s_axi_rready;
  input s_axi_rvalid;
  input s_axi_bready;
  input s_axi_bvalid;
  input bus2ip_rnw_i;
  input \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_2 ;
  input \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_3 ;

  wire Bus_RNW_reg_i_1_n_0;
  wire Bus_RNW_reg_reg_0;
  wire Bus_RNW_reg_reg_1;
  wire [2:0]D;
  wire \FSM_onehot_state_reg[2] ;
  wire \FSM_onehot_state_reg[3] ;
  wire \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ;
  wire [7:0]\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 ;
  wire \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]_0 ;
  wire \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]_1 ;
  wire \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg ;
  wire \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 ;
  wire [0:0]\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_1 ;
  wire \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_2 ;
  wire \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_3 ;
  wire \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg ;
  wire \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3]_0 ;
  wire \INFERRED_GEN.cnt_i_reg[4] ;
  wire Q;
  wire [0:0]bus2ip_rdce;
  wire bus2ip_rnw_i;
  wire ce_expnd_i_0;
  wire ce_expnd_i_1;
  wire ce_expnd_i_2;
  wire ce_expnd_i_3;
  wire cs_ce_clr;
  wire enable_interrupts;
  wire fifo_wr;
  wire ip2bus_error;
  wire [7:0]out;
  wire reset_RX_FIFO;
  wire reset_TX_FIFO;
  wire rx_Buffer_Full;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire s_axi_aresetn_0;
  wire s_axi_arvalid;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [0:0]\s_axi_rdata_i_reg[0] ;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [3:0]s_axi_rvalid_i_reg;
  wire [2:0]s_axi_wdata;
  wire \s_axi_wdata[4] ;
  wire s_axi_wvalid;
  wire state1__2;
  wire [1:0]status_reg;
  wire [0:0]tx_Buffer_Empty_Pre_reg;
  wire tx_Buffer_Full;

  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    Bus_RNW_reg_i_1
       (.I0(bus2ip_rnw_i),
        .I1(Q),
        .I2(Bus_RNW_reg_reg_0),
        .O(Bus_RNW_reg_i_1_n_0));
  FDRE Bus_RNW_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Bus_RNW_reg_i_1_n_0),
        .Q(Bus_RNW_reg_reg_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFF88F888F888F8)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 ),
        .I1(s_axi_rvalid_i_reg[2]),
        .I2(s_axi_rvalid_i_reg[0]),
        .I3(state1__2),
        .I4(s_axi_rvalid_i_reg[3]),
        .I5(\GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3]_0 ),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h0800FFFF08000800)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(s_axi_wvalid),
        .I1(s_axi_awvalid),
        .I2(s_axi_arvalid),
        .I3(s_axi_rvalid_i_reg[1]),
        .I4(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 ),
        .I5(s_axi_rvalid_i_reg[2]),
        .O(D[1]));
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_state[3]_i_1 
       (.I0(s_axi_arvalid),
        .I1(s_axi_rvalid_i_reg[1]),
        .I2(\GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3]_0 ),
        .I3(s_axi_rvalid_i_reg[3]),
        .O(D[2]));
  FDRE \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_3),
        .Q(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \GEN_BKEND_CE_REGISTERS[1].ce_out_i[1]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_3 ),
        .I1(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_2 ),
        .O(ce_expnd_i_2));
  FDRE \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_2),
        .Q(\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]_0 ),
        .R(cs_ce_clr));
  FDRE \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_1),
        .Q(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg ),
        .R(cs_ce_clr));
  LUT5 #(
    .INIT(32'hFFFEFFFF)) 
    \GEN_BKEND_CE_REGISTERS[3].ce_out_i[3]_i_1 
       (.I0(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg ),
        .I1(\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]_0 ),
        .I2(\GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg ),
        .I3(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .I4(s_axi_aresetn),
        .O(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \GEN_BKEND_CE_REGISTERS[3].ce_out_i[3]_i_2 
       (.I0(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_2 ),
        .I1(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_3 ),
        .O(ce_expnd_i_0));
  FDRE \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(Q),
        .D(ce_expnd_i_0),
        .Q(\GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg ),
        .R(cs_ce_clr));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \INFERRED_GEN.cnt_i[3]_i_2 
       (.I0(Bus_RNW_reg_reg_0),
        .I1(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .I2(\s_axi_rdata_i_reg[0] ),
        .O(Bus_RNW_reg_reg_1));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \INFERRED_GEN.data_reg[15][7]_srl16_i_1 
       (.I0(Bus_RNW_reg_reg_0),
        .I1(\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]_0 ),
        .I2(tx_Buffer_Full),
        .O(fifo_wr));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pselect_f \MEM_DECODE_GEN[0].PER_CE_GEN[0].MULTIPLE_CES_THIS_CS_GEN.CE_I 
       (.\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] (\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_3 ),
        .\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 (\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_2 ),
        .ce_expnd_i_3(ce_expnd_i_3));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pselect_f__parameterized1 \MEM_DECODE_GEN[0].PER_CE_GEN[2].MULTIPLE_CES_THIS_CS_GEN.CE_I 
       (.\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2] (\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_2 ),
        .\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 (\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_3 ),
        .ce_expnd_i_1(ce_expnd_i_1));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    clr_Status_i_1
       (.I0(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg ),
        .I1(Bus_RNW_reg_reg_0),
        .O(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    enable_interrupts_i_1
       (.I0(s_axi_wdata[2]),
        .I1(\GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg ),
        .I2(Bus_RNW_reg_reg_0),
        .I3(enable_interrupts),
        .O(\s_axi_wdata[4] ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h40)) 
    reset_RX_FIFO_i_1
       (.I0(Bus_RNW_reg_reg_0),
        .I1(\GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg ),
        .I2(s_axi_wdata[1]),
        .O(reset_RX_FIFO));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h40)) 
    reset_TX_FIFO_i_1
       (.I0(Bus_RNW_reg_reg_0),
        .I1(\GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg ),
        .I2(s_axi_wdata[0]),
        .O(reset_TX_FIFO));
  LUT4 #(
    .INIT(16'h002A)) 
    rx_Data_Present_Pre_i_1
       (.I0(s_axi_aresetn),
        .I1(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .I2(Bus_RNW_reg_reg_0),
        .I3(\s_axi_rdata_i_reg[0] ),
        .O(s_axi_aresetn_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFF00FE00)) 
    s_axi_arready_INST_0
       (.I0(\GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg ),
        .I1(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .I2(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg ),
        .I3(Bus_RNW_reg_reg_0),
        .I4(\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]_0 ),
        .O(\GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_axi_bresp_i[1]_i_2 
       (.I0(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .I1(Bus_RNW_reg_reg_0),
        .O(bus2ip_rdce));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \s_axi_bresp_i[1]_i_3 
       (.I0(\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]_0 ),
        .I1(Bus_RNW_reg_reg_0),
        .O(\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]_1 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    s_axi_bvalid_i_i_1
       (.I0(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 ),
        .I1(s_axi_rvalid_i_reg[2]),
        .I2(s_axi_bready),
        .I3(s_axi_bvalid),
        .O(\FSM_onehot_state_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h70404040)) 
    \s_axi_rdata_i[0]_i_1 
       (.I0(\s_axi_rdata_i_reg[0] ),
        .I1(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg ),
        .I2(Bus_RNW_reg_reg_0),
        .I3(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .I4(out[0]),
        .O(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 [0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hB0808080)) 
    \s_axi_rdata_i[1]_i_1 
       (.I0(rx_Buffer_Full),
        .I1(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg ),
        .I2(Bus_RNW_reg_reg_0),
        .I3(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .I4(out[1]),
        .O(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 [1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hB0808080)) 
    \s_axi_rdata_i[2]_i_1 
       (.I0(tx_Buffer_Empty_Pre_reg),
        .I1(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg ),
        .I2(Bus_RNW_reg_reg_0),
        .I3(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .I4(out[2]),
        .O(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 [2]));
  LUT5 #(
    .INIT(32'hB0808080)) 
    \s_axi_rdata_i[3]_i_1 
       (.I0(tx_Buffer_Full),
        .I1(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg ),
        .I2(Bus_RNW_reg_reg_0),
        .I3(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .I4(out[3]),
        .O(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 [3]));
  LUT5 #(
    .INIT(32'hB0808080)) 
    \s_axi_rdata_i[4]_i_1 
       (.I0(enable_interrupts),
        .I1(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg ),
        .I2(Bus_RNW_reg_reg_0),
        .I3(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .I4(out[4]),
        .O(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 [4]));
  LUT5 #(
    .INIT(32'hB0808080)) 
    \s_axi_rdata_i[5]_i_1 
       (.I0(status_reg[0]),
        .I1(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg ),
        .I2(Bus_RNW_reg_reg_0),
        .I3(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .I4(out[5]),
        .O(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 [5]));
  LUT5 #(
    .INIT(32'hB0808080)) 
    \s_axi_rdata_i[6]_i_1 
       (.I0(status_reg[1]),
        .I1(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg ),
        .I2(Bus_RNW_reg_reg_0),
        .I3(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .I4(out[6]),
        .O(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 [6]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \s_axi_rdata_i[7]_i_1 
       (.I0(out[7]),
        .I1(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .I2(Bus_RNW_reg_reg_0),
        .I3(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg ),
        .O(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 [7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h8888F000)) 
    \s_axi_rresp_i[1]_i_1 
       (.I0(\s_axi_rdata_i_reg[0] ),
        .I1(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .I2(tx_Buffer_Full),
        .I3(\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]_0 ),
        .I4(Bus_RNW_reg_reg_0),
        .O(ip2bus_error));
  LUT4 #(
    .INIT(16'h8F88)) 
    s_axi_rvalid_i_i_1
       (.I0(\GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3]_0 ),
        .I1(s_axi_rvalid_i_reg[3]),
        .I2(s_axi_rready),
        .I3(s_axi_rvalid),
        .O(\FSM_onehot_state_reg[3] ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00FF00FE)) 
    s_axi_wready_INST_0
       (.I0(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg ),
        .I1(\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]_0 ),
        .I2(\GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg ),
        .I3(Bus_RNW_reg_reg_0),
        .I4(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .O(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 ));
  LUT4 #(
    .INIT(16'h8808)) 
    tx_Buffer_Empty_Pre_i_1
       (.I0(tx_Buffer_Empty_Pre_reg),
        .I1(s_axi_aresetn),
        .I2(\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]_0 ),
        .I3(Bus_RNW_reg_reg_0),
        .O(\INFERRED_GEN.cnt_i_reg[4] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_lite_ipif
   (\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ,
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ,
    s_axi_rresp,
    Bus_RNW_reg,
    s_axi_rvalid,
    s_axi_bvalid,
    fifo_wr,
    reset_TX_FIFO,
    reset_RX_FIFO,
    \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2] ,
    \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3] ,
    \INFERRED_GEN.cnt_i_reg[4] ,
    \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 ,
    \s_axi_wdata[4] ,
    s_axi_aresetn_0,
    Bus_RNW_reg_reg,
    s_axi_bresp,
    s_axi_rdata,
    bus2ip_reset,
    s_axi_aclk,
    tx_Buffer_Full,
    s_axi_wdata,
    s_axi_arvalid,
    s_axi_awvalid,
    s_axi_wvalid,
    Q,
    out,
    tx_Buffer_Empty_Pre_reg,
    s_axi_aresetn,
    rx_Buffer_Full,
    enable_interrupts,
    status_reg,
    s_axi_bready,
    s_axi_rready,
    s_axi_araddr,
    s_axi_awaddr);
  output \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ;
  output \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ;
  output [0:0]s_axi_rresp;
  output Bus_RNW_reg;
  output s_axi_rvalid;
  output s_axi_bvalid;
  output fifo_wr;
  output reset_TX_FIFO;
  output reset_RX_FIFO;
  output \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2] ;
  output \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3] ;
  output \INFERRED_GEN.cnt_i_reg[4] ;
  output [0:0]\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 ;
  output \s_axi_wdata[4] ;
  output s_axi_aresetn_0;
  output Bus_RNW_reg_reg;
  output [0:0]s_axi_bresp;
  output [7:0]s_axi_rdata;
  input bus2ip_reset;
  input s_axi_aclk;
  input tx_Buffer_Full;
  input [2:0]s_axi_wdata;
  input s_axi_arvalid;
  input s_axi_awvalid;
  input s_axi_wvalid;
  input [0:0]Q;
  input [7:0]out;
  input [0:0]tx_Buffer_Empty_Pre_reg;
  input s_axi_aresetn;
  input rx_Buffer_Full;
  input enable_interrupts;
  input [1:0]status_reg;
  input s_axi_bready;
  input s_axi_rready;
  input [1:0]s_axi_araddr;
  input [1:0]s_axi_awaddr;

  wire Bus_RNW_reg;
  wire Bus_RNW_reg_reg;
  wire \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ;
  wire \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ;
  wire \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2] ;
  wire [0:0]\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 ;
  wire \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3] ;
  wire \INFERRED_GEN.cnt_i_reg[4] ;
  wire [0:0]Q;
  wire bus2ip_reset;
  wire enable_interrupts;
  wire fifo_wr;
  wire [7:0]out;
  wire reset_RX_FIFO;
  wire reset_TX_FIFO;
  wire rx_Buffer_Full;
  wire s_axi_aclk;
  wire [1:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_aresetn_0;
  wire s_axi_arvalid;
  wire [1:0]s_axi_awaddr;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [0:0]s_axi_bresp;
  wire s_axi_bvalid;
  wire [7:0]s_axi_rdata;
  wire s_axi_rready;
  wire [0:0]s_axi_rresp;
  wire s_axi_rvalid;
  wire [2:0]s_axi_wdata;
  wire \s_axi_wdata[4] ;
  wire s_axi_wvalid;
  wire [1:0]status_reg;
  wire [0:0]tx_Buffer_Empty_Pre_reg;
  wire tx_Buffer_Full;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_slave_attachment I_SLAVE_ATTACHMENT
       (.Bus_RNW_reg_reg(Bus_RNW_reg),
        .Bus_RNW_reg_reg_0(Bus_RNW_reg_reg),
        .\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] (\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ),
        .\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1] (\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ),
        .\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2] (\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2] ),
        .\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 (\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 ),
        .\GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3] (\GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3] ),
        .\INFERRED_GEN.cnt_i_reg[4] (\INFERRED_GEN.cnt_i_reg[4] ),
        .Q(Q),
        .bus2ip_reset(bus2ip_reset),
        .enable_interrupts(enable_interrupts),
        .fifo_wr(fifo_wr),
        .out(out),
        .reset_RX_FIFO(reset_RX_FIFO),
        .reset_TX_FIFO(reset_TX_FIFO),
        .rx_Buffer_Full(rx_Buffer_Full),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_aresetn_0(s_axi_aresetn_0),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .\s_axi_wdata[4] (\s_axi_wdata[4] ),
        .s_axi_wvalid(s_axi_wvalid),
        .status_reg(status_reg),
        .tx_Buffer_Empty_Pre_reg(tx_Buffer_Empty_Pre_reg),
        .tx_Buffer_Full(tx_Buffer_Full));
endmodule

(* C_BAUDRATE = "9600" *) (* C_DATA_BITS = "8" *) (* C_FAMILY = "zynq" *) 
(* C_ODD_PARITY = "0" *) (* C_S_AXI_ACLK_FREQ_HZ = "10000000" *) (* C_S_AXI_ADDR_WIDTH = "4" *) 
(* C_S_AXI_DATA_WIDTH = "32" *) (* C_USE_PARITY = "0" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_uartlite
   (s_axi_aclk,
    s_axi_aresetn,
    interrupt,
    s_axi_awaddr,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_rready,
    rx,
    tx);
  input s_axi_aclk;
  input s_axi_aresetn;
  output interrupt;
  input [3:0]s_axi_awaddr;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_araddr;
  input s_axi_arvalid;
  output s_axi_arready;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rvalid;
  input s_axi_rready;
  input rx;
  output tx;

  wire \<const0> ;
  wire AXI_LITE_IPIF_I_n_11;
  wire AXI_LITE_IPIF_I_n_13;
  wire AXI_LITE_IPIF_I_n_14;
  wire AXI_LITE_IPIF_I_n_15;
  wire \I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg ;
  wire \I_SLAVE_ATTACHMENT/I_DECODER/GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ;
  wire \I_SLAVE_ATTACHMENT/I_DECODER/GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ;
  wire \UARTLITE_RX_I/rx_Data_Empty ;
  wire \UARTLITE_TX_I/fifo_wr ;
  wire [1:1]bus2ip_rdce;
  wire bus2ip_reset;
  wire enable_interrupts;
  wire interrupt;
  wire reset_RX_FIFO;
  wire reset_TX_FIFO;
  wire rx;
  wire rx_Buffer_Full;
  wire [0:7]rx_Data;
  wire s_axi_aclk;
  wire [3:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [3:0]s_axi_awaddr;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:1]\^s_axi_bresp ;
  wire s_axi_bvalid;
  wire [7:0]\^s_axi_rdata ;
  wire s_axi_rready;
  wire [1:1]\^s_axi_rresp ;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire s_axi_wvalid;
  wire [1:2]status_reg;
  wire tx;
  wire tx_Buffer_Empty;
  wire tx_Buffer_Full;

  assign s_axi_awready = s_axi_wready;
  assign s_axi_bresp[1] = \^s_axi_bresp [1];
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7:0] = \^s_axi_rdata [7:0];
  assign s_axi_rresp[1] = \^s_axi_rresp [1];
  assign s_axi_rresp[0] = \<const0> ;
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_lite_ipif AXI_LITE_IPIF_I
       (.Bus_RNW_reg(\I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg ),
        .Bus_RNW_reg_reg(AXI_LITE_IPIF_I_n_15),
        .\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg (\I_SLAVE_ATTACHMENT/I_DECODER/GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ),
        .\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg (\I_SLAVE_ATTACHMENT/I_DECODER/GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ),
        .\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2] (s_axi_wready),
        .\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 (bus2ip_rdce),
        .\GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3] (s_axi_arready),
        .\INFERRED_GEN.cnt_i_reg[4] (AXI_LITE_IPIF_I_n_11),
        .Q(\UARTLITE_RX_I/rx_Data_Empty ),
        .bus2ip_reset(bus2ip_reset),
        .enable_interrupts(enable_interrupts),
        .fifo_wr(\UARTLITE_TX_I/fifo_wr ),
        .out({rx_Data[0],rx_Data[1],rx_Data[2],rx_Data[3],rx_Data[4],rx_Data[5],rx_Data[6],rx_Data[7]}),
        .reset_RX_FIFO(reset_RX_FIFO),
        .reset_TX_FIFO(reset_TX_FIFO),
        .rx_Buffer_Full(rx_Buffer_Full),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr[3:2]),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_aresetn_0(AXI_LITE_IPIF_I_n_14),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr[3:2]),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(\^s_axi_bresp ),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(\^s_axi_rdata ),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(\^s_axi_rresp ),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata({s_axi_wdata[4],s_axi_wdata[1:0]}),
        .\s_axi_wdata[4] (AXI_LITE_IPIF_I_n_13),
        .s_axi_wvalid(s_axi_wvalid),
        .status_reg({status_reg[1],status_reg[2]}),
        .tx_Buffer_Empty_Pre_reg(tx_Buffer_Empty),
        .tx_Buffer_Full(tx_Buffer_Full));
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_uartlite_core UARTLITE_CORE_I
       (.Bus_RNW_reg(\I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg ),
        .FIFO_Full_reg(AXI_LITE_IPIF_I_n_15),
        .\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg (\I_SLAVE_ATTACHMENT/I_DECODER/GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ),
        .\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg (\I_SLAVE_ATTACHMENT/I_DECODER/GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ),
        .\INFERRED_GEN.cnt_i_reg[4] (\UARTLITE_RX_I/rx_Data_Empty ),
        .Q(tx_Buffer_Empty),
        .bus2ip_reset(bus2ip_reset),
        .clr_Status_reg_0(bus2ip_rdce),
        .enable_interrupts(enable_interrupts),
        .enable_interrupts_reg_0(AXI_LITE_IPIF_I_n_13),
        .fifo_wr(\UARTLITE_TX_I/fifo_wr ),
        .interrupt(interrupt),
        .out({rx_Data[0],rx_Data[1],rx_Data[2],rx_Data[3],rx_Data[4],rx_Data[5],rx_Data[6],rx_Data[7]}),
        .reset_RX_FIFO(reset_RX_FIFO),
        .reset_TX_FIFO(reset_TX_FIFO),
        .rx(rx),
        .rx_Buffer_Full(rx_Buffer_Full),
        .rx_Data_Present_Pre_reg_0(AXI_LITE_IPIF_I_n_14),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_wdata(s_axi_wdata[7:0]),
        .status_reg({status_reg[1],status_reg[2]}),
        .tx(tx),
        .tx_Buffer_Empty_Pre_reg_0(AXI_LITE_IPIF_I_n_11),
        .tx_Buffer_Full(tx_Buffer_Full));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_baudrate
   (en_16x_Baud,
    EN_16x_Baud_reg_0,
    s_axi_aclk);
  output en_16x_Baud;
  input EN_16x_Baud_reg_0;
  input s_axi_aclk;

  wire EN_16x_Baud;
  wire EN_16x_Baud_reg_0;
  wire [6:0]count;
  wire \count[2]_i_2_n_0 ;
  wire \count[6]_i_2_n_0 ;
  wire [6:0]count_0;
  wire en_16x_Baud;
  wire s_axi_aclk;

  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    EN_16x_Baud_i_1
       (.I0(count[5]),
        .I1(count[6]),
        .I2(count[3]),
        .I3(count[4]),
        .I4(\count[6]_i_2_n_0 ),
        .O(EN_16x_Baud));
  FDRE EN_16x_Baud_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(EN_16x_Baud),
        .Q(en_16x_Baud),
        .R(EN_16x_Baud_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h3332)) 
    \count[0]_i_1 
       (.I0(count[1]),
        .I1(count[0]),
        .I2(\count[2]_i_2_n_0 ),
        .I3(count[2]),
        .O(count_0[0]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h9998)) 
    \count[1]_i_1 
       (.I0(count[0]),
        .I1(count[1]),
        .I2(\count[2]_i_2_n_0 ),
        .I3(count[2]),
        .O(count_0[1]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hE1E0)) 
    \count[2]_i_1 
       (.I0(count[1]),
        .I1(count[0]),
        .I2(count[2]),
        .I3(\count[2]_i_2_n_0 ),
        .O(count_0[2]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \count[2]_i_2 
       (.I0(count[4]),
        .I1(count[3]),
        .I2(count[6]),
        .I3(count[5]),
        .O(\count[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'hFF0000FE)) 
    \count[3]_i_1 
       (.I0(count[6]),
        .I1(count[5]),
        .I2(count[4]),
        .I3(count[3]),
        .I4(\count[6]_i_2_n_0 ),
        .O(count_0[3]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'hA9A9A9A8)) 
    \count[4]_i_1 
       (.I0(count[4]),
        .I1(count[3]),
        .I2(\count[6]_i_2_n_0 ),
        .I3(count[5]),
        .I4(count[6]),
        .O(count_0[4]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hFE01FE00)) 
    \count[5]_i_1 
       (.I0(\count[6]_i_2_n_0 ),
        .I1(count[3]),
        .I2(count[4]),
        .I3(count[5]),
        .I4(count[6]),
        .O(count_0[5]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'hFF00FE01)) 
    \count[6]_i_1 
       (.I0(\count[6]_i_2_n_0 ),
        .I1(count[4]),
        .I2(count[3]),
        .I3(count[6]),
        .I4(count[5]),
        .O(count_0[6]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \count[6]_i_2 
       (.I0(count[1]),
        .I1(count[0]),
        .I2(count[2]),
        .O(\count[6]_i_2_n_0 ));
  FDRE \count_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(count_0[0]),
        .Q(count[0]),
        .R(EN_16x_Baud_reg_0));
  FDRE \count_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(count_0[1]),
        .Q(count[1]),
        .R(EN_16x_Baud_reg_0));
  FDRE \count_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(count_0[2]),
        .Q(count[2]),
        .R(EN_16x_Baud_reg_0));
  FDRE \count_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(count_0[3]),
        .Q(count[3]),
        .R(EN_16x_Baud_reg_0));
  FDRE \count_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(count_0[4]),
        .Q(count[4]),
        .R(EN_16x_Baud_reg_0));
  FDRE \count_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(count_0[5]),
        .Q(count[5]),
        .R(EN_16x_Baud_reg_0));
  FDRE \count_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(count_0[6]),
        .Q(count[6]),
        .R(EN_16x_Baud_reg_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync
   (\status_reg_reg[1] ,
    scndry_out,
    fifo_Write0,
    EN_16x_Baud_reg,
    stop_Bit_Position_reg,
    status_reg,
    s_axi_aresetn,
    clr_Status,
    frame_err_ocrd_reg,
    sample_Point,
    en_16x_Baud,
    frame_err_ocrd,
    start_Edge_Detected,
    in,
    rx,
    s_axi_aclk);
  output \status_reg_reg[1] ;
  output scndry_out;
  output fifo_Write0;
  output EN_16x_Baud_reg;
  output stop_Bit_Position_reg;
  input [0:0]status_reg;
  input s_axi_aresetn;
  input clr_Status;
  input frame_err_ocrd_reg;
  input sample_Point;
  input en_16x_Baud;
  input frame_err_ocrd;
  input start_Edge_Detected;
  input [0:0]in;
  input rx;
  input s_axi_aclk;

  wire EN_16x_Baud_reg;
  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2 ;
  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3 ;
  wire Q;
  wire clr_Status;
  wire en_16x_Baud;
  wire fifo_Write0;
  wire frame_err_ocrd;
  wire frame_err_ocrd_reg;
  wire [0:0]in;
  wire rx;
  wire rx_Frame_Error;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire sample_Point;
  wire scndry_out;
  wire start_Edge_Detected;
  wire [0:0]status_reg;
  wire \status_reg_reg[1] ;
  wire stop_Bit_Position_reg;

  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rx),
        .Q(Q),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Q),
        .Q(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2 ),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2 ),
        .Q(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3 ),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3 ),
        .Q(scndry_out),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFBFFFFFF4000)) 
    \SERIAL_TO_PARALLEL[1].fifo_din[1]_i_1 
       (.I0(frame_err_ocrd_reg),
        .I1(sample_Point),
        .I2(scndry_out),
        .I3(en_16x_Baud),
        .I4(start_Edge_Detected),
        .I5(in),
        .O(stop_Bit_Position_reg));
  LUT4 #(
    .INIT(16'h8000)) 
    fifo_Write_i_1
       (.I0(frame_err_ocrd_reg),
        .I1(sample_Point),
        .I2(scndry_out),
        .I3(en_16x_Baud),
        .O(fifo_Write0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h00FF0080)) 
    frame_err_ocrd_i_1
       (.I0(en_16x_Baud),
        .I1(sample_Point),
        .I2(frame_err_ocrd_reg),
        .I3(scndry_out),
        .I4(frame_err_ocrd),
        .O(EN_16x_Baud_reg));
  LUT4 #(
    .INIT(16'h00E0)) 
    \status_reg[1]_i_1 
       (.I0(status_reg),
        .I1(rx_Frame_Error),
        .I2(s_axi_aresetn),
        .I3(clr_Status),
        .O(\status_reg_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \status_reg[1]_i_2 
       (.I0(frame_err_ocrd_reg),
        .I1(sample_Point),
        .I2(scndry_out),
        .I3(en_16x_Baud),
        .O(rx_Frame_Error));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cntr_incr_decr_addn_f
   (fifo_full_p1,
    Q,
    Interrupt0,
    tx_Data_Enable_reg,
    SS,
    fifo_Read,
    \INFERRED_GEN.cnt_i_reg[0]_0 ,
    \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ,
    Bus_RNW_reg,
    fifo_wr,
    enable_interrupts,
    tx_Buffer_Empty_Pre,
    Interrupt_reg,
    rx_Data_Present_Pre,
    tx_Start_reg,
    tx_Start,
    tx_DataBits,
    \INFERRED_GEN.cnt_i_reg[0]_1 ,
    s_axi_aresetn,
    s_axi_aclk);
  output fifo_full_p1;
  output [4:0]Q;
  output Interrupt0;
  output tx_Data_Enable_reg;
  output [0:0]SS;
  input fifo_Read;
  input \INFERRED_GEN.cnt_i_reg[0]_0 ;
  input \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ;
  input Bus_RNW_reg;
  input fifo_wr;
  input enable_interrupts;
  input tx_Buffer_Empty_Pre;
  input [0:0]Interrupt_reg;
  input rx_Data_Present_Pre;
  input tx_Start_reg;
  input tx_Start;
  input tx_DataBits;
  input \INFERRED_GEN.cnt_i_reg[0]_1 ;
  input s_axi_aresetn;
  input s_axi_aclk;

  wire Bus_RNW_reg;
  wire FIFO_Full_i_2_n_0;
  wire FIFO_Full_i_3_n_0;
  wire \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ;
  wire \INFERRED_GEN.cnt_i[3]_i_2__0_n_0 ;
  wire \INFERRED_GEN.cnt_i[4]_i_3_n_0 ;
  wire \INFERRED_GEN.cnt_i_reg[0]_0 ;
  wire \INFERRED_GEN.cnt_i_reg[0]_1 ;
  wire Interrupt0;
  wire [0:0]Interrupt_reg;
  wire [4:0]Q;
  wire [0:0]SS;
  wire [4:0]addr_i_p1;
  wire enable_interrupts;
  wire fifo_Read;
  wire fifo_full_p1;
  wire fifo_wr;
  wire rx_Data_Present_Pre;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire tx_Buffer_Empty_Pre;
  wire tx_DataBits;
  wire tx_Data_Enable_reg;
  wire tx_Start;
  wire tx_Start_reg;

  LUT6 #(
    .INIT(64'h0040000400000040)) 
    FIFO_Full_i_1
       (.I0(FIFO_Full_i_2_n_0),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[4]),
        .I4(fifo_Read),
        .I5(FIFO_Full_i_3_n_0),
        .O(fifo_full_p1));
  LUT6 #(
    .INIT(64'hEEEEE7EE77777D77)) 
    FIFO_Full_i_2
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(\INFERRED_GEN.cnt_i_reg[0]_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ),
        .I4(Bus_RNW_reg),
        .I5(\INFERRED_GEN.cnt_i[3]_i_2__0_n_0 ),
        .O(FIFO_Full_i_2_n_0));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8EAA8A8)) 
    FIFO_Full_i_3
       (.I0(\INFERRED_GEN.cnt_i[3]_i_2__0_n_0 ),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Bus_RNW_reg),
        .I4(\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ),
        .I5(\INFERRED_GEN.cnt_i_reg[0]_0 ),
        .O(FIFO_Full_i_3_n_0));
  LUT6 #(
    .INIT(64'hBBBBB4BB44444B44)) 
    \INFERRED_GEN.cnt_i[0]_i_1 
       (.I0(Q[4]),
        .I1(fifo_Read),
        .I2(Bus_RNW_reg),
        .I3(\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ),
        .I4(\INFERRED_GEN.cnt_i_reg[0]_0 ),
        .I5(Q[0]),
        .O(addr_i_p1[0]));
  LUT6 #(
    .INIT(64'hAABAFFDF55450020)) 
    \INFERRED_GEN.cnt_i[1]_i_1 
       (.I0(Q[0]),
        .I1(Bus_RNW_reg),
        .I2(\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ),
        .I3(\INFERRED_GEN.cnt_i_reg[0]_0 ),
        .I4(\INFERRED_GEN.cnt_i[3]_i_2__0_n_0 ),
        .I5(Q[1]),
        .O(addr_i_p1[1]));
  LUT6 #(
    .INIT(64'h7F7FFE7F80800180)) 
    \INFERRED_GEN.cnt_i[2]_i_1 
       (.I0(fifo_wr),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(fifo_Read),
        .I4(Q[4]),
        .I5(Q[2]),
        .O(addr_i_p1[2]));
  LUT6 #(
    .INIT(64'hFFFE7FFF00018000)) 
    \INFERRED_GEN.cnt_i[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(fifo_wr),
        .I3(Q[2]),
        .I4(\INFERRED_GEN.cnt_i[3]_i_2__0_n_0 ),
        .I5(Q[3]),
        .O(addr_i_p1[3]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \INFERRED_GEN.cnt_i[3]_i_2__0 
       (.I0(fifo_Read),
        .I1(Q[4]),
        .O(\INFERRED_GEN.cnt_i[3]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \INFERRED_GEN.cnt_i[4]_i_1 
       (.I0(\INFERRED_GEN.cnt_i_reg[0]_1 ),
        .I1(s_axi_aresetn),
        .O(SS));
  LUT6 #(
    .INIT(64'h7FFF7FFF00018000)) 
    \INFERRED_GEN.cnt_i[4]_i_2 
       (.I0(Q[2]),
        .I1(\INFERRED_GEN.cnt_i[4]_i_3_n_0 ),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(fifo_Read),
        .I5(Q[4]),
        .O(addr_i_p1[4]));
  LUT6 #(
    .INIT(64'h0400FF0404000400)) 
    \INFERRED_GEN.cnt_i[4]_i_3 
       (.I0(\INFERRED_GEN.cnt_i_reg[0]_0 ),
        .I1(\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ),
        .I2(Bus_RNW_reg),
        .I3(Q[0]),
        .I4(Q[4]),
        .I5(fifo_Read),
        .O(\INFERRED_GEN.cnt_i[4]_i_3_n_0 ));
  FDSE \INFERRED_GEN.cnt_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(addr_i_p1[0]),
        .Q(Q[0]),
        .S(SS));
  FDSE \INFERRED_GEN.cnt_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(addr_i_p1[1]),
        .Q(Q[1]),
        .S(SS));
  FDSE \INFERRED_GEN.cnt_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(addr_i_p1[2]),
        .Q(Q[2]),
        .S(SS));
  FDSE \INFERRED_GEN.cnt_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(addr_i_p1[3]),
        .Q(Q[3]),
        .S(SS));
  FDSE \INFERRED_GEN.cnt_i_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(addr_i_p1[4]),
        .Q(Q[4]),
        .S(SS));
  LUT5 #(
    .INIT(32'h080808AA)) 
    Interrupt_i_2
       (.I0(enable_interrupts),
        .I1(Q[4]),
        .I2(tx_Buffer_Empty_Pre),
        .I3(Interrupt_reg),
        .I4(rx_Data_Present_Pre),
        .O(Interrupt0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h00F2)) 
    tx_Start_i_1
       (.I0(tx_Start_reg),
        .I1(Q[4]),
        .I2(tx_Start),
        .I3(tx_DataBits),
        .O(tx_Data_Enable_reg));
endmodule

(* ORIG_REF_NAME = "cntr_incr_decr_addn_f" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cntr_incr_decr_addn_f_2
   (fifo_full_p1,
    Q,
    SS,
    FIFO_Full_reg,
    \INFERRED_GEN.cnt_i_reg[0]_0 ,
    fifo_Write,
    valid_rx,
    Bus_RNW_reg,
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ,
    fifo_wr,
    \INFERRED_GEN.cnt_i_reg[0]_1 ,
    s_axi_aresetn,
    s_axi_aclk);
  output fifo_full_p1;
  output [4:0]Q;
  output [0:0]SS;
  input FIFO_Full_reg;
  input \INFERRED_GEN.cnt_i_reg[0]_0 ;
  input fifo_Write;
  input valid_rx;
  input Bus_RNW_reg;
  input \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ;
  input fifo_wr;
  input \INFERRED_GEN.cnt_i_reg[0]_1 ;
  input s_axi_aresetn;
  input s_axi_aclk;

  wire Bus_RNW_reg;
  wire FIFO_Full_i_2__0_n_0;
  wire FIFO_Full_reg;
  wire \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ;
  wire \INFERRED_GEN.cnt_i[4]_i_3__0_n_0 ;
  wire \INFERRED_GEN.cnt_i_reg[0]_0 ;
  wire \INFERRED_GEN.cnt_i_reg[0]_1 ;
  wire [4:0]Q;
  wire [0:0]SS;
  wire [4:0]addr_i_p1;
  wire fifo_Write;
  wire fifo_full_p1;
  wire fifo_wr;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire valid_rx;

  LUT6 #(
    .INIT(64'h1000001000021000)) 
    FIFO_Full_i_1__0
       (.I0(Q[4]),
        .I1(FIFO_Full_i_2__0_n_0),
        .I2(Q[3]),
        .I3(Q[2]),
        .I4(FIFO_Full_reg),
        .I5(\INFERRED_GEN.cnt_i[4]_i_3__0_n_0 ),
        .O(fifo_full_p1));
  LUT6 #(
    .INIT(64'hE7EEEEEE7D777777)) 
    FIFO_Full_i_2__0
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(\INFERRED_GEN.cnt_i_reg[0]_0 ),
        .I3(fifo_Write),
        .I4(valid_rx),
        .I5(FIFO_Full_reg),
        .O(FIFO_Full_i_2__0_n_0));
  LUT5 #(
    .INIT(32'h5595AA6A)) 
    \INFERRED_GEN.cnt_i[0]_i_1__0 
       (.I0(FIFO_Full_reg),
        .I1(valid_rx),
        .I2(fifo_Write),
        .I3(\INFERRED_GEN.cnt_i_reg[0]_0 ),
        .I4(Q[0]),
        .O(addr_i_p1[0]));
  LUT6 #(
    .INIT(64'hAAEAFF7F55150080)) 
    \INFERRED_GEN.cnt_i[1]_i_1__0 
       (.I0(Q[0]),
        .I1(valid_rx),
        .I2(fifo_Write),
        .I3(\INFERRED_GEN.cnt_i_reg[0]_0 ),
        .I4(FIFO_Full_reg),
        .I5(Q[1]),
        .O(addr_i_p1[1]));
  LUT5 #(
    .INIT(32'hFE7F0180)) 
    \INFERRED_GEN.cnt_i[2]_i_1__0 
       (.I0(fifo_wr),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(FIFO_Full_reg),
        .I4(Q[2]),
        .O(addr_i_p1[2]));
  LUT6 #(
    .INIT(64'hFFFE7FFF00018000)) 
    \INFERRED_GEN.cnt_i[3]_i_1__0 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(fifo_wr),
        .I3(Q[2]),
        .I4(FIFO_Full_reg),
        .I5(Q[3]),
        .O(addr_i_p1[3]));
  LUT2 #(
    .INIT(4'hB)) 
    \INFERRED_GEN.cnt_i[4]_i_1__0 
       (.I0(\INFERRED_GEN.cnt_i_reg[0]_1 ),
        .I1(s_axi_aresetn),
        .O(SS));
  LUT6 #(
    .INIT(64'h7F7F7F7F01808080)) 
    \INFERRED_GEN.cnt_i[4]_i_2__0 
       (.I0(Q[2]),
        .I1(\INFERRED_GEN.cnt_i[4]_i_3__0_n_0 ),
        .I2(Q[3]),
        .I3(Bus_RNW_reg),
        .I4(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ),
        .I5(Q[4]),
        .O(addr_i_p1[4]));
  LUT6 #(
    .INIT(64'hA8A8A8A8EAA8A8A8)) 
    \INFERRED_GEN.cnt_i[4]_i_3__0 
       (.I0(FIFO_Full_reg),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(valid_rx),
        .I4(fifo_Write),
        .I5(\INFERRED_GEN.cnt_i_reg[0]_0 ),
        .O(\INFERRED_GEN.cnt_i[4]_i_3__0_n_0 ));
  FDSE \INFERRED_GEN.cnt_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(addr_i_p1[0]),
        .Q(Q[0]),
        .S(SS));
  FDSE \INFERRED_GEN.cnt_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(addr_i_p1[1]),
        .Q(Q[1]),
        .S(SS));
  FDSE \INFERRED_GEN.cnt_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(addr_i_p1[2]),
        .Q(Q[2]),
        .S(SS));
  FDSE \INFERRED_GEN.cnt_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(addr_i_p1[3]),
        .Q(Q[3]),
        .S(SS));
  FDSE \INFERRED_GEN.cnt_i_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(addr_i_p1[4]),
        .Q(Q[4]),
        .S(SS));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_axi_uartlite_0_0,axi_uartlite,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "axi_uartlite,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (s_axi_aclk,
    s_axi_aresetn,
    interrupt,
    s_axi_awaddr,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_rready,
    rx,
    tx);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 ACLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME ACLK, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input s_axi_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 ARESETN RST" *) (* x_interface_parameter = "XIL_INTERFACENAME ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_axi_aresetn;
  (* x_interface_info = "xilinx.com:signal:interrupt:1.0 INTERRUPT INTERRUPT" *) (* x_interface_parameter = "XIL_INTERFACENAME INTERRUPT, SENSITIVITY EDGE_RISING, PORTWIDTH 1" *) output interrupt;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 10000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [3:0]s_axi_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input s_axi_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output s_axi_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [31:0]s_axi_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [3:0]s_axi_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input s_axi_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output s_axi_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]s_axi_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output s_axi_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input s_axi_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [3:0]s_axi_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input s_axi_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output s_axi_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [31:0]s_axi_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]s_axi_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output s_axi_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) input s_axi_rready;
  (* x_interface_info = "xilinx.com:interface:uart:1.0 UART RxD" *) (* x_interface_parameter = "XIL_INTERFACENAME UART, BOARD.ASSOCIATED_PARAM UARTLITE_BOARD_INTERFACE" *) input rx;
  (* x_interface_info = "xilinx.com:interface:uart:1.0 UART TxD" *) output tx;

  wire \<const0> ;
  wire interrupt;
  wire rx;
  wire s_axi_aclk;
  wire [3:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [3:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:1]\^s_axi_bresp ;
  wire s_axi_bvalid;
  wire [7:0]\^s_axi_rdata ;
  wire s_axi_rready;
  wire [1:1]\^s_axi_rresp ;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire s_axi_wvalid;
  wire tx;
  wire [0:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [31:8]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  assign s_axi_bresp[1] = \^s_axi_bresp [1];
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7:0] = \^s_axi_rdata [7:0];
  assign s_axi_rresp[1] = \^s_axi_rresp [1];
  assign s_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_BAUDRATE = "9600" *) 
  (* C_DATA_BITS = "8" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_ODD_PARITY = "0" *) 
  (* C_S_AXI_ACLK_FREQ_HZ = "10000000" *) 
  (* C_S_AXI_ADDR_WIDTH = "4" *) 
  (* C_S_AXI_DATA_WIDTH = "32" *) 
  (* C_USE_PARITY = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_uartlite U0
       (.interrupt(interrupt),
        .rx(rx),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr({s_axi_araddr[3:2],1'b0,1'b0}),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr({s_axi_awaddr[3:2],1'b0,1'b0}),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp({\^s_axi_bresp ,NLW_U0_s_axi_bresp_UNCONNECTED[0]}),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata({NLW_U0_s_axi_rdata_UNCONNECTED[31:8],\^s_axi_rdata }),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp({\^s_axi_rresp ,NLW_U0_s_axi_rresp_UNCONNECTED[0]}),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s_axi_wdata[7:0]}),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(s_axi_wvalid),
        .tx(tx));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_f
   (mux_Out,
    serial_Data_reg,
    p_5_in,
    serial_Data_reg_0,
    fifo_wr,
    s_axi_wdata,
    Q,
    s_axi_aclk);
  output mux_Out;
  input serial_Data_reg;
  input p_5_in;
  input serial_Data_reg_0;
  input fifo_wr;
  input [7:0]s_axi_wdata;
  input [3:0]Q;
  input s_axi_aclk;

  wire [3:0]Q;
  wire [0:7]fifo_DOut;
  wire fifo_wr;
  wire mux_0123;
  wire mux_4567;
  wire mux_Out;
  wire p_5_in;
  wire s_axi_aclk;
  wire [7:0]s_axi_wdata;
  wire serial_Data_reg;
  wire serial_Data_reg_0;

  (* srl_bus_name = "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] " *) 
  (* srl_name = "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][0]_srl16 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \INFERRED_GEN.data_reg[15][0]_srl16 
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .CE(fifo_wr),
        .CLK(s_axi_aclk),
        .D(s_axi_wdata[7]),
        .Q(fifo_DOut[0]));
  (* srl_bus_name = "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] " *) 
  (* srl_name = "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][1]_srl16 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \INFERRED_GEN.data_reg[15][1]_srl16 
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .CE(fifo_wr),
        .CLK(s_axi_aclk),
        .D(s_axi_wdata[6]),
        .Q(fifo_DOut[1]));
  (* srl_bus_name = "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] " *) 
  (* srl_name = "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][2]_srl16 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \INFERRED_GEN.data_reg[15][2]_srl16 
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .CE(fifo_wr),
        .CLK(s_axi_aclk),
        .D(s_axi_wdata[5]),
        .Q(fifo_DOut[2]));
  (* srl_bus_name = "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] " *) 
  (* srl_name = "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][3]_srl16 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \INFERRED_GEN.data_reg[15][3]_srl16 
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .CE(fifo_wr),
        .CLK(s_axi_aclk),
        .D(s_axi_wdata[4]),
        .Q(fifo_DOut[3]));
  (* srl_bus_name = "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] " *) 
  (* srl_name = "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][4]_srl16 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \INFERRED_GEN.data_reg[15][4]_srl16 
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .CE(fifo_wr),
        .CLK(s_axi_aclk),
        .D(s_axi_wdata[3]),
        .Q(fifo_DOut[4]));
  (* srl_bus_name = "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] " *) 
  (* srl_name = "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][5]_srl16 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \INFERRED_GEN.data_reg[15][5]_srl16 
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .CE(fifo_wr),
        .CLK(s_axi_aclk),
        .D(s_axi_wdata[2]),
        .Q(fifo_DOut[5]));
  (* srl_bus_name = "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] " *) 
  (* srl_name = "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][6]_srl16 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \INFERRED_GEN.data_reg[15][6]_srl16 
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .CE(fifo_wr),
        .CLK(s_axi_aclk),
        .D(s_axi_wdata[1]),
        .Q(fifo_DOut[6]));
  (* srl_bus_name = "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] " *) 
  (* srl_name = "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][7]_srl16 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \INFERRED_GEN.data_reg[15][7]_srl16 
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .CE(fifo_wr),
        .CLK(s_axi_aclk),
        .D(s_axi_wdata[0]),
        .Q(fifo_DOut[7]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    serial_Data_i_2
       (.I0(fifo_DOut[3]),
        .I1(fifo_DOut[2]),
        .I2(p_5_in),
        .I3(fifo_DOut[1]),
        .I4(serial_Data_reg_0),
        .I5(fifo_DOut[0]),
        .O(mux_0123));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    serial_Data_i_3
       (.I0(fifo_DOut[7]),
        .I1(fifo_DOut[6]),
        .I2(p_5_in),
        .I3(fifo_DOut[5]),
        .I4(serial_Data_reg_0),
        .I5(fifo_DOut[4]),
        .O(mux_4567));
  MUXF7 serial_Data_reg_i_1
       (.I0(mux_0123),
        .I1(mux_4567),
        .O(mux_Out),
        .S(serial_Data_reg));
endmodule

(* ORIG_REF_NAME = "dynshreg_f" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_f_3
   (fifo_wr,
    out,
    valid_rx,
    fifo_Write,
    \INFERRED_GEN.cnt_i_reg[3] ,
    in,
    Q,
    s_axi_aclk);
  output fifo_wr;
  output [7:0]out;
  input valid_rx;
  input fifo_Write;
  input \INFERRED_GEN.cnt_i_reg[3] ;
  input [0:7]in;
  input [3:0]Q;
  input s_axi_aclk;

  wire \INFERRED_GEN.cnt_i_reg[3] ;
  wire [3:0]Q;
  wire fifo_Write;
  wire fifo_wr;
  wire [0:7]in;
  wire [7:0]out;
  wire s_axi_aclk;
  wire valid_rx;

  (* srl_bus_name = "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] " *) 
  (* srl_name = "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][0]_srl16 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \INFERRED_GEN.data_reg[15][0]_srl16 
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .CE(fifo_wr),
        .CLK(s_axi_aclk),
        .D(in[0]),
        .Q(out[7]));
  (* srl_bus_name = "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] " *) 
  (* srl_name = "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][1]_srl16 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \INFERRED_GEN.data_reg[15][1]_srl16 
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .CE(fifo_wr),
        .CLK(s_axi_aclk),
        .D(in[1]),
        .Q(out[6]));
  (* srl_bus_name = "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] " *) 
  (* srl_name = "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][2]_srl16 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \INFERRED_GEN.data_reg[15][2]_srl16 
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .CE(fifo_wr),
        .CLK(s_axi_aclk),
        .D(in[2]),
        .Q(out[5]));
  (* srl_bus_name = "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] " *) 
  (* srl_name = "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][3]_srl16 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \INFERRED_GEN.data_reg[15][3]_srl16 
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .CE(fifo_wr),
        .CLK(s_axi_aclk),
        .D(in[3]),
        .Q(out[4]));
  (* srl_bus_name = "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] " *) 
  (* srl_name = "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][4]_srl16 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \INFERRED_GEN.data_reg[15][4]_srl16 
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .CE(fifo_wr),
        .CLK(s_axi_aclk),
        .D(in[4]),
        .Q(out[3]));
  (* srl_bus_name = "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] " *) 
  (* srl_name = "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][5]_srl16 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \INFERRED_GEN.data_reg[15][5]_srl16 
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .CE(fifo_wr),
        .CLK(s_axi_aclk),
        .D(in[5]),
        .Q(out[2]));
  (* srl_bus_name = "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] " *) 
  (* srl_name = "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][6]_srl16 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \INFERRED_GEN.data_reg[15][6]_srl16 
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .CE(fifo_wr),
        .CLK(s_axi_aclk),
        .D(in[6]),
        .Q(out[1]));
  (* srl_bus_name = "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] " *) 
  (* srl_name = "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][7]_srl16 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \INFERRED_GEN.data_reg[15][7]_srl16 
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .CE(fifo_wr),
        .CLK(s_axi_aclk),
        .D(in[7]),
        .Q(out[0]));
  LUT3 #(
    .INIT(8'h08)) 
    \INFERRED_GEN.data_reg[15][7]_srl16_i_1__0 
       (.I0(valid_rx),
        .I1(fifo_Write),
        .I2(\INFERRED_GEN.cnt_i_reg[3] ),
        .O(fifo_wr));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pselect_f
   (ce_expnd_i_3,
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] ,
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 );
  output ce_expnd_i_3;
  input \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] ;
  input \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ;

  wire \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] ;
  wire \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ;
  wire ce_expnd_i_3;

  LUT2 #(
    .INIT(4'h1)) 
    CS
       (.I0(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] ),
        .I1(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .O(ce_expnd_i_3));
endmodule

(* ORIG_REF_NAME = "pselect_f" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pselect_f__parameterized1
   (ce_expnd_i_1,
    \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2] ,
    \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 );
  output ce_expnd_i_1;
  input \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2] ;
  input \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 ;

  wire \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2] ;
  wire \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 ;
  wire ce_expnd_i_1;

  LUT2 #(
    .INIT(4'h2)) 
    CS
       (.I0(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2] ),
        .I1(\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 ),
        .O(ce_expnd_i_1));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_slave_attachment
   (\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1] ,
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] ,
    s_axi_rresp,
    Bus_RNW_reg_reg,
    s_axi_rvalid,
    s_axi_bvalid,
    fifo_wr,
    reset_TX_FIFO,
    reset_RX_FIFO,
    \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2] ,
    \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3] ,
    \INFERRED_GEN.cnt_i_reg[4] ,
    \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 ,
    \s_axi_wdata[4] ,
    s_axi_aresetn_0,
    Bus_RNW_reg_reg_0,
    s_axi_bresp,
    s_axi_rdata,
    bus2ip_reset,
    s_axi_aclk,
    tx_Buffer_Full,
    s_axi_wdata,
    s_axi_arvalid,
    s_axi_awvalid,
    s_axi_wvalid,
    Q,
    out,
    tx_Buffer_Empty_Pre_reg,
    s_axi_aresetn,
    rx_Buffer_Full,
    enable_interrupts,
    status_reg,
    s_axi_bready,
    s_axi_rready,
    s_axi_araddr,
    s_axi_awaddr);
  output \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1] ;
  output \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] ;
  output [0:0]s_axi_rresp;
  output Bus_RNW_reg_reg;
  output s_axi_rvalid;
  output s_axi_bvalid;
  output fifo_wr;
  output reset_TX_FIFO;
  output reset_RX_FIFO;
  output \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2] ;
  output \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3] ;
  output \INFERRED_GEN.cnt_i_reg[4] ;
  output [0:0]\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 ;
  output \s_axi_wdata[4] ;
  output s_axi_aresetn_0;
  output Bus_RNW_reg_reg_0;
  output [0:0]s_axi_bresp;
  output [7:0]s_axi_rdata;
  input bus2ip_reset;
  input s_axi_aclk;
  input tx_Buffer_Full;
  input [2:0]s_axi_wdata;
  input s_axi_arvalid;
  input s_axi_awvalid;
  input s_axi_wvalid;
  input [0:0]Q;
  input [7:0]out;
  input [0:0]tx_Buffer_Empty_Pre_reg;
  input s_axi_aresetn;
  input rx_Buffer_Full;
  input enable_interrupts;
  input [1:0]status_reg;
  input s_axi_bready;
  input s_axi_rready;
  input [1:0]s_axi_araddr;
  input [1:0]s_axi_awaddr;

  wire Bus_RNW_reg_reg;
  wire Bus_RNW_reg_reg_0;
  wire \FSM_onehot_state[1]_i_1_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[1] ;
  wire \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] ;
  wire \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1] ;
  wire \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2] ;
  wire [0:0]\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 ;
  wire \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3] ;
  wire \INFERRED_GEN.cnt_i_reg[4] ;
  wire I_DECODER_n_24;
  wire I_DECODER_n_25;
  wire I_DECODER_n_28;
  wire I_DECODER_n_6;
  wire I_DECODER_n_7;
  wire I_DECODER_n_8;
  wire [0:0]Q;
  wire [0:7]SIn_DBus;
  wire \bus2ip_addr_i[2]_i_1_n_0 ;
  wire \bus2ip_addr_i[3]_i_1_n_0 ;
  wire \bus2ip_addr_i[3]_i_2_n_0 ;
  wire \bus2ip_addr_i_reg_n_0_[2] ;
  wire \bus2ip_addr_i_reg_n_0_[3] ;
  wire [3:3]bus2ip_rdce;
  wire bus2ip_reset;
  wire bus2ip_rnw_i;
  wire bus2ip_rnw_i_i_1_n_0;
  wire enable_interrupts;
  wire fifo_wr;
  wire ip2bus_error;
  wire [7:0]out;
  wire reset_RX_FIFO;
  wire reset_TX_FIFO;
  wire rst;
  wire rx_Buffer_Full;
  wire s_axi_aclk;
  wire [1:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_aresetn_0;
  wire s_axi_arvalid;
  wire [1:0]s_axi_awaddr;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [0:0]s_axi_bresp;
  wire s_axi_bresp_i;
  wire \s_axi_bresp_i[1]_i_1_n_0 ;
  wire s_axi_bvalid;
  wire [7:0]s_axi_rdata;
  wire s_axi_rready;
  wire [0:0]s_axi_rresp;
  wire s_axi_rresp_i;
  wire s_axi_rvalid;
  wire [2:0]s_axi_wdata;
  wire \s_axi_wdata[4] ;
  wire s_axi_wvalid;
  wire start2;
  wire start2_i_1_n_0;
  wire state1__2;
  wire [1:0]status_reg;
  wire [0:0]tx_Buffer_Empty_Pre_reg;
  wire tx_Buffer_Full;

  LUT6 #(
    .INIT(64'h888F8F8F88888888)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(state1__2),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(s_axi_arvalid),
        .I3(s_axi_wvalid),
        .I4(s_axi_awvalid),
        .I5(\FSM_onehot_state_reg_n_0_[1] ),
        .O(\FSM_onehot_state[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \FSM_onehot_state[1]_i_2 
       (.I0(s_axi_bready),
        .I1(s_axi_bvalid),
        .I2(s_axi_rready),
        .I3(s_axi_rvalid),
        .O(state1__2));
  (* FSM_ENCODED_STATES = "sm_read:1000,sm_write:0100,sm_resp:0001,sm_idle:0010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(I_DECODER_n_8),
        .Q(\FSM_onehot_state_reg_n_0_[0] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "sm_read:1000,sm_write:0100,sm_resp:0001,sm_idle:0010" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_onehot_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[1] ),
        .S(rst));
  (* FSM_ENCODED_STATES = "sm_read:1000,sm_write:0100,sm_resp:0001,sm_idle:0010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(I_DECODER_n_7),
        .Q(s_axi_bresp_i),
        .R(rst));
  (* FSM_ENCODED_STATES = "sm_read:1000,sm_write:0100,sm_resp:0001,sm_idle:0010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(I_DECODER_n_6),
        .Q(s_axi_rresp_i),
        .R(rst));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_address_decoder I_DECODER
       (.Bus_RNW_reg_reg_0(Bus_RNW_reg_reg),
        .Bus_RNW_reg_reg_1(Bus_RNW_reg_reg_0),
        .D({I_DECODER_n_6,I_DECODER_n_7,I_DECODER_n_8}),
        .\FSM_onehot_state_reg[2] (I_DECODER_n_25),
        .\FSM_onehot_state_reg[3] (I_DECODER_n_24),
        .\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 (\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] ),
        .\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 ({SIn_DBus[0],SIn_DBus[1],SIn_DBus[2],SIn_DBus[3],SIn_DBus[4],SIn_DBus[5],SIn_DBus[6],SIn_DBus[7]}),
        .\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]_0 (\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1] ),
        .\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]_1 (I_DECODER_n_28),
        .\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 (\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2] ),
        .\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_1 (\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0 ),
        .\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_2 (\bus2ip_addr_i_reg_n_0_[3] ),
        .\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_3 (\bus2ip_addr_i_reg_n_0_[2] ),
        .\GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3]_0 (\GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3] ),
        .\INFERRED_GEN.cnt_i_reg[4] (\INFERRED_GEN.cnt_i_reg[4] ),
        .Q(start2),
        .bus2ip_rdce(bus2ip_rdce),
        .bus2ip_rnw_i(bus2ip_rnw_i),
        .enable_interrupts(enable_interrupts),
        .fifo_wr(fifo_wr),
        .ip2bus_error(ip2bus_error),
        .out(out),
        .reset_RX_FIFO(reset_RX_FIFO),
        .reset_TX_FIFO(reset_TX_FIFO),
        .rx_Buffer_Full(rx_Buffer_Full),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_aresetn_0(s_axi_aresetn_0),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .\s_axi_rdata_i_reg[0] (Q),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_rvalid_i_reg({s_axi_rresp_i,s_axi_bresp_i,\FSM_onehot_state_reg_n_0_[1] ,\FSM_onehot_state_reg_n_0_[0] }),
        .s_axi_wdata(s_axi_wdata),
        .\s_axi_wdata[4] (\s_axi_wdata[4] ),
        .s_axi_wvalid(s_axi_wvalid),
        .state1__2(state1__2),
        .status_reg(status_reg),
        .tx_Buffer_Empty_Pre_reg(tx_Buffer_Empty_Pre_reg),
        .tx_Buffer_Full(tx_Buffer_Full));
  LUT6 #(
    .INIT(64'hBF80FFFFBF800000)) 
    \bus2ip_addr_i[2]_i_1 
       (.I0(s_axi_araddr[0]),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(s_axi_arvalid),
        .I3(s_axi_awaddr[0]),
        .I4(\bus2ip_addr_i[3]_i_2_n_0 ),
        .I5(\bus2ip_addr_i_reg_n_0_[2] ),
        .O(\bus2ip_addr_i[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBF80FFFFBF800000)) 
    \bus2ip_addr_i[3]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(s_axi_arvalid),
        .I3(s_axi_awaddr[1]),
        .I4(\bus2ip_addr_i[3]_i_2_n_0 ),
        .I5(\bus2ip_addr_i_reg_n_0_[3] ),
        .O(\bus2ip_addr_i[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hEA00)) 
    \bus2ip_addr_i[3]_i_2 
       (.I0(s_axi_arvalid),
        .I1(s_axi_awvalid),
        .I2(s_axi_wvalid),
        .I3(\FSM_onehot_state_reg_n_0_[1] ),
        .O(\bus2ip_addr_i[3]_i_2_n_0 ));
  FDRE \bus2ip_addr_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\bus2ip_addr_i[2]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg_n_0_[2] ),
        .R(rst));
  FDRE \bus2ip_addr_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\bus2ip_addr_i[3]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg_n_0_[3] ),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'hBFFFAA00)) 
    bus2ip_rnw_i_i_1
       (.I0(s_axi_arvalid),
        .I1(s_axi_awvalid),
        .I2(s_axi_wvalid),
        .I3(\FSM_onehot_state_reg_n_0_[1] ),
        .I4(bus2ip_rnw_i),
        .O(bus2ip_rnw_i_i_1_n_0));
  FDRE bus2ip_rnw_i_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(bus2ip_rnw_i_i_1_n_0),
        .Q(bus2ip_rnw_i),
        .R(rst));
  FDRE rst_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(bus2ip_reset),
        .Q(rst),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \s_axi_bresp_i[1]_i_1 
       (.I0(Q),
        .I1(bus2ip_rdce),
        .I2(tx_Buffer_Full),
        .I3(I_DECODER_n_28),
        .I4(s_axi_bresp_i),
        .I5(s_axi_bresp),
        .O(\s_axi_bresp_i[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_bresp_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\s_axi_bresp_i[1]_i_1_n_0 ),
        .Q(s_axi_bresp),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    s_axi_bvalid_i_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(I_DECODER_n_25),
        .Q(s_axi_bvalid),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(SIn_DBus[7]),
        .Q(s_axi_rdata[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(SIn_DBus[6]),
        .Q(s_axi_rdata[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(SIn_DBus[5]),
        .Q(s_axi_rdata[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(SIn_DBus[4]),
        .Q(s_axi_rdata[3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[4] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(SIn_DBus[3]),
        .Q(s_axi_rdata[4]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[5] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(SIn_DBus[2]),
        .Q(s_axi_rdata[5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[6] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(SIn_DBus[1]),
        .Q(s_axi_rdata[6]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[7] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(SIn_DBus[0]),
        .Q(s_axi_rdata[7]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rresp_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_error),
        .Q(s_axi_rresp),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    s_axi_rvalid_i_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(I_DECODER_n_24),
        .Q(s_axi_rvalid),
        .R(rst));
  LUT4 #(
    .INIT(16'hF800)) 
    start2_i_1
       (.I0(s_axi_awvalid),
        .I1(s_axi_wvalid),
        .I2(s_axi_arvalid),
        .I3(\FSM_onehot_state_reg_n_0_[1] ),
        .O(start2_i_1_n_0));
  FDRE start2_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(start2_i_1_n_0),
        .Q(start2),
        .R(rst));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_f
   (FIFO_Full_reg,
    Q,
    Interrupt0,
    mux_Out,
    tx_Data_Enable_reg,
    s_axi_aclk,
    fifo_Read,
    \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ,
    Bus_RNW_reg,
    fifo_wr,
    enable_interrupts,
    tx_Buffer_Empty_Pre,
    Interrupt_reg,
    rx_Data_Present_Pre,
    serial_Data_reg,
    p_5_in,
    serial_Data_reg_0,
    tx_Start_reg,
    tx_Start,
    tx_DataBits,
    \INFERRED_GEN.cnt_i_reg[0] ,
    s_axi_aresetn,
    s_axi_wdata);
  output FIFO_Full_reg;
  output [0:0]Q;
  output Interrupt0;
  output mux_Out;
  output tx_Data_Enable_reg;
  input s_axi_aclk;
  input fifo_Read;
  input \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ;
  input Bus_RNW_reg;
  input fifo_wr;
  input enable_interrupts;
  input tx_Buffer_Empty_Pre;
  input [0:0]Interrupt_reg;
  input rx_Data_Present_Pre;
  input serial_Data_reg;
  input p_5_in;
  input serial_Data_reg_0;
  input tx_Start_reg;
  input tx_Start;
  input tx_DataBits;
  input \INFERRED_GEN.cnt_i_reg[0] ;
  input s_axi_aresetn;
  input [7:0]s_axi_wdata;

  wire Bus_RNW_reg;
  wire FIFO_Full_reg;
  wire \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ;
  wire \INFERRED_GEN.cnt_i_reg[0] ;
  wire Interrupt0;
  wire [0:0]Interrupt_reg;
  wire [0:0]Q;
  wire enable_interrupts;
  wire fifo_Read;
  wire fifo_wr;
  wire mux_Out;
  wire p_5_in;
  wire rx_Data_Present_Pre;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire [7:0]s_axi_wdata;
  wire serial_Data_reg;
  wire serial_Data_reg_0;
  wire tx_Buffer_Empty_Pre;
  wire tx_DataBits;
  wire tx_Data_Enable_reg;
  wire tx_Start;
  wire tx_Start_reg;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_rbu_f I_SRL_FIFO_RBU_F
       (.Bus_RNW_reg(Bus_RNW_reg),
        .FIFO_Full_reg_0(FIFO_Full_reg),
        .\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg (\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ),
        .\INFERRED_GEN.cnt_i_reg[0] (\INFERRED_GEN.cnt_i_reg[0] ),
        .Interrupt0(Interrupt0),
        .Interrupt_reg(Interrupt_reg),
        .Q(Q),
        .enable_interrupts(enable_interrupts),
        .fifo_Read(fifo_Read),
        .fifo_wr(fifo_wr),
        .mux_Out(mux_Out),
        .p_5_in(p_5_in),
        .rx_Data_Present_Pre(rx_Data_Present_Pre),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_wdata(s_axi_wdata),
        .serial_Data_reg(serial_Data_reg),
        .serial_Data_reg_0(serial_Data_reg_0),
        .tx_Buffer_Empty_Pre(tx_Buffer_Empty_Pre),
        .tx_DataBits(tx_DataBits),
        .tx_Data_Enable_reg(tx_Data_Enable_reg),
        .tx_Start(tx_Start),
        .tx_Start_reg(tx_Start_reg));
endmodule

(* ORIG_REF_NAME = "srl_fifo_f" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_f_0
   (FIFO_Full_reg,
    \status_reg_reg[2] ,
    Q,
    out,
    s_axi_aclk,
    status_reg,
    fifo_Write,
    s_axi_aresetn,
    clr_Status,
    FIFO_Full_reg_0,
    valid_rx,
    Bus_RNW_reg,
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ,
    \INFERRED_GEN.cnt_i_reg[0] ,
    in);
  output FIFO_Full_reg;
  output \status_reg_reg[2] ;
  output [0:0]Q;
  output [7:0]out;
  input s_axi_aclk;
  input [0:0]status_reg;
  input fifo_Write;
  input s_axi_aresetn;
  input clr_Status;
  input FIFO_Full_reg_0;
  input valid_rx;
  input Bus_RNW_reg;
  input \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ;
  input \INFERRED_GEN.cnt_i_reg[0] ;
  input [0:7]in;

  wire Bus_RNW_reg;
  wire FIFO_Full_reg;
  wire FIFO_Full_reg_0;
  wire \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ;
  wire \INFERRED_GEN.cnt_i_reg[0] ;
  wire [0:0]Q;
  wire clr_Status;
  wire fifo_Write;
  wire [0:7]in;
  wire [7:0]out;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire [0:0]status_reg;
  wire \status_reg_reg[2] ;
  wire valid_rx;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_rbu_f_1 I_SRL_FIFO_RBU_F
       (.Bus_RNW_reg(Bus_RNW_reg),
        .FIFO_Full_reg_0(FIFO_Full_reg),
        .FIFO_Full_reg_1(FIFO_Full_reg_0),
        .\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg (\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ),
        .\INFERRED_GEN.cnt_i_reg[0] (\INFERRED_GEN.cnt_i_reg[0] ),
        .Q(Q),
        .clr_Status(clr_Status),
        .fifo_Write(fifo_Write),
        .in(in),
        .out(out),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .status_reg(status_reg),
        .\status_reg_reg[2] (\status_reg_reg[2] ),
        .valid_rx(valid_rx));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_rbu_f
   (FIFO_Full_reg_0,
    Q,
    Interrupt0,
    mux_Out,
    tx_Data_Enable_reg,
    s_axi_aclk,
    fifo_Read,
    \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ,
    Bus_RNW_reg,
    fifo_wr,
    enable_interrupts,
    tx_Buffer_Empty_Pre,
    Interrupt_reg,
    rx_Data_Present_Pre,
    serial_Data_reg,
    p_5_in,
    serial_Data_reg_0,
    tx_Start_reg,
    tx_Start,
    tx_DataBits,
    \INFERRED_GEN.cnt_i_reg[0] ,
    s_axi_aresetn,
    s_axi_wdata);
  output FIFO_Full_reg_0;
  output [0:0]Q;
  output Interrupt0;
  output mux_Out;
  output tx_Data_Enable_reg;
  input s_axi_aclk;
  input fifo_Read;
  input \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ;
  input Bus_RNW_reg;
  input fifo_wr;
  input enable_interrupts;
  input tx_Buffer_Empty_Pre;
  input [0:0]Interrupt_reg;
  input rx_Data_Present_Pre;
  input serial_Data_reg;
  input p_5_in;
  input serial_Data_reg_0;
  input tx_Start_reg;
  input tx_Start;
  input tx_DataBits;
  input \INFERRED_GEN.cnt_i_reg[0] ;
  input s_axi_aresetn;
  input [7:0]s_axi_wdata;

  wire Bus_RNW_reg;
  wire CNTR_INCR_DECR_ADDN_F_I_n_2;
  wire CNTR_INCR_DECR_ADDN_F_I_n_3;
  wire CNTR_INCR_DECR_ADDN_F_I_n_4;
  wire CNTR_INCR_DECR_ADDN_F_I_n_5;
  wire CNTR_INCR_DECR_ADDN_F_I_n_8;
  wire FIFO_Full_reg_0;
  wire \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ;
  wire \INFERRED_GEN.cnt_i_reg[0] ;
  wire Interrupt0;
  wire [0:0]Interrupt_reg;
  wire [0:0]Q;
  wire enable_interrupts;
  wire fifo_Read;
  wire fifo_full_p1;
  wire fifo_wr;
  wire mux_Out;
  wire p_5_in;
  wire rx_Data_Present_Pre;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire [7:0]s_axi_wdata;
  wire serial_Data_reg;
  wire serial_Data_reg_0;
  wire tx_Buffer_Empty_Pre;
  wire tx_DataBits;
  wire tx_Data_Enable_reg;
  wire tx_Start;
  wire tx_Start_reg;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cntr_incr_decr_addn_f CNTR_INCR_DECR_ADDN_F_I
       (.Bus_RNW_reg(Bus_RNW_reg),
        .\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg (\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ),
        .\INFERRED_GEN.cnt_i_reg[0]_0 (FIFO_Full_reg_0),
        .\INFERRED_GEN.cnt_i_reg[0]_1 (\INFERRED_GEN.cnt_i_reg[0] ),
        .Interrupt0(Interrupt0),
        .Interrupt_reg(Interrupt_reg),
        .Q({Q,CNTR_INCR_DECR_ADDN_F_I_n_2,CNTR_INCR_DECR_ADDN_F_I_n_3,CNTR_INCR_DECR_ADDN_F_I_n_4,CNTR_INCR_DECR_ADDN_F_I_n_5}),
        .SS(CNTR_INCR_DECR_ADDN_F_I_n_8),
        .enable_interrupts(enable_interrupts),
        .fifo_Read(fifo_Read),
        .fifo_full_p1(fifo_full_p1),
        .fifo_wr(fifo_wr),
        .rx_Data_Present_Pre(rx_Data_Present_Pre),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .tx_Buffer_Empty_Pre(tx_Buffer_Empty_Pre),
        .tx_DataBits(tx_DataBits),
        .tx_Data_Enable_reg(tx_Data_Enable_reg),
        .tx_Start(tx_Start),
        .tx_Start_reg(tx_Start_reg));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_f DYNSHREG_F_I
       (.Q({CNTR_INCR_DECR_ADDN_F_I_n_2,CNTR_INCR_DECR_ADDN_F_I_n_3,CNTR_INCR_DECR_ADDN_F_I_n_4,CNTR_INCR_DECR_ADDN_F_I_n_5}),
        .fifo_wr(fifo_wr),
        .mux_Out(mux_Out),
        .p_5_in(p_5_in),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata),
        .serial_Data_reg(serial_Data_reg),
        .serial_Data_reg_0(serial_Data_reg_0));
  FDRE FIFO_Full_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(fifo_full_p1),
        .Q(FIFO_Full_reg_0),
        .R(CNTR_INCR_DECR_ADDN_F_I_n_8));
endmodule

(* ORIG_REF_NAME = "srl_fifo_rbu_f" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_rbu_f_1
   (FIFO_Full_reg_0,
    \status_reg_reg[2] ,
    Q,
    out,
    s_axi_aclk,
    status_reg,
    fifo_Write,
    s_axi_aresetn,
    clr_Status,
    FIFO_Full_reg_1,
    valid_rx,
    Bus_RNW_reg,
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ,
    \INFERRED_GEN.cnt_i_reg[0] ,
    in);
  output FIFO_Full_reg_0;
  output \status_reg_reg[2] ;
  output [0:0]Q;
  output [7:0]out;
  input s_axi_aclk;
  input [0:0]status_reg;
  input fifo_Write;
  input s_axi_aresetn;
  input clr_Status;
  input FIFO_Full_reg_1;
  input valid_rx;
  input Bus_RNW_reg;
  input \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ;
  input \INFERRED_GEN.cnt_i_reg[0] ;
  input [0:7]in;

  wire Bus_RNW_reg;
  wire CNTR_INCR_DECR_ADDN_F_I_n_2;
  wire CNTR_INCR_DECR_ADDN_F_I_n_3;
  wire CNTR_INCR_DECR_ADDN_F_I_n_4;
  wire CNTR_INCR_DECR_ADDN_F_I_n_5;
  wire CNTR_INCR_DECR_ADDN_F_I_n_6;
  wire FIFO_Full_reg_0;
  wire FIFO_Full_reg_1;
  wire \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ;
  wire \INFERRED_GEN.cnt_i_reg[0] ;
  wire [0:0]Q;
  wire clr_Status;
  wire fifo_Write;
  wire fifo_full_p1;
  wire fifo_wr;
  wire [0:7]in;
  wire [7:0]out;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire [0:0]status_reg;
  wire \status_reg_reg[2] ;
  wire valid_rx;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cntr_incr_decr_addn_f_2 CNTR_INCR_DECR_ADDN_F_I
       (.Bus_RNW_reg(Bus_RNW_reg),
        .FIFO_Full_reg(FIFO_Full_reg_1),
        .\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg (\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ),
        .\INFERRED_GEN.cnt_i_reg[0]_0 (FIFO_Full_reg_0),
        .\INFERRED_GEN.cnt_i_reg[0]_1 (\INFERRED_GEN.cnt_i_reg[0] ),
        .Q({Q,CNTR_INCR_DECR_ADDN_F_I_n_2,CNTR_INCR_DECR_ADDN_F_I_n_3,CNTR_INCR_DECR_ADDN_F_I_n_4,CNTR_INCR_DECR_ADDN_F_I_n_5}),
        .SS(CNTR_INCR_DECR_ADDN_F_I_n_6),
        .fifo_Write(fifo_Write),
        .fifo_full_p1(fifo_full_p1),
        .fifo_wr(fifo_wr),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .valid_rx(valid_rx));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_f_3 DYNSHREG_F_I
       (.\INFERRED_GEN.cnt_i_reg[3] (FIFO_Full_reg_0),
        .Q({CNTR_INCR_DECR_ADDN_F_I_n_2,CNTR_INCR_DECR_ADDN_F_I_n_3,CNTR_INCR_DECR_ADDN_F_I_n_4,CNTR_INCR_DECR_ADDN_F_I_n_5}),
        .fifo_Write(fifo_Write),
        .fifo_wr(fifo_wr),
        .in(in),
        .out(out),
        .s_axi_aclk(s_axi_aclk),
        .valid_rx(valid_rx));
  FDRE FIFO_Full_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(fifo_full_p1),
        .Q(FIFO_Full_reg_0),
        .R(CNTR_INCR_DECR_ADDN_F_I_n_6));
  LUT5 #(
    .INIT(32'h0000EA00)) 
    \status_reg[2]_i_1 
       (.I0(status_reg),
        .I1(fifo_Write),
        .I2(FIFO_Full_reg_0),
        .I3(s_axi_aresetn),
        .I4(clr_Status),
        .O(\status_reg_reg[2] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_uartlite_core
   (bus2ip_reset,
    rx_Buffer_Full,
    tx_Buffer_Full,
    tx,
    interrupt,
    status_reg,
    enable_interrupts,
    Q,
    \INFERRED_GEN.cnt_i_reg[4] ,
    out,
    s_axi_aclk,
    reset_TX_FIFO,
    reset_RX_FIFO,
    clr_Status_reg_0,
    enable_interrupts_reg_0,
    tx_Buffer_Empty_Pre_reg_0,
    rx_Data_Present_Pre_reg_0,
    s_axi_aresetn,
    \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ,
    Bus_RNW_reg,
    fifo_wr,
    FIFO_Full_reg,
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ,
    rx,
    s_axi_wdata);
  output bus2ip_reset;
  output rx_Buffer_Full;
  output tx_Buffer_Full;
  output tx;
  output interrupt;
  output [1:0]status_reg;
  output enable_interrupts;
  output [0:0]Q;
  output [0:0]\INFERRED_GEN.cnt_i_reg[4] ;
  output [7:0]out;
  input s_axi_aclk;
  input reset_TX_FIFO;
  input reset_RX_FIFO;
  input [0:0]clr_Status_reg_0;
  input enable_interrupts_reg_0;
  input tx_Buffer_Empty_Pre_reg_0;
  input rx_Data_Present_Pre_reg_0;
  input s_axi_aresetn;
  input \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ;
  input Bus_RNW_reg;
  input fifo_wr;
  input FIFO_Full_reg;
  input \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ;
  input rx;
  input [7:0]s_axi_wdata;

  wire Bus_RNW_reg;
  wire FIFO_Full_reg;
  wire \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ;
  wire \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ;
  wire [0:0]\INFERRED_GEN.cnt_i_reg[4] ;
  wire Interrupt0;
  wire [0:0]Q;
  wire UARTLITE_RX_I_n_2;
  wire UARTLITE_RX_I_n_3;
  wire UARTLITE_RX_I_n_4;
  wire bus2ip_reset;
  wire clr_Status;
  wire [0:0]clr_Status_reg_0;
  wire en_16x_Baud;
  wire enable_interrupts;
  wire enable_interrupts_reg_0;
  wire fifo_wr;
  wire interrupt;
  wire [7:0]out;
  wire reset_RX_FIFO;
  wire reset_RX_FIFO_reg_n_0;
  wire reset_TX_FIFO;
  wire reset_TX_FIFO_reg_n_0;
  wire rx;
  wire rx_Buffer_Full;
  wire rx_Data_Present_Pre;
  wire rx_Data_Present_Pre_reg_0;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire [7:0]s_axi_wdata;
  wire [1:0]status_reg;
  wire tx;
  wire tx_Buffer_Empty_Pre;
  wire tx_Buffer_Empty_Pre_reg_0;
  wire tx_Buffer_Full;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_baudrate BAUD_RATE_I
       (.EN_16x_Baud_reg_0(bus2ip_reset),
        .en_16x_Baud(en_16x_Baud),
        .s_axi_aclk(s_axi_aclk));
  FDRE Interrupt_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Interrupt0),
        .Q(interrupt),
        .R(bus2ip_reset));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_uartlite_rx UARTLITE_RX_I
       (.Bus_RNW_reg(Bus_RNW_reg),
        .FIFO_Full_reg(rx_Buffer_Full),
        .FIFO_Full_reg_0(FIFO_Full_reg),
        .\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg (\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ),
        .\INFERRED_GEN.cnt_i_reg[0] (reset_RX_FIFO_reg_n_0),
        .Q(\INFERRED_GEN.cnt_i_reg[4] ),
        .clr_Status(clr_Status),
        .data_shift_reg_r_12_0(UARTLITE_RX_I_n_2),
        .en_16x_Baud(en_16x_Baud),
        .out(out),
        .rx(rx),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_aresetn_0(bus2ip_reset),
        .status_reg(status_reg),
        .\status_reg_reg[1] (UARTLITE_RX_I_n_3),
        .\status_reg_reg[2] (UARTLITE_RX_I_n_4));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_uartlite_tx UARTLITE_TX_I
       (.Bus_RNW_reg(Bus_RNW_reg),
        .FIFO_Full_reg(tx_Buffer_Full),
        .\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg (\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ),
        .\INFERRED_GEN.cnt_i_reg[0] (reset_TX_FIFO_reg_n_0),
        .Interrupt0(Interrupt0),
        .Interrupt_reg(\INFERRED_GEN.cnt_i_reg[4] ),
        .Q(Q),
        .\data_shift_reg[15]_0 (bus2ip_reset),
        .\data_shift_reg[15]_1 (UARTLITE_RX_I_n_2),
        .en_16x_Baud(en_16x_Baud),
        .enable_interrupts(enable_interrupts),
        .fifo_wr(fifo_wr),
        .rx_Data_Present_Pre(rx_Data_Present_Pre),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_wdata(s_axi_wdata),
        .tx(tx),
        .tx_Buffer_Empty_Pre(tx_Buffer_Empty_Pre));
  FDRE clr_Status_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(clr_Status_reg_0),
        .Q(clr_Status),
        .R(bus2ip_reset));
  FDRE enable_interrupts_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(enable_interrupts_reg_0),
        .Q(enable_interrupts),
        .R(bus2ip_reset));
  FDSE reset_RX_FIFO_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(reset_RX_FIFO),
        .Q(reset_RX_FIFO_reg_n_0),
        .S(bus2ip_reset));
  FDSE reset_TX_FIFO_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(reset_TX_FIFO),
        .Q(reset_TX_FIFO_reg_n_0),
        .S(bus2ip_reset));
  FDRE rx_Data_Present_Pre_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(rx_Data_Present_Pre_reg_0),
        .Q(rx_Data_Present_Pre),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(UARTLITE_RX_I_n_3),
        .Q(status_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \status_reg_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(UARTLITE_RX_I_n_4),
        .Q(status_reg[0]),
        .R(1'b0));
  FDRE tx_Buffer_Empty_Pre_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(tx_Buffer_Empty_Pre_reg_0),
        .Q(tx_Buffer_Empty_Pre),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_uartlite_rx
   (s_axi_aresetn_0,
    FIFO_Full_reg,
    data_shift_reg_r_12_0,
    \status_reg_reg[1] ,
    \status_reg_reg[2] ,
    Q,
    out,
    en_16x_Baud,
    s_axi_aclk,
    status_reg,
    s_axi_aresetn,
    clr_Status,
    FIFO_Full_reg_0,
    Bus_RNW_reg,
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ,
    \INFERRED_GEN.cnt_i_reg[0] ,
    rx);
  output s_axi_aresetn_0;
  output FIFO_Full_reg;
  output data_shift_reg_r_12_0;
  output \status_reg_reg[1] ;
  output \status_reg_reg[2] ;
  output [0:0]Q;
  output [7:0]out;
  input en_16x_Baud;
  input s_axi_aclk;
  input [1:0]status_reg;
  input s_axi_aresetn;
  input clr_Status;
  input FIFO_Full_reg_0;
  input Bus_RNW_reg;
  input \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ;
  input \INFERRED_GEN.cnt_i_reg[0] ;
  input rx;

  wire Bus_RNW_reg;
  wire FIFO_Full_reg;
  wire FIFO_Full_reg_0;
  wire \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ;
  wire \INFERRED_GEN.cnt_i_reg[0] ;
  wire INPUT_DOUBLE_REGS3_n_3;
  wire INPUT_DOUBLE_REGS3_n_4;
  wire [0:0]Q;
  wire RX_D2;
  wire \SERIAL_TO_PARALLEL[8].fifo_din[8]_i_1_n_0 ;
  wire clr_Status;
  wire \data_shift_reg[13]_srl14___UARTLITE_CORE_I_UARTLITE_RX_I_data_shift_reg_r_12_n_0 ;
  wire \data_shift_reg[14]_UARTLITE_CORE_I_UARTLITE_RX_I_data_shift_reg_r_13_n_0 ;
  wire data_shift_reg_gate_n_0;
  wire data_shift_reg_r_0_n_0;
  wire data_shift_reg_r_10_n_0;
  wire data_shift_reg_r_11_n_0;
  wire data_shift_reg_r_12_0;
  wire data_shift_reg_r_13_n_0;
  wire data_shift_reg_r_1_n_0;
  wire data_shift_reg_r_2_n_0;
  wire data_shift_reg_r_3_n_0;
  wire data_shift_reg_r_4_n_0;
  wire data_shift_reg_r_5_n_0;
  wire data_shift_reg_r_6_n_0;
  wire data_shift_reg_r_7_n_0;
  wire data_shift_reg_r_8_n_0;
  wire data_shift_reg_r_9_n_0;
  wire data_shift_reg_r_n_0;
  wire en_16x_Baud;
  wire fifo_Write;
  wire fifo_Write0;
  wire [1:8]fifo_din;
  wire frame_err_ocrd;
  wire [7:0]out;
  wire [0:0]p_1_out;
  wire running_i_1_n_0;
  wire running_reg_n_0;
  wire rx;
  wire rx_1;
  wire rx_2;
  wire rx_3;
  wire rx_4;
  wire rx_5;
  wire rx_6;
  wire rx_7;
  wire rx_8;
  wire rx_9;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire s_axi_aresetn_0;
  wire sample_Point;
  wire [2:8]serial_to_Par;
  wire start_Edge_Detected;
  wire start_Edge_Detected0;
  wire start_Edge_Detected_i_2_n_0;
  wire [1:0]status_reg;
  wire \status_reg_reg[1] ;
  wire \status_reg_reg[2] ;
  wire stop_Bit_Position_i_1_n_0;
  wire stop_Bit_Position_reg_n_0;
  wire valid_rx;
  wire valid_rx_i_1_n_0;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync INPUT_DOUBLE_REGS3
       (.EN_16x_Baud_reg(INPUT_DOUBLE_REGS3_n_3),
        .clr_Status(clr_Status),
        .en_16x_Baud(en_16x_Baud),
        .fifo_Write0(fifo_Write0),
        .frame_err_ocrd(frame_err_ocrd),
        .frame_err_ocrd_reg(stop_Bit_Position_reg_n_0),
        .in(fifo_din[1]),
        .rx(rx),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .sample_Point(sample_Point),
        .scndry_out(RX_D2),
        .start_Edge_Detected(start_Edge_Detected),
        .status_reg(status_reg[1]),
        .\status_reg_reg[1] (\status_reg_reg[1] ),
        .stop_Bit_Position_reg(INPUT_DOUBLE_REGS3_n_4));
  LUT1 #(
    .INIT(2'h1)) 
    Interrupt_i_1
       (.I0(s_axi_aresetn),
        .O(s_axi_aresetn_0));
  FDRE \SERIAL_TO_PARALLEL[1].fifo_din_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(INPUT_DOUBLE_REGS3_n_4),
        .Q(fifo_din[1]),
        .R(s_axi_aresetn_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hBA8A)) 
    \SERIAL_TO_PARALLEL[2].fifo_din[2]_i_1 
       (.I0(fifo_din[2]),
        .I1(stop_Bit_Position_reg_n_0),
        .I2(sample_Point),
        .I3(fifo_din[1]),
        .O(serial_to_Par[2]));
  FDRE \SERIAL_TO_PARALLEL[2].fifo_din_reg[2] 
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(serial_to_Par[2]),
        .Q(fifo_din[2]),
        .R(\SERIAL_TO_PARALLEL[8].fifo_din[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hBA8A)) 
    \SERIAL_TO_PARALLEL[3].fifo_din[3]_i_1 
       (.I0(fifo_din[3]),
        .I1(stop_Bit_Position_reg_n_0),
        .I2(sample_Point),
        .I3(fifo_din[2]),
        .O(serial_to_Par[3]));
  FDRE \SERIAL_TO_PARALLEL[3].fifo_din_reg[3] 
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(serial_to_Par[3]),
        .Q(fifo_din[3]),
        .R(\SERIAL_TO_PARALLEL[8].fifo_din[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hBA8A)) 
    \SERIAL_TO_PARALLEL[4].fifo_din[4]_i_1 
       (.I0(fifo_din[4]),
        .I1(stop_Bit_Position_reg_n_0),
        .I2(sample_Point),
        .I3(fifo_din[3]),
        .O(serial_to_Par[4]));
  FDRE \SERIAL_TO_PARALLEL[4].fifo_din_reg[4] 
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(serial_to_Par[4]),
        .Q(fifo_din[4]),
        .R(\SERIAL_TO_PARALLEL[8].fifo_din[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hBA8A)) 
    \SERIAL_TO_PARALLEL[5].fifo_din[5]_i_1 
       (.I0(fifo_din[5]),
        .I1(stop_Bit_Position_reg_n_0),
        .I2(sample_Point),
        .I3(fifo_din[4]),
        .O(serial_to_Par[5]));
  FDRE \SERIAL_TO_PARALLEL[5].fifo_din_reg[5] 
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(serial_to_Par[5]),
        .Q(fifo_din[5]),
        .R(\SERIAL_TO_PARALLEL[8].fifo_din[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hBA8A)) 
    \SERIAL_TO_PARALLEL[6].fifo_din[6]_i_1 
       (.I0(fifo_din[6]),
        .I1(stop_Bit_Position_reg_n_0),
        .I2(sample_Point),
        .I3(fifo_din[5]),
        .O(serial_to_Par[6]));
  FDRE \SERIAL_TO_PARALLEL[6].fifo_din_reg[6] 
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(serial_to_Par[6]),
        .Q(fifo_din[6]),
        .R(\SERIAL_TO_PARALLEL[8].fifo_din[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hBA8A)) 
    \SERIAL_TO_PARALLEL[7].fifo_din[7]_i_1 
       (.I0(fifo_din[7]),
        .I1(stop_Bit_Position_reg_n_0),
        .I2(sample_Point),
        .I3(fifo_din[6]),
        .O(serial_to_Par[7]));
  FDRE \SERIAL_TO_PARALLEL[7].fifo_din_reg[7] 
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(serial_to_Par[7]),
        .Q(fifo_din[7]),
        .R(\SERIAL_TO_PARALLEL[8].fifo_din[8]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \SERIAL_TO_PARALLEL[8].fifo_din[8]_i_1 
       (.I0(start_Edge_Detected),
        .I1(s_axi_aresetn),
        .O(\SERIAL_TO_PARALLEL[8].fifo_din[8]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBA8A)) 
    \SERIAL_TO_PARALLEL[8].fifo_din[8]_i_2 
       (.I0(fifo_din[8]),
        .I1(stop_Bit_Position_reg_n_0),
        .I2(sample_Point),
        .I3(fifo_din[7]),
        .O(serial_to_Par[8]));
  FDRE \SERIAL_TO_PARALLEL[8].fifo_din_reg[8] 
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(serial_to_Par[8]),
        .Q(fifo_din[8]),
        .R(\SERIAL_TO_PARALLEL[8].fifo_din[8]_i_1_n_0 ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_f_0 SRL_FIFO_I
       (.Bus_RNW_reg(Bus_RNW_reg),
        .FIFO_Full_reg(FIFO_Full_reg),
        .FIFO_Full_reg_0(FIFO_Full_reg_0),
        .\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg (\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg ),
        .\INFERRED_GEN.cnt_i_reg[0] (\INFERRED_GEN.cnt_i_reg[0] ),
        .Q(Q),
        .clr_Status(clr_Status),
        .fifo_Write(fifo_Write),
        .in(fifo_din),
        .out(out),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .status_reg(status_reg[0]),
        .\status_reg_reg[2] (\status_reg_reg[2] ),
        .valid_rx(valid_rx));
  (* srl_bus_name = "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/data_shift_reg " *) 
  (* srl_name = "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/data_shift_reg[13]_srl14___UARTLITE_CORE_I_UARTLITE_RX_I_data_shift_reg_r_12 " *) 
  SRL16E \data_shift_reg[13]_srl14___UARTLITE_CORE_I_UARTLITE_RX_I_data_shift_reg_r_12 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b1),
        .A3(1'b1),
        .CE(en_16x_Baud),
        .CLK(s_axi_aclk),
        .D(p_1_out),
        .Q(\data_shift_reg[13]_srl14___UARTLITE_CORE_I_UARTLITE_RX_I_data_shift_reg_r_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h0E00)) 
    \data_shift_reg[13]_srl14___UARTLITE_CORE_I_UARTLITE_RX_I_data_shift_reg_r_12_i_1 
       (.I0(sample_Point),
        .I1(start_Edge_Detected),
        .I2(stop_Bit_Position_reg_n_0),
        .I3(valid_rx),
        .O(p_1_out));
  FDRE \data_shift_reg[14]_UARTLITE_CORE_I_UARTLITE_RX_I_data_shift_reg_r_13 
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(\data_shift_reg[13]_srl14___UARTLITE_CORE_I_UARTLITE_RX_I_data_shift_reg_r_12_n_0 ),
        .Q(\data_shift_reg[14]_UARTLITE_CORE_I_UARTLITE_RX_I_data_shift_reg_r_13_n_0 ),
        .R(1'b0));
  FDRE \data_shift_reg[15] 
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(data_shift_reg_gate_n_0),
        .Q(sample_Point),
        .R(s_axi_aresetn_0));
  LUT2 #(
    .INIT(4'h8)) 
    data_shift_reg_gate
       (.I0(\data_shift_reg[14]_UARTLITE_CORE_I_UARTLITE_RX_I_data_shift_reg_r_13_n_0 ),
        .I1(data_shift_reg_r_13_n_0),
        .O(data_shift_reg_gate_n_0));
  FDRE data_shift_reg_r
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(1'b1),
        .Q(data_shift_reg_r_n_0),
        .R(s_axi_aresetn_0));
  FDRE data_shift_reg_r_0
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(data_shift_reg_r_n_0),
        .Q(data_shift_reg_r_0_n_0),
        .R(s_axi_aresetn_0));
  FDRE data_shift_reg_r_1
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(data_shift_reg_r_0_n_0),
        .Q(data_shift_reg_r_1_n_0),
        .R(s_axi_aresetn_0));
  FDRE data_shift_reg_r_10
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(data_shift_reg_r_9_n_0),
        .Q(data_shift_reg_r_10_n_0),
        .R(s_axi_aresetn_0));
  FDRE data_shift_reg_r_11
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(data_shift_reg_r_10_n_0),
        .Q(data_shift_reg_r_11_n_0),
        .R(s_axi_aresetn_0));
  FDRE data_shift_reg_r_12
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(data_shift_reg_r_11_n_0),
        .Q(data_shift_reg_r_12_0),
        .R(s_axi_aresetn_0));
  FDRE data_shift_reg_r_13
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(data_shift_reg_r_12_0),
        .Q(data_shift_reg_r_13_n_0),
        .R(s_axi_aresetn_0));
  FDRE data_shift_reg_r_2
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(data_shift_reg_r_1_n_0),
        .Q(data_shift_reg_r_2_n_0),
        .R(s_axi_aresetn_0));
  FDRE data_shift_reg_r_3
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(data_shift_reg_r_2_n_0),
        .Q(data_shift_reg_r_3_n_0),
        .R(s_axi_aresetn_0));
  FDRE data_shift_reg_r_4
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(data_shift_reg_r_3_n_0),
        .Q(data_shift_reg_r_4_n_0),
        .R(s_axi_aresetn_0));
  FDRE data_shift_reg_r_5
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(data_shift_reg_r_4_n_0),
        .Q(data_shift_reg_r_5_n_0),
        .R(s_axi_aresetn_0));
  FDRE data_shift_reg_r_6
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(data_shift_reg_r_5_n_0),
        .Q(data_shift_reg_r_6_n_0),
        .R(s_axi_aresetn_0));
  FDRE data_shift_reg_r_7
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(data_shift_reg_r_6_n_0),
        .Q(data_shift_reg_r_7_n_0),
        .R(s_axi_aresetn_0));
  FDRE data_shift_reg_r_8
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(data_shift_reg_r_7_n_0),
        .Q(data_shift_reg_r_8_n_0),
        .R(s_axi_aresetn_0));
  FDRE data_shift_reg_r_9
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(data_shift_reg_r_8_n_0),
        .Q(data_shift_reg_r_9_n_0),
        .R(s_axi_aresetn_0));
  FDRE fifo_Write_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(fifo_Write0),
        .Q(fifo_Write),
        .R(s_axi_aresetn_0));
  FDRE frame_err_ocrd_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(INPUT_DOUBLE_REGS3_n_3),
        .Q(frame_err_ocrd),
        .R(s_axi_aresetn_0));
  LUT5 #(
    .INIT(32'hF7FFF000)) 
    running_i_1
       (.I0(sample_Point),
        .I1(stop_Bit_Position_reg_n_0),
        .I2(start_Edge_Detected),
        .I3(en_16x_Baud),
        .I4(running_reg_n_0),
        .O(running_i_1_n_0));
  FDRE running_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(running_i_1_n_0),
        .Q(running_reg_n_0),
        .R(s_axi_aresetn_0));
  FDRE rx_1_reg
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(RX_D2),
        .Q(rx_1),
        .R(s_axi_aresetn_0));
  FDRE rx_2_reg
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(rx_1),
        .Q(rx_2),
        .R(s_axi_aresetn_0));
  FDRE rx_3_reg
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(rx_2),
        .Q(rx_3),
        .R(s_axi_aresetn_0));
  FDRE rx_4_reg
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(rx_3),
        .Q(rx_4),
        .R(s_axi_aresetn_0));
  FDRE rx_5_reg
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(rx_4),
        .Q(rx_5),
        .R(s_axi_aresetn_0));
  FDRE rx_6_reg
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(rx_5),
        .Q(rx_6),
        .R(s_axi_aresetn_0));
  FDRE rx_7_reg
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(rx_6),
        .Q(rx_7),
        .R(s_axi_aresetn_0));
  FDRE rx_8_reg
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(rx_7),
        .Q(rx_8),
        .R(s_axi_aresetn_0));
  FDRE rx_9_reg
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(rx_8),
        .Q(rx_9),
        .R(s_axi_aresetn_0));
  LUT6 #(
    .INIT(64'h0000001000000000)) 
    start_Edge_Detected_i_1
       (.I0(rx_7),
        .I1(rx_5),
        .I2(start_Edge_Detected_i_2_n_0),
        .I3(rx_4),
        .I4(rx_6),
        .I5(rx_9),
        .O(start_Edge_Detected0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    start_Edge_Detected_i_2
       (.I0(frame_err_ocrd),
        .I1(rx_8),
        .I2(rx_2),
        .I3(rx_3),
        .I4(rx_1),
        .I5(running_reg_n_0),
        .O(start_Edge_Detected_i_2_n_0));
  FDRE start_Edge_Detected_reg
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(start_Edge_Detected0),
        .Q(start_Edge_Detected),
        .R(s_axi_aresetn_0));
  LUT4 #(
    .INIT(16'h38F0)) 
    stop_Bit_Position_i_1
       (.I0(fifo_din[8]),
        .I1(en_16x_Baud),
        .I2(stop_Bit_Position_reg_n_0),
        .I3(sample_Point),
        .O(stop_Bit_Position_i_1_n_0));
  FDRE stop_Bit_Position_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(stop_Bit_Position_i_1_n_0),
        .Q(stop_Bit_Position_reg_n_0),
        .R(s_axi_aresetn_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    valid_rx_i_1
       (.I0(start_Edge_Detected),
        .I1(fifo_Write),
        .I2(valid_rx),
        .O(valid_rx_i_1_n_0));
  FDRE valid_rx_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(valid_rx_i_1_n_0),
        .Q(valid_rx),
        .R(s_axi_aresetn_0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_uartlite_tx
   (FIFO_Full_reg,
    tx,
    Q,
    Interrupt0,
    s_axi_aclk,
    \data_shift_reg[15]_0 ,
    en_16x_Baud,
    \data_shift_reg[15]_1 ,
    \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ,
    Bus_RNW_reg,
    fifo_wr,
    enable_interrupts,
    tx_Buffer_Empty_Pre,
    Interrupt_reg,
    rx_Data_Present_Pre,
    \INFERRED_GEN.cnt_i_reg[0] ,
    s_axi_aresetn,
    s_axi_wdata);
  output FIFO_Full_reg;
  output tx;
  output [0:0]Q;
  output Interrupt0;
  input s_axi_aclk;
  input \data_shift_reg[15]_0 ;
  input en_16x_Baud;
  input \data_shift_reg[15]_1 ;
  input \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ;
  input Bus_RNW_reg;
  input fifo_wr;
  input enable_interrupts;
  input tx_Buffer_Empty_Pre;
  input [0:0]Interrupt_reg;
  input rx_Data_Present_Pre;
  input \INFERRED_GEN.cnt_i_reg[0] ;
  input s_axi_aresetn;
  input [7:0]s_axi_wdata;

  wire Bus_RNW_reg;
  wire FIFO_Full_reg;
  wire \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ;
  wire \INFERRED_GEN.cnt_i_reg[0] ;
  wire Interrupt0;
  wire [0:0]Interrupt_reg;
  wire [0:0]Q;
  wire SRL_FIFO_I_n_4;
  wire TX0;
  wire \data_shift_reg[13]_srl13___UARTLITE_CORE_I_UARTLITE_RX_I_data_shift_reg_r_11_n_0 ;
  wire \data_shift_reg[14]_UARTLITE_CORE_I_UARTLITE_RX_I_data_shift_reg_r_12_n_0 ;
  wire \data_shift_reg[15]_0 ;
  wire \data_shift_reg[15]_1 ;
  wire data_shift_reg_gate_n_0;
  wire div16;
  wire en_16x_Baud;
  wire enable_interrupts;
  wire fifo_Read;
  wire fifo_Read0;
  wire fifo_wr;
  wire mux_Out;
  wire \mux_sel[0]_i_1_n_0 ;
  wire \mux_sel[1]_i_1_n_0 ;
  wire \mux_sel[2]_i_1_n_0 ;
  wire \mux_sel_reg_n_0_[0] ;
  wire \mux_sel_reg_n_0_[2] ;
  wire [1:1]p_0_in;
  wire p_5_in;
  wire rx_Data_Present_Pre;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire [7:0]s_axi_wdata;
  wire serial_Data;
  wire tx;
  wire tx_Buffer_Empty_Pre;
  wire tx_DataBits;
  wire tx_DataBits0;
  wire tx_Data_Enable_i_1_n_0;
  wire tx_Data_Enable_reg_n_0;
  wire tx_Start;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_f SRL_FIFO_I
       (.Bus_RNW_reg(Bus_RNW_reg),
        .FIFO_Full_reg(FIFO_Full_reg),
        .\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg (\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg ),
        .\INFERRED_GEN.cnt_i_reg[0] (\INFERRED_GEN.cnt_i_reg[0] ),
        .Interrupt0(Interrupt0),
        .Interrupt_reg(Interrupt_reg),
        .Q(Q),
        .enable_interrupts(enable_interrupts),
        .fifo_Read(fifo_Read),
        .fifo_wr(fifo_wr),
        .mux_Out(mux_Out),
        .p_5_in(p_5_in),
        .rx_Data_Present_Pre(rx_Data_Present_Pre),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_wdata(s_axi_wdata),
        .serial_Data_reg(\mux_sel_reg_n_0_[0] ),
        .serial_Data_reg_0(\mux_sel_reg_n_0_[2] ),
        .tx_Buffer_Empty_Pre(tx_Buffer_Empty_Pre),
        .tx_DataBits(tx_DataBits),
        .tx_Data_Enable_reg(SRL_FIFO_I_n_4),
        .tx_Start(tx_Start),
        .tx_Start_reg(tx_Data_Enable_reg_n_0));
  LUT3 #(
    .INIT(8'h0D)) 
    TX_i_1
       (.I0(tx_DataBits),
        .I1(serial_Data),
        .I2(tx_Start),
        .O(TX0));
  FDSE TX_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(TX0),
        .Q(tx),
        .S(\data_shift_reg[15]_0 ));
  FDSE \data_shift_reg[0] 
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(div16),
        .Q(p_0_in),
        .S(\data_shift_reg[15]_0 ));
  (* srl_bus_name = "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/data_shift_reg " *) 
  (* srl_name = "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/data_shift_reg[13]_srl13___UARTLITE_CORE_I_UARTLITE_RX_I_data_shift_reg_r_11 " *) 
  SRL16E \data_shift_reg[13]_srl13___UARTLITE_CORE_I_UARTLITE_RX_I_data_shift_reg_r_11 
       (.A0(1'b0),
        .A1(1'b0),
        .A2(1'b1),
        .A3(1'b1),
        .CE(en_16x_Baud),
        .CLK(s_axi_aclk),
        .D(p_0_in),
        .Q(\data_shift_reg[13]_srl13___UARTLITE_CORE_I_UARTLITE_RX_I_data_shift_reg_r_11_n_0 ));
  FDRE \data_shift_reg[14]_UARTLITE_CORE_I_UARTLITE_RX_I_data_shift_reg_r_12 
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(\data_shift_reg[13]_srl13___UARTLITE_CORE_I_UARTLITE_RX_I_data_shift_reg_r_11_n_0 ),
        .Q(\data_shift_reg[14]_UARTLITE_CORE_I_UARTLITE_RX_I_data_shift_reg_r_12_n_0 ),
        .R(1'b0));
  FDRE \data_shift_reg[15] 
       (.C(s_axi_aclk),
        .CE(en_16x_Baud),
        .D(data_shift_reg_gate_n_0),
        .Q(div16),
        .R(\data_shift_reg[15]_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    data_shift_reg_gate
       (.I0(\data_shift_reg[14]_UARTLITE_CORE_I_UARTLITE_RX_I_data_shift_reg_r_12_n_0 ),
        .I1(\data_shift_reg[15]_1 ),
        .O(data_shift_reg_gate_n_0));
  LUT4 #(
    .INIT(16'h0002)) 
    fifo_Read_i_1
       (.I0(tx_Data_Enable_reg_n_0),
        .I1(p_5_in),
        .I2(\mux_sel_reg_n_0_[2] ),
        .I3(\mux_sel_reg_n_0_[0] ),
        .O(fifo_Read0));
  FDRE fifo_Read_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(fifo_Read0),
        .Q(fifo_Read),
        .R(\data_shift_reg[15]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'hF0F0F07A)) 
    \mux_sel[0]_i_1 
       (.I0(tx_Data_Enable_reg_n_0),
        .I1(tx_DataBits),
        .I2(\mux_sel_reg_n_0_[0] ),
        .I3(\mux_sel_reg_n_0_[2] ),
        .I4(p_5_in),
        .O(\mux_sel[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'hFF77008A)) 
    \mux_sel[1]_i_1 
       (.I0(tx_Data_Enable_reg_n_0),
        .I1(tx_DataBits),
        .I2(\mux_sel_reg_n_0_[0] ),
        .I3(\mux_sel_reg_n_0_[2] ),
        .I4(p_5_in),
        .O(\mux_sel[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h7788778A)) 
    \mux_sel[2]_i_1 
       (.I0(tx_Data_Enable_reg_n_0),
        .I1(tx_DataBits),
        .I2(\mux_sel_reg_n_0_[0] ),
        .I3(\mux_sel_reg_n_0_[2] ),
        .I4(p_5_in),
        .O(\mux_sel[2]_i_1_n_0 ));
  FDSE \mux_sel_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\mux_sel[0]_i_1_n_0 ),
        .Q(\mux_sel_reg_n_0_[0] ),
        .S(\data_shift_reg[15]_0 ));
  FDSE \mux_sel_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\mux_sel[1]_i_1_n_0 ),
        .Q(p_5_in),
        .S(\data_shift_reg[15]_0 ));
  FDSE \mux_sel_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\mux_sel[2]_i_1_n_0 ),
        .Q(\mux_sel_reg_n_0_[2] ),
        .S(\data_shift_reg[15]_0 ));
  FDRE serial_Data_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(mux_Out),
        .Q(serial_Data),
        .R(\data_shift_reg[15]_0 ));
  LUT4 #(
    .INIT(16'h00F8)) 
    tx_DataBits_i_1
       (.I0(tx_Start),
        .I1(tx_Data_Enable_reg_n_0),
        .I2(tx_DataBits),
        .I3(fifo_Read),
        .O(tx_DataBits0));
  FDRE tx_DataBits_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(tx_DataBits0),
        .Q(tx_DataBits),
        .R(\data_shift_reg[15]_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    tx_Data_Enable_i_1
       (.I0(div16),
        .I1(tx_Data_Enable_reg_n_0),
        .I2(en_16x_Baud),
        .O(tx_Data_Enable_i_1_n_0));
  FDRE tx_Data_Enable_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(tx_Data_Enable_i_1_n_0),
        .Q(tx_Data_Enable_reg_n_0),
        .R(\data_shift_reg[15]_0 ));
  FDRE tx_Start_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(SRL_FIFO_I_n_4),
        .Q(tx_Start),
        .R(\data_shift_reg[15]_0 ));
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
