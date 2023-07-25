-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
-- Date        : Fri Jun  2 19:17:39 2023
-- Host        : josh-All-Series running 64-bit Ubuntu 20.04.3 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/josh/caravel-soc_fpga/vivado/vvd_caravel_fpga/vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_spiflash_0_0/design_1_spiflash_0_0_sim_netlist.vhdl
-- Design      : design_1_spiflash_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_spiflash_0_0_spiflash is
  port (
    romcode_Addr_A : out STD_LOGIC_VECTOR ( 23 downto 0 );
    io1 : out STD_LOGIC;
    \bytecount_reg[6]_0\ : out STD_LOGIC;
    spiclk : in STD_LOGIC;
    csb : in STD_LOGIC;
    io0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    romcode_Dout_A : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_spiflash_0_0_spiflash : entity is "spiflash";
end design_1_spiflash_0_0_spiflash;

architecture STRUCTURE of design_1_spiflash_0_0_spiflash is
  signal bitcount : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \bitcount[0]_i_1_n_0\ : STD_LOGIC;
  signal \bitcount[1]_i_1_n_0\ : STD_LOGIC;
  signal \bitcount[2]_i_1_n_0\ : STD_LOGIC;
  signal buffer_next : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \bytecount[0]_i_3_n_0\ : STD_LOGIC;
  signal bytecount_reg : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \bytecount_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \bytecount_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \bytecount_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \bytecount_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \bytecount_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \bytecount_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \bytecount_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \bytecount_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \bytecount_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \bytecount_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \bytecount_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \bytecount_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \bytecount_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \bytecount_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \bytecount_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \bytecount_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \bytecount_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \^bytecount_reg[6]_0\ : STD_LOGIC;
  signal \bytecount_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \bytecount_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \bytecount_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \bytecount_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \bytecount_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \bytecount_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \bytecount_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \bytecount_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal outbuf : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \outbuf[0]_i_1_n_0\ : STD_LOGIC;
  signal \outbuf[0]_i_2_n_0\ : STD_LOGIC;
  signal \outbuf[1]_i_1_n_0\ : STD_LOGIC;
  signal \outbuf[1]_i_2_n_0\ : STD_LOGIC;
  signal \outbuf[2]_i_1_n_0\ : STD_LOGIC;
  signal \outbuf[2]_i_2_n_0\ : STD_LOGIC;
  signal \outbuf[3]_i_1_n_0\ : STD_LOGIC;
  signal \outbuf[3]_i_2_n_0\ : STD_LOGIC;
  signal \outbuf[4]_i_1_n_0\ : STD_LOGIC;
  signal \outbuf[4]_i_2_n_0\ : STD_LOGIC;
  signal \outbuf[5]_i_1_n_0\ : STD_LOGIC;
  signal \outbuf[5]_i_2_n_0\ : STD_LOGIC;
  signal \outbuf[6]_i_1_n_0\ : STD_LOGIC;
  signal \outbuf[6]_i_2_n_0\ : STD_LOGIC;
  signal \outbuf[7]_i_1_n_0\ : STD_LOGIC;
  signal \outbuf[7]_i_2_n_0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal \^romcode_addr_a\ : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal romcode_EN_A_INST_0_i_1_n_0 : STD_LOGIC;
  signal romcode_EN_A_INST_0_i_2_n_0 : STD_LOGIC;
  signal sel : STD_LOGIC;
  signal spi_addr0 : STD_LOGIC_VECTOR ( 23 downto 1 );
  signal \spi_addr0_carry__0_n_0\ : STD_LOGIC;
  signal \spi_addr0_carry__0_n_1\ : STD_LOGIC;
  signal \spi_addr0_carry__0_n_2\ : STD_LOGIC;
  signal \spi_addr0_carry__0_n_3\ : STD_LOGIC;
  signal \spi_addr0_carry__1_n_0\ : STD_LOGIC;
  signal \spi_addr0_carry__1_n_1\ : STD_LOGIC;
  signal \spi_addr0_carry__1_n_2\ : STD_LOGIC;
  signal \spi_addr0_carry__1_n_3\ : STD_LOGIC;
  signal \spi_addr0_carry__2_n_0\ : STD_LOGIC;
  signal \spi_addr0_carry__2_n_1\ : STD_LOGIC;
  signal \spi_addr0_carry__2_n_2\ : STD_LOGIC;
  signal \spi_addr0_carry__2_n_3\ : STD_LOGIC;
  signal \spi_addr0_carry__3_n_0\ : STD_LOGIC;
  signal \spi_addr0_carry__3_n_1\ : STD_LOGIC;
  signal \spi_addr0_carry__3_n_2\ : STD_LOGIC;
  signal \spi_addr0_carry__3_n_3\ : STD_LOGIC;
  signal \spi_addr0_carry__4_n_2\ : STD_LOGIC;
  signal \spi_addr0_carry__4_n_3\ : STD_LOGIC;
  signal spi_addr0_carry_n_0 : STD_LOGIC;
  signal spi_addr0_carry_n_1 : STD_LOGIC;
  signal spi_addr0_carry_n_2 : STD_LOGIC;
  signal spi_addr0_carry_n_3 : STD_LOGIC;
  signal \spi_addr[15]_i_1_n_0\ : STD_LOGIC;
  signal \spi_addr[15]_i_3_n_0\ : STD_LOGIC;
  signal \spi_addr[15]_i_4_n_0\ : STD_LOGIC;
  signal \spi_addr[23]_i_1_n_0\ : STD_LOGIC;
  signal \spi_addr[23]_i_3_n_0\ : STD_LOGIC;
  signal \spi_addr[23]_i_4_n_0\ : STD_LOGIC;
  signal \spi_addr[23]_i_5_n_0\ : STD_LOGIC;
  signal \spi_addr[23]_i_6_n_0\ : STD_LOGIC;
  signal \spi_addr[23]_i_7_n_0\ : STD_LOGIC;
  signal \spi_addr[7]_i_1_n_0\ : STD_LOGIC;
  signal \spi_cmd[7]_i_1_n_0\ : STD_LOGIC;
  signal \spi_cmd_reg_n_0_[0]\ : STD_LOGIC;
  signal \spi_cmd_reg_n_0_[1]\ : STD_LOGIC;
  signal \spi_cmd_reg_n_0_[2]\ : STD_LOGIC;
  signal \spi_cmd_reg_n_0_[3]\ : STD_LOGIC;
  signal \spi_cmd_reg_n_0_[4]\ : STD_LOGIC;
  signal \spi_cmd_reg_n_0_[5]\ : STD_LOGIC;
  signal \spi_cmd_reg_n_0_[6]\ : STD_LOGIC;
  signal \spi_cmd_reg_n_0_[7]\ : STD_LOGIC;
  signal \NLW_bytecount_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_bytecount_reg[12]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_spi_addr0_carry__4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_spi_addr0_carry__4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \bitcount[0]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \bitcount[1]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \bitcount[2]_i_1\ : label is "soft_lutpair1";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \bytecount_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \bytecount_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \bytecount_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \bytecount_reg[8]_i_1\ : label is 11;
  attribute SOFT_HLUTNM of romcode_EN_A_INST_0_i_2 : label is "soft_lutpair0";
  attribute ADDER_THRESHOLD of spi_addr0_carry : label is 35;
  attribute ADDER_THRESHOLD of \spi_addr0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \spi_addr0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \spi_addr0_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \spi_addr0_carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \spi_addr0_carry__4\ : label is 35;
  attribute SOFT_HLUTNM of \spi_addr[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \spi_addr[10]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \spi_addr[11]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \spi_addr[12]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \spi_addr[13]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \spi_addr[14]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \spi_addr[15]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \spi_addr[15]_i_3\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \spi_addr[15]_i_4\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \spi_addr[16]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \spi_addr[17]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \spi_addr[18]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \spi_addr[19]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \spi_addr[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \spi_addr[20]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \spi_addr[21]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \spi_addr[22]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \spi_addr[23]_i_2\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \spi_addr[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \spi_addr[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \spi_addr[4]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \spi_addr[5]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \spi_addr[6]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \spi_addr[7]_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \spi_addr[8]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \spi_addr[9]_i_1\ : label is "soft_lutpair6";
begin
  \bytecount_reg[6]_0\ <= \^bytecount_reg[6]_0\;
  romcode_Addr_A(23 downto 0) <= \^romcode_addr_a\(23 downto 0);
\bitcount[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bitcount(0),
      O => \bitcount[0]_i_1_n_0\
    );
\bitcount[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => bitcount(0),
      I1 => bitcount(1),
      O => \bitcount[1]_i_1_n_0\
    );
\bitcount[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => bitcount(0),
      I1 => bitcount(1),
      I2 => bitcount(2),
      O => \bitcount[2]_i_1_n_0\
    );
\bitcount_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => spiclk,
      CE => '1',
      CLR => csb,
      D => \bitcount[0]_i_1_n_0\,
      Q => bitcount(0)
    );
\bitcount_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => spiclk,
      CE => '1',
      CLR => csb,
      D => \bitcount[1]_i_1_n_0\,
      Q => bitcount(1)
    );
\bitcount_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => spiclk,
      CE => '1',
      CLR => csb,
      D => \bitcount[2]_i_1_n_0\,
      Q => bitcount(2)
    );
\buffer_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => spiclk,
      CE => '1',
      CLR => csb,
      D => io0(0),
      Q => buffer_next(1)
    );
\buffer_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => spiclk,
      CE => '1',
      CLR => csb,
      D => buffer_next(1),
      Q => buffer_next(2)
    );
