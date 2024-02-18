# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
s2m_buf_sts { 
	dir O
	width 1
	depth 1
	mode ap_vld
	offset 16
	offset_end 23
}
s2m_sts_clear { 
	dir I
	width 1
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
s2m_len { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
s2m_enb_clrsts { 
	dir I
	width 1
	depth 1
	mode ap_none
	offset 48
	offset_end 55
}
s2mbuf { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 56
	offset_end 67
}
s2m_err { 
	dir O
	width 1
	depth 1
	mode ap_vld
	offset 68
	offset_end 75
}
Img_width { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 84
	offset_end 91
}
m2sbuf { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 92
	offset_end 103
}
m2s_buf_sts { 
	dir O
	width 1
	depth 1
	mode ap_vld
	offset 104
	offset_end 111
}
m2s_sts_clear { 
	dir I
	width 1
	depth 1
	mode ap_none
	offset 120
	offset_end 127
}
m2s_len { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 128
	offset_end 135
}
m2s_enb_clrsts { 
	dir I
	width 1
	depth 1
	mode ap_none
	offset 136
	offset_end 143
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


