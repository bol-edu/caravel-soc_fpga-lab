// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of ps_mprj_in
//        bit 31~0 - ps_mprj_in[31:0] (Read/Write)
// 0x14 : Data signal of ps_mprj_in
//        bit 5~0 - ps_mprj_in[37:32] (Read/Write)
//        others  - reserved
// 0x18 : reserved
// 0x1c : Data signal of ps_mprj_out
//        bit 31~0 - ps_mprj_out[31:0] (Read)
// 0x20 : Data signal of ps_mprj_out
//        bit 5~0 - ps_mprj_out[37:32] (Read)
//        others  - reserved
// 0x24 : Control signal of ps_mprj_out
//        bit 0  - ps_mprj_out_ap_vld (Read/COR)
//        others - reserved
// 0x34 : Data signal of ps_mprj_en
//        bit 31~0 - ps_mprj_en[31:0] (Read)
// 0x38 : Data signal of ps_mprj_en
//        bit 5~0 - ps_mprj_en[37:32] (Read)
//        others  - reserved
// 0x3c : Control signal of ps_mprj_en
//        bit 0  - ps_mprj_en_ap_vld (Read/COR)
//        others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XCARAVEL_PS_CONTROL_ADDR_PS_MPRJ_IN_DATA  0x10
#define XCARAVEL_PS_CONTROL_BITS_PS_MPRJ_IN_DATA  38
#define XCARAVEL_PS_CONTROL_ADDR_PS_MPRJ_OUT_DATA 0x1c
#define XCARAVEL_PS_CONTROL_BITS_PS_MPRJ_OUT_DATA 38
#define XCARAVEL_PS_CONTROL_ADDR_PS_MPRJ_OUT_CTRL 0x24
#define XCARAVEL_PS_CONTROL_ADDR_PS_MPRJ_EN_DATA  0x34
#define XCARAVEL_PS_CONTROL_BITS_PS_MPRJ_EN_DATA  38
#define XCARAVEL_PS_CONTROL_ADDR_PS_MPRJ_EN_CTRL  0x3c

