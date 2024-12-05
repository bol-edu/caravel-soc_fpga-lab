set moduleName mmult_Pipeline_readB
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
set C_modelName {mmult_Pipeline_readB}
set C_modelType { void 0 }
set C_modelArgList {
	{ gmem1 int 32 regular {axi_master 0}  }
	{ sext_ln88 int 62 regular  }
	{ mul32 int 32 regular  }
	{ b_col int 32 regular  }
	{ b int 64 regular  }
	{ localB int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localB_1 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localB_2 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localB_3 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localB_4 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localB_5 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localB_6 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localB_7 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localB_8 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localB_9 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localB_10 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localB_11 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localB_12 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localB_13 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localB_14 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localB_15 int 32 regular {array 16 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "gmem1", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "b","offset": { "type": "dynamic","port_name": "b","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "sext_ln88", "interface" : "wire", "bitwidth" : 62, "direction" : "READONLY"} , 
 	{ "Name" : "mul32", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "b_col", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "b", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "localB", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localB_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localB_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localB_3", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localB_4", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localB_5", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localB_6", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localB_7", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localB_8", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localB_9", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localB_10", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localB_11", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localB_12", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localB_13", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localB_14", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localB_15", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 120
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
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
	{ sext_ln88 sc_in sc_lv 62 signal 1 } 
	{ mul32 sc_in sc_lv 32 signal 2 } 
	{ b_col sc_in sc_lv 32 signal 3 } 
	{ b sc_in sc_lv 64 signal 4 } 
	{ localB_address0 sc_out sc_lv 4 signal 5 } 
	{ localB_ce0 sc_out sc_logic 1 signal 5 } 
	{ localB_we0 sc_out sc_logic 1 signal 5 } 
	{ localB_d0 sc_out sc_lv 32 signal 5 } 
	{ localB_1_address0 sc_out sc_lv 4 signal 6 } 
	{ localB_1_ce0 sc_out sc_logic 1 signal 6 } 
	{ localB_1_we0 sc_out sc_logic 1 signal 6 } 
	{ localB_1_d0 sc_out sc_lv 32 signal 6 } 
	{ localB_2_address0 sc_out sc_lv 4 signal 7 } 
	{ localB_2_ce0 sc_out sc_logic 1 signal 7 } 
	{ localB_2_we0 sc_out sc_logic 1 signal 7 } 
	{ localB_2_d0 sc_out sc_lv 32 signal 7 } 
	{ localB_3_address0 sc_out sc_lv 4 signal 8 } 
	{ localB_3_ce0 sc_out sc_logic 1 signal 8 } 
	{ localB_3_we0 sc_out sc_logic 1 signal 8 } 
	{ localB_3_d0 sc_out sc_lv 32 signal 8 } 
	{ localB_4_address0 sc_out sc_lv 4 signal 9 } 
	{ localB_4_ce0 sc_out sc_logic 1 signal 9 } 
	{ localB_4_we0 sc_out sc_logic 1 signal 9 } 
	{ localB_4_d0 sc_out sc_lv 32 signal 9 } 
	{ localB_5_address0 sc_out sc_lv 4 signal 10 } 
	{ localB_5_ce0 sc_out sc_logic 1 signal 10 } 
	{ localB_5_we0 sc_out sc_logic 1 signal 10 } 
	{ localB_5_d0 sc_out sc_lv 32 signal 10 } 
	{ localB_6_address0 sc_out sc_lv 4 signal 11 } 
	{ localB_6_ce0 sc_out sc_logic 1 signal 11 } 
	{ localB_6_we0 sc_out sc_logic 1 signal 11 } 
	{ localB_6_d0 sc_out sc_lv 32 signal 11 } 
	{ localB_7_address0 sc_out sc_lv 4 signal 12 } 
	{ localB_7_ce0 sc_out sc_logic 1 signal 12 } 
	{ localB_7_we0 sc_out sc_logic 1 signal 12 } 
	{ localB_7_d0 sc_out sc_lv 32 signal 12 } 
	{ localB_8_address0 sc_out sc_lv 4 signal 13 } 
	{ localB_8_ce0 sc_out sc_logic 1 signal 13 } 
	{ localB_8_we0 sc_out sc_logic 1 signal 13 } 
	{ localB_8_d0 sc_out sc_lv 32 signal 13 } 
	{ localB_9_address0 sc_out sc_lv 4 signal 14 } 
	{ localB_9_ce0 sc_out sc_logic 1 signal 14 } 
	{ localB_9_we0 sc_out sc_logic 1 signal 14 } 
	{ localB_9_d0 sc_out sc_lv 32 signal 14 } 
	{ localB_10_address0 sc_out sc_lv 4 signal 15 } 
	{ localB_10_ce0 sc_out sc_logic 1 signal 15 } 
	{ localB_10_we0 sc_out sc_logic 1 signal 15 } 
	{ localB_10_d0 sc_out sc_lv 32 signal 15 } 
	{ localB_11_address0 sc_out sc_lv 4 signal 16 } 
	{ localB_11_ce0 sc_out sc_logic 1 signal 16 } 
	{ localB_11_we0 sc_out sc_logic 1 signal 16 } 
	{ localB_11_d0 sc_out sc_lv 32 signal 16 } 
	{ localB_12_address0 sc_out sc_lv 4 signal 17 } 
	{ localB_12_ce0 sc_out sc_logic 1 signal 17 } 
	{ localB_12_we0 sc_out sc_logic 1 signal 17 } 
	{ localB_12_d0 sc_out sc_lv 32 signal 17 } 
	{ localB_13_address0 sc_out sc_lv 4 signal 18 } 
	{ localB_13_ce0 sc_out sc_logic 1 signal 18 } 
	{ localB_13_we0 sc_out sc_logic 1 signal 18 } 
	{ localB_13_d0 sc_out sc_lv 32 signal 18 } 
	{ localB_14_address0 sc_out sc_lv 4 signal 19 } 
	{ localB_14_ce0 sc_out sc_logic 1 signal 19 } 
	{ localB_14_we0 sc_out sc_logic 1 signal 19 } 
	{ localB_14_d0 sc_out sc_lv 32 signal 19 } 
	{ localB_15_address0 sc_out sc_lv 4 signal 20 } 
	{ localB_15_ce0 sc_out sc_logic 1 signal 20 } 
	{ localB_15_we0 sc_out sc_logic 1 signal 20 } 
	{ localB_15_d0 sc_out sc_lv 32 signal 20 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
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
 	{ "name": "sext_ln88", "direction": "in", "datatype": "sc_lv", "bitwidth":62, "type": "signal", "bundle":{"name": "sext_ln88", "role": "default" }} , 
 	{ "name": "mul32", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mul32", "role": "default" }} , 
 	{ "name": "b_col", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "b_col", "role": "default" }} , 
 	{ "name": "b", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "b", "role": "default" }} , 
 	{ "name": "localB_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localB", "role": "address0" }} , 
 	{ "name": "localB_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB", "role": "ce0" }} , 
 	{ "name": "localB_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB", "role": "we0" }} , 
 	{ "name": "localB_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localB", "role": "d0" }} , 
 	{ "name": "localB_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localB_1", "role": "address0" }} , 
 	{ "name": "localB_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_1", "role": "ce0" }} , 
 	{ "name": "localB_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_1", "role": "we0" }} , 
 	{ "name": "localB_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localB_1", "role": "d0" }} , 
 	{ "name": "localB_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localB_2", "role": "address0" }} , 
 	{ "name": "localB_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_2", "role": "ce0" }} , 
 	{ "name": "localB_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_2", "role": "we0" }} , 
 	{ "name": "localB_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localB_2", "role": "d0" }} , 
 	{ "name": "localB_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localB_3", "role": "address0" }} , 
 	{ "name": "localB_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_3", "role": "ce0" }} , 
 	{ "name": "localB_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_3", "role": "we0" }} , 
 	{ "name": "localB_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localB_3", "role": "d0" }} , 
 	{ "name": "localB_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localB_4", "role": "address0" }} , 
 	{ "name": "localB_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_4", "role": "ce0" }} , 
 	{ "name": "localB_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_4", "role": "we0" }} , 
 	{ "name": "localB_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localB_4", "role": "d0" }} , 
 	{ "name": "localB_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localB_5", "role": "address0" }} , 
 	{ "name": "localB_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_5", "role": "ce0" }} , 
 	{ "name": "localB_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_5", "role": "we0" }} , 
 	{ "name": "localB_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localB_5", "role": "d0" }} , 
 	{ "name": "localB_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localB_6", "role": "address0" }} , 
 	{ "name": "localB_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_6", "role": "ce0" }} , 
 	{ "name": "localB_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_6", "role": "we0" }} , 
 	{ "name": "localB_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localB_6", "role": "d0" }} , 
 	{ "name": "localB_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localB_7", "role": "address0" }} , 
 	{ "name": "localB_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_7", "role": "ce0" }} , 
 	{ "name": "localB_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_7", "role": "we0" }} , 
 	{ "name": "localB_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localB_7", "role": "d0" }} , 
 	{ "name": "localB_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localB_8", "role": "address0" }} , 
 	{ "name": "localB_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_8", "role": "ce0" }} , 
 	{ "name": "localB_8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_8", "role": "we0" }} , 
 	{ "name": "localB_8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localB_8", "role": "d0" }} , 
 	{ "name": "localB_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localB_9", "role": "address0" }} , 
 	{ "name": "localB_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_9", "role": "ce0" }} , 
 	{ "name": "localB_9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_9", "role": "we0" }} , 
 	{ "name": "localB_9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localB_9", "role": "d0" }} , 
 	{ "name": "localB_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localB_10", "role": "address0" }} , 
 	{ "name": "localB_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_10", "role": "ce0" }} , 
 	{ "name": "localB_10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_10", "role": "we0" }} , 
 	{ "name": "localB_10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localB_10", "role": "d0" }} , 
 	{ "name": "localB_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localB_11", "role": "address0" }} , 
 	{ "name": "localB_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_11", "role": "ce0" }} , 
 	{ "name": "localB_11_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_11", "role": "we0" }} , 
 	{ "name": "localB_11_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localB_11", "role": "d0" }} , 
 	{ "name": "localB_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localB_12", "role": "address0" }} , 
 	{ "name": "localB_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_12", "role": "ce0" }} , 
 	{ "name": "localB_12_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_12", "role": "we0" }} , 
 	{ "name": "localB_12_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localB_12", "role": "d0" }} , 
 	{ "name": "localB_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localB_13", "role": "address0" }} , 
 	{ "name": "localB_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_13", "role": "ce0" }} , 
 	{ "name": "localB_13_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_13", "role": "we0" }} , 
 	{ "name": "localB_13_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localB_13", "role": "d0" }} , 
 	{ "name": "localB_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localB_14", "role": "address0" }} , 
 	{ "name": "localB_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_14", "role": "ce0" }} , 
 	{ "name": "localB_14_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_14", "role": "we0" }} , 
 	{ "name": "localB_14_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localB_14", "role": "d0" }} , 
 	{ "name": "localB_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localB_15", "role": "address0" }} , 
 	{ "name": "localB_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_15", "role": "ce0" }} , 
 	{ "name": "localB_15_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localB_15", "role": "we0" }} , 
 	{ "name": "localB_15_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localB_15", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "mmult_Pipeline_readB",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "265", "EstimateLatencyMax" : "265",
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
					{"Name" : "gmem1_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem1_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln88", "Type" : "None", "Direction" : "I"},
			{"Name" : "mul32", "Type" : "None", "Direction" : "I"},
			{"Name" : "b_col", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "localB", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localB_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localB_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localB_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localB_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localB_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localB_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localB_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localB_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localB_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localB_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localB_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localB_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localB_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localB_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localB_15", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "readB", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "9", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "PreState" : ["ap_ST_fsm_state7"], "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "PostState" : ["ap_ST_fsm_state11"]}}]}]}


