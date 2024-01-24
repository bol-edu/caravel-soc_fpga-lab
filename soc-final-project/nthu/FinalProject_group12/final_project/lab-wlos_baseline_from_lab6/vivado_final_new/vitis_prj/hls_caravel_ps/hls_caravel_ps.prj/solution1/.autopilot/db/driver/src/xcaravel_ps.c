// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xcaravel_ps.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XCaravel_ps_CfgInitialize(XCaravel_ps *InstancePtr, XCaravel_ps_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XCaravel_ps_Set_ps_mprj_in(XCaravel_ps *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCaravel_ps_WriteReg(InstancePtr->Control_BaseAddress, XCARAVEL_PS_CONTROL_ADDR_PS_MPRJ_IN_DATA, (u32)(Data));
    XCaravel_ps_WriteReg(InstancePtr->Control_BaseAddress, XCARAVEL_PS_CONTROL_ADDR_PS_MPRJ_IN_DATA + 4, (u32)(Data >> 32));
}

u64 XCaravel_ps_Get_ps_mprj_in(XCaravel_ps *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCaravel_ps_ReadReg(InstancePtr->Control_BaseAddress, XCARAVEL_PS_CONTROL_ADDR_PS_MPRJ_IN_DATA);
    Data += (u64)XCaravel_ps_ReadReg(InstancePtr->Control_BaseAddress, XCARAVEL_PS_CONTROL_ADDR_PS_MPRJ_IN_DATA + 4) << 32;
    return Data;
}

u64 XCaravel_ps_Get_ps_mprj_out(XCaravel_ps *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCaravel_ps_ReadReg(InstancePtr->Control_BaseAddress, XCARAVEL_PS_CONTROL_ADDR_PS_MPRJ_OUT_DATA);
    Data += (u64)XCaravel_ps_ReadReg(InstancePtr->Control_BaseAddress, XCARAVEL_PS_CONTROL_ADDR_PS_MPRJ_OUT_DATA + 4) << 32;
    return Data;
}

u32 XCaravel_ps_Get_ps_mprj_out_vld(XCaravel_ps *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCaravel_ps_ReadReg(InstancePtr->Control_BaseAddress, XCARAVEL_PS_CONTROL_ADDR_PS_MPRJ_OUT_CTRL);
    return Data & 0x1;
}

u64 XCaravel_ps_Get_ps_mprj_en(XCaravel_ps *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCaravel_ps_ReadReg(InstancePtr->Control_BaseAddress, XCARAVEL_PS_CONTROL_ADDR_PS_MPRJ_EN_DATA);
    Data += (u64)XCaravel_ps_ReadReg(InstancePtr->Control_BaseAddress, XCARAVEL_PS_CONTROL_ADDR_PS_MPRJ_EN_DATA + 4) << 32;
    return Data;
}

u32 XCaravel_ps_Get_ps_mprj_en_vld(XCaravel_ps *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCaravel_ps_ReadReg(InstancePtr->Control_BaseAddress, XCARAVEL_PS_CONTROL_ADDR_PS_MPRJ_EN_CTRL);
    return Data & 0x1;
}

