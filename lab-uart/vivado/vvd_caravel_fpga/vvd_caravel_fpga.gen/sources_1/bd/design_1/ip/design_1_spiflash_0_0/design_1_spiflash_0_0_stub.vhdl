-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
-- Date        : Fri Jun  2 19:17:38 2023
-- Host        : josh-All-Series running 64-bit Ubuntu 20.04.3 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/josh/caravel-soc_fpga/vivado/vvd_caravel_fpga/vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_spiflash_0_0/design_1_spiflash_0_0_stub.vhdl
-- Design      : design_1_spiflash_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_spiflash_0_0 is
  Port ( 
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    romcode_Addr_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    romcode_EN_A : out STD_LOGIC;
    romcode_WEN_A : out STD_LOGIC_VECTOR ( 3 downto 0 );
    romcode_Din_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    romcode_Dout_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    romcode_Clk_A : out STD_LOGIC;
    romcode_Rst_A : out STD_LOGIC;
    csb : in STD_LOGIC;
    spiclk : in STD_LOGIC;
    io0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    io1 : out STD_LOGIC
  );

end design_1_spiflash_0_0;

architecture stub of design_1_spiflash_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst,romcode_Addr_A[31:0],romcode_EN_A,romcode_WEN_A[3:0],romcode_Din_A[31:0],romcode_Dout_A[31:0],romcode_Clk_A,romcode_Rst_A,csb,spiclk,io0[0:0],io1";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "spiflash,Vivado 2022.1";
begin
end;
