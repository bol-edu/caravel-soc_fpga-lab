// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xoutput_pin.h"

extern XOutput_pin_Config XOutput_pin_ConfigTable[];

XOutput_pin_Config *XOutput_pin_LookupConfig(u16 DeviceId) {
	XOutput_pin_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XOUTPUT_PIN_NUM_INSTANCES; Index++) {
		if (XOutput_pin_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XOutput_pin_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XOutput_pin_Initialize(XOutput_pin *InstancePtr, u16 DeviceId) {
	XOutput_pin_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XOutput_pin_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XOutput_pin_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

