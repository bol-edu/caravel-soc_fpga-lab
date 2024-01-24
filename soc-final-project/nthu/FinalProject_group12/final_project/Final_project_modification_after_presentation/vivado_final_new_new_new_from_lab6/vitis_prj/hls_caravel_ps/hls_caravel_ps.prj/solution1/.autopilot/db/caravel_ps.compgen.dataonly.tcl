# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
ps_mprj_in { 
	dir I
	width 38
	depth 1
	mode ap_none
	offset 16
	offset_end 27
}
ps_mprj_out { 
	dir O
	width 38
	depth 1
	mode ap_vld
	offset 28
	offset_end 39
}
ps_mprj_en { 
	dir O
	width 38
	depth 1
	mode ap_vld
	offset 52
	offset_end 63
}
}
dict set axilite_register_dict control $port_control


