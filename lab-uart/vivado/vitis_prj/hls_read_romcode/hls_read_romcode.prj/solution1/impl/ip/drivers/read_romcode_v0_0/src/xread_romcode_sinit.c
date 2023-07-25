// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xread_romcode.h"

extern XRead_romcode_Config XRead_romcode_ConfigTable[];

XRead_romcode_Config *XRead_romcode_LookupConfig(u16 DeviceId) {
	XRead_romcode_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XREAD_ROMCODE_NUM_INSTANCES; Index++) {
		if (XRead_romcode_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XRead_romcode_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XRead_romcode_Initialize(XRead_romcode *InstancePtr, u16 DeviceId) {
	XRead_romcode_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XRead_romcode_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XRead_romcode_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

