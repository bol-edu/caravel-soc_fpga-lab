-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
-- Date        : Fri Jun  2 19:19:43 2023
-- Host        : josh-All-Series running 64-bit Ubuntu 20.04.3 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_caravel_ps_0_0_sim_netlist.vhdl
-- Design      : design_1_caravel_ps_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_caravel_ps_control_s_axi is
  port (
    s_axi_control_BVALID : out STD_LOGIC;
    \FSM_onehot_wstate_reg[2]_0\ : out STD_LOGIC;
    \FSM_onehot_wstate_reg[1]_0\ : out STD_LOGIC;
    s_axi_control_RVALID : out STD_LOGIC;
    \FSM_onehot_rstate_reg[1]_0\ : out STD_LOGIC;
    s_axi_control_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mprj_in : out STD_LOGIC_VECTOR ( 37 downto 0 );
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    s_axi_control_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    mprj_out : in STD_LOGIC_VECTOR ( 37 downto 0 );
    mprj_en : in STD_LOGIC_VECTOR ( 37 downto 0 );
    s_axi_control_AWVALID : in STD_LOGIC;
    s_axi_control_BREADY : in STD_LOGIC;
    s_axi_control_WVALID : in STD_LOGIC;
    s_axi_control_ARVALID : in STD_LOGIC;
    s_axi_control_RREADY : in STD_LOGIC;
    s_axi_control_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_control_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_caravel_ps_control_s_axi;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_caravel_ps_control_s_axi is
  signal \FSM_onehot_rstate[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_rstate[2]_i_1_n_0\ : STD_LOGIC;
  signal \^fsm_onehot_rstate_reg[1]_0\ : STD_LOGIC;
  signal \FSM_onehot_wstate[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_wstate[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_wstate[3]_i_1_n_0\ : STD_LOGIC;
  signal \^fsm_onehot_wstate_reg[1]_0\ : STD_LOGIC;
  signal \^fsm_onehot_wstate_reg[2]_0\ : STD_LOGIC;
  signal ap_rst_n_inv : STD_LOGIC;
  signal ar_hs : STD_LOGIC;
  signal data3 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal data6 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \int_ps_mprj_en_reg_n_0_[0]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[10]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[11]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[12]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[13]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[14]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[15]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[16]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[17]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[18]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[19]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[1]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[20]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[21]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[22]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[23]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[24]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[25]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[26]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[27]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[28]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[29]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[2]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[30]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[31]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[3]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[4]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[5]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[6]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[7]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[8]\ : STD_LOGIC;
  signal \int_ps_mprj_en_reg_n_0_[9]\ : STD_LOGIC;
  signal int_ps_mprj_in : STD_LOGIC;
  signal int_ps_mprj_in3_out : STD_LOGIC;
  signal \int_ps_mprj_in[0]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[10]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[11]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[12]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[13]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[14]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[15]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[16]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[17]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[18]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[19]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[1]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[20]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[21]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[22]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[23]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[24]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[25]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[26]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[27]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[28]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[29]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[2]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[30]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[31]_i_2_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[31]_i_3_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[32]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[33]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[34]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[35]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[36]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[37]_i_2_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[3]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[4]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[5]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[6]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[7]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[8]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in[9]_i_1_n_0\ : STD_LOGIC;
  signal \int_ps_mprj_in_reg_n_0_[0]\ : STD_LOGIC;
  signal \int_ps_mprj_in_reg_n_0_[37]\ : STD_LOGIC;
  signal int_ps_mprj_out_ap_vld : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[0]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[10]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[11]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[12]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[13]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[14]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[15]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[16]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[17]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[18]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[19]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[1]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[20]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[21]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[22]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[23]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[24]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[25]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[26]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[27]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[28]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[29]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[2]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[30]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[31]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[3]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[4]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[5]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[6]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[7]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[8]\ : STD_LOGIC;
  signal \int_ps_mprj_out_reg_n_0_[9]\ : STD_LOGIC;
  signal rdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \rdata[0]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[0]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[0]_i_4_n_0\ : STD_LOGIC;
  signal \rdata[0]_i_5_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[2]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[2]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[31]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[31]_i_4_n_0\ : STD_LOGIC;
  signal \rdata[31]_i_5_n_0\ : STD_LOGIC;
  signal \rdata[3]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[3]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[4]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[4]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[5]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[5]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[5]_i_4_n_0\ : STD_LOGIC;
  signal \rdata[5]_i_5_n_0\ : STD_LOGIC;
  signal \rdata[5]_i_6_n_0\ : STD_LOGIC;
  signal \^s_axi_control_bvalid\ : STD_LOGIC;
  signal \^s_axi_control_rvalid\ : STD_LOGIC;
  signal tmp_100_fu_1263_p3 : STD_LOGIC;
  signal tmp_103_fu_1295_p3 : STD_LOGIC;
  signal tmp_106_fu_1327_p3 : STD_LOGIC;
  signal tmp_10_fu_303_p3 : STD_LOGIC;
  signal tmp_13_fu_335_p3 : STD_LOGIC;
  signal tmp_16_fu_367_p3 : STD_LOGIC;
  signal tmp_19_fu_399_p3 : STD_LOGIC;
  signal tmp_1_fu_207_p3 : STD_LOGIC;
  signal tmp_22_fu_431_p3 : STD_LOGIC;
  signal tmp_25_fu_463_p3 : STD_LOGIC;
  signal tmp_28_fu_495_p3 : STD_LOGIC;
  signal tmp_31_fu_527_p3 : STD_LOGIC;
  signal tmp_34_fu_559_p3 : STD_LOGIC;
  signal tmp_37_fu_591_p3 : STD_LOGIC;
  signal tmp_40_fu_623_p3 : STD_LOGIC;
  signal tmp_43_fu_655_p3 : STD_LOGIC;
  signal tmp_46_fu_687_p3 : STD_LOGIC;
  signal tmp_49_fu_719_p3 : STD_LOGIC;
  signal tmp_4_fu_239_p3 : STD_LOGIC;
  signal tmp_52_fu_751_p3 : STD_LOGIC;
  signal tmp_55_fu_783_p3 : STD_LOGIC;
  signal tmp_58_fu_815_p3 : STD_LOGIC;
  signal tmp_61_fu_847_p3 : STD_LOGIC;
  signal tmp_64_fu_879_p3 : STD_LOGIC;
  signal tmp_67_fu_911_p3 : STD_LOGIC;
  signal tmp_70_fu_943_p3 : STD_LOGIC;
  signal tmp_73_fu_975_p3 : STD_LOGIC;
  signal tmp_76_fu_1007_p3 : STD_LOGIC;
  signal tmp_79_fu_1039_p3 : STD_LOGIC;
  signal tmp_7_fu_271_p3 : STD_LOGIC;
  signal tmp_82_fu_1071_p3 : STD_LOGIC;
  signal tmp_85_fu_1103_p3 : STD_LOGIC;
  signal tmp_88_fu_1135_p3 : STD_LOGIC;
  signal tmp_91_fu_1167_p3 : STD_LOGIC;
  signal tmp_94_fu_1199_p3 : STD_LOGIC;
  signal tmp_97_fu_1231_p3 : STD_LOGIC;
  signal waddr : STD_LOGIC;
  signal \waddr_reg_n_0_[0]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[1]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[2]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[3]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[4]\ : STD_LOGIC;
  signal \waddr_reg_n_0_[5]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_rstate[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_onehot_rstate[2]_i_1\ : label is "soft_lutpair0";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_rstate_reg[1]\ : label is "RDIDLE:010,RDDATA:100,iSTATE:001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_rstate_reg[2]\ : label is "RDIDLE:010,RDDATA:100,iSTATE:001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_wstate_reg[1]\ : label is "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_wstate_reg[2]\ : label is "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_wstate_reg[3]\ : label is "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[0]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[10]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[11]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[12]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[13]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[14]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[15]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[16]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[17]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[18]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[19]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[1]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[20]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[21]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[22]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[23]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[24]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[25]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[26]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[27]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[28]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[29]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[2]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[30]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[31]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[32]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[33]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[34]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[35]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[36]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[37]_i_2\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[3]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[4]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[5]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[6]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[7]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[8]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \int_ps_mprj_in[9]_i_1\ : label is "soft_lutpair12";
begin
  \FSM_onehot_rstate_reg[1]_0\ <= \^fsm_onehot_rstate_reg[1]_0\;
  \FSM_onehot_wstate_reg[1]_0\ <= \^fsm_onehot_wstate_reg[1]_0\;
  \FSM_onehot_wstate_reg[2]_0\ <= \^fsm_onehot_wstate_reg[2]_0\;
  s_axi_control_BVALID <= \^s_axi_control_bvalid\;
  s_axi_control_RVALID <= \^s_axi_control_rvalid\;
\FSM_onehot_rstate[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F747"
    )
        port map (
      I0 => s_axi_control_ARVALID,
      I1 => \^fsm_onehot_rstate_reg[1]_0\,
      I2 => \^s_axi_control_rvalid\,
      I3 => s_axi_control_RREADY,
      O => \FSM_onehot_rstate[1]_i_1_n_0\
    );
\FSM_onehot_rstate[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => s_axi_control_ARVALID,
      I1 => \^fsm_onehot_rstate_reg[1]_0\,
      I2 => s_axi_control_RREADY,
      I3 => \^s_axi_control_rvalid\,
      O => \FSM_onehot_rstate[2]_i_1_n_0\
    );
\FSM_onehot_rstate_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \FSM_onehot_rstate[1]_i_1_n_0\,
      Q => \^fsm_onehot_rstate_reg[1]_0\,
      R => ap_rst_n_inv
    );
\FSM_onehot_rstate_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \FSM_onehot_rstate[2]_i_1_n_0\,
      Q => \^s_axi_control_rvalid\,
      R => ap_rst_n_inv
    );
\FSM_onehot_wstate[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ap_rst_n,
      O => ap_rst_n_inv
    );
\FSM_onehot_wstate[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8F888FBB"
    )
        port map (
      I0 => s_axi_control_BREADY,
      I1 => \^s_axi_control_bvalid\,
      I2 => s_axi_control_AWVALID,
      I3 => \^fsm_onehot_wstate_reg[1]_0\,
      I4 => \^fsm_onehot_wstate_reg[2]_0\,
      O => \FSM_onehot_wstate[1]_i_2_n_0\
    );
\FSM_onehot_wstate[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88F8"
    )
        port map (
      I0 => s_axi_control_AWVALID,
      I1 => \^fsm_onehot_wstate_reg[1]_0\,
      I2 => \^fsm_onehot_wstate_reg[2]_0\,
      I3 => s_axi_control_WVALID,
      O => \FSM_onehot_wstate[2]_i_1_n_0\
    );
\FSM_onehot_wstate[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F444"
    )
        port map (
      I0 => s_axi_control_BREADY,
      I1 => \^s_axi_control_bvalid\,
      I2 => s_axi_control_WVALID,
      I3 => \^fsm_onehot_wstate_reg[2]_0\,
      O => \FSM_onehot_wstate[3]_i_1_n_0\
    );
\FSM_onehot_wstate_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \FSM_onehot_wstate[1]_i_2_n_0\,
      Q => \^fsm_onehot_wstate_reg[1]_0\,
      R => ap_rst_n_inv
    );
\FSM_onehot_wstate_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \FSM_onehot_wstate[2]_i_1_n_0\,
      Q => \^fsm_onehot_wstate_reg[2]_0\,
      R => ap_rst_n_inv
    );
\FSM_onehot_wstate_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \FSM_onehot_wstate[3]_i_1_n_0\,
      Q => \^s_axi_control_bvalid\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(0),
      Q => \int_ps_mprj_en_reg_n_0_[0]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(10),
      Q => \int_ps_mprj_en_reg_n_0_[10]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(11),
      Q => \int_ps_mprj_en_reg_n_0_[11]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(12),
      Q => \int_ps_mprj_en_reg_n_0_[12]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(13),
      Q => \int_ps_mprj_en_reg_n_0_[13]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(14),
      Q => \int_ps_mprj_en_reg_n_0_[14]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(15),
      Q => \int_ps_mprj_en_reg_n_0_[15]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(16),
      Q => \int_ps_mprj_en_reg_n_0_[16]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(17),
      Q => \int_ps_mprj_en_reg_n_0_[17]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(18),
      Q => \int_ps_mprj_en_reg_n_0_[18]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(19),
      Q => \int_ps_mprj_en_reg_n_0_[19]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(1),
      Q => \int_ps_mprj_en_reg_n_0_[1]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(20),
      Q => \int_ps_mprj_en_reg_n_0_[20]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(21),
      Q => \int_ps_mprj_en_reg_n_0_[21]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(22),
      Q => \int_ps_mprj_en_reg_n_0_[22]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(23),
      Q => \int_ps_mprj_en_reg_n_0_[23]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(24),
      Q => \int_ps_mprj_en_reg_n_0_[24]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(25),
      Q => \int_ps_mprj_en_reg_n_0_[25]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(26),
      Q => \int_ps_mprj_en_reg_n_0_[26]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(27),
      Q => \int_ps_mprj_en_reg_n_0_[27]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(28),
      Q => \int_ps_mprj_en_reg_n_0_[28]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(29),
      Q => \int_ps_mprj_en_reg_n_0_[29]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(2),
      Q => \int_ps_mprj_en_reg_n_0_[2]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(30),
      Q => \int_ps_mprj_en_reg_n_0_[30]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(31),
      Q => \int_ps_mprj_en_reg_n_0_[31]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(32),
      Q => data6(0),
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(33),
      Q => data6(1),
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(34),
      Q => data6(2),
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(35),
      Q => data6(3),
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(36),
      Q => data6(4),
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(37),
      Q => data6(5),
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(3),
      Q => \int_ps_mprj_en_reg_n_0_[3]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(4),
      Q => \int_ps_mprj_en_reg_n_0_[4]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(5),
      Q => \int_ps_mprj_en_reg_n_0_[5]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(6),
      Q => \int_ps_mprj_en_reg_n_0_[6]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(7),
      Q => \int_ps_mprj_en_reg_n_0_[7]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(8),
      Q => \int_ps_mprj_en_reg_n_0_[8]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_en_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_en(9),
      Q => \int_ps_mprj_en_reg_n_0_[9]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(0),
      I1 => s_axi_control_WSTRB(0),
      I2 => \int_ps_mprj_in_reg_n_0_[0]\,
      O => \int_ps_mprj_in[0]_i_1_n_0\
    );
