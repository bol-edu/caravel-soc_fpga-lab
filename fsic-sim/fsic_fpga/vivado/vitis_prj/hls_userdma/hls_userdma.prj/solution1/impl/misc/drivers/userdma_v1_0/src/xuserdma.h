// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XUSERDMA_H
#define XUSERDMA_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xuserdma_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XUserdma_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XUserdma;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XUserdma_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XUserdma_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XUserdma_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XUserdma_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XUserdma_Initialize(XUserdma *InstancePtr, u16 DeviceId);
XUserdma_Config* XUserdma_LookupConfig(u16 DeviceId);
int XUserdma_CfgInitialize(XUserdma *InstancePtr, XUserdma_Config *ConfigPtr);
#else
int XUserdma_Initialize(XUserdma *InstancePtr, const char* InstanceName);
int XUserdma_Release(XUserdma *InstancePtr);
#endif

void XUserdma_Start(XUserdma *InstancePtr);
u32 XUserdma_IsDone(XUserdma *InstancePtr);
u32 XUserdma_IsIdle(XUserdma *InstancePtr);
u32 XUserdma_IsReady(XUserdma *InstancePtr);
void XUserdma_EnableAutoRestart(XUserdma *InstancePtr);
void XUserdma_DisableAutoRestart(XUserdma *InstancePtr);

u32 XUserdma_Get_s2m_buf_sts(XUserdma *InstancePtr);
u32 XUserdma_Get_s2m_buf_sts_vld(XUserdma *InstancePtr);
void XUserdma_Set_s2m_sts_clear(XUserdma *InstancePtr, u32 Data);
u32 XUserdma_Get_s2m_sts_clear(XUserdma *InstancePtr);
void XUserdma_Set_s2m_len(XUserdma *InstancePtr, u32 Data);
u32 XUserdma_Get_s2m_len(XUserdma *InstancePtr);
void XUserdma_Set_s2m_enb_clrsts(XUserdma *InstancePtr, u32 Data);
u32 XUserdma_Get_s2m_enb_clrsts(XUserdma *InstancePtr);
void XUserdma_Set_s2mbuf(XUserdma *InstancePtr, u64 Data);
u64 XUserdma_Get_s2mbuf(XUserdma *InstancePtr);
u32 XUserdma_Get_s2m_err(XUserdma *InstancePtr);
u32 XUserdma_Get_s2m_err_vld(XUserdma *InstancePtr);
void XUserdma_Set_Img_width(XUserdma *InstancePtr, u32 Data);
u32 XUserdma_Get_Img_width(XUserdma *InstancePtr);
void XUserdma_Set_m2sbuf(XUserdma *InstancePtr, u64 Data);
u64 XUserdma_Get_m2sbuf(XUserdma *InstancePtr);
u32 XUserdma_Get_m2s_buf_sts(XUserdma *InstancePtr);
u32 XUserdma_Get_m2s_buf_sts_vld(XUserdma *InstancePtr);
void XUserdma_Set_m2s_sts_clear(XUserdma *InstancePtr, u32 Data);
u32 XUserdma_Get_m2s_sts_clear(XUserdma *InstancePtr);
void XUserdma_Set_m2s_len(XUserdma *InstancePtr, u32 Data);
u32 XUserdma_Get_m2s_len(XUserdma *InstancePtr);
void XUserdma_Set_m2s_enb_clrsts(XUserdma *InstancePtr, u32 Data);
u32 XUserdma_Get_m2s_enb_clrsts(XUserdma *InstancePtr);

void XUserdma_InterruptGlobalEnable(XUserdma *InstancePtr);
void XUserdma_InterruptGlobalDisable(XUserdma *InstancePtr);
void XUserdma_InterruptEnable(XUserdma *InstancePtr, u32 Mask);
void XUserdma_InterruptDisable(XUserdma *InstancePtr, u32 Mask);
void XUserdma_InterruptClear(XUserdma *InstancePtr, u32 Mask);
u32 XUserdma_InterruptGetEnabled(XUserdma *InstancePtr);
u32 XUserdma_InterruptGetStatus(XUserdma *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
