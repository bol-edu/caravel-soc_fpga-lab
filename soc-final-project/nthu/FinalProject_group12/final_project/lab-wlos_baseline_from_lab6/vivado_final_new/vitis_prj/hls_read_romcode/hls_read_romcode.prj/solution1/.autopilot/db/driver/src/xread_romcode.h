// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XREAD_ROMCODE_H
#define XREAD_ROMCODE_H

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
#include "xread_romcode_hw.h"

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
} XRead_romcode_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XRead_romcode;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XRead_romcode_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XRead_romcode_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XRead_romcode_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XRead_romcode_ReadReg(BaseAddress, RegOffset) \
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
int XRead_romcode_Initialize(XRead_romcode *InstancePtr, u16 DeviceId);
XRead_romcode_Config* XRead_romcode_LookupConfig(u16 DeviceId);
int XRead_romcode_CfgInitialize(XRead_romcode *InstancePtr, XRead_romcode_Config *ConfigPtr);
#else
int XRead_romcode_Initialize(XRead_romcode *InstancePtr, const char* InstanceName);
int XRead_romcode_Release(XRead_romcode *InstancePtr);
#endif

void XRead_romcode_Start(XRead_romcode *InstancePtr);
u32 XRead_romcode_IsDone(XRead_romcode *InstancePtr);
u32 XRead_romcode_IsIdle(XRead_romcode *InstancePtr);
u32 XRead_romcode_IsReady(XRead_romcode *InstancePtr);
void XRead_romcode_EnableAutoRestart(XRead_romcode *InstancePtr);
void XRead_romcode_DisableAutoRestart(XRead_romcode *InstancePtr);

void XRead_romcode_Set_romcode(XRead_romcode *InstancePtr, u64 Data);
u64 XRead_romcode_Get_romcode(XRead_romcode *InstancePtr);
void XRead_romcode_Set_length_r(XRead_romcode *InstancePtr, u32 Data);
u32 XRead_romcode_Get_length_r(XRead_romcode *InstancePtr);

void XRead_romcode_InterruptGlobalEnable(XRead_romcode *InstancePtr);
void XRead_romcode_InterruptGlobalDisable(XRead_romcode *InstancePtr);
void XRead_romcode_InterruptEnable(XRead_romcode *InstancePtr, u32 Mask);
void XRead_romcode_InterruptDisable(XRead_romcode *InstancePtr, u32 Mask);
void XRead_romcode_InterruptClear(XRead_romcode *InstancePtr, u32 Mask);
u32 XRead_romcode_InterruptGetEnabled(XRead_romcode *InstancePtr);
u32 XRead_romcode_InterruptGetStatus(XRead_romcode *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