\buffer_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => spiclk,
      CE => '1',
      CLR => csb,
      D => buffer_next(2),
      Q => buffer_next(3)
    );
\buffer_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => spiclk,
      CE => '1',
      CLR => csb,
      D => buffer_next(3),
      Q => buffer_next(4)
    );
\buffer_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => spiclk,
      CE => '1',
      CLR => csb,
      D => buffer_next(4),
      Q => buffer_next(5)
    );
\buffer_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => spiclk,
      CE => '1',
      CLR => csb,
      D => buffer_next(5),
      Q => buffer_next(6)
    );
\buffer_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => spiclk,
      CE => '1',
      CLR => csb,
      D => buffer_next(6),
      Q => buffer_next(7)
    );
\bytecount[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => bitcount(2),
      I1 => bitcount(1),
      I2 => bitcount(0),
      O => sel
    );
\bytecount[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bytecount_reg(0),
      O => \bytecount[0]_i_3_n_0\
    );
\bytecount_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => spiclk,
      CE => sel,
      CLR => csb,
      D => \bytecount_reg[0]_i_2_n_7\,
      Q => bytecount_reg(0)
    );
\bytecount_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \bytecount_reg[0]_i_2_n_0\,
      CO(2) => \bytecount_reg[0]_i_2_n_1\,
      CO(1) => \bytecount_reg[0]_i_2_n_2\,
      CO(0) => \bytecount_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \bytecount_reg[0]_i_2_n_4\,
      O(2) => \bytecount_reg[0]_i_2_n_5\,
      O(1) => \bytecount_reg[0]_i_2_n_6\,
      O(0) => \bytecount_reg[0]_i_2_n_7\,
      S(3 downto 1) => bytecount_reg(3 downto 1),
      S(0) => \bytecount[0]_i_3_n_0\
    );
