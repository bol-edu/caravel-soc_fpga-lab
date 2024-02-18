set moduleName sendoutstream
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
set C_modelName {sendoutstream}
set C_modelType { void 0 }
set C_modelArgList {
	{ outbuf int 40 regular {fifo 0 volatile }  }
	{ outcount48 int 32 regular {fifo 0 volatile }  }
	{ in_en_clrsts int 1 regular {fifo 0}  }
	{ m2s_buf_sts int 1 regular {pointer 1}  }
	{ sts_clear int 1 regular {fifo 0}  }
	{ outStreamTop_V_data_V int 32 regular {axi_s 1 volatile  { outStreamTop Data } }  }
	{ outStreamTop_V_keep_V int 4 regular {axi_s 1 volatile  { outStreamTop Keep } }  }
	{ outStreamTop_V_strb_V int 4 regular {axi_s 1 volatile  { outStreamTop Strb } }  }
	{ outStreamTop_V_user_V int 7 regular {axi_s 1 volatile  { outStreamTop User } }  }
	{ outStreamTop_V_last_V int 1 regular {axi_s 1 volatile  { outStreamTop Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "outbuf", "interface" : "fifo", "bitwidth" : 40, "direction" : "READONLY"} , 
 	{ "Name" : "outcount48", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "in_en_clrsts", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "m2s_buf_sts", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sts_clear", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "outStreamTop_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "outStreamTop_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "outStreamTop_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "outStreamTop_V_user_V", "interface" : "axis", "bitwidth" : 7, "direction" : "WRITEONLY"} , 
 	{ "Name" : "outStreamTop_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 36
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ outbuf_dout sc_in sc_lv 40 signal 0 } 
	{ outbuf_num_data_valid sc_in sc_lv 8 signal 0 } 
	{ outbuf_fifo_cap sc_in sc_lv 8 signal 0 } 
	{ outbuf_empty_n sc_in sc_logic 1 signal 0 } 
	{ outbuf_read sc_out sc_logic 1 signal 0 } 
	{ outcount48_dout sc_in sc_lv 32 signal 1 } 
	{ outcount48_num_data_valid sc_in sc_lv 4 signal 1 } 
	{ outcount48_fifo_cap sc_in sc_lv 4 signal 1 } 
	{ outcount48_empty_n sc_in sc_logic 1 signal 1 } 
	{ outcount48_read sc_out sc_logic 1 signal 1 } 
	{ in_en_clrsts_dout sc_in sc_lv 1 signal 2 } 
	{ in_en_clrsts_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ in_en_clrsts_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ in_en_clrsts_empty_n sc_in sc_logic 1 signal 2 } 
	{ in_en_clrsts_read sc_out sc_logic 1 signal 2 } 
	{ m2s_buf_sts sc_out sc_lv 1 signal 3 } 
	{ m2s_buf_sts_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ sts_clear_dout sc_in sc_lv 1 signal 4 } 
	{ sts_clear_num_data_valid sc_in sc_lv 3 signal 4 } 
	{ sts_clear_fifo_cap sc_in sc_lv 3 signal 4 } 
	{ sts_clear_empty_n sc_in sc_logic 1 signal 4 } 
	{ sts_clear_read sc_out sc_logic 1 signal 4 } 
	{ outStreamTop_TDATA sc_out sc_lv 32 signal 5 } 
	{ outStreamTop_TVALID sc_out sc_logic 1 outvld 9 } 
	{ outStreamTop_TREADY sc_in sc_logic 1 outacc 9 } 
	{ outStreamTop_TKEEP sc_out sc_lv 4 signal 6 } 
	{ outStreamTop_TSTRB sc_out sc_lv 4 signal 7 } 
	{ outStreamTop_TUSER sc_out sc_lv 7 signal 8 } 
	{ outStreamTop_TLAST sc_out sc_lv 1 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "outbuf_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "outbuf", "role": "dout" }} , 
 	{ "name": "outbuf_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "outbuf", "role": "num_data_valid" }} , 
 	{ "name": "outbuf_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "outbuf", "role": "fifo_cap" }} , 
 	{ "name": "outbuf_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outbuf", "role": "empty_n" }} , 
 	{ "name": "outbuf_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outbuf", "role": "read" }} , 
 	{ "name": "outcount48_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "outcount48", "role": "dout" }} , 
 	{ "name": "outcount48_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "outcount48", "role": "num_data_valid" }} , 
 	{ "name": "outcount48_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "outcount48", "role": "fifo_cap" }} , 
 	{ "name": "outcount48_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outcount48", "role": "empty_n" }} , 
 	{ "name": "outcount48_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outcount48", "role": "read" }} , 
 	{ "name": "in_en_clrsts_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_en_clrsts", "role": "dout" }} , 
 	{ "name": "in_en_clrsts_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in_en_clrsts", "role": "num_data_valid" }} , 
 	{ "name": "in_en_clrsts_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in_en_clrsts", "role": "fifo_cap" }} , 
 	{ "name": "in_en_clrsts_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_en_clrsts", "role": "empty_n" }} , 
 	{ "name": "in_en_clrsts_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_en_clrsts", "role": "read" }} , 
 	{ "name": "m2s_buf_sts", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m2s_buf_sts", "role": "default" }} , 
 	{ "name": "m2s_buf_sts_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m2s_buf_sts", "role": "ap_vld" }} , 
 	{ "name": "sts_clear_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "sts_clear", "role": "dout" }} , 
 	{ "name": "sts_clear_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "sts_clear", "role": "num_data_valid" }} , 
 	{ "name": "sts_clear_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "sts_clear", "role": "fifo_cap" }} , 
 	{ "name": "sts_clear_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sts_clear", "role": "empty_n" }} , 
 	{ "name": "sts_clear_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sts_clear", "role": "read" }} , 
 	{ "name": "outStreamTop_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "outStreamTop_V_data_V", "role": "default" }} , 
 	{ "name": "outStreamTop_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "outStreamTop_V_last_V", "role": "default" }} , 
 	{ "name": "outStreamTop_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "outStreamTop_V_last_V", "role": "default" }} , 
 	{ "name": "outStreamTop_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "outStreamTop_V_keep_V", "role": "default" }} , 
 	{ "name": "outStreamTop_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "outStreamTop_V_strb_V", "role": "default" }} , 
 	{ "name": "outStreamTop_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "outStreamTop_V_user_V", "role": "default" }} , 
 	{ "name": "outStreamTop_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "outStreamTop_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6"],
		"CDFG" : "sendoutstream",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "outbuf", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "128", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_sendoutstream_Pipeline_VITIS_LOOP_151_2_fu_101", "Port" : "outbuf", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "outcount48", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outcount48_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_en_clrsts", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "in_en_clrsts_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "m2s_buf_sts", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "sts_clear", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "sts_clear_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "outStreamTop_V_data_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_sendoutstream_Pipeline_VITIS_LOOP_151_2_fu_101", "Port" : "outStreamTop_V_data_V", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "outStreamTop_V_keep_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_sendoutstream_Pipeline_VITIS_LOOP_151_2_fu_101", "Port" : "outStreamTop_V_keep_V", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "outStreamTop_V_strb_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_sendoutstream_Pipeline_VITIS_LOOP_151_2_fu_101", "Port" : "outStreamTop_V_strb_V", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "outStreamTop_V_user_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_sendoutstream_Pipeline_VITIS_LOOP_151_2_fu_101", "Port" : "outStreamTop_V_user_V", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "outStreamTop_V_last_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_sendoutstream_Pipeline_VITIS_LOOP_151_2_fu_101", "Port" : "outStreamTop_V_last_V", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_149_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state5"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_sendoutstream_Pipeline_VITIS_LOOP_151_2_fu_101", "Parent" : "0",
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
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "PreState" : ["ap_ST_fsm_state1"], "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "PostState" : ["ap_ST_fsm_state4"]}}]},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_outStreamTop_V_data_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_outStreamTop_V_keep_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_outStreamTop_V_strb_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_outStreamTop_V_user_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_outStreamTop_V_last_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	sendoutstream {
		outbuf {Type I LastRead 2 FirstWrite -1}
		outcount48 {Type I LastRead 1 FirstWrite -1}
		in_en_clrsts {Type I LastRead 0 FirstWrite -1}
		m2s_buf_sts {Type O LastRead -1 FirstWrite 0}
		sts_clear {Type I LastRead 0 FirstWrite -1}
		outStreamTop_V_data_V {Type O LastRead -1 FirstWrite 2}
		outStreamTop_V_keep_V {Type O LastRead -1 FirstWrite 2}
		outStreamTop_V_strb_V {Type O LastRead -1 FirstWrite 2}
		outStreamTop_V_user_V {Type O LastRead -1 FirstWrite 2}
		outStreamTop_V_last_V {Type O LastRead -1 FirstWrite 2}}
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
]}

set Spec2ImplPortList { 
	outbuf { ap_fifo {  { outbuf_dout fifo_port_we 0 40 }  { outbuf_num_data_valid fifo_status_num_data_valid 0 8 }  { outbuf_fifo_cap fifo_update 0 8 }  { outbuf_empty_n fifo_status 0 1 }  { outbuf_read fifo_data 1 1 } } }
	outcount48 { ap_fifo {  { outcount48_dout fifo_port_we 0 32 }  { outcount48_num_data_valid fifo_status_num_data_valid 0 4 }  { outcount48_fifo_cap fifo_update 0 4 }  { outcount48_empty_n fifo_status 0 1 }  { outcount48_read fifo_data 1 1 } } }
	in_en_clrsts { ap_fifo {  { in_en_clrsts_dout fifo_port_we 0 1 }  { in_en_clrsts_num_data_valid fifo_status_num_data_valid 0 2 }  { in_en_clrsts_fifo_cap fifo_update 0 2 }  { in_en_clrsts_empty_n fifo_status 0 1 }  { in_en_clrsts_read fifo_data 1 1 } } }
	m2s_buf_sts { ap_vld {  { m2s_buf_sts out_data 1 1 }  { m2s_buf_sts_ap_vld out_vld 1 1 } } }
	sts_clear { ap_fifo {  { sts_clear_dout fifo_port_we 0 1 }  { sts_clear_num_data_valid fifo_status_num_data_valid 0 3 }  { sts_clear_fifo_cap fifo_update 0 3 }  { sts_clear_empty_n fifo_status 0 1 }  { sts_clear_read fifo_data 1 1 } } }
	outStreamTop_V_data_V { axis {  { outStreamTop_TDATA out_data 1 32 } } }
	outStreamTop_V_keep_V { axis {  { outStreamTop_TKEEP out_data 1 4 } } }
	outStreamTop_V_strb_V { axis {  { outStreamTop_TSTRB out_data 1 4 } } }
	outStreamTop_V_user_V { axis {  { outStreamTop_TUSER out_data 1 7 } } }
	outStreamTop_V_last_V { axis {  { outStreamTop_TVALID out_vld 1 1 }  { outStreamTop_TREADY out_acc 0 1 }  { outStreamTop_TLAST out_data 1 1 } } }
}