\int_ps_mprj_in[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(10),
      I1 => s_axi_control_WSTRB(1),
      I2 => tmp_28_fu_495_p3,
      O => \int_ps_mprj_in[10]_i_1_n_0\
    );
\int_ps_mprj_in[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(11),
      I1 => s_axi_control_WSTRB(1),
      I2 => tmp_31_fu_527_p3,
      O => \int_ps_mprj_in[11]_i_1_n_0\
    );
\int_ps_mprj_in[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(12),
      I1 => s_axi_control_WSTRB(1),
      I2 => tmp_34_fu_559_p3,
      O => \int_ps_mprj_in[12]_i_1_n_0\
    );
\int_ps_mprj_in[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(13),
      I1 => s_axi_control_WSTRB(1),
      I2 => tmp_37_fu_591_p3,
      O => \int_ps_mprj_in[13]_i_1_n_0\
    );
\int_ps_mprj_in[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(14),
      I1 => s_axi_control_WSTRB(1),
      I2 => tmp_40_fu_623_p3,
      O => \int_ps_mprj_in[14]_i_1_n_0\
    );
\int_ps_mprj_in[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(15),
      I1 => s_axi_control_WSTRB(1),
      I2 => tmp_43_fu_655_p3,
      O => \int_ps_mprj_in[15]_i_1_n_0\
    );
