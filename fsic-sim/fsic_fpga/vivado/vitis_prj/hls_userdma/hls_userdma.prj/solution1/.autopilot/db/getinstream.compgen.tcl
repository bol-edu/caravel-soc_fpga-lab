# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 19 \
    name inStreamTop_V_data_V \
    reset_level 1 \
    sync_rst true \
    corename {inStreamTop} \
    metadata {  } \
    op interface \
    ports { inStreamTop_TDATA { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'inStreamTop_V_data_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 20 \
    name inStreamTop_V_keep_V \
    reset_level 1 \
    sync_rst true \
    corename {inStreamTop} \
    metadata {  } \
    op interface \
    ports { inStreamTop_TKEEP { I 4 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'inStreamTop_V_keep_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 21 \
    name inStreamTop_V_strb_V \
    reset_level 1 \
    sync_rst true \
    corename {inStreamTop} \
    metadata {  } \
    op interface \
    ports { inStreamTop_TSTRB { I 4 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'inStreamTop_V_strb_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 22 \
    name inStreamTop_V_user_V \
    reset_level 1 \
    sync_rst true \
    corename {inStreamTop} \
    metadata {  } \
    op interface \
    ports { inStreamTop_TUSER { I 7 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'inStreamTop_V_user_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 23 \
    name inStreamTop_V_last_V \
    reset_level 1 \
    sync_rst true \
    corename {inStreamTop} \
    metadata {  } \
    op interface \
    ports { inStreamTop_TVALID { I 1 bit } inStreamTop_TREADY { O 1 bit } inStreamTop_TLAST { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'inStreamTop_V_last_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 24 \
    name in_en_clrsts \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_in_en_clrsts \
    op interface \
    ports { in_en_clrsts { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 25 \
    name in_s2m_len \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_in_s2m_len \
    op interface \
    ports { in_s2m_len { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 26 \
    name s2m_err \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_s2m_err \
    op interface \
    ports { s2m_err { O 1 vector } s2m_err_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 27 \
    name in_Img_width \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_in_Img_width \
    op interface \
    ports { in_Img_width { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 28 \
    name inbuf \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_inbuf \
    op interface \
    ports { inbuf_din { O 33 vector } inbuf_num_data_valid { I 8 vector } inbuf_fifo_cap { I 8 vector } inbuf_full_n { I 1 bit } inbuf_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 29 \
    name incount47 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_incount47 \
    op interface \
    ports { incount47_din { O 32 vector } incount47_num_data_valid { I 4 vector } incount47_fifo_cap { I 4 vector } incount47_full_n { I 1 bit } incount47_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name s2m_len_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_s2m_len_c \
    op interface \
    ports { s2m_len_c_din { O 32 vector } s2m_len_c_num_data_valid { I 2 vector } s2m_len_c_fifo_cap { I 2 vector } s2m_len_c_full_n { I 1 bit } s2m_len_c_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 31 \
    name s2m_enb_clrsts_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_s2m_enb_clrsts_c \
    op interface \
    ports { s2m_enb_clrsts_c_din { O 1 vector } s2m_enb_clrsts_c_num_data_valid { I 2 vector } s2m_enb_clrsts_c_fifo_cap { I 2 vector } s2m_enb_clrsts_c_full_n { I 1 bit } s2m_enb_clrsts_c_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# RegSlice definition:
set ID 32
set RegSliceName userdma_regslice_both
set RegSliceInstName userdma_regslice_both_U
set CoreName ap_simcore_userdma_regslice_both
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $RegSliceName BINDTYPE interface TYPE interface_regslice INSTNAME $RegSliceInstName
}


if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_regSlice] == "::AESL_LIB_VIRTEX::xil_gen_regSlice"} {
eval "::AESL_LIB_VIRTEX::xil_gen_regSlice { \
    name ${RegSliceName} \
    prefix userdma_ \
    sliceTypeList 0\
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_regSlice, check your platform lib"
}
}


# RegSlice definition:
set ID 33
set RegSliceName userdma_regslice_both
set RegSliceInstName userdma_regslice_both_U
set CoreName ap_simcore_userdma_regslice_both
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $RegSliceName BINDTYPE interface TYPE interface_regslice INSTNAME $RegSliceInstName
}


if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_regSlice] == "::AESL_LIB_VIRTEX::xil_gen_regSlice"} {
eval "::AESL_LIB_VIRTEX::xil_gen_regSlice { \
    name ${RegSliceName} \
    prefix userdma_ \
    sliceTypeList 0\
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_regSlice, check your platform lib"
}
}


# RegSlice definition:
set ID 34
set RegSliceName userdma_regslice_both
set RegSliceInstName userdma_regslice_both_U
set CoreName ap_simcore_userdma_regslice_both
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $RegSliceName BINDTYPE interface TYPE interface_regslice INSTNAME $RegSliceInstName
}


if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_regSlice] == "::AESL_LIB_VIRTEX::xil_gen_regSlice"} {
eval "::AESL_LIB_VIRTEX::xil_gen_regSlice { \
    name ${RegSliceName} \
    prefix userdma_ \
    sliceTypeList 0\
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_regSlice, check your platform lib"
}
}


# RegSlice definition:
set ID 35
set RegSliceName userdma_regslice_both
set RegSliceInstName userdma_regslice_both_U
set CoreName ap_simcore_userdma_regslice_both
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $RegSliceName BINDTYPE interface TYPE interface_regslice INSTNAME $RegSliceInstName
}


if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_regSlice] == "::AESL_LIB_VIRTEX::xil_gen_regSlice"} {
eval "::AESL_LIB_VIRTEX::xil_gen_regSlice { \
    name ${RegSliceName} \
    prefix userdma_ \
    sliceTypeList 0\
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_regSlice, check your platform lib"
}
}


# RegSlice definition:
set ID 36
set RegSliceName userdma_regslice_both
set RegSliceInstName userdma_regslice_both_U
set CoreName ap_simcore_userdma_regslice_both
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $RegSliceName BINDTYPE interface TYPE interface_regslice INSTNAME $RegSliceInstName
}


if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_regSlice] == "::AESL_LIB_VIRTEX::xil_gen_regSlice"} {
eval "::AESL_LIB_VIRTEX::xil_gen_regSlice { \
    name ${RegSliceName} \
    prefix userdma_ \
    sliceTypeList 0\
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_regSlice, check your platform lib"
}
}


