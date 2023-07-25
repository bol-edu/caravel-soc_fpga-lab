// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Fri Jun  2 19:19:46 2023
// Host        : josh-All-Series running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/josh/caravel-soc_fpga/vivado/vvd_caravel_fpga/vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_blk_mem_gen_0_0/design_1_blk_mem_gen_0_0_sim_netlist.v
// Design      : design_1_blk_mem_gen_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_blk_mem_gen_0_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module design_1_blk_mem_gen_0_0
   (clka,
    rsta,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    web,
    addrb,
    dinb,
    doutb,
    rsta_busy,
    rstb_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [31:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [3:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [31:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;
  output rsta_busy;
  output rstb_busy;

  wire [31:0]addra;
  wire [31:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire rsta;
  wire rsta_busy;
  wire rstb;
  wire rstb_busy;
  wire [3:0]wea;
  wire [3:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "32" *) 
  (* C_ADDRB_WIDTH = "32" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "1" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.7492 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "1" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "NONE" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "1" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  design_1_blk_mem_gen_0_0_blk_mem_gen_v8_4_5 U0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra[12:2],1'b0,1'b0}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addrb[12:2],1'b0,1'b0}),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[31:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(rsta),
        .rsta_busy(rsta_busy),
        .rstb(rstb),
        .rstb_busy(rstb_busy),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[31:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
RgPKnWr9n0dGgttm3akiFhAlfB96usOQYxnEmPhGyTGg1AbizYAjGPWLXBWl50n/d0IA71ci4aJB
wt6mtfyNADm3ZReK7D3mKu037BOgxryoEwwf1kiC6q/PllxsdAgEMfQrfHJ3E2AzSpdYjoxVYito
y0JW6CUDcWvWa4WV0EA=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
M0l6KpOGH3jL8eRt3NCD7e2USYnkg5H9GAnE1PKmnjiouFN3Y8kjWA2PZDAQLm9UW+TsC1HeVlzO
WjNCHkjR/6ubCsIcWfpPZWdIuAenlsyq8Y9l6b8vMj8JSbDEOiFF/GHSbKsn22MJdDJKEhHFK6GV
s8gR2vywRFwG69gIRE4qGhVB+WIg8GJrDpDMYH6lCjMkTrjXuKDUcNlJN3NPLuhJ7tsditwf1pr5
moJRmGpJnip/rGm0g4o4A6ev4CtePjoao8C1wFtzHkERX9oenhh7cGjDMejU5IrLv8NxFnLj1FpB
9MuF1beTU20NI5oAn6zLiLiOtXjf0ghU3AN4DA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
hAsrUfp6Qgjm8yBjNYTEtQmVQmMxzL8TE/3oiQSxSI3+yEkXAbQCXkT9mo+LCdv+fGECOB0istHd
eLtbsiYbxjxNxYkXiUrRE5O+aSxynIray+uF9DJigTEUZu8JJXUbzxK4DDUu1Lm9tpGps4+Prz1m
0gkj13RT/Y/418s2VTw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BP/54Wm/GJmb1jy0bxWJJX4aiKyiWPVh4X3VL30BQrmX4PlEsNKzBJH3Qu8IIYERfnFP0ifAgboa
vypMQ5Ed0BrMePGkWIgT6I8hxJCMFpHdkSK7m1giSKyZzFfTOrVqoNFXE+qdzLfY1J5hBWCvouYo
jllavK4N3gF9FLScH2AUWYVMcVth2QPaTAU2NLnAUNH8kgtBjBfc8/KbPPTznD1QNVqvFstzcbTA
hGQ1ETVPvINQ0KqxxAG5PRhtQD4+pC+hr/Tvk+RSvGyBOfy9zE86OXkJiYs9dSFhNiMFmCPL9DBO
se4OxNNC0/7aBtb1mkSEA9YFDYEb9jS7Jasy2A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
SnzT9DVH3xlEN8nrr2YrlvTO5qj7L22d7WaBcuKyTaiHoIwwFHrC4HQbfs0TAwkdWcOgmJoATPSF
F6qm0KiddbrlERF3MfKUldeGBJtqLdX+zGw7+3JD7S+HB9dIMOFOHy+IiCZp1/Pz8epKpi238cel
rcVoJQKz406wmXDvOo8KsT+XhRLs9BVCrBErPGGXKYDk6NXAp0duOgQE9DbslzMU83M/kUC7uERV
tQW02240peKQFp2elEZC7Tetvgp0TaFTtJiKN45REi8GQUCKGa85JjNIk1qb/+k95TIIP1xrHirc
6iX7qbwnPetv8TVu2NjkZ0WDEK5RXdOXcxBwHA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
erkR82V0jX8ytva+9MzEs0c75Z7j7TsgxWRLNAUfbbU28i+U9YzuZlSfYU75M0f9jx1gvxtBrfKv
cNHVdkR+i5zfHDZsDwfMEEBhs8wzDCKqe+eex6BBEvlIOesCPXrr2RozQgaQ1PBh/os2Arfu+873
BjsVxFJkbhpzIqlddOo/XZV9Yi+eih7A7pXXEBR6IL7Poo4Ka49MiVQU0xJrDTm+ddOuMPDRRD7g
dsxS/uzdcBcO2myV6g/7YH/C2Ce9s6+UywJN/0JeXSqwA7bsBqqnfFicVAT0lckLopMLiuzK7dsN
EwhFeqoetciFrDIj9+o0xDMWBZhgNP1u68vURA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
R+BI65BKLT0I9hEtsxGnDyM5XY9gzULeTPOSDXvd3KWOzZJAx6C0xlbyZcFZhAEG/QIK2yd0wAi6
IUWxyF/sx3HsqKjhVi5KxnpuXDBOZVoj811O7JukedFVmDW7OHGtBkuiJ5X5irw7mfsEKRQmF/1i
V6lj9HYHZEjxtDeZjACsLY4y1QxWalSKT4HIMOHznBLL8dLbGMlS+ZmFuFn0gcwZavVl7gTkTtkf
W0gn01A9ru7NKsf+iLX0kj4dgItPu9N2g02M1vWQ9UUQEVvfV7lUc7GY1suibrD8aEkhH9S7lZ7n
bFsT4qxyvzg8ML6v4g4v7N6VuyhEtgFgNd725Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
jNUVKiwH68vHsU54idgvKwaVJcoxTUuxfgrQpbpmM/IpesWA3wHsGzYClwAxkKzw3KRnFyQqTWcZ
yj1EQ2CMBxlJ0kyNbZW8OK8pXzeigToZ0U6Aq3Gy+j7wBbhe83wE1Ygn82sK8dHTEulvaRLn/c5r
ispy1s7jMKIvYNzoUuZrgyBQyfaYmdqUia8XlQjFd+VwzhTXKwzvmaqHWyaHjfBKeCooO7+oUxMG
OJg83W54EVe9ronFQ8Wr9EOL8ia7qelCAgyQe/bC0HHCoMAm8apI7sX23iMR/wMiPP5V2bQzycy+
rBX/+SWkqSeIE1FLm+muFPvrE7iLwJaW8d1fzdFFjAZ5aIXArbWNfwbK8S0TczXc9lEzmpb69rwA
UJIrs4alo81qGQ32UFhjuMQjX75O9Od1HWHDj5PFaT/Ja5Ly+bK8Cc3gfO6dCE81m7d+B2JBZ/Hl
tBA19QuOAYwT2EIPOdpaVtCULb33cWODWu3qQFhZMmDzKTb3kwpcr0LL

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MnzcA2swaxH1LRacKDou0ZmiiMRETbWIdHgeBgyQz7ILronsXLoB/C20WuFNGEVSiL2/51EZ6MXZ
vMHI8fFcMQCJcuTBDBibUMKv6bXI9s8fTbtrBZppbF/R1icG5JYhqmX4aRnv4W/dxJRjI2L35nLN
Y48E9OfgfkD1sr+IRwx8WEKFmUhuk8dLe0VOK7ywe3XEcneYvrz+HhPj16bGmNfMwNnDgZ3gKKZD
hRnys+jzvAX3HyISrErWXhMKrhWMxXeTNFJCqNQ0LWAVHQYwyKnF5xVpyXSuGNSIrva+QXqOrZBG
3VNLirNVtMRiKLfwZeMaqvswkqBDAa53utlAAA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
d0xXkKtsKM8GvXhDZr16p1+oE3uBtD04BJ76eGGIEj/CFECfHVy9qsJ43oSKjas0+AJr4GFFnVb6
X7gJV6MmX/OboC9ier5joUCGz0mxVzkRZK9a+LPEDcg0K6+cLE36kr+FfxW9Uk2816EHBCMCf5mK
A4eAhSmAb5Nq74F/q0quiG416npbny7faiQ+xmPDfYYiM3UuMKaD4iE8ODlz1w5xThPllWESf3LZ
NTkw6fozyTqZ47vvE21O3dgIGAY1v+C6BwlCK24VwPJa1xs9csY+qTk31j5jjAc1ExlB6QF7t9UH
lk70qdNPWxT87OH7kFT8UvPO1D6BTC3/WkDZfA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LYhdzKTvo93uJrAaiP5OfCDuOnu2BSvPnxlv6I7h2n1+xHtj34LNNKzWEgOg9dUV9cYDaHYUjjEt
DKdWcz6mZ61d5qyxAhpv67fc90v7JVgtOAcT94/Yb+AuLxXFcGA6Gic7uoJtUgz6JmTnb22Dxdjc
KuIewDj4IOTfP8XGXKTaF+cNp0CFrQgTAcVSQFyLFxr0I/9h3S+GZLecA7ntEeHEOfCJzPvy0ddi
7MCdQWECLb+fXC0IAn8V95TumcpINiRAX1BHi9IGJ4QoMrb3jOCrPkFhDMTJj2aiImUWdi/l/0QE
d7wcXlgIEYVeoKYUOJ4mqy+zZPUbLNeOPADUDQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 59888)
`pragma protect data_block
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
`pragma protect end_protected
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
