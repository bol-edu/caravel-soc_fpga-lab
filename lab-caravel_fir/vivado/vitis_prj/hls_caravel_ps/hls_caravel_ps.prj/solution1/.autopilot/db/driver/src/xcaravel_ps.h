// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XCARAVEL_PS_H
#define XCARAVEL_PS_H

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
#include "xcaravel_ps_hw.h"

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
} XCaravel_ps_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XCaravel_ps;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XCaravel_ps_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XCaravel_ps_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XCaravel_ps_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XCaravel_ps_ReadReg(BaseAddress, RegOffset) \
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
int XCaravel_ps_Initialize(XCaravel_ps *InstancePtr, u16 DeviceId);
XCaravel_ps_Config* XCaravel_ps_LookupConfig(u16 DeviceId);
int XCaravel_ps_CfgInitialize(XCaravel_ps *InstancePtr, XCaravel_ps_Config *ConfigPtr);
#else
int XCaravel_ps_Initialize(XCaravel_ps *InstancePtr, const char* InstanceName);
int XCaravel_ps_Release(XCaravel_ps *InstancePtr);
#endif


void XCaravel_ps_Set_ps_mprj_in(XCaravel_ps *InstancePtr, u64 Data);
u64 XCaravel_ps_Get_ps_mprj_in(XCaravel_ps *InstancePtr);
u64 XCaravel_ps_Get_ps_mprj_out(XCaravel_ps *InstancePtr);
u32 XCaravel_ps_Get_ps_mprj_out_vld(XCaravel_ps *InstancePtr);
u64 XCaravel_ps_Get_ps_mprj_en(XCaravel_ps *InstancePtr);
u32 XCaravel_ps_Get_ps_mprj_en_vld(XCaravel_ps *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
