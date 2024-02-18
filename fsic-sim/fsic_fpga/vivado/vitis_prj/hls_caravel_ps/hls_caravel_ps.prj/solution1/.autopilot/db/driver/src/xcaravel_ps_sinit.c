// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xcaravel_ps.h"

extern XCaravel_ps_Config XCaravel_ps_ConfigTable[];

XCaravel_ps_Config *XCaravel_ps_LookupConfig(u16 DeviceId) {
	XCaravel_ps_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XCARAVEL_PS_NUM_INSTANCES; Index++) {
		if (XCaravel_ps_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XCaravel_ps_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XCaravel_ps_Initialize(XCaravel_ps *InstancePtr, u16 DeviceId) {
	XCaravel_ps_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XCaravel_ps_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XCaravel_ps_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

