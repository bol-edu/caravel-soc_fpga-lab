// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xuserdma.h"

extern XUserdma_Config XUserdma_ConfigTable[];

XUserdma_Config *XUserdma_LookupConfig(u16 DeviceId) {
	XUserdma_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XUSERDMA_NUM_INSTANCES; Index++) {
		if (XUserdma_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XUserdma_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XUserdma_Initialize(XUserdma *InstancePtr, u16 DeviceId) {
	XUserdma_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XUserdma_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XUserdma_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

