-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
-- Date        : Fri Jun  2 19:19:15 2023
-- Host        : josh-All-Series running 64-bit Ubuntu 20.04.3 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_caravel_0_0_stub.vhdl
-- Design      : design_1_caravel_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    gpio : inout STD_LOGIC;
    mprj_i : in STD_LOGIC_VECTOR ( 37 downto 0 );
    mprj_o : out STD_LOGIC_VECTOR ( 37 downto 0 );
    mprj_en : out STD_LOGIC_VECTOR ( 37 downto 0 );
    clock : in STD_LOGIC;
    resetb : in STD_LOGIC;
    flash_csb : out STD_LOGIC;
    flash_clk : out STD_LOGIC;
    flash_io0 : out STD_LOGIC;
    flash_io1 : in STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "gpio,mprj_i[37:0],mprj_o[37:0],mprj_en[37:0],clock,resetb,flash_csb,flash_clk,flash_io0,flash_io1";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "caravel,Vivado 2022.1";
begin
end;