\int_ps_mprj_in[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(16),
      I1 => s_axi_control_WSTRB(2),
      I2 => tmp_46_fu_687_p3,
      O => \int_ps_mprj_in[16]_i_1_n_0\
    );
\int_ps_mprj_in[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(17),
      I1 => s_axi_control_WSTRB(2),
      I2 => tmp_49_fu_719_p3,
      O => \int_ps_mprj_in[17]_i_1_n_0\
    );
\int_ps_mprj_in[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(18),
      I1 => s_axi_control_WSTRB(2),
      I2 => tmp_52_fu_751_p3,
      O => \int_ps_mprj_in[18]_i_1_n_0\
    );
\int_ps_mprj_in[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(19),
      I1 => s_axi_control_WSTRB(2),
      I2 => tmp_55_fu_783_p3,
      O => \int_ps_mprj_in[19]_i_1_n_0\
    );
\int_ps_mprj_in[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(1),
      I1 => s_axi_control_WSTRB(0),
      I2 => tmp_1_fu_207_p3,
      O => \int_ps_mprj_in[1]_i_1_n_0\
    );
\int_ps_mprj_in[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(20),
      I1 => s_axi_control_WSTRB(2),
      I2 => tmp_58_fu_815_p3,
      O => \int_ps_mprj_in[20]_i_1_n_0\
    );
\int_ps_mprj_in[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(21),
      I1 => s_axi_control_WSTRB(2),
      I2 => tmp_61_fu_847_p3,
      O => \int_ps_mprj_in[21]_i_1_n_0\
    );
\int_ps_mprj_in[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(22),
      I1 => s_axi_control_WSTRB(2),
      I2 => tmp_64_fu_879_p3,
      O => \int_ps_mprj_in[22]_i_1_n_0\
    );
\int_ps_mprj_in[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(23),
      I1 => s_axi_control_WSTRB(2),
      I2 => tmp_67_fu_911_p3,
      O => \int_ps_mprj_in[23]_i_1_n_0\
    );
\int_ps_mprj_in[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(24),
      I1 => s_axi_control_WSTRB(3),
      I2 => tmp_70_fu_943_p3,
      O => \int_ps_mprj_in[24]_i_1_n_0\
    );
\int_ps_mprj_in[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(25),
      I1 => s_axi_control_WSTRB(3),
      I2 => tmp_73_fu_975_p3,
      O => \int_ps_mprj_in[25]_i_1_n_0\
    );
\int_ps_mprj_in[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(26),
      I1 => s_axi_control_WSTRB(3),
      I2 => tmp_76_fu_1007_p3,
      O => \int_ps_mprj_in[26]_i_1_n_0\
    );
\int_ps_mprj_in[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(27),
      I1 => s_axi_control_WSTRB(3),
      I2 => tmp_79_fu_1039_p3,
      O => \int_ps_mprj_in[27]_i_1_n_0\
    );
\int_ps_mprj_in[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(28),
      I1 => s_axi_control_WSTRB(3),
      I2 => tmp_82_fu_1071_p3,
      O => \int_ps_mprj_in[28]_i_1_n_0\
    );
\int_ps_mprj_in[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(29),
      I1 => s_axi_control_WSTRB(3),
      I2 => tmp_85_fu_1103_p3,
      O => \int_ps_mprj_in[29]_i_1_n_0\
    );
\int_ps_mprj_in[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(2),
      I1 => s_axi_control_WSTRB(0),
      I2 => tmp_4_fu_239_p3,
      O => \int_ps_mprj_in[2]_i_1_n_0\
    );
\int_ps_mprj_in[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(30),
      I1 => s_axi_control_WSTRB(3),
      I2 => tmp_88_fu_1135_p3,
      O => \int_ps_mprj_in[30]_i_1_n_0\
    );
\int_ps_mprj_in[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^fsm_onehot_wstate_reg[2]_0\,
      I1 => \int_ps_mprj_in[31]_i_3_n_0\,
      I2 => \waddr_reg_n_0_[2]\,
      O => int_ps_mprj_in3_out
    );
\int_ps_mprj_in[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(31),
      I1 => s_axi_control_WSTRB(3),
      I2 => tmp_91_fu_1167_p3,
      O => \int_ps_mprj_in[31]_i_2_n_0\
    );
\int_ps_mprj_in[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001000000000"
    )
        port map (
      I0 => \waddr_reg_n_0_[1]\,
      I1 => \waddr_reg_n_0_[0]\,
      I2 => \waddr_reg_n_0_[4]\,
      I3 => \waddr_reg_n_0_[3]\,
      I4 => \waddr_reg_n_0_[5]\,
      I5 => s_axi_control_WVALID,
      O => \int_ps_mprj_in[31]_i_3_n_0\
    );
\int_ps_mprj_in[32]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(0),
      I1 => s_axi_control_WSTRB(0),
      I2 => tmp_94_fu_1199_p3,
      O => \int_ps_mprj_in[32]_i_1_n_0\
    );
\int_ps_mprj_in[33]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(1),
      I1 => s_axi_control_WSTRB(0),
      I2 => tmp_97_fu_1231_p3,
      O => \int_ps_mprj_in[33]_i_1_n_0\
    );
\int_ps_mprj_in[34]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(2),
      I1 => s_axi_control_WSTRB(0),
      I2 => tmp_100_fu_1263_p3,
      O => \int_ps_mprj_in[34]_i_1_n_0\
    );
\int_ps_mprj_in[35]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(3),
      I1 => s_axi_control_WSTRB(0),
      I2 => tmp_103_fu_1295_p3,
      O => \int_ps_mprj_in[35]_i_1_n_0\
    );
\int_ps_mprj_in[36]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(4),
      I1 => s_axi_control_WSTRB(0),
      I2 => tmp_106_fu_1327_p3,
      O => \int_ps_mprj_in[36]_i_1_n_0\
    );
\int_ps_mprj_in[37]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \^fsm_onehot_wstate_reg[2]_0\,
      I1 => \int_ps_mprj_in[31]_i_3_n_0\,
      I2 => \waddr_reg_n_0_[2]\,
      O => int_ps_mprj_in
    );
\int_ps_mprj_in[37]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(5),
      I1 => s_axi_control_WSTRB(0),
      I2 => \int_ps_mprj_in_reg_n_0_[37]\,
      O => \int_ps_mprj_in[37]_i_2_n_0\
    );
\int_ps_mprj_in[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(3),
      I1 => s_axi_control_WSTRB(0),
      I2 => tmp_7_fu_271_p3,
      O => \int_ps_mprj_in[3]_i_1_n_0\
    );
\int_ps_mprj_in[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(4),
      I1 => s_axi_control_WSTRB(0),
      I2 => tmp_10_fu_303_p3,
      O => \int_ps_mprj_in[4]_i_1_n_0\
    );
\int_ps_mprj_in[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(5),
      I1 => s_axi_control_WSTRB(0),
      I2 => tmp_13_fu_335_p3,
      O => \int_ps_mprj_in[5]_i_1_n_0\
    );
