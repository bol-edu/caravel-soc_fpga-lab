# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1 \
    name s2m_sts_clear \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_s2m_sts_clear \
    op interface \
    ports { s2m_sts_clear { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name s2m_sts_clear_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_s2m_sts_clear_c \
    op interface \
    ports { s2m_sts_clear_c_din { O 1 vector } s2m_sts_clear_c_num_data_valid { I 3 vector } s2m_sts_clear_c_fifo_cap { I 3 vector } s2m_sts_clear_c_full_n { I 1 bit } s2m_sts_clear_c_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name s2mbuf \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_s2mbuf \
    op interface \
    ports { s2mbuf { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name s2mbuf_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_s2mbuf_c \
    op interface \
    ports { s2mbuf_c_din { O 64 vector } s2mbuf_c_num_data_valid { I 3 vector } s2mbuf_c_fifo_cap { I 3 vector } s2mbuf_c_full_n { I 1 bit } s2mbuf_c_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name m2s_sts_clear \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m2s_sts_clear \
    op interface \
    ports { m2s_sts_clear { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name m2s_sts_clear_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_m2s_sts_clear_c \
    op interface \
    ports { m2s_sts_clear_c_din { O 1 vector } m2s_sts_clear_c_num_data_valid { I 3 vector } m2s_sts_clear_c_fifo_cap { I 3 vector } m2s_sts_clear_c_full_n { I 1 bit } m2s_sts_clear_c_write { O 1 bit } } \
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


