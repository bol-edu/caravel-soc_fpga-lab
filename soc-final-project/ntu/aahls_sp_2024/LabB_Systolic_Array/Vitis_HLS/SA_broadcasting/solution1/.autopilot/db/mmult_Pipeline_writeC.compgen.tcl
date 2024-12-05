# This script segment is generated automatically by AutoPilot

set id 653
set name mmult_mux_1632_32_1_1
set corename simcore_mux
set op mux
set stage_num 1
set din0_width 32
set din0_signed 0
set din1_width 32
set din1_signed 0
set din2_width 32
set din2_signed 0
set din3_width 32
set din3_signed 0
set din4_width 32
set din4_signed 0
set din5_width 32
set din5_signed 0
set din6_width 32
set din6_signed 0
set din7_width 32
set din7_signed 0
set din8_width 32
set din8_signed 0
set din9_width 32
set din9_signed 0
set din10_width 32
set din10_signed 0
set din11_width 32
set din11_signed 0
set din12_width 32
set din12_signed 0
set din13_width 32
set din13_signed 0
set din14_width 32
set din14_signed 0
set din15_width 32
set din15_signed 0
set din16_width 32
set din16_signed 0
set dout_width 32
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mux} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set op mux
set corename Multiplexer
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_pipemux] == "::AESL_LIB_VIRTEX::xil_gen_pipemux"} {
eval "::AESL_LIB_VIRTEX::xil_gen_pipemux { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    din0_width ${din0_width} \
    din0_signed ${din0_signed} \
    din1_width ${din1_width} \
    din1_signed ${din1_signed} \
    din2_width ${din2_width} \
    din2_signed ${din2_signed} \
    din3_width ${din3_width} \
    din3_signed ${din3_signed} \
    din4_width ${din4_width} \
    din4_signed ${din4_signed} \
    din5_width ${din5_width} \
    din5_signed ${din5_signed} \
    din6_width ${din6_width} \
    din6_signed ${din6_signed} \
    din7_width ${din7_width} \
    din7_signed ${din7_signed} \
    din8_width ${din8_width} \
    din8_signed ${din8_signed} \
    din9_width ${din9_width} \
    din9_signed ${din9_signed} \
    din10_width ${din10_width} \
    din10_signed ${din10_signed} \
    din11_width ${din11_width} \
    din11_signed ${din11_signed} \
    din12_width ${din12_width} \
    din12_signed ${din12_signed} \
    din13_width ${din13_width} \
    din13_signed ${din13_signed} \
    din14_width ${din14_width} \
    din14_signed ${din14_signed} \
    din15_width ${din15_width} \
    din15_signed ${din15_signed} \
    din16_width ${din16_width} \
    din16_signed ${din16_signed} \
    dout_width ${dout_width} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_pipemux, check your platform lib"
}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 671 \
    name gmem2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem2 \
    op interface \
    ports { m_axi_gmem2_AWVALID { O 1 bit } m_axi_gmem2_AWREADY { I 1 bit } m_axi_gmem2_AWADDR { O 64 vector } m_axi_gmem2_AWID { O 1 vector } m_axi_gmem2_AWLEN { O 32 vector } m_axi_gmem2_AWSIZE { O 3 vector } m_axi_gmem2_AWBURST { O 2 vector } m_axi_gmem2_AWLOCK { O 2 vector } m_axi_gmem2_AWCACHE { O 4 vector } m_axi_gmem2_AWPROT { O 3 vector } m_axi_gmem2_AWQOS { O 4 vector } m_axi_gmem2_AWREGION { O 4 vector } m_axi_gmem2_AWUSER { O 1 vector } m_axi_gmem2_WVALID { O 1 bit } m_axi_gmem2_WREADY { I 1 bit } m_axi_gmem2_WDATA { O 32 vector } m_axi_gmem2_WSTRB { O 4 vector } m_axi_gmem2_WLAST { O 1 bit } m_axi_gmem2_WID { O 1 vector } m_axi_gmem2_WUSER { O 1 vector } m_axi_gmem2_ARVALID { O 1 bit } m_axi_gmem2_ARREADY { I 1 bit } m_axi_gmem2_ARADDR { O 64 vector } m_axi_gmem2_ARID { O 1 vector } m_axi_gmem2_ARLEN { O 32 vector } m_axi_gmem2_ARSIZE { O 3 vector } m_axi_gmem2_ARBURST { O 2 vector } m_axi_gmem2_ARLOCK { O 2 vector } m_axi_gmem2_ARCACHE { O 4 vector } m_axi_gmem2_ARPROT { O 3 vector } m_axi_gmem2_ARQOS { O 4 vector } m_axi_gmem2_ARREGION { O 4 vector } m_axi_gmem2_ARUSER { O 1 vector } m_axi_gmem2_RVALID { I 1 bit } m_axi_gmem2_RREADY { O 1 bit } m_axi_gmem2_RDATA { I 32 vector } m_axi_gmem2_RLAST { I 1 bit } m_axi_gmem2_RID { I 1 vector } m_axi_gmem2_RFIFONUM { I 9 vector } m_axi_gmem2_RUSER { I 1 vector } m_axi_gmem2_RRESP { I 2 vector } m_axi_gmem2_BVALID { I 1 bit } m_axi_gmem2_BREADY { O 1 bit } m_axi_gmem2_BRESP { I 2 vector } m_axi_gmem2_BID { I 1 vector } m_axi_gmem2_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 672 \
    name sext_ln133_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln133_1 \
    op interface \
    ports { sext_ln133_1 { I 62 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 673 \
    name mul108 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mul108 \
    op interface \
    ports { mul108 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 674 \
    name b_col \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_b_col \
    op interface \
    ports { b_col { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 675 \
    name mux_case_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_0 \
    op interface \
    ports { mux_case_0 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 676 \
    name mux_case_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_1 \
    op interface \
    ports { mux_case_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 677 \
    name mux_case_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_2 \
    op interface \
    ports { mux_case_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 678 \
    name mux_case_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_3 \
    op interface \
    ports { mux_case_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 679 \
    name mux_case_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_4 \
    op interface \
    ports { mux_case_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 680 \
    name mux_case_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_5 \
    op interface \
    ports { mux_case_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 681 \
    name mux_case_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_6 \
    op interface \
    ports { mux_case_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 682 \
    name mux_case_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_7 \
    op interface \
    ports { mux_case_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 683 \
    name mux_case_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_8 \
    op interface \
    ports { mux_case_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 684 \
    name mux_case_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_9 \
    op interface \
    ports { mux_case_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 685 \
    name mux_case_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_10 \
    op interface \
    ports { mux_case_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 686 \
    name mux_case_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_11 \
    op interface \
    ports { mux_case_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 687 \
    name mux_case_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_12 \
    op interface \
    ports { mux_case_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 688 \
    name mux_case_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_13 \
    op interface \
    ports { mux_case_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 689 \
    name mux_case_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_14 \
    op interface \
    ports { mux_case_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 690 \
    name mux_case_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_15 \
    op interface \
    ports { mux_case_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 691 \
    name mux_case_01883 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_01883 \
    op interface \
    ports { mux_case_01883 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 692 \
    name mux_case_11884 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_11884 \
    op interface \
    ports { mux_case_11884 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 693 \
    name mux_case_21885 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_21885 \
    op interface \
    ports { mux_case_21885 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 694 \
    name mux_case_31886 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_31886 \
    op interface \
    ports { mux_case_31886 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 695 \
    name mux_case_41887 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_41887 \
    op interface \
    ports { mux_case_41887 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 696 \
    name mux_case_51888 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_51888 \
    op interface \
    ports { mux_case_51888 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 697 \
    name mux_case_61889 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_61889 \
    op interface \
    ports { mux_case_61889 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 698 \
    name mux_case_71890 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_71890 \
    op interface \
    ports { mux_case_71890 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 699 \
    name mux_case_81891 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_81891 \
    op interface \
    ports { mux_case_81891 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 700 \
    name mux_case_91892 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_91892 \
    op interface \
    ports { mux_case_91892 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 701 \
    name mux_case_101893 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_101893 \
    op interface \
    ports { mux_case_101893 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 702 \
    name mux_case_111894 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_111894 \
    op interface \
    ports { mux_case_111894 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 703 \
    name mux_case_121895 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_121895 \
    op interface \
    ports { mux_case_121895 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 704 \
    name mux_case_131896 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_131896 \
    op interface \
    ports { mux_case_131896 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 705 \
    name mux_case_141897 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_141897 \
    op interface \
    ports { mux_case_141897 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 706 \
    name mux_case_151898 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_151898 \
    op interface \
    ports { mux_case_151898 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 707 \
    name mux_case_01900 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_01900 \
    op interface \
    ports { mux_case_01900 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 708 \
    name mux_case_11901 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_11901 \
    op interface \
    ports { mux_case_11901 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 709 \
    name mux_case_21902 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_21902 \
    op interface \
    ports { mux_case_21902 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 710 \
    name mux_case_31903 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_31903 \
    op interface \
    ports { mux_case_31903 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 711 \
    name mux_case_41904 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_41904 \
    op interface \
    ports { mux_case_41904 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 712 \
    name mux_case_51905 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_51905 \
    op interface \
    ports { mux_case_51905 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 713 \
    name mux_case_61906 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_61906 \
    op interface \
    ports { mux_case_61906 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 714 \
    name mux_case_71907 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_71907 \
    op interface \
    ports { mux_case_71907 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 715 \
    name mux_case_81908 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_81908 \
    op interface \
    ports { mux_case_81908 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 716 \
    name mux_case_91909 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_91909 \
    op interface \
    ports { mux_case_91909 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 717 \
    name mux_case_101910 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_101910 \
    op interface \
    ports { mux_case_101910 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 718 \
    name mux_case_111911 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_111911 \
    op interface \
    ports { mux_case_111911 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 719 \
    name mux_case_121912 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_121912 \
    op interface \
    ports { mux_case_121912 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 720 \
    name mux_case_131913 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_131913 \
    op interface \
    ports { mux_case_131913 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 721 \
    name mux_case_141914 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_141914 \
    op interface \
    ports { mux_case_141914 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 722 \
    name mux_case_151915 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_151915 \
    op interface \
    ports { mux_case_151915 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 723 \
    name mux_case_01917 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_01917 \
    op interface \
    ports { mux_case_01917 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 724 \
    name mux_case_11918 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_11918 \
    op interface \
    ports { mux_case_11918 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 725 \
    name mux_case_21919 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_21919 \
    op interface \
    ports { mux_case_21919 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 726 \
    name mux_case_31920 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_31920 \
    op interface \
    ports { mux_case_31920 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 727 \
    name mux_case_41921 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_41921 \
    op interface \
    ports { mux_case_41921 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 728 \
    name mux_case_51922 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_51922 \
    op interface \
    ports { mux_case_51922 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 729 \
    name mux_case_61923 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_61923 \
    op interface \
    ports { mux_case_61923 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 730 \
    name mux_case_71924 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_71924 \
    op interface \
    ports { mux_case_71924 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 731 \
    name mux_case_81925 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_81925 \
    op interface \
    ports { mux_case_81925 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 732 \
    name mux_case_91926 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_91926 \
    op interface \
    ports { mux_case_91926 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 733 \
    name mux_case_101927 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_101927 \
    op interface \
    ports { mux_case_101927 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 734 \
    name mux_case_111928 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_111928 \
    op interface \
    ports { mux_case_111928 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 735 \
    name mux_case_121929 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_121929 \
    op interface \
    ports { mux_case_121929 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 736 \
    name mux_case_131930 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_131930 \
    op interface \
    ports { mux_case_131930 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 737 \
    name mux_case_141931 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_141931 \
    op interface \
    ports { mux_case_141931 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 738 \
    name mux_case_151932 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_151932 \
    op interface \
    ports { mux_case_151932 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 739 \
    name mux_case_01934 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_01934 \
    op interface \
    ports { mux_case_01934 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 740 \
    name mux_case_11935 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_11935 \
    op interface \
    ports { mux_case_11935 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 741 \
    name mux_case_21936 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_21936 \
    op interface \
    ports { mux_case_21936 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 742 \
    name mux_case_31937 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_31937 \
    op interface \
    ports { mux_case_31937 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 743 \
    name mux_case_41938 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_41938 \
    op interface \
    ports { mux_case_41938 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 744 \
    name mux_case_51939 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_51939 \
    op interface \
    ports { mux_case_51939 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 745 \
    name mux_case_61940 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_61940 \
    op interface \
    ports { mux_case_61940 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 746 \
    name mux_case_71941 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_71941 \
    op interface \
    ports { mux_case_71941 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 747 \
    name mux_case_81942 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_81942 \
    op interface \
    ports { mux_case_81942 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 748 \
    name mux_case_91943 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_91943 \
    op interface \
    ports { mux_case_91943 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 749 \
    name mux_case_101944 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_101944 \
    op interface \
    ports { mux_case_101944 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 750 \
    name mux_case_111945 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_111945 \
    op interface \
    ports { mux_case_111945 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 751 \
    name mux_case_121946 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_121946 \
    op interface \
    ports { mux_case_121946 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 752 \
    name mux_case_131947 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_131947 \
    op interface \
    ports { mux_case_131947 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 753 \
    name mux_case_141948 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_141948 \
    op interface \
    ports { mux_case_141948 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 754 \
    name mux_case_151949 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_151949 \
    op interface \
    ports { mux_case_151949 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 755 \
    name mux_case_01951 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_01951 \
    op interface \
    ports { mux_case_01951 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 756 \
    name mux_case_11952 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_11952 \
    op interface \
    ports { mux_case_11952 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 757 \
    name mux_case_21953 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_21953 \
    op interface \
    ports { mux_case_21953 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 758 \
    name mux_case_31954 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_31954 \
    op interface \
    ports { mux_case_31954 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 759 \
    name mux_case_41955 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_41955 \
    op interface \
    ports { mux_case_41955 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 760 \
    name mux_case_51956 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_51956 \
    op interface \
    ports { mux_case_51956 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 761 \
    name mux_case_61957 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_61957 \
    op interface \
    ports { mux_case_61957 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 762 \
    name mux_case_71958 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_71958 \
    op interface \
    ports { mux_case_71958 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 763 \
    name mux_case_81959 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_81959 \
    op interface \
    ports { mux_case_81959 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 764 \
    name mux_case_91960 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_91960 \
    op interface \
    ports { mux_case_91960 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 765 \
    name mux_case_101961 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_101961 \
    op interface \
    ports { mux_case_101961 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 766 \
    name mux_case_111962 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_111962 \
    op interface \
    ports { mux_case_111962 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 767 \
    name mux_case_121963 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_121963 \
    op interface \
    ports { mux_case_121963 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 768 \
    name mux_case_131964 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_131964 \
    op interface \
    ports { mux_case_131964 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 769 \
    name mux_case_141965 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_141965 \
    op interface \
    ports { mux_case_141965 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 770 \
    name mux_case_151966 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_151966 \
    op interface \
    ports { mux_case_151966 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 771 \
    name mux_case_01968 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_01968 \
    op interface \
    ports { mux_case_01968 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 772 \
    name mux_case_11969 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_11969 \
    op interface \
    ports { mux_case_11969 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 773 \
    name mux_case_21970 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_21970 \
    op interface \
    ports { mux_case_21970 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 774 \
    name mux_case_31971 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_31971 \
    op interface \
    ports { mux_case_31971 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 775 \
    name mux_case_41972 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_41972 \
    op interface \
    ports { mux_case_41972 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 776 \
    name mux_case_51973 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_51973 \
    op interface \
    ports { mux_case_51973 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 777 \
    name mux_case_61974 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_61974 \
    op interface \
    ports { mux_case_61974 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 778 \
    name mux_case_71975 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_71975 \
    op interface \
    ports { mux_case_71975 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 779 \
    name mux_case_81976 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_81976 \
    op interface \
    ports { mux_case_81976 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 780 \
    name mux_case_91977 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_91977 \
    op interface \
    ports { mux_case_91977 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 781 \
    name mux_case_101978 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_101978 \
    op interface \
    ports { mux_case_101978 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 782 \
    name mux_case_111979 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_111979 \
    op interface \
    ports { mux_case_111979 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 783 \
    name mux_case_121980 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_121980 \
    op interface \
    ports { mux_case_121980 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 784 \
    name mux_case_131981 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_131981 \
    op interface \
    ports { mux_case_131981 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 785 \
    name mux_case_141982 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_141982 \
    op interface \
    ports { mux_case_141982 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 786 \
    name mux_case_151983 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_151983 \
    op interface \
    ports { mux_case_151983 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 787 \
    name mux_case_01985 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_01985 \
    op interface \
    ports { mux_case_01985 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 788 \
    name mux_case_11986 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_11986 \
    op interface \
    ports { mux_case_11986 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 789 \
    name mux_case_21987 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_21987 \
    op interface \
    ports { mux_case_21987 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 790 \
    name mux_case_31988 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_31988 \
    op interface \
    ports { mux_case_31988 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 791 \
    name mux_case_41989 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_41989 \
    op interface \
    ports { mux_case_41989 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 792 \
    name mux_case_51990 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_51990 \
    op interface \
    ports { mux_case_51990 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 793 \
    name mux_case_61991 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_61991 \
    op interface \
    ports { mux_case_61991 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 794 \
    name mux_case_71992 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_71992 \
    op interface \
    ports { mux_case_71992 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 795 \
    name mux_case_81993 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_81993 \
    op interface \
    ports { mux_case_81993 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 796 \
    name mux_case_91994 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_91994 \
    op interface \
    ports { mux_case_91994 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 797 \
    name mux_case_101995 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_101995 \
    op interface \
    ports { mux_case_101995 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 798 \
    name mux_case_111996 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_111996 \
    op interface \
    ports { mux_case_111996 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 799 \
    name mux_case_121997 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_121997 \
    op interface \
    ports { mux_case_121997 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 800 \
    name mux_case_131998 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_131998 \
    op interface \
    ports { mux_case_131998 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 801 \
    name mux_case_141999 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_141999 \
    op interface \
    ports { mux_case_141999 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 802 \
    name mux_case_152000 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_152000 \
    op interface \
    ports { mux_case_152000 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 803 \
    name mux_case_02002 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_02002 \
    op interface \
    ports { mux_case_02002 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 804 \
    name mux_case_12003 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_12003 \
    op interface \
    ports { mux_case_12003 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 805 \
    name mux_case_22004 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_22004 \
    op interface \
    ports { mux_case_22004 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 806 \
    name mux_case_32005 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_32005 \
    op interface \
    ports { mux_case_32005 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 807 \
    name mux_case_42006 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_42006 \
    op interface \
    ports { mux_case_42006 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 808 \
    name mux_case_52007 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_52007 \
    op interface \
    ports { mux_case_52007 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 809 \
    name mux_case_62008 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_62008 \
    op interface \
    ports { mux_case_62008 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 810 \
    name mux_case_72009 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_72009 \
    op interface \
    ports { mux_case_72009 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 811 \
    name mux_case_82010 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_82010 \
    op interface \
    ports { mux_case_82010 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 812 \
    name mux_case_92011 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_92011 \
    op interface \
    ports { mux_case_92011 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 813 \
    name mux_case_102012 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_102012 \
    op interface \
    ports { mux_case_102012 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 814 \
    name mux_case_112013 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_112013 \
    op interface \
    ports { mux_case_112013 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 815 \
    name mux_case_122014 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_122014 \
    op interface \
    ports { mux_case_122014 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 816 \
    name mux_case_132015 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_132015 \
    op interface \
    ports { mux_case_132015 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 817 \
    name mux_case_142016 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_142016 \
    op interface \
    ports { mux_case_142016 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 818 \
    name mux_case_152017 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_152017 \
    op interface \
    ports { mux_case_152017 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 819 \
    name mux_case_02019 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_02019 \
    op interface \
    ports { mux_case_02019 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 820 \
    name mux_case_12020 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_12020 \
    op interface \
    ports { mux_case_12020 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 821 \
    name mux_case_22021 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_22021 \
    op interface \
    ports { mux_case_22021 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 822 \
    name mux_case_32022 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_32022 \
    op interface \
    ports { mux_case_32022 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 823 \
    name mux_case_42023 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_42023 \
    op interface \
    ports { mux_case_42023 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 824 \
    name mux_case_52024 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_52024 \
    op interface \
    ports { mux_case_52024 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 825 \
    name mux_case_62025 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_62025 \
    op interface \
    ports { mux_case_62025 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 826 \
    name mux_case_72026 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_72026 \
    op interface \
    ports { mux_case_72026 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 827 \
    name mux_case_82027 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_82027 \
    op interface \
    ports { mux_case_82027 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 828 \
    name mux_case_92028 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_92028 \
    op interface \
    ports { mux_case_92028 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 829 \
    name mux_case_102029 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_102029 \
    op interface \
    ports { mux_case_102029 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 830 \
    name mux_case_112030 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_112030 \
    op interface \
    ports { mux_case_112030 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 831 \
    name mux_case_122031 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_122031 \
    op interface \
    ports { mux_case_122031 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 832 \
    name mux_case_132032 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_132032 \
    op interface \
    ports { mux_case_132032 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 833 \
    name mux_case_142033 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_142033 \
    op interface \
    ports { mux_case_142033 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 834 \
    name mux_case_152034 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_152034 \
    op interface \
    ports { mux_case_152034 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 835 \
    name mux_case_02036 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_02036 \
    op interface \
    ports { mux_case_02036 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 836 \
    name mux_case_12037 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_12037 \
    op interface \
    ports { mux_case_12037 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 837 \
    name mux_case_22038 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_22038 \
    op interface \
    ports { mux_case_22038 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 838 \
    name mux_case_32039 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_32039 \
    op interface \
    ports { mux_case_32039 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 839 \
    name mux_case_42040 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_42040 \
    op interface \
    ports { mux_case_42040 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 840 \
    name mux_case_52041 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_52041 \
    op interface \
    ports { mux_case_52041 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 841 \
    name mux_case_62042 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_62042 \
    op interface \
    ports { mux_case_62042 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 842 \
    name mux_case_72043 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_72043 \
    op interface \
    ports { mux_case_72043 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 843 \
    name mux_case_82044 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_82044 \
    op interface \
    ports { mux_case_82044 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 844 \
    name mux_case_92045 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_92045 \
    op interface \
    ports { mux_case_92045 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 845 \
    name mux_case_102046 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_102046 \
    op interface \
    ports { mux_case_102046 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 846 \
    name mux_case_112047 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_112047 \
    op interface \
    ports { mux_case_112047 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 847 \
    name mux_case_122048 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_122048 \
    op interface \
    ports { mux_case_122048 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 848 \
    name mux_case_132049 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_132049 \
    op interface \
    ports { mux_case_132049 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 849 \
    name mux_case_142050 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_142050 \
    op interface \
    ports { mux_case_142050 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 850 \
    name mux_case_152051 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_152051 \
    op interface \
    ports { mux_case_152051 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 851 \
    name mux_case_02053 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_02053 \
    op interface \
    ports { mux_case_02053 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 852 \
    name mux_case_12054 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_12054 \
    op interface \
    ports { mux_case_12054 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 853 \
    name mux_case_22055 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_22055 \
    op interface \
    ports { mux_case_22055 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 854 \
    name mux_case_32056 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_32056 \
    op interface \
    ports { mux_case_32056 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 855 \
    name mux_case_42057 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_42057 \
    op interface \
    ports { mux_case_42057 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 856 \
    name mux_case_52058 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_52058 \
    op interface \
    ports { mux_case_52058 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 857 \
    name mux_case_62059 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_62059 \
    op interface \
    ports { mux_case_62059 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 858 \
    name mux_case_72060 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_72060 \
    op interface \
    ports { mux_case_72060 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 859 \
    name mux_case_82061 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_82061 \
    op interface \
    ports { mux_case_82061 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 860 \
    name mux_case_92062 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_92062 \
    op interface \
    ports { mux_case_92062 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 861 \
    name mux_case_102063 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_102063 \
    op interface \
    ports { mux_case_102063 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 862 \
    name mux_case_112064 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_112064 \
    op interface \
    ports { mux_case_112064 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 863 \
    name mux_case_122065 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_122065 \
    op interface \
    ports { mux_case_122065 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 864 \
    name mux_case_132066 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_132066 \
    op interface \
    ports { mux_case_132066 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 865 \
    name mux_case_142067 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_142067 \
    op interface \
    ports { mux_case_142067 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 866 \
    name mux_case_152068 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_152068 \
    op interface \
    ports { mux_case_152068 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 867 \
    name mux_case_02070 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_02070 \
    op interface \
    ports { mux_case_02070 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 868 \
    name mux_case_12071 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_12071 \
    op interface \
    ports { mux_case_12071 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 869 \
    name mux_case_22072 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_22072 \
    op interface \
    ports { mux_case_22072 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 870 \
    name mux_case_32073 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_32073 \
    op interface \
    ports { mux_case_32073 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 871 \
    name mux_case_42074 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_42074 \
    op interface \
    ports { mux_case_42074 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 872 \
    name mux_case_52075 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_52075 \
    op interface \
    ports { mux_case_52075 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 873 \
    name mux_case_62076 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_62076 \
    op interface \
    ports { mux_case_62076 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 874 \
    name mux_case_72077 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_72077 \
    op interface \
    ports { mux_case_72077 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 875 \
    name mux_case_82078 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_82078 \
    op interface \
    ports { mux_case_82078 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 876 \
    name mux_case_92079 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_92079 \
    op interface \
    ports { mux_case_92079 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 877 \
    name mux_case_102080 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_102080 \
    op interface \
    ports { mux_case_102080 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 878 \
    name mux_case_112081 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_112081 \
    op interface \
    ports { mux_case_112081 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 879 \
    name mux_case_122082 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_122082 \
    op interface \
    ports { mux_case_122082 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 880 \
    name mux_case_132083 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_132083 \
    op interface \
    ports { mux_case_132083 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 881 \
    name mux_case_142084 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_142084 \
    op interface \
    ports { mux_case_142084 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 882 \
    name mux_case_152085 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_152085 \
    op interface \
    ports { mux_case_152085 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 883 \
    name mux_case_02087 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_02087 \
    op interface \
    ports { mux_case_02087 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 884 \
    name mux_case_12088 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_12088 \
    op interface \
    ports { mux_case_12088 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 885 \
    name mux_case_22089 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_22089 \
    op interface \
    ports { mux_case_22089 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 886 \
    name mux_case_32090 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_32090 \
    op interface \
    ports { mux_case_32090 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 887 \
    name mux_case_42091 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_42091 \
    op interface \
    ports { mux_case_42091 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 888 \
    name mux_case_52092 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_52092 \
    op interface \
    ports { mux_case_52092 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 889 \
    name mux_case_62093 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_62093 \
    op interface \
    ports { mux_case_62093 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 890 \
    name mux_case_72094 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_72094 \
    op interface \
    ports { mux_case_72094 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 891 \
    name mux_case_82095 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_82095 \
    op interface \
    ports { mux_case_82095 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 892 \
    name mux_case_92096 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_92096 \
    op interface \
    ports { mux_case_92096 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 893 \
    name mux_case_102097 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_102097 \
    op interface \
    ports { mux_case_102097 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 894 \
    name mux_case_112098 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_112098 \
    op interface \
    ports { mux_case_112098 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 895 \
    name mux_case_122099 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_122099 \
    op interface \
    ports { mux_case_122099 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 896 \
    name mux_case_132100 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_132100 \
    op interface \
    ports { mux_case_132100 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 897 \
    name mux_case_142101 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_142101 \
    op interface \
    ports { mux_case_142101 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 898 \
    name mux_case_152102 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_152102 \
    op interface \
    ports { mux_case_152102 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 899 \
    name mux_case_02104 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_02104 \
    op interface \
    ports { mux_case_02104 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 900 \
    name mux_case_12105 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_12105 \
    op interface \
    ports { mux_case_12105 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 901 \
    name mux_case_22106 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_22106 \
    op interface \
    ports { mux_case_22106 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 902 \
    name mux_case_32107 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_32107 \
    op interface \
    ports { mux_case_32107 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 903 \
    name mux_case_42108 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_42108 \
    op interface \
    ports { mux_case_42108 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 904 \
    name mux_case_52109 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_52109 \
    op interface \
    ports { mux_case_52109 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 905 \
    name mux_case_62110 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_62110 \
    op interface \
    ports { mux_case_62110 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 906 \
    name mux_case_72111 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_72111 \
    op interface \
    ports { mux_case_72111 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 907 \
    name mux_case_82112 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_82112 \
    op interface \
    ports { mux_case_82112 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 908 \
    name mux_case_92113 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_92113 \
    op interface \
    ports { mux_case_92113 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 909 \
    name mux_case_102114 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_102114 \
    op interface \
    ports { mux_case_102114 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 910 \
    name mux_case_112115 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_112115 \
    op interface \
    ports { mux_case_112115 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 911 \
    name mux_case_122116 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_122116 \
    op interface \
    ports { mux_case_122116 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 912 \
    name mux_case_132117 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_132117 \
    op interface \
    ports { mux_case_132117 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 913 \
    name mux_case_142118 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_142118 \
    op interface \
    ports { mux_case_142118 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 914 \
    name mux_case_152119 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_152119 \
    op interface \
    ports { mux_case_152119 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 915 \
    name mux_case_02121 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_02121 \
    op interface \
    ports { mux_case_02121 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 916 \
    name mux_case_12122 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_12122 \
    op interface \
    ports { mux_case_12122 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 917 \
    name mux_case_22123 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_22123 \
    op interface \
    ports { mux_case_22123 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 918 \
    name mux_case_32124 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_32124 \
    op interface \
    ports { mux_case_32124 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 919 \
    name mux_case_42125 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_42125 \
    op interface \
    ports { mux_case_42125 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 920 \
    name mux_case_52126 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_52126 \
    op interface \
    ports { mux_case_52126 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 921 \
    name mux_case_62127 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_62127 \
    op interface \
    ports { mux_case_62127 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 922 \
    name mux_case_72128 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_72128 \
    op interface \
    ports { mux_case_72128 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 923 \
    name mux_case_82129 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_82129 \
    op interface \
    ports { mux_case_82129 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 924 \
    name mux_case_92130 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_92130 \
    op interface \
    ports { mux_case_92130 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 925 \
    name mux_case_102131 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_102131 \
    op interface \
    ports { mux_case_102131 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 926 \
    name mux_case_112132 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_112132 \
    op interface \
    ports { mux_case_112132 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 927 \
    name mux_case_122133 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_122133 \
    op interface \
    ports { mux_case_122133 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 928 \
    name mux_case_132134 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_132134 \
    op interface \
    ports { mux_case_132134 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 929 \
    name mux_case_142135 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_142135 \
    op interface \
    ports { mux_case_142135 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 930 \
    name mux_case_152136 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mux_case_152136 \
    op interface \
    ports { mux_case_152136 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 931 \
    name c \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_c \
    op interface \
    ports { c { I 64 vector } } \
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


