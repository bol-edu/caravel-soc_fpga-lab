set moduleName userdma
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {userdma}
set C_modelType { void 0 }
set C_modelArgList {
	{ gmem0 int 32 regular {axi_master 1}  }
	{ gmem1 int 32 regular {axi_master 0}  }
	{ inStreamTop_V_data_V int 32 regular {axi_s 0 volatile  { inStreamTop Data } }  }
	{ inStreamTop_V_keep_V int 4 regular {axi_s 0 volatile  { inStreamTop Keep } }  }
	{ inStreamTop_V_strb_V int 4 regular {axi_s 0 volatile  { inStreamTop Strb } }  }
	{ inStreamTop_V_user_V int 7 regular {axi_s 0 volatile  { inStreamTop User } }  }
	{ inStreamTop_V_last_V int 1 regular {axi_s 0 volatile  { inStreamTop Last } }  }
	{ s2m_buf_sts int 1 regular {axi_slave 1}  }
	{ s2m_sts_clear uint 1 regular {axi_slave 0}  }
	{ s2m_len int 32 regular {axi_slave 0}  }
	{ s2m_enb_clrsts int 1 regular {axi_slave 0}  }
	{ s2mbuf int 64 regular {axi_slave 0}  }
	{ s2m_err int 1 regular {axi_slave 1}  }
	{ Img_width int 32 regular {axi_slave 0}  }
	{ m2sbuf int 64 regular {axi_slave 0}  }
	{ m2s_buf_sts int 1 regular {axi_slave 1}  }
	{ m2s_sts_clear uint 1 regular {axi_slave 0}  }
	{ m2s_len int 32 regular {axi_slave 0}  }
	{ m2s_enb_clrsts int 1 regular {axi_slave 0}  }
	{ outStreamTop_V_data_V int 32 regular {axi_s 1 volatile  { outStreamTop Data } }  }
	{ outStreamTop_V_keep_V int 4 regular {axi_s 1 volatile  { outStreamTop Keep } }  }
	{ outStreamTop_V_strb_V int 4 regular {axi_s 1 volatile  { outStreamTop Strb } }  }
	{ outStreamTop_V_user_V int 7 regular {axi_s 1 volatile  { outStreamTop User } }  }
	{ outStreamTop_V_last_V int 1 regular {axi_s 1 volatile  { outStreamTop Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "gmem0", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "s2mbuf","offset": { "type": "dynamic","port_name": "s2mbuf","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "gmem1", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "m2sbuf","offset": { "type": "dynamic","port_name": "m2sbuf","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "inStreamTop_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "inStreamTop_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "inStreamTop_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "inStreamTop_V_user_V", "interface" : "axis", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "inStreamTop_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s2m_buf_sts", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 1, "direction" : "WRITEONLY", "offset" : {"out":16}, "offset_end" : {"out":23}} , 
 	{ "Name" : "s2m_sts_clear", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 1, "direction" : "READONLY", "offset" : {"in":32}, "offset_end" : {"in":39}} , 
 	{ "Name" : "s2m_len", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":47}} , 
 	{ "Name" : "s2m_enb_clrsts", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 1, "direction" : "READONLY", "offset" : {"in":48}, "offset_end" : {"in":55}} , 
 	{ "Name" : "s2mbuf", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":56}, "offset_end" : {"in":67}} , 
 	{ "Name" : "s2m_err", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 1, "direction" : "WRITEONLY", "offset" : {"out":68}, "offset_end" : {"out":75}} , 
 	{ "Name" : "Img_width", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":84}, "offset_end" : {"in":91}} , 
 	{ "Name" : "m2sbuf", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":92}, "offset_end" : {"in":103}} , 
 	{ "Name" : "m2s_buf_sts", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 1, "direction" : "WRITEONLY", "offset" : {"out":104}, "offset_end" : {"out":111}} , 
 	{ "Name" : "m2s_sts_clear", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 1, "direction" : "READONLY", "offset" : {"in":120}, "offset_end" : {"in":127}} , 
 	{ "Name" : "m2s_len", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":128}, "offset_end" : {"in":135}} , 
 	{ "Name" : "m2s_enb_clrsts", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 1, "direction" : "READONLY", "offset" : {"in":136}, "offset_end" : {"in":143}} , 
 	{ "Name" : "outStreamTop_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "outStreamTop_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "outStreamTop_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "outStreamTop_V_user_V", "interface" : "axis", "bitwidth" : 7, "direction" : "WRITEONLY"} , 
 	{ "Name" : "outStreamTop_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 124
set portList { 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 8 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 8 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
	{ m_axi_gmem0_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem0_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_AWLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_gmem0_ARLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_gmem0_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem0_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem0_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem0_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem0_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem1_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem1_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem1_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem1_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem1_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_gmem1_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem1_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem1_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem1_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem1_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem1_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem1_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem1_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem1_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem1_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem1_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_gmem1_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem1_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem1_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem1_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem1_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem1_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem1_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem1_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem1_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_gmem1_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem1_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem1_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem1_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem1_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem1_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem1_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem1_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem1_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem1_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem1_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_gmem1_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem1_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem1_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem1_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem1_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem1_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem1_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem1_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem1_BUSER sc_in sc_lv 1 signal 1 } 
	{ inStreamTop_TDATA sc_in sc_lv 32 signal 2 } 
	{ inStreamTop_TKEEP sc_in sc_lv 4 signal 3 } 
	{ inStreamTop_TSTRB sc_in sc_lv 4 signal 4 } 
	{ inStreamTop_TUSER sc_in sc_lv 7 signal 5 } 
	{ inStreamTop_TLAST sc_in sc_lv 1 signal 6 } 
	{ outStreamTop_TDATA sc_out sc_lv 32 signal 19 } 
	{ outStreamTop_TKEEP sc_out sc_lv 4 signal 20 } 
	{ outStreamTop_TSTRB sc_out sc_lv 4 signal 21 } 
	{ outStreamTop_TUSER sc_out sc_lv 7 signal 22 } 
	{ outStreamTop_TLAST sc_out sc_lv 1 signal 23 } 
	{ inStreamTop_TVALID sc_in sc_logic 1 invld 6 } 
	{ inStreamTop_TREADY sc_out sc_logic 1 inacc 6 } 
	{ outStreamTop_TVALID sc_out sc_logic 1 outvld 23 } 
	{ outStreamTop_TREADY sc_in sc_logic 1 outacc 23 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"userdma","role":"start","value":"0","valid_bit":"0"},{"name":"userdma","role":"continue","value":"0","valid_bit":"4"},{"name":"userdma","role":"auto_start","value":"0","valid_bit":"7"},{"name":"s2m_sts_clear","role":"data","value":"32"},{"name":"s2m_len","role":"data","value":"40"},{"name":"s2m_enb_clrsts","role":"data","value":"48"},{"name":"s2mbuf","role":"data","value":"56"},{"name":"Img_width","role":"data","value":"84"},{"name":"m2sbuf","role":"data","value":"92"},{"name":"m2s_sts_clear","role":"data","value":"120"},{"name":"m2s_len","role":"data","value":"128"},{"name":"m2s_enb_clrsts","role":"data","value":"136"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"userdma","role":"start","value":"0","valid_bit":"0"},{"name":"userdma","role":"done","value":"0","valid_bit":"1"},{"name":"userdma","role":"idle","value":"0","valid_bit":"2"},{"name":"userdma","role":"ready","value":"0","valid_bit":"3"},{"name":"userdma","role":"auto_start","value":"0","valid_bit":"7"},{"name":"s2m_buf_sts","role":"data","value":"16"}, {"name":"s2m_buf_sts","role":"valid","value":"20","valid_bit":"0"},{"name":"s2m_err","role":"data","value":"68"}, {"name":"s2m_err","role":"valid","value":"72","valid_bit":"0"},{"name":"m2s_buf_sts","role":"data","value":"104"}, {"name":"m2s_buf_sts","role":"valid","value":"108","valid_bit":"0"}] },
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
 	{ "name": "m_axi_gmem0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem0", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem0", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_gmem0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem0", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_gmem0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BID" }} , 
 	{ "name": "m_axi_gmem0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BUSER" }} , 
 	{ "name": "m_axi_gmem1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem1", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_gmem1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem1", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_gmem1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "BID" }} , 
 	{ "name": "m_axi_gmem1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "BUSER" }} , 
 	{ "name": "inStreamTop_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inStreamTop_V_data_V", "role": "default" }} , 
 	{ "name": "inStreamTop_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "inStreamTop_V_keep_V", "role": "default" }} , 
 	{ "name": "inStreamTop_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "inStreamTop_V_strb_V", "role": "default" }} , 
 	{ "name": "inStreamTop_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "inStreamTop_V_user_V", "role": "default" }} , 
 	{ "name": "inStreamTop_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "inStreamTop_V_last_V", "role": "default" }} , 
 	{ "name": "outStreamTop_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "outStreamTop_V_data_V", "role": "default" }} , 
 	{ "name": "outStreamTop_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "outStreamTop_V_keep_V", "role": "default" }} , 
 	{ "name": "outStreamTop_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "outStreamTop_V_strb_V", "role": "default" }} , 
 	{ "name": "outStreamTop_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "outStreamTop_V_user_V", "role": "default" }} , 
 	{ "name": "outStreamTop_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "outStreamTop_V_last_V", "role": "default" }} , 
 	{ "name": "inStreamTop_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "inStreamTop_V_last_V", "role": "default" }} , 
 	{ "name": "inStreamTop_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "inStreamTop_V_last_V", "role": "default" }} , 
 	{ "name": "outStreamTop_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "outStreamTop_V_last_V", "role": "default" }} , 
 	{ "name": "outStreamTop_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "outStreamTop_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "13", "16", "19", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37"],
		"CDFG" : "userdma",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "4", "Name" : "entry_proc_U0"},
			{"ID" : "5", "Name" : "getinstream_U0"},
			{"ID" : "16", "Name" : "paralleltostreamwithburst_U0"}],
		"OutputProcess" : [
			{"ID" : "5", "Name" : "getinstream_U0"},
			{"ID" : "13", "Name" : "streamtoparallelwithburst_U0"},
			{"ID" : "19", "Name" : "sendoutstream_U0"}],
		"Port" : [
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "streamtoparallelwithburst_U0", "Port" : "gmem0"}]},
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "paralleltostreamwithburst_U0", "Port" : "gmem1"}]},
			{"Name" : "inStreamTop_V_data_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "getinstream_U0", "Port" : "inStreamTop_V_data_V"}]},
			{"Name" : "inStreamTop_V_keep_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "getinstream_U0", "Port" : "inStreamTop_V_keep_V"}]},
			{"Name" : "inStreamTop_V_strb_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "getinstream_U0", "Port" : "inStreamTop_V_strb_V"}]},
			{"Name" : "inStreamTop_V_user_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "getinstream_U0", "Port" : "inStreamTop_V_user_V"}]},
			{"Name" : "inStreamTop_V_last_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "getinstream_U0", "Port" : "inStreamTop_V_last_V"}]},
			{"Name" : "s2m_buf_sts", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "streamtoparallelwithburst_U0", "Port" : "s2m_buf_sts"}]},
			{"Name" : "s2m_sts_clear", "Type" : "None", "Direction" : "I"},
			{"Name" : "s2m_len", "Type" : "None", "Direction" : "I"},
			{"Name" : "s2m_enb_clrsts", "Type" : "None", "Direction" : "I"},
			{"Name" : "s2mbuf", "Type" : "None", "Direction" : "I"},
			{"Name" : "s2m_err", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "getinstream_U0", "Port" : "s2m_err"}]},
			{"Name" : "Img_width", "Type" : "None", "Direction" : "I"},
			{"Name" : "m2sbuf", "Type" : "None", "Direction" : "I"},
			{"Name" : "m2s_buf_sts", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "sendoutstream_U0", "Port" : "m2s_buf_sts"}]},
			{"Name" : "m2s_sts_clear", "Type" : "None", "Direction" : "I"},
			{"Name" : "m2s_len", "Type" : "None", "Direction" : "I"},
			{"Name" : "m2s_enb_clrsts", "Type" : "None", "Direction" : "I"},
			{"Name" : "outStreamTop_V_data_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "sendoutstream_U0", "Port" : "outStreamTop_V_data_V"}]},
			{"Name" : "outStreamTop_V_keep_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "sendoutstream_U0", "Port" : "outStreamTop_V_keep_V"}]},
			{"Name" : "outStreamTop_V_strb_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "sendoutstream_U0", "Port" : "outStreamTop_V_strb_V"}]},
			{"Name" : "outStreamTop_V_user_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "sendoutstream_U0", "Port" : "outStreamTop_V_user_V"}]},
			{"Name" : "outStreamTop_V_last_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "sendoutstream_U0", "Port" : "outStreamTop_V_last_V"}]},
			{"Name" : "in_len_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "getinstream_U0", "Port" : "in_len_V"}]},
			{"Name" : "width_count", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "getinstream_U0", "Port" : "width_count"}]},
			{"Name" : "out_sts", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "streamtoparallelwithburst_U0", "Port" : "out_sts"}]},
			{"Name" : "final_s2m_len_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "streamtoparallelwithburst_U0", "Port" : "final_s2m_len_V"}]},
			{"Name" : "first", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "paralleltostreamwithburst_U0", "Port" : "first"}]},
			{"Name" : "m2s_len_r", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "paralleltostreamwithburst_U0", "Port" : "m2s_len"}]},
			{"Name" : "Img_width_count", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "paralleltostreamwithburst_U0", "Port" : "Img_width_count"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.gmem0_m_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.gmem1_m_axi_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.entry_proc_U0", "Parent" : "0",
		"CDFG" : "entry_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s2m_sts_clear", "Type" : "None", "Direction" : "I"},
			{"Name" : "s2m_sts_clear_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["13"], "DependentChan" : "26", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "s2m_sts_clear_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s2mbuf", "Type" : "None", "Direction" : "I"},
			{"Name" : "s2mbuf_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["13"], "DependentChan" : "27", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "s2mbuf_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "m2s_sts_clear", "Type" : "None", "Direction" : "I"},
			{"Name" : "m2s_sts_clear_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["19"], "DependentChan" : "28", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "m2s_sts_clear_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.getinstream_U0", "Parent" : "0", "Child" : ["6", "8", "9", "10", "11", "12"],
		"CDFG" : "getinstream",
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
			{"Name" : "inStreamTop_V_data_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132", "Port" : "inStreamTop_V_data_V", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "inStreamTop_V_keep_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132", "Port" : "inStreamTop_V_keep_V", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "inStreamTop_V_strb_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132", "Port" : "inStreamTop_V_strb_V", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "inStreamTop_V_user_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132", "Port" : "inStreamTop_V_user_V", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "inStreamTop_V_last_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132", "Port" : "inStreamTop_V_last_V", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "in_en_clrsts", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_s2m_len", "Type" : "None", "Direction" : "I"},
			{"Name" : "s2m_err", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "in_Img_width", "Type" : "None", "Direction" : "I"},
			{"Name" : "inbuf", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["13"], "DependentChan" : "29", "DependentChanDepth" : "128", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132", "Port" : "inbuf", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "incount47", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["13"], "DependentChan" : "30", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132", "Port" : "incount47", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "s2m_len_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["13"], "DependentChan" : "31", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "s2m_len_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s2m_enb_clrsts_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["13"], "DependentChan" : "32", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "s2m_enb_clrsts_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_len_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "width_count", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132", "Port" : "width_count", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.getinstream_U0.grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132", "Parent" : "5", "Child" : ["7"],
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
	{"ID" : "7", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.getinstream_U0.grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132.flow_control_loop_pipe_sequential_init_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.getinstream_U0.regslice_both_inStreamTop_V_data_V_U", "Parent" : "5"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.getinstream_U0.regslice_both_inStreamTop_V_keep_V_U", "Parent" : "5"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.getinstream_U0.regslice_both_inStreamTop_V_strb_V_U", "Parent" : "5"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.getinstream_U0.regslice_both_inStreamTop_V_user_V_U", "Parent" : "5"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.getinstream_U0.regslice_both_inStreamTop_V_last_V_U", "Parent" : "5"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.streamtoparallelwithburst_U0", "Parent" : "0", "Child" : ["14"],
		"CDFG" : "streamtoparallelwithburst",
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
		"StartSource" : "4",
		"StartFifo" : "start_for_streamtoparallelwithburst_U0_U",
		"Port" : [
			{"Name" : "inbuf", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["5"], "DependentChan" : "29", "DependentChanDepth" : "128", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148", "Port" : "inbuf", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "incount47", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["5"], "DependentChan" : "30", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "incount47_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_en_clrsts", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["5"], "DependentChan" : "32", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "in_en_clrsts_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s2m_buf_sts", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "sts_clear", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["4"], "DependentChan" : "26", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "sts_clear_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_s2m_len", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["5"], "DependentChan" : "31", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "in_s2m_len_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem0_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem0_blk_n_B", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "14", "SubInstance" : "grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148", "Port" : "gmem0", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "out_memory", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["4"], "DependentChan" : "27", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "out_memory_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_sts", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "final_s2m_len_V", "Type" : "OVld", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_20_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "21", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state19"], "QuitState" : ["ap_ST_fsm_state19"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state20"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.streamtoparallelwithburst_U0.grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148", "Parent" : "13", "Child" : ["15"],
		"CDFG" : "streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2",
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
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem0_blk_n_W", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln23", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln23_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "inbuf", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "inbuf_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_23_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "15", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.streamtoparallelwithburst_U0.grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148.flow_control_loop_pipe_sequential_init_U", "Parent" : "14"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.paralleltostreamwithburst_U0", "Parent" : "0", "Child" : ["17"],
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
					{"ID" : "17", "SubInstance" : "grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_107_2_fu_173", "Port" : "gmem1", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "in_memory", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_en_clrsts", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_Img_width", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_m2s_len", "Type" : "None", "Direction" : "I"},
			{"Name" : "outbuf", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["19"], "DependentChan" : "33", "DependentChanDepth" : "128", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_107_2_fu_173", "Port" : "outbuf", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "outcount48", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["19"], "DependentChan" : "34", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outcount48_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "m2s_enb_clrsts_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["19"], "DependentChan" : "35", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "m2s_enb_clrsts_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "first", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "m2s_len", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_107_2_fu_173", "Port" : "m2s_len", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "Img_width_count", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_107_2_fu_173", "Port" : "Img_width_count", "Inst_start_state" : "20", "Inst_end_state" : "21"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_99_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "22", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state22"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.paralleltostreamwithburst_U0.grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_107_2_fu_173", "Parent" : "16", "Child" : ["18"],
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
	{"ID" : "18", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.paralleltostreamwithburst_U0.grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_107_2_fu_173.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sendoutstream_U0", "Parent" : "0", "Child" : ["20", "21", "22", "23", "24", "25"],
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
		"StartSource" : "4",
		"StartFifo" : "start_for_sendoutstream_U0_U",
		"Port" : [
			{"Name" : "outbuf", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["16"], "DependentChan" : "33", "DependentChanDepth" : "128", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_sendoutstream_Pipeline_VITIS_LOOP_151_2_fu_101", "Port" : "outbuf", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "outcount48", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["16"], "DependentChan" : "34", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outcount48_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_en_clrsts", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["16"], "DependentChan" : "35", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "in_en_clrsts_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "m2s_buf_sts", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "sts_clear", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["4"], "DependentChan" : "28", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "sts_clear_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "outStreamTop_V_data_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_sendoutstream_Pipeline_VITIS_LOOP_151_2_fu_101", "Port" : "outStreamTop_V_data_V", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "outStreamTop_V_keep_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_sendoutstream_Pipeline_VITIS_LOOP_151_2_fu_101", "Port" : "outStreamTop_V_keep_V", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "outStreamTop_V_strb_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_sendoutstream_Pipeline_VITIS_LOOP_151_2_fu_101", "Port" : "outStreamTop_V_strb_V", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "outStreamTop_V_user_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_sendoutstream_Pipeline_VITIS_LOOP_151_2_fu_101", "Port" : "outStreamTop_V_user_V", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "outStreamTop_V_last_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_sendoutstream_Pipeline_VITIS_LOOP_151_2_fu_101", "Port" : "outStreamTop_V_last_V", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_149_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state5"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.sendoutstream_U0.grp_sendoutstream_Pipeline_VITIS_LOOP_151_2_fu_101", "Parent" : "19",
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
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.sendoutstream_U0.regslice_both_outStreamTop_V_data_V_U", "Parent" : "19"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.sendoutstream_U0.regslice_both_outStreamTop_V_keep_V_U", "Parent" : "19"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.sendoutstream_U0.regslice_both_outStreamTop_V_strb_V_U", "Parent" : "19"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.sendoutstream_U0.regslice_both_outStreamTop_V_user_V_U", "Parent" : "19"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.sendoutstream_U0.regslice_both_outStreamTop_V_last_V_U", "Parent" : "19"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s2m_sts_clear_c_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s2mbuf_c_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m2s_sts_clear_c_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.inbuf_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.incount_U", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s2m_len_c_U", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s2m_enb_clrsts_c_U", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.outbuf_U", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.outcount_U", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m2s_enb_clrsts_c_U", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_streamtoparallelwithburst_U0_U", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_sendoutstream_U0_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	userdma {
		gmem0 {Type O LastRead 5 FirstWrite 2}
		gmem1 {Type I LastRead 2 FirstWrite -1}
		inStreamTop_V_data_V {Type I LastRead 1 FirstWrite -1}
		inStreamTop_V_keep_V {Type I LastRead 1 FirstWrite -1}
		inStreamTop_V_strb_V {Type I LastRead 1 FirstWrite -1}
		inStreamTop_V_user_V {Type I LastRead 1 FirstWrite -1}
		inStreamTop_V_last_V {Type I LastRead 1 FirstWrite -1}
		s2m_buf_sts {Type O LastRead -1 FirstWrite 19}
		s2m_sts_clear {Type I LastRead 1 FirstWrite -1}
		s2m_len {Type I LastRead 1 FirstWrite -1}
		s2m_enb_clrsts {Type I LastRead 1 FirstWrite -1}
		s2mbuf {Type I LastRead 1 FirstWrite -1}
		s2m_err {Type O LastRead -1 FirstWrite 0}
		Img_width {Type I LastRead 1 FirstWrite -1}
		m2sbuf {Type I LastRead 1 FirstWrite -1}
		m2s_buf_sts {Type O LastRead -1 FirstWrite 0}
		m2s_sts_clear {Type I LastRead 1 FirstWrite -1}
		m2s_len {Type I LastRead 1 FirstWrite -1}
		m2s_enb_clrsts {Type I LastRead 1 FirstWrite -1}
		outStreamTop_V_data_V {Type O LastRead -1 FirstWrite 2}
		outStreamTop_V_keep_V {Type O LastRead -1 FirstWrite 2}
		outStreamTop_V_strb_V {Type O LastRead -1 FirstWrite 2}
		outStreamTop_V_user_V {Type O LastRead -1 FirstWrite 2}
		outStreamTop_V_last_V {Type O LastRead -1 FirstWrite 2}
		in_len_V {Type IO LastRead -1 FirstWrite -1}
		width_count {Type IO LastRead -1 FirstWrite -1}
		out_sts {Type IO LastRead -1 FirstWrite -1}
		final_s2m_len_V {Type IO LastRead -1 FirstWrite -1}
		first {Type IO LastRead -1 FirstWrite -1}
		m2s_len_r {Type IO LastRead -1 FirstWrite -1}
		Img_width_count {Type IO LastRead -1 FirstWrite -1}}
	entry_proc {
		s2m_sts_clear {Type I LastRead 0 FirstWrite -1}
		s2m_sts_clear_c {Type O LastRead -1 FirstWrite 0}
		s2mbuf {Type I LastRead 0 FirstWrite -1}
		s2mbuf_c {Type O LastRead -1 FirstWrite 0}
		m2s_sts_clear {Type I LastRead 0 FirstWrite -1}
		m2s_sts_clear_c {Type O LastRead -1 FirstWrite 0}}
	getinstream {
		inStreamTop_V_data_V {Type I LastRead 1 FirstWrite -1}
		inStreamTop_V_keep_V {Type I LastRead 1 FirstWrite -1}
		inStreamTop_V_strb_V {Type I LastRead 1 FirstWrite -1}
		inStreamTop_V_user_V {Type I LastRead 1 FirstWrite -1}
		inStreamTop_V_last_V {Type I LastRead 1 FirstWrite -1}
		in_en_clrsts {Type I LastRead 0 FirstWrite -1}
		in_s2m_len {Type I LastRead 0 FirstWrite -1}
		s2m_err {Type O LastRead -1 FirstWrite 0}
		in_Img_width {Type I LastRead 0 FirstWrite -1}
		inbuf {Type O LastRead -1 FirstWrite 1}
		incount47 {Type O LastRead -1 FirstWrite 2}
		s2m_len_c {Type O LastRead -1 FirstWrite 0}
		s2m_enb_clrsts_c {Type O LastRead -1 FirstWrite 0}
		in_len_V {Type IO LastRead -1 FirstWrite -1}
		width_count {Type IO LastRead -1 FirstWrite -1}}
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
		width_count {Type IO LastRead -1 FirstWrite -1}}
	streamtoparallelwithburst {
		inbuf {Type I LastRead 1 FirstWrite -1}
		incount47 {Type I LastRead 1 FirstWrite -1}
		in_en_clrsts {Type I LastRead 0 FirstWrite -1}
		s2m_buf_sts {Type O LastRead -1 FirstWrite 19}
		sts_clear {Type I LastRead 0 FirstWrite -1}
		in_s2m_len {Type I LastRead 0 FirstWrite -1}
		gmem0 {Type O LastRead 5 FirstWrite 2}
		out_memory {Type I LastRead 0 FirstWrite -1}
		out_sts {Type IO LastRead -1 FirstWrite -1}
		final_s2m_len_V {Type IO LastRead -1 FirstWrite -1}}
	streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2 {
		gmem0 {Type O LastRead -1 FirstWrite 2}
		sext_ln23 {Type I LastRead 0 FirstWrite -1}
		trunc_ln23_1 {Type I LastRead 0 FirstWrite -1}
		inbuf {Type I LastRead 1 FirstWrite -1}}
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
		Img_width_count {Type IO LastRead -1 FirstWrite -1}}
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
	gmem0 { m_axi {  { m_axi_gmem0_AWVALID VALID 1 1 }  { m_axi_gmem0_AWREADY READY 0 1 }  { m_axi_gmem0_AWADDR ADDR 1 64 }  { m_axi_gmem0_AWID ID 1 1 }  { m_axi_gmem0_AWLEN SIZE 1 8 }  { m_axi_gmem0_AWSIZE BURST 1 3 }  { m_axi_gmem0_AWBURST LOCK 1 2 }  { m_axi_gmem0_AWLOCK CACHE 1 2 }  { m_axi_gmem0_AWCACHE PROT 1 4 }  { m_axi_gmem0_AWPROT QOS 1 3 }  { m_axi_gmem0_AWQOS REGION 1 4 }  { m_axi_gmem0_AWREGION USER 1 4 }  { m_axi_gmem0_AWUSER DATA 1 1 }  { m_axi_gmem0_WVALID VALID 1 1 }  { m_axi_gmem0_WREADY READY 0 1 }  { m_axi_gmem0_WDATA FIFONUM 1 32 }  { m_axi_gmem0_WSTRB STRB 1 4 }  { m_axi_gmem0_WLAST LAST 1 1 }  { m_axi_gmem0_WID ID 1 1 }  { m_axi_gmem0_WUSER DATA 1 1 }  { m_axi_gmem0_ARVALID VALID 1 1 }  { m_axi_gmem0_ARREADY READY 0 1 }  { m_axi_gmem0_ARADDR ADDR 1 64 }  { m_axi_gmem0_ARID ID 1 1 }  { m_axi_gmem0_ARLEN SIZE 1 8 }  { m_axi_gmem0_ARSIZE BURST 1 3 }  { m_axi_gmem0_ARBURST LOCK 1 2 }  { m_axi_gmem0_ARLOCK CACHE 1 2 }  { m_axi_gmem0_ARCACHE PROT 1 4 }  { m_axi_gmem0_ARPROT QOS 1 3 }  { m_axi_gmem0_ARQOS REGION 1 4 }  { m_axi_gmem0_ARREGION USER 1 4 }  { m_axi_gmem0_ARUSER DATA 1 1 }  { m_axi_gmem0_RVALID VALID 0 1 }  { m_axi_gmem0_RREADY READY 1 1 }  { m_axi_gmem0_RDATA FIFONUM 0 32 }  { m_axi_gmem0_RLAST LAST 0 1 }  { m_axi_gmem0_RID ID 0 1 }  { m_axi_gmem0_RUSER DATA 0 1 }  { m_axi_gmem0_RRESP RESP 0 2 }  { m_axi_gmem0_BVALID VALID 0 1 }  { m_axi_gmem0_BREADY READY 1 1 }  { m_axi_gmem0_BRESP RESP 0 2 }  { m_axi_gmem0_BID ID 0 1 }  { m_axi_gmem0_BUSER DATA 0 1 } } }
	gmem1 { m_axi {  { m_axi_gmem1_AWVALID VALID 1 1 }  { m_axi_gmem1_AWREADY READY 0 1 }  { m_axi_gmem1_AWADDR ADDR 1 64 }  { m_axi_gmem1_AWID ID 1 1 }  { m_axi_gmem1_AWLEN SIZE 1 8 }  { m_axi_gmem1_AWSIZE BURST 1 3 }  { m_axi_gmem1_AWBURST LOCK 1 2 }  { m_axi_gmem1_AWLOCK CACHE 1 2 }  { m_axi_gmem1_AWCACHE PROT 1 4 }  { m_axi_gmem1_AWPROT QOS 1 3 }  { m_axi_gmem1_AWQOS REGION 1 4 }  { m_axi_gmem1_AWREGION USER 1 4 }  { m_axi_gmem1_AWUSER DATA 1 1 }  { m_axi_gmem1_WVALID VALID 1 1 }  { m_axi_gmem1_WREADY READY 0 1 }  { m_axi_gmem1_WDATA FIFONUM 1 32 }  { m_axi_gmem1_WSTRB STRB 1 4 }  { m_axi_gmem1_WLAST LAST 1 1 }  { m_axi_gmem1_WID ID 1 1 }  { m_axi_gmem1_WUSER DATA 1 1 }  { m_axi_gmem1_ARVALID VALID 1 1 }  { m_axi_gmem1_ARREADY READY 0 1 }  { m_axi_gmem1_ARADDR ADDR 1 64 }  { m_axi_gmem1_ARID ID 1 1 }  { m_axi_gmem1_ARLEN SIZE 1 8 }  { m_axi_gmem1_ARSIZE BURST 1 3 }  { m_axi_gmem1_ARBURST LOCK 1 2 }  { m_axi_gmem1_ARLOCK CACHE 1 2 }  { m_axi_gmem1_ARCACHE PROT 1 4 }  { m_axi_gmem1_ARPROT QOS 1 3 }  { m_axi_gmem1_ARQOS REGION 1 4 }  { m_axi_gmem1_ARREGION USER 1 4 }  { m_axi_gmem1_ARUSER DATA 1 1 }  { m_axi_gmem1_RVALID VALID 0 1 }  { m_axi_gmem1_RREADY READY 1 1 }  { m_axi_gmem1_RDATA FIFONUM 0 32 }  { m_axi_gmem1_RLAST LAST 0 1 }  { m_axi_gmem1_RID ID 0 1 }  { m_axi_gmem1_RUSER DATA 0 1 }  { m_axi_gmem1_RRESP RESP 0 2 }  { m_axi_gmem1_BVALID VALID 0 1 }  { m_axi_gmem1_BREADY READY 1 1 }  { m_axi_gmem1_BRESP RESP 0 2 }  { m_axi_gmem1_BID ID 0 1 }  { m_axi_gmem1_BUSER DATA 0 1 } } }
	inStreamTop_V_data_V { axis {  { inStreamTop_TDATA in_data 0 32 } } }
	inStreamTop_V_keep_V { axis {  { inStreamTop_TKEEP in_data 0 4 } } }
	inStreamTop_V_strb_V { axis {  { inStreamTop_TSTRB in_data 0 4 } } }
	inStreamTop_V_user_V { axis {  { inStreamTop_TUSER in_data 0 7 } } }
	inStreamTop_V_last_V { axis {  { inStreamTop_TLAST in_data 0 1 }  { inStreamTop_TVALID in_vld 0 1 }  { inStreamTop_TREADY in_acc 1 1 } } }
	outStreamTop_V_data_V { axis {  { outStreamTop_TDATA out_data 1 32 } } }
	outStreamTop_V_keep_V { axis {  { outStreamTop_TKEEP out_data 1 4 } } }
	outStreamTop_V_strb_V { axis {  { outStreamTop_TSTRB out_data 1 4 } } }
	outStreamTop_V_user_V { axis {  { outStreamTop_TUSER out_data 1 7 } } }
	outStreamTop_V_last_V { axis {  { outStreamTop_TLAST out_data 1 1 }  { outStreamTop_TVALID out_vld 1 1 }  { outStreamTop_TREADY out_acc 0 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict gmem0 {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 64 READ_WRITE_MODE WRITE_ONLY}
dict set maxi_interface_dict gmem1 {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 64 READ_WRITE_MODE READ_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ gmem0 10 }
	{ gmem1 10 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ gmem0 10 }
	{ gmem1 10 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
