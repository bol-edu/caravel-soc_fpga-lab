set moduleName read_romcode
set isTopModule 1
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
set C_modelName {read_romcode}
set C_modelType { void 0 }
set C_modelArgList {
	{ BUS0 int 32 regular {axi_master 0}  }
	{ BUS1 int 32 regular {axi_master 1}  }
	{ romcode int 64 regular {axi_slave 0}  }
	{ internal_bram int 32 regular {bram 1024 { 2 3 } 1 1 }  }
	{ romcode_to_PS int 64 regular {axi_slave 0}  }
	{ cmd int 32 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "BUS0", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "romcode","offset": { "type": "dynamic","port_name": "romcode","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "BUS1", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "romcode_to_PS","offset": { "type": "dynamic","port_name": "romcode_to_PS","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "romcode", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "internal_bram", "interface" : "bram", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "romcode_to_PS", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "cmd", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":47}} ]}
# RTL Port declarations: 
set portNum 117
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_BUS0_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_BUS0_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_BUS0_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUS0_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUS0_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUS0_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUS0_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_BUS0_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_BUS0_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_BUS0_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUS0_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUS0_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUS0_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUS0_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_BUS0_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUS0_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUS0_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_BUS0_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_BUS0_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUS0_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUS1_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_BUS1_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_BUS1_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUS1_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUS1_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUS1_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUS1_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_BUS1_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_BUS1_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_BUS1_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUS1_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUS1_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUS1_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUS1_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_BUS1_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_BUS1_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_BUS1_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_BUS1_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_BUS1_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_BUS1_BUSER sc_in sc_lv 1 signal 1 } 
	{ internal_bram_Addr_A sc_out sc_lv 32 signal 3 } 
	{ internal_bram_EN_A sc_out sc_logic 1 signal 3 } 
	{ internal_bram_WEN_A sc_out sc_lv 4 signal 3 } 
	{ internal_bram_Din_A sc_out sc_lv 32 signal 3 } 
	{ internal_bram_Dout_A sc_in sc_lv 32 signal 3 } 
	{ internal_bram_Clk_A sc_out sc_logic 1 signal 3 } 
	{ internal_bram_Rst_A sc_out sc_logic 1 signal 3 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"read_romcode","role":"start","value":"0","valid_bit":"0"},{"name":"read_romcode","role":"continue","value":"0","valid_bit":"4"},{"name":"read_romcode","role":"auto_start","value":"0","valid_bit":"7"},{"name":"romcode","role":"data","value":"16"},{"name":"romcode_to_PS","role":"data","value":"28"},{"name":"cmd","role":"data","value":"40"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"read_romcode","role":"start","value":"0","valid_bit":"0"},{"name":"read_romcode","role":"done","value":"0","valid_bit":"1"},{"name":"read_romcode","role":"idle","value":"0","valid_bit":"2"},{"name":"read_romcode","role":"ready","value":"0","valid_bit":"3"},{"name":"read_romcode","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_BUS0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "AWVALID" }} , 
 	{ "name": "m_axi_BUS0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "AWREADY" }} , 
 	{ "name": "m_axi_BUS0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUS0", "role": "AWADDR" }} , 
 	{ "name": "m_axi_BUS0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "AWID" }} , 
 	{ "name": "m_axi_BUS0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUS0", "role": "AWLEN" }} , 
 	{ "name": "m_axi_BUS0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS0", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_BUS0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "AWBURST" }} , 
 	{ "name": "m_axi_BUS0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_BUS0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_BUS0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS0", "role": "AWPROT" }} , 
 	{ "name": "m_axi_BUS0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "AWQOS" }} , 
 	{ "name": "m_axi_BUS0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "AWREGION" }} , 
 	{ "name": "m_axi_BUS0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "AWUSER" }} , 
 	{ "name": "m_axi_BUS0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WVALID" }} , 
 	{ "name": "m_axi_BUS0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WREADY" }} , 
 	{ "name": "m_axi_BUS0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUS0", "role": "WDATA" }} , 
 	{ "name": "m_axi_BUS0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "WSTRB" }} , 
 	{ "name": "m_axi_BUS0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WLAST" }} , 
 	{ "name": "m_axi_BUS0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WID" }} , 
 	{ "name": "m_axi_BUS0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WUSER" }} , 
 	{ "name": "m_axi_BUS0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "ARVALID" }} , 
 	{ "name": "m_axi_BUS0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "ARREADY" }} , 
 	{ "name": "m_axi_BUS0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUS0", "role": "ARADDR" }} , 
 	{ "name": "m_axi_BUS0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "ARID" }} , 
 	{ "name": "m_axi_BUS0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUS0", "role": "ARLEN" }} , 
 	{ "name": "m_axi_BUS0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS0", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_BUS0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "ARBURST" }} , 
 	{ "name": "m_axi_BUS0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_BUS0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_BUS0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS0", "role": "ARPROT" }} , 
 	{ "name": "m_axi_BUS0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "ARQOS" }} , 
 	{ "name": "m_axi_BUS0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "ARREGION" }} , 
 	{ "name": "m_axi_BUS0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "ARUSER" }} , 
 	{ "name": "m_axi_BUS0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RVALID" }} , 
 	{ "name": "m_axi_BUS0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RREADY" }} , 
 	{ "name": "m_axi_BUS0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUS0", "role": "RDATA" }} , 
 	{ "name": "m_axi_BUS0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RLAST" }} , 
 	{ "name": "m_axi_BUS0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RID" }} , 
 	{ "name": "m_axi_BUS0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RUSER" }} , 
 	{ "name": "m_axi_BUS0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "RRESP" }} , 
 	{ "name": "m_axi_BUS0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "BVALID" }} , 
 	{ "name": "m_axi_BUS0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "BREADY" }} , 
 	{ "name": "m_axi_BUS0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "BRESP" }} , 
 	{ "name": "m_axi_BUS0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "BID" }} , 
 	{ "name": "m_axi_BUS0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "BUSER" }} , 
 	{ "name": "m_axi_BUS1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_BUS1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_BUS1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUS1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_BUS1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "AWID" }} , 
 	{ "name": "m_axi_BUS1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUS1", "role": "AWLEN" }} , 
 	{ "name": "m_axi_BUS1_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS1", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_BUS1_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "AWBURST" }} , 
 	{ "name": "m_axi_BUS1_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_BUS1_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_BUS1_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS1", "role": "AWPROT" }} , 
 	{ "name": "m_axi_BUS1_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "AWQOS" }} , 
 	{ "name": "m_axi_BUS1_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "AWREGION" }} , 
 	{ "name": "m_axi_BUS1_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "AWUSER" }} , 
 	{ "name": "m_axi_BUS1_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WVALID" }} , 
 	{ "name": "m_axi_BUS1_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WREADY" }} , 
 	{ "name": "m_axi_BUS1_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUS1", "role": "WDATA" }} , 
 	{ "name": "m_axi_BUS1_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "WSTRB" }} , 
 	{ "name": "m_axi_BUS1_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WLAST" }} , 
 	{ "name": "m_axi_BUS1_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WID" }} , 
 	{ "name": "m_axi_BUS1_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WUSER" }} , 
 	{ "name": "m_axi_BUS1_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "ARVALID" }} , 
 	{ "name": "m_axi_BUS1_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "ARREADY" }} , 
 	{ "name": "m_axi_BUS1_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUS1", "role": "ARADDR" }} , 
 	{ "name": "m_axi_BUS1_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "ARID" }} , 
 	{ "name": "m_axi_BUS1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUS1", "role": "ARLEN" }} , 
 	{ "name": "m_axi_BUS1_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS1", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_BUS1_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "ARBURST" }} , 
 	{ "name": "m_axi_BUS1_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_BUS1_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_BUS1_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS1", "role": "ARPROT" }} , 
 	{ "name": "m_axi_BUS1_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "ARQOS" }} , 
 	{ "name": "m_axi_BUS1_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "ARREGION" }} , 
 	{ "name": "m_axi_BUS1_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "ARUSER" }} , 
 	{ "name": "m_axi_BUS1_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RVALID" }} , 
 	{ "name": "m_axi_BUS1_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RREADY" }} , 
 	{ "name": "m_axi_BUS1_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUS1", "role": "RDATA" }} , 
 	{ "name": "m_axi_BUS1_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RLAST" }} , 
 	{ "name": "m_axi_BUS1_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RID" }} , 
 	{ "name": "m_axi_BUS1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RUSER" }} , 
 	{ "name": "m_axi_BUS1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "RRESP" }} , 
 	{ "name": "m_axi_BUS1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "BVALID" }} , 
 	{ "name": "m_axi_BUS1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "BREADY" }} , 
 	{ "name": "m_axi_BUS1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "BRESP" }} , 
 	{ "name": "m_axi_BUS1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "BID" }} , 
 	{ "name": "m_axi_BUS1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "BUSER" }} , 
 	{ "name": "internal_bram_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "internal_bram", "role": "Addr_A" }} , 
 	{ "name": "internal_bram_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "internal_bram", "role": "EN_A" }} , 
 	{ "name": "internal_bram_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "internal_bram", "role": "WEN_A" }} , 
 	{ "name": "internal_bram_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "internal_bram", "role": "Din_A" }} , 
 	{ "name": "internal_bram_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "internal_bram", "role": "Dout_A" }} , 
 	{ "name": "internal_bram_Clk_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "internal_bram", "role": "Clk_A" }} , 
 	{ "name": "internal_bram_Rst_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "internal_bram", "role": "Rst_A" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "5", "6", "7"],
		"CDFG" : "read_romcode",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "1036",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BUS0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "BUS0_blk_n_AR", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_read_romcode_Pipeline_VITIS_LOOP_41_1_fu_120", "Port" : "BUS0", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "BUS1", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "BUS1_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "BUS1_blk_n_B", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_read_romcode_Pipeline_VITIS_LOOP_47_2_fu_111", "Port" : "BUS1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "romcode", "Type" : "None", "Direction" : "I"},
			{"Name" : "internal_bram", "Type" : "Bram", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_read_romcode_Pipeline_VITIS_LOOP_41_1_fu_120", "Port" : "internal_bram", "Inst_start_state" : "17", "Inst_end_state" : "18"},
					{"ID" : "1", "SubInstance" : "grp_read_romcode_Pipeline_VITIS_LOOP_47_2_fu_111", "Port" : "internal_bram", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "romcode_to_PS", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmd", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_read_romcode_Pipeline_VITIS_LOOP_47_2_fu_111", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "read_romcode_Pipeline_VITIS_LOOP_47_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1027", "EstimateLatencyMax" : "1027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BUS1", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "BUS1_blk_n_W", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln47", "Type" : "None", "Direction" : "I"},
			{"Name" : "internal_bram", "Type" : "Bram", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_47_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_read_romcode_Pipeline_VITIS_LOOP_47_2_fu_111.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_read_romcode_Pipeline_VITIS_LOOP_41_1_fu_120", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "read_romcode_Pipeline_VITIS_LOOP_41_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1027", "EstimateLatencyMax" : "1027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BUS0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "BUS0_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln41", "Type" : "None", "Direction" : "I"},
			{"Name" : "internal_bram", "Type" : "Bram", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_41_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_read_romcode_Pipeline_VITIS_LOOP_41_1_fu_120.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BUS0_m_axi_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BUS1_m_axi_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	read_romcode {
		BUS0 {Type I LastRead 1 FirstWrite -1}
		BUS1 {Type O LastRead 4 FirstWrite 2}
		romcode {Type I LastRead 0 FirstWrite -1}
		internal_bram {Type IO LastRead 0 FirstWrite -1}
		romcode_to_PS {Type I LastRead 0 FirstWrite -1}
		cmd {Type I LastRead 0 FirstWrite -1}}
	read_romcode_Pipeline_VITIS_LOOP_47_2 {
		BUS1 {Type O LastRead -1 FirstWrite 2}
		sext_ln47 {Type I LastRead 0 FirstWrite -1}
		internal_bram {Type I LastRead 0 FirstWrite -1}}
	read_romcode_Pipeline_VITIS_LOOP_41_1 {
		BUS0 {Type I LastRead 1 FirstWrite -1}
		sext_ln41 {Type I LastRead 0 FirstWrite -1}
		internal_bram {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "1036"}
	, {"Name" : "Interval", "Min" : "3", "Max" : "1037"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	BUS0 { m_axi {  { m_axi_BUS0_AWVALID VALID 1 1 }  { m_axi_BUS0_AWREADY READY 0 1 }  { m_axi_BUS0_AWADDR ADDR 1 64 }  { m_axi_BUS0_AWID ID 1 1 }  { m_axi_BUS0_AWLEN SIZE 1 8 }  { m_axi_BUS0_AWSIZE BURST 1 3 }  { m_axi_BUS0_AWBURST LOCK 1 2 }  { m_axi_BUS0_AWLOCK CACHE 1 2 }  { m_axi_BUS0_AWCACHE PROT 1 4 }  { m_axi_BUS0_AWPROT QOS 1 3 }  { m_axi_BUS0_AWQOS REGION 1 4 }  { m_axi_BUS0_AWREGION USER 1 4 }  { m_axi_BUS0_AWUSER DATA 1 1 }  { m_axi_BUS0_WVALID VALID 1 1 }  { m_axi_BUS0_WREADY READY 0 1 }  { m_axi_BUS0_WDATA FIFONUM 1 32 }  { m_axi_BUS0_WSTRB STRB 1 4 }  { m_axi_BUS0_WLAST LAST 1 1 }  { m_axi_BUS0_WID ID 1 1 }  { m_axi_BUS0_WUSER DATA 1 1 }  { m_axi_BUS0_ARVALID VALID 1 1 }  { m_axi_BUS0_ARREADY READY 0 1 }  { m_axi_BUS0_ARADDR ADDR 1 64 }  { m_axi_BUS0_ARID ID 1 1 }  { m_axi_BUS0_ARLEN SIZE 1 8 }  { m_axi_BUS0_ARSIZE BURST 1 3 }  { m_axi_BUS0_ARBURST LOCK 1 2 }  { m_axi_BUS0_ARLOCK CACHE 1 2 }  { m_axi_BUS0_ARCACHE PROT 1 4 }  { m_axi_BUS0_ARPROT QOS 1 3 }  { m_axi_BUS0_ARQOS REGION 1 4 }  { m_axi_BUS0_ARREGION USER 1 4 }  { m_axi_BUS0_ARUSER DATA 1 1 }  { m_axi_BUS0_RVALID VALID 0 1 }  { m_axi_BUS0_RREADY READY 1 1 }  { m_axi_BUS0_RDATA FIFONUM 0 32 }  { m_axi_BUS0_RLAST LAST 0 1 }  { m_axi_BUS0_RID ID 0 1 }  { m_axi_BUS0_RUSER DATA 0 1 }  { m_axi_BUS0_RRESP RESP 0 2 }  { m_axi_BUS0_BVALID VALID 0 1 }  { m_axi_BUS0_BREADY READY 1 1 }  { m_axi_BUS0_BRESP RESP 0 2 }  { m_axi_BUS0_BID ID 0 1 }  { m_axi_BUS0_BUSER DATA 0 1 } } }
	BUS1 { m_axi {  { m_axi_BUS1_AWVALID VALID 1 1 }  { m_axi_BUS1_AWREADY READY 0 1 }  { m_axi_BUS1_AWADDR ADDR 1 64 }  { m_axi_BUS1_AWID ID 1 1 }  { m_axi_BUS1_AWLEN SIZE 1 8 }  { m_axi_BUS1_AWSIZE BURST 1 3 }  { m_axi_BUS1_AWBURST LOCK 1 2 }  { m_axi_BUS1_AWLOCK CACHE 1 2 }  { m_axi_BUS1_AWCACHE PROT 1 4 }  { m_axi_BUS1_AWPROT QOS 1 3 }  { m_axi_BUS1_AWQOS REGION 1 4 }  { m_axi_BUS1_AWREGION USER 1 4 }  { m_axi_BUS1_AWUSER DATA 1 1 }  { m_axi_BUS1_WVALID VALID 1 1 }  { m_axi_BUS1_WREADY READY 0 1 }  { m_axi_BUS1_WDATA FIFONUM 1 32 }  { m_axi_BUS1_WSTRB STRB 1 4 }  { m_axi_BUS1_WLAST LAST 1 1 }  { m_axi_BUS1_WID ID 1 1 }  { m_axi_BUS1_WUSER DATA 1 1 }  { m_axi_BUS1_ARVALID VALID 1 1 }  { m_axi_BUS1_ARREADY READY 0 1 }  { m_axi_BUS1_ARADDR ADDR 1 64 }  { m_axi_BUS1_ARID ID 1 1 }  { m_axi_BUS1_ARLEN SIZE 1 8 }  { m_axi_BUS1_ARSIZE BURST 1 3 }  { m_axi_BUS1_ARBURST LOCK 1 2 }  { m_axi_BUS1_ARLOCK CACHE 1 2 }  { m_axi_BUS1_ARCACHE PROT 1 4 }  { m_axi_BUS1_ARPROT QOS 1 3 }  { m_axi_BUS1_ARQOS REGION 1 4 }  { m_axi_BUS1_ARREGION USER 1 4 }  { m_axi_BUS1_ARUSER DATA 1 1 }  { m_axi_BUS1_RVALID VALID 0 1 }  { m_axi_BUS1_RREADY READY 1 1 }  { m_axi_BUS1_RDATA FIFONUM 0 32 }  { m_axi_BUS1_RLAST LAST 0 1 }  { m_axi_BUS1_RID ID 0 1 }  { m_axi_BUS1_RUSER DATA 0 1 }  { m_axi_BUS1_RRESP RESP 0 2 }  { m_axi_BUS1_BVALID VALID 0 1 }  { m_axi_BUS1_BREADY READY 1 1 }  { m_axi_BUS1_BRESP RESP 0 2 }  { m_axi_BUS1_BID ID 0 1 }  { m_axi_BUS1_BUSER DATA 0 1 } } }
	internal_bram { bram {  { internal_bram_Addr_A MemPortADDR2 1 32 }  { internal_bram_EN_A MemPortCE2 1 1 }  { internal_bram_WEN_A MemPortWE2 1 4 }  { internal_bram_Din_A MemPortDIN2 1 32 }  { internal_bram_Dout_A MemPortDOUT2 0 32 }  { internal_bram_Clk_A mem_clk 1 1 }  { internal_bram_Rst_A mem_rst 1 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict BUS0 {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 64 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict BUS1 {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 64 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE WRITE_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ BUS0 1 }
	{ BUS1 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ BUS0 1 }
	{ BUS1 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
set moduleName read_romcode
set isTopModule 1
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
set C_modelName {read_romcode}
set C_modelType { void 0 }
set C_modelArgList {
	{ BUS0 int 32 regular {axi_master 0}  }
	{ BUS1 int 32 regular {axi_master 1}  }
	{ romcode int 64 regular {axi_slave 0}  }
	{ internal_bram int 32 regular {bram 1024 { 2 3 } 1 1 }  }
	{ romcode_to_PS int 64 regular {axi_slave 0}  }
	{ cmd int 32 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "BUS0", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "romcode","offset": { "type": "dynamic","port_name": "romcode","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "BUS1", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "romcode_to_PS","offset": { "type": "dynamic","port_name": "romcode_to_PS","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "romcode", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "internal_bram", "interface" : "bram", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "romcode_to_PS", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "cmd", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":47}} ]}
# RTL Port declarations: 
set portNum 117
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_BUS0_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_BUS0_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_BUS0_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUS0_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUS0_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUS0_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUS0_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_BUS0_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_BUS0_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_BUS0_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUS0_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUS0_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUS0_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUS0_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_BUS0_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUS0_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUS0_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_BUS0_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_BUS0_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUS0_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUS1_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_BUS1_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_BUS1_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUS1_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUS1_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUS1_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUS1_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_BUS1_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_BUS1_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_BUS1_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUS1_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUS1_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUS1_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUS1_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_BUS1_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_BUS1_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_BUS1_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_BUS1_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_BUS1_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_BUS1_BUSER sc_in sc_lv 1 signal 1 } 
	{ internal_bram_Addr_A sc_out sc_lv 32 signal 3 } 
	{ internal_bram_EN_A sc_out sc_logic 1 signal 3 } 
	{ internal_bram_WEN_A sc_out sc_lv 4 signal 3 } 
	{ internal_bram_Din_A sc_out sc_lv 32 signal 3 } 
	{ internal_bram_Dout_A sc_in sc_lv 32 signal 3 } 
	{ internal_bram_Clk_A sc_out sc_logic 1 signal 3 } 
	{ internal_bram_Rst_A sc_out sc_logic 1 signal 3 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"read_romcode","role":"start","value":"0","valid_bit":"0"},{"name":"read_romcode","role":"continue","value":"0","valid_bit":"4"},{"name":"read_romcode","role":"auto_start","value":"0","valid_bit":"7"},{"name":"romcode","role":"data","value":"16"},{"name":"romcode_to_PS","role":"data","value":"28"},{"name":"cmd","role":"data","value":"40"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"read_romcode","role":"start","value":"0","valid_bit":"0"},{"name":"read_romcode","role":"done","value":"0","valid_bit":"1"},{"name":"read_romcode","role":"idle","value":"0","valid_bit":"2"},{"name":"read_romcode","role":"ready","value":"0","valid_bit":"3"},{"name":"read_romcode","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_BUS0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "AWVALID" }} , 
 	{ "name": "m_axi_BUS0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "AWREADY" }} , 
 	{ "name": "m_axi_BUS0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUS0", "role": "AWADDR" }} , 
 	{ "name": "m_axi_BUS0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "AWID" }} , 
 	{ "name": "m_axi_BUS0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUS0", "role": "AWLEN" }} , 
 	{ "name": "m_axi_BUS0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS0", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_BUS0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "AWBURST" }} , 
 	{ "name": "m_axi_BUS0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_BUS0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_BUS0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS0", "role": "AWPROT" }} , 
 	{ "name": "m_axi_BUS0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "AWQOS" }} , 
 	{ "name": "m_axi_BUS0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "AWREGION" }} , 
 	{ "name": "m_axi_BUS0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "AWUSER" }} , 
 	{ "name": "m_axi_BUS0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WVALID" }} , 
 	{ "name": "m_axi_BUS0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WREADY" }} , 
 	{ "name": "m_axi_BUS0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUS0", "role": "WDATA" }} , 
 	{ "name": "m_axi_BUS0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "WSTRB" }} , 
 	{ "name": "m_axi_BUS0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WLAST" }} , 
 	{ "name": "m_axi_BUS0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WID" }} , 
 	{ "name": "m_axi_BUS0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WUSER" }} , 
 	{ "name": "m_axi_BUS0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "ARVALID" }} , 
 	{ "name": "m_axi_BUS0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "ARREADY" }} , 
 	{ "name": "m_axi_BUS0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUS0", "role": "ARADDR" }} , 
 	{ "name": "m_axi_BUS0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "ARID" }} , 
 	{ "name": "m_axi_BUS0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUS0", "role": "ARLEN" }} , 
 	{ "name": "m_axi_BUS0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS0", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_BUS0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "ARBURST" }} , 
 	{ "name": "m_axi_BUS0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_BUS0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_BUS0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS0", "role": "ARPROT" }} , 
 	{ "name": "m_axi_BUS0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "ARQOS" }} , 
 	{ "name": "m_axi_BUS0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "ARREGION" }} , 
 	{ "name": "m_axi_BUS0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "ARUSER" }} , 
 	{ "name": "m_axi_BUS0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RVALID" }} , 
 	{ "name": "m_axi_BUS0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RREADY" }} , 
 	{ "name": "m_axi_BUS0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUS0", "role": "RDATA" }} , 
 	{ "name": "m_axi_BUS0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RLAST" }} , 
 	{ "name": "m_axi_BUS0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RID" }} , 
 	{ "name": "m_axi_BUS0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RUSER" }} , 
 	{ "name": "m_axi_BUS0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "RRESP" }} , 
 	{ "name": "m_axi_BUS0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "BVALID" }} , 
 	{ "name": "m_axi_BUS0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "BREADY" }} , 
 	{ "name": "m_axi_BUS0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "BRESP" }} , 
 	{ "name": "m_axi_BUS0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "BID" }} , 
 	{ "name": "m_axi_BUS0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "BUSER" }} , 
 	{ "name": "m_axi_BUS1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_BUS1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_BUS1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUS1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_BUS1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "AWID" }} , 
 	{ "name": "m_axi_BUS1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUS1", "role": "AWLEN" }} , 
 	{ "name": "m_axi_BUS1_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS1", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_BUS1_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "AWBURST" }} , 
 	{ "name": "m_axi_BUS1_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_BUS1_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_BUS1_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS1", "role": "AWPROT" }} , 
 	{ "name": "m_axi_BUS1_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "AWQOS" }} , 
 	{ "name": "m_axi_BUS1_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "AWREGION" }} , 
 	{ "name": "m_axi_BUS1_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "AWUSER" }} , 
 	{ "name": "m_axi_BUS1_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WVALID" }} , 
 	{ "name": "m_axi_BUS1_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WREADY" }} , 
 	{ "name": "m_axi_BUS1_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUS1", "role": "WDATA" }} , 
 	{ "name": "m_axi_BUS1_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "WSTRB" }} , 
 	{ "name": "m_axi_BUS1_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WLAST" }} , 
 	{ "name": "m_axi_BUS1_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WID" }} , 
 	{ "name": "m_axi_BUS1_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WUSER" }} , 
 	{ "name": "m_axi_BUS1_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "ARVALID" }} , 
 	{ "name": "m_axi_BUS1_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "ARREADY" }} , 
 	{ "name": "m_axi_BUS1_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUS1", "role": "ARADDR" }} , 
 	{ "name": "m_axi_BUS1_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "ARID" }} , 
 	{ "name": "m_axi_BUS1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUS1", "role": "ARLEN" }} , 
 	{ "name": "m_axi_BUS1_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS1", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_BUS1_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "ARBURST" }} , 
 	{ "name": "m_axi_BUS1_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_BUS1_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_BUS1_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS1", "role": "ARPROT" }} , 
 	{ "name": "m_axi_BUS1_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "ARQOS" }} , 
 	{ "name": "m_axi_BUS1_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "ARREGION" }} , 
 	{ "name": "m_axi_BUS1_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "ARUSER" }} , 
 	{ "name": "m_axi_BUS1_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RVALID" }} , 
 	{ "name": "m_axi_BUS1_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RREADY" }} , 
 	{ "name": "m_axi_BUS1_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUS1", "role": "RDATA" }} , 
 	{ "name": "m_axi_BUS1_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RLAST" }} , 
 	{ "name": "m_axi_BUS1_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RID" }} , 
 	{ "name": "m_axi_BUS1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RUSER" }} , 
 	{ "name": "m_axi_BUS1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "RRESP" }} , 
 	{ "name": "m_axi_BUS1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "BVALID" }} , 
 	{ "name": "m_axi_BUS1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "BREADY" }} , 
 	{ "name": "m_axi_BUS1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "BRESP" }} , 
 	{ "name": "m_axi_BUS1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "BID" }} , 
 	{ "name": "m_axi_BUS1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "BUSER" }} , 
 	{ "name": "internal_bram_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "internal_bram", "role": "Addr_A" }} , 
 	{ "name": "internal_bram_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "internal_bram", "role": "EN_A" }} , 
 	{ "name": "internal_bram_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "internal_bram", "role": "WEN_A" }} , 
 	{ "name": "internal_bram_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "internal_bram", "role": "Din_A" }} , 
 	{ "name": "internal_bram_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "internal_bram", "role": "Dout_A" }} , 
 	{ "name": "internal_bram_Clk_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "internal_bram", "role": "Clk_A" }} , 
 	{ "name": "internal_bram_Rst_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "internal_bram", "role": "Rst_A" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "5", "6", "7"],
		"CDFG" : "read_romcode",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "1036",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BUS0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "BUS0_blk_n_AR", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_read_romcode_Pipeline_VITIS_LOOP_41_1_fu_120", "Port" : "BUS0", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "BUS1", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "BUS1_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "BUS1_blk_n_B", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_read_romcode_Pipeline_VITIS_LOOP_47_2_fu_111", "Port" : "BUS1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "romcode", "Type" : "None", "Direction" : "I"},
			{"Name" : "internal_bram", "Type" : "Bram", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_read_romcode_Pipeline_VITIS_LOOP_41_1_fu_120", "Port" : "internal_bram", "Inst_start_state" : "17", "Inst_end_state" : "18"},
					{"ID" : "1", "SubInstance" : "grp_read_romcode_Pipeline_VITIS_LOOP_47_2_fu_111", "Port" : "internal_bram", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "romcode_to_PS", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmd", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_read_romcode_Pipeline_VITIS_LOOP_47_2_fu_111", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "read_romcode_Pipeline_VITIS_LOOP_47_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1027", "EstimateLatencyMax" : "1027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BUS1", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "BUS1_blk_n_W", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln47", "Type" : "None", "Direction" : "I"},
			{"Name" : "internal_bram", "Type" : "Bram", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_47_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_read_romcode_Pipeline_VITIS_LOOP_47_2_fu_111.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_read_romcode_Pipeline_VITIS_LOOP_41_1_fu_120", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "read_romcode_Pipeline_VITIS_LOOP_41_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1027", "EstimateLatencyMax" : "1027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BUS0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "BUS0_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln41", "Type" : "None", "Direction" : "I"},
			{"Name" : "internal_bram", "Type" : "Bram", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_41_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_read_romcode_Pipeline_VITIS_LOOP_41_1_fu_120.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BUS0_m_axi_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BUS1_m_axi_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	read_romcode {
		BUS0 {Type I LastRead 1 FirstWrite -1}
		BUS1 {Type O LastRead 4 FirstWrite 2}
		romcode {Type I LastRead 0 FirstWrite -1}
		internal_bram {Type IO LastRead 0 FirstWrite -1}
		romcode_to_PS {Type I LastRead 0 FirstWrite -1}
		cmd {Type I LastRead 0 FirstWrite -1}}
	read_romcode_Pipeline_VITIS_LOOP_47_2 {
		BUS1 {Type O LastRead -1 FirstWrite 2}
		sext_ln47 {Type I LastRead 0 FirstWrite -1}
		internal_bram {Type I LastRead 0 FirstWrite -1}}
	read_romcode_Pipeline_VITIS_LOOP_41_1 {
		BUS0 {Type I LastRead 1 FirstWrite -1}
		sext_ln41 {Type I LastRead 0 FirstWrite -1}
		internal_bram {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "1036"}
	, {"Name" : "Interval", "Min" : "3", "Max" : "1037"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	BUS0 { m_axi {  { m_axi_BUS0_AWVALID VALID 1 1 }  { m_axi_BUS0_AWREADY READY 0 1 }  { m_axi_BUS0_AWADDR ADDR 1 64 }  { m_axi_BUS0_AWID ID 1 1 }  { m_axi_BUS0_AWLEN SIZE 1 8 }  { m_axi_BUS0_AWSIZE BURST 1 3 }  { m_axi_BUS0_AWBURST LOCK 1 2 }  { m_axi_BUS0_AWLOCK CACHE 1 2 }  { m_axi_BUS0_AWCACHE PROT 1 4 }  { m_axi_BUS0_AWPROT QOS 1 3 }  { m_axi_BUS0_AWQOS REGION 1 4 }  { m_axi_BUS0_AWREGION USER 1 4 }  { m_axi_BUS0_AWUSER DATA 1 1 }  { m_axi_BUS0_WVALID VALID 1 1 }  { m_axi_BUS0_WREADY READY 0 1 }  { m_axi_BUS0_WDATA FIFONUM 1 32 }  { m_axi_BUS0_WSTRB STRB 1 4 }  { m_axi_BUS0_WLAST LAST 1 1 }  { m_axi_BUS0_WID ID 1 1 }  { m_axi_BUS0_WUSER DATA 1 1 }  { m_axi_BUS0_ARVALID VALID 1 1 }  { m_axi_BUS0_ARREADY READY 0 1 }  { m_axi_BUS0_ARADDR ADDR 1 64 }  { m_axi_BUS0_ARID ID 1 1 }  { m_axi_BUS0_ARLEN SIZE 1 8 }  { m_axi_BUS0_ARSIZE BURST 1 3 }  { m_axi_BUS0_ARBURST LOCK 1 2 }  { m_axi_BUS0_ARLOCK CACHE 1 2 }  { m_axi_BUS0_ARCACHE PROT 1 4 }  { m_axi_BUS0_ARPROT QOS 1 3 }  { m_axi_BUS0_ARQOS REGION 1 4 }  { m_axi_BUS0_ARREGION USER 1 4 }  { m_axi_BUS0_ARUSER DATA 1 1 }  { m_axi_BUS0_RVALID VALID 0 1 }  { m_axi_BUS0_RREADY READY 1 1 }  { m_axi_BUS0_RDATA FIFONUM 0 32 }  { m_axi_BUS0_RLAST LAST 0 1 }  { m_axi_BUS0_RID ID 0 1 }  { m_axi_BUS0_RUSER DATA 0 1 }  { m_axi_BUS0_RRESP RESP 0 2 }  { m_axi_BUS0_BVALID VALID 0 1 }  { m_axi_BUS0_BREADY READY 1 1 }  { m_axi_BUS0_BRESP RESP 0 2 }  { m_axi_BUS0_BID ID 0 1 }  { m_axi_BUS0_BUSER DATA 0 1 } } }
	BUS1 { m_axi {  { m_axi_BUS1_AWVALID VALID 1 1 }  { m_axi_BUS1_AWREADY READY 0 1 }  { m_axi_BUS1_AWADDR ADDR 1 64 }  { m_axi_BUS1_AWID ID 1 1 }  { m_axi_BUS1_AWLEN SIZE 1 8 }  { m_axi_BUS1_AWSIZE BURST 1 3 }  { m_axi_BUS1_AWBURST LOCK 1 2 }  { m_axi_BUS1_AWLOCK CACHE 1 2 }  { m_axi_BUS1_AWCACHE PROT 1 4 }  { m_axi_BUS1_AWPROT QOS 1 3 }  { m_axi_BUS1_AWQOS REGION 1 4 }  { m_axi_BUS1_AWREGION USER 1 4 }  { m_axi_BUS1_AWUSER DATA 1 1 }  { m_axi_BUS1_WVALID VALID 1 1 }  { m_axi_BUS1_WREADY READY 0 1 }  { m_axi_BUS1_WDATA FIFONUM 1 32 }  { m_axi_BUS1_WSTRB STRB 1 4 }  { m_axi_BUS1_WLAST LAST 1 1 }  { m_axi_BUS1_WID ID 1 1 }  { m_axi_BUS1_WUSER DATA 1 1 }  { m_axi_BUS1_ARVALID VALID 1 1 }  { m_axi_BUS1_ARREADY READY 0 1 }  { m_axi_BUS1_ARADDR ADDR 1 64 }  { m_axi_BUS1_ARID ID 1 1 }  { m_axi_BUS1_ARLEN SIZE 1 8 }  { m_axi_BUS1_ARSIZE BURST 1 3 }  { m_axi_BUS1_ARBURST LOCK 1 2 }  { m_axi_BUS1_ARLOCK CACHE 1 2 }  { m_axi_BUS1_ARCACHE PROT 1 4 }  { m_axi_BUS1_ARPROT QOS 1 3 }  { m_axi_BUS1_ARQOS REGION 1 4 }  { m_axi_BUS1_ARREGION USER 1 4 }  { m_axi_BUS1_ARUSER DATA 1 1 }  { m_axi_BUS1_RVALID VALID 0 1 }  { m_axi_BUS1_RREADY READY 1 1 }  { m_axi_BUS1_RDATA FIFONUM 0 32 }  { m_axi_BUS1_RLAST LAST 0 1 }  { m_axi_BUS1_RID ID 0 1 }  { m_axi_BUS1_RUSER DATA 0 1 }  { m_axi_BUS1_RRESP RESP 0 2 }  { m_axi_BUS1_BVALID VALID 0 1 }  { m_axi_BUS1_BREADY READY 1 1 }  { m_axi_BUS1_BRESP RESP 0 2 }  { m_axi_BUS1_BID ID 0 1 }  { m_axi_BUS1_BUSER DATA 0 1 } } }
	internal_bram { bram {  { internal_bram_Addr_A MemPortADDR2 1 32 }  { internal_bram_EN_A MemPortCE2 1 1 }  { internal_bram_WEN_A MemPortWE2 1 4 }  { internal_bram_Din_A MemPortDIN2 1 32 }  { internal_bram_Dout_A MemPortDOUT2 0 32 }  { internal_bram_Clk_A mem_clk 1 1 }  { internal_bram_Rst_A mem_rst 1 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict BUS0 {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 64 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict BUS1 {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 64 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE WRITE_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ BUS0 1 }
	{ BUS1 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ BUS0 1 }
	{ BUS1 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
set moduleName read_romcode
set isTopModule 1
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
set C_modelName {read_romcode}
set C_modelType { void 0 }
set C_modelArgList {
	{ BUS0 int 32 regular {axi_master 0}  }
	{ BUS1 int 32 regular {axi_master 1}  }
	{ romcode int 64 regular {axi_slave 0}  }
	{ internal_bram int 32 regular {bram 1024 { 2 3 } 1 1 }  }
	{ romcode_to_PS int 64 regular {axi_slave 0}  }
	{ cmd int 32 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "BUS0", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "romcode","offset": { "type": "dynamic","port_name": "romcode","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "BUS1", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "romcode_to_PS","offset": { "type": "dynamic","port_name": "romcode_to_PS","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "romcode", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "internal_bram", "interface" : "bram", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "romcode_to_PS", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "cmd", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":47}} ]}
# RTL Port declarations: 
set portNum 117
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_BUS0_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_BUS0_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_BUS0_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUS0_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUS0_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUS0_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUS0_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_BUS0_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_BUS0_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_BUS0_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUS0_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUS0_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUS0_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUS0_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_BUS0_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUS0_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUS0_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_BUS0_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_BUS0_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUS0_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUS1_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_BUS1_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_BUS1_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUS1_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUS1_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUS1_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUS1_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_BUS1_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_BUS1_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_BUS1_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUS1_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUS1_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUS1_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUS1_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_BUS1_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_BUS1_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_BUS1_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_BUS1_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_BUS1_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_BUS1_BUSER sc_in sc_lv 1 signal 1 } 
	{ internal_bram_Addr_A sc_out sc_lv 32 signal 3 } 
	{ internal_bram_EN_A sc_out sc_logic 1 signal 3 } 
	{ internal_bram_WEN_A sc_out sc_lv 4 signal 3 } 
	{ internal_bram_Din_A sc_out sc_lv 32 signal 3 } 
	{ internal_bram_Dout_A sc_in sc_lv 32 signal 3 } 
	{ internal_bram_Clk_A sc_out sc_logic 1 signal 3 } 
	{ internal_bram_Rst_A sc_out sc_logic 1 signal 3 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"read_romcode","role":"start","value":"0","valid_bit":"0"},{"name":"read_romcode","role":"continue","value":"0","valid_bit":"4"},{"name":"read_romcode","role":"auto_start","value":"0","valid_bit":"7"},{"name":"romcode","role":"data","value":"16"},{"name":"romcode_to_PS","role":"data","value":"28"},{"name":"cmd","role":"data","value":"40"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"read_romcode","role":"start","value":"0","valid_bit":"0"},{"name":"read_romcode","role":"done","value":"0","valid_bit":"1"},{"name":"read_romcode","role":"idle","value":"0","valid_bit":"2"},{"name":"read_romcode","role":"ready","value":"0","valid_bit":"3"},{"name":"read_romcode","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_BUS0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "AWVALID" }} , 
 	{ "name": "m_axi_BUS0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "AWREADY" }} , 
 	{ "name": "m_axi_BUS0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUS0", "role": "AWADDR" }} , 
 	{ "name": "m_axi_BUS0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "AWID" }} , 
 	{ "name": "m_axi_BUS0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUS0", "role": "AWLEN" }} , 
 	{ "name": "m_axi_BUS0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS0", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_BUS0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "AWBURST" }} , 
 	{ "name": "m_axi_BUS0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_BUS0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_BUS0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS0", "role": "AWPROT" }} , 
 	{ "name": "m_axi_BUS0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "AWQOS" }} , 
 	{ "name": "m_axi_BUS0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "AWREGION" }} , 
 	{ "name": "m_axi_BUS0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "AWUSER" }} , 
 	{ "name": "m_axi_BUS0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WVALID" }} , 
 	{ "name": "m_axi_BUS0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WREADY" }} , 
 	{ "name": "m_axi_BUS0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUS0", "role": "WDATA" }} , 
 	{ "name": "m_axi_BUS0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "WSTRB" }} , 
 	{ "name": "m_axi_BUS0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WLAST" }} , 
 	{ "name": "m_axi_BUS0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WID" }} , 
 	{ "name": "m_axi_BUS0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WUSER" }} , 
 	{ "name": "m_axi_BUS0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "ARVALID" }} , 
 	{ "name": "m_axi_BUS0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "ARREADY" }} , 
 	{ "name": "m_axi_BUS0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUS0", "role": "ARADDR" }} , 
 	{ "name": "m_axi_BUS0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "ARID" }} , 
 	{ "name": "m_axi_BUS0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUS0", "role": "ARLEN" }} , 
 	{ "name": "m_axi_BUS0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS0", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_BUS0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "ARBURST" }} , 
 	{ "name": "m_axi_BUS0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_BUS0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_BUS0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS0", "role": "ARPROT" }} , 
 	{ "name": "m_axi_BUS0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "ARQOS" }} , 
 	{ "name": "m_axi_BUS0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "ARREGION" }} , 
 	{ "name": "m_axi_BUS0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "ARUSER" }} , 
 	{ "name": "m_axi_BUS0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RVALID" }} , 
 	{ "name": "m_axi_BUS0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RREADY" }} , 
 	{ "name": "m_axi_BUS0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUS0", "role": "RDATA" }} , 
 	{ "name": "m_axi_BUS0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RLAST" }} , 
 	{ "name": "m_axi_BUS0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RID" }} , 
 	{ "name": "m_axi_BUS0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RUSER" }} , 
 	{ "name": "m_axi_BUS0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "RRESP" }} , 
 	{ "name": "m_axi_BUS0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "BVALID" }} , 
 	{ "name": "m_axi_BUS0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "BREADY" }} , 
 	{ "name": "m_axi_BUS0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "BRESP" }} , 
 	{ "name": "m_axi_BUS0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "BID" }} , 
 	{ "name": "m_axi_BUS0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "BUSER" }} , 
 	{ "name": "m_axi_BUS1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_BUS1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_BUS1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUS1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_BUS1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "AWID" }} , 
 	{ "name": "m_axi_BUS1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUS1", "role": "AWLEN" }} , 
 	{ "name": "m_axi_BUS1_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS1", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_BUS1_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "AWBURST" }} , 
 	{ "name": "m_axi_BUS1_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_BUS1_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_BUS1_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS1", "role": "AWPROT" }} , 
 	{ "name": "m_axi_BUS1_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "AWQOS" }} , 
 	{ "name": "m_axi_BUS1_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "AWREGION" }} , 
 	{ "name": "m_axi_BUS1_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "AWUSER" }} , 
 	{ "name": "m_axi_BUS1_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WVALID" }} , 
 	{ "name": "m_axi_BUS1_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WREADY" }} , 
 	{ "name": "m_axi_BUS1_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUS1", "role": "WDATA" }} , 
 	{ "name": "m_axi_BUS1_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "WSTRB" }} , 
 	{ "name": "m_axi_BUS1_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WLAST" }} , 
 	{ "name": "m_axi_BUS1_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WID" }} , 
 	{ "name": "m_axi_BUS1_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WUSER" }} , 
 	{ "name": "m_axi_BUS1_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "ARVALID" }} , 
 	{ "name": "m_axi_BUS1_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "ARREADY" }} , 
 	{ "name": "m_axi_BUS1_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUS1", "role": "ARADDR" }} , 
 	{ "name": "m_axi_BUS1_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "ARID" }} , 
 	{ "name": "m_axi_BUS1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUS1", "role": "ARLEN" }} , 
 	{ "name": "m_axi_BUS1_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS1", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_BUS1_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "ARBURST" }} , 
 	{ "name": "m_axi_BUS1_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_BUS1_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_BUS1_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS1", "role": "ARPROT" }} , 
 	{ "name": "m_axi_BUS1_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "ARQOS" }} , 
 	{ "name": "m_axi_BUS1_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "ARREGION" }} , 
 	{ "name": "m_axi_BUS1_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "ARUSER" }} , 
 	{ "name": "m_axi_BUS1_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RVALID" }} , 
 	{ "name": "m_axi_BUS1_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RREADY" }} , 
 	{ "name": "m_axi_BUS1_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUS1", "role": "RDATA" }} , 
 	{ "name": "m_axi_BUS1_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RLAST" }} , 
 	{ "name": "m_axi_BUS1_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RID" }} , 
 	{ "name": "m_axi_BUS1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RUSER" }} , 
 	{ "name": "m_axi_BUS1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "RRESP" }} , 
 	{ "name": "m_axi_BUS1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "BVALID" }} , 
 	{ "name": "m_axi_BUS1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "BREADY" }} , 
 	{ "name": "m_axi_BUS1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "BRESP" }} , 
 	{ "name": "m_axi_BUS1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "BID" }} , 
 	{ "name": "m_axi_BUS1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "BUSER" }} , 
 	{ "name": "internal_bram_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "internal_bram", "role": "Addr_A" }} , 
 	{ "name": "internal_bram_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "internal_bram", "role": "EN_A" }} , 
 	{ "name": "internal_bram_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "internal_bram", "role": "WEN_A" }} , 
 	{ "name": "internal_bram_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "internal_bram", "role": "Din_A" }} , 
 	{ "name": "internal_bram_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "internal_bram", "role": "Dout_A" }} , 
 	{ "name": "internal_bram_Clk_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "internal_bram", "role": "Clk_A" }} , 
 	{ "name": "internal_bram_Rst_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "internal_bram", "role": "Rst_A" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "5", "6", "7"],
		"CDFG" : "read_romcode",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "1036",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BUS0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "BUS0_blk_n_AR", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_read_romcode_Pipeline_VITIS_LOOP_41_1_fu_120", "Port" : "BUS0", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "BUS1", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "BUS1_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "BUS1_blk_n_B", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_read_romcode_Pipeline_VITIS_LOOP_47_2_fu_111", "Port" : "BUS1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "romcode", "Type" : "None", "Direction" : "I"},
			{"Name" : "internal_bram", "Type" : "Bram", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_read_romcode_Pipeline_VITIS_LOOP_41_1_fu_120", "Port" : "internal_bram", "Inst_start_state" : "17", "Inst_end_state" : "18"},
					{"ID" : "1", "SubInstance" : "grp_read_romcode_Pipeline_VITIS_LOOP_47_2_fu_111", "Port" : "internal_bram", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "romcode_to_PS", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmd", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_read_romcode_Pipeline_VITIS_LOOP_47_2_fu_111", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "read_romcode_Pipeline_VITIS_LOOP_47_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1027", "EstimateLatencyMax" : "1027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BUS1", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "BUS1_blk_n_W", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln47", "Type" : "None", "Direction" : "I"},
			{"Name" : "internal_bram", "Type" : "Bram", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_47_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_read_romcode_Pipeline_VITIS_LOOP_47_2_fu_111.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_read_romcode_Pipeline_VITIS_LOOP_41_1_fu_120", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "read_romcode_Pipeline_VITIS_LOOP_41_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1027", "EstimateLatencyMax" : "1027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BUS0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "BUS0_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln41", "Type" : "None", "Direction" : "I"},
			{"Name" : "internal_bram", "Type" : "Bram", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_41_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_read_romcode_Pipeline_VITIS_LOOP_41_1_fu_120.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BUS0_m_axi_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BUS1_m_axi_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	read_romcode {
		BUS0 {Type I LastRead 1 FirstWrite -1}
		BUS1 {Type O LastRead 4 FirstWrite 2}
		romcode {Type I LastRead 0 FirstWrite -1}
		internal_bram {Type IO LastRead 0 FirstWrite -1}
		romcode_to_PS {Type I LastRead 0 FirstWrite -1}
		cmd {Type I LastRead 0 FirstWrite -1}}
	read_romcode_Pipeline_VITIS_LOOP_47_2 {
		BUS1 {Type O LastRead -1 FirstWrite 2}
		sext_ln47 {Type I LastRead 0 FirstWrite -1}
		internal_bram {Type I LastRead 0 FirstWrite -1}}
	read_romcode_Pipeline_VITIS_LOOP_41_1 {
		BUS0 {Type I LastRead 1 FirstWrite -1}
		sext_ln41 {Type I LastRead 0 FirstWrite -1}
		internal_bram {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "1036"}
	, {"Name" : "Interval", "Min" : "3", "Max" : "1037"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	BUS0 { m_axi {  { m_axi_BUS0_AWVALID VALID 1 1 }  { m_axi_BUS0_AWREADY READY 0 1 }  { m_axi_BUS0_AWADDR ADDR 1 64 }  { m_axi_BUS0_AWID ID 1 1 }  { m_axi_BUS0_AWLEN SIZE 1 8 }  { m_axi_BUS0_AWSIZE BURST 1 3 }  { m_axi_BUS0_AWBURST LOCK 1 2 }  { m_axi_BUS0_AWLOCK CACHE 1 2 }  { m_axi_BUS0_AWCACHE PROT 1 4 }  { m_axi_BUS0_AWPROT QOS 1 3 }  { m_axi_BUS0_AWQOS REGION 1 4 }  { m_axi_BUS0_AWREGION USER 1 4 }  { m_axi_BUS0_AWUSER DATA 1 1 }  { m_axi_BUS0_WVALID VALID 1 1 }  { m_axi_BUS0_WREADY READY 0 1 }  { m_axi_BUS0_WDATA FIFONUM 1 32 }  { m_axi_BUS0_WSTRB STRB 1 4 }  { m_axi_BUS0_WLAST LAST 1 1 }  { m_axi_BUS0_WID ID 1 1 }  { m_axi_BUS0_WUSER DATA 1 1 }  { m_axi_BUS0_ARVALID VALID 1 1 }  { m_axi_BUS0_ARREADY READY 0 1 }  { m_axi_BUS0_ARADDR ADDR 1 64 }  { m_axi_BUS0_ARID ID 1 1 }  { m_axi_BUS0_ARLEN SIZE 1 8 }  { m_axi_BUS0_ARSIZE BURST 1 3 }  { m_axi_BUS0_ARBURST LOCK 1 2 }  { m_axi_BUS0_ARLOCK CACHE 1 2 }  { m_axi_BUS0_ARCACHE PROT 1 4 }  { m_axi_BUS0_ARPROT QOS 1 3 }  { m_axi_BUS0_ARQOS REGION 1 4 }  { m_axi_BUS0_ARREGION USER 1 4 }  { m_axi_BUS0_ARUSER DATA 1 1 }  { m_axi_BUS0_RVALID VALID 0 1 }  { m_axi_BUS0_RREADY READY 1 1 }  { m_axi_BUS0_RDATA FIFONUM 0 32 }  { m_axi_BUS0_RLAST LAST 0 1 }  { m_axi_BUS0_RID ID 0 1 }  { m_axi_BUS0_RUSER DATA 0 1 }  { m_axi_BUS0_RRESP RESP 0 2 }  { m_axi_BUS0_BVALID VALID 0 1 }  { m_axi_BUS0_BREADY READY 1 1 }  { m_axi_BUS0_BRESP RESP 0 2 }  { m_axi_BUS0_BID ID 0 1 }  { m_axi_BUS0_BUSER DATA 0 1 } } }
	BUS1 { m_axi {  { m_axi_BUS1_AWVALID VALID 1 1 }  { m_axi_BUS1_AWREADY READY 0 1 }  { m_axi_BUS1_AWADDR ADDR 1 64 }  { m_axi_BUS1_AWID ID 1 1 }  { m_axi_BUS1_AWLEN SIZE 1 8 }  { m_axi_BUS1_AWSIZE BURST 1 3 }  { m_axi_BUS1_AWBURST LOCK 1 2 }  { m_axi_BUS1_AWLOCK CACHE 1 2 }  { m_axi_BUS1_AWCACHE PROT 1 4 }  { m_axi_BUS1_AWPROT QOS 1 3 }  { m_axi_BUS1_AWQOS REGION 1 4 }  { m_axi_BUS1_AWREGION USER 1 4 }  { m_axi_BUS1_AWUSER DATA 1 1 }  { m_axi_BUS1_WVALID VALID 1 1 }  { m_axi_BUS1_WREADY READY 0 1 }  { m_axi_BUS1_WDATA FIFONUM 1 32 }  { m_axi_BUS1_WSTRB STRB 1 4 }  { m_axi_BUS1_WLAST LAST 1 1 }  { m_axi_BUS1_WID ID 1 1 }  { m_axi_BUS1_WUSER DATA 1 1 }  { m_axi_BUS1_ARVALID VALID 1 1 }  { m_axi_BUS1_ARREADY READY 0 1 }  { m_axi_BUS1_ARADDR ADDR 1 64 }  { m_axi_BUS1_ARID ID 1 1 }  { m_axi_BUS1_ARLEN SIZE 1 8 }  { m_axi_BUS1_ARSIZE BURST 1 3 }  { m_axi_BUS1_ARBURST LOCK 1 2 }  { m_axi_BUS1_ARLOCK CACHE 1 2 }  { m_axi_BUS1_ARCACHE PROT 1 4 }  { m_axi_BUS1_ARPROT QOS 1 3 }  { m_axi_BUS1_ARQOS REGION 1 4 }  { m_axi_BUS1_ARREGION USER 1 4 }  { m_axi_BUS1_ARUSER DATA 1 1 }  { m_axi_BUS1_RVALID VALID 0 1 }  { m_axi_BUS1_RREADY READY 1 1 }  { m_axi_BUS1_RDATA FIFONUM 0 32 }  { m_axi_BUS1_RLAST LAST 0 1 }  { m_axi_BUS1_RID ID 0 1 }  { m_axi_BUS1_RUSER DATA 0 1 }  { m_axi_BUS1_RRESP RESP 0 2 }  { m_axi_BUS1_BVALID VALID 0 1 }  { m_axi_BUS1_BREADY READY 1 1 }  { m_axi_BUS1_BRESP RESP 0 2 }  { m_axi_BUS1_BID ID 0 1 }  { m_axi_BUS1_BUSER DATA 0 1 } } }
	internal_bram { bram {  { internal_bram_Addr_A MemPortADDR2 1 32 }  { internal_bram_EN_A MemPortCE2 1 1 }  { internal_bram_WEN_A MemPortWE2 1 4 }  { internal_bram_Din_A MemPortDIN2 1 32 }  { internal_bram_Dout_A MemPortDOUT2 0 32 }  { internal_bram_Clk_A mem_clk 1 1 }  { internal_bram_Rst_A mem_rst 1 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict BUS0 {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 64 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict BUS1 {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 64 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE WRITE_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ BUS0 1 }
	{ BUS1 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ BUS0 1 }
	{ BUS1 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
set moduleName read_romcode
set isTopModule 1
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
set C_modelName {read_romcode}
set C_modelType { void 0 }
set C_modelArgList {
	{ BUS0 int 32 regular {axi_master 0}  }
	{ BUS1 int 32 regular {axi_master 1}  }
	{ romcode int 64 regular {axi_slave 0}  }
	{ internal_bram int 32 regular {bram 1024 { 2 3 } 1 1 }  }
	{ romcode_to_PS int 64 regular {axi_slave 0}  }
	{ cmd int 32 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "BUS0", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "romcode","offset": { "type": "dynamic","port_name": "romcode","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "BUS1", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "romcode_to_PS","offset": { "type": "dynamic","port_name": "romcode_to_PS","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "romcode", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "internal_bram", "interface" : "bram", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "romcode_to_PS", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "cmd", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":47}} ]}
# RTL Port declarations: 
set portNum 117
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_BUS0_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_BUS0_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_BUS0_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUS0_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUS0_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUS0_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUS0_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_BUS0_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_BUS0_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_BUS0_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUS0_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUS0_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUS0_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUS0_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_BUS0_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUS0_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUS0_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_BUS0_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_BUS0_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUS0_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUS1_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_BUS1_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_BUS1_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUS1_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUS1_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUS1_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUS1_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_BUS1_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_BUS1_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_BUS1_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUS1_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUS1_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUS1_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUS1_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_BUS1_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_BUS1_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_BUS1_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_BUS1_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_BUS1_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_BUS1_BUSER sc_in sc_lv 1 signal 1 } 
	{ internal_bram_Addr_A sc_out sc_lv 32 signal 3 } 
	{ internal_bram_EN_A sc_out sc_logic 1 signal 3 } 
	{ internal_bram_WEN_A sc_out sc_lv 4 signal 3 } 
	{ internal_bram_Din_A sc_out sc_lv 32 signal 3 } 
	{ internal_bram_Dout_A sc_in sc_lv 32 signal 3 } 
	{ internal_bram_Clk_A sc_out sc_logic 1 signal 3 } 
	{ internal_bram_Rst_A sc_out sc_logic 1 signal 3 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"read_romcode","role":"start","value":"0","valid_bit":"0"},{"name":"read_romcode","role":"continue","value":"0","valid_bit":"4"},{"name":"read_romcode","role":"auto_start","value":"0","valid_bit":"7"},{"name":"romcode","role":"data","value":"16"},{"name":"romcode_to_PS","role":"data","value":"28"},{"name":"cmd","role":"data","value":"40"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"read_romcode","role":"start","value":"0","valid_bit":"0"},{"name":"read_romcode","role":"done","value":"0","valid_bit":"1"},{"name":"read_romcode","role":"idle","value":"0","valid_bit":"2"},{"name":"read_romcode","role":"ready","value":"0","valid_bit":"3"},{"name":"read_romcode","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_BUS0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "AWVALID" }} , 
 	{ "name": "m_axi_BUS0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "AWREADY" }} , 
 	{ "name": "m_axi_BUS0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUS0", "role": "AWADDR" }} , 
 	{ "name": "m_axi_BUS0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "AWID" }} , 
 	{ "name": "m_axi_BUS0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUS0", "role": "AWLEN" }} , 
 	{ "name": "m_axi_BUS0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS0", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_BUS0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "AWBURST" }} , 
 	{ "name": "m_axi_BUS0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_BUS0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_BUS0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS0", "role": "AWPROT" }} , 
 	{ "name": "m_axi_BUS0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "AWQOS" }} , 
 	{ "name": "m_axi_BUS0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "AWREGION" }} , 
 	{ "name": "m_axi_BUS0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "AWUSER" }} , 
 	{ "name": "m_axi_BUS0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WVALID" }} , 
 	{ "name": "m_axi_BUS0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WREADY" }} , 
 	{ "name": "m_axi_BUS0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUS0", "role": "WDATA" }} , 
 	{ "name": "m_axi_BUS0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "WSTRB" }} , 
 	{ "name": "m_axi_BUS0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WLAST" }} , 
 	{ "name": "m_axi_BUS0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WID" }} , 
 	{ "name": "m_axi_BUS0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WUSER" }} , 
 	{ "name": "m_axi_BUS0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "ARVALID" }} , 
 	{ "name": "m_axi_BUS0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "ARREADY" }} , 
 	{ "name": "m_axi_BUS0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUS0", "role": "ARADDR" }} , 
 	{ "name": "m_axi_BUS0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "ARID" }} , 
 	{ "name": "m_axi_BUS0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUS0", "role": "ARLEN" }} , 
 	{ "name": "m_axi_BUS0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS0", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_BUS0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "ARBURST" }} , 
 	{ "name": "m_axi_BUS0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_BUS0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_BUS0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS0", "role": "ARPROT" }} , 
 	{ "name": "m_axi_BUS0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "ARQOS" }} , 
 	{ "name": "m_axi_BUS0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "ARREGION" }} , 
 	{ "name": "m_axi_BUS0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "ARUSER" }} , 
 	{ "name": "m_axi_BUS0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RVALID" }} , 
 	{ "name": "m_axi_BUS0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RREADY" }} , 
 	{ "name": "m_axi_BUS0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUS0", "role": "RDATA" }} , 
 	{ "name": "m_axi_BUS0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RLAST" }} , 
 	{ "name": "m_axi_BUS0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RID" }} , 
 	{ "name": "m_axi_BUS0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RUSER" }} , 
 	{ "name": "m_axi_BUS0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "RRESP" }} , 
 	{ "name": "m_axi_BUS0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "BVALID" }} , 
 	{ "name": "m_axi_BUS0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "BREADY" }} , 
 	{ "name": "m_axi_BUS0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "BRESP" }} , 
 	{ "name": "m_axi_BUS0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "BID" }} , 
 	{ "name": "m_axi_BUS0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "BUSER" }} , 
 	{ "name": "m_axi_BUS1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_BUS1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_BUS1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUS1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_BUS1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "AWID" }} , 
 	{ "name": "m_axi_BUS1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUS1", "role": "AWLEN" }} , 
 	{ "name": "m_axi_BUS1_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS1", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_BUS1_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "AWBURST" }} , 
 	{ "name": "m_axi_BUS1_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_BUS1_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_BUS1_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS1", "role": "AWPROT" }} , 
 	{ "name": "m_axi_BUS1_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "AWQOS" }} , 
 	{ "name": "m_axi_BUS1_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "AWREGION" }} , 
 	{ "name": "m_axi_BUS1_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "AWUSER" }} , 
 	{ "name": "m_axi_BUS1_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WVALID" }} , 
 	{ "name": "m_axi_BUS1_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WREADY" }} , 
 	{ "name": "m_axi_BUS1_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUS1", "role": "WDATA" }} , 
 	{ "name": "m_axi_BUS1_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "WSTRB" }} , 
 	{ "name": "m_axi_BUS1_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WLAST" }} , 
 	{ "name": "m_axi_BUS1_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WID" }} , 
 	{ "name": "m_axi_BUS1_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WUSER" }} , 
 	{ "name": "m_axi_BUS1_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "ARVALID" }} , 
 	{ "name": "m_axi_BUS1_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "ARREADY" }} , 
 	{ "name": "m_axi_BUS1_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUS1", "role": "ARADDR" }} , 
 	{ "name": "m_axi_BUS1_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "ARID" }} , 
 	{ "name": "m_axi_BUS1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUS1", "role": "ARLEN" }} , 
 	{ "name": "m_axi_BUS1_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS1", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_BUS1_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "ARBURST" }} , 
 	{ "name": "m_axi_BUS1_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_BUS1_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_BUS1_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS1", "role": "ARPROT" }} , 
 	{ "name": "m_axi_BUS1_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "ARQOS" }} , 
 	{ "name": "m_axi_BUS1_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "ARREGION" }} , 
 	{ "name": "m_axi_BUS1_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "ARUSER" }} , 
 	{ "name": "m_axi_BUS1_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RVALID" }} , 
 	{ "name": "m_axi_BUS1_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RREADY" }} , 
 	{ "name": "m_axi_BUS1_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUS1", "role": "RDATA" }} , 
 	{ "name": "m_axi_BUS1_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RLAST" }} , 
 	{ "name": "m_axi_BUS1_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RID" }} , 
 	{ "name": "m_axi_BUS1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RUSER" }} , 
 	{ "name": "m_axi_BUS1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "RRESP" }} , 
 	{ "name": "m_axi_BUS1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "BVALID" }} , 
 	{ "name": "m_axi_BUS1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "BREADY" }} , 
 	{ "name": "m_axi_BUS1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "BRESP" }} , 
 	{ "name": "m_axi_BUS1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "BID" }} , 
 	{ "name": "m_axi_BUS1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "BUSER" }} , 
 	{ "name": "internal_bram_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "internal_bram", "role": "Addr_A" }} , 
 	{ "name": "internal_bram_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "internal_bram", "role": "EN_A" }} , 
 	{ "name": "internal_bram_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "internal_bram", "role": "WEN_A" }} , 
 	{ "name": "internal_bram_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "internal_bram", "role": "Din_A" }} , 
 	{ "name": "internal_bram_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "internal_bram", "role": "Dout_A" }} , 
 	{ "name": "internal_bram_Clk_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "internal_bram", "role": "Clk_A" }} , 
 	{ "name": "internal_bram_Rst_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "internal_bram", "role": "Rst_A" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "5", "6", "7"],
		"CDFG" : "read_romcode",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "1036",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BUS0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "BUS0_blk_n_AR", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_read_romcode_Pipeline_VITIS_LOOP_41_1_fu_120", "Port" : "BUS0", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "BUS1", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "BUS1_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "BUS1_blk_n_B", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_read_romcode_Pipeline_VITIS_LOOP_47_2_fu_111", "Port" : "BUS1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "romcode", "Type" : "None", "Direction" : "I"},
			{"Name" : "internal_bram", "Type" : "Bram", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_read_romcode_Pipeline_VITIS_LOOP_41_1_fu_120", "Port" : "internal_bram", "Inst_start_state" : "17", "Inst_end_state" : "18"},
					{"ID" : "1", "SubInstance" : "grp_read_romcode_Pipeline_VITIS_LOOP_47_2_fu_111", "Port" : "internal_bram", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "romcode_to_PS", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmd", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_read_romcode_Pipeline_VITIS_LOOP_47_2_fu_111", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "read_romcode_Pipeline_VITIS_LOOP_47_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1027", "EstimateLatencyMax" : "1027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BUS1", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "BUS1_blk_n_W", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln47", "Type" : "None", "Direction" : "I"},
			{"Name" : "internal_bram", "Type" : "Bram", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_47_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_read_romcode_Pipeline_VITIS_LOOP_47_2_fu_111.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_read_romcode_Pipeline_VITIS_LOOP_41_1_fu_120", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "read_romcode_Pipeline_VITIS_LOOP_41_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1027", "EstimateLatencyMax" : "1027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BUS0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "BUS0_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln41", "Type" : "None", "Direction" : "I"},
			{"Name" : "internal_bram", "Type" : "Bram", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_41_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_read_romcode_Pipeline_VITIS_LOOP_41_1_fu_120.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BUS0_m_axi_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BUS1_m_axi_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	read_romcode {
		BUS0 {Type I LastRead 1 FirstWrite -1}
		BUS1 {Type O LastRead 4 FirstWrite 2}
		romcode {Type I LastRead 0 FirstWrite -1}
		internal_bram {Type IO LastRead 0 FirstWrite -1}
		romcode_to_PS {Type I LastRead 0 FirstWrite -1}
		cmd {Type I LastRead 0 FirstWrite -1}}
	read_romcode_Pipeline_VITIS_LOOP_47_2 {
		BUS1 {Type O LastRead -1 FirstWrite 2}
		sext_ln47 {Type I LastRead 0 FirstWrite -1}
		internal_bram {Type I LastRead 0 FirstWrite -1}}
	read_romcode_Pipeline_VITIS_LOOP_41_1 {
		BUS0 {Type I LastRead 1 FirstWrite -1}
		sext_ln41 {Type I LastRead 0 FirstWrite -1}
		internal_bram {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "1036"}
	, {"Name" : "Interval", "Min" : "3", "Max" : "1037"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	BUS0 { m_axi {  { m_axi_BUS0_AWVALID VALID 1 1 }  { m_axi_BUS0_AWREADY READY 0 1 }  { m_axi_BUS0_AWADDR ADDR 1 64 }  { m_axi_BUS0_AWID ID 1 1 }  { m_axi_BUS0_AWLEN SIZE 1 8 }  { m_axi_BUS0_AWSIZE BURST 1 3 }  { m_axi_BUS0_AWBURST LOCK 1 2 }  { m_axi_BUS0_AWLOCK CACHE 1 2 }  { m_axi_BUS0_AWCACHE PROT 1 4 }  { m_axi_BUS0_AWPROT QOS 1 3 }  { m_axi_BUS0_AWQOS REGION 1 4 }  { m_axi_BUS0_AWREGION USER 1 4 }  { m_axi_BUS0_AWUSER DATA 1 1 }  { m_axi_BUS0_WVALID VALID 1 1 }  { m_axi_BUS0_WREADY READY 0 1 }  { m_axi_BUS0_WDATA FIFONUM 1 32 }  { m_axi_BUS0_WSTRB STRB 1 4 }  { m_axi_BUS0_WLAST LAST 1 1 }  { m_axi_BUS0_WID ID 1 1 }  { m_axi_BUS0_WUSER DATA 1 1 }  { m_axi_BUS0_ARVALID VALID 1 1 }  { m_axi_BUS0_ARREADY READY 0 1 }  { m_axi_BUS0_ARADDR ADDR 1 64 }  { m_axi_BUS0_ARID ID 1 1 }  { m_axi_BUS0_ARLEN SIZE 1 8 }  { m_axi_BUS0_ARSIZE BURST 1 3 }  { m_axi_BUS0_ARBURST LOCK 1 2 }  { m_axi_BUS0_ARLOCK CACHE 1 2 }  { m_axi_BUS0_ARCACHE PROT 1 4 }  { m_axi_BUS0_ARPROT QOS 1 3 }  { m_axi_BUS0_ARQOS REGION 1 4 }  { m_axi_BUS0_ARREGION USER 1 4 }  { m_axi_BUS0_ARUSER DATA 1 1 }  { m_axi_BUS0_RVALID VALID 0 1 }  { m_axi_BUS0_RREADY READY 1 1 }  { m_axi_BUS0_RDATA FIFONUM 0 32 }  { m_axi_BUS0_RLAST LAST 0 1 }  { m_axi_BUS0_RID ID 0 1 }  { m_axi_BUS0_RUSER DATA 0 1 }  { m_axi_BUS0_RRESP RESP 0 2 }  { m_axi_BUS0_BVALID VALID 0 1 }  { m_axi_BUS0_BREADY READY 1 1 }  { m_axi_BUS0_BRESP RESP 0 2 }  { m_axi_BUS0_BID ID 0 1 }  { m_axi_BUS0_BUSER DATA 0 1 } } }
	BUS1 { m_axi {  { m_axi_BUS1_AWVALID VALID 1 1 }  { m_axi_BUS1_AWREADY READY 0 1 }  { m_axi_BUS1_AWADDR ADDR 1 64 }  { m_axi_BUS1_AWID ID 1 1 }  { m_axi_BUS1_AWLEN SIZE 1 8 }  { m_axi_BUS1_AWSIZE BURST 1 3 }  { m_axi_BUS1_AWBURST LOCK 1 2 }  { m_axi_BUS1_AWLOCK CACHE 1 2 }  { m_axi_BUS1_AWCACHE PROT 1 4 }  { m_axi_BUS1_AWPROT QOS 1 3 }  { m_axi_BUS1_AWQOS REGION 1 4 }  { m_axi_BUS1_AWREGION USER 1 4 }  { m_axi_BUS1_AWUSER DATA 1 1 }  { m_axi_BUS1_WVALID VALID 1 1 }  { m_axi_BUS1_WREADY READY 0 1 }  { m_axi_BUS1_WDATA FIFONUM 1 32 }  { m_axi_BUS1_WSTRB STRB 1 4 }  { m_axi_BUS1_WLAST LAST 1 1 }  { m_axi_BUS1_WID ID 1 1 }  { m_axi_BUS1_WUSER DATA 1 1 }  { m_axi_BUS1_ARVALID VALID 1 1 }  { m_axi_BUS1_ARREADY READY 0 1 }  { m_axi_BUS1_ARADDR ADDR 1 64 }  { m_axi_BUS1_ARID ID 1 1 }  { m_axi_BUS1_ARLEN SIZE 1 8 }  { m_axi_BUS1_ARSIZE BURST 1 3 }  { m_axi_BUS1_ARBURST LOCK 1 2 }  { m_axi_BUS1_ARLOCK CACHE 1 2 }  { m_axi_BUS1_ARCACHE PROT 1 4 }  { m_axi_BUS1_ARPROT QOS 1 3 }  { m_axi_BUS1_ARQOS REGION 1 4 }  { m_axi_BUS1_ARREGION USER 1 4 }  { m_axi_BUS1_ARUSER DATA 1 1 }  { m_axi_BUS1_RVALID VALID 0 1 }  { m_axi_BUS1_RREADY READY 1 1 }  { m_axi_BUS1_RDATA FIFONUM 0 32 }  { m_axi_BUS1_RLAST LAST 0 1 }  { m_axi_BUS1_RID ID 0 1 }  { m_axi_BUS1_RUSER DATA 0 1 }  { m_axi_BUS1_RRESP RESP 0 2 }  { m_axi_BUS1_BVALID VALID 0 1 }  { m_axi_BUS1_BREADY READY 1 1 }  { m_axi_BUS1_BRESP RESP 0 2 }  { m_axi_BUS1_BID ID 0 1 }  { m_axi_BUS1_BUSER DATA 0 1 } } }
	internal_bram { bram {  { internal_bram_Addr_A MemPortADDR2 1 32 }  { internal_bram_EN_A MemPortCE2 1 1 }  { internal_bram_WEN_A MemPortWE2 1 4 }  { internal_bram_Din_A MemPortDIN2 1 32 }  { internal_bram_Dout_A MemPortDOUT2 0 32 }  { internal_bram_Clk_A mem_clk 1 1 }  { internal_bram_Rst_A mem_rst 1 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict BUS0 {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 64 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict BUS1 {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 64 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE WRITE_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ BUS0 1 }
	{ BUS1 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ BUS0 1 }
	{ BUS1 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
set moduleName read_romcode
set isTopModule 1
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
set C_modelName {read_romcode}
set C_modelType { void 0 }
set C_modelArgList {
	{ BUS0 int 32 regular {axi_master 0}  }
	{ BUS1 int 32 regular {axi_master 1}  }
	{ romcode int 64 regular {axi_slave 0}  }
	{ internal_bram int 32 regular {bram 1024 { 2 3 } 1 1 }  }
	{ romcode_to_PS int 64 regular {axi_slave 0}  }
	{ cmd int 32 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "BUS0", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "romcode","offset": { "type": "dynamic","port_name": "romcode","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "BUS1", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "romcode_to_PS","offset": { "type": "dynamic","port_name": "romcode_to_PS","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "romcode", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "internal_bram", "interface" : "bram", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "romcode_to_PS", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "cmd", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":47}} ]}
# RTL Port declarations: 
set portNum 117
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_BUS0_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_BUS0_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_BUS0_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUS0_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUS0_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUS0_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUS0_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_BUS0_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_BUS0_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_BUS0_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUS0_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUS0_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUS0_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUS0_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUS0_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUS0_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_BUS0_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUS0_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUS0_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_BUS0_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUS0_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUS0_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_BUS0_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUS0_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUS1_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_BUS1_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_BUS1_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUS1_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUS1_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUS1_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUS1_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_BUS1_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_BUS1_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_BUS1_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUS1_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUS1_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUS1_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUS1_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUS1_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUS1_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_BUS1_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_BUS1_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_BUS1_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_BUS1_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUS1_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUS1_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_BUS1_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_BUS1_BUSER sc_in sc_lv 1 signal 1 } 
	{ internal_bram_Addr_A sc_out sc_lv 32 signal 3 } 
	{ internal_bram_EN_A sc_out sc_logic 1 signal 3 } 
	{ internal_bram_WEN_A sc_out sc_lv 4 signal 3 } 
	{ internal_bram_Din_A sc_out sc_lv 32 signal 3 } 
	{ internal_bram_Dout_A sc_in sc_lv 32 signal 3 } 
	{ internal_bram_Clk_A sc_out sc_logic 1 signal 3 } 
	{ internal_bram_Rst_A sc_out sc_logic 1 signal 3 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"read_romcode","role":"start","value":"0","valid_bit":"0"},{"name":"read_romcode","role":"continue","value":"0","valid_bit":"4"},{"name":"read_romcode","role":"auto_start","value":"0","valid_bit":"7"},{"name":"romcode","role":"data","value":"16"},{"name":"romcode_to_PS","role":"data","value":"28"},{"name":"cmd","role":"data","value":"40"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"read_romcode","role":"start","value":"0","valid_bit":"0"},{"name":"read_romcode","role":"done","value":"0","valid_bit":"1"},{"name":"read_romcode","role":"idle","value":"0","valid_bit":"2"},{"name":"read_romcode","role":"ready","value":"0","valid_bit":"3"},{"name":"read_romcode","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_BUS0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "AWVALID" }} , 
 	{ "name": "m_axi_BUS0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "AWREADY" }} , 
 	{ "name": "m_axi_BUS0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUS0", "role": "AWADDR" }} , 
 	{ "name": "m_axi_BUS0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "AWID" }} , 
 	{ "name": "m_axi_BUS0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUS0", "role": "AWLEN" }} , 
 	{ "name": "m_axi_BUS0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS0", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_BUS0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "AWBURST" }} , 
 	{ "name": "m_axi_BUS0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_BUS0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_BUS0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS0", "role": "AWPROT" }} , 
 	{ "name": "m_axi_BUS0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "AWQOS" }} , 
 	{ "name": "m_axi_BUS0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "AWREGION" }} , 
 	{ "name": "m_axi_BUS0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "AWUSER" }} , 
 	{ "name": "m_axi_BUS0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WVALID" }} , 
 	{ "name": "m_axi_BUS0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WREADY" }} , 
 	{ "name": "m_axi_BUS0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUS0", "role": "WDATA" }} , 
 	{ "name": "m_axi_BUS0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "WSTRB" }} , 
 	{ "name": "m_axi_BUS0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WLAST" }} , 
 	{ "name": "m_axi_BUS0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WID" }} , 
 	{ "name": "m_axi_BUS0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "WUSER" }} , 
 	{ "name": "m_axi_BUS0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "ARVALID" }} , 
 	{ "name": "m_axi_BUS0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "ARREADY" }} , 
 	{ "name": "m_axi_BUS0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUS0", "role": "ARADDR" }} , 
 	{ "name": "m_axi_BUS0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "ARID" }} , 
 	{ "name": "m_axi_BUS0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUS0", "role": "ARLEN" }} , 
 	{ "name": "m_axi_BUS0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS0", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_BUS0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "ARBURST" }} , 
 	{ "name": "m_axi_BUS0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_BUS0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_BUS0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS0", "role": "ARPROT" }} , 
 	{ "name": "m_axi_BUS0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "ARQOS" }} , 
 	{ "name": "m_axi_BUS0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS0", "role": "ARREGION" }} , 
 	{ "name": "m_axi_BUS0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "ARUSER" }} , 
 	{ "name": "m_axi_BUS0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RVALID" }} , 
 	{ "name": "m_axi_BUS0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RREADY" }} , 
 	{ "name": "m_axi_BUS0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUS0", "role": "RDATA" }} , 
 	{ "name": "m_axi_BUS0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RLAST" }} , 
 	{ "name": "m_axi_BUS0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RID" }} , 
 	{ "name": "m_axi_BUS0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "RUSER" }} , 
 	{ "name": "m_axi_BUS0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "RRESP" }} , 
 	{ "name": "m_axi_BUS0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "BVALID" }} , 
 	{ "name": "m_axi_BUS0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "BREADY" }} , 
 	{ "name": "m_axi_BUS0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS0", "role": "BRESP" }} , 
 	{ "name": "m_axi_BUS0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "BID" }} , 
 	{ "name": "m_axi_BUS0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS0", "role": "BUSER" }} , 
 	{ "name": "m_axi_BUS1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_BUS1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_BUS1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUS1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_BUS1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "AWID" }} , 
 	{ "name": "m_axi_BUS1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUS1", "role": "AWLEN" }} , 
 	{ "name": "m_axi_BUS1_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS1", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_BUS1_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "AWBURST" }} , 
 	{ "name": "m_axi_BUS1_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_BUS1_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_BUS1_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS1", "role": "AWPROT" }} , 
 	{ "name": "m_axi_BUS1_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "AWQOS" }} , 
 	{ "name": "m_axi_BUS1_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "AWREGION" }} , 
 	{ "name": "m_axi_BUS1_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "AWUSER" }} , 
 	{ "name": "m_axi_BUS1_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WVALID" }} , 
 	{ "name": "m_axi_BUS1_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WREADY" }} , 
 	{ "name": "m_axi_BUS1_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUS1", "role": "WDATA" }} , 
 	{ "name": "m_axi_BUS1_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "WSTRB" }} , 
 	{ "name": "m_axi_BUS1_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WLAST" }} , 
 	{ "name": "m_axi_BUS1_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WID" }} , 
 	{ "name": "m_axi_BUS1_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "WUSER" }} , 
 	{ "name": "m_axi_BUS1_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "ARVALID" }} , 
 	{ "name": "m_axi_BUS1_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "ARREADY" }} , 
 	{ "name": "m_axi_BUS1_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUS1", "role": "ARADDR" }} , 
 	{ "name": "m_axi_BUS1_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "ARID" }} , 
 	{ "name": "m_axi_BUS1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUS1", "role": "ARLEN" }} , 
 	{ "name": "m_axi_BUS1_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS1", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_BUS1_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "ARBURST" }} , 
 	{ "name": "m_axi_BUS1_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_BUS1_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_BUS1_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUS1", "role": "ARPROT" }} , 
 	{ "name": "m_axi_BUS1_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "ARQOS" }} , 
 	{ "name": "m_axi_BUS1_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUS1", "role": "ARREGION" }} , 
 	{ "name": "m_axi_BUS1_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "ARUSER" }} , 
 	{ "name": "m_axi_BUS1_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RVALID" }} , 
 	{ "name": "m_axi_BUS1_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RREADY" }} , 
 	{ "name": "m_axi_BUS1_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUS1", "role": "RDATA" }} , 
 	{ "name": "m_axi_BUS1_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RLAST" }} , 
 	{ "name": "m_axi_BUS1_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RID" }} , 
 	{ "name": "m_axi_BUS1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "RUSER" }} , 
 	{ "name": "m_axi_BUS1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "RRESP" }} , 
 	{ "name": "m_axi_BUS1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "BVALID" }} , 
 	{ "name": "m_axi_BUS1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "BREADY" }} , 
 	{ "name": "m_axi_BUS1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUS1", "role": "BRESP" }} , 
 	{ "name": "m_axi_BUS1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "BID" }} , 
 	{ "name": "m_axi_BUS1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUS1", "role": "BUSER" }} , 
 	{ "name": "internal_bram_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "internal_bram", "role": "Addr_A" }} , 
 	{ "name": "internal_bram_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "internal_bram", "role": "EN_A" }} , 
 	{ "name": "internal_bram_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "internal_bram", "role": "WEN_A" }} , 
 	{ "name": "internal_bram_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "internal_bram", "role": "Din_A" }} , 
 	{ "name": "internal_bram_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "internal_bram", "role": "Dout_A" }} , 
 	{ "name": "internal_bram_Clk_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "internal_bram", "role": "Clk_A" }} , 
 	{ "name": "internal_bram_Rst_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "internal_bram", "role": "Rst_A" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "5", "6", "7"],
		"CDFG" : "read_romcode",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "1036",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BUS0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "BUS0_blk_n_AR", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_read_romcode_Pipeline_VITIS_LOOP_41_1_fu_120", "Port" : "BUS0", "Inst_start_state" : "17", "Inst_end_state" : "18"}]},
			{"Name" : "BUS1", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "BUS1_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "BUS1_blk_n_B", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_read_romcode_Pipeline_VITIS_LOOP_47_2_fu_111", "Port" : "BUS1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "romcode", "Type" : "None", "Direction" : "I"},
			{"Name" : "internal_bram", "Type" : "Bram", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_read_romcode_Pipeline_VITIS_LOOP_41_1_fu_120", "Port" : "internal_bram", "Inst_start_state" : "17", "Inst_end_state" : "18"},
					{"ID" : "1", "SubInstance" : "grp_read_romcode_Pipeline_VITIS_LOOP_47_2_fu_111", "Port" : "internal_bram", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "romcode_to_PS", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmd", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_read_romcode_Pipeline_VITIS_LOOP_47_2_fu_111", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "read_romcode_Pipeline_VITIS_LOOP_47_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1027", "EstimateLatencyMax" : "1027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BUS1", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "BUS1_blk_n_W", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln47", "Type" : "None", "Direction" : "I"},
			{"Name" : "internal_bram", "Type" : "Bram", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_47_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_read_romcode_Pipeline_VITIS_LOOP_47_2_fu_111.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_read_romcode_Pipeline_VITIS_LOOP_41_1_fu_120", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "read_romcode_Pipeline_VITIS_LOOP_41_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1027", "EstimateLatencyMax" : "1027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BUS0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "BUS0_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln41", "Type" : "None", "Direction" : "I"},
			{"Name" : "internal_bram", "Type" : "Bram", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_41_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_read_romcode_Pipeline_VITIS_LOOP_41_1_fu_120.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BUS0_m_axi_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BUS1_m_axi_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	read_romcode {
		BUS0 {Type I LastRead 1 FirstWrite -1}
		BUS1 {Type O LastRead 4 FirstWrite 2}
		romcode {Type I LastRead 0 FirstWrite -1}
		internal_bram {Type IO LastRead 0 FirstWrite -1}
		romcode_to_PS {Type I LastRead 0 FirstWrite -1}
		cmd {Type I LastRead 0 FirstWrite -1}}
	read_romcode_Pipeline_VITIS_LOOP_47_2 {
		BUS1 {Type O LastRead -1 FirstWrite 2}
		sext_ln47 {Type I LastRead 0 FirstWrite -1}
		internal_bram {Type I LastRead 0 FirstWrite -1}}
	read_romcode_Pipeline_VITIS_LOOP_41_1 {
		BUS0 {Type I LastRead 1 FirstWrite -1}
		sext_ln41 {Type I LastRead 0 FirstWrite -1}
		internal_bram {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "1036"}
	, {"Name" : "Interval", "Min" : "3", "Max" : "1037"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	BUS0 { m_axi {  { m_axi_BUS0_AWVALID VALID 1 1 }  { m_axi_BUS0_AWREADY READY 0 1 }  { m_axi_BUS0_AWADDR ADDR 1 64 }  { m_axi_BUS0_AWID ID 1 1 }  { m_axi_BUS0_AWLEN SIZE 1 8 }  { m_axi_BUS0_AWSIZE BURST 1 3 }  { m_axi_BUS0_AWBURST LOCK 1 2 }  { m_axi_BUS0_AWLOCK CACHE 1 2 }  { m_axi_BUS0_AWCACHE PROT 1 4 }  { m_axi_BUS0_AWPROT QOS 1 3 }  { m_axi_BUS0_AWQOS REGION 1 4 }  { m_axi_BUS0_AWREGION USER 1 4 }  { m_axi_BUS0_AWUSER DATA 1 1 }  { m_axi_BUS0_WVALID VALID 1 1 }  { m_axi_BUS0_WREADY READY 0 1 }  { m_axi_BUS0_WDATA FIFONUM 1 32 }  { m_axi_BUS0_WSTRB STRB 1 4 }  { m_axi_BUS0_WLAST LAST 1 1 }  { m_axi_BUS0_WID ID 1 1 }  { m_axi_BUS0_WUSER DATA 1 1 }  { m_axi_BUS0_ARVALID VALID 1 1 }  { m_axi_BUS0_ARREADY READY 0 1 }  { m_axi_BUS0_ARADDR ADDR 1 64 }  { m_axi_BUS0_ARID ID 1 1 }  { m_axi_BUS0_ARLEN SIZE 1 8 }  { m_axi_BUS0_ARSIZE BURST 1 3 }  { m_axi_BUS0_ARBURST LOCK 1 2 }  { m_axi_BUS0_ARLOCK CACHE 1 2 }  { m_axi_BUS0_ARCACHE PROT 1 4 }  { m_axi_BUS0_ARPROT QOS 1 3 }  { m_axi_BUS0_ARQOS REGION 1 4 }  { m_axi_BUS0_ARREGION USER 1 4 }  { m_axi_BUS0_ARUSER DATA 1 1 }  { m_axi_BUS0_RVALID VALID 0 1 }  { m_axi_BUS0_RREADY READY 1 1 }  { m_axi_BUS0_RDATA FIFONUM 0 32 }  { m_axi_BUS0_RLAST LAST 0 1 }  { m_axi_BUS0_RID ID 0 1 }  { m_axi_BUS0_RUSER DATA 0 1 }  { m_axi_BUS0_RRESP RESP 0 2 }  { m_axi_BUS0_BVALID VALID 0 1 }  { m_axi_BUS0_BREADY READY 1 1 }  { m_axi_BUS0_BRESP RESP 0 2 }  { m_axi_BUS0_BID ID 0 1 }  { m_axi_BUS0_BUSER DATA 0 1 } } }
	BUS1 { m_axi {  { m_axi_BUS1_AWVALID VALID 1 1 }  { m_axi_BUS1_AWREADY READY 0 1 }  { m_axi_BUS1_AWADDR ADDR 1 64 }  { m_axi_BUS1_AWID ID 1 1 }  { m_axi_BUS1_AWLEN SIZE 1 8 }  { m_axi_BUS1_AWSIZE BURST 1 3 }  { m_axi_BUS1_AWBURST LOCK 1 2 }  { m_axi_BUS1_AWLOCK CACHE 1 2 }  { m_axi_BUS1_AWCACHE PROT 1 4 }  { m_axi_BUS1_AWPROT QOS 1 3 }  { m_axi_BUS1_AWQOS REGION 1 4 }  { m_axi_BUS1_AWREGION USER 1 4 }  { m_axi_BUS1_AWUSER DATA 1 1 }  { m_axi_BUS1_WVALID VALID 1 1 }  { m_axi_BUS1_WREADY READY 0 1 }  { m_axi_BUS1_WDATA FIFONUM 1 32 }  { m_axi_BUS1_WSTRB STRB 1 4 }  { m_axi_BUS1_WLAST LAST 1 1 }  { m_axi_BUS1_WID ID 1 1 }  { m_axi_BUS1_WUSER DATA 1 1 }  { m_axi_BUS1_ARVALID VALID 1 1 }  { m_axi_BUS1_ARREADY READY 0 1 }  { m_axi_BUS1_ARADDR ADDR 1 64 }  { m_axi_BUS1_ARID ID 1 1 }  { m_axi_BUS1_ARLEN SIZE 1 8 }  { m_axi_BUS1_ARSIZE BURST 1 3 }  { m_axi_BUS1_ARBURST LOCK 1 2 }  { m_axi_BUS1_ARLOCK CACHE 1 2 }  { m_axi_BUS1_ARCACHE PROT 1 4 }  { m_axi_BUS1_ARPROT QOS 1 3 }  { m_axi_BUS1_ARQOS REGION 1 4 }  { m_axi_BUS1_ARREGION USER 1 4 }  { m_axi_BUS1_ARUSER DATA 1 1 }  { m_axi_BUS1_RVALID VALID 0 1 }  { m_axi_BUS1_RREADY READY 1 1 }  { m_axi_BUS1_RDATA FIFONUM 0 32 }  { m_axi_BUS1_RLAST LAST 0 1 }  { m_axi_BUS1_RID ID 0 1 }  { m_axi_BUS1_RUSER DATA 0 1 }  { m_axi_BUS1_RRESP RESP 0 2 }  { m_axi_BUS1_BVALID VALID 0 1 }  { m_axi_BUS1_BREADY READY 1 1 }  { m_axi_BUS1_BRESP RESP 0 2 }  { m_axi_BUS1_BID ID 0 1 }  { m_axi_BUS1_BUSER DATA 0 1 } } }
	internal_bram { bram {  { internal_bram_Addr_A MemPortADDR2 1 32 }  { internal_bram_EN_A MemPortCE2 1 1 }  { internal_bram_WEN_A MemPortWE2 1 4 }  { internal_bram_Din_A MemPortDIN2 1 32 }  { internal_bram_Dout_A MemPortDOUT2 0 32 }  { internal_bram_Clk_A mem_clk 1 1 }  { internal_bram_Rst_A mem_rst 1 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict BUS0 {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 64 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict BUS1 {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 64 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE WRITE_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ BUS0 1 }
	{ BUS1 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ BUS0 1 }
	{ BUS1 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