\bytecount_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => spiclk,
      CE => sel,
      CLR => csb,
      D => \bytecount_reg[8]_i_1_n_5\,
      Q => bytecount_reg(10)
    );
\bytecount_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => spiclk,
      CE => sel,
      CLR => csb,
      D => \bytecount_reg[8]_i_1_n_4\,
      Q => bytecount_reg(11)
    );
\bytecount_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => spiclk,
      CE => sel,
      CLR => csb,
      D => \bytecount_reg[12]_i_1_n_7\,
      Q => bytecount_reg(12)
    );
\bytecount_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \bytecount_reg[8]_i_1_n_0\,
      CO(3 downto 0) => \NLW_bytecount_reg[12]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_bytecount_reg[12]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \bytecount_reg[12]_i_1_n_7\,
      S(3 downto 1) => B"000",
      S(0) => bytecount_reg(12)
    );
\bytecount_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => spiclk,
      CE => sel,
      CLR => csb,
      D => \bytecount_reg[0]_i_2_n_6\,
      Q => bytecount_reg(1)
    );
\bytecount_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => spiclk,
      CE => sel,
      CLR => csb,
      D => \bytecount_reg[0]_i_2_n_5\,
      Q => bytecount_reg(2)
    );
\bytecount_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => spiclk,
      CE => sel,
      CLR => csb,
      D => \bytecount_reg[0]_i_2_n_4\,
      Q => bytecount_reg(3)
    );
\bytecount_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => spiclk,
      CE => sel,
      CLR => csb,
      D => \bytecount_reg[4]_i_1_n_7\,
      Q => bytecount_reg(4)
    );
\bytecount_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \bytecount_reg[0]_i_2_n_0\,
      CO(3) => \bytecount_reg[4]_i_1_n_0\,
      CO(2) => \bytecount_reg[4]_i_1_n_1\,
      CO(1) => \bytecount_reg[4]_i_1_n_2\,
      CO(0) => \bytecount_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \bytecount_reg[4]_i_1_n_4\,
      O(2) => \bytecount_reg[4]_i_1_n_5\,
      O(1) => \bytecount_reg[4]_i_1_n_6\,
      O(0) => \bytecount_reg[4]_i_1_n_7\,
      S(3 downto 0) => bytecount_reg(7 downto 4)
    );
\bytecount_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => spiclk,
      CE => sel,
      CLR => csb,
      D => \bytecount_reg[4]_i_1_n_6\,
      Q => bytecount_reg(5)
    );
\bytecount_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => spiclk,
      CE => sel,
      CLR => csb,
      D => \bytecount_reg[4]_i_1_n_5\,
      Q => bytecount_reg(6)
    );
\bytecount_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => spiclk,
      CE => sel,
      CLR => csb,
      D => \bytecount_reg[4]_i_1_n_4\,
      Q => bytecount_reg(7)
    );
\bytecount_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => spiclk,
      CE => sel,
      CLR => csb,
      D => \bytecount_reg[8]_i_1_n_7\,
      Q => bytecount_reg(8)
    );
\bytecount_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \bytecount_reg[4]_i_1_n_0\,
      CO(3) => \bytecount_reg[8]_i_1_n_0\,
      CO(2) => \bytecount_reg[8]_i_1_n_1\,
      CO(1) => \bytecount_reg[8]_i_1_n_2\,
      CO(0) => \bytecount_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \bytecount_reg[8]_i_1_n_4\,
      O(2) => \bytecount_reg[8]_i_1_n_5\,
      O(1) => \bytecount_reg[8]_i_1_n_6\,
      O(0) => \bytecount_reg[8]_i_1_n_7\,
      S(3 downto 0) => bytecount_reg(11 downto 8)
    );
\bytecount_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => spiclk,
      CE => sel,
      CLR => csb,
      D => \bytecount_reg[8]_i_1_n_6\,
      Q => bytecount_reg(9)
    );
\outbuf[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => \outbuf[0]_i_2_n_0\,
      I1 => \^bytecount_reg[6]_0\,
      I2 => bitcount(1),
      I3 => bitcount(0),
      I4 => bitcount(2),
      O => \outbuf[0]_i_1_n_0\
    );
