# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
a { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 16
	offset_end 27
}
b { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 28
	offset_end 39
}
c { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 40
	offset_end 51
}
a_row { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 52
	offset_end 59
}
a_col { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 60
	offset_end 67
}
b_col { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 68
	offset_end 75
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


