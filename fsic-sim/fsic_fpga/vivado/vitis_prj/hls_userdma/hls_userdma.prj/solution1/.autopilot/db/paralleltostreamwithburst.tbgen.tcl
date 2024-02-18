set moduleName paralleltostreamwithburst
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
set C_modelName {paralleltostreamwithburst}
set C_modelType { void 0 }
set C_modelArgList {
	{ gmem1 int 32 regular {axi_master 0}  }
	{ in_memory int 64 regular  }
	{ in_en_clrsts int 1 regular  }
	{ in_Img_width int 32 regular  }
	{ in_m2s_len int 32 regular  }
	{ outbuf int 40 regular {fifo 1 volatile }  }
	{ outcount48 int 32 regular {fifo 1 volatile }  }
	{ m2s_enb_clrsts_c int 1 regular {fifo 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "gmem1", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "m2sbuf","offset": { "type": "dynamic","port_name": "m2sbuf","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "in_memory", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "in_en_clrsts", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "in_Img_width", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "in_m2s_len", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "outbuf", "interface" : "fifo", "bitwidth" : 40, "direction" : "WRITEONLY"} , 
 	{ "Name" : "outcount48", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m2s_enb_clrsts_c", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 72
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_gmem1_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem1_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem1_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem1_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem1_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem1_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem1_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem1_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem1_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem1_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem1_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem1_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem1_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem1_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem1_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem1_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem1_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem1_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem1_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem1_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem1_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem1_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem1_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem1_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem1_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem1_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem1_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem1_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem1_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem1_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem1_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem1_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem1_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem1_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem1_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem1_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_gmem1_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem1_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem1_RFIFONUM sc_in sc_lv 9 signal 0 } 
	{ m_axi_gmem1_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem1_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem1_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem1_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem1_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem1_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem1_BUSER sc_in sc_lv 1 signal 0 } 
	{ in_memory sc_in sc_lv 64 signal 1 } 
	{ in_en_clrsts sc_in sc_lv 1 signal 2 } 
	{ in_Img_width sc_in sc_lv 32 signal 3 } 
	{ in_m2s_len sc_in sc_lv 32 signal 4 } 
	{ outbuf_din sc_out sc_lv 40 signal 5 } 
	{ outbuf_num_data_valid sc_in sc_lv 8 signal 5 } 
	{ outbuf_fifo_cap sc_in sc_lv 8 signal 5 } 
	{ outbuf_full_n sc_in sc_logic 1 signal 5 } 
	{ outbuf_write sc_out sc_logic 1 signal 5 } 
	{ outcount48_din sc_out sc_lv 32 signal 6 } 
	{ outcount48_num_data_valid sc_in sc_lv 4 signal 6 } 
	{ outcount48_fifo_cap sc_in sc_lv 4 signal 6 } 
	{ outcount48_full_n sc_in sc_logic 1 signal 6 } 
	{ outcount48_write sc_out sc_logic 1 signal 6 } 
	{ m2s_enb_clrsts_c_din sc_out sc_lv 1 signal 7 } 
	{ m2s_enb_clrsts_c_num_data_valid sc_in sc_lv 2 signal 7 } 
	{ m2s_enb_clrsts_c_fifo_cap sc_in sc_lv 2 signal 7 } 
	{ m2s_enb_clrsts_c_full_n sc_in sc_logic 1 signal 7 } 
	{ m2s_enb_clrsts_c_write sc_out sc_logic 1 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_gmem1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem1", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem1_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem1", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem1_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem1_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem1_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem1_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem1", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem1_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem1_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem1_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem1_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem1_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem1_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem1", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem1_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem1_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem1_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "WID" }} , 
 	{ "name": "m_axi_gmem1_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem1_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem1_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem1_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem1", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem1_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem1", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem1_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem1", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem1_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem1_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem1_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem1_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem1", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem1_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem1_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem1_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem1_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem1_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem1_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem1", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem1_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem1_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "RID" }} , 
 	{ "name": "m_axi_gmem1_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "gmem1", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_gmem1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "BID" }} , 
 	{ "name": "m_axi_gmem1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "BUSER" }} , 
 	{ "name": "in_memory", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "in_memory", "role": "default" }} , 
 	{ "name": "in_en_clrsts", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_en_clrsts", "role": "default" }} , 
 	{ "name": "in_Img_width", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_Img_width", "role": "default" }} , 
 	{ "name": "in_m2s_len", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_m2s_len", "role": "default" }} , 
 	{ "name": "outbuf_din", "direction": "out", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "outbuf", "role": "din" }} , 
 	{ "name": "outbuf_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "outbuf", "role": "num_data_valid" }} , 
 	{ "name": "outbuf_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "outbuf", "role": "fifo_cap" }} , 
 	{ "name": "outbuf_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outbuf", "role": "full_n" }} , 
 	{ "name": "outbuf_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outbuf", "role": "write" }} , 
 	{ "name": "outcount48_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "outcount48", "role": "din" }} , 
 	{ "name": "outcount48_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "outcount48", "role": "num_data_valid" }} , 
 	{ "name": "outcount48_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "outcount48", "role": "fifo_cap" }} , 
 	{ "name": "outcount48_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outcount48", "role": "full_n" }} , 
 	{ "name": "outcount48_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outcount48", "role": "write" }} , 
 	{ "name": "m2s_enb_clrsts_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m2s_enb_clrsts_c", "role": "din" }} , 
 	{ "name": "m2s_enb_clrsts_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m2s_enb_clrsts_c", "role": "num_data_valid" }} , 
 	{ "name": "m2s_enb_clrsts_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m2s_enb_clrsts_c", "role": "fifo_cap" }} , 
 	{ "name": "m2s_enb_clrsts_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m2s_enb_clrsts_c", "role": "full_n" }} , 
 	{ "name": "m2s_enb_clrsts_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m2s_enb_clrsts_c", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "paralleltostreamwithburst",
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
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem1_blk_n_AR", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_107_2_fu_173", "Port" : "gmem1", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "in_memory", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_en_clrsts", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_Img_width", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_m2s_len", "Type" : "None", "Direction" : "I"},
			{"Name" : "outbuf", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "128", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_107_2_fu_173", "Port" : "outbuf", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "outcount48", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outcount48_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "m2s_enb_clrsts_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "m2s_enb_clrsts_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "first", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "m2s_len", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_107_2_fu_173", "Port" : "m2s_len", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "Img_width_count", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_107_2_fu_173", "Port" : "Img_width_count", "Inst_start_state" : "20", "Inst_end_state" : "21"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_99_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "22", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state22"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_107_2_fu_173", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "paralleltostreamwithburst_Pipeline_VITIS_LOOP_107_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem1_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln107", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "sub", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_m2s_len", "Type" : "None", "Direction" : "I"},
			{"Name" : "sub_i_i", "Type" : "None", "Direction" : "I"},
			{"Name" : "outbuf", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "outbuf_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "dec_phi_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "m2s_len", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "Img_width_count", "Type" : "OVld", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_107_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_107_2_fu_173.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	paralleltostreamwithburst {
		gmem1 {Type I LastRead 2 FirstWrite -1}
		in_memory {Type I LastRead 0 FirstWrite -1}
		in_en_clrsts {Type I LastRead 0 FirstWrite -1}
		in_Img_width {Type I LastRead 0 FirstWrite -1}
		in_m2s_len {Type I LastRead 0 FirstWrite -1}
		outbuf {Type O LastRead -1 FirstWrite 2}
		outcount48 {Type O LastRead -1 FirstWrite 20}
		m2s_enb_clrsts_c {Type O LastRead -1 FirstWrite 0}
		first {Type IO LastRead -1 FirstWrite -1}
		m2s_len {Type IO LastRead -1 FirstWrite -1}
		Img_width_count {Type IO LastRead -1 FirstWrite -1}}
	paralleltostreamwithburst_Pipeline_VITIS_LOOP_107_2 {
		gmem1 {Type I LastRead 1 FirstWrite -1}
		sext_ln107 {Type I LastRead 0 FirstWrite -1}
		trunc_ln {Type I LastRead 0 FirstWrite -1}
		sub {Type I LastRead 0 FirstWrite -1}
		in_m2s_len {Type I LastRead 0 FirstWrite -1}
		sub_i_i {Type I LastRead 0 FirstWrite -1}
		outbuf {Type O LastRead -1 FirstWrite 2}
		dec_phi_out {Type O LastRead -1 FirstWrite 1}
		m2s_len {Type IO LastRead 0 FirstWrite 0}
		Img_width_count {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_gmem1_AWVALID VALID 1 1 }  { m_axi_gmem1_AWREADY READY 0 1 }  { m_axi_gmem1_AWADDR ADDR 1 64 }  { m_axi_gmem1_AWID ID 1 1 }  { m_axi_gmem1_AWLEN SIZE 1 32 }  { m_axi_gmem1_AWSIZE BURST 1 3 }  { m_axi_gmem1_AWBURST LOCK 1 2 }  { m_axi_gmem1_AWLOCK CACHE 1 2 }  { m_axi_gmem1_AWCACHE PROT 1 4 }  { m_axi_gmem1_AWPROT QOS 1 3 }  { m_axi_gmem1_AWQOS REGION 1 4 }  { m_axi_gmem1_AWREGION USER 1 4 }  { m_axi_gmem1_AWUSER DATA 1 1 }  { m_axi_gmem1_WVALID VALID 1 1 }  { m_axi_gmem1_WREADY READY 0 1 }  { m_axi_gmem1_WDATA FIFONUM 1 32 }  { m_axi_gmem1_WSTRB STRB 1 4 }  { m_axi_gmem1_WLAST LAST 1 1 }  { m_axi_gmem1_WID ID 1 1 }  { m_axi_gmem1_WUSER DATA 1 1 }  { m_axi_gmem1_ARVALID VALID 1 1 }  { m_axi_gmem1_ARREADY READY 0 1 }  { m_axi_gmem1_ARADDR ADDR 1 64 }  { m_axi_gmem1_ARID ID 1 1 }  { m_axi_gmem1_ARLEN SIZE 1 32 }  { m_axi_gmem1_ARSIZE BURST 1 3 }  { m_axi_gmem1_ARBURST LOCK 1 2 }  { m_axi_gmem1_ARLOCK CACHE 1 2 }  { m_axi_gmem1_ARCACHE PROT 1 4 }  { m_axi_gmem1_ARPROT QOS 1 3 }  { m_axi_gmem1_ARQOS REGION 1 4 }  { m_axi_gmem1_ARREGION USER 1 4 }  { m_axi_gmem1_ARUSER DATA 1 1 }  { m_axi_gmem1_RVALID VALID 0 1 }  { m_axi_gmem1_RREADY READY 1 1 }  { m_axi_gmem1_RDATA FIFONUM 0 32 }  { m_axi_gmem1_RLAST LAST 0 1 }  { m_axi_gmem1_RID ID 0 1 }  { m_axi_gmem1_RFIFONUM LEN 0 9 }  { m_axi_gmem1_RUSER DATA 0 1 }  { m_axi_gmem1_RRESP RESP 0 2 }  { m_axi_gmem1_BVALID VALID 0 1 }  { m_axi_gmem1_BREADY READY 1 1 }  { m_axi_gmem1_BRESP RESP 0 2 }  { m_axi_gmem1_BID ID 0 1 }  { m_axi_gmem1_BUSER DATA 0 1 } } }
	in_memory { ap_none {  { in_memory in_data 0 64 } } }
	in_en_clrsts { ap_none {  { in_en_clrsts in_data 0 1 } } }
	in_Img_width { ap_none {  { in_Img_width in_data 0 32 } } }
	in_m2s_len { ap_none {  { in_m2s_len in_data 0 32 } } }
	outbuf { ap_fifo {  { outbuf_din fifo_port_we 1 40 }  { outbuf_num_data_valid fifo_status_num_data_valid 0 8 }  { outbuf_fifo_cap fifo_update 0 8 }  { outbuf_full_n fifo_status 0 1 }  { outbuf_write fifo_data 1 1 } } }
	outcount48 { ap_fifo {  { outcount48_din fifo_port_we 1 32 }  { outcount48_num_data_valid fifo_status_num_data_valid 0 4 }  { outcount48_fifo_cap fifo_update 0 4 }  { outcount48_full_n fifo_status 0 1 }  { outcount48_write fifo_data 1 1 } } }
	m2s_enb_clrsts_c { ap_fifo {  { m2s_enb_clrsts_c_din fifo_port_we 1 1 }  { m2s_enb_clrsts_c_num_data_valid fifo_status_num_data_valid 0 2 }  { m2s_enb_clrsts_c_fifo_cap fifo_update 0 2 }  { m2s_enb_clrsts_c_full_n fifo_status 0 1 }  { m2s_enb_clrsts_c_write fifo_data 1 1 } } }
}
