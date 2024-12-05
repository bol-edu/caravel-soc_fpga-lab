# This script segment is generated automatically by AutoPilot

set id 1198
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
    id 1216 \
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
    id 1217 \
    name sext_ln164_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln164_1 \
    op interface \
    ports { sext_ln164_1 { I 62 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1218 \
    name mul237 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mul237 \
    op interface \
    ports { mul237 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1219 \
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
    id 1220 \
    name localC_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_reload \
    op interface \
    ports { localC_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1221 \
    name localC_1_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_1_reload \
    op interface \
    ports { localC_1_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1222 \
    name localC_2_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_2_reload \
    op interface \
    ports { localC_2_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1223 \
    name localC_3_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_3_reload \
    op interface \
    ports { localC_3_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1224 \
    name localC_4_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_4_reload \
    op interface \
    ports { localC_4_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1225 \
    name localC_5_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_5_reload \
    op interface \
    ports { localC_5_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1226 \
    name localC_6_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_6_reload \
    op interface \
    ports { localC_6_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1227 \
    name localC_7_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_7_reload \
    op interface \
    ports { localC_7_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1228 \
    name localC_8_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_8_reload \
    op interface \
    ports { localC_8_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1229 \
    name localC_9_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_9_reload \
    op interface \
    ports { localC_9_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1230 \
    name localC_10_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_10_reload \
    op interface \
    ports { localC_10_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1231 \
    name localC_11_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_11_reload \
    op interface \
    ports { localC_11_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1232 \
    name localC_12_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_12_reload \
    op interface \
    ports { localC_12_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1233 \
    name localC_13_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_13_reload \
    op interface \
    ports { localC_13_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1234 \
    name localC_14_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_14_reload \
    op interface \
    ports { localC_14_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1235 \
    name localC_15_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_15_reload \
    op interface \
    ports { localC_15_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1236 \
    name localC_16_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_16_reload \
    op interface \
    ports { localC_16_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1237 \
    name localC_17_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_17_reload \
    op interface \
    ports { localC_17_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1238 \
    name localC_18_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_18_reload \
    op interface \
    ports { localC_18_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1239 \
    name localC_19_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_19_reload \
    op interface \
    ports { localC_19_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1240 \
    name localC_20_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_20_reload \
    op interface \
    ports { localC_20_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1241 \
    name localC_21_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_21_reload \
    op interface \
    ports { localC_21_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1242 \
    name localC_22_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_22_reload \
    op interface \
    ports { localC_22_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1243 \
    name localC_23_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_23_reload \
    op interface \
    ports { localC_23_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1244 \
    name localC_24_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_24_reload \
    op interface \
    ports { localC_24_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1245 \
    name localC_25_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_25_reload \
    op interface \
    ports { localC_25_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1246 \
    name localC_26_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_26_reload \
    op interface \
    ports { localC_26_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1247 \
    name localC_27_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_27_reload \
    op interface \
    ports { localC_27_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1248 \
    name localC_28_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_28_reload \
    op interface \
    ports { localC_28_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1249 \
    name localC_29_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_29_reload \
    op interface \
    ports { localC_29_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1250 \
    name localC_30_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_30_reload \
    op interface \
    ports { localC_30_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1251 \
    name localC_31_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_31_reload \
    op interface \
    ports { localC_31_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1252 \
    name localC_32_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_32_reload \
    op interface \
    ports { localC_32_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1253 \
    name localC_33_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_33_reload \
    op interface \
    ports { localC_33_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1254 \
    name localC_34_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_34_reload \
    op interface \
    ports { localC_34_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1255 \
    name localC_35_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_35_reload \
    op interface \
    ports { localC_35_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1256 \
    name localC_36_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_36_reload \
    op interface \
    ports { localC_36_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1257 \
    name localC_37_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_37_reload \
    op interface \
    ports { localC_37_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1258 \
    name localC_38_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_38_reload \
    op interface \
    ports { localC_38_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1259 \
    name localC_39_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_39_reload \
    op interface \
    ports { localC_39_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1260 \
    name localC_40_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_40_reload \
    op interface \
    ports { localC_40_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1261 \
    name localC_41_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_41_reload \
    op interface \
    ports { localC_41_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1262 \
    name localC_42_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_42_reload \
    op interface \
    ports { localC_42_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1263 \
    name localC_43_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_43_reload \
    op interface \
    ports { localC_43_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1264 \
    name localC_44_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_44_reload \
    op interface \
    ports { localC_44_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1265 \
    name localC_45_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_45_reload \
    op interface \
    ports { localC_45_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1266 \
    name localC_46_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_46_reload \
    op interface \
    ports { localC_46_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1267 \
    name localC_47_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_47_reload \
    op interface \
    ports { localC_47_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1268 \
    name localC_48_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_48_reload \
    op interface \
    ports { localC_48_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1269 \
    name localC_49_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_49_reload \
    op interface \
    ports { localC_49_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1270 \
    name localC_50_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_50_reload \
    op interface \
    ports { localC_50_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1271 \
    name localC_51_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_51_reload \
    op interface \
    ports { localC_51_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1272 \
    name localC_52_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_52_reload \
    op interface \
    ports { localC_52_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1273 \
    name localC_53_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_53_reload \
    op interface \
    ports { localC_53_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1274 \
    name localC_54_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_54_reload \
    op interface \
    ports { localC_54_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1275 \
    name localC_55_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_55_reload \
    op interface \
    ports { localC_55_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1276 \
    name localC_56_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_56_reload \
    op interface \
    ports { localC_56_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1277 \
    name localC_57_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_57_reload \
    op interface \
    ports { localC_57_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1278 \
    name localC_58_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_58_reload \
    op interface \
    ports { localC_58_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1279 \
    name localC_59_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_59_reload \
    op interface \
    ports { localC_59_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1280 \
    name localC_60_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_60_reload \
    op interface \
    ports { localC_60_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1281 \
    name localC_61_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_61_reload \
    op interface \
    ports { localC_61_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1282 \
    name localC_62_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_62_reload \
    op interface \
    ports { localC_62_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1283 \
    name localC_63_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_63_reload \
    op interface \
    ports { localC_63_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1284 \
    name localC_64_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_64_reload \
    op interface \
    ports { localC_64_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1285 \
    name localC_65_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_65_reload \
    op interface \
    ports { localC_65_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1286 \
    name localC_66_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_66_reload \
    op interface \
    ports { localC_66_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1287 \
    name localC_67_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_67_reload \
    op interface \
    ports { localC_67_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1288 \
    name localC_68_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_68_reload \
    op interface \
    ports { localC_68_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1289 \
    name localC_69_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_69_reload \
    op interface \
    ports { localC_69_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1290 \
    name localC_70_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_70_reload \
    op interface \
    ports { localC_70_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1291 \
    name localC_71_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_71_reload \
    op interface \
    ports { localC_71_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1292 \
    name localC_72_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_72_reload \
    op interface \
    ports { localC_72_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1293 \
    name localC_73_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_73_reload \
    op interface \
    ports { localC_73_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1294 \
    name localC_74_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_74_reload \
    op interface \
    ports { localC_74_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1295 \
    name localC_75_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_75_reload \
    op interface \
    ports { localC_75_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1296 \
    name localC_76_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_76_reload \
    op interface \
    ports { localC_76_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1297 \
    name localC_77_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_77_reload \
    op interface \
    ports { localC_77_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1298 \
    name localC_78_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_78_reload \
    op interface \
    ports { localC_78_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1299 \
    name localC_79_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_79_reload \
    op interface \
    ports { localC_79_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1300 \
    name localC_80_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_80_reload \
    op interface \
    ports { localC_80_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1301 \
    name localC_81_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_81_reload \
    op interface \
    ports { localC_81_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1302 \
    name localC_82_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_82_reload \
    op interface \
    ports { localC_82_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1303 \
    name localC_83_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_83_reload \
    op interface \
    ports { localC_83_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1304 \
    name localC_84_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_84_reload \
    op interface \
    ports { localC_84_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1305 \
    name localC_85_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_85_reload \
    op interface \
    ports { localC_85_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1306 \
    name localC_86_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_86_reload \
    op interface \
    ports { localC_86_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1307 \
    name localC_87_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_87_reload \
    op interface \
    ports { localC_87_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1308 \
    name localC_88_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_88_reload \
    op interface \
    ports { localC_88_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1309 \
    name localC_89_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_89_reload \
    op interface \
    ports { localC_89_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1310 \
    name localC_90_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_90_reload \
    op interface \
    ports { localC_90_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1311 \
    name localC_91_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_91_reload \
    op interface \
    ports { localC_91_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1312 \
    name localC_92_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_92_reload \
    op interface \
    ports { localC_92_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1313 \
    name localC_93_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_93_reload \
    op interface \
    ports { localC_93_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1314 \
    name localC_94_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_94_reload \
    op interface \
    ports { localC_94_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1315 \
    name localC_95_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_95_reload \
    op interface \
    ports { localC_95_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1316 \
    name localC_96_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_96_reload \
    op interface \
    ports { localC_96_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1317 \
    name localC_97_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_97_reload \
    op interface \
    ports { localC_97_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1318 \
    name localC_98_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_98_reload \
    op interface \
    ports { localC_98_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1319 \
    name localC_99_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_99_reload \
    op interface \
    ports { localC_99_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1320 \
    name localC_100_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_100_reload \
    op interface \
    ports { localC_100_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1321 \
    name localC_101_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_101_reload \
    op interface \
    ports { localC_101_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1322 \
    name localC_102_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_102_reload \
    op interface \
    ports { localC_102_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1323 \
    name localC_103_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_103_reload \
    op interface \
    ports { localC_103_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1324 \
    name localC_104_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_104_reload \
    op interface \
    ports { localC_104_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1325 \
    name localC_105_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_105_reload \
    op interface \
    ports { localC_105_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1326 \
    name localC_106_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_106_reload \
    op interface \
    ports { localC_106_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1327 \
    name localC_107_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_107_reload \
    op interface \
    ports { localC_107_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1328 \
    name localC_108_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_108_reload \
    op interface \
    ports { localC_108_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1329 \
    name localC_109_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_109_reload \
    op interface \
    ports { localC_109_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1330 \
    name localC_110_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_110_reload \
    op interface \
    ports { localC_110_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1331 \
    name localC_111_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_111_reload \
    op interface \
    ports { localC_111_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1332 \
    name localC_112_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_112_reload \
    op interface \
    ports { localC_112_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1333 \
    name localC_113_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_113_reload \
    op interface \
    ports { localC_113_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1334 \
    name localC_114_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_114_reload \
    op interface \
    ports { localC_114_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1335 \
    name localC_115_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_115_reload \
    op interface \
    ports { localC_115_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1336 \
    name localC_116_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_116_reload \
    op interface \
    ports { localC_116_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1337 \
    name localC_117_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_117_reload \
    op interface \
    ports { localC_117_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1338 \
    name localC_118_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_118_reload \
    op interface \
    ports { localC_118_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1339 \
    name localC_119_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_119_reload \
    op interface \
    ports { localC_119_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1340 \
    name localC_120_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_120_reload \
    op interface \
    ports { localC_120_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1341 \
    name localC_121_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_121_reload \
    op interface \
    ports { localC_121_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1342 \
    name localC_122_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_122_reload \
    op interface \
    ports { localC_122_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1343 \
    name localC_123_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_123_reload \
    op interface \
    ports { localC_123_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1344 \
    name localC_124_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_124_reload \
    op interface \
    ports { localC_124_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1345 \
    name localC_125_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_125_reload \
    op interface \
    ports { localC_125_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1346 \
    name localC_126_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_126_reload \
    op interface \
    ports { localC_126_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1347 \
    name localC_127_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_127_reload \
    op interface \
    ports { localC_127_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1348 \
    name localC_128_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_128_reload \
    op interface \
    ports { localC_128_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1349 \
    name localC_129_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_129_reload \
    op interface \
    ports { localC_129_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1350 \
    name localC_130_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_130_reload \
    op interface \
    ports { localC_130_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1351 \
    name localC_131_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_131_reload \
    op interface \
    ports { localC_131_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1352 \
    name localC_132_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_132_reload \
    op interface \
    ports { localC_132_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1353 \
    name localC_133_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_133_reload \
    op interface \
    ports { localC_133_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1354 \
    name localC_134_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_134_reload \
    op interface \
    ports { localC_134_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1355 \
    name localC_135_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_135_reload \
    op interface \
    ports { localC_135_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1356 \
    name localC_136_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_136_reload \
    op interface \
    ports { localC_136_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1357 \
    name localC_137_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_137_reload \
    op interface \
    ports { localC_137_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1358 \
    name localC_138_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_138_reload \
    op interface \
    ports { localC_138_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1359 \
    name localC_139_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_139_reload \
    op interface \
    ports { localC_139_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1360 \
    name localC_140_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_140_reload \
    op interface \
    ports { localC_140_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1361 \
    name localC_141_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_141_reload \
    op interface \
    ports { localC_141_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1362 \
    name localC_142_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_142_reload \
    op interface \
    ports { localC_142_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1363 \
    name localC_143_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_143_reload \
    op interface \
    ports { localC_143_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1364 \
    name localC_144_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_144_reload \
    op interface \
    ports { localC_144_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1365 \
    name localC_145_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_145_reload \
    op interface \
    ports { localC_145_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1366 \
    name localC_146_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_146_reload \
    op interface \
    ports { localC_146_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1367 \
    name localC_147_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_147_reload \
    op interface \
    ports { localC_147_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1368 \
    name localC_148_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_148_reload \
    op interface \
    ports { localC_148_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1369 \
    name localC_149_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_149_reload \
    op interface \
    ports { localC_149_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1370 \
    name localC_150_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_150_reload \
    op interface \
    ports { localC_150_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1371 \
    name localC_151_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_151_reload \
    op interface \
    ports { localC_151_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1372 \
    name localC_152_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_152_reload \
    op interface \
    ports { localC_152_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1373 \
    name localC_153_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_153_reload \
    op interface \
    ports { localC_153_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1374 \
    name localC_154_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_154_reload \
    op interface \
    ports { localC_154_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1375 \
    name localC_155_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_155_reload \
    op interface \
    ports { localC_155_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1376 \
    name localC_156_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_156_reload \
    op interface \
    ports { localC_156_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1377 \
    name localC_157_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_157_reload \
    op interface \
    ports { localC_157_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1378 \
    name localC_158_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_158_reload \
    op interface \
    ports { localC_158_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1379 \
    name localC_159_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_159_reload \
    op interface \
    ports { localC_159_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1380 \
    name localC_160_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_160_reload \
    op interface \
    ports { localC_160_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1381 \
    name localC_161_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_161_reload \
    op interface \
    ports { localC_161_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1382 \
    name localC_162_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_162_reload \
    op interface \
    ports { localC_162_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1383 \
    name localC_163_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_163_reload \
    op interface \
    ports { localC_163_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1384 \
    name localC_164_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_164_reload \
    op interface \
    ports { localC_164_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1385 \
    name localC_165_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_165_reload \
    op interface \
    ports { localC_165_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1386 \
    name localC_166_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_166_reload \
    op interface \
    ports { localC_166_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1387 \
    name localC_167_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_167_reload \
    op interface \
    ports { localC_167_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1388 \
    name localC_168_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_168_reload \
    op interface \
    ports { localC_168_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1389 \
    name localC_169_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_169_reload \
    op interface \
    ports { localC_169_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1390 \
    name localC_170_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_170_reload \
    op interface \
    ports { localC_170_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1391 \
    name localC_171_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_171_reload \
    op interface \
    ports { localC_171_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1392 \
    name localC_172_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_172_reload \
    op interface \
    ports { localC_172_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1393 \
    name localC_173_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_173_reload \
    op interface \
    ports { localC_173_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1394 \
    name localC_174_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_174_reload \
    op interface \
    ports { localC_174_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1395 \
    name localC_175_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_175_reload \
    op interface \
    ports { localC_175_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1396 \
    name localC_176_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_176_reload \
    op interface \
    ports { localC_176_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1397 \
    name localC_177_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_177_reload \
    op interface \
    ports { localC_177_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1398 \
    name localC_178_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_178_reload \
    op interface \
    ports { localC_178_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1399 \
    name localC_179_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_179_reload \
    op interface \
    ports { localC_179_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1400 \
    name localC_180_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_180_reload \
    op interface \
    ports { localC_180_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1401 \
    name localC_181_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_181_reload \
    op interface \
    ports { localC_181_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1402 \
    name localC_182_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_182_reload \
    op interface \
    ports { localC_182_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1403 \
    name localC_183_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_183_reload \
    op interface \
    ports { localC_183_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1404 \
    name localC_184_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_184_reload \
    op interface \
    ports { localC_184_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1405 \
    name localC_185_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_185_reload \
    op interface \
    ports { localC_185_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1406 \
    name localC_186_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_186_reload \
    op interface \
    ports { localC_186_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1407 \
    name localC_187_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_187_reload \
    op interface \
    ports { localC_187_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1408 \
    name localC_188_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_188_reload \
    op interface \
    ports { localC_188_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1409 \
    name localC_189_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_189_reload \
    op interface \
    ports { localC_189_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1410 \
    name localC_190_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_190_reload \
    op interface \
    ports { localC_190_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1411 \
    name localC_191_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_191_reload \
    op interface \
    ports { localC_191_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1412 \
    name localC_192_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_192_reload \
    op interface \
    ports { localC_192_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1413 \
    name localC_193_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_193_reload \
    op interface \
    ports { localC_193_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1414 \
    name localC_194_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_194_reload \
    op interface \
    ports { localC_194_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1415 \
    name localC_195_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_195_reload \
    op interface \
    ports { localC_195_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1416 \
    name localC_196_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_196_reload \
    op interface \
    ports { localC_196_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1417 \
    name localC_197_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_197_reload \
    op interface \
    ports { localC_197_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1418 \
    name localC_198_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_198_reload \
    op interface \
    ports { localC_198_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1419 \
    name localC_199_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_199_reload \
    op interface \
    ports { localC_199_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1420 \
    name localC_200_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_200_reload \
    op interface \
    ports { localC_200_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1421 \
    name localC_201_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_201_reload \
    op interface \
    ports { localC_201_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1422 \
    name localC_202_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_202_reload \
    op interface \
    ports { localC_202_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1423 \
    name localC_203_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_203_reload \
    op interface \
    ports { localC_203_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1424 \
    name localC_204_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_204_reload \
    op interface \
    ports { localC_204_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1425 \
    name localC_205_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_205_reload \
    op interface \
    ports { localC_205_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1426 \
    name localC_206_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_206_reload \
    op interface \
    ports { localC_206_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1427 \
    name localC_207_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_207_reload \
    op interface \
    ports { localC_207_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1428 \
    name localC_208_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_208_reload \
    op interface \
    ports { localC_208_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1429 \
    name localC_209_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_209_reload \
    op interface \
    ports { localC_209_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1430 \
    name localC_210_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_210_reload \
    op interface \
    ports { localC_210_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1431 \
    name localC_211_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_211_reload \
    op interface \
    ports { localC_211_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1432 \
    name localC_212_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_212_reload \
    op interface \
    ports { localC_212_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1433 \
    name localC_213_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_213_reload \
    op interface \
    ports { localC_213_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1434 \
    name localC_214_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_214_reload \
    op interface \
    ports { localC_214_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1435 \
    name localC_215_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_215_reload \
    op interface \
    ports { localC_215_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1436 \
    name localC_216_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_216_reload \
    op interface \
    ports { localC_216_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1437 \
    name localC_217_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_217_reload \
    op interface \
    ports { localC_217_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1438 \
    name localC_218_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_218_reload \
    op interface \
    ports { localC_218_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1439 \
    name localC_219_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_219_reload \
    op interface \
    ports { localC_219_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1440 \
    name localC_220_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_220_reload \
    op interface \
    ports { localC_220_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1441 \
    name localC_221_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_221_reload \
    op interface \
    ports { localC_221_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1442 \
    name localC_222_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_222_reload \
    op interface \
    ports { localC_222_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1443 \
    name localC_223_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_223_reload \
    op interface \
    ports { localC_223_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1444 \
    name localC_224_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_224_reload \
    op interface \
    ports { localC_224_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1445 \
    name localC_225_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_225_reload \
    op interface \
    ports { localC_225_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1446 \
    name localC_226_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_226_reload \
    op interface \
    ports { localC_226_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1447 \
    name localC_227_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_227_reload \
    op interface \
    ports { localC_227_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1448 \
    name localC_228_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_228_reload \
    op interface \
    ports { localC_228_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1449 \
    name localC_229_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_229_reload \
    op interface \
    ports { localC_229_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1450 \
    name localC_230_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_230_reload \
    op interface \
    ports { localC_230_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1451 \
    name localC_231_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_231_reload \
    op interface \
    ports { localC_231_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1452 \
    name localC_232_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_232_reload \
    op interface \
    ports { localC_232_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1453 \
    name localC_233_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_233_reload \
    op interface \
    ports { localC_233_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1454 \
    name localC_234_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_234_reload \
    op interface \
    ports { localC_234_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1455 \
    name localC_235_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_235_reload \
    op interface \
    ports { localC_235_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1456 \
    name localC_236_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_236_reload \
    op interface \
    ports { localC_236_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1457 \
    name localC_237_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_237_reload \
    op interface \
    ports { localC_237_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1458 \
    name localC_238_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_238_reload \
    op interface \
    ports { localC_238_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1459 \
    name localC_239_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_239_reload \
    op interface \
    ports { localC_239_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1460 \
    name localC_240_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_240_reload \
    op interface \
    ports { localC_240_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1461 \
    name localC_241_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_241_reload \
    op interface \
    ports { localC_241_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1462 \
    name localC_242_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_242_reload \
    op interface \
    ports { localC_242_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1463 \
    name localC_243_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_243_reload \
    op interface \
    ports { localC_243_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1464 \
    name localC_244_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_244_reload \
    op interface \
    ports { localC_244_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1465 \
    name localC_245_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_245_reload \
    op interface \
    ports { localC_245_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1466 \
    name localC_246_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_246_reload \
    op interface \
    ports { localC_246_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1467 \
    name localC_247_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_247_reload \
    op interface \
    ports { localC_247_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1468 \
    name localC_248_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_248_reload \
    op interface \
    ports { localC_248_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1469 \
    name localC_249_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_249_reload \
    op interface \
    ports { localC_249_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1470 \
    name localC_250_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_250_reload \
    op interface \
    ports { localC_250_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1471 \
    name localC_251_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_251_reload \
    op interface \
    ports { localC_251_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1472 \
    name localC_252_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_252_reload \
    op interface \
    ports { localC_252_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1473 \
    name localC_253_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_253_reload \
    op interface \
    ports { localC_253_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1474 \
    name localC_254_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_254_reload \
    op interface \
    ports { localC_254_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1475 \
    name localC_255_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_255_reload \
    op interface \
    ports { localC_255_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1476 \
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