\outbuf[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAF0FFCCAAF000"
    )
        port map (
      I0 => romcode_Dout_A(16),
      I1 => romcode_Dout_A(24),
      I2 => romcode_Dout_A(8),
      I3 => \^romcode_addr_a\(0),
      I4 => \^romcode_addr_a\(1),
      I5 => romcode_Dout_A(0),
      O => \outbuf[0]_i_2_n_0\
    );
\outbuf[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABAAAAAAA8AAAA"
    )
        port map (
      I0 => outbuf(0),
      I1 => bitcount(2),
      I2 => bitcount(0),
      I3 => bitcount(1),
      I4 => \^bytecount_reg[6]_0\,
      I5 => \outbuf[1]_i_2_n_0\,
      O => \outbuf[1]_i_1_n_0\
    );
\outbuf[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAF0FFCCAAF000"
    )
        port map (
      I0 => romcode_Dout_A(17),
      I1 => romcode_Dout_A(25),
      I2 => romcode_Dout_A(9),
      I3 => \^romcode_addr_a\(0),
      I4 => \^romcode_addr_a\(1),
      I5 => romcode_Dout_A(1),
      O => \outbuf[1]_i_2_n_0\
    );
\outbuf[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABAAAAAAA8AAAA"
    )
        port map (
      I0 => outbuf(1),
      I1 => bitcount(2),
      I2 => bitcount(0),
      I3 => bitcount(1),
      I4 => \^bytecount_reg[6]_0\,
      I5 => \outbuf[2]_i_2_n_0\,
      O => \outbuf[2]_i_1_n_0\
    );
\outbuf[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAF0FFCCAAF000"
    )
        port map (
      I0 => romcode_Dout_A(18),
      I1 => romcode_Dout_A(26),
      I2 => romcode_Dout_A(10),
      I3 => \^romcode_addr_a\(0),
      I4 => \^romcode_addr_a\(1),
      I5 => romcode_Dout_A(2),
      O => \outbuf[2]_i_2_n_0\
    );
\outbuf[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABAAAAAAA8AAAA"
    )
        port map (
      I0 => outbuf(2),
      I1 => bitcount(2),
      I2 => bitcount(0),
      I3 => bitcount(1),
      I4 => \^bytecount_reg[6]_0\,
      I5 => \outbuf[3]_i_2_n_0\,
      O => \outbuf[3]_i_1_n_0\
    );
\outbuf[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAF0FFCCAAF000"
    )
        port map (
      I0 => romcode_Dout_A(19),
      I1 => romcode_Dout_A(27),
      I2 => romcode_Dout_A(11),
      I3 => \^romcode_addr_a\(0),
      I4 => \^romcode_addr_a\(1),
      I5 => romcode_Dout_A(3),
      O => \outbuf[3]_i_2_n_0\
    );
\outbuf[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABAAAAAAA8AAAA"
    )
        port map (
      I0 => outbuf(3),
      I1 => bitcount(2),
      I2 => bitcount(0),
      I3 => bitcount(1),
      I4 => \^bytecount_reg[6]_0\,
      I5 => \outbuf[4]_i_2_n_0\,
      O => \outbuf[4]_i_1_n_0\
    );
\outbuf[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAF0FFCCAAF000"
    )
        port map (
      I0 => romcode_Dout_A(20),
      I1 => romcode_Dout_A(28),
      I2 => romcode_Dout_A(12),
      I3 => \^romcode_addr_a\(0),
      I4 => \^romcode_addr_a\(1),
      I5 => romcode_Dout_A(4),
      O => \outbuf[4]_i_2_n_0\
    );
\outbuf[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABAAAAAAA8AAAA"
    )
        port map (
      I0 => outbuf(4),
      I1 => bitcount(2),
      I2 => bitcount(0),
      I3 => bitcount(1),
      I4 => \^bytecount_reg[6]_0\,
      I5 => \outbuf[5]_i_2_n_0\,
      O => \outbuf[5]_i_1_n_0\
    );
\outbuf[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => romcode_Dout_A(5),
      I1 => romcode_Dout_A(13),
      I2 => romcode_Dout_A(21),
      I3 => \^romcode_addr_a\(1),
      I4 => \^romcode_addr_a\(0),
      I5 => romcode_Dout_A(29),
      O => \outbuf[5]_i_2_n_0\
    );
\outbuf[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABAAAAAAA8AAAA"
    )
        port map (
      I0 => outbuf(5),
      I1 => bitcount(2),
      I2 => bitcount(0),
      I3 => bitcount(1),
      I4 => \^bytecount_reg[6]_0\,
      I5 => \outbuf[6]_i_2_n_0\,
      O => \outbuf[6]_i_1_n_0\
    );
\outbuf[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => romcode_Dout_A(6),
      I1 => romcode_Dout_A(14),
      I2 => romcode_Dout_A(22),
      I3 => \^romcode_addr_a\(1),
      I4 => \^romcode_addr_a\(0),
      I5 => romcode_Dout_A(30),
      O => \outbuf[6]_i_2_n_0\
    );
\outbuf[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABAAAAAAA8AAAA"
    )
        port map (
      I0 => outbuf(6),
      I1 => bitcount(2),
      I2 => bitcount(0),
      I3 => bitcount(1),
      I4 => \^bytecount_reg[6]_0\,
      I5 => \outbuf[7]_i_2_n_0\,
      O => \outbuf[7]_i_1_n_0\
    );