\int_ps_mprj_in[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(6),
      I1 => s_axi_control_WSTRB(0),
      I2 => tmp_16_fu_367_p3,
      O => \int_ps_mprj_in[6]_i_1_n_0\
    );
\int_ps_mprj_in[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(7),
      I1 => s_axi_control_WSTRB(0),
      I2 => tmp_19_fu_399_p3,
      O => \int_ps_mprj_in[7]_i_1_n_0\
    );
\int_ps_mprj_in[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(8),
      I1 => s_axi_control_WSTRB(1),
      I2 => tmp_22_fu_431_p3,
      O => \int_ps_mprj_in[8]_i_1_n_0\
    );
\int_ps_mprj_in[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(9),
      I1 => s_axi_control_WSTRB(1),
      I2 => tmp_25_fu_463_p3,
      O => \int_ps_mprj_in[9]_i_1_n_0\
    );
\int_ps_mprj_in_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[0]_i_1_n_0\,
      Q => \int_ps_mprj_in_reg_n_0_[0]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[10]_i_1_n_0\,
      Q => tmp_28_fu_495_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[11]_i_1_n_0\,
      Q => tmp_31_fu_527_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[12]_i_1_n_0\,
      Q => tmp_34_fu_559_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[13]_i_1_n_0\,
      Q => tmp_37_fu_591_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[14]_i_1_n_0\,
      Q => tmp_40_fu_623_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[15]_i_1_n_0\,
      Q => tmp_43_fu_655_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[16]_i_1_n_0\,
      Q => tmp_46_fu_687_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[17]_i_1_n_0\,
      Q => tmp_49_fu_719_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[18]_i_1_n_0\,
      Q => tmp_52_fu_751_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[19]_i_1_n_0\,
      Q => tmp_55_fu_783_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[1]_i_1_n_0\,
      Q => tmp_1_fu_207_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[20]_i_1_n_0\,
      Q => tmp_58_fu_815_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[21]_i_1_n_0\,
      Q => tmp_61_fu_847_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[22]_i_1_n_0\,
      Q => tmp_64_fu_879_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[23]_i_1_n_0\,
      Q => tmp_67_fu_911_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[24]_i_1_n_0\,
      Q => tmp_70_fu_943_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[25]_i_1_n_0\,
      Q => tmp_73_fu_975_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[26]_i_1_n_0\,
      Q => tmp_76_fu_1007_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[27]_i_1_n_0\,
      Q => tmp_79_fu_1039_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[28]_i_1_n_0\,
      Q => tmp_82_fu_1071_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[29]_i_1_n_0\,
      Q => tmp_85_fu_1103_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[2]_i_1_n_0\,
      Q => tmp_4_fu_239_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[30]_i_1_n_0\,
      Q => tmp_88_fu_1135_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[31]_i_2_n_0\,
      Q => tmp_91_fu_1167_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in,
      D => \int_ps_mprj_in[32]_i_1_n_0\,
      Q => tmp_94_fu_1199_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in,
      D => \int_ps_mprj_in[33]_i_1_n_0\,
      Q => tmp_97_fu_1231_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in,
      D => \int_ps_mprj_in[34]_i_1_n_0\,
      Q => tmp_100_fu_1263_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in,
      D => \int_ps_mprj_in[35]_i_1_n_0\,
      Q => tmp_103_fu_1295_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in,
      D => \int_ps_mprj_in[36]_i_1_n_0\,
      Q => tmp_106_fu_1327_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in,
      D => \int_ps_mprj_in[37]_i_2_n_0\,
      Q => \int_ps_mprj_in_reg_n_0_[37]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[3]_i_1_n_0\,
      Q => tmp_7_fu_271_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[4]_i_1_n_0\,
      Q => tmp_10_fu_303_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[5]_i_1_n_0\,
      Q => tmp_13_fu_335_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[6]_i_1_n_0\,
      Q => tmp_16_fu_367_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[7]_i_1_n_0\,
      Q => tmp_19_fu_399_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[8]_i_1_n_0\,
      Q => tmp_22_fu_431_p3,
      R => ap_rst_n_inv
    );
\int_ps_mprj_in_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => int_ps_mprj_in3_out,
      D => \int_ps_mprj_in[9]_i_1_n_0\,
      Q => tmp_25_fu_463_p3,
      R => ap_rst_n_inv
    );
int_ps_mprj_out_ap_vld_reg: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => '1',
      Q => int_ps_mprj_out_ap_vld,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(0),
      Q => \int_ps_mprj_out_reg_n_0_[0]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(10),
      Q => \int_ps_mprj_out_reg_n_0_[10]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(11),
      Q => \int_ps_mprj_out_reg_n_0_[11]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(12),
      Q => \int_ps_mprj_out_reg_n_0_[12]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(13),
      Q => \int_ps_mprj_out_reg_n_0_[13]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(14),
      Q => \int_ps_mprj_out_reg_n_0_[14]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(15),
      Q => \int_ps_mprj_out_reg_n_0_[15]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(16),
      Q => \int_ps_mprj_out_reg_n_0_[16]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(17),
      Q => \int_ps_mprj_out_reg_n_0_[17]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(18),
      Q => \int_ps_mprj_out_reg_n_0_[18]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(19),
      Q => \int_ps_mprj_out_reg_n_0_[19]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(1),
      Q => \int_ps_mprj_out_reg_n_0_[1]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(20),
      Q => \int_ps_mprj_out_reg_n_0_[20]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(21),
      Q => \int_ps_mprj_out_reg_n_0_[21]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(22),
      Q => \int_ps_mprj_out_reg_n_0_[22]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(23),
      Q => \int_ps_mprj_out_reg_n_0_[23]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(24),
      Q => \int_ps_mprj_out_reg_n_0_[24]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(25),
      Q => \int_ps_mprj_out_reg_n_0_[25]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(26),
      Q => \int_ps_mprj_out_reg_n_0_[26]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(27),
      Q => \int_ps_mprj_out_reg_n_0_[27]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(28),
      Q => \int_ps_mprj_out_reg_n_0_[28]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(29),
      Q => \int_ps_mprj_out_reg_n_0_[29]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(2),
      Q => \int_ps_mprj_out_reg_n_0_[2]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(30),
      Q => \int_ps_mprj_out_reg_n_0_[30]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(31),
      Q => \int_ps_mprj_out_reg_n_0_[31]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(32),
      Q => data3(0),
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(33),
      Q => data3(1),
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(34),
      Q => data3(2),
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(35),
      Q => data3(3),
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(36),
      Q => data3(4),
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(37),
      Q => data3(5),
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(3),
      Q => \int_ps_mprj_out_reg_n_0_[3]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(4),
      Q => \int_ps_mprj_out_reg_n_0_[4]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(5),
      Q => \int_ps_mprj_out_reg_n_0_[5]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(6),
      Q => \int_ps_mprj_out_reg_n_0_[6]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(7),
      Q => \int_ps_mprj_out_reg_n_0_[7]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(8),
      Q => \int_ps_mprj_out_reg_n_0_[8]\,
      R => ap_rst_n_inv
    );
\int_ps_mprj_out_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => mprj_out(9),
      Q => \int_ps_mprj_out_reg_n_0_[9]\,
      R => ap_rst_n_inv
    );
\mprj_in[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(0),
      I1 => mprj_en(0),
      I2 => \int_ps_mprj_in_reg_n_0_[0]\,
      O => mprj_in(0)
    );
\mprj_in[10]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(10),
      I1 => mprj_en(10),
      I2 => tmp_28_fu_495_p3,
      O => mprj_in(10)
    );
\mprj_in[11]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(11),
      I1 => mprj_en(11),
      I2 => tmp_31_fu_527_p3,
      O => mprj_in(11)
    );
