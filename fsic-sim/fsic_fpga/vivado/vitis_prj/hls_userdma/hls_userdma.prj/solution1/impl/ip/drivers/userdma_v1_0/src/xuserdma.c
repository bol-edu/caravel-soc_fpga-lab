// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xuserdma.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XUserdma_CfgInitialize(XUserdma *InstancePtr, XUserdma_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XUserdma_Start(XUserdma *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_AP_CTRL) & 0x80;
    XUserdma_WriteReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XUserdma_IsDone(XUserdma *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XUserdma_IsIdle(XUserdma *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XUserdma_IsReady(XUserdma *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XUserdma_EnableAutoRestart(XUserdma *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XUserdma_WriteReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XUserdma_DisableAutoRestart(XUserdma *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XUserdma_WriteReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_AP_CTRL, 0);
}

u32 XUserdma_Get_s2m_buf_sts(XUserdma *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_S2M_BUF_STS_DATA);
    return Data;
}

u32 XUserdma_Get_s2m_buf_sts_vld(XUserdma *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_S2M_BUF_STS_CTRL);
    return Data & 0x1;
}

void XUserdma_Set_s2m_sts_clear(XUserdma *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XUserdma_WriteReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_S2M_STS_CLEAR_DATA, Data);
}

u32 XUserdma_Get_s2m_sts_clear(XUserdma *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_S2M_STS_CLEAR_DATA);
    return Data;
}

void XUserdma_Set_s2m_len(XUserdma *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XUserdma_WriteReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_S2M_LEN_DATA, Data);
}

u32 XUserdma_Get_s2m_len(XUserdma *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_S2M_LEN_DATA);
    return Data;
}

void XUserdma_Set_s2m_enb_clrsts(XUserdma *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XUserdma_WriteReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_S2M_ENB_CLRSTS_DATA, Data);
}

u32 XUserdma_Get_s2m_enb_clrsts(XUserdma *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_S2M_ENB_CLRSTS_DATA);
    return Data;
}

void XUserdma_Set_s2mbuf(XUserdma *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XUserdma_WriteReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_S2MBUF_DATA, (u32)(Data));
    XUserdma_WriteReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_S2MBUF_DATA + 4, (u32)(Data >> 32));
}

u64 XUserdma_Get_s2mbuf(XUserdma *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_S2MBUF_DATA);
    Data += (u64)XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_S2MBUF_DATA + 4) << 32;
    return Data;
}

u32 XUserdma_Get_s2m_err(XUserdma *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_S2M_ERR_DATA);
    return Data;
}

u32 XUserdma_Get_s2m_err_vld(XUserdma *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_S2M_ERR_CTRL);
    return Data & 0x1;
}

void XUserdma_Set_Img_width(XUserdma *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XUserdma_WriteReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_IMG_WIDTH_DATA, Data);
}

u32 XUserdma_Get_Img_width(XUserdma *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_IMG_WIDTH_DATA);
    return Data;
}

void XUserdma_Set_m2sbuf(XUserdma *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XUserdma_WriteReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_M2SBUF_DATA, (u32)(Data));
    XUserdma_WriteReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_M2SBUF_DATA + 4, (u32)(Data >> 32));
}

u64 XUserdma_Get_m2sbuf(XUserdma *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_M2SBUF_DATA);
    Data += (u64)XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_M2SBUF_DATA + 4) << 32;
    return Data;
}

u32 XUserdma_Get_m2s_buf_sts(XUserdma *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_M2S_BUF_STS_DATA);
    return Data;
}

u32 XUserdma_Get_m2s_buf_sts_vld(XUserdma *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_M2S_BUF_STS_CTRL);
    return Data & 0x1;
}

void XUserdma_Set_m2s_sts_clear(XUserdma *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XUserdma_WriteReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_M2S_STS_CLEAR_DATA, Data);
}

u32 XUserdma_Get_m2s_sts_clear(XUserdma *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_M2S_STS_CLEAR_DATA);
    return Data;
}

void XUserdma_Set_m2s_len(XUserdma *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XUserdma_WriteReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_M2S_LEN_DATA, Data);
}

u32 XUserdma_Get_m2s_len(XUserdma *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_M2S_LEN_DATA);
    return Data;
}

void XUserdma_Set_m2s_enb_clrsts(XUserdma *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XUserdma_WriteReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_M2S_ENB_CLRSTS_DATA, Data);
}

u32 XUserdma_Get_m2s_enb_clrsts(XUserdma *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_M2S_ENB_CLRSTS_DATA);
    return Data;
}

void XUserdma_InterruptGlobalEnable(XUserdma *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XUserdma_WriteReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_GIE, 1);
}

void XUserdma_InterruptGlobalDisable(XUserdma *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XUserdma_WriteReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_GIE, 0);
}

void XUserdma_InterruptEnable(XUserdma *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_IER);
    XUserdma_WriteReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_IER, Register | Mask);
}

void XUserdma_InterruptDisable(XUserdma *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_IER);
    XUserdma_WriteReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_IER, Register & (~Mask));
}

void XUserdma_InterruptClear(XUserdma *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    //XUserdma_WriteReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_ISR, Mask);
}

u32 XUserdma_InterruptGetEnabled(XUserdma *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_IER);
}

u32 XUserdma_InterruptGetStatus(XUserdma *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    // Current Interrupt Clear Behavior is Clear on Read(COR).
    return XUserdma_ReadReg(InstancePtr->Control_BaseAddress, XUSERDMA_CONTROL_ADDR_ISR);
}

