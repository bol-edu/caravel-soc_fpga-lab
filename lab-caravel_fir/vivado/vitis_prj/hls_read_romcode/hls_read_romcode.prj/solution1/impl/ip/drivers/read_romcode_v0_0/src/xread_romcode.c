// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xread_romcode.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XRead_romcode_CfgInitialize(XRead_romcode *InstancePtr, XRead_romcode_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XRead_romcode_Start(XRead_romcode *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRead_romcode_ReadReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_AP_CTRL) & 0x80;
    XRead_romcode_WriteReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XRead_romcode_IsDone(XRead_romcode *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRead_romcode_ReadReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XRead_romcode_IsIdle(XRead_romcode *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRead_romcode_ReadReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XRead_romcode_IsReady(XRead_romcode *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRead_romcode_ReadReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XRead_romcode_EnableAutoRestart(XRead_romcode *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRead_romcode_WriteReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XRead_romcode_DisableAutoRestart(XRead_romcode *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRead_romcode_WriteReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_AP_CTRL, 0);
}

void XRead_romcode_Set_romcode(XRead_romcode *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRead_romcode_WriteReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_ROMCODE_DATA, (u32)(Data));
    XRead_romcode_WriteReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_ROMCODE_DATA + 4, (u32)(Data >> 32));
}

u64 XRead_romcode_Get_romcode(XRead_romcode *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRead_romcode_ReadReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_ROMCODE_DATA);
    Data += (u64)XRead_romcode_ReadReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_ROMCODE_DATA + 4) << 32;
    return Data;
}

void XRead_romcode_Set_length_r(XRead_romcode *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRead_romcode_WriteReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_LENGTH_R_DATA, Data);
}

u32 XRead_romcode_Get_length_r(XRead_romcode *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRead_romcode_ReadReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_LENGTH_R_DATA);
    return Data;
}

void XRead_romcode_InterruptGlobalEnable(XRead_romcode *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRead_romcode_WriteReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_GIE, 1);
}

void XRead_romcode_InterruptGlobalDisable(XRead_romcode *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRead_romcode_WriteReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_GIE, 0);
}

void XRead_romcode_InterruptEnable(XRead_romcode *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XRead_romcode_ReadReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_IER);
    XRead_romcode_WriteReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_IER, Register | Mask);
}

void XRead_romcode_InterruptDisable(XRead_romcode *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XRead_romcode_ReadReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_IER);
    XRead_romcode_WriteReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_IER, Register & (~Mask));
}

void XRead_romcode_InterruptClear(XRead_romcode *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    //XRead_romcode_WriteReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_ISR, Mask);
}

u32 XRead_romcode_InterruptGetEnabled(XRead_romcode *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XRead_romcode_ReadReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_IER);
}

u32 XRead_romcode_InterruptGetStatus(XRead_romcode *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    // Current Interrupt Clear Behavior is Clear on Read(COR).
    return XRead_romcode_ReadReg(InstancePtr->Control_BaseAddress, XREAD_ROMCODE_CONTROL_ADDR_ISR);
}