\mprj_in[12]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(12),
      I1 => mprj_en(12),
      I2 => tmp_34_fu_559_p3,
      O => mprj_in(12)
    );
\mprj_in[13]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(13),
      I1 => mprj_en(13),
      I2 => tmp_37_fu_591_p3,
      O => mprj_in(13)
    );
\mprj_in[14]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(14),
      I1 => mprj_en(14),
      I2 => tmp_40_fu_623_p3,
      O => mprj_in(14)
    );
\mprj_in[15]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(15),
      I1 => mprj_en(15),
      I2 => tmp_43_fu_655_p3,
      O => mprj_in(15)
    );
\mprj_in[16]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(16),
      I1 => mprj_en(16),
      I2 => tmp_46_fu_687_p3,
      O => mprj_in(16)
    );
\mprj_in[17]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(17),
      I1 => mprj_en(17),
      I2 => tmp_49_fu_719_p3,
      O => mprj_in(17)
    );
\mprj_in[18]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(18),
      I1 => mprj_en(18),
      I2 => tmp_52_fu_751_p3,
      O => mprj_in(18)
    );
\mprj_in[19]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(19),
      I1 => mprj_en(19),
      I2 => tmp_55_fu_783_p3,
      O => mprj_in(19)
    );
\mprj_in[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(1),
      I1 => mprj_en(1),
      I2 => tmp_1_fu_207_p3,
      O => mprj_in(1)
    );
\mprj_in[20]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(20),
      I1 => mprj_en(20),
      I2 => tmp_58_fu_815_p3,
      O => mprj_in(20)
    );
\mprj_in[21]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(21),
      I1 => mprj_en(21),
      I2 => tmp_61_fu_847_p3,
      O => mprj_in(21)
    );
\mprj_in[22]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(22),
      I1 => mprj_en(22),
      I2 => tmp_64_fu_879_p3,
      O => mprj_in(22)
    );
\mprj_in[23]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(23),
      I1 => mprj_en(23),
      I2 => tmp_67_fu_911_p3,
      O => mprj_in(23)
    );
\mprj_in[24]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(24),
      I1 => mprj_en(24),
      I2 => tmp_70_fu_943_p3,
      O => mprj_in(24)
    );
\mprj_in[25]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(25),
      I1 => mprj_en(25),
      I2 => tmp_73_fu_975_p3,
      O => mprj_in(25)
    );
\mprj_in[26]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(26),
      I1 => mprj_en(26),
      I2 => tmp_76_fu_1007_p3,
      O => mprj_in(26)
    );
\mprj_in[27]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(27),
      I1 => mprj_en(27),
      I2 => tmp_79_fu_1039_p3,
      O => mprj_in(27)
    );
\mprj_in[28]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(28),
      I1 => mprj_en(28),
      I2 => tmp_82_fu_1071_p3,
      O => mprj_in(28)
    );
\mprj_in[29]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(29),
      I1 => mprj_en(29),
      I2 => tmp_85_fu_1103_p3,
      O => mprj_in(29)
    );
\mprj_in[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(2),
      I1 => mprj_en(2),
      I2 => tmp_4_fu_239_p3,
      O => mprj_in(2)
    );
\mprj_in[30]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(30),
      I1 => mprj_en(30),
      I2 => tmp_88_fu_1135_p3,
      O => mprj_in(30)
    );
\mprj_in[31]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(31),
      I1 => mprj_en(31),
      I2 => tmp_91_fu_1167_p3,
      O => mprj_in(31)
    );
\mprj_in[32]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(32),
      I1 => mprj_en(32),
      I2 => tmp_94_fu_1199_p3,
      O => mprj_in(32)
    );
\mprj_in[33]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(33),
      I1 => mprj_en(33),
      I2 => tmp_97_fu_1231_p3,
      O => mprj_in(33)
    );
\mprj_in[34]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(34),
      I1 => mprj_en(34),
      I2 => tmp_100_fu_1263_p3,
      O => mprj_in(34)
    );
\mprj_in[35]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(35),
      I1 => mprj_en(35),
      I2 => tmp_103_fu_1295_p3,
      O => mprj_in(35)
    );
\mprj_in[36]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(36),
      I1 => mprj_en(36),
      I2 => tmp_106_fu_1327_p3,
      O => mprj_in(36)
    );
\mprj_in[37]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(37),
      I1 => mprj_en(37),
      I2 => \int_ps_mprj_in_reg_n_0_[37]\,
      O => mprj_in(37)
    );
\mprj_in[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(3),
      I1 => mprj_en(3),
      I2 => tmp_7_fu_271_p3,
      O => mprj_in(3)
    );
\mprj_in[4]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(4),
      I1 => mprj_en(4),
      I2 => tmp_10_fu_303_p3,
      O => mprj_in(4)
    );
\mprj_in[5]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(5),
      I1 => mprj_en(5),
      I2 => tmp_13_fu_335_p3,
      O => mprj_in(5)
    );
\mprj_in[6]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(6),
      I1 => mprj_en(6),
      I2 => tmp_16_fu_367_p3,
      O => mprj_in(6)
    );
\mprj_in[7]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(7),
      I1 => mprj_en(7),
      I2 => tmp_19_fu_399_p3,
      O => mprj_in(7)
    );
\mprj_in[8]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(8),
      I1 => mprj_en(8),
      I2 => tmp_22_fu_431_p3,
      O => mprj_in(8)
    );
\mprj_in[9]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mprj_out(9),
      I1 => mprj_en(9),
      I2 => tmp_25_fu_463_p3,
      O => mprj_in(9)
    );
\rdata[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \rdata[0]_i_2_n_0\,
      I1 => \rdata[0]_i_3_n_0\,
      I2 => \rdata[0]_i_4_n_0\,
      O => rdata(0)
    );
\rdata[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8008000000000000"
    )
        port map (
      I0 => \rdata[0]_i_5_n_0\,
      I1 => s_axi_control_ARADDR(5),
      I2 => s_axi_control_ARADDR(3),
      I3 => s_axi_control_ARADDR(4),
      I4 => int_ps_mprj_out_ap_vld,
      I5 => s_axi_control_ARADDR(2),
      O => \rdata[0]_i_2_n_0\
    );
\rdata[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => \int_ps_mprj_in_reg_n_0_[0]\,
      I2 => \rdata[5]_i_6_n_0\,
      I3 => tmp_94_fu_1199_p3,
      I4 => \int_ps_mprj_out_reg_n_0_[0]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => \rdata[0]_i_3_n_0\
    );
\rdata[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[5]_i_4_n_0\,
      I1 => data3(0),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[0]\,
      I4 => data6(0),
      I5 => \rdata[5]_i_5_n_0\,
      O => \rdata[0]_i_4_n_0\
    );
\rdata[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_control_ARADDR(0),
      I1 => s_axi_control_ARADDR(1),
      O => \rdata[0]_i_5_n_0\
    );
\rdata[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_28_fu_495_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[10]\,
      I4 => \int_ps_mprj_out_reg_n_0_[10]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(10)
    );
\rdata[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_31_fu_527_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[11]\,
      I4 => \int_ps_mprj_out_reg_n_0_[11]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(11)
    );
\rdata[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_34_fu_559_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[12]\,
      I4 => \int_ps_mprj_out_reg_n_0_[12]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(12)
    );
\rdata[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_37_fu_591_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[13]\,
      I4 => \int_ps_mprj_out_reg_n_0_[13]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(13)
    );
\rdata[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_40_fu_623_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[14]\,
      I4 => \int_ps_mprj_out_reg_n_0_[14]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(14)
    );