\outbuf[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => romcode_Dout_A(7),
      I1 => romcode_Dout_A(15),
      I2 => romcode_Dout_A(23),
      I3 => \^romcode_addr_a\(1),
      I4 => \^romcode_addr_a\(0),
      I5 => romcode_Dout_A(31),
      O => \outbuf[7]_i_2_n_0\
    );
\outbuf_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => spiclk,
      CE => '1',
      CLR => csb,
      D => \outbuf[0]_i_1_n_0\,
      Q => outbuf(0)
    );
\outbuf_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => spiclk,
      CE => '1',
      CLR => csb,
      D => \outbuf[1]_i_1_n_0\,
      Q => outbuf(1)
    );
\outbuf_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => spiclk,
      CE => '1',
      CLR => csb,
      D => \outbuf[2]_i_1_n_0\,
      Q => outbuf(2)
    );
\outbuf_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => spiclk,
      CE => '1',
      CLR => csb,
      D => \outbuf[3]_i_1_n_0\,
      Q => outbuf(3)
    );
\outbuf_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => spiclk,
      CE => '1',
      CLR => csb,
      D => \outbuf[4]_i_1_n_0\,
      Q => outbuf(4)
    );
\outbuf_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => spiclk,
      CE => '1',
      CLR => csb,
      D => \outbuf[5]_i_1_n_0\,
      Q => outbuf(5)
    );
\outbuf_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => spiclk,
      CE => '1',
      CLR => csb,
      D => \outbuf[6]_i_1_n_0\,
      Q => outbuf(6)
    );
\outbuf_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => spiclk,
      CE => '1',
      CLR => csb,
      D => \outbuf[7]_i_1_n_0\,
      Q => io1
    );
romcode_EN_A_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => romcode_EN_A_INST_0_i_1_n_0,
      I1 => bytecount_reg(6),
      I2 => bytecount_reg(2),
      I3 => romcode_EN_A_INST_0_i_2_n_0,
      O => \^bytecount_reg[6]_0\
    );
romcode_EN_A_INST_0_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => bytecount_reg(8),
      I1 => bytecount_reg(7),
      I2 => bytecount_reg(5),
      I3 => bytecount_reg(3),
      I4 => bytecount_reg(4),
      O => romcode_EN_A_INST_0_i_1_n_0
    );
romcode_EN_A_INST_0_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => bytecount_reg(10),
      I1 => bytecount_reg(11),
      I2 => bytecount_reg(12),
      I3 => bytecount_reg(9),
      O => romcode_EN_A_INST_0_i_2_n_0
    );
spi_addr0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => spi_addr0_carry_n_0,
      CO(2) => spi_addr0_carry_n_1,
      CO(1) => spi_addr0_carry_n_2,
      CO(0) => spi_addr0_carry_n_3,
      CYINIT => \^romcode_addr_a\(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => spi_addr0(4 downto 1),
      S(3 downto 0) => \^romcode_addr_a\(4 downto 1)
    );
\spi_addr0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => spi_addr0_carry_n_0,
      CO(3) => \spi_addr0_carry__0_n_0\,
      CO(2) => \spi_addr0_carry__0_n_1\,
      CO(1) => \spi_addr0_carry__0_n_2\,
      CO(0) => \spi_addr0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => spi_addr0(8 downto 5),
      S(3 downto 0) => \^romcode_addr_a\(8 downto 5)
    );
\spi_addr0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \spi_addr0_carry__0_n_0\,
      CO(3) => \spi_addr0_carry__1_n_0\,
      CO(2) => \spi_addr0_carry__1_n_1\,
      CO(1) => \spi_addr0_carry__1_n_2\,
      CO(0) => \spi_addr0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => spi_addr0(12 downto 9),
      S(3 downto 0) => \^romcode_addr_a\(12 downto 9)
    );
\spi_addr0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \spi_addr0_carry__1_n_0\,
      CO(3) => \spi_addr0_carry__2_n_0\,
      CO(2) => \spi_addr0_carry__2_n_1\,
      CO(1) => \spi_addr0_carry__2_n_2\,
      CO(0) => \spi_addr0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => spi_addr0(16 downto 13),
      S(3 downto 0) => \^romcode_addr_a\(16 downto 13)
    );
\spi_addr0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \spi_addr0_carry__2_n_0\,
      CO(3) => \spi_addr0_carry__3_n_0\,
      CO(2) => \spi_addr0_carry__3_n_1\,
      CO(1) => \spi_addr0_carry__3_n_2\,
      CO(0) => \spi_addr0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => spi_addr0(20 downto 17),
      S(3 downto 0) => \^romcode_addr_a\(20 downto 17)
    );
\spi_addr0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \spi_addr0_carry__3_n_0\,
      CO(3 downto 2) => \NLW_spi_addr0_carry__4_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \spi_addr0_carry__4_n_2\,
      CO(0) => \spi_addr0_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_spi_addr0_carry__4_O_UNCONNECTED\(3),
      O(2 downto 0) => spi_addr0(23 downto 21),
      S(3) => '0',
      S(2 downto 0) => \^romcode_addr_a\(23 downto 21)
    );
