set moduleName mmult_Pipeline_readA
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
set C_modelName {mmult_Pipeline_readA}
set C_modelType { void 0 }
set C_modelArgList {
	{ gmem0 int 32 regular {axi_master 0}  }
	{ sext_ln69 int 62 regular  }
	{ mul int 32 regular  }
	{ a_col int 32 regular  }
	{ a int 64 regular  }
	{ localA int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localA_1 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localA_2 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localA_3 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localA_4 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localA_5 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localA_6 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localA_7 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localA_8 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localA_9 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localA_10 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localA_11 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localA_12 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localA_13 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localA_14 int 32 regular {array 16 { 0 3 } 0 1 }  }
	{ localA_15 int 32 regular {array 16 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "gmem0", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "a","offset": { "type": "dynamic","port_name": "a","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "sext_ln69", "interface" : "wire", "bitwidth" : 62, "direction" : "READONLY"} , 
 	{ "Name" : "mul", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "a_col", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "a", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "localA", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localA_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localA_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localA_3", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localA_4", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localA_5", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localA_6", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localA_7", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localA_8", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localA_9", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localA_10", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localA_11", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localA_12", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localA_13", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localA_14", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "localA_15", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 120
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_gmem0_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem0_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem0_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem0_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem0_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem0_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem0_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem0_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem0_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem0_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem0_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem0_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem0_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem0_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_gmem0_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem0_RFIFONUM sc_in sc_lv 9 signal 0 } 
	{ m_axi_gmem0_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem0_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem0_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem0_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem0_BUSER sc_in sc_lv 1 signal 0 } 
	{ sext_ln69 sc_in sc_lv 62 signal 1 } 
	{ mul sc_in sc_lv 32 signal 2 } 
	{ a_col sc_in sc_lv 32 signal 3 } 
	{ a sc_in sc_lv 64 signal 4 } 
	{ localA_address0 sc_out sc_lv 4 signal 5 } 
	{ localA_ce0 sc_out sc_logic 1 signal 5 } 
	{ localA_we0 sc_out sc_logic 1 signal 5 } 
	{ localA_d0 sc_out sc_lv 32 signal 5 } 
	{ localA_1_address0 sc_out sc_lv 4 signal 6 } 
	{ localA_1_ce0 sc_out sc_logic 1 signal 6 } 
	{ localA_1_we0 sc_out sc_logic 1 signal 6 } 
	{ localA_1_d0 sc_out sc_lv 32 signal 6 } 
	{ localA_2_address0 sc_out sc_lv 4 signal 7 } 
	{ localA_2_ce0 sc_out sc_logic 1 signal 7 } 
	{ localA_2_we0 sc_out sc_logic 1 signal 7 } 
	{ localA_2_d0 sc_out sc_lv 32 signal 7 } 
	{ localA_3_address0 sc_out sc_lv 4 signal 8 } 
	{ localA_3_ce0 sc_out sc_logic 1 signal 8 } 
	{ localA_3_we0 sc_out sc_logic 1 signal 8 } 
	{ localA_3_d0 sc_out sc_lv 32 signal 8 } 
	{ localA_4_address0 sc_out sc_lv 4 signal 9 } 
	{ localA_4_ce0 sc_out sc_logic 1 signal 9 } 
	{ localA_4_we0 sc_out sc_logic 1 signal 9 } 
	{ localA_4_d0 sc_out sc_lv 32 signal 9 } 
	{ localA_5_address0 sc_out sc_lv 4 signal 10 } 
	{ localA_5_ce0 sc_out sc_logic 1 signal 10 } 
	{ localA_5_we0 sc_out sc_logic 1 signal 10 } 
	{ localA_5_d0 sc_out sc_lv 32 signal 10 } 
	{ localA_6_address0 sc_out sc_lv 4 signal 11 } 
	{ localA_6_ce0 sc_out sc_logic 1 signal 11 } 
	{ localA_6_we0 sc_out sc_logic 1 signal 11 } 
	{ localA_6_d0 sc_out sc_lv 32 signal 11 } 
	{ localA_7_address0 sc_out sc_lv 4 signal 12 } 
	{ localA_7_ce0 sc_out sc_logic 1 signal 12 } 
	{ localA_7_we0 sc_out sc_logic 1 signal 12 } 
	{ localA_7_d0 sc_out sc_lv 32 signal 12 } 
	{ localA_8_address0 sc_out sc_lv 4 signal 13 } 
	{ localA_8_ce0 sc_out sc_logic 1 signal 13 } 
	{ localA_8_we0 sc_out sc_logic 1 signal 13 } 
	{ localA_8_d0 sc_out sc_lv 32 signal 13 } 
	{ localA_9_address0 sc_out sc_lv 4 signal 14 } 
	{ localA_9_ce0 sc_out sc_logic 1 signal 14 } 
	{ localA_9_we0 sc_out sc_logic 1 signal 14 } 
	{ localA_9_d0 sc_out sc_lv 32 signal 14 } 
	{ localA_10_address0 sc_out sc_lv 4 signal 15 } 
	{ localA_10_ce0 sc_out sc_logic 1 signal 15 } 
	{ localA_10_we0 sc_out sc_logic 1 signal 15 } 
	{ localA_10_d0 sc_out sc_lv 32 signal 15 } 
	{ localA_11_address0 sc_out sc_lv 4 signal 16 } 
	{ localA_11_ce0 sc_out sc_logic 1 signal 16 } 
	{ localA_11_we0 sc_out sc_logic 1 signal 16 } 
	{ localA_11_d0 sc_out sc_lv 32 signal 16 } 
	{ localA_12_address0 sc_out sc_lv 4 signal 17 } 
	{ localA_12_ce0 sc_out sc_logic 1 signal 17 } 
	{ localA_12_we0 sc_out sc_logic 1 signal 17 } 
	{ localA_12_d0 sc_out sc_lv 32 signal 17 } 
	{ localA_13_address0 sc_out sc_lv 4 signal 18 } 
	{ localA_13_ce0 sc_out sc_logic 1 signal 18 } 
	{ localA_13_we0 sc_out sc_logic 1 signal 18 } 
	{ localA_13_d0 sc_out sc_lv 32 signal 18 } 
	{ localA_14_address0 sc_out sc_lv 4 signal 19 } 
	{ localA_14_ce0 sc_out sc_logic 1 signal 19 } 
	{ localA_14_we0 sc_out sc_logic 1 signal 19 } 
	{ localA_14_d0 sc_out sc_lv 32 signal 19 } 
	{ localA_15_address0 sc_out sc_lv 4 signal 20 } 
	{ localA_15_ce0 sc_out sc_logic 1 signal 20 } 
	{ localA_15_we0 sc_out sc_logic 1 signal 20 } 
	{ localA_15_d0 sc_out sc_lv 32 signal 20 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_gmem0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem0", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem0", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem0", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WID" }} , 
 	{ "name": "m_axi_gmem0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem0", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem0", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem0", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RID" }} , 
 	{ "name": "m_axi_gmem0_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "gmem0", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_gmem0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BID" }} , 
 	{ "name": "m_axi_gmem0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BUSER" }} , 
 	{ "name": "sext_ln69", "direction": "in", "datatype": "sc_lv", "bitwidth":62, "type": "signal", "bundle":{"name": "sext_ln69", "role": "default" }} , 
 	{ "name": "mul", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mul", "role": "default" }} , 
 	{ "name": "a_col", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a_col", "role": "default" }} , 
 	{ "name": "a", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "a", "role": "default" }} , 
 	{ "name": "localA_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localA", "role": "address0" }} , 
 	{ "name": "localA_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA", "role": "ce0" }} , 
 	{ "name": "localA_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA", "role": "we0" }} , 
 	{ "name": "localA_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localA", "role": "d0" }} , 
 	{ "name": "localA_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localA_1", "role": "address0" }} , 
 	{ "name": "localA_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_1", "role": "ce0" }} , 
 	{ "name": "localA_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_1", "role": "we0" }} , 
 	{ "name": "localA_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localA_1", "role": "d0" }} , 
 	{ "name": "localA_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localA_2", "role": "address0" }} , 
 	{ "name": "localA_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_2", "role": "ce0" }} , 
 	{ "name": "localA_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_2", "role": "we0" }} , 
 	{ "name": "localA_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localA_2", "role": "d0" }} , 
 	{ "name": "localA_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localA_3", "role": "address0" }} , 
 	{ "name": "localA_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_3", "role": "ce0" }} , 
 	{ "name": "localA_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_3", "role": "we0" }} , 
 	{ "name": "localA_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localA_3", "role": "d0" }} , 
 	{ "name": "localA_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localA_4", "role": "address0" }} , 
 	{ "name": "localA_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_4", "role": "ce0" }} , 
 	{ "name": "localA_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_4", "role": "we0" }} , 
 	{ "name": "localA_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localA_4", "role": "d0" }} , 
 	{ "name": "localA_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localA_5", "role": "address0" }} , 
 	{ "name": "localA_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_5", "role": "ce0" }} , 
 	{ "name": "localA_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_5", "role": "we0" }} , 
 	{ "name": "localA_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localA_5", "role": "d0" }} , 
 	{ "name": "localA_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localA_6", "role": "address0" }} , 
 	{ "name": "localA_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_6", "role": "ce0" }} , 
 	{ "name": "localA_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_6", "role": "we0" }} , 
 	{ "name": "localA_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localA_6", "role": "d0" }} , 
 	{ "name": "localA_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localA_7", "role": "address0" }} , 
 	{ "name": "localA_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_7", "role": "ce0" }} , 
 	{ "name": "localA_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_7", "role": "we0" }} , 
 	{ "name": "localA_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localA_7", "role": "d0" }} , 
 	{ "name": "localA_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localA_8", "role": "address0" }} , 
 	{ "name": "localA_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_8", "role": "ce0" }} , 
 	{ "name": "localA_8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_8", "role": "we0" }} , 
 	{ "name": "localA_8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localA_8", "role": "d0" }} , 
 	{ "name": "localA_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localA_9", "role": "address0" }} , 
 	{ "name": "localA_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_9", "role": "ce0" }} , 
 	{ "name": "localA_9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_9", "role": "we0" }} , 
 	{ "name": "localA_9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localA_9", "role": "d0" }} , 
 	{ "name": "localA_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localA_10", "role": "address0" }} , 
 	{ "name": "localA_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_10", "role": "ce0" }} , 
 	{ "name": "localA_10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_10", "role": "we0" }} , 
 	{ "name": "localA_10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localA_10", "role": "d0" }} , 
 	{ "name": "localA_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localA_11", "role": "address0" }} , 
 	{ "name": "localA_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_11", "role": "ce0" }} , 
 	{ "name": "localA_11_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_11", "role": "we0" }} , 
 	{ "name": "localA_11_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localA_11", "role": "d0" }} , 
 	{ "name": "localA_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localA_12", "role": "address0" }} , 
 	{ "name": "localA_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_12", "role": "ce0" }} , 
 	{ "name": "localA_12_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_12", "role": "we0" }} , 
 	{ "name": "localA_12_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localA_12", "role": "d0" }} , 
 	{ "name": "localA_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localA_13", "role": "address0" }} , 
 	{ "name": "localA_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_13", "role": "ce0" }} , 
 	{ "name": "localA_13_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_13", "role": "we0" }} , 
 	{ "name": "localA_13_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localA_13", "role": "d0" }} , 
 	{ "name": "localA_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localA_14", "role": "address0" }} , 
 	{ "name": "localA_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_14", "role": "ce0" }} , 
 	{ "name": "localA_14_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_14", "role": "we0" }} , 
 	{ "name": "localA_14_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localA_14", "role": "d0" }} , 
 	{ "name": "localA_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "localA_15", "role": "address0" }} , 
 	{ "name": "localA_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_15", "role": "ce0" }} , 
 	{ "name": "localA_15_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "localA_15", "role": "we0" }} , 
 	{ "name": "localA_15_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "localA_15", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "mmult_Pipeline_readA",
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
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem0_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem0_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln69", "Type" : "None", "Direction" : "I"},
			{"Name" : "mul", "Type" : "None", "Direction" : "I"},
			{"Name" : "a_col", "Type" : "None", "Direction" : "I"},
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "localA", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localA_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localA_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localA_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localA_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localA_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localA_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localA_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localA_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localA_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localA_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localA_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localA_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localA_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localA_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "localA_15", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "readA", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "9", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "PreState" : ["ap_ST_fsm_state7"], "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "PostState" : ["ap_ST_fsm_state11"]}}]}]}


set ArgLastReadFirstWriteLatency {
	mmult_Pipeline_readA {
		gmem0 {Type I LastRead 8 FirstWrite -1}
		sext_ln69 {Type I LastRead 0 FirstWrite -1}
		mul {Type I LastRead 0 FirstWrite -1}
		a_col {Type I LastRead 6 FirstWrite -1}
		a {Type I LastRead 6 FirstWrite -1}
		localA {Type O LastRead -1 FirstWrite 9}
		localA_1 {Type O LastRead -1 FirstWrite 9}
		localA_2 {Type O LastRead -1 FirstWrite 9}
		localA_3 {Type O LastRead -1 FirstWrite 9}
		localA_4 {Type O LastRead -1 FirstWrite 9}
		localA_5 {Type O LastRead -1 FirstWrite 9}
		localA_6 {Type O LastRead -1 FirstWrite 9}
		localA_7 {Type O LastRead -1 FirstWrite 9}
		localA_8 {Type O LastRead -1 FirstWrite 9}
		localA_9 {Type O LastRead -1 FirstWrite 9}
		localA_10 {Type O LastRead -1 FirstWrite 9}
		localA_11 {Type O LastRead -1 FirstWrite 9}
		localA_12 {Type O LastRead -1 FirstWrite 9}
		localA_13 {Type O LastRead -1 FirstWrite 9}
		localA_14 {Type O LastRead -1 FirstWrite 9}
		localA_15 {Type O LastRead -1 FirstWrite 9}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "265", "Max" : "265"}
	, {"Name" : "Interval", "Min" : "265", "Max" : "265"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_gmem0_AWVALID VALID 1 1 }  { m_axi_gmem0_AWREADY READY 0 1 }  { m_axi_gmem0_AWADDR ADDR 1 64 }  { m_axi_gmem0_AWID ID 1 1 }  { m_axi_gmem0_AWLEN SIZE 1 32 }  { m_axi_gmem0_AWSIZE BURST 1 3 }  { m_axi_gmem0_AWBURST LOCK 1 2 }  { m_axi_gmem0_AWLOCK CACHE 1 2 }  { m_axi_gmem0_AWCACHE PROT 1 4 }  { m_axi_gmem0_AWPROT QOS 1 3 }  { m_axi_gmem0_AWQOS REGION 1 4 }  { m_axi_gmem0_AWREGION USER 1 4 }  { m_axi_gmem0_AWUSER DATA 1 1 }  { m_axi_gmem0_WVALID VALID 1 1 }  { m_axi_gmem0_WREADY READY 0 1 }  { m_axi_gmem0_WDATA FIFONUM 1 32 }  { m_axi_gmem0_WSTRB STRB 1 4 }  { m_axi_gmem0_WLAST LAST 1 1 }  { m_axi_gmem0_WID ID 1 1 }  { m_axi_gmem0_WUSER DATA 1 1 }  { m_axi_gmem0_ARVALID VALID 1 1 }  { m_axi_gmem0_ARREADY READY 0 1 }  { m_axi_gmem0_ARADDR ADDR 1 64 }  { m_axi_gmem0_ARID ID 1 1 }  { m_axi_gmem0_ARLEN SIZE 1 32 }  { m_axi_gmem0_ARSIZE BURST 1 3 }  { m_axi_gmem0_ARBURST LOCK 1 2 }  { m_axi_gmem0_ARLOCK CACHE 1 2 }  { m_axi_gmem0_ARCACHE PROT 1 4 }  { m_axi_gmem0_ARPROT QOS 1 3 }  { m_axi_gmem0_ARQOS REGION 1 4 }  { m_axi_gmem0_ARREGION USER 1 4 }  { m_axi_gmem0_ARUSER DATA 1 1 }  { m_axi_gmem0_RVALID VALID 0 1 }  { m_axi_gmem0_RREADY READY 1 1 }  { m_axi_gmem0_RDATA FIFONUM 0 32 }  { m_axi_gmem0_RLAST LAST 0 1 }  { m_axi_gmem0_RID ID 0 1 }  { m_axi_gmem0_RFIFONUM LEN 0 9 }  { m_axi_gmem0_RUSER DATA 0 1 }  { m_axi_gmem0_RRESP RESP 0 2 }  { m_axi_gmem0_BVALID VALID 0 1 }  { m_axi_gmem0_BREADY READY 1 1 }  { m_axi_gmem0_BRESP RESP 0 2 }  { m_axi_gmem0_BID ID 0 1 }  { m_axi_gmem0_BUSER DATA 0 1 } } }
	sext_ln69 { ap_none {  { sext_ln69 in_data 0 62 } } }
	mul { ap_none {  { mul in_data 0 32 } } }
	a_col { ap_none {  { a_col in_data 0 32 } } }
	a { ap_none {  { a in_data 0 64 } } }
	localA { ap_memory {  { localA_address0 mem_address 1 4 }  { localA_ce0 mem_ce 1 1 }  { localA_we0 mem_we 1 1 }  { localA_d0 mem_din 1 32 } } }
	localA_1 { ap_memory {  { localA_1_address0 mem_address 1 4 }  { localA_1_ce0 mem_ce 1 1 }  { localA_1_we0 mem_we 1 1 }  { localA_1_d0 mem_din 1 32 } } }
	localA_2 { ap_memory {  { localA_2_address0 mem_address 1 4 }  { localA_2_ce0 mem_ce 1 1 }  { localA_2_we0 mem_we 1 1 }  { localA_2_d0 mem_din 1 32 } } }
	localA_3 { ap_memory {  { localA_3_address0 mem_address 1 4 }  { localA_3_ce0 mem_ce 1 1 }  { localA_3_we0 mem_we 1 1 }  { localA_3_d0 mem_din 1 32 } } }
	localA_4 { ap_memory {  { localA_4_address0 mem_address 1 4 }  { localA_4_ce0 mem_ce 1 1 }  { localA_4_we0 mem_we 1 1 }  { localA_4_d0 mem_din 1 32 } } }
	localA_5 { ap_memory {  { localA_5_address0 mem_address 1 4 }  { localA_5_ce0 mem_ce 1 1 }  { localA_5_we0 mem_we 1 1 }  { localA_5_d0 mem_din 1 32 } } }
	localA_6 { ap_memory {  { localA_6_address0 mem_address 1 4 }  { localA_6_ce0 mem_ce 1 1 }  { localA_6_we0 mem_we 1 1 }  { localA_6_d0 mem_din 1 32 } } }
	localA_7 { ap_memory {  { localA_7_address0 mem_address 1 4 }  { localA_7_ce0 mem_ce 1 1 }  { localA_7_we0 mem_we 1 1 }  { localA_7_d0 mem_din 1 32 } } }
	localA_8 { ap_memory {  { localA_8_address0 mem_address 1 4 }  { localA_8_ce0 mem_ce 1 1 }  { localA_8_we0 mem_we 1 1 }  { localA_8_d0 mem_din 1 32 } } }
	localA_9 { ap_memory {  { localA_9_address0 mem_address 1 4 }  { localA_9_ce0 mem_ce 1 1 }  { localA_9_we0 mem_we 1 1 }  { localA_9_d0 mem_din 1 32 } } }
	localA_10 { ap_memory {  { localA_10_address0 mem_address 1 4 }  { localA_10_ce0 mem_ce 1 1 }  { localA_10_we0 mem_we 1 1 }  { localA_10_d0 mem_din 1 32 } } }
	localA_11 { ap_memory {  { localA_11_address0 mem_address 1 4 }  { localA_11_ce0 mem_ce 1 1 }  { localA_11_we0 mem_we 1 1 }  { localA_11_d0 mem_din 1 32 } } }
	localA_12 { ap_memory {  { localA_12_address0 mem_address 1 4 }  { localA_12_ce0 mem_ce 1 1 }  { localA_12_we0 mem_we 1 1 }  { localA_12_d0 mem_din 1 32 } } }
	localA_13 { ap_memory {  { localA_13_address0 mem_address 1 4 }  { localA_13_ce0 mem_ce 1 1 }  { localA_13_we0 mem_we 1 1 }  { localA_13_d0 mem_din 1 32 } } }
	localA_14 { ap_memory {  { localA_14_address0 mem_address 1 4 }  { localA_14_ce0 mem_ce 1 1 }  { localA_14_we0 mem_we 1 1 }  { localA_14_d0 mem_din 1 32 } } }
	localA_15 { ap_memory {  { localA_15_address0 mem_address 1 4 }  { localA_15_ce0 mem_ce 1 1 }  { localA_15_we0 mem_we 1 1 }  { localA_15_d0 mem_din 1 32 } } }
}