\rdata[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_43_fu_655_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[15]\,
      I4 => \int_ps_mprj_out_reg_n_0_[15]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(15)
    );
\rdata[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_46_fu_687_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[16]\,
      I4 => \int_ps_mprj_out_reg_n_0_[16]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(16)
    );
\rdata[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_49_fu_719_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[17]\,
      I4 => \int_ps_mprj_out_reg_n_0_[17]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(17)
    );
\rdata[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_52_fu_751_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[18]\,
      I4 => \int_ps_mprj_out_reg_n_0_[18]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(18)
    );
\rdata[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_55_fu_783_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[19]\,
      I4 => \int_ps_mprj_out_reg_n_0_[19]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(19)
    );
\rdata[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \rdata[1]_i_2_n_0\,
      I1 => \rdata[1]_i_3_n_0\,
      O => rdata(1)
    );
\rdata[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[5]_i_4_n_0\,
      I1 => data3(1),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[1]\,
      I4 => data6(1),
      I5 => \rdata[5]_i_5_n_0\,
      O => \rdata[1]_i_2_n_0\
    );
\rdata[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_1_fu_207_p3,
      I2 => \rdata[5]_i_6_n_0\,
      I3 => tmp_97_fu_1231_p3,
      I4 => \int_ps_mprj_out_reg_n_0_[1]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => \rdata[1]_i_3_n_0\
    );
\rdata[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_58_fu_815_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[20]\,
      I4 => \int_ps_mprj_out_reg_n_0_[20]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(20)
    );
\rdata[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_61_fu_847_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[21]\,
      I4 => \int_ps_mprj_out_reg_n_0_[21]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(21)
    );
\rdata[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_64_fu_879_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[22]\,
      I4 => \int_ps_mprj_out_reg_n_0_[22]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(22)
    );
\rdata[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_67_fu_911_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[23]\,
      I4 => \int_ps_mprj_out_reg_n_0_[23]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(23)
    );
\rdata[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_70_fu_943_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[24]\,
      I4 => \int_ps_mprj_out_reg_n_0_[24]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(24)
    );
\rdata[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_73_fu_975_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[25]\,
      I4 => \int_ps_mprj_out_reg_n_0_[25]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(25)
    );
\rdata[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_76_fu_1007_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[26]\,
      I4 => \int_ps_mprj_out_reg_n_0_[26]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(26)
    );
\rdata[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_79_fu_1039_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[27]\,
      I4 => \int_ps_mprj_out_reg_n_0_[27]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(27)
    );
\rdata[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_82_fu_1071_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[28]\,
      I4 => \int_ps_mprj_out_reg_n_0_[28]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(28)
    );
\rdata[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_85_fu_1103_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[29]\,
      I4 => \int_ps_mprj_out_reg_n_0_[29]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(29)
    );
\rdata[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \rdata[2]_i_2_n_0\,
      I1 => \rdata[2]_i_3_n_0\,
      O => rdata(2)
    );
\rdata[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[5]_i_4_n_0\,
      I1 => data3(2),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[2]\,
      I4 => data6(2),
      I5 => \rdata[5]_i_5_n_0\,
      O => \rdata[2]_i_2_n_0\
    );
\rdata[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_4_fu_239_p3,
      I2 => \rdata[5]_i_6_n_0\,
      I3 => tmp_100_fu_1263_p3,
      I4 => \int_ps_mprj_out_reg_n_0_[2]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => \rdata[2]_i_3_n_0\
    );
\rdata[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_88_fu_1135_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[30]\,
      I4 => \int_ps_mprj_out_reg_n_0_[30]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(30)
    );
\rdata[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_control_ARVALID,
      I1 => \^fsm_onehot_rstate_reg[1]_0\,
      O => ar_hs
    );
\rdata[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_91_fu_1167_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[31]\,
      I4 => \int_ps_mprj_out_reg_n_0_[31]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(31)
    );
\rdata[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000100"
    )
        port map (
      I0 => s_axi_control_ARADDR(2),
      I1 => s_axi_control_ARADDR(1),
      I2 => s_axi_control_ARADDR(0),
      I3 => s_axi_control_ARADDR(4),
      I4 => s_axi_control_ARADDR(5),
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[31]_i_3_n_0\
    );
\rdata[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000004000000000"
    )
        port map (
      I0 => s_axi_control_ARADDR(3),
      I1 => s_axi_control_ARADDR(5),
      I2 => s_axi_control_ARADDR(2),
      I3 => s_axi_control_ARADDR(1),
      I4 => s_axi_control_ARADDR(0),
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[31]_i_4_n_0\
    );
\rdata[31]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000080000"
    )
        port map (
      I0 => s_axi_control_ARADDR(3),
      I1 => s_axi_control_ARADDR(4),
      I2 => s_axi_control_ARADDR(0),
      I3 => s_axi_control_ARADDR(1),
      I4 => s_axi_control_ARADDR(2),
      I5 => s_axi_control_ARADDR(5),
      O => \rdata[31]_i_5_n_0\
    );
\rdata[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \rdata[3]_i_2_n_0\,
      I1 => \rdata[3]_i_3_n_0\,
      O => rdata(3)
    );
\rdata[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[5]_i_4_n_0\,
      I1 => data3(3),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[3]\,
      I4 => data6(3),
      I5 => \rdata[5]_i_5_n_0\,
      O => \rdata[3]_i_2_n_0\
    );
\rdata[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_7_fu_271_p3,
      I2 => \rdata[5]_i_6_n_0\,
      I3 => tmp_103_fu_1295_p3,
      I4 => \int_ps_mprj_out_reg_n_0_[3]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => \rdata[3]_i_3_n_0\
    );
\rdata[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \rdata[4]_i_2_n_0\,
      I1 => \rdata[4]_i_3_n_0\,
      O => rdata(4)
    );
\rdata[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[5]_i_4_n_0\,
      I1 => data3(4),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[4]\,
      I4 => data6(4),
      I5 => \rdata[5]_i_5_n_0\,
      O => \rdata[4]_i_2_n_0\
    );
\rdata[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_10_fu_303_p3,
      I2 => \rdata[5]_i_6_n_0\,
      I3 => tmp_106_fu_1327_p3,
      I4 => \int_ps_mprj_out_reg_n_0_[4]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => \rdata[4]_i_3_n_0\
    );
\rdata[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \rdata[5]_i_2_n_0\,
      I1 => \rdata[5]_i_3_n_0\,
      O => rdata(5)
    );
\rdata[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[5]_i_4_n_0\,
      I1 => data3(5),
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[5]\,
      I4 => data6(5),
      I5 => \rdata[5]_i_5_n_0\,
      O => \rdata[5]_i_2_n_0\
    );
\rdata[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_13_fu_335_p3,
      I2 => \rdata[5]_i_6_n_0\,
      I3 => \int_ps_mprj_in_reg_n_0_[37]\,
      I4 => \int_ps_mprj_out_reg_n_0_[5]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => \rdata[5]_i_3_n_0\
    );
\rdata[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => s_axi_control_ARADDR(4),
      I1 => s_axi_control_ARADDR(3),
      I2 => s_axi_control_ARADDR(5),
      I3 => s_axi_control_ARADDR(1),
      I4 => s_axi_control_ARADDR(0),
      I5 => s_axi_control_ARADDR(2),
      O => \rdata[5]_i_4_n_0\
    );
\rdata[5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => s_axi_control_ARADDR(5),
      I1 => s_axi_control_ARADDR(3),
      I2 => s_axi_control_ARADDR(2),
      I3 => s_axi_control_ARADDR(1),
      I4 => s_axi_control_ARADDR(0),
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[5]_i_5_n_0\
    );
