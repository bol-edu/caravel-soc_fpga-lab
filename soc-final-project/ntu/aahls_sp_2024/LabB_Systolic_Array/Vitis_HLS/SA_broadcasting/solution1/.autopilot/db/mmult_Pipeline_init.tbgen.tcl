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
	{ arrayidx682_15_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx682_14_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx682_13_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx682_12_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx682_11_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx682_10_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx682_9_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx682_8_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx682_7_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx682_6_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx682_5_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx682_4_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx682_3_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx682_2_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx682_1_15_promoted_out int 32 regular {pointer 1}  }
	{ arrayidx682_15322_promoted_out int 32 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "arrayidx682_15_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx682_14_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx682_13_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx682_12_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx682_11_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx682_10_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx682_9_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx682_8_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx682_7_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx682_6_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx682_5_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx682_4_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx682_3_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx682_2_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx682_1_15_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "arrayidx682_15322_promoted_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 38
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ arrayidx682_15_15_promoted_out sc_out sc_lv 32 signal 0 } 
	{ arrayidx682_15_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 0 } 
	{ arrayidx682_14_15_promoted_out sc_out sc_lv 32 signal 1 } 
	{ arrayidx682_14_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ arrayidx682_13_15_promoted_out sc_out sc_lv 32 signal 2 } 
	{ arrayidx682_13_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ arrayidx682_12_15_promoted_out sc_out sc_lv 32 signal 3 } 
	{ arrayidx682_12_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ arrayidx682_11_15_promoted_out sc_out sc_lv 32 signal 4 } 
	{ arrayidx682_11_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ arrayidx682_10_15_promoted_out sc_out sc_lv 32 signal 5 } 
	{ arrayidx682_10_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ arrayidx682_9_15_promoted_out sc_out sc_lv 32 signal 6 } 
	{ arrayidx682_9_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ arrayidx682_8_15_promoted_out sc_out sc_lv 32 signal 7 } 
	{ arrayidx682_8_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ arrayidx682_7_15_promoted_out sc_out sc_lv 32 signal 8 } 
	{ arrayidx682_7_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ arrayidx682_6_15_promoted_out sc_out sc_lv 32 signal 9 } 
	{ arrayidx682_6_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ arrayidx682_5_15_promoted_out sc_out sc_lv 32 signal 10 } 
	{ arrayidx682_5_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ arrayidx682_4_15_promoted_out sc_out sc_lv 32 signal 11 } 
	{ arrayidx682_4_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ arrayidx682_3_15_promoted_out sc_out sc_lv 32 signal 12 } 
	{ arrayidx682_3_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ arrayidx682_2_15_promoted_out sc_out sc_lv 32 signal 13 } 
	{ arrayidx682_2_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 13 } 
	{ arrayidx682_1_15_promoted_out sc_out sc_lv 32 signal 14 } 
	{ arrayidx682_1_15_promoted_out_ap_vld sc_out sc_logic 1 outvld 14 } 
	{ arrayidx682_15322_promoted_out sc_out sc_lv 32 signal 15 } 
	{ arrayidx682_15322_promoted_out_ap_vld sc_out sc_logic 1 outvld 15 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "arrayidx682_15_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx682_15_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx682_15_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx682_15_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx682_14_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx682_14_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx682_14_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx682_14_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx682_13_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx682_13_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx682_13_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx682_13_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx682_12_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx682_12_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx682_12_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx682_12_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx682_11_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx682_11_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx682_11_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx682_11_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx682_10_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx682_10_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx682_10_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx682_10_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx682_9_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx682_9_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx682_9_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx682_9_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx682_8_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx682_8_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx682_8_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx682_8_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx682_7_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx682_7_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx682_7_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx682_7_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx682_6_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx682_6_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx682_6_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx682_6_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx682_5_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx682_5_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx682_5_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx682_5_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx682_4_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx682_4_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx682_4_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx682_4_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx682_3_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx682_3_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx682_3_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx682_3_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx682_2_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx682_2_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx682_2_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx682_2_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx682_1_15_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx682_1_15_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx682_1_15_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx682_1_15_promoted_out", "role": "ap_vld" }} , 
 	{ "name": "arrayidx682_15322_promoted_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "arrayidx682_15322_promoted_out", "role": "default" }} , 
 	{ "name": "arrayidx682_15322_promoted_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "arrayidx682_15322_promoted_out", "role": "ap_vld" }}  ]}

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
			{"Name" : "arrayidx682_15_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx682_14_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx682_13_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx682_12_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx682_11_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx682_10_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx682_9_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx682_8_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx682_7_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx682_6_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx682_5_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx682_4_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx682_3_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx682_2_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx682_1_15_promoted_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "arrayidx682_15322_promoted_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "init", "PipelineType" : "NotSupport"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mmult_Pipeline_init {
		arrayidx682_15_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx682_14_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx682_13_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx682_12_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx682_11_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx682_10_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx682_9_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx682_8_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx682_7_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx682_6_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx682_5_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx682_4_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx682_3_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx682_2_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx682_1_15_promoted_out {Type O LastRead -1 FirstWrite 0}
		arrayidx682_15322_promoted_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "18", "Max" : "18"}
	, {"Name" : "Interval", "Min" : "18", "Max" : "18"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	arrayidx682_15_15_promoted_out { ap_vld {  { arrayidx682_15_15_promoted_out out_data 1 32 }  { arrayidx682_15_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx682_14_15_promoted_out { ap_vld {  { arrayidx682_14_15_promoted_out out_data 1 32 }  { arrayidx682_14_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx682_13_15_promoted_out { ap_vld {  { arrayidx682_13_15_promoted_out out_data 1 32 }  { arrayidx682_13_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx682_12_15_promoted_out { ap_vld {  { arrayidx682_12_15_promoted_out out_data 1 32 }  { arrayidx682_12_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx682_11_15_promoted_out { ap_vld {  { arrayidx682_11_15_promoted_out out_data 1 32 }  { arrayidx682_11_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx682_10_15_promoted_out { ap_vld {  { arrayidx682_10_15_promoted_out out_data 1 32 }  { arrayidx682_10_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx682_9_15_promoted_out { ap_vld {  { arrayidx682_9_15_promoted_out out_data 1 32 }  { arrayidx682_9_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx682_8_15_promoted_out { ap_vld {  { arrayidx682_8_15_promoted_out out_data 1 32 }  { arrayidx682_8_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx682_7_15_promoted_out { ap_vld {  { arrayidx682_7_15_promoted_out out_data 1 32 }  { arrayidx682_7_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx682_6_15_promoted_out { ap_vld {  { arrayidx682_6_15_promoted_out out_data 1 32 }  { arrayidx682_6_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx682_5_15_promoted_out { ap_vld {  { arrayidx682_5_15_promoted_out out_data 1 32 }  { arrayidx682_5_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx682_4_15_promoted_out { ap_vld {  { arrayidx682_4_15_promoted_out out_data 1 32 }  { arrayidx682_4_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx682_3_15_promoted_out { ap_vld {  { arrayidx682_3_15_promoted_out out_data 1 32 }  { arrayidx682_3_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx682_2_15_promoted_out { ap_vld {  { arrayidx682_2_15_promoted_out out_data 1 32 }  { arrayidx682_2_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx682_1_15_promoted_out { ap_vld {  { arrayidx682_1_15_promoted_out out_data 1 32 }  { arrayidx682_1_15_promoted_out_ap_vld out_vld 1 1 } } }
	arrayidx682_15322_promoted_out { ap_vld {  { arrayidx682_15322_promoted_out out_data 1 32 }  { arrayidx682_15322_promoted_out_ap_vld out_vld 1 1 } } }
}
