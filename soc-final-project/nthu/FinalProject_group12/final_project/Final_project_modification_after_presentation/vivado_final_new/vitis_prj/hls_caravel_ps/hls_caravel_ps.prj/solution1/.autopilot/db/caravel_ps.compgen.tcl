# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

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


# Native S_AXILite:
if {${::AESL::PGuard_simmodel_gen}} {
	if {[info proc ::AESL_LIB_XILADAPTER::s_axilite_gen] == "::AESL_LIB_XILADAPTER::s_axilite_gen"} {
		eval "::AESL_LIB_XILADAPTER::s_axilite_gen { \
			id 1 \
			corename caravel_ps_control_axilite \
			name caravel_ps_control_s_axi \
			ports {$port_control} \
			op interface \
			interrupt_clear_mode COR \
			interrupt_trigger_type default \
			is_flushable 0 \
			is_datawidth64 0 \
			is_addrwidth64 1 \
		} "
	} else {
		puts "@W \[IMPL-110\] Cannot find AXI Lite interface model in the library. Ignored generation of AXI Lite  interface for 'control'"
	}
}

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler caravel_ps_control_s_axi BINDTYPE interface TYPE interface_s_axilite
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name mprj_in \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_mprj_in \
    op interface \
    ports { mprj_in { O 38 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name mprj_out \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_mprj_out \
    op interface \
    ports { mprj_out { I 38 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name mprj_en \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_mprj_en \
    op interface \
    ports { mprj_en { I 38 vector } } \
} "
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