\rdata[5]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001000000000"
    )
        port map (
      I0 => s_axi_control_ARADDR(5),
      I1 => s_axi_control_ARADDR(3),
      I2 => s_axi_control_ARADDR(2),
      I3 => s_axi_control_ARADDR(1),
      I4 => s_axi_control_ARADDR(0),
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[5]_i_6_n_0\
    );
\rdata[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_16_fu_367_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[6]\,
      I4 => \int_ps_mprj_out_reg_n_0_[6]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(6)
    );
\rdata[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_19_fu_399_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[7]\,
      I4 => \int_ps_mprj_out_reg_n_0_[7]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(7)
    );
\rdata[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_22_fu_431_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[8]\,
      I4 => \int_ps_mprj_out_reg_n_0_[8]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(8)
    );
\rdata[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \rdata[31]_i_3_n_0\,
      I1 => tmp_25_fu_463_p3,
      I2 => \rdata[31]_i_4_n_0\,
      I3 => \int_ps_mprj_en_reg_n_0_[9]\,
      I4 => \int_ps_mprj_out_reg_n_0_[9]\,
      I5 => \rdata[31]_i_5_n_0\,
      O => rdata(9)
    );
\rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(0),
      Q => s_axi_control_RDATA(0),
      R => '0'
    );
\rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(10),
      Q => s_axi_control_RDATA(10),
      R => '0'
    );
\rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(11),
      Q => s_axi_control_RDATA(11),
      R => '0'
    );
\rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(12),
      Q => s_axi_control_RDATA(12),
      R => '0'
    );
\rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(13),
      Q => s_axi_control_RDATA(13),
      R => '0'
    );
\rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(14),
      Q => s_axi_control_RDATA(14),
      R => '0'
    );
\rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(15),
      Q => s_axi_control_RDATA(15),
      R => '0'
    );
\rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(16),
      Q => s_axi_control_RDATA(16),
      R => '0'
    );
\rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(17),
      Q => s_axi_control_RDATA(17),
      R => '0'
    );
\rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(18),
      Q => s_axi_control_RDATA(18),
      R => '0'
    );
\rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(19),
      Q => s_axi_control_RDATA(19),
      R => '0'
    );
\rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(1),
      Q => s_axi_control_RDATA(1),
      R => '0'
    );
\rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(20),
      Q => s_axi_control_RDATA(20),
      R => '0'
    );
\rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(21),
      Q => s_axi_control_RDATA(21),
      R => '0'
    );
\rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(22),
      Q => s_axi_control_RDATA(22),
      R => '0'
    );
\rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(23),
      Q => s_axi_control_RDATA(23),
      R => '0'
    );
\rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(24),
      Q => s_axi_control_RDATA(24),
      R => '0'
    );
\rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(25),
      Q => s_axi_control_RDATA(25),
      R => '0'
    );
\rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(26),
      Q => s_axi_control_RDATA(26),
      R => '0'
    );
\rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(27),
      Q => s_axi_control_RDATA(27),
      R => '0'
    );
\rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(28),
      Q => s_axi_control_RDATA(28),
      R => '0'
    );
\rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(29),
      Q => s_axi_control_RDATA(29),
      R => '0'
    );
\rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(2),
      Q => s_axi_control_RDATA(2),
      R => '0'
    );
\rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(30),
      Q => s_axi_control_RDATA(30),
      R => '0'
    );
\rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(31),
      Q => s_axi_control_RDATA(31),
      R => '0'
    );
\rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(3),
      Q => s_axi_control_RDATA(3),
      R => '0'
    );
\rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(4),
      Q => s_axi_control_RDATA(4),
      R => '0'
    );
\rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(5),
      Q => s_axi_control_RDATA(5),
      R => '0'
    );
\rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(6),
      Q => s_axi_control_RDATA(6),
      R => '0'
    );
\rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(7),
      Q => s_axi_control_RDATA(7),
      R => '0'
    );
\rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(8),
      Q => s_axi_control_RDATA(8),
      R => '0'
    );
\rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => ar_hs,
      D => rdata(9),
      Q => s_axi_control_RDATA(9),
      R => '0'
    );
\waddr[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_control_AWVALID,
      I1 => \^fsm_onehot_wstate_reg[1]_0\,
      O => waddr
    );
\waddr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_control_AWADDR(0),
      Q => \waddr_reg_n_0_[0]\,
      R => '0'
    );
\waddr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_control_AWADDR(1),
      Q => \waddr_reg_n_0_[1]\,
      R => '0'
    );
\waddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_control_AWADDR(2),
      Q => \waddr_reg_n_0_[2]\,
      R => '0'
    );
\waddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_control_AWADDR(3),
      Q => \waddr_reg_n_0_[3]\,
      R => '0'
    );
\waddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_control_AWADDR(4),
      Q => \waddr_reg_n_0_[4]\,
      R => '0'
    );
\waddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr,
      D => s_axi_control_AWADDR(5),
      Q => \waddr_reg_n_0_[5]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_caravel_ps is
  port (
    mprj_in : out STD_LOGIC_VECTOR ( 37 downto 0 );
    mprj_out : in STD_LOGIC_VECTOR ( 37 downto 0 );
    mprj_en : in STD_LOGIC_VECTOR ( 37 downto 0 );
    s_axi_control_AWVALID : in STD_LOGIC;
    s_axi_control_AWREADY : out STD_LOGIC;
    s_axi_control_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_control_WVALID : in STD_LOGIC;
    s_axi_control_WREADY : out STD_LOGIC;
    s_axi_control_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_control_ARVALID : in STD_LOGIC;
    s_axi_control_ARREADY : out STD_LOGIC;
    s_axi_control_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_control_RVALID : out STD_LOGIC;
    s_axi_control_RREADY : in STD_LOGIC;
    s_axi_control_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_BVALID : out STD_LOGIC;
    s_axi_control_BREADY : in STD_LOGIC;
    s_axi_control_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC
  );
  attribute C_S_AXI_CONTROL_ADDR_WIDTH : integer;
  attribute C_S_AXI_CONTROL_ADDR_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_caravel_ps : entity is 6;
  attribute C_S_AXI_CONTROL_DATA_WIDTH : integer;
  attribute C_S_AXI_CONTROL_DATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_caravel_ps : entity is 32;
  attribute C_S_AXI_CONTROL_WSTRB_WIDTH : integer;
  attribute C_S_AXI_CONTROL_WSTRB_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_caravel_ps : entity is 4;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_caravel_ps : entity is 32;
  attribute C_S_AXI_WSTRB_WIDTH : integer;
  attribute C_S_AXI_WSTRB_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_caravel_ps : entity is 4;
  attribute hls_module : string;
  attribute hls_module of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_caravel_ps : entity is "yes";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_caravel_ps;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_caravel_ps is
  signal \<const0>\ : STD_LOGIC;
