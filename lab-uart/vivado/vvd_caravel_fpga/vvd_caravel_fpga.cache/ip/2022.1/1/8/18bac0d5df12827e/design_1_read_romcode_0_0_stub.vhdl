-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
-- Date        : Fri Jun  2 19:17:56 2023
-- Host        : josh-All-Series running 64-bit Ubuntu 20.04.3 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_read_romcode_0_0_stub.vhdl
-- Design      : design_1_read_romcode_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
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
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    m_axi_BUS0_AWADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_BUS0_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_BUS0_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_BUS0_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_BUS0_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_BUS0_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_BUS0_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_BUS0_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_BUS0_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_BUS0_AWVALID : out STD_LOGIC;
    m_axi_BUS0_AWREADY : in STD_LOGIC;
    m_axi_BUS0_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_BUS0_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_BUS0_WLAST : out STD_LOGIC;
    m_axi_BUS0_WVALID : out STD_LOGIC;
    m_axi_BUS0_WREADY : in STD_LOGIC;
    m_axi_BUS0_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_BUS0_BVALID : in STD_LOGIC;
    m_axi_BUS0_BREADY : out STD_LOGIC;
    m_axi_BUS0_ARADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_BUS0_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_BUS0_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_BUS0_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_BUS0_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_BUS0_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_BUS0_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_BUS0_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_BUS0_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_BUS0_ARVALID : out STD_LOGIC;
    m_axi_BUS0_ARREADY : in STD_LOGIC;
    m_axi_BUS0_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_BUS0_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_BUS0_RLAST : in STD_LOGIC;
    m_axi_BUS0_RVALID : in STD_LOGIC;
    m_axi_BUS0_RREADY : out STD_LOGIC;
    internal_bram_Clk_A : out STD_LOGIC;
    internal_bram_Rst_A : out STD_LOGIC;
    internal_bram_EN_A : out STD_LOGIC;
    internal_bram_WEN_A : out STD_LOGIC_VECTOR ( 3 downto 0 );
    internal_bram_Addr_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    internal_bram_Din_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    internal_bram_Dout_A : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_control_AWADDR[5:0],s_axi_control_AWVALID,s_axi_control_AWREADY,s_axi_control_WDATA[31:0],s_axi_control_WSTRB[3:0],s_axi_control_WVALID,s_axi_control_WREADY,s_axi_control_BRESP[1:0],s_axi_control_BVALID,s_axi_control_BREADY,s_axi_control_ARADDR[5:0],s_axi_control_ARVALID,s_axi_control_ARREADY,s_axi_control_RDATA[31:0],s_axi_control_RRESP[1:0],s_axi_control_RVALID,s_axi_control_RREADY,ap_clk,ap_rst_n,interrupt,m_axi_BUS0_AWADDR[63:0],m_axi_BUS0_AWLEN[7:0],m_axi_BUS0_AWSIZE[2:0],m_axi_BUS0_AWBURST[1:0],m_axi_BUS0_AWLOCK[1:0],m_axi_BUS0_AWREGION[3:0],m_axi_BUS0_AWCACHE[3:0],m_axi_BUS0_AWPROT[2:0],m_axi_BUS0_AWQOS[3:0],m_axi_BUS0_AWVALID,m_axi_BUS0_AWREADY,m_axi_BUS0_WDATA[31:0],m_axi_BUS0_WSTRB[3:0],m_axi_BUS0_WLAST,m_axi_BUS0_WVALID,m_axi_BUS0_WREADY,m_axi_BUS0_BRESP[1:0],m_axi_BUS0_BVALID,m_axi_BUS0_BREADY,m_axi_BUS0_ARADDR[63:0],m_axi_BUS0_ARLEN[7:0],m_axi_BUS0_ARSIZE[2:0],m_axi_BUS0_ARBURST[1:0],m_axi_BUS0_ARLOCK[1:0],m_axi_BUS0_ARREGION[3:0],m_axi_BUS0_ARCACHE[3:0],m_axi_BUS0_ARPROT[2:0],m_axi_BUS0_ARQOS[3:0],m_axi_BUS0_ARVALID,m_axi_BUS0_ARREADY,m_axi_BUS0_RDATA[31:0],m_axi_BUS0_RRESP[1:0],m_axi_BUS0_RLAST,m_axi_BUS0_RVALID,m_axi_BUS0_RREADY,internal_bram_Clk_A,internal_bram_Rst_A,internal_bram_EN_A,internal_bram_WEN_A[3:0],internal_bram_Addr_A[31:0],internal_bram_Din_A[31:0],internal_bram_Dout_A[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "read_romcode,Vivado 2022.1";
begin
end;