\spi_addr[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"3A"
    )
        port map (
      I0 => io0(0),
      I1 => \^romcode_addr_a\(0),
      I2 => \spi_addr[23]_i_3_n_0\,
      O => p_1_in(0)
    );
\spi_addr[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(10),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => buffer_next(2),
      O => p_1_in(10)
    );
\spi_addr[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(11),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => buffer_next(3),
      O => p_1_in(11)
    );
\spi_addr[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(12),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => buffer_next(4),
      O => p_1_in(12)
    );
\spi_addr[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(13),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => buffer_next(5),
      O => p_1_in(13)
    );
\spi_addr[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(14),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => buffer_next(6),
      O => p_1_in(14)
    );
\spi_addr[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA00000008"
    )
        port map (
      I0 => \spi_addr[15]_i_3_n_0\,
      I1 => \spi_addr[23]_i_5_n_0\,
      I2 => bytecount_reg(0),
      I3 => bytecount_reg(2),
      I4 => \spi_addr[15]_i_4_n_0\,
      I5 => \spi_addr[23]_i_3_n_0\,
      O => \spi_addr[15]_i_1_n_0\
    );
\spi_addr[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(15),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => buffer_next(7),
      O => p_1_in(15)
    );
\spi_addr[15]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => bitcount(0),
      I1 => bitcount(1),
      I2 => bitcount(2),
      I3 => csb,
      O => \spi_addr[15]_i_3_n_0\
    );
\spi_addr[15]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFFFF"
    )
        port map (
      I0 => bytecount_reg(9),
      I1 => bytecount_reg(12),
      I2 => bytecount_reg(11),
      I3 => bytecount_reg(10),
      I4 => bytecount_reg(1),
      O => \spi_addr[15]_i_4_n_0\
    );
\spi_addr[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(16),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => io0(0),
      O => p_1_in(16)
    );
\spi_addr[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(17),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => buffer_next(1),
      O => p_1_in(17)
    );
\spi_addr[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(18),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => buffer_next(2),
      O => p_1_in(18)
    );
\spi_addr[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(19),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => buffer_next(3),
      O => p_1_in(19)
    );
\spi_addr[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(1),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => buffer_next(1),
      O => p_1_in(1)
    );
\spi_addr[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(20),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => buffer_next(4),
      O => p_1_in(20)
    );
\spi_addr[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(21),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => buffer_next(5),
      O => p_1_in(21)
    );
\spi_addr[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(22),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => buffer_next(6),
      O => p_1_in(22)
    );
\spi_addr[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4040444040404040"
    )
        port map (
      I0 => csb,
      I1 => sel,
      I2 => \spi_addr[23]_i_3_n_0\,
      I3 => bytecount_reg(0),
      I4 => \spi_addr[23]_i_4_n_0\,
      I5 => \spi_addr[23]_i_5_n_0\,
      O => \spi_addr[23]_i_1_n_0\
    );
\spi_addr[23]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(23),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => buffer_next(7),
      O => p_1_in(23)
    );
\spi_addr[23]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000FFFE"
    )
        port map (
      I0 => romcode_EN_A_INST_0_i_2_n_0,
      I1 => bytecount_reg(2),
      I2 => bytecount_reg(6),
      I3 => romcode_EN_A_INST_0_i_1_n_0,
      I4 => \spi_addr[23]_i_6_n_0\,
      I5 => \spi_addr[23]_i_7_n_0\,
      O => \spi_addr[23]_i_3_n_0\
    );
\spi_addr[23]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => bytecount_reg(9),
      I1 => bytecount_reg(12),
      I2 => bytecount_reg(11),
      I3 => bytecount_reg(10),
      I4 => bytecount_reg(2),
      I5 => bytecount_reg(1),
      O => \spi_addr[23]_i_4_n_0\
    );
\spi_addr[23]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => bytecount_reg(6),
      I1 => bytecount_reg(4),
      I2 => bytecount_reg(3),
      I3 => bytecount_reg(5),
      I4 => bytecount_reg(7),
      I5 => bytecount_reg(8),
      O => \spi_addr[23]_i_5_n_0\
    );
\spi_addr[23]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => \spi_cmd_reg_n_0_[6]\,
      I1 => \spi_cmd_reg_n_0_[5]\,
      I2 => \spi_cmd_reg_n_0_[0]\,
      I3 => \spi_cmd_reg_n_0_[2]\,
      O => \spi_addr[23]_i_6_n_0\
    );
\spi_addr[23]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => \spi_cmd_reg_n_0_[7]\,
      I1 => \spi_cmd_reg_n_0_[4]\,
      I2 => \spi_cmd_reg_n_0_[1]\,
      I3 => \spi_cmd_reg_n_0_[3]\,
      O => \spi_addr[23]_i_7_n_0\
    );
\spi_addr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(2),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => buffer_next(2),
      O => p_1_in(2)
    );
\spi_addr[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(3),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => buffer_next(3),
      O => p_1_in(3)
    );
\spi_addr[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(4),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => buffer_next(4),
      O => p_1_in(4)
    );
