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
// 0x10 : Data signal of outpin_ctrl
//        bit 0  - outpin_ctrl[0] (Read/Write)
//        others - reserved
// 0x14 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XOUTPUT_PIN_CONTROL_ADDR_OUTPIN_CTRL_DATA 0x10
#define XOUTPUT_PIN_CONTROL_BITS_OUTPIN_CTRL_DATA 1

