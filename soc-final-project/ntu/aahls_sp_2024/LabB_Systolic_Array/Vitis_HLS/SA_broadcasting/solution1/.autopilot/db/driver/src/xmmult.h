// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XMMULT_H
#define XMMULT_H

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
#include "xmmult_hw.h"

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
} XMmult_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XMmult;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XMmult_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XMmult_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XMmult_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XMmult_ReadReg(BaseAddress, RegOffset) \
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
int XMmult_Initialize(XMmult *InstancePtr, u16 DeviceId);
XMmult_Config* XMmult_LookupConfig(u16 DeviceId);
int XMmult_CfgInitialize(XMmult *InstancePtr, XMmult_Config *ConfigPtr);
#else
int XMmult_Initialize(XMmult *InstancePtr, const char* InstanceName);
int XMmult_Release(XMmult *InstancePtr);
#endif

void XMmult_Start(XMmult *InstancePtr);
u32 XMmult_IsDone(XMmult *InstancePtr);
u32 XMmult_IsIdle(XMmult *InstancePtr);
u32 XMmult_IsReady(XMmult *InstancePtr);
void XMmult_EnableAutoRestart(XMmult *InstancePtr);
void XMmult_DisableAutoRestart(XMmult *InstancePtr);

void XMmult_Set_a(XMmult *InstancePtr, u64 Data);
u64 XMmult_Get_a(XMmult *InstancePtr);
void XMmult_Set_b(XMmult *InstancePtr, u64 Data);
u64 XMmult_Get_b(XMmult *InstancePtr);
void XMmult_Set_c(XMmult *InstancePtr, u64 Data);
u64 XMmult_Get_c(XMmult *InstancePtr);
void XMmult_Set_a_row(XMmult *InstancePtr, u32 Data);
u32 XMmult_Get_a_row(XMmult *InstancePtr);
void XMmult_Set_a_col(XMmult *InstancePtr, u32 Data);
u32 XMmult_Get_a_col(XMmult *InstancePtr);
void XMmult_Set_b_col(XMmult *InstancePtr, u32 Data);
u32 XMmult_Get_b_col(XMmult *InstancePtr);

void XMmult_InterruptGlobalEnable(XMmult *InstancePtr);
void XMmult_InterruptGlobalDisable(XMmult *InstancePtr);
void XMmult_InterruptEnable(XMmult *InstancePtr, u32 Mask);
void XMmult_InterruptDisable(XMmult *InstancePtr, u32 Mask);
void XMmult_InterruptClear(XMmult *InstancePtr, u32 Mask);
u32 XMmult_InterruptGetEnabled(XMmult *InstancePtr);
u32 XMmult_InterruptGetStatus(XMmult *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
