set moduleName streamtoparallelwithburst
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
set C_modelName {streamtoparallelwithburst}
set C_modelType { void 0 }
set C_modelArgList {
	{ inbuf int 33 regular {fifo 0 volatile }  }
	{ incount47 int 32 regular {fifo 0 volatile }  }
	{ in_en_clrsts int 1 regular {fifo 0}  }
	{ s2m_buf_sts int 1 regular {pointer 1}  }
	{ sts_clear int 1 regular {fifo 0}  }
	{ in_s2m_len int 32 regular {fifo 0}  }
	{ gmem0 int 32 regular {axi_master 1}  }
	{ out_memory int 64 regular {fifo 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "inbuf", "interface" : "fifo", "bitwidth" : 33, "direction" : "READONLY"} , 
 	{ "Name" : "incount47", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "in_en_clrsts", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s2m_buf_sts", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sts_clear", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "in_s2m_len", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "gmem0", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "s2mbuf","offset": { "type": "dynamic","port_name": "s2mbuf","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "out_memory", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 85
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ inbuf_dout sc_in sc_lv 33 signal 0 } 
	{ inbuf_num_data_valid sc_in sc_lv 8 signal 0 } 
	{ inbuf_fifo_cap sc_in sc_lv 8 signal 0 } 
	{ inbuf_empty_n sc_in sc_logic 1 signal 0 } 
	{ inbuf_read sc_out sc_logic 1 signal 0 } 
	{ incount47_dout sc_in sc_lv 32 signal 1 } 
	{ incount47_num_data_valid sc_in sc_lv 4 signal 1 } 
	{ incount47_fifo_cap sc_in sc_lv 4 signal 1 } 
	{ incount47_empty_n sc_in sc_logic 1 signal 1 } 
	{ incount47_read sc_out sc_logic 1 signal 1 } 
	{ in_en_clrsts_dout sc_in sc_lv 1 signal 2 } 
	{ in_en_clrsts_num_data_valid sc_in sc_lv 2 signal 2 } 
	{ in_en_clrsts_fifo_cap sc_in sc_lv 2 signal 2 } 
	{ in_en_clrsts_empty_n sc_in sc_logic 1 signal 2 } 
	{ in_en_clrsts_read sc_out sc_logic 1 signal 2 } 
	{ s2m_buf_sts sc_out sc_lv 1 signal 3 } 
	{ s2m_buf_sts_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ sts_clear_dout sc_in sc_lv 1 signal 4 } 
	{ sts_clear_num_data_valid sc_in sc_lv 3 signal 4 } 
	{ sts_clear_fifo_cap sc_in sc_lv 3 signal 4 } 
	{ sts_clear_empty_n sc_in sc_logic 1 signal 4 } 
	{ sts_clear_read sc_out sc_logic 1 signal 4 } 
	{ in_s2m_len_dout sc_in sc_lv 32 signal 5 } 
	{ in_s2m_len_num_data_valid sc_in sc_lv 2 signal 5 } 
	{ in_s2m_len_fifo_cap sc_in sc_lv 2 signal 5 } 
	{ in_s2m_len_empty_n sc_in sc_logic 1 signal 5 } 
	{ in_s2m_len_read sc_out sc_logic 1 signal 5 } 
	{ m_axi_gmem0_AWVALID sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem0_AWREADY sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem0_AWADDR sc_out sc_lv 64 signal 6 } 
	{ m_axi_gmem0_AWID sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem0_AWLEN sc_out sc_lv 32 signal 6 } 
	{ m_axi_gmem0_AWSIZE sc_out sc_lv 3 signal 6 } 
	{ m_axi_gmem0_AWBURST sc_out sc_lv 2 signal 6 } 
	{ m_axi_gmem0_AWLOCK sc_out sc_lv 2 signal 6 } 
	{ m_axi_gmem0_AWCACHE sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem0_AWPROT sc_out sc_lv 3 signal 6 } 
	{ m_axi_gmem0_AWQOS sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem0_AWREGION sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem0_AWUSER sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem0_WVALID sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem0_WREADY sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem0_WDATA sc_out sc_lv 32 signal 6 } 
	{ m_axi_gmem0_WSTRB sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem0_WLAST sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem0_WID sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem0_WUSER sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem0_ARVALID sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem0_ARREADY sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem0_ARADDR sc_out sc_lv 64 signal 6 } 
	{ m_axi_gmem0_ARID sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem0_ARLEN sc_out sc_lv 32 signal 6 } 
	{ m_axi_gmem0_ARSIZE sc_out sc_lv 3 signal 6 } 
	{ m_axi_gmem0_ARBURST sc_out sc_lv 2 signal 6 } 
	{ m_axi_gmem0_ARLOCK sc_out sc_lv 2 signal 6 } 
	{ m_axi_gmem0_ARCACHE sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem0_ARPROT sc_out sc_lv 3 signal 6 } 
	{ m_axi_gmem0_ARQOS sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem0_ARREGION sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem0_ARUSER sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem0_RVALID sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem0_RREADY sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem0_RDATA sc_in sc_lv 32 signal 6 } 
	{ m_axi_gmem0_RLAST sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem0_RID sc_in sc_lv 1 signal 6 } 
	{ m_axi_gmem0_RFIFONUM sc_in sc_lv 9 signal 6 } 
	{ m_axi_gmem0_RUSER sc_in sc_lv 1 signal 6 } 
	{ m_axi_gmem0_RRESP sc_in sc_lv 2 signal 6 } 
	{ m_axi_gmem0_BVALID sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem0_BREADY sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem0_BRESP sc_in sc_lv 2 signal 6 } 
	{ m_axi_gmem0_BID sc_in sc_lv 1 signal 6 } 
	{ m_axi_gmem0_BUSER sc_in sc_lv 1 signal 6 } 
	{ out_memory_dout sc_in sc_lv 64 signal 7 } 
	{ out_memory_num_data_valid sc_in sc_lv 3 signal 7 } 
	{ out_memory_fifo_cap sc_in sc_lv 3 signal 7 } 
	{ out_memory_empty_n sc_in sc_logic 1 signal 7 } 
	{ out_memory_read sc_out sc_logic 1 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "inbuf_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":33, "type": "signal", "bundle":{"name": "inbuf", "role": "dout" }} , 
 	{ "name": "inbuf_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inbuf", "role": "num_data_valid" }} , 
 	{ "name": "inbuf_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inbuf", "role": "fifo_cap" }} , 
 	{ "name": "inbuf_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inbuf", "role": "empty_n" }} , 
 	{ "name": "inbuf_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inbuf", "role": "read" }} , 
 	{ "name": "incount47_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "incount47", "role": "dout" }} , 
 	{ "name": "incount47_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "incount47", "role": "num_data_valid" }} , 
 	{ "name": "incount47_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "incount47", "role": "fifo_cap" }} , 
 	{ "name": "incount47_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "incount47", "role": "empty_n" }} , 
 	{ "name": "incount47_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "incount47", "role": "read" }} , 
 	{ "name": "in_en_clrsts_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_en_clrsts", "role": "dout" }} , 
 	{ "name": "in_en_clrsts_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in_en_clrsts", "role": "num_data_valid" }} , 
 	{ "name": "in_en_clrsts_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in_en_clrsts", "role": "fifo_cap" }} , 
 	{ "name": "in_en_clrsts_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_en_clrsts", "role": "empty_n" }} , 
 	{ "name": "in_en_clrsts_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_en_clrsts", "role": "read" }} , 
 	{ "name": "s2m_buf_sts", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s2m_buf_sts", "role": "default" }} , 
 	{ "name": "s2m_buf_sts_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "s2m_buf_sts", "role": "ap_vld" }} , 
 	{ "name": "sts_clear_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "sts_clear", "role": "dout" }} , 
 	{ "name": "sts_clear_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "sts_clear", "role": "num_data_valid" }} , 
 	{ "name": "sts_clear_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "sts_clear", "role": "fifo_cap" }} , 
 	{ "name": "sts_clear_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sts_clear", "role": "empty_n" }} , 
 	{ "name": "sts_clear_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sts_clear", "role": "read" }} , 
 	{ "name": "in_s2m_len_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_s2m_len", "role": "dout" }} , 
 	{ "name": "in_s2m_len_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in_s2m_len", "role": "num_data_valid" }} , 
 	{ "name": "in_s2m_len_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in_s2m_len", "role": "fifo_cap" }} , 
 	{ "name": "in_s2m_len_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_s2m_len", "role": "empty_n" }} , 
 	{ "name": "in_s2m_len_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_s2m_len", "role": "read" }} , 
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
 	{ "name": "out_memory_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "out_memory", "role": "dout" }} , 
 	{ "name": "out_memory_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "out_memory", "role": "num_data_valid" }} , 
 	{ "name": "out_memory_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "out_memory", "role": "fifo_cap" }} , 
 	{ "name": "out_memory_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_memory", "role": "empty_n" }} , 
 	{ "name": "out_memory_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_memory", "role": "read" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
		"Port" : [
			{"Name" : "inbuf", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "128", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148", "Port" : "inbuf", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "incount47", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "incount47_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_en_clrsts", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "in_en_clrsts_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s2m_buf_sts", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "sts_clear", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "sts_clear_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_s2m_len", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "in_s2m_len_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem0_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem0_blk_n_B", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148", "Port" : "gmem0", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "out_memory", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "out_memory_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_sts", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "final_s2m_len_V", "Type" : "OVld", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_20_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "21", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state19"], "QuitState" : ["ap_ST_fsm_state19"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state20"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148", "Parent" : "0", "Child" : ["2"],
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
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
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
		inbuf {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	inbuf { ap_fifo {  { inbuf_dout fifo_port_we 0 33 }  { inbuf_num_data_valid fifo_status_num_data_valid 0 8 }  { inbuf_fifo_cap fifo_update 0 8 }  { inbuf_empty_n fifo_status 0 1 }  { inbuf_read fifo_data 1 1 } } }
	incount47 { ap_fifo {  { incount47_dout fifo_port_we 0 32 }  { incount47_num_data_valid fifo_status_num_data_valid 0 4 }  { incount47_fifo_cap fifo_update 0 4 }  { incount47_empty_n fifo_status 0 1 }  { incount47_read fifo_data 1 1 } } }
	in_en_clrsts { ap_fifo {  { in_en_clrsts_dout fifo_port_we 0 1 }  { in_en_clrsts_num_data_valid fifo_status_num_data_valid 0 2 }  { in_en_clrsts_fifo_cap fifo_update 0 2 }  { in_en_clrsts_empty_n fifo_status 0 1 }  { in_en_clrsts_read fifo_data 1 1 } } }
	s2m_buf_sts { ap_vld {  { s2m_buf_sts out_data 1 1 }  { s2m_buf_sts_ap_vld out_vld 1 1 } } }
	sts_clear { ap_fifo {  { sts_clear_dout fifo_port_we 0 1 }  { sts_clear_num_data_valid fifo_status_num_data_valid 0 3 }  { sts_clear_fifo_cap fifo_update 0 3 }  { sts_clear_empty_n fifo_status 0 1 }  { sts_clear_read fifo_data 1 1 } } }
	in_s2m_len { ap_fifo {  { in_s2m_len_dout fifo_port_we 0 32 }  { in_s2m_len_num_data_valid fifo_status_num_data_valid 0 2 }  { in_s2m_len_fifo_cap fifo_update 0 2 }  { in_s2m_len_empty_n fifo_status 0 1 }  { in_s2m_len_read fifo_data 1 1 } } }
	 { m_axi {  { m_axi_gmem0_AWVALID VALID 1 1 }  { m_axi_gmem0_AWREADY READY 0 1 }  { m_axi_gmem0_AWADDR ADDR 1 64 }  { m_axi_gmem0_AWID ID 1 1 }  { m_axi_gmem0_AWLEN SIZE 1 32 }  { m_axi_gmem0_AWSIZE BURST 1 3 }  { m_axi_gmem0_AWBURST LOCK 1 2 }  { m_axi_gmem0_AWLOCK CACHE 1 2 }  { m_axi_gmem0_AWCACHE PROT 1 4 }  { m_axi_gmem0_AWPROT QOS 1 3 }  { m_axi_gmem0_AWQOS REGION 1 4 }  { m_axi_gmem0_AWREGION USER 1 4 }  { m_axi_gmem0_AWUSER DATA 1 1 }  { m_axi_gmem0_WVALID VALID 1 1 }  { m_axi_gmem0_WREADY READY 0 1 }  { m_axi_gmem0_WDATA FIFONUM 1 32 }  { m_axi_gmem0_WSTRB STRB 1 4 }  { m_axi_gmem0_WLAST LAST 1 1 }  { m_axi_gmem0_WID ID 1 1 }  { m_axi_gmem0_WUSER DATA 1 1 }  { m_axi_gmem0_ARVALID VALID 1 1 }  { m_axi_gmem0_ARREADY READY 0 1 }  { m_axi_gmem0_ARADDR ADDR 1 64 }  { m_axi_gmem0_ARID ID 1 1 }  { m_axi_gmem0_ARLEN SIZE 1 32 }  { m_axi_gmem0_ARSIZE BURST 1 3 }  { m_axi_gmem0_ARBURST LOCK 1 2 }  { m_axi_gmem0_ARLOCK CACHE 1 2 }  { m_axi_gmem0_ARCACHE PROT 1 4 }  { m_axi_gmem0_ARPROT QOS 1 3 }  { m_axi_gmem0_ARQOS REGION 1 4 }  { m_axi_gmem0_ARREGION USER 1 4 }  { m_axi_gmem0_ARUSER DATA 1 1 }  { m_axi_gmem0_RVALID VALID 0 1 }  { m_axi_gmem0_RREADY READY 1 1 }  { m_axi_gmem0_RDATA FIFONUM 0 32 }  { m_axi_gmem0_RLAST LAST 0 1 }  { m_axi_gmem0_RID ID 0 1 }  { m_axi_gmem0_RFIFONUM LEN 0 9 }  { m_axi_gmem0_RUSER DATA 0 1 }  { m_axi_gmem0_RRESP RESP 0 2 }  { m_axi_gmem0_BVALID VALID 0 1 }  { m_axi_gmem0_BREADY READY 1 1 }  { m_axi_gmem0_BRESP RESP 0 2 }  { m_axi_gmem0_BID ID 0 1 }  { m_axi_gmem0_BUSER DATA 0 1 } } }
	out_memory { ap_fifo {  { out_memory_dout fifo_port_we 0 64 }  { out_memory_num_data_valid fifo_status_num_data_valid 0 3 }  { out_memory_fifo_cap fifo_update 0 3 }  { out_memory_empty_n fifo_status 0 1 }  { out_memory_read fifo_data 1 1 } } }
}
