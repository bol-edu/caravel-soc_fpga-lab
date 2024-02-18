set moduleName sendoutstream_Pipeline_VITIS_LOOP_151_2
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {sendoutstream_Pipeline_VITIS_LOOP_151_2}
set C_modelType { void 0 }
set C_modelArgList {
	{ out_val_last_V int 1 regular  }
	{ tmp int 32 regular  }
	{ outbuf int 40 regular {fifo 0 volatile }  }
	{ outStreamTop_V_data_V int 32 regular {axi_s 1 volatile  { outStreamTop Data } }  }
	{ outStreamTop_V_keep_V int 4 regular {axi_s 1 volatile  { outStreamTop Keep } }  }
	{ outStreamTop_V_strb_V int 4 regular {axi_s 1 volatile  { outStreamTop Strb } }  }
	{ outStreamTop_V_user_V int 7 regular {axi_s 1 volatile  { outStreamTop User } }  }
	{ outStreamTop_V_last_V int 1 regular {axi_s 1 volatile  { outStreamTop Last } }  }
	{ p_phi_out int 1 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "out_val_last_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "tmp", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "outbuf", "interface" : "fifo", "bitwidth" : 40, "direction" : "READONLY"} , 
 	{ "Name" : "outStreamTop_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "outStreamTop_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "outStreamTop_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "outStreamTop_V_user_V", "interface" : "axis", "bitwidth" : 7, "direction" : "WRITEONLY"} , 
 	{ "Name" : "outStreamTop_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_phi_out", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ out_val_last_V sc_in sc_lv 1 signal 0 } 
	{ tmp sc_in sc_lv 32 signal 1 } 
	{ outbuf_dout sc_in sc_lv 40 signal 2 } 
	{ outbuf_num_data_valid sc_in sc_lv 8 signal 2 } 
	{ outbuf_fifo_cap sc_in sc_lv 8 signal 2 } 
	{ outbuf_empty_n sc_in sc_logic 1 signal 2 } 
	{ outbuf_read sc_out sc_logic 1 signal 2 } 
	{ outStreamTop_TDATA sc_out sc_lv 32 signal 3 } 
	{ outStreamTop_TVALID sc_out sc_logic 1 outvld 7 } 
	{ outStreamTop_TREADY sc_in sc_logic 1 outacc 3 } 
	{ outStreamTop_TKEEP sc_out sc_lv 4 signal 4 } 
	{ outStreamTop_TSTRB sc_out sc_lv 4 signal 5 } 
	{ outStreamTop_TUSER sc_out sc_lv 7 signal 6 } 
	{ outStreamTop_TLAST sc_out sc_lv 1 signal 7 } 
	{ p_phi_out sc_out sc_lv 1 signal 8 } 
	{ p_phi_out_ap_vld sc_out sc_logic 1 outvld 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "out_val_last_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_val_last_V", "role": "default" }} , 
 	{ "name": "tmp", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "tmp", "role": "default" }} , 
 	{ "name": "outbuf_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "outbuf", "role": "dout" }} , 
 	{ "name": "outbuf_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "outbuf", "role": "num_data_valid" }} , 
 	{ "name": "outbuf_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "outbuf", "role": "fifo_cap" }} , 
 	{ "name": "outbuf_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outbuf", "role": "empty_n" }} , 
 	{ "name": "outbuf_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outbuf", "role": "read" }} , 
 	{ "name": "outStreamTop_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "outStreamTop_V_data_V", "role": "default" }} , 
 	{ "name": "outStreamTop_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "outStreamTop_V_last_V", "role": "default" }} , 
 	{ "name": "outStreamTop_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "outStreamTop_V_data_V", "role": "default" }} , 
 	{ "name": "outStreamTop_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "outStreamTop_V_keep_V", "role": "default" }} , 
 	{ "name": "outStreamTop_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "outStreamTop_V_strb_V", "role": "default" }} , 
 	{ "name": "outStreamTop_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "outStreamTop_V_user_V", "role": "default" }} , 
 	{ "name": "outStreamTop_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "outStreamTop_V_last_V", "role": "default" }} , 
 	{ "name": "p_phi_out", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_phi_out", "role": "default" }} , 
 	{ "name": "p_phi_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_phi_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "sendoutstream_Pipeline_VITIS_LOOP_151_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "out_val_last_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp", "Type" : "None", "Direction" : "I"},
			{"Name" : "outbuf", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "outbuf_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "outStreamTop_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "outStreamTop_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "outStreamTop_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "outStreamTop_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "outStreamTop_V_user_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "outStreamTop_V_last_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "p_phi_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_151_2", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "PreState" : ["ap_ST_fsm_state1"], "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "PostState" : ["ap_ST_fsm_state4"]}}]}]}


set ArgLastReadFirstWriteLatency {
	sendoutstream_Pipeline_VITIS_LOOP_151_2 {
		out_val_last_V {Type I LastRead 0 FirstWrite -1}
		tmp {Type I LastRead 0 FirstWrite -1}
		outbuf {Type I LastRead 2 FirstWrite -1}
		outStreamTop_V_data_V {Type O LastRead -1 FirstWrite 2}
		outStreamTop_V_keep_V {Type O LastRead -1 FirstWrite 2}
		outStreamTop_V_strb_V {Type O LastRead -1 FirstWrite 2}
		outStreamTop_V_user_V {Type O LastRead -1 FirstWrite 2}
		outStreamTop_V_last_V {Type O LastRead -1 FirstWrite 2}
		p_phi_out {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	out_val_last_V { ap_none {  { out_val_last_V in_data 0 1 } } }
	tmp { ap_none {  { tmp in_data 0 32 } } }
	outbuf { ap_fifo {  { outbuf_dout fifo_port_we 0 40 }  { outbuf_num_data_valid fifo_status_num_data_valid 0 8 }  { outbuf_fifo_cap fifo_update 0 8 }  { outbuf_empty_n fifo_status 0 1 }  { outbuf_read fifo_data 1 1 } } }
	outStreamTop_V_data_V { axis {  { outStreamTop_TDATA out_data 1 32 }  { outStreamTop_TREADY out_acc 0 1 } } }
	outStreamTop_V_keep_V { axis {  { outStreamTop_TKEEP out_data 1 4 } } }
	outStreamTop_V_strb_V { axis {  { outStreamTop_TSTRB out_data 1 4 } } }
	outStreamTop_V_user_V { axis {  { outStreamTop_TUSER out_data 1 7 } } }
	outStreamTop_V_last_V { axis {  { outStreamTop_TVALID out_vld 1 1 }  { outStreamTop_TLAST out_data 1 1 } } }
	p_phi_out { ap_vld {  { p_phi_out out_data 1 1 }  { p_phi_out_ap_vld out_vld 1 1 } } }
}
