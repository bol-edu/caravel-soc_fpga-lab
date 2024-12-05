set moduleName mmult_Pipeline_init
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {mmult_Pipeline_init}
set C_modelType { void 0 }
set C_modelArgList {
	{ inB_15_0_out int 32 regular {pointer 1}  }
	{ inB_14_0_out int 32 regular {pointer 1}  }
	{ inB_13_0_out int 32 regular {pointer 1}  }
	{ inB_12_0_out int 32 regular {pointer 1}  }
	{ inB_11_0_out int 32 regular {pointer 1}  }
	{ inB_10_0_out int 32 regular {pointer 1}  }
	{ inB_9_0_out int 32 regular {pointer 1}  }
	{ inB_8_0_out int 32 regular {pointer 1}  }
	{ inB_7_0_out int 32 regular {pointer 1}  }
	{ inB_6_0_out int 32 regular {pointer 1}  }
	{ inB_5_0_out int 32 regular {pointer 1}  }
	{ inB_4_0_out int 32 regular {pointer 1}  }
	{ inB_3_0_out int 32 regular {pointer 1}  }
	{ inB_2_0_out int 32 regular {pointer 1}  }
	{ inB_1_0_out int 32 regular {pointer 1}  }
	{ inB_0_out int 32 regular {pointer 1}  }
	{ inA_225_0_out int 32 regular {pointer 1}  }
	{ inA_210_0_out int 32 regular {pointer 1}  }
	{ inA_195_0_out int 32 regular {pointer 1}  }
	{ inA_180_0_out int 32 regular {pointer 1}  }
	{ inA_165_0_out int 32 regular {pointer 1}  }
	{ inA_150_0_out int 32 regular {pointer 1}  }
	{ inA_135_0_out int 32 regular {pointer 1}  }
	{ inA_120_0_out int 32 regular {pointer 1}  }
	{ inA_105_0_out int 32 regular {pointer 1}  }
	{ inA_90_0_out int 32 regular {pointer 1}  }
	{ inA_75_0_out int 32 regular {pointer 1}  }
	{ inA_60_0_out int 32 regular {pointer 1}  }
	{ inA_45_0_out int 32 regular {pointer 1}  }
	{ inA_30_0_out int 32 regular {pointer 1}  }
	{ inA_15_0_out int 32 regular {pointer 1}  }
	{ inA_0_out int 32 regular {pointer 1}  }
	{ arrayidx2224_15_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx2224_14_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx2224_13_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx2224_12_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx2224_11_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx2224_10_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx2224_9_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx2224_8_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx2224_7_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx2224_6_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx2224_5_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx2224_4_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx2224_3_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx2224_2_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx2224_1_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx2224_15226_promoted_out int 32 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "inB_15_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inB_14_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inB_13_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inB_12_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inB_11_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inB_10_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inB_9_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inB_8_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inB_7_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inB_6_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inB_5_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inB_4_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inB_3_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inB_2_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inB_1_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inB_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inA_225_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inA_210_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inA_195_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inA_180_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inA_165_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inA_150_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inA_135_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inA_120_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inA_105_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inA_90_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inA_75_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inA_60_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inA_45_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inA_30_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inA_15_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inA_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx2224_15_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx2224_14_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx2224_13_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx2224_12_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx2224_11_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx2224_10_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx2224_9_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx2224_8_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx2224_7_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx2224_6_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx2224_5_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx2224_4_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx2224_3_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx2224_2_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx2224_1_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx2224_15226_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 102
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ inB_15_0_out sc_out sc_lv 32 signal 0 } 
	{ inB_15_0_out_ap_vld sc_out sc_logic 1 outvld 0 } 
	{ inB_14_0_out sc_out sc_lv 32 signal 1 } 
	{ inB_14_0_out_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ inB_13_0_out sc_out sc_lv 32 signal 2 } 
	{ inB_13_0_out_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ inB_12_0_out sc_out sc_lv 32 signal 3 } 
	{ inB_12_0_out_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ inB_11_0_out sc_out sc_lv 32 signal 4 } 
	{ inB_11_0_out_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ inB_10_0_out sc_out sc_lv 32 signal 5 } 
	{ inB_10_0_out_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ inB_9_0_out sc_out sc_lv 32 signal 6 } 
	{ inB_9_0_out_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ inB_8_0_out sc_out sc_lv 32 signal 7 } 
	{ inB_8_0_out_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ inB_7_0_out sc_out sc_lv 32 signal 8 } 
	{ inB_7_0_out_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ inB_6_0_out sc_out sc_lv 32 signal 9 } 
	{ inB_6_0_out_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ inB_5_0_out sc_out sc_lv 32 signal 10 } 
	{ inB_5_0_out_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ inB_4_0_out sc_out sc_lv 32 signal 11 } 
	{ inB_4_0_out_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ inB_3_0_out sc_out sc_lv 32 signal 12 } 
	{ inB_3_0_out_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ inB_2_0_out sc_out sc_lv 32 signal 13 } 
	{ inB_2_0_out_ap_vld sc_out sc_logic 1 outvld 13 } 
	{ inB_1_0_out sc_out sc_lv 32 signal 14 } 
	{ inB_1_0_out_ap_vld sc_out sc_logic 1 outvld 14 } 
	{ inB_0_out sc_out sc_lv 32 signal 15 } 
	{ inB_0_out_ap_vld sc_out sc_logic 1 outvld 15 } 
	{ inA_225_0_out sc_out sc_lv 32 signal 16 } 
	{ inA_225_0_out_ap_vld sc_out sc_logic 1 outvld 16 } 
	{ inA_210_0_out sc_out sc_lv 32 signal 17 } 
	{ inA_210_0_out_ap_vld sc_out sc_logic 1 outvld 17 } 
	{ inA_195_0_out sc_out sc_lv 32 signal 18 } 
	{ inA_195_0_out_ap_vld sc_out sc_logic 1 outvld 18 } 
	{ inA_180_0_out sc_out sc_lv 32 signal 19 } 
	{ inA_180_0_out_ap_vld sc_out sc_logic 1 outvld 19 } 
	{ inA_165_0_out sc_out sc_lv 32 signal 20 } 
	{ inA_165_0_out_ap_vld sc_out sc_logic 1 outvld 20 } 
	{ inA_150_0_out sc_out sc_lv 32 signal 21 } 
	{ inA_150_0_out_ap_vld sc_out sc_logic 1 outvld 21 } 
	{ inA_135_0_out sc_out sc_lv 32 signal 22 } 
	{ inA_135_0_out_ap_vld sc_out sc_logic 1 outvld 22 } 
	{ inA_120_0_out sc_out sc_lv 32 signal 23 } 
	{ inA_120_0_out_ap_vld sc_out sc_logic 1 outvld 23 } 
	{ inA_105_0_out sc_out sc_lv 32 signal 24 } 
	{ inA_105_0_out_ap_vld sc_out sc_logic 1 outvld 24 } 
	{ inA_90_0_out sc_out sc_lv 32 signal 25 } 
	{ inA_90_0_out_ap_vld sc_out sc_logic 1 outvld 25 } 
	{ inA_75_0_out sc_out sc_lv 32 signal 26 } 
	{ inA_75_0_out_ap_vld sc_out sc_logic 1 outvld 26 } 
	{ inA_60_0_out sc_out sc_lv 32 signal 27 } 
	{ inA_60_0_out_ap_vld sc_out sc_logic 1 outvld 27 } 
	{ inA_45_0_out sc_out sc_lv 32 signal 28 } 
	{ inA_45_0_out_ap_vld sc_out sc_logic 1 outvld 28 } 
	{ inA_30_0_out sc_out sc_lv 32 signal 29 } 
	{ inA_30_0_out_ap_vld sc_out sc_logic 1 outvld 29 } 
	{ inA_15_0_out sc_out sc_lv 32 signal 30 } 
	{ inA_15_0_out_ap_vld sc_out sc_logic 1 outvld 30 } 
	{ inA_0_out sc_out sc_lv 32 signal 31 } 
	{ inA_0_out_ap_vld sc_out sc_logic 1 outvld 31 } 
	{ arrayidx2224_15_15_promoted_out sc_out sc_lv 32 signal 32 } 
	{ arrayidx2224_15_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 32 } 
	{ arrayidx2224_14_15_promoted_out sc_out sc_lv 32 signal 33 } 
	{ arrayidx2224_14_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 33 } 
	{ arrayidx2224_13_15_promoted_out sc_out sc_lv 32 signal 34 } 
	{ arrayidx2224_13_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 34 } 
	{ arrayidx2224_12_15_promoted_out sc_out sc_lv 32 signal 35 } 
	{ arrayidx2224_12_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 35 } 
	{ arrayidx2224_11_15_promoted_out sc_out sc_lv 32 signal 36 } 
	{ arrayidx2224_11_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 36 } 
	{ arrayidx2224_10_15_promoted_out sc_out sc_lv 32 signal 37 } 
	{ arrayidx2224_10_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 37 } 
	{ arrayidx2224_9_15_promoted_out sc_out sc_lv 32 signal 38 } 
	{ arrayidx2224_9_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 38 } 
	{ arrayidx2224_8_15_promoted_out sc_out sc_lv 32 signal 39 } 
	{ arrayidx2224_8_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 39 } 
	{ arrayidx2224_7_15_promoted_out sc_out sc_lv 32 signal 40 } 
	{ arrayidx2224_7_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 40 } 
	{ arrayidx2224_6_15_promoted_out sc_out sc_lv 32 signal 41 } 
	{ arrayidx2224_6_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 41 } 
	{ arrayidx2224_5_15_promoted_out sc_out sc_lv 32 signal 42 } 
	{ arrayidx2224_5_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 42 } 
	{ arrayidx2224_4_15_promoted_out sc_out sc_lv 32 signal 43 } 
	{ arrayidx2224_4_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 43 } 
	{ arrayidx2224_3_15_promoted_out sc_out sc_lv 32 signal 44 } 
	{ arrayidx2224_3_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 44 } 
	{ arrayidx2224_2_15_promoted_out sc_out sc_lv 32 signal 45 } 
	{ arrayidx2224_2_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 45 } 
	{ arrayidx2224_1_15_promoted_out sc_out sc_lv 32 signal 46 } 
	{ arrayidx2224_1_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 46 } 
	{ arrayidx2224_15226_promoted_out sc_out sc_lv 32 signal 47 } 
	{ arrayidx2224_15226_promoted_out_ap_vld sc_out sc_logic 1 outvld 47 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "inB_15_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inB_15_0_out", "role": "default" }} , 
 	{ "name": "inB_15_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inB_15_0_out", "role": "ap_vld" }} , 
 	{ "name": "inB_14_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inB_14_0_out", "role": "default" }} , 
 	{ "name": "inB_14_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inB_14_0_out", "role": "ap_vld" }} , 
 	{ "name": "inB_13_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inB_13_0_out", "role": "default" }} , 
 	{ "name": "inB_13_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inB_13_0_out", "role": "ap_vld" }} , 
 	{ "name": "inB_12_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inB_12_0_out", "role": "default" }} , 
 	{ "name": "inB_12_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inB_12_0_out", "role": "ap_vld" }} , 
 	{ "name": "inB_11_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inB_11_0_out", "role": "default" }} , 
 	{ "name": "inB_11_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inB_11_0_out", "role": "ap_vld" }} , 
 	{ "name": "inB_10_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inB_10_0_out", "role": "default" }} , 
 	{ "name": "inB_10_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inB_10_0_out", "role": "ap_vld" }} , 
 	{ "name": "inB_9_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inB_9_0_out", "role": "default" }} , 
 	{ "name": "inB_9_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inB_9_0_out", "role": "ap_vld" }} , 
 	{ "name": "inB_8_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inB_8_0_out", "role": "default" }} , 
 	{ "name": "inB_8_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inB_8_0_out", "role": "ap_vld" }} , 
 	{ "name": "inB_7_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inB_7_0_out", "role": "default" }} , 
 	{ "name": "inB_7_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inB_7_0_out", "role": "ap_vld" }} , 
 	{ "name": "inB_6_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inB_6_0_out", "role": "default" }} , 
 	{ "name": "inB_6_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inB_6_0_out", "role": "ap_vld" }} , 
 	{ "name": "inB_5_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inB_5_0_out", "role": "default" }} , 
 	{ "name": "inB_5_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inB_5_0_out", "role": "ap_vld" }} , 
 	{ "name": "inB_4_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inB_4_0_out", "role": "default" }} , 
 	{ "name": "inB_4_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inB_4_0_out", "role": "ap_vld" }} , 
 	{ "name": "inB_3_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inB_3_0_out", "role": "default" }} , 
 	{ "name": "inB_3_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inB_3_0_out", "role": "ap_vld" }} , 
 	{ "name": "inB_2_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inB_2_0_out", "role": "default" }} , 
 	{ "name": "inB_2_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inB_2_0_out", "role": "ap_vld" }} , 
 	{ "name": "inB_1_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inB_1_0_out", "role": "default" }} , 
 	{ "name": "inB_1_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inB_1_0_out", "role": "ap_vld" }} , 
 	{ "name": "inB_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inB_0_out", "role": "default" }} , 
 	{ "name": "inB_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inB_0_out", "role": "ap_vld" }} , 
 	{ "name": "inA_225_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inA_225_0_out", "role": "default" }} , 
 	{ "name": "inA_225_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inA_225_0_out", "role": "ap_vld" }} , 
 	{ "name": "inA_210_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inA_210_0_out", "role": "default" }} , 
 	{ "name": "inA_210_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inA_210_0_out", "role": "ap_vld" }} , 
 	{ "name": "inA_195_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inA_195_0_out", "role": "default" }} , 
 	{ "name": "inA_195_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inA_195_0_out", "role": "ap_vld" }} , 
 	{ "name": "inA_180_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inA_180_0_out", "role": "default" }} , 
 	{ "name": "inA_180_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inA_180_0_out", "role": "ap_vld" }} , 
 	{ "name": "inA_165_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inA_165_0_out", "role": "default" }} , 
 	{ "name": "inA_165_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inA_165_0_out", "role": "ap_vld" }} , 
 	{ "name": "inA_150_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inA_150_0_out", "role": "default" }} , 
 	{ "name": "inA_150_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inA_150_0_out", "role": "ap_vld" }} , 
 	{ "name": "inA_135_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inA_135_0_out", "role": "default" }} , 
 	{ "name": "inA_135_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inA_135_0_out", "role": "ap_vld" }} , 
 	{ "name": "inA_120_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inA_120_0_out", "role": "default" }} , 
 	{ "name": "inA_120_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inA_120_0_out", "role": "ap_vld" }} , 
 	{ "name": "inA_105_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inA_105_0_out", "role": "default" }} , 
 	{ "name": "inA_105_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inA_105_0_out", "role": "ap_vld" }} , 
 	{ "name": "inA_90_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inA_90_0_out", "role": "default" }} , 
 	{ "name": "inA_90_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inA_90_0_out", "role": "ap_vld" }} , 
 	{ "name": "inA_75_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inA_75_0_out", "role": "default" }} , 
 	{ "name": "inA_75_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inA_75_0_out", "role": "ap_vld" }} , 
 	{ "name": "inA_60_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inA_60_0_out", "role": "default" }} , 
 	{ "name": "inA_60_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inA_60_0_out", "role": "ap_vld" }} , 
 	{ "name": "inA_45_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inA_45_0_out", "role": "default" }} , 
 	{ "name": "inA_45_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inA_45_0_out", "role": "ap_vld" }} , 
 	{ "name": "inA_30_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inA_30_0_out", "role": "default" }} , 
 	{ "name": "inA_30_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inA_30_0_out", "role": "ap_vld" }} , 
 	{ "name": "inA_15_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inA_15_0_out", "role": "default" }} , 
 	{ "name": "inA_15_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inA_15_0_out", "role": "ap_vld" }} , 
 	{ "name": "inA_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inA_0_out", "role": "default" }} , 
 	{ "name": "inA_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "inA_0_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx2224_15_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx2224_15_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx2224_15_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx2224_15_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx2224_14_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx2224_14_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx2224_14_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx2224_14_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx2224_13_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx2224_13_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx2224_13_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx2224_13_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx2224_12_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx2224_12_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx2224_12_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx2224_12_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx2224_11_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx2224_11_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx2224_11_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx2224_11_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx2224_10_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx2224_10_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx2224_10_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx2224_10_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx2224_9_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx2224_9_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx2224_9_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx2224_9_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx2224_8_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx2224_8_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx2224_8_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx2224_8_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx2224_7_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx2224_7_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx2224_7_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx2224_7_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx2224_6_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx2224_6_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx2224_6_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx2224_6_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx2224_5_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx2224_5_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx2224_5_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx2224_5_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx2224_4_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx2224_4_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx2224_4_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx2224_4_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx2224_3_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx2224_3_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx2224_3_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx2224_3_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx2224_2_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx2224_2_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx2224_2_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx2224_2_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx2224_1_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx2224_1_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx2224_1_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx2224_1_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx2224_15226_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx2224_15226_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx2224_15226_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx2224_15226_promoted_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "mmult_Pipeline_init",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "18", "EstimateLatencyMax" : "18",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "inB_15_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inB_14_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inB_13_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inB_12_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inB_11_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inB_10_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inB_9_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inB_8_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inB_7_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inB_6_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inB_5_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inB_4_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inB_3_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inB_2_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inB_1_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inB_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inA_225_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inA_210_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inA_195_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inA_180_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inA_165_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inA_150_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inA_135_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inA_120_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inA_105_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inA_90_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inA_75_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inA_60_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inA_45_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inA_30_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inA_15_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "inA_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx2224_15_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx2224_14_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx2224_13_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx2224_12_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx2224_11_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx2224_10_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx2224_9_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx2224_8_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx2224_7_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx2224_6_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx2224_5_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx2224_4_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx2224_3_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx2224_2_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx2224_1_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx2224_15226_promoted_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "init", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mmult_Pipeline_init {
		inB_15_0_out {Type O LastRead -1 FirstWrite 0}
		inB_14_0_out {Type O LastRead -1 FirstWrite 0}
		inB_13_0_out {Type O LastRead -1 FirstWrite 0}
		inB_12_0_out {Type O LastRead -1 FirstWrite 0}
		inB_11_0_out {Type O LastRead -1 FirstWrite 0}
		inB_10_0_out {Type O LastRead -1 FirstWrite 0}
		inB_9_0_out {Type O LastRead -1 FirstWrite 0}
		inB_8_0_out {Type O LastRead -1 FirstWrite 0}
		inB_7_0_out {Type O LastRead -1 FirstWrite 0}
		inB_6_0_out {Type O LastRead -1 FirstWrite 0}
		inB_5_0_out {Type O LastRead -1 FirstWrite 0}
		inB_4_0_out {Type O LastRead -1 FirstWrite 0}
		inB_3_0_out {Type O LastRead -1 FirstWrite 0}
		inB_2_0_out {Type O LastRead -1 FirstWrite 0}
		inB_1_0_out {Type O LastRead -1 FirstWrite 0}
		inB_0_out {Type O LastRead -1 FirstWrite 0}
		inA_225_0_out {Type O LastRead -1 FirstWrite 0}
		inA_210_0_out {Type O LastRead -1 FirstWrite 0}
		inA_195_0_out {Type O LastRead -1 FirstWrite 0}
		inA_180_0_out {Type O LastRead -1 FirstWrite 0}
		inA_165_0_out {Type O LastRead -1 FirstWrite 0}
		inA_150_0_out {Type O LastRead -1 FirstWrite 0}
		inA_135_0_out {Type O LastRead -1 FirstWrite 0}
		inA_120_0_out {Type O LastRead -1 FirstWrite 0}
		inA_105_0_out {Type O LastRead -1 FirstWrite 0}
		inA_90_0_out {Type O LastRead -1 FirstWrite 0}
		inA_75_0_out {Type O LastRead -1 FirstWrite 0}
		inA_60_0_out {Type O LastRead -1 FirstWrite 0}
		inA_45_0_out {Type O LastRead -1 FirstWrite 0}
		inA_30_0_out {Type O LastRead -1 FirstWrite 0}
		inA_15_0_out {Type O LastRead -1 FirstWrite 0}
		inA_0_out {Type O LastRead -1 FirstWrite 0}
		arrayidx2224_15_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx2224_14_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx2224_13_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx2224_12_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx2224_11_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx2224_10_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx2224_9_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx2224_8_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx2224_7_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx2224_6_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx2224_5_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx2224_4_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx2224_3_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx2224_2_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx2224_1_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx2224_15226_promoted_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "18", "Max" : "18"}
	, {"Name" : "Interval", "Min" : "18", "Max" : "18"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	inB_15_0_out { ap_vld {  { inB_15_0_out out_data 1 32 }  { inB_15_0_out_ap_vld out_vld 1 1 } } }
	inB_14_0_out { ap_vld {  { inB_14_0_out out_data 1 32 }  { inB_14_0_out_ap_vld out_vld 1 1 } } }
	inB_13_0_out { ap_vld {  { inB_13_0_out out_data 1 32 }  { inB_13_0_out_ap_vld out_vld 1 1 } } }
	inB_12_0_out { ap_vld {  { inB_12_0_out out_data 1 32 }  { inB_12_0_out_ap_vld out_vld 1 1 } } }
	inB_11_0_out { ap_vld {  { inB_11_0_out out_data 1 32 }  { inB_11_0_out_ap_vld out_vld 1 1 } } }
	inB_10_0_out { ap_vld {  { inB_10_0_out out_data 1 32 }  { inB_10_0_out_ap_vld out_vld 1 1 } } }
	inB_9_0_out { ap_vld {  { inB_9_0_out out_data 1 32 }  { inB_9_0_out_ap_vld out_vld 1 1 } } }
	inB_8_0_out { ap_vld {  { inB_8_0_out out_data 1 32 }  { inB_8_0_out_ap_vld out_vld 1 1 } } }
	inB_7_0_out { ap_vld {  { inB_7_0_out out_data 1 32 }  { inB_7_0_out_ap_vld out_vld 1 1 } } }
	inB_6_0_out { ap_vld {  { inB_6_0_out out_data 1 32 }  { inB_6_0_out_ap_vld out_vld 1 1 } } }
	inB_5_0_out { ap_vld {  { inB_5_0_out out_data 1 32 }  { inB_5_0_out_ap_vld out_vld 1 1 } } }
	inB_4_0_out { ap_vld {  { inB_4_0_out out_data 1 32 }  { inB_4_0_out_ap_vld out_vld 1 1 } } }
	inB_3_0_out { ap_vld {  { inB_3_0_out out_data 1 32 }  { inB_3_0_out_ap_vld out_vld 1 1 } } }
	inB_2_0_out { ap_vld {  { inB_2_0_out out_data 1 32 }  { inB_2_0_out_ap_vld out_vld 1 1 } } }
	inB_1_0_out { ap_vld {  { inB_1_0_out out_data 1 32 }  { inB_1_0_out_ap_vld out_vld 1 1 } } }
	inB_0_out { ap_vld {  { inB_0_out out_data 1 32 }  { inB_0_out_ap_vld out_vld 1 1 } } }
	inA_225_0_out { ap_vld {  { inA_225_0_out out_data 1 32 }  { inA_225_0_out_ap_vld out_vld 1 1 } } }
	inA_210_0_out { ap_vld {  { inA_210_0_out out_data 1 32 }  { inA_210_0_out_ap_vld out_vld 1 1 } } }
	inA_195_0_out { ap_vld {  { inA_195_0_out out_data 1 32 }  { inA_195_0_out_ap_vld out_vld 1 1 } } }
	inA_180_0_out { ap_vld {  { inA_180_0_out out_data 1 32 }  { inA_180_0_out_ap_vld out_vld 1 1 } } }
	inA_165_0_out { ap_vld {  { inA_165_0_out out_data 1 32 }  { inA_165_0_out_ap_vld out_vld 1 1 } } }
	inA_150_0_out { ap_vld {  { inA_150_0_out out_data 1 32 }  { inA_150_0_out_ap_vld out_vld 1 1 } } }
	inA_135_0_out { ap_vld {  { inA_135_0_out out_data 1 32 }  { inA_135_0_out_ap_vld out_vld 1 1 } } }
	inA_120_0_out { ap_vld {  { inA_120_0_out out_data 1 32 }  { inA_120_0_out_ap_vld out_vld 1 1 } } }
	inA_105_0_out { ap_vld {  { inA_105_0_out out_data 1 32 }  { inA_105_0_out_ap_vld out_vld 1 1 } } }
	inA_90_0_out { ap_vld {  { inA_90_0_out out_data 1 32 }  { inA_90_0_out_ap_vld out_vld 1 1 } } }
	inA_75_0_out { ap_vld {  { inA_75_0_out out_data 1 32 }  { inA_75_0_out_ap_vld out_vld 1 1 } } }
	inA_60_0_out { ap_vld {  { inA_60_0_out out_data 1 32 }  { inA_60_0_out_ap_vld out_vld 1 1 } } }
	inA_45_0_out { ap_vld {  { inA_45_0_out out_data 1 32 }  { inA_45_0_out_ap_vld out_vld 1 1 } } }
	inA_30_0_out { ap_vld {  { inA_30_0_out out_data 1 32 }  { inA_30_0_out_ap_vld out_vld 1 1 } } }
	inA_15_0_out { ap_vld {  { inA_15_0_out out_data 1 32 }  { inA_15_0_out_ap_vld out_vld 1 1 } } }
	inA_0_out { ap_vld {  { inA_0_out out_data 1 32 }  { inA_0_out_ap_vld out_vld 1 1 } } }
	arrayidx2224_15_15_promoted_out { ap_vld {  { arrayidx2224_15_15_promoted_out out_data 1 32 }  { arrayidx2224_15_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx2224_14_15_promoted_out { ap_vld {  { arrayidx2224_14_15_promoted_out out_data 1 32 }  { arrayidx2224_14_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx2224_13_15_promoted_out { ap_vld {  { arrayidx2224_13_15_promoted_out out_data 1 32 }  { arrayidx2224_13_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx2224_12_15_promoted_out { ap_vld {  { arrayidx2224_12_15_promoted_out out_data 1 32 }  { arrayidx2224_12_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx2224_11_15_promoted_out { ap_vld {  { arrayidx2224_11_15_promoted_out out_data 1 32 }  { arrayidx2224_11_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx2224_10_15_promoted_out { ap_vld {  { arrayidx2224_10_15_promoted_out out_data 1 32 }  { arrayidx2224_10_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx2224_9_15_promoted_out { ap_vld {  { arrayidx2224_9_15_promoted_out out_data 1 32 }  { arrayidx2224_9_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx2224_8_15_promoted_out { ap_vld {  { arrayidx2224_8_15_promoted_out out_data 1 32 }  { arrayidx2224_8_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx2224_7_15_promoted_out { ap_vld {  { arrayidx2224_7_15_promoted_out out_data 1 32 }  { arrayidx2224_7_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx2224_6_15_promoted_out { ap_vld {  { arrayidx2224_6_15_promoted_out out_data 1 32 }  { arrayidx2224_6_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx2224_5_15_promoted_out { ap_vld {  { arrayidx2224_5_15_promoted_out out_data 1 32 }  { arrayidx2224_5_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx2224_4_15_promoted_out { ap_vld {  { arrayidx2224_4_15_promoted_out out_data 1 32 }  { arrayidx2224_4_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx2224_3_15_promoted_out { ap_vld {  { arrayidx2224_3_15_promoted_out out_data 1 32 }  { arrayidx2224_3_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx2224_2_15_promoted_out { ap_vld {  { arrayidx2224_2_15_promoted_out out_data 1 32 }  { arrayidx2224_2_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx2224_1_15_promoted_out { ap_vld {  { arrayidx2224_1_15_promoted_out out_data 1 32 }  { arrayidx2224_1_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx2224_15226_promoted_out { ap_vld {  { arrayidx2224_15226_promoted_out out_data 1 32 }  { arrayidx2224_15226_promoted_out_ap_vld out_vld 1 1 } } }
}
