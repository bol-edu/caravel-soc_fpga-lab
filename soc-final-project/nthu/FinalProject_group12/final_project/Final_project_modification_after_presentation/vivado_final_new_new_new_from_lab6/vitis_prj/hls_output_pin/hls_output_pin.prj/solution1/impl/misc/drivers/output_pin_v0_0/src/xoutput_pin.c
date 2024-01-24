// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xoutput_pin.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XOutput_pin_CfgInitialize(XOutput_pin *InstancePtr, XOutput_pin_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XOutput_pin_Set_outpin_ctrl(XOutput_pin *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOutput_pin_WriteReg(InstancePtr->Control_BaseAddress, XOUTPUT_PIN_CONTROL_ADDR_OUTPIN_CTRL_DATA, Data);
}

u32 XOutput_pin_Get_outpin_ctrl(XOutput_pin *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOutput_pin_ReadReg(InstancePtr->Control_BaseAddress, XOUTPUT_PIN_CONTROL_ADDR_OUTPIN_CTRL_DATA);
    return Data;
}

