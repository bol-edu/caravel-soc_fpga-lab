set moduleName getinstream_Pipeline_VITIS_LOOP_48_1
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
set C_modelName {getinstream_Pipeline_VITIS_LOOP_48_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ in_len_V_load int 32 regular  }
	{ inStreamTop_V_data_V int 32 regular {axi_s 0 volatile  { inStreamTop Data } }  }
	{ inStreamTop_V_keep_V int 4 regular {axi_s 0 volatile  { inStreamTop Keep } }  }
	{ inStreamTop_V_strb_V int 4 regular {axi_s 0 volatile  { inStreamTop Strb } }  }
	{ inStreamTop_V_user_V int 7 regular {axi_s 0 volatile  { inStreamTop User } }  }
	{ inStreamTop_V_last_V int 1 regular {axi_s 0 volatile  { inStreamTop Last } }  }
	{ inbuf int 33 regular {fifo 1 volatile }  }
	{ sub_i_i52 int 33 regular  }
	{ in_s2m_len int 32 regular  }
	{ incount47 int 32 regular {fifo 1 volatile }  }
	{ tmp_user_V_out int 4 regular {pointer 1}  }
	{ icmp_ln1065_out int 1 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "in_len_V_load", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "inStreamTop_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "inStreamTop_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "inStreamTop_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "inStreamTop_V_user_V", "interface" : "axis", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "inStreamTop_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "inbuf", "interface" : "fifo", "bitwidth" : 33, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sub_i_i52", "interface" : "wire", "bitwidth" : 33, "direction" : "READONLY"} , 
 	{ "Name" : "in_s2m_len", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "incount47", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "tmp_user_V_out", "interface" : "wire", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "icmp_ln1065_out", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 30
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ inStreamTop_TVALID sc_in sc_logic 1 invld 1 } 
	{ inbuf_din sc_out sc_lv 33 signal 6 } 
	{ inbuf_num_data_valid sc_in sc_lv 8 signal 6 } 
	{ inbuf_fifo_cap sc_in sc_lv 8 signal 6 } 
	{ inbuf_full_n sc_in sc_logic 1 signal 6 } 
	{ inbuf_write sc_out sc_logic 1 signal 6 } 
	{ incount47_din sc_out sc_lv 32 signal 9 } 
	{ incount47_num_data_valid sc_in sc_lv 4 signal 9 } 
	{ incount47_fifo_cap sc_in sc_lv 4 signal 9 } 
	{ incount47_full_n sc_in sc_logic 1 signal 9 } 
	{ incount47_write sc_out sc_logic 1 signal 9 } 
	{ in_len_V_load sc_in sc_lv 32 signal 0 } 
	{ inStreamTop_TDATA sc_in sc_lv 32 signal 1 } 
	{ inStreamTop_TREADY sc_out sc_logic 1 inacc 5 } 
	{ inStreamTop_TKEEP sc_in sc_lv 4 signal 2 } 
	{ inStreamTop_TSTRB sc_in sc_lv 4 signal 3 } 
	{ inStreamTop_TUSER sc_in sc_lv 7 signal 4 } 
	{ inStreamTop_TLAST sc_in sc_lv 1 signal 5 } 
	{ sub_i_i52 sc_in sc_lv 33 signal 7 } 
	{ in_s2m_len sc_in sc_lv 32 signal 8 } 
	{ tmp_user_V_out sc_out sc_lv 4 signal 10 } 
	{ tmp_user_V_out_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ icmp_ln1065_out sc_out sc_lv 1 signal 11 } 
	{ icmp_ln1065_out_ap_vld sc_out sc_logic 1 outvld 11 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "inStreamTop_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "inStreamTop_V_data_V", "role": "default" }} , 
 	{ "name": "inbuf_din", "direction": "out", "datatype": "sc_lv", "bitwidth":33, "type": "signal", "bundle":{"name": "inbuf", "role": "din" }} , 
 	{ "name": "inbuf_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inbuf", "role": "num_data_valid" }} , 
 	{ "name": "inbuf_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inbuf", "role": "fifo_cap" }} , 
 	{ "name": "inbuf_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inbuf", "role": "full_n" }} , 
 	{ "name": "inbuf_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inbuf", "role": "write" }} , 
 	{ "name": "incount47_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "incount47", "role": "din" }} , 
 	{ "name": "incount47_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "incount47", "role": "num_data_valid" }} , 
 	{ "name": "incount47_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "incount47", "role": "fifo_cap" }} , 
 	{ "name": "incount47_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "incount47", "role": "full_n" }} , 
 	{ "name": "incount47_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "incount47", "role": "write" }} , 
 	{ "name": "in_len_V_load", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_len_V_load", "role": "default" }} , 
 	{ "name": "inStreamTop_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inStreamTop_V_data_V", "role": "default" }} , 
 	{ "name": "inStreamTop_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "inStreamTop_V_last_V", "role": "default" }} , 
 	{ "name": "inStreamTop_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "inStreamTop_V_keep_V", "role": "default" }} , 
 	{ "name": "inStreamTop_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "inStreamTop_V_strb_V", "role": "default" }} , 
 	{ "name": "inStreamTop_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "inStreamTop_V_user_V", "role": "default" }} , 
 	{ "name": "inStreamTop_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "inStreamTop_V_last_V", "role": "default" }} , 
 	{ "name": "sub_i_i52", "direction": "in", "datatype": "sc_lv", "bitwidth":33, "type": "signal", "bundle":{"name": "sub_i_i52", "role": "default" }} , 
 	{ "name": "in_s2m_len", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_s2m_len", "role": "default" }} , 
 	{ "name": "tmp_user_V_out", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "tmp_user_V_out", "role": "default" }} , 
 	{ "name": "tmp_user_V_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "tmp_user_V_out", "role": "ap_vld" }} , 
 	{ "name": "icmp_ln1065_out", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln1065_out", "role": "default" }} , 
 	{ "name": "icmp_ln1065_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "icmp_ln1065_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "getinstream_Pipeline_VITIS_LOOP_48_1",
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
			{"Name" : "in_len_V_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "inStreamTop_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "inStreamTop_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "inStreamTop_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "inStreamTop_V_strb_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "inStreamTop_V_user_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "inStreamTop_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "inbuf", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "inbuf_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "sub_i_i52", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_s2m_len", "Type" : "None", "Direction" : "I"},
			{"Name" : "incount47", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "incount47_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tmp_user_V_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "icmp_ln1065_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "width_count", "Type" : "OVld", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_48_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter1", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	getinstream_Pipeline_VITIS_LOOP_48_1 {
		in_len_V_load {Type I LastRead 0 FirstWrite -1}
		inStreamTop_V_data_V {Type I LastRead 1 FirstWrite -1}
		inStreamTop_V_keep_V {Type I LastRead 1 FirstWrite -1}
		inStreamTop_V_strb_V {Type I LastRead 1 FirstWrite -1}
		inStreamTop_V_user_V {Type I LastRead 1 FirstWrite -1}
		inStreamTop_V_last_V {Type I LastRead 1 FirstWrite -1}
		inbuf {Type O LastRead -1 FirstWrite 1}
		sub_i_i52 {Type I LastRead 0 FirstWrite -1}
		in_s2m_len {Type I LastRead 0 FirstWrite -1}
		incount47 {Type O LastRead -1 FirstWrite 2}
		tmp_user_V_out {Type O LastRead -1 FirstWrite 2}
		icmp_ln1065_out {Type O LastRead -1 FirstWrite 2}
		width_count {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	in_len_V_load { ap_none {  { in_len_V_load in_data 0 32 } } }
	inStreamTop_V_data_V { axis {  { inStreamTop_TVALID in_vld 0 1 }  { inStreamTop_TDATA in_data 0 32 } } }
	inStreamTop_V_keep_V { axis {  { inStreamTop_TKEEP in_data 0 4 } } }
	inStreamTop_V_strb_V { axis {  { inStreamTop_TSTRB in_data 0 4 } } }
	inStreamTop_V_user_V { axis {  { inStreamTop_TUSER in_data 0 7 } } }
	inStreamTop_V_last_V { axis {  { inStreamTop_TREADY in_acc 1 1 }  { inStreamTop_TLAST in_data 0 1 } } }
	inbuf { ap_fifo {  { inbuf_din fifo_port_we 1 33 }  { inbuf_num_data_valid fifo_status_num_data_valid 0 8 }  { inbuf_fifo_cap fifo_update 0 8 }  { inbuf_full_n fifo_status 0 1 }  { inbuf_write fifo_data 1 1 } } }
	sub_i_i52 { ap_none {  { sub_i_i52 in_data 0 33 } } }
	in_s2m_len { ap_none {  { in_s2m_len in_data 0 32 } } }
	incount47 { ap_fifo {  { incount47_din fifo_port_we 1 32 }  { incount47_num_data_valid fifo_status_num_data_valid 0 4 }  { incount47_fifo_cap fifo_update 0 4 }  { incount47_full_n fifo_status 0 1 }  { incount47_write fifo_data 1 1 } } }
	tmp_user_V_out { ap_vld {  { tmp_user_V_out out_data 1 4 }  { tmp_user_V_out_ap_vld out_vld 1 1 } } }
	icmp_ln1065_out { ap_vld {  { icmp_ln1065_out out_data 1 1 }  { icmp_ln1065_out_ap_vld out_vld 1 1 } } }
}