\spi_addr[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(5),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => buffer_next(5),
      O => p_1_in(5)
    );
\spi_addr[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(6),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => buffer_next(6),
      O => p_1_in(6)
    );
\spi_addr[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA00000800"
    )
        port map (
      I0 => \spi_addr[15]_i_3_n_0\,
      I1 => \spi_addr[23]_i_5_n_0\,
      I2 => bytecount_reg(2),
      I3 => bytecount_reg(0),
      I4 => \spi_addr[15]_i_4_n_0\,
      I5 => \spi_addr[23]_i_3_n_0\,
      O => \spi_addr[7]_i_1_n_0\
    );
\spi_addr[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(7),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => buffer_next(7),
      O => p_1_in(7)
    );
\spi_addr[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(8),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => io0(0),
      O => p_1_in(8)
    );
\spi_addr[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => spi_addr0(9),
      I1 => \spi_addr[23]_i_3_n_0\,
      I2 => buffer_next(1),
      O => p_1_in(9)
    );
\spi_addr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[7]_i_1_n_0\,
      D => p_1_in(0),
      Q => \^romcode_addr_a\(0),
      R => '0'
    );
\spi_addr_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[15]_i_1_n_0\,
      D => p_1_in(10),
      Q => \^romcode_addr_a\(10),
      R => '0'
    );
\spi_addr_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[15]_i_1_n_0\,
      D => p_1_in(11),
      Q => \^romcode_addr_a\(11),
      R => '0'
    );
\spi_addr_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[15]_i_1_n_0\,
      D => p_1_in(12),
      Q => \^romcode_addr_a\(12),
      R => '0'
    );
\spi_addr_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[15]_i_1_n_0\,
      D => p_1_in(13),
      Q => \^romcode_addr_a\(13),
      R => '0'
    );
\spi_addr_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[15]_i_1_n_0\,
      D => p_1_in(14),
      Q => \^romcode_addr_a\(14),
      R => '0'
    );
\spi_addr_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[15]_i_1_n_0\,
      D => p_1_in(15),
      Q => \^romcode_addr_a\(15),
      R => '0'
    );
\spi_addr_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[23]_i_1_n_0\,
      D => p_1_in(16),
      Q => \^romcode_addr_a\(16),
      R => '0'
    );
\spi_addr_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[23]_i_1_n_0\,
      D => p_1_in(17),
      Q => \^romcode_addr_a\(17),
      R => '0'
    );
\spi_addr_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[23]_i_1_n_0\,
      D => p_1_in(18),
      Q => \^romcode_addr_a\(18),
      R => '0'
    );
\spi_addr_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[23]_i_1_n_0\,
      D => p_1_in(19),
      Q => \^romcode_addr_a\(19),
      R => '0'
    );
\spi_addr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[7]_i_1_n_0\,
      D => p_1_in(1),
      Q => \^romcode_addr_a\(1),
      R => '0'
    );
\spi_addr_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[23]_i_1_n_0\,
      D => p_1_in(20),
      Q => \^romcode_addr_a\(20),
      R => '0'
    );
\spi_addr_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[23]_i_1_n_0\,
      D => p_1_in(21),
      Q => \^romcode_addr_a\(21),
      R => '0'
    );
\spi_addr_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[23]_i_1_n_0\,
      D => p_1_in(22),
      Q => \^romcode_addr_a\(22),
      R => '0'
    );
\spi_addr_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[23]_i_1_n_0\,
      D => p_1_in(23),
      Q => \^romcode_addr_a\(23),
      R => '0'
    );
\spi_addr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[7]_i_1_n_0\,
      D => p_1_in(2),
      Q => \^romcode_addr_a\(2),
      R => '0'
    );
\spi_addr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[7]_i_1_n_0\,
      D => p_1_in(3),
      Q => \^romcode_addr_a\(3),
      R => '0'
    );
\spi_addr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[7]_i_1_n_0\,
      D => p_1_in(4),
      Q => \^romcode_addr_a\(4),
      R => '0'
    );
\spi_addr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[7]_i_1_n_0\,
      D => p_1_in(5),
      Q => \^romcode_addr_a\(5),
      R => '0'
    );
\spi_addr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[7]_i_1_n_0\,
      D => p_1_in(6),
      Q => \^romcode_addr_a\(6),
      R => '0'
    );
\spi_addr_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[7]_i_1_n_0\,
      D => p_1_in(7),
      Q => \^romcode_addr_a\(7),
      R => '0'
    );
\spi_addr_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[15]_i_1_n_0\,
      D => p_1_in(8),
      Q => \^romcode_addr_a\(8),
      R => '0'
    );
\spi_addr_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_addr[15]_i_1_n_0\,
      D => p_1_in(9),
      Q => \^romcode_addr_a\(9),
      R => '0'
    );
\spi_cmd[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => \spi_addr[23]_i_5_n_0\,
      I1 => sel,
      I2 => csb,
      I3 => bytecount_reg(0),
      I4 => \spi_addr[23]_i_4_n_0\,
      O => \spi_cmd[7]_i_1_n_0\
    );
\spi_cmd_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_cmd[7]_i_1_n_0\,
      D => io0(0),
      Q => \spi_cmd_reg_n_0_[0]\,
      R => '0'
    );
