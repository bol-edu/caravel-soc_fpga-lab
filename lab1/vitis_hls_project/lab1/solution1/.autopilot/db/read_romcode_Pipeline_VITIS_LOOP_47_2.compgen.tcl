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
    name BUS1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_BUS1 \
    op interface \
    ports { m_axi_BUS1_AWVALID { O 1 bit } m_axi_BUS1_AWREADY { I 1 bit } m_axi_BUS1_AWADDR { O 64 vector } m_axi_BUS1_AWID { O 1 vector } m_axi_BUS1_AWLEN { O 32 vector } m_axi_BUS1_AWSIZE { O 3 vector } m_axi_BUS1_AWBURST { O 2 vector } m_axi_BUS1_AWLOCK { O 2 vector } m_axi_BUS1_AWCACHE { O 4 vector } m_axi_BUS1_AWPROT { O 3 vector } m_axi_BUS1_AWQOS { O 4 vector } m_axi_BUS1_AWREGION { O 4 vector } m_axi_BUS1_AWUSER { O 1 vector } m_axi_BUS1_WVALID { O 1 bit } m_axi_BUS1_WREADY { I 1 bit } m_axi_BUS1_WDATA { O 32 vector } m_axi_BUS1_WSTRB { O 4 vector } m_axi_BUS1_WLAST { O 1 bit } m_axi_BUS1_WID { O 1 vector } m_axi_BUS1_WUSER { O 1 vector } m_axi_BUS1_ARVALID { O 1 bit } m_axi_BUS1_ARREADY { I 1 bit } m_axi_BUS1_ARADDR { O 64 vector } m_axi_BUS1_ARID { O 1 vector } m_axi_BUS1_ARLEN { O 32 vector } m_axi_BUS1_ARSIZE { O 3 vector } m_axi_BUS1_ARBURST { O 2 vector } m_axi_BUS1_ARLOCK { O 2 vector } m_axi_BUS1_ARCACHE { O 4 vector } m_axi_BUS1_ARPROT { O 3 vector } m_axi_BUS1_ARQOS { O 4 vector } m_axi_BUS1_ARREGION { O 4 vector } m_axi_BUS1_ARUSER { O 1 vector } m_axi_BUS1_RVALID { I 1 bit } m_axi_BUS1_RREADY { O 1 bit } m_axi_BUS1_RDATA { I 32 vector } m_axi_BUS1_RLAST { I 1 bit } m_axi_BUS1_RID { I 1 vector } m_axi_BUS1_RFIFONUM { I 11 vector } m_axi_BUS1_RUSER { I 1 vector } m_axi_BUS1_RRESP { I 2 vector } m_axi_BUS1_BVALID { I 1 bit } m_axi_BUS1_BREADY { O 1 bit } m_axi_BUS1_BRESP { I 2 vector } m_axi_BUS1_BID { I 1 vector } m_axi_BUS1_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name sext_ln47 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln47 \
    op interface \
    ports { sext_ln47 { I 62 vector } } \
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
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
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


# flow_control definition:
set InstName read_romcode_flow_control_loop_pipe_sequential_init_U
set CompName read_romcode_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix read_romcode_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