set ArgLastReadFirstWriteLatency {
	mmult_Pipeline_readB {
		gmem1 {Type I LastRead 8 FirstWrite -1}
		sext_ln88 {Type I LastRead 0 FirstWrite -1}
		mul32 {Type I LastRead 0 FirstWrite -1}
		b_col {Type I LastRead 6 FirstWrite -1}
		b {Type I LastRead 6 FirstWrite -1}
		localB {Type O LastRead -1 FirstWrite 9}
		localB_1 {Type O LastRead -1 FirstWrite 9}
		localB_2 {Type O LastRead -1 FirstWrite 9}
		localB_3 {Type O LastRead -1 FirstWrite 9}
		localB_4 {Type O LastRead -1 FirstWrite 9}
		localB_5 {Type O LastRead -1 FirstWrite 9}
		localB_6 {Type O LastRead -1 FirstWrite 9}
		localB_7 {Type O LastRead -1 FirstWrite 9}
		localB_8 {Type O LastRead -1 FirstWrite 9}
		localB_9 {Type O LastRead -1 FirstWrite 9}
		localB_10 {Type O LastRead -1 FirstWrite 9}
		localB_11 {Type O LastRead -1 FirstWrite 9}
		localB_12 {Type O LastRead -1 FirstWrite 9}
		localB_13 {Type O LastRead -1 FirstWrite 9}
		localB_14 {Type O LastRead -1 FirstWrite 9}
		localB_15 {Type O LastRead -1 FirstWrite 9}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "265", "Max" : "265"}
	, {"Name" : "Interval", "Min" : "265", "Max" : "265"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_gmem1_AWVALID VALID 1 1 }  { m_axi_gmem1_AWREADY READY 0 1 }  { m_axi_gmem1_AWADDR ADDR 1 64 }  { m_axi_gmem1_AWID ID 1 1 }  { m_axi_gmem1_AWLEN SIZE 1 32 }  { m_axi_gmem1_AWSIZE BURST 1 3 }  { m_axi_gmem1_AWBURST LOCK 1 2 }  { m_axi_gmem1_AWLOCK CACHE 1 2 }  { m_axi_gmem1_AWCACHE PROT 1 4 }  { m_axi_gmem1_AWPROT QOS 1 3 }  { m_axi_gmem1_AWQOS REGION 1 4 }  { m_axi_gmem1_AWREGION USER 1 4 }  { m_axi_gmem1_AWUSER DATA 1 1 }  { m_axi_gmem1_WVALID VALID 1 1 }  { m_axi_gmem1_WREADY READY 0 1 }  { m_axi_gmem1_WDATA FIFONUM 1 32 }  { m_axi_gmem1_WSTRB STRB 1 4 }  { m_axi_gmem1_WLAST LAST 1 1 }  { m_axi_gmem1_WID ID 1 1 }  { m_axi_gmem1_WUSER DATA 1 1 }  { m_axi_gmem1_ARVALID VALID 1 1 }  { m_axi_gmem1_ARREADY READY 0 1 }  { m_axi_gmem1_ARADDR ADDR 1 64 }  { m_axi_gmem1_ARID ID 1 1 }  { m_axi_gmem1_ARLEN SIZE 1 32 }  { m_axi_gmem1_ARSIZE BURST 1 3 }  { m_axi_gmem1_ARBURST LOCK 1 2 }  { m_axi_gmem1_ARLOCK CACHE 1 2 }  { m_axi_gmem1_ARCACHE PROT 1 4 }  { m_axi_gmem1_ARPROT QOS 1 3 }  { m_axi_gmem1_ARQOS REGION 1 4 }  { m_axi_gmem1_ARREGION USER 1 4 }  { m_axi_gmem1_ARUSER DATA 1 1 }  { m_axi_gmem1_RVALID VALID 0 1 }  { m_axi_gmem1_RREADY READY 1 1 }  { m_axi_gmem1_RDATA FIFONUM 0 32 }  { m_axi_gmem1_RLAST LAST 0 1 }  { m_axi_gmem1_RID ID 0 1 }  { m_axi_gmem1_RFIFONUM LEN 0 9 }  { m_axi_gmem1_RUSER DATA 0 1 }  { m_axi_gmem1_RRESP RESP 0 2 }  { m_axi_gmem1_BVALID VALID 0 1 }  { m_axi_gmem1_BREADY READY 1 1 }  { m_axi_gmem1_BRESP RESP 0 2 }  { m_axi_gmem1_BID ID 0 1 }  { m_axi_gmem1_BUSER DATA 0 1 } } }
	sext_ln88 { ap_none {  { sext_ln88 in_data 0 62 } } }
	mul32 { ap_none {  { mul32 in_data 0 32 } } }
	b_col { ap_none {  { b_col in_data 0 32 } } }
	b { ap_none {  { b in_data 0 64 } } }
	localB { ap_memory {  { localB_address0 mem_address 1 4 }  { localB_ce0 mem_ce 1 1 }  { localB_we0 mem_we 1 1 }  { localB_d0 mem_din 1 32 } } }
	localB_1 { ap_memory {  { localB_1_address0 mem_address 1 4 }  { localB_1_ce0 mem_ce 1 1 }  { localB_1_we0 mem_we 1 1 }  { localB_1_d0 mem_din 1 32 } } }
	localB_2 { ap_memory {  { localB_2_address0 mem_address 1 4 }  { localB_2_ce0 mem_ce 1 1 }  { localB_2_we0 mem_we 1 1 }  { localB_2_d0 mem_din 1 32 } } }
	localB_3 { ap_memory {  { localB_3_address0 mem_address 1 4 }  { localB_3_ce0 mem_ce 1 1 }  { localB_3_we0 mem_we 1 1 }  { localB_3_d0 mem_din 1 32 } } }
	localB_4 { ap_memory {  { localB_4_address0 mem_address 1 4 }  { localB_4_ce0 mem_ce 1 1 }  { localB_4_we0 mem_we 1 1 }  { localB_4_d0 mem_din 1 32 } } }
	localB_5 { ap_memory {  { localB_5_address0 mem_address 1 4 }  { localB_5_ce0 mem_ce 1 1 }  { localB_5_we0 mem_we 1 1 }  { localB_5_d0 mem_din 1 32 } } }
	localB_6 { ap_memory {  { localB_6_address0 mem_address 1 4 }  { localB_6_ce0 mem_ce 1 1 }  { localB_6_we0 mem_we 1 1 }  { localB_6_d0 mem_din 1 32 } } }
	localB_7 { ap_memory {  { localB_7_address0 mem_address 1 4 }  { localB_7_ce0 mem_ce 1 1 }  { localB_7_we0 mem_we 1 1 }  { localB_7_d0 mem_din 1 32 } } }
	localB_8 { ap_memory {  { localB_8_address0 mem_address 1 4 }  { localB_8_ce0 mem_ce 1 1 }  { localB_8_we0 mem_we 1 1 }  { localB_8_d0 mem_din 1 32 } } }
	localB_9 { ap_memory {  { localB_9_address0 mem_address 1 4 }  { localB_9_ce0 mem_ce 1 1 }  { localB_9_we0 mem_we 1 1 }  { localB_9_d0 mem_din 1 32 } } }
	localB_10 { ap_memory {  { localB_10_address0 mem_address 1 4 }  { localB_10_ce0 mem_ce 1 1 }  { localB_10_we0 mem_we 1 1 }  { localB_10_d0 mem_din 1 32 } } }
	localB_11 { ap_memory {  { localB_11_address0 mem_address 1 4 }  { localB_11_ce0 mem_ce 1 1 }  { localB_11_we0 mem_we 1 1 }  { localB_11_d0 mem_din 1 32 } } }
	localB_12 { ap_memory {  { localB_12_address0 mem_address 1 4 }  { localB_12_ce0 mem_ce 1 1 }  { localB_12_we0 mem_we 1 1 }  { localB_12_d0 mem_din 1 32 } } }
	localB_13 { ap_memory {  { localB_13_address0 mem_address 1 4 }  { localB_13_ce0 mem_ce 1 1 }  { localB_13_we0 mem_we 1 1 }  { localB_13_d0 mem_din 1 32 } } }
	localB_14 { ap_memory {  { localB_14_address0 mem_address 1 4 }  { localB_14_ce0 mem_ce 1 1 }  { localB_14_we0 mem_we 1 1 }  { localB_14_d0 mem_din 1 32 } } }
	localB_15 { ap_memory {  { localB_15_address0 mem_address 1 4 }  { localB_15_ce0 mem_ce 1 1 }  { localB_15_we0 mem_we 1 1 }  { localB_15_d0 mem_din 1 32 } } }
}