\spi_cmd_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_cmd[7]_i_1_n_0\,
      D => buffer_next(1),
      Q => \spi_cmd_reg_n_0_[1]\,
      R => '0'
    );
\spi_cmd_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_cmd[7]_i_1_n_0\,
      D => buffer_next(2),
      Q => \spi_cmd_reg_n_0_[2]\,
      R => '0'
    );
\spi_cmd_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_cmd[7]_i_1_n_0\,
      D => buffer_next(3),
      Q => \spi_cmd_reg_n_0_[3]\,
      R => '0'
    );
\spi_cmd_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_cmd[7]_i_1_n_0\,
      D => buffer_next(4),
      Q => \spi_cmd_reg_n_0_[4]\,
      R => '0'
    );
\spi_cmd_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_cmd[7]_i_1_n_0\,
      D => buffer_next(5),
      Q => \spi_cmd_reg_n_0_[5]\,
      R => '0'
    );
\spi_cmd_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_cmd[7]_i_1_n_0\,
      D => buffer_next(6),
      Q => \spi_cmd_reg_n_0_[6]\,
      R => '0'
    );
\spi_cmd_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => spiclk,
      CE => \spi_cmd[7]_i_1_n_0\,
      D => buffer_next(7),
      Q => \spi_cmd_reg_n_0_[7]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_spiflash_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_spiflash_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_spiflash_0_0 : entity is "design_1_spiflash_0_0,spiflash,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_spiflash_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_spiflash_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_spiflash_0_0 : entity is "spiflash,Vivado 2022.1";
end design_1_spiflash_0_0;

architecture STRUCTURE of design_1_spiflash_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^ap_clk\ : STD_LOGIC;
  signal \^ap_rst\ : STD_LOGIC;
  signal \^romcode_addr_a\ : STD_LOGIC_VECTOR ( 23 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ap_clk : signal is "xilinx.com:signal:clock:1.0 ap_clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ap_rst : signal is "xilinx.com:signal:reset:1.0 ap_rst RST";
  attribute X_INTERFACE_PARAMETER of ap_rst : signal is "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
begin
  \^ap_clk\ <= ap_clk;
  \^ap_rst\ <= ap_rst;
  romcode_Addr_A(31) <= \<const0>\;
  romcode_Addr_A(30) <= \<const0>\;
  romcode_Addr_A(29) <= \<const0>\;
  romcode_Addr_A(28) <= \<const0>\;
  romcode_Addr_A(27) <= \<const0>\;
  romcode_Addr_A(26) <= \<const0>\;
  romcode_Addr_A(25) <= \<const0>\;
  romcode_Addr_A(24) <= \<const0>\;
  romcode_Addr_A(23 downto 0) <= \^romcode_addr_a\(23 downto 0);
  romcode_Clk_A <= \^ap_clk\;
  romcode_Din_A(31) <= \<const0>\;
  romcode_Din_A(30) <= \<const0>\;
  romcode_Din_A(29) <= \<const0>\;
  romcode_Din_A(28) <= \<const0>\;
  romcode_Din_A(27) <= \<const0>\;
  romcode_Din_A(26) <= \<const0>\;
  romcode_Din_A(25) <= \<const0>\;
  romcode_Din_A(24) <= \<const0>\;
  romcode_Din_A(23) <= \<const0>\;
  romcode_Din_A(22) <= \<const0>\;
  romcode_Din_A(21) <= \<const0>\;
  romcode_Din_A(20) <= \<const0>\;
  romcode_Din_A(19) <= \<const0>\;
  romcode_Din_A(18) <= \<const0>\;
  romcode_Din_A(17) <= \<const0>\;
  romcode_Din_A(16) <= \<const0>\;
  romcode_Din_A(15) <= \<const0>\;
  romcode_Din_A(14) <= \<const0>\;
  romcode_Din_A(13) <= \<const0>\;
  romcode_Din_A(12) <= \<const0>\;
  romcode_Din_A(11) <= \<const0>\;
  romcode_Din_A(10) <= \<const0>\;
  romcode_Din_A(9) <= \<const0>\;
  romcode_Din_A(8) <= \<const0>\;
  romcode_Din_A(7) <= \<const0>\;
  romcode_Din_A(6) <= \<const0>\;
  romcode_Din_A(5) <= \<const0>\;
  romcode_Din_A(4) <= \<const0>\;
  romcode_Din_A(3) <= \<const0>\;
  romcode_Din_A(2) <= \<const0>\;
  romcode_Din_A(1) <= \<const0>\;
  romcode_Din_A(0) <= \<const0>\;
  romcode_Rst_A <= \^ap_rst\;
  romcode_WEN_A(3) <= \<const0>\;
  romcode_WEN_A(2) <= \<const0>\;
  romcode_WEN_A(1) <= \<const0>\;
  romcode_WEN_A(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.design_1_spiflash_0_0_spiflash
     port map (
      \bytecount_reg[6]_0\ => romcode_EN_A,
      csb => csb,
      io0(0) => io0(0),
      io1 => io1,
      romcode_Addr_A(23 downto 0) => \^romcode_addr_a\(23 downto 0),
      romcode_Dout_A(31 downto 0) => romcode_Dout_A(31 downto 0),
      spiclk => spiclk
    );
end STRUCTURE;