begin
  s_axi_control_BRESP(1) <= \<const0>\;
  s_axi_control_BRESP(0) <= \<const0>\;
  s_axi_control_RRESP(1) <= \<const0>\;
  s_axi_control_RRESP(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
control_s_axi_U: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_caravel_ps_control_s_axi
     port map (
      \FSM_onehot_rstate_reg[1]_0\ => s_axi_control_ARREADY,
      \FSM_onehot_wstate_reg[1]_0\ => s_axi_control_AWREADY,
      \FSM_onehot_wstate_reg[2]_0\ => s_axi_control_WREADY,
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      mprj_en(37 downto 0) => mprj_en(37 downto 0),
      mprj_in(37 downto 0) => mprj_in(37 downto 0),
      mprj_out(37 downto 0) => mprj_out(37 downto 0),
      s_axi_control_ARADDR(5 downto 0) => s_axi_control_ARADDR(5 downto 0),
      s_axi_control_ARVALID => s_axi_control_ARVALID,
      s_axi_control_AWADDR(5 downto 0) => s_axi_control_AWADDR(5 downto 0),
      s_axi_control_AWVALID => s_axi_control_AWVALID,
      s_axi_control_BREADY => s_axi_control_BREADY,
      s_axi_control_BVALID => s_axi_control_BVALID,
      s_axi_control_RDATA(31 downto 0) => s_axi_control_RDATA(31 downto 0),
      s_axi_control_RREADY => s_axi_control_RREADY,
      s_axi_control_RVALID => s_axi_control_RVALID,
      s_axi_control_WDATA(31 downto 0) => s_axi_control_WDATA(31 downto 0),
      s_axi_control_WSTRB(3 downto 0) => s_axi_control_WSTRB(3 downto 0),
      s_axi_control_WVALID => s_axi_control_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    s_axi_control_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_control_AWVALID : in STD_LOGIC;
    s_axi_control_AWREADY : out STD_LOGIC;
    s_axi_control_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_control_WVALID : in STD_LOGIC;
    s_axi_control_WREADY : out STD_LOGIC;
    s_axi_control_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_BVALID : out STD_LOGIC;
    s_axi_control_BREADY : in STD_LOGIC;
    s_axi_control_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_control_ARVALID : in STD_LOGIC;
    s_axi_control_ARREADY : out STD_LOGIC;
    s_axi_control_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_RVALID : out STD_LOGIC;
    s_axi_control_RREADY : in STD_LOGIC;
    mprj_in : out STD_LOGIC_VECTOR ( 37 downto 0 );
    mprj_out : in STD_LOGIC_VECTOR ( 37 downto 0 );
    mprj_en : in STD_LOGIC_VECTOR ( 37 downto 0 );
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_caravel_ps_0_0,caravel_ps,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "HLS";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "caravel_ps,Vivado 2022.1";
  attribute hls_module : string;
  attribute hls_module of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  signal NLW_inst_s_axi_control_BRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_s_axi_control_RRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute C_S_AXI_CONTROL_ADDR_WIDTH : integer;
  attribute C_S_AXI_CONTROL_ADDR_WIDTH of inst : label is 6;
  attribute C_S_AXI_CONTROL_DATA_WIDTH : integer;
  attribute C_S_AXI_CONTROL_DATA_WIDTH of inst : label is 32;
  attribute C_S_AXI_CONTROL_WSTRB_WIDTH : integer;
  attribute C_S_AXI_CONTROL_WSTRB_WIDTH of inst : label is 4;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of inst : label is 32;
  attribute C_S_AXI_WSTRB_WIDTH : integer;
  attribute C_S_AXI_WSTRB_WIDTH of inst : label is 4;
  attribute SDX_KERNEL : string;
  attribute SDX_KERNEL of inst : label is "true";
  attribute SDX_KERNEL_SYNTH_INST : string;
  attribute SDX_KERNEL_SYNTH_INST of inst : label is "inst";
  attribute SDX_KERNEL_TYPE : string;
  attribute SDX_KERNEL_TYPE of inst : label is "hls";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ap_clk : signal is "xilinx.com:signal:clock:1.0 ap_clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_control, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  attribute X_INTERFACE_PARAMETER of ap_rst_n : signal is "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_control_ARREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY";
  attribute X_INTERFACE_INFO of s_axi_control_ARVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID";
  attribute X_INTERFACE_INFO of s_axi_control_AWREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY";
  attribute X_INTERFACE_INFO of s_axi_control_AWVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID";
  attribute X_INTERFACE_INFO of s_axi_control_BREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_control BREADY";
  attribute X_INTERFACE_INFO of s_axi_control_BVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_control BVALID";
  attribute X_INTERFACE_INFO of s_axi_control_RREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_control RREADY";
  attribute X_INTERFACE_PARAMETER of s_axi_control_RREADY : signal is "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 6, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 10000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_control_RVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_control RVALID";
  attribute X_INTERFACE_INFO of s_axi_control_WREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_control WREADY";
  attribute X_INTERFACE_INFO of s_axi_control_WVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_control WVALID";
  attribute X_INTERFACE_INFO of mprj_en : signal is "xilinx.com:signal:data:1.0 mprj_en DATA";
  attribute X_INTERFACE_PARAMETER of mprj_en : signal is "XIL_INTERFACENAME mprj_en, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of mprj_in : signal is "xilinx.com:signal:data:1.0 mprj_in DATA";
  attribute X_INTERFACE_PARAMETER of mprj_in : signal is "XIL_INTERFACENAME mprj_in, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of mprj_out : signal is "xilinx.com:signal:data:1.0 mprj_out DATA";
  attribute X_INTERFACE_PARAMETER of mprj_out : signal is "XIL_INTERFACENAME mprj_out, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of s_axi_control_ARADDR : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR";
  attribute X_INTERFACE_INFO of s_axi_control_AWADDR : signal is "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR";
  attribute X_INTERFACE_INFO of s_axi_control_BRESP : signal is "xilinx.com:interface:aximm:1.0 s_axi_control BRESP";
  attribute X_INTERFACE_INFO of s_axi_control_RDATA : signal is "xilinx.com:interface:aximm:1.0 s_axi_control RDATA";
  attribute X_INTERFACE_INFO of s_axi_control_RRESP : signal is "xilinx.com:interface:aximm:1.0 s_axi_control RRESP";
  attribute X_INTERFACE_INFO of s_axi_control_WDATA : signal is "xilinx.com:interface:aximm:1.0 s_axi_control WDATA";
  attribute X_INTERFACE_INFO of s_axi_control_WSTRB : signal is "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB";
begin
  s_axi_control_BRESP(1) <= \<const0>\;
  s_axi_control_BRESP(0) <= \<const0>\;
  s_axi_control_RRESP(1) <= \<const0>\;
  s_axi_control_RRESP(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_caravel_ps
     port map (
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      mprj_en(37 downto 0) => mprj_en(37 downto 0),
      mprj_in(37 downto 0) => mprj_in(37 downto 0),
      mprj_out(37 downto 0) => mprj_out(37 downto 0),
      s_axi_control_ARADDR(5 downto 0) => s_axi_control_ARADDR(5 downto 0),
      s_axi_control_ARREADY => s_axi_control_ARREADY,
      s_axi_control_ARVALID => s_axi_control_ARVALID,
      s_axi_control_AWADDR(5 downto 0) => s_axi_control_AWADDR(5 downto 0),
      s_axi_control_AWREADY => s_axi_control_AWREADY,
      s_axi_control_AWVALID => s_axi_control_AWVALID,
      s_axi_control_BREADY => s_axi_control_BREADY,
      s_axi_control_BRESP(1 downto 0) => NLW_inst_s_axi_control_BRESP_UNCONNECTED(1 downto 0),
      s_axi_control_BVALID => s_axi_control_BVALID,
      s_axi_control_RDATA(31 downto 0) => s_axi_control_RDATA(31 downto 0),
      s_axi_control_RREADY => s_axi_control_RREADY,
      s_axi_control_RRESP(1 downto 0) => NLW_inst_s_axi_control_RRESP_UNCONNECTED(1 downto 0),
      s_axi_control_RVALID => s_axi_control_RVALID,
      s_axi_control_WDATA(31 downto 0) => s_axi_control_WDATA(31 downto 0),
      s_axi_control_WREADY => s_axi_control_WREADY,
      s_axi_control_WSTRB(3 downto 0) => s_axi_control_WSTRB(3 downto 0),
      s_axi_control_WVALID => s_axi_control_WVALID
    );
end STRUCTURE;
