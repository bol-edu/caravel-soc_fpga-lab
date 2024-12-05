# This script segment is generated automatically by AutoPilot

set id 91
set name mmult_mux_166_32_1_1
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
set din16_width 6
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


set id 92
set name mmult_mux_164_32_1_1
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
set din16_width 4
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


set name mmult_mul_32s_32s_32_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
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
    id 382 \
    name inB_15_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inB_15_0_reload \
    op interface \
    ports { inB_15_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 383 \
    name inB_14_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inB_14_0_reload \
    op interface \
    ports { inB_14_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 384 \
    name inB_13_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inB_13_0_reload \
    op interface \
    ports { inB_13_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 385 \
    name inB_12_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inB_12_0_reload \
    op interface \
    ports { inB_12_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 386 \
    name inB_11_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inB_11_0_reload \
    op interface \
    ports { inB_11_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 387 \
    name inB_10_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inB_10_0_reload \
    op interface \
    ports { inB_10_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 388 \
    name inB_9_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inB_9_0_reload \
    op interface \
    ports { inB_9_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 389 \
    name inB_8_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inB_8_0_reload \
    op interface \
    ports { inB_8_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 390 \
    name inB_7_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inB_7_0_reload \
    op interface \
    ports { inB_7_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 391 \
    name inB_6_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inB_6_0_reload \
    op interface \
    ports { inB_6_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 392 \
    name inB_5_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inB_5_0_reload \
    op interface \
    ports { inB_5_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 393 \
    name inB_4_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inB_4_0_reload \
    op interface \
    ports { inB_4_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 394 \
    name inB_3_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inB_3_0_reload \
    op interface \
    ports { inB_3_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 395 \
    name inB_2_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inB_2_0_reload \
    op interface \
    ports { inB_2_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 396 \
    name inB_1_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inB_1_0_reload \
    op interface \
    ports { inB_1_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 397 \
    name inB_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inB_0_reload \
    op interface \
    ports { inB_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 398 \
    name inA_225_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inA_225_0_reload \
    op interface \
    ports { inA_225_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 399 \
    name inA_210_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inA_210_0_reload \
    op interface \
    ports { inA_210_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 400 \
    name inA_195_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inA_195_0_reload \
    op interface \
    ports { inA_195_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 401 \
    name inA_180_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inA_180_0_reload \
    op interface \
    ports { inA_180_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 402 \
    name inA_165_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inA_165_0_reload \
    op interface \
    ports { inA_165_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 403 \
    name inA_150_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inA_150_0_reload \
    op interface \
    ports { inA_150_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 404 \
    name inA_135_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inA_135_0_reload \
    op interface \
    ports { inA_135_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 405 \
    name inA_120_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inA_120_0_reload \
    op interface \
    ports { inA_120_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 406 \
    name inA_105_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inA_105_0_reload \
    op interface \
    ports { inA_105_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 407 \
    name inA_90_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inA_90_0_reload \
    op interface \
    ports { inA_90_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 408 \
    name inA_75_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inA_75_0_reload \
    op interface \
    ports { inA_75_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 409 \
    name inA_60_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inA_60_0_reload \
    op interface \
    ports { inA_60_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 410 \
    name inA_45_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inA_45_0_reload \
    op interface \
    ports { inA_45_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 411 \
    name inA_30_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inA_30_0_reload \
    op interface \
    ports { inA_30_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 412 \
    name inA_15_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inA_15_0_reload \
    op interface \
    ports { inA_15_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 413 \
    name inA_0_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inA_0_reload \
    op interface \
    ports { inA_0_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 414 \
    name arrayidx2224_15_15_promoted_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_arrayidx2224_15_15_promoted_reload \
    op interface \
    ports { arrayidx2224_15_15_promoted_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 415 \
    name arrayidx2224_14_15_promoted_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_arrayidx2224_14_15_promoted_reload \
    op interface \
    ports { arrayidx2224_14_15_promoted_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 416 \
    name arrayidx2224_13_15_promoted_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_arrayidx2224_13_15_promoted_reload \
    op interface \
    ports { arrayidx2224_13_15_promoted_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 417 \
    name arrayidx2224_12_15_promoted_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_arrayidx2224_12_15_promoted_reload \
    op interface \
    ports { arrayidx2224_12_15_promoted_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 418 \
    name arrayidx2224_11_15_promoted_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_arrayidx2224_11_15_promoted_reload \
    op interface \
    ports { arrayidx2224_11_15_promoted_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 419 \
    name arrayidx2224_10_15_promoted_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_arrayidx2224_10_15_promoted_reload \
    op interface \
    ports { arrayidx2224_10_15_promoted_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 420 \
    name arrayidx2224_9_15_promoted_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_arrayidx2224_9_15_promoted_reload \
    op interface \
    ports { arrayidx2224_9_15_promoted_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 421 \
    name arrayidx2224_8_15_promoted_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_arrayidx2224_8_15_promoted_reload \
    op interface \
    ports { arrayidx2224_8_15_promoted_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 422 \
    name arrayidx2224_7_15_promoted_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_arrayidx2224_7_15_promoted_reload \
    op interface \
    ports { arrayidx2224_7_15_promoted_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 423 \
    name arrayidx2224_6_15_promoted_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_arrayidx2224_6_15_promoted_reload \
    op interface \
    ports { arrayidx2224_6_15_promoted_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 424 \
    name arrayidx2224_5_15_promoted_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_arrayidx2224_5_15_promoted_reload \
    op interface \
    ports { arrayidx2224_5_15_promoted_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 425 \
    name arrayidx2224_4_15_promoted_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_arrayidx2224_4_15_promoted_reload \
    op interface \
    ports { arrayidx2224_4_15_promoted_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 426 \
    name arrayidx2224_3_15_promoted_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_arrayidx2224_3_15_promoted_reload \
    op interface \
    ports { arrayidx2224_3_15_promoted_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 427 \
    name arrayidx2224_2_15_promoted_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_arrayidx2224_2_15_promoted_reload \
    op interface \
    ports { arrayidx2224_2_15_promoted_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 428 \
    name arrayidx2224_1_15_promoted_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_arrayidx2224_1_15_promoted_reload \
    op interface \
    ports { arrayidx2224_1_15_promoted_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 429 \
    name arrayidx2224_15226_promoted_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_arrayidx2224_15226_promoted_reload \
    op interface \
    ports { arrayidx2224_15226_promoted_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 430 \
    name localA_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_load \
    op interface \
    ports { localA_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 431 \
    name localA_1_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_1_load \
    op interface \
    ports { localA_1_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 432 \
    name localA_2_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_2_load \
    op interface \
    ports { localA_2_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 433 \
    name localA_3_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_3_load \
    op interface \
    ports { localA_3_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 434 \
    name localA_4_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_4_load \
    op interface \
    ports { localA_4_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 435 \
    name localA_5_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_5_load \
    op interface \
    ports { localA_5_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 436 \
    name localA_6_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_6_load \
    op interface \
    ports { localA_6_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 437 \
    name localA_7_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_7_load \
    op interface \
    ports { localA_7_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 438 \
    name localA_8_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_8_load \
    op interface \
    ports { localA_8_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 439 \
    name localA_9_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_9_load \
    op interface \
    ports { localA_9_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 440 \
    name localA_10_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_10_load \
    op interface \
    ports { localA_10_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 441 \
    name localA_11_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_11_load \
    op interface \
    ports { localA_11_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 442 \
    name localA_12_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_12_load \
    op interface \
    ports { localA_12_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 443 \
    name localA_13_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_13_load \
    op interface \
    ports { localA_13_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 444 \
    name localA_14_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_14_load \
    op interface \
    ports { localA_14_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 445 \
    name localA_15_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_15_load \
    op interface \
    ports { localA_15_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 446 \
    name localA_15_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_15_load_1 \
    op interface \
    ports { localA_15_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 447 \
    name localA_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_load_1 \
    op interface \
    ports { localA_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 448 \
    name localA_1_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_1_load_1 \
    op interface \
    ports { localA_1_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 449 \
    name localA_2_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_2_load_1 \
    op interface \
    ports { localA_2_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 450 \
    name localA_3_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_3_load_1 \
    op interface \
    ports { localA_3_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 451 \
    name localA_4_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_4_load_1 \
    op interface \
    ports { localA_4_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 452 \
    name localA_5_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_5_load_1 \
    op interface \
    ports { localA_5_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 453 \
    name localA_6_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_6_load_1 \
    op interface \
    ports { localA_6_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 454 \
    name localA_7_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_7_load_1 \
    op interface \
    ports { localA_7_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 455 \
    name localA_8_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_8_load_1 \
    op interface \
    ports { localA_8_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 456 \
    name localA_9_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_9_load_1 \
    op interface \
    ports { localA_9_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 457 \
    name localA_10_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_10_load_1 \
    op interface \
    ports { localA_10_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 458 \
    name localA_11_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_11_load_1 \
    op interface \
    ports { localA_11_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 459 \
    name localA_12_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_12_load_1 \
    op interface \
    ports { localA_12_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 460 \
    name localA_13_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_13_load_1 \
    op interface \
    ports { localA_13_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 461 \
    name localA_14_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_14_load_1 \
    op interface \
    ports { localA_14_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 462 \
    name localA_14_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_14_load_2 \
    op interface \
    ports { localA_14_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 463 \
    name localA_15_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_15_load_2 \
    op interface \
    ports { localA_15_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 464 \
    name localA_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_load_2 \
    op interface \
    ports { localA_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 465 \
    name localA_1_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_1_load_2 \
    op interface \
    ports { localA_1_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 466 \
    name localA_2_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_2_load_2 \
    op interface \
    ports { localA_2_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 467 \
    name localA_3_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_3_load_2 \
    op interface \
    ports { localA_3_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 468 \
    name localA_4_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_4_load_2 \
    op interface \
    ports { localA_4_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 469 \
    name localA_5_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_5_load_2 \
    op interface \
    ports { localA_5_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 470 \
    name localA_6_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_6_load_2 \
    op interface \
    ports { localA_6_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 471 \
    name localA_7_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_7_load_2 \
    op interface \
    ports { localA_7_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 472 \
    name localA_8_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_8_load_2 \
    op interface \
    ports { localA_8_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 473 \
    name localA_9_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_9_load_2 \
    op interface \
    ports { localA_9_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 474 \
    name localA_10_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_10_load_2 \
    op interface \
    ports { localA_10_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 475 \
    name localA_11_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_11_load_2 \
    op interface \
    ports { localA_11_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 476 \
    name localA_12_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_12_load_2 \
    op interface \
    ports { localA_12_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 477 \
    name localA_13_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_13_load_2 \
    op interface \
    ports { localA_13_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 478 \
    name localA_13_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_13_load_3 \
    op interface \
    ports { localA_13_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 479 \
    name localA_14_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_14_load_3 \
    op interface \
    ports { localA_14_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 480 \
    name localA_15_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_15_load_3 \
    op interface \
    ports { localA_15_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 481 \
    name localA_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_load_3 \
    op interface \
    ports { localA_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 482 \
    name localA_1_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_1_load_3 \
    op interface \
    ports { localA_1_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 483 \
    name localA_2_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_2_load_3 \
    op interface \
    ports { localA_2_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 484 \
    name localA_3_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_3_load_3 \
    op interface \
    ports { localA_3_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 485 \
    name localA_4_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_4_load_3 \
    op interface \
    ports { localA_4_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 486 \
    name localA_5_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_5_load_3 \
    op interface \
    ports { localA_5_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 487 \
    name localA_6_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_6_load_3 \
    op interface \
    ports { localA_6_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 488 \
    name localA_7_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_7_load_3 \
    op interface \
    ports { localA_7_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 489 \
    name localA_8_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_8_load_3 \
    op interface \
    ports { localA_8_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 490 \
    name localA_9_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_9_load_3 \
    op interface \
    ports { localA_9_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 491 \
    name localA_10_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_10_load_3 \
    op interface \
    ports { localA_10_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 492 \
    name localA_11_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_11_load_3 \
    op interface \
    ports { localA_11_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 493 \
    name localA_12_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_12_load_3 \
    op interface \
    ports { localA_12_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 494 \
    name localA_12_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_12_load_4 \
    op interface \
    ports { localA_12_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 495 \
    name localA_13_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_13_load_4 \
    op interface \
    ports { localA_13_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 496 \
    name localA_14_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_14_load_4 \
    op interface \
    ports { localA_14_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 497 \
    name localA_15_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_15_load_4 \
    op interface \
    ports { localA_15_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 498 \
    name localA_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_load_4 \
    op interface \
    ports { localA_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 499 \
    name localA_1_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_1_load_4 \
    op interface \
    ports { localA_1_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 500 \
    name localA_2_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_2_load_4 \
    op interface \
    ports { localA_2_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 501 \
    name localA_3_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_3_load_4 \
    op interface \
    ports { localA_3_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 502 \
    name localA_4_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_4_load_4 \
    op interface \
    ports { localA_4_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 503 \
    name localA_5_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_5_load_4 \
    op interface \
    ports { localA_5_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 504 \
    name localA_6_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_6_load_4 \
    op interface \
    ports { localA_6_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 505 \
    name localA_7_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_7_load_4 \
    op interface \
    ports { localA_7_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 506 \
    name localA_8_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_8_load_4 \
    op interface \
    ports { localA_8_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 507 \
    name localA_9_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_9_load_4 \
    op interface \
    ports { localA_9_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 508 \
    name localA_10_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_10_load_4 \
    op interface \
    ports { localA_10_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 509 \
    name localA_11_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_11_load_4 \
    op interface \
    ports { localA_11_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 510 \
    name localA_11_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_11_load_5 \
    op interface \
    ports { localA_11_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 511 \
    name localA_12_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_12_load_5 \
    op interface \
    ports { localA_12_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 512 \
    name localA_13_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_13_load_5 \
    op interface \
    ports { localA_13_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 513 \
    name localA_14_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_14_load_5 \
    op interface \
    ports { localA_14_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 514 \
    name localA_15_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_15_load_5 \
    op interface \
    ports { localA_15_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 515 \
    name localA_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_load_5 \
    op interface \
    ports { localA_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 516 \
    name localA_1_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_1_load_5 \
    op interface \
    ports { localA_1_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 517 \
    name localA_2_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_2_load_5 \
    op interface \
    ports { localA_2_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 518 \
    name localA_3_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_3_load_5 \
    op interface \
    ports { localA_3_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 519 \
    name localA_4_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_4_load_5 \
    op interface \
    ports { localA_4_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 520 \
    name localA_5_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_5_load_5 \
    op interface \
    ports { localA_5_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 521 \
    name localA_6_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_6_load_5 \
    op interface \
    ports { localA_6_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 522 \
    name localA_7_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_7_load_5 \
    op interface \
    ports { localA_7_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 523 \
    name localA_8_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_8_load_5 \
    op interface \
    ports { localA_8_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 524 \
    name localA_9_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_9_load_5 \
    op interface \
    ports { localA_9_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 525 \
    name localA_10_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_10_load_5 \
    op interface \
    ports { localA_10_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 526 \
    name localA_10_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_10_load_6 \
    op interface \
    ports { localA_10_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 527 \
    name localA_11_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_11_load_6 \
    op interface \
    ports { localA_11_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 528 \
    name localA_12_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_12_load_6 \
    op interface \
    ports { localA_12_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 529 \
    name localA_13_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_13_load_6 \
    op interface \
    ports { localA_13_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 530 \
    name localA_14_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_14_load_6 \
    op interface \
    ports { localA_14_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 531 \
    name localA_15_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_15_load_6 \
    op interface \
    ports { localA_15_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 532 \
    name localA_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_load_6 \
    op interface \
    ports { localA_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 533 \
    name localA_1_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_1_load_6 \
    op interface \
    ports { localA_1_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 534 \
    name localA_2_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_2_load_6 \
    op interface \
    ports { localA_2_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 535 \
    name localA_3_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_3_load_6 \
    op interface \
    ports { localA_3_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 536 \
    name localA_4_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_4_load_6 \
    op interface \
    ports { localA_4_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 537 \
    name localA_5_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_5_load_6 \
    op interface \
    ports { localA_5_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 538 \
    name localA_6_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_6_load_6 \
    op interface \
    ports { localA_6_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 539 \
    name localA_7_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_7_load_6 \
    op interface \
    ports { localA_7_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 540 \
    name localA_8_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_8_load_6 \
    op interface \
    ports { localA_8_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 541 \
    name localA_9_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_9_load_6 \
    op interface \
    ports { localA_9_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 542 \
    name localA_9_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_9_load_7 \
    op interface \
    ports { localA_9_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 543 \
    name localA_10_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_10_load_7 \
    op interface \
    ports { localA_10_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 544 \
    name localA_11_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_11_load_7 \
    op interface \
    ports { localA_11_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 545 \
    name localA_12_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_12_load_7 \
    op interface \
    ports { localA_12_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 546 \
    name localA_13_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_13_load_7 \
    op interface \
    ports { localA_13_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 547 \
    name localA_14_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_14_load_7 \
    op interface \
    ports { localA_14_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 548 \
    name localA_15_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_15_load_7 \
    op interface \
    ports { localA_15_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 549 \
    name localA_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_load_7 \
    op interface \
    ports { localA_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 550 \
    name localA_1_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_1_load_7 \
    op interface \
    ports { localA_1_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 551 \
    name localA_2_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_2_load_7 \
    op interface \
    ports { localA_2_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 552 \
    name localA_3_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_3_load_7 \
    op interface \
    ports { localA_3_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 553 \
    name localA_4_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_4_load_7 \
    op interface \
    ports { localA_4_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 554 \
    name localA_5_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_5_load_7 \
    op interface \
    ports { localA_5_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 555 \
    name localA_6_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_6_load_7 \
    op interface \
    ports { localA_6_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 556 \
    name localA_7_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_7_load_7 \
    op interface \
    ports { localA_7_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 557 \
    name localA_8_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_8_load_7 \
    op interface \
    ports { localA_8_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 558 \
    name localA_8_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_8_load_8 \
    op interface \
    ports { localA_8_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 559 \
    name localA_9_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_9_load_8 \
    op interface \
    ports { localA_9_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 560 \
    name localA_10_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_10_load_8 \
    op interface \
    ports { localA_10_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 561 \
    name localA_11_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_11_load_8 \
    op interface \
    ports { localA_11_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 562 \
    name localA_12_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_12_load_8 \
    op interface \
    ports { localA_12_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 563 \
    name localA_13_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_13_load_8 \
    op interface \
    ports { localA_13_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 564 \
    name localA_14_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_14_load_8 \
    op interface \
    ports { localA_14_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 565 \
    name localA_15_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_15_load_8 \
    op interface \
    ports { localA_15_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 566 \
    name localA_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_load_8 \
    op interface \
    ports { localA_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 567 \
    name localA_1_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_1_load_8 \
    op interface \
    ports { localA_1_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 568 \
    name localA_2_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_2_load_8 \
    op interface \
    ports { localA_2_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 569 \
    name localA_3_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_3_load_8 \
    op interface \
    ports { localA_3_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 570 \
    name localA_4_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_4_load_8 \
    op interface \
    ports { localA_4_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 571 \
    name localA_5_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_5_load_8 \
    op interface \
    ports { localA_5_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 572 \
    name localA_6_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_6_load_8 \
    op interface \
    ports { localA_6_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 573 \
    name localA_7_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_7_load_8 \
    op interface \
    ports { localA_7_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 574 \
    name localA_7_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_7_load_9 \
    op interface \
    ports { localA_7_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 575 \
    name localA_8_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_8_load_9 \
    op interface \
    ports { localA_8_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 576 \
    name localA_9_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_9_load_9 \
    op interface \
    ports { localA_9_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 577 \
    name localA_10_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_10_load_9 \
    op interface \
    ports { localA_10_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 578 \
    name localA_11_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_11_load_9 \
    op interface \
    ports { localA_11_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 579 \
    name localA_12_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_12_load_9 \
    op interface \
    ports { localA_12_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 580 \
    name localA_13_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_13_load_9 \
    op interface \
    ports { localA_13_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 581 \
    name localA_14_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_14_load_9 \
    op interface \
    ports { localA_14_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 582 \
    name localA_15_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_15_load_9 \
    op interface \
    ports { localA_15_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 583 \
    name localA_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_load_9 \
    op interface \
    ports { localA_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 584 \
    name localA_1_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_1_load_9 \
    op interface \
    ports { localA_1_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 585 \
    name localA_2_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_2_load_9 \
    op interface \
    ports { localA_2_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 586 \
    name localA_3_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_3_load_9 \
    op interface \
    ports { localA_3_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 587 \
    name localA_4_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_4_load_9 \
    op interface \
    ports { localA_4_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 588 \
    name localA_5_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_5_load_9 \
    op interface \
    ports { localA_5_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 589 \
    name localA_6_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_6_load_9 \
    op interface \
    ports { localA_6_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 590 \
    name localA_6_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_6_load_10 \
    op interface \
    ports { localA_6_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 591 \
    name localA_7_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_7_load_10 \
    op interface \
    ports { localA_7_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 592 \
    name localA_8_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_8_load_10 \
    op interface \
    ports { localA_8_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 593 \
    name localA_9_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_9_load_10 \
    op interface \
    ports { localA_9_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 594 \
    name localA_10_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_10_load_10 \
    op interface \
    ports { localA_10_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 595 \
    name localA_11_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_11_load_10 \
    op interface \
    ports { localA_11_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 596 \
    name localA_12_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_12_load_10 \
    op interface \
    ports { localA_12_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 597 \
    name localA_13_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_13_load_10 \
    op interface \
    ports { localA_13_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 598 \
    name localA_14_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_14_load_10 \
    op interface \
    ports { localA_14_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 599 \
    name localA_15_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_15_load_10 \
    op interface \
    ports { localA_15_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 600 \
    name localA_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_load_10 \
    op interface \
    ports { localA_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 601 \
    name localA_1_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_1_load_10 \
    op interface \
    ports { localA_1_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 602 \
    name localA_2_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_2_load_10 \
    op interface \
    ports { localA_2_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 603 \
    name localA_3_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_3_load_10 \
    op interface \
    ports { localA_3_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 604 \
    name localA_4_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_4_load_10 \
    op interface \
    ports { localA_4_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 605 \
    name localA_5_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_5_load_10 \
    op interface \
    ports { localA_5_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 606 \
    name localA_5_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_5_load_11 \
    op interface \
    ports { localA_5_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 607 \
    name localA_6_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_6_load_11 \
    op interface \
    ports { localA_6_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 608 \
    name localA_7_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_7_load_11 \
    op interface \
    ports { localA_7_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 609 \
    name localA_8_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_8_load_11 \
    op interface \
    ports { localA_8_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 610 \
    name localA_9_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_9_load_11 \
    op interface \
    ports { localA_9_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 611 \
    name localA_10_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_10_load_11 \
    op interface \
    ports { localA_10_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 612 \
    name localA_11_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_11_load_11 \
    op interface \
    ports { localA_11_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 613 \
    name localA_12_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_12_load_11 \
    op interface \
    ports { localA_12_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 614 \
    name localA_13_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_13_load_11 \
    op interface \
    ports { localA_13_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 615 \
    name localA_14_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_14_load_11 \
    op interface \
    ports { localA_14_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 616 \
    name localA_15_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_15_load_11 \
    op interface \
    ports { localA_15_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 617 \
    name localA_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_load_11 \
    op interface \
    ports { localA_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 618 \
    name localA_1_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_1_load_11 \
    op interface \
    ports { localA_1_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 619 \
    name localA_2_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_2_load_11 \
    op interface \
    ports { localA_2_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 620 \
    name localA_3_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_3_load_11 \
    op interface \
    ports { localA_3_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 621 \
    name localA_4_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_4_load_11 \
    op interface \
    ports { localA_4_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 622 \
    name localA_4_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_4_load_12 \
    op interface \
    ports { localA_4_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 623 \
    name localA_5_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_5_load_12 \
    op interface \
    ports { localA_5_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 624 \
    name localA_6_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_6_load_12 \
    op interface \
    ports { localA_6_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 625 \
    name localA_7_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_7_load_12 \
    op interface \
    ports { localA_7_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 626 \
    name localA_8_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_8_load_12 \
    op interface \
    ports { localA_8_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 627 \
    name localA_9_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_9_load_12 \
    op interface \
    ports { localA_9_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 628 \
    name localA_10_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_10_load_12 \
    op interface \
    ports { localA_10_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 629 \
    name localA_11_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_11_load_12 \
    op interface \
    ports { localA_11_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 630 \
    name localA_12_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_12_load_12 \
    op interface \
    ports { localA_12_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 631 \
    name localA_13_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_13_load_12 \
    op interface \
    ports { localA_13_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 632 \
    name localA_14_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_14_load_12 \
    op interface \
    ports { localA_14_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 633 \
    name localA_15_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_15_load_12 \
    op interface \
    ports { localA_15_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 634 \
    name localA_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_load_12 \
    op interface \
    ports { localA_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 635 \
    name localA_1_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_1_load_12 \
    op interface \
    ports { localA_1_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 636 \
    name localA_2_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_2_load_12 \
    op interface \
    ports { localA_2_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 637 \
    name localA_3_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_3_load_12 \
    op interface \
    ports { localA_3_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 638 \
    name localA_3_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_3_load_13 \
    op interface \
    ports { localA_3_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 639 \
    name localA_4_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_4_load_13 \
    op interface \
    ports { localA_4_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 640 \
    name localA_5_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_5_load_13 \
    op interface \
    ports { localA_5_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 641 \
    name localA_6_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_6_load_13 \
    op interface \
    ports { localA_6_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 642 \
    name localA_7_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_7_load_13 \
    op interface \
    ports { localA_7_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 643 \
    name localA_8_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_8_load_13 \
    op interface \
    ports { localA_8_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 644 \
    name localA_9_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_9_load_13 \
    op interface \
    ports { localA_9_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 645 \
    name localA_10_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_10_load_13 \
    op interface \
    ports { localA_10_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 646 \
    name localA_11_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_11_load_13 \
    op interface \
    ports { localA_11_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 647 \
    name localA_12_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_12_load_13 \
    op interface \
    ports { localA_12_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 648 \
    name localA_13_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_13_load_13 \
    op interface \
    ports { localA_13_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 649 \
    name localA_14_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_14_load_13 \
    op interface \
    ports { localA_14_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 650 \
    name localA_15_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_15_load_13 \
    op interface \
    ports { localA_15_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 651 \
    name localA_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_load_13 \
    op interface \
    ports { localA_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 652 \
    name localA_1_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_1_load_13 \
    op interface \
    ports { localA_1_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 653 \
    name localA_2_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_2_load_13 \
    op interface \
    ports { localA_2_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 654 \
    name localA_2_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_2_load_14 \
    op interface \
    ports { localA_2_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 655 \
    name localA_3_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_3_load_14 \
    op interface \
    ports { localA_3_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 656 \
    name localA_4_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_4_load_14 \
    op interface \
    ports { localA_4_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 657 \
    name localA_5_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_5_load_14 \
    op interface \
    ports { localA_5_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 658 \
    name localA_6_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_6_load_14 \
    op interface \
    ports { localA_6_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 659 \
    name localA_7_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_7_load_14 \
    op interface \
    ports { localA_7_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 660 \
    name localA_8_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_8_load_14 \
    op interface \
    ports { localA_8_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 661 \
    name localA_9_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_9_load_14 \
    op interface \
    ports { localA_9_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 662 \
    name localA_10_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_10_load_14 \
    op interface \
    ports { localA_10_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 663 \
    name localA_11_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_11_load_14 \
    op interface \
    ports { localA_11_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 664 \
    name localA_12_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_12_load_14 \
    op interface \
    ports { localA_12_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 665 \
    name localA_13_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_13_load_14 \
    op interface \
    ports { localA_13_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 666 \
    name localA_14_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_14_load_14 \
    op interface \
    ports { localA_14_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 667 \
    name localA_15_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_15_load_14 \
    op interface \
    ports { localA_15_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 668 \
    name localA_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_load_14 \
    op interface \
    ports { localA_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 669 \
    name localA_1_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_1_load_14 \
    op interface \
    ports { localA_1_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 670 \
    name localA_1_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_1_load_15 \
    op interface \
    ports { localA_1_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 671 \
    name localA_2_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_2_load_15 \
    op interface \
    ports { localA_2_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 672 \
    name localA_3_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_3_load_15 \
    op interface \
    ports { localA_3_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 673 \
    name localA_4_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_4_load_15 \
    op interface \
    ports { localA_4_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 674 \
    name localA_5_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_5_load_15 \
    op interface \
    ports { localA_5_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 675 \
    name localA_6_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_6_load_15 \
    op interface \
    ports { localA_6_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 676 \
    name localA_7_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_7_load_15 \
    op interface \
    ports { localA_7_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 677 \
    name localA_8_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_8_load_15 \
    op interface \
    ports { localA_8_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 678 \
    name localA_9_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_9_load_15 \
    op interface \
    ports { localA_9_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 679 \
    name localA_10_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_10_load_15 \
    op interface \
    ports { localA_10_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 680 \
    name localA_11_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_11_load_15 \
    op interface \
    ports { localA_11_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 681 \
    name localA_12_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_12_load_15 \
    op interface \
    ports { localA_12_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 682 \
    name localA_13_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_13_load_15 \
    op interface \
    ports { localA_13_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 683 \
    name localA_14_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_14_load_15 \
    op interface \
    ports { localA_14_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 684 \
    name localA_15_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_15_load_15 \
    op interface \
    ports { localA_15_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 685 \
    name localA_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localA_load_15 \
    op interface \
    ports { localA_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 686 \
    name localB_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_load \
    op interface \
    ports { localB_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 687 \
    name localB_1_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_1_load \
    op interface \
    ports { localB_1_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 688 \
    name localB_2_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_2_load \
    op interface \
    ports { localB_2_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 689 \
    name localB_3_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_3_load \
    op interface \
    ports { localB_3_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 690 \
    name localB_4_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_4_load \
    op interface \
    ports { localB_4_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 691 \
    name localB_5_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_5_load \
    op interface \
    ports { localB_5_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 692 \
    name localB_6_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_6_load \
    op interface \
    ports { localB_6_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 693 \
    name localB_7_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_7_load \
    op interface \
    ports { localB_7_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 694 \
    name localB_8_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_8_load \
    op interface \
    ports { localB_8_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 695 \
    name localB_9_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_9_load \
    op interface \
    ports { localB_9_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 696 \
    name localB_10_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_10_load \
    op interface \
    ports { localB_10_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 697 \
    name localB_11_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_11_load \
    op interface \
    ports { localB_11_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 698 \
    name localB_12_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_12_load \
    op interface \
    ports { localB_12_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 699 \
    name localB_13_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_13_load \
    op interface \
    ports { localB_13_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 700 \
    name localB_14_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_14_load \
    op interface \
    ports { localB_14_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 701 \
    name localB_15_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_15_load \
    op interface \
    ports { localB_15_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 702 \
    name localB_15_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_15_load_1 \
    op interface \
    ports { localB_15_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 703 \
    name localB_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_load_1 \
    op interface \
    ports { localB_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 704 \
    name localB_1_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_1_load_1 \
    op interface \
    ports { localB_1_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 705 \
    name localB_2_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_2_load_1 \
    op interface \
    ports { localB_2_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 706 \
    name localB_3_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_3_load_1 \
    op interface \
    ports { localB_3_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 707 \
    name localB_4_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_4_load_1 \
    op interface \
    ports { localB_4_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 708 \
    name localB_5_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_5_load_1 \
    op interface \
    ports { localB_5_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 709 \
    name localB_6_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_6_load_1 \
    op interface \
    ports { localB_6_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 710 \
    name localB_7_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_7_load_1 \
    op interface \
    ports { localB_7_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 711 \
    name localB_8_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_8_load_1 \
    op interface \
    ports { localB_8_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 712 \
    name localB_9_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_9_load_1 \
    op interface \
    ports { localB_9_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 713 \
    name localB_10_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_10_load_1 \
    op interface \
    ports { localB_10_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 714 \
    name localB_11_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_11_load_1 \
    op interface \
    ports { localB_11_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 715 \
    name localB_12_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_12_load_1 \
    op interface \
    ports { localB_12_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 716 \
    name localB_13_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_13_load_1 \
    op interface \
    ports { localB_13_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 717 \
    name localB_14_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_14_load_1 \
    op interface \
    ports { localB_14_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 718 \
    name localB_14_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_14_load_2 \
    op interface \
    ports { localB_14_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 719 \
    name localB_15_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_15_load_2 \
    op interface \
    ports { localB_15_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 720 \
    name localB_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_load_2 \
    op interface \
    ports { localB_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 721 \
    name localB_1_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_1_load_2 \
    op interface \
    ports { localB_1_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 722 \
    name localB_2_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_2_load_2 \
    op interface \
    ports { localB_2_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 723 \
    name localB_3_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_3_load_2 \
    op interface \
    ports { localB_3_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 724 \
    name localB_4_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_4_load_2 \
    op interface \
    ports { localB_4_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 725 \
    name localB_5_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_5_load_2 \
    op interface \
    ports { localB_5_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 726 \
    name localB_6_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_6_load_2 \
    op interface \
    ports { localB_6_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 727 \
    name localB_7_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_7_load_2 \
    op interface \
    ports { localB_7_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 728 \
    name localB_8_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_8_load_2 \
    op interface \
    ports { localB_8_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 729 \
    name localB_9_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_9_load_2 \
    op interface \
    ports { localB_9_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 730 \
    name localB_10_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_10_load_2 \
    op interface \
    ports { localB_10_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 731 \
    name localB_11_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_11_load_2 \
    op interface \
    ports { localB_11_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 732 \
    name localB_12_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_12_load_2 \
    op interface \
    ports { localB_12_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 733 \
    name localB_13_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_13_load_2 \
    op interface \
    ports { localB_13_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 734 \
    name localB_13_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_13_load_3 \
    op interface \
    ports { localB_13_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 735 \
    name localB_14_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_14_load_3 \
    op interface \
    ports { localB_14_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 736 \
    name localB_15_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_15_load_3 \
    op interface \
    ports { localB_15_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 737 \
    name localB_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_load_3 \
    op interface \
    ports { localB_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 738 \
    name localB_1_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_1_load_3 \
    op interface \
    ports { localB_1_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 739 \
    name localB_2_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_2_load_3 \
    op interface \
    ports { localB_2_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 740 \
    name localB_3_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_3_load_3 \
    op interface \
    ports { localB_3_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 741 \
    name localB_4_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_4_load_3 \
    op interface \
    ports { localB_4_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 742 \
    name localB_5_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_5_load_3 \
    op interface \
    ports { localB_5_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 743 \
    name localB_6_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_6_load_3 \
    op interface \
    ports { localB_6_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 744 \
    name localB_7_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_7_load_3 \
    op interface \
    ports { localB_7_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 745 \
    name localB_8_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_8_load_3 \
    op interface \
    ports { localB_8_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 746 \
    name localB_9_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_9_load_3 \
    op interface \
    ports { localB_9_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 747 \
    name localB_10_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_10_load_3 \
    op interface \
    ports { localB_10_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 748 \
    name localB_11_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_11_load_3 \
    op interface \
    ports { localB_11_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 749 \
    name localB_12_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_12_load_3 \
    op interface \
    ports { localB_12_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 750 \
    name localB_12_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_12_load_4 \
    op interface \
    ports { localB_12_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 751 \
    name localB_13_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_13_load_4 \
    op interface \
    ports { localB_13_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 752 \
    name localB_14_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_14_load_4 \
    op interface \
    ports { localB_14_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 753 \
    name localB_15_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_15_load_4 \
    op interface \
    ports { localB_15_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 754 \
    name localB_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_load_4 \
    op interface \
    ports { localB_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 755 \
    name localB_1_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_1_load_4 \
    op interface \
    ports { localB_1_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 756 \
    name localB_2_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_2_load_4 \
    op interface \
    ports { localB_2_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 757 \
    name localB_3_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_3_load_4 \
    op interface \
    ports { localB_3_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 758 \
    name localB_4_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_4_load_4 \
    op interface \
    ports { localB_4_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 759 \
    name localB_5_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_5_load_4 \
    op interface \
    ports { localB_5_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 760 \
    name localB_6_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_6_load_4 \
    op interface \
    ports { localB_6_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 761 \
    name localB_7_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_7_load_4 \
    op interface \
    ports { localB_7_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 762 \
    name localB_8_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_8_load_4 \
    op interface \
    ports { localB_8_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 763 \
    name localB_9_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_9_load_4 \
    op interface \
    ports { localB_9_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 764 \
    name localB_10_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_10_load_4 \
    op interface \
    ports { localB_10_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 765 \
    name localB_11_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_11_load_4 \
    op interface \
    ports { localB_11_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 766 \
    name localB_11_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_11_load_5 \
    op interface \
    ports { localB_11_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 767 \
    name localB_12_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_12_load_5 \
    op interface \
    ports { localB_12_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 768 \
    name localB_13_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_13_load_5 \
    op interface \
    ports { localB_13_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 769 \
    name localB_14_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_14_load_5 \
    op interface \
    ports { localB_14_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 770 \
    name localB_15_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_15_load_5 \
    op interface \
    ports { localB_15_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 771 \
    name localB_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_load_5 \
    op interface \
    ports { localB_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 772 \
    name localB_1_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_1_load_5 \
    op interface \
    ports { localB_1_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 773 \
    name localB_2_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_2_load_5 \
    op interface \
    ports { localB_2_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 774 \
    name localB_3_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_3_load_5 \
    op interface \
    ports { localB_3_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 775 \
    name localB_4_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_4_load_5 \
    op interface \
    ports { localB_4_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 776 \
    name localB_5_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_5_load_5 \
    op interface \
    ports { localB_5_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 777 \
    name localB_6_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_6_load_5 \
    op interface \
    ports { localB_6_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 778 \
    name localB_7_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_7_load_5 \
    op interface \
    ports { localB_7_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 779 \
    name localB_8_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_8_load_5 \
    op interface \
    ports { localB_8_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 780 \
    name localB_9_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_9_load_5 \
    op interface \
    ports { localB_9_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 781 \
    name localB_10_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_10_load_5 \
    op interface \
    ports { localB_10_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 782 \
    name localB_10_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_10_load_6 \
    op interface \
    ports { localB_10_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 783 \
    name localB_11_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_11_load_6 \
    op interface \
    ports { localB_11_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 784 \
    name localB_12_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_12_load_6 \
    op interface \
    ports { localB_12_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 785 \
    name localB_13_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_13_load_6 \
    op interface \
    ports { localB_13_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 786 \
    name localB_14_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_14_load_6 \
    op interface \
    ports { localB_14_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 787 \
    name localB_15_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_15_load_6 \
    op interface \
    ports { localB_15_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 788 \
    name localB_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_load_6 \
    op interface \
    ports { localB_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 789 \
    name localB_1_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_1_load_6 \
    op interface \
    ports { localB_1_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 790 \
    name localB_2_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_2_load_6 \
    op interface \
    ports { localB_2_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 791 \
    name localB_3_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_3_load_6 \
    op interface \
    ports { localB_3_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 792 \
    name localB_4_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_4_load_6 \
    op interface \
    ports { localB_4_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 793 \
    name localB_5_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_5_load_6 \
    op interface \
    ports { localB_5_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 794 \
    name localB_6_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_6_load_6 \
    op interface \
    ports { localB_6_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 795 \
    name localB_7_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_7_load_6 \
    op interface \
    ports { localB_7_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 796 \
    name localB_8_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_8_load_6 \
    op interface \
    ports { localB_8_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 797 \
    name localB_9_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_9_load_6 \
    op interface \
    ports { localB_9_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 798 \
    name localB_9_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_9_load_7 \
    op interface \
    ports { localB_9_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 799 \
    name localB_10_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_10_load_7 \
    op interface \
    ports { localB_10_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 800 \
    name localB_11_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_11_load_7 \
    op interface \
    ports { localB_11_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 801 \
    name localB_12_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_12_load_7 \
    op interface \
    ports { localB_12_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 802 \
    name localB_13_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_13_load_7 \
    op interface \
    ports { localB_13_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 803 \
    name localB_14_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_14_load_7 \
    op interface \
    ports { localB_14_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 804 \
    name localB_15_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_15_load_7 \
    op interface \
    ports { localB_15_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 805 \
    name localB_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_load_7 \
    op interface \
    ports { localB_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 806 \
    name localB_1_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_1_load_7 \
    op interface \
    ports { localB_1_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 807 \
    name localB_2_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_2_load_7 \
    op interface \
    ports { localB_2_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 808 \
    name localB_3_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_3_load_7 \
    op interface \
    ports { localB_3_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 809 \
    name localB_4_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_4_load_7 \
    op interface \
    ports { localB_4_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 810 \
    name localB_5_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_5_load_7 \
    op interface \
    ports { localB_5_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 811 \
    name localB_6_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_6_load_7 \
    op interface \
    ports { localB_6_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 812 \
    name localB_7_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_7_load_7 \
    op interface \
    ports { localB_7_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 813 \
    name localB_8_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_8_load_7 \
    op interface \
    ports { localB_8_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 814 \
    name localB_8_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_8_load_8 \
    op interface \
    ports { localB_8_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 815 \
    name localB_9_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_9_load_8 \
    op interface \
    ports { localB_9_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 816 \
    name localB_10_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_10_load_8 \
    op interface \
    ports { localB_10_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 817 \
    name localB_11_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_11_load_8 \
    op interface \
    ports { localB_11_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 818 \
    name localB_12_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_12_load_8 \
    op interface \
    ports { localB_12_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 819 \
    name localB_13_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_13_load_8 \
    op interface \
    ports { localB_13_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 820 \
    name localB_14_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_14_load_8 \
    op interface \
    ports { localB_14_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 821 \
    name localB_15_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_15_load_8 \
    op interface \
    ports { localB_15_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 822 \
    name localB_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_load_8 \
    op interface \
    ports { localB_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 823 \
    name localB_1_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_1_load_8 \
    op interface \
    ports { localB_1_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 824 \
    name localB_2_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_2_load_8 \
    op interface \
    ports { localB_2_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 825 \
    name localB_3_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_3_load_8 \
    op interface \
    ports { localB_3_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 826 \
    name localB_4_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_4_load_8 \
    op interface \
    ports { localB_4_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 827 \
    name localB_5_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_5_load_8 \
    op interface \
    ports { localB_5_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 828 \
    name localB_6_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_6_load_8 \
    op interface \
    ports { localB_6_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 829 \
    name localB_7_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_7_load_8 \
    op interface \
    ports { localB_7_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 830 \
    name localB_7_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_7_load_9 \
    op interface \
    ports { localB_7_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 831 \
    name localB_8_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_8_load_9 \
    op interface \
    ports { localB_8_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 832 \
    name localB_9_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_9_load_9 \
    op interface \
    ports { localB_9_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 833 \
    name localB_10_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_10_load_9 \
    op interface \
    ports { localB_10_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 834 \
    name localB_11_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_11_load_9 \
    op interface \
    ports { localB_11_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 835 \
    name localB_12_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_12_load_9 \
    op interface \
    ports { localB_12_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 836 \
    name localB_13_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_13_load_9 \
    op interface \
    ports { localB_13_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 837 \
    name localB_14_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_14_load_9 \
    op interface \
    ports { localB_14_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 838 \
    name localB_15_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_15_load_9 \
    op interface \
    ports { localB_15_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 839 \
    name localB_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_load_9 \
    op interface \
    ports { localB_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 840 \
    name localB_1_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_1_load_9 \
    op interface \
    ports { localB_1_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 841 \
    name localB_2_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_2_load_9 \
    op interface \
    ports { localB_2_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 842 \
    name localB_3_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_3_load_9 \
    op interface \
    ports { localB_3_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 843 \
    name localB_4_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_4_load_9 \
    op interface \
    ports { localB_4_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 844 \
    name localB_5_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_5_load_9 \
    op interface \
    ports { localB_5_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 845 \
    name localB_6_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_6_load_9 \
    op interface \
    ports { localB_6_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 846 \
    name localB_6_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_6_load_10 \
    op interface \
    ports { localB_6_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 847 \
    name localB_7_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_7_load_10 \
    op interface \
    ports { localB_7_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 848 \
    name localB_8_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_8_load_10 \
    op interface \
    ports { localB_8_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 849 \
    name localB_9_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_9_load_10 \
    op interface \
    ports { localB_9_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 850 \
    name localB_10_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_10_load_10 \
    op interface \
    ports { localB_10_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 851 \
    name localB_11_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_11_load_10 \
    op interface \
    ports { localB_11_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 852 \
    name localB_12_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_12_load_10 \
    op interface \
    ports { localB_12_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 853 \
    name localB_13_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_13_load_10 \
    op interface \
    ports { localB_13_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 854 \
    name localB_14_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_14_load_10 \
    op interface \
    ports { localB_14_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 855 \
    name localB_15_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_15_load_10 \
    op interface \
    ports { localB_15_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 856 \
    name localB_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_load_10 \
    op interface \
    ports { localB_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 857 \
    name localB_1_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_1_load_10 \
    op interface \
    ports { localB_1_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 858 \
    name localB_2_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_2_load_10 \
    op interface \
    ports { localB_2_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 859 \
    name localB_3_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_3_load_10 \
    op interface \
    ports { localB_3_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 860 \
    name localB_4_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_4_load_10 \
    op interface \
    ports { localB_4_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 861 \
    name localB_5_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_5_load_10 \
    op interface \
    ports { localB_5_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 862 \
    name localB_5_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_5_load_11 \
    op interface \
    ports { localB_5_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 863 \
    name localB_6_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_6_load_11 \
    op interface \
    ports { localB_6_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 864 \
    name localB_7_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_7_load_11 \
    op interface \
    ports { localB_7_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 865 \
    name localB_8_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_8_load_11 \
    op interface \
    ports { localB_8_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 866 \
    name localB_9_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_9_load_11 \
    op interface \
    ports { localB_9_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 867 \
    name localB_10_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_10_load_11 \
    op interface \
    ports { localB_10_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 868 \
    name localB_11_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_11_load_11 \
    op interface \
    ports { localB_11_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 869 \
    name localB_12_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_12_load_11 \
    op interface \
    ports { localB_12_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 870 \
    name localB_13_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_13_load_11 \
    op interface \
    ports { localB_13_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 871 \
    name localB_14_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_14_load_11 \
    op interface \
    ports { localB_14_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 872 \
    name localB_15_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_15_load_11 \
    op interface \
    ports { localB_15_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 873 \
    name localB_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_load_11 \
    op interface \
    ports { localB_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 874 \
    name localB_1_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_1_load_11 \
    op interface \
    ports { localB_1_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 875 \
    name localB_2_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_2_load_11 \
    op interface \
    ports { localB_2_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 876 \
    name localB_3_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_3_load_11 \
    op interface \
    ports { localB_3_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 877 \
    name localB_4_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_4_load_11 \
    op interface \
    ports { localB_4_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 878 \
    name localB_4_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_4_load_12 \
    op interface \
    ports { localB_4_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 879 \
    name localB_5_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_5_load_12 \
    op interface \
    ports { localB_5_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 880 \
    name localB_6_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_6_load_12 \
    op interface \
    ports { localB_6_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 881 \
    name localB_7_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_7_load_12 \
    op interface \
    ports { localB_7_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 882 \
    name localB_8_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_8_load_12 \
    op interface \
    ports { localB_8_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 883 \
    name localB_9_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_9_load_12 \
    op interface \
    ports { localB_9_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 884 \
    name localB_10_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_10_load_12 \
    op interface \
    ports { localB_10_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 885 \
    name localB_11_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_11_load_12 \
    op interface \
    ports { localB_11_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 886 \
    name localB_12_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_12_load_12 \
    op interface \
    ports { localB_12_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 887 \
    name localB_13_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_13_load_12 \
    op interface \
    ports { localB_13_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 888 \
    name localB_14_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_14_load_12 \
    op interface \
    ports { localB_14_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 889 \
    name localB_15_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_15_load_12 \
    op interface \
    ports { localB_15_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 890 \
    name localB_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_load_12 \
    op interface \
    ports { localB_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 891 \
    name localB_1_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_1_load_12 \
    op interface \
    ports { localB_1_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 892 \
    name localB_2_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_2_load_12 \
    op interface \
    ports { localB_2_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 893 \
    name localB_3_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_3_load_12 \
    op interface \
    ports { localB_3_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 894 \
    name localB_3_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_3_load_13 \
    op interface \
    ports { localB_3_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 895 \
    name localB_4_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_4_load_13 \
    op interface \
    ports { localB_4_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 896 \
    name localB_5_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_5_load_13 \
    op interface \
    ports { localB_5_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 897 \
    name localB_6_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_6_load_13 \
    op interface \
    ports { localB_6_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 898 \
    name localB_7_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_7_load_13 \
    op interface \
    ports { localB_7_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 899 \
    name localB_8_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_8_load_13 \
    op interface \
    ports { localB_8_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 900 \
    name localB_9_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_9_load_13 \
    op interface \
    ports { localB_9_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 901 \
    name localB_10_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_10_load_13 \
    op interface \
    ports { localB_10_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 902 \
    name localB_11_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_11_load_13 \
    op interface \
    ports { localB_11_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 903 \
    name localB_12_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_12_load_13 \
    op interface \
    ports { localB_12_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 904 \
    name localB_13_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_13_load_13 \
    op interface \
    ports { localB_13_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 905 \
    name localB_14_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_14_load_13 \
    op interface \
    ports { localB_14_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 906 \
    name localB_15_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_15_load_13 \
    op interface \
    ports { localB_15_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 907 \
    name localB_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_load_13 \
    op interface \
    ports { localB_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 908 \
    name localB_1_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_1_load_13 \
    op interface \
    ports { localB_1_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 909 \
    name localB_2_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_2_load_13 \
    op interface \
    ports { localB_2_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 910 \
    name localB_2_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_2_load_14 \
    op interface \
    ports { localB_2_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 911 \
    name localB_3_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_3_load_14 \
    op interface \
    ports { localB_3_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 912 \
    name localB_4_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_4_load_14 \
    op interface \
    ports { localB_4_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 913 \
    name localB_5_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_5_load_14 \
    op interface \
    ports { localB_5_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 914 \
    name localB_6_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_6_load_14 \
    op interface \
    ports { localB_6_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 915 \
    name localB_7_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_7_load_14 \
    op interface \
    ports { localB_7_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 916 \
    name localB_8_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_8_load_14 \
    op interface \
    ports { localB_8_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 917 \
    name localB_9_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_9_load_14 \
    op interface \
    ports { localB_9_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 918 \
    name localB_10_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_10_load_14 \
    op interface \
    ports { localB_10_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 919 \
    name localB_11_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_11_load_14 \
    op interface \
    ports { localB_11_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 920 \
    name localB_12_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_12_load_14 \
    op interface \
    ports { localB_12_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 921 \
    name localB_13_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_13_load_14 \
    op interface \
    ports { localB_13_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 922 \
    name localB_14_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_14_load_14 \
    op interface \
    ports { localB_14_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 923 \
    name localB_15_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_15_load_14 \
    op interface \
    ports { localB_15_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 924 \
    name localB_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_load_14 \
    op interface \
    ports { localB_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 925 \
    name localB_1_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_1_load_14 \
    op interface \
    ports { localB_1_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 926 \
    name localB_1_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_1_load_15 \
    op interface \
    ports { localB_1_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 927 \
    name localB_2_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_2_load_15 \
    op interface \
    ports { localB_2_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 928 \
    name localB_3_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_3_load_15 \
    op interface \
    ports { localB_3_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 929 \
    name localB_4_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_4_load_15 \
    op interface \
    ports { localB_4_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 930 \
    name localB_5_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_5_load_15 \
    op interface \
    ports { localB_5_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 931 \
    name localB_6_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_6_load_15 \
    op interface \
    ports { localB_6_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 932 \
    name localB_7_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_7_load_15 \
    op interface \
    ports { localB_7_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 933 \
    name localB_8_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_8_load_15 \
    op interface \
    ports { localB_8_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 934 \
    name localB_9_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_9_load_15 \
    op interface \
    ports { localB_9_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 935 \
    name localB_10_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_10_load_15 \
    op interface \
    ports { localB_10_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 936 \
    name localB_11_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_11_load_15 \
    op interface \
    ports { localB_11_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 937 \
    name localB_12_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_12_load_15 \
    op interface \
    ports { localB_12_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 938 \
    name localB_13_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_13_load_15 \
    op interface \
    ports { localB_13_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 939 \
    name localB_14_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_14_load_15 \
    op interface \
    ports { localB_14_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 940 \
    name localB_15_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_15_load_15 \
    op interface \
    ports { localB_15_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 941 \
    name localB_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_localB_load_15 \
    op interface \
    ports { localB_load_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 942 \
    name localC_255_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_255_out \
    op interface \
    ports { localC_255_out { O 32 vector } localC_255_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 943 \
    name localC_254_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_254_out \
    op interface \
    ports { localC_254_out { O 32 vector } localC_254_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 944 \
    name localC_253_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_253_out \
    op interface \
    ports { localC_253_out { O 32 vector } localC_253_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 945 \
    name localC_252_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_252_out \
    op interface \
    ports { localC_252_out { O 32 vector } localC_252_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 946 \
    name localC_251_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_251_out \
    op interface \
    ports { localC_251_out { O 32 vector } localC_251_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 947 \
    name localC_250_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_250_out \
    op interface \
    ports { localC_250_out { O 32 vector } localC_250_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 948 \
    name localC_249_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_249_out \
    op interface \
    ports { localC_249_out { O 32 vector } localC_249_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 949 \
    name localC_248_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_248_out \
    op interface \
    ports { localC_248_out { O 32 vector } localC_248_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 950 \
    name localC_247_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_247_out \
    op interface \
    ports { localC_247_out { O 32 vector } localC_247_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 951 \
    name localC_246_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_246_out \
    op interface \
    ports { localC_246_out { O 32 vector } localC_246_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 952 \
    name localC_245_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_245_out \
    op interface \
    ports { localC_245_out { O 32 vector } localC_245_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 953 \
    name localC_244_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_244_out \
    op interface \
    ports { localC_244_out { O 32 vector } localC_244_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 954 \
    name localC_243_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_243_out \
    op interface \
    ports { localC_243_out { O 32 vector } localC_243_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 955 \
    name localC_242_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_242_out \
    op interface \
    ports { localC_242_out { O 32 vector } localC_242_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 956 \
    name localC_241_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_241_out \
    op interface \
    ports { localC_241_out { O 32 vector } localC_241_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 957 \
    name localC_240_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_240_out \
    op interface \
    ports { localC_240_out { O 32 vector } localC_240_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 958 \
    name localC_239_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_239_out \
    op interface \
    ports { localC_239_out { O 32 vector } localC_239_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 959 \
    name localC_238_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_238_out \
    op interface \
    ports { localC_238_out { O 32 vector } localC_238_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 960 \
    name localC_237_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_237_out \
    op interface \
    ports { localC_237_out { O 32 vector } localC_237_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 961 \
    name localC_236_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_236_out \
    op interface \
    ports { localC_236_out { O 32 vector } localC_236_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 962 \
    name localC_235_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_235_out \
    op interface \
    ports { localC_235_out { O 32 vector } localC_235_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 963 \
    name localC_234_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_234_out \
    op interface \
    ports { localC_234_out { O 32 vector } localC_234_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 964 \
    name localC_233_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_233_out \
    op interface \
    ports { localC_233_out { O 32 vector } localC_233_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 965 \
    name localC_232_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_232_out \
    op interface \
    ports { localC_232_out { O 32 vector } localC_232_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 966 \
    name localC_231_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_231_out \
    op interface \
    ports { localC_231_out { O 32 vector } localC_231_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 967 \
    name localC_230_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_230_out \
    op interface \
    ports { localC_230_out { O 32 vector } localC_230_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 968 \
    name localC_229_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_229_out \
    op interface \
    ports { localC_229_out { O 32 vector } localC_229_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 969 \
    name localC_228_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_228_out \
    op interface \
    ports { localC_228_out { O 32 vector } localC_228_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 970 \
    name localC_227_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_227_out \
    op interface \
    ports { localC_227_out { O 32 vector } localC_227_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 971 \
    name localC_226_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_226_out \
    op interface \
    ports { localC_226_out { O 32 vector } localC_226_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 972 \
    name localC_225_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_225_out \
    op interface \
    ports { localC_225_out { O 32 vector } localC_225_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 973 \
    name localC_224_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_224_out \
    op interface \
    ports { localC_224_out { O 32 vector } localC_224_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 974 \
    name localC_223_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_223_out \
    op interface \
    ports { localC_223_out { O 32 vector } localC_223_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 975 \
    name localC_222_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_222_out \
    op interface \
    ports { localC_222_out { O 32 vector } localC_222_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 976 \
    name localC_221_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_221_out \
    op interface \
    ports { localC_221_out { O 32 vector } localC_221_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 977 \
    name localC_220_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_220_out \
    op interface \
    ports { localC_220_out { O 32 vector } localC_220_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 978 \
    name localC_219_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_219_out \
    op interface \
    ports { localC_219_out { O 32 vector } localC_219_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 979 \
    name localC_218_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_218_out \
    op interface \
    ports { localC_218_out { O 32 vector } localC_218_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 980 \
    name localC_217_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_217_out \
    op interface \
    ports { localC_217_out { O 32 vector } localC_217_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 981 \
    name localC_216_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_216_out \
    op interface \
    ports { localC_216_out { O 32 vector } localC_216_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 982 \
    name localC_215_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_215_out \
    op interface \
    ports { localC_215_out { O 32 vector } localC_215_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 983 \
    name localC_214_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_214_out \
    op interface \
    ports { localC_214_out { O 32 vector } localC_214_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 984 \
    name localC_213_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_213_out \
    op interface \
    ports { localC_213_out { O 32 vector } localC_213_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 985 \
    name localC_212_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_212_out \
    op interface \
    ports { localC_212_out { O 32 vector } localC_212_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 986 \
    name localC_211_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_211_out \
    op interface \
    ports { localC_211_out { O 32 vector } localC_211_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 987 \
    name localC_210_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_210_out \
    op interface \
    ports { localC_210_out { O 32 vector } localC_210_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 988 \
    name localC_209_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_209_out \
    op interface \
    ports { localC_209_out { O 32 vector } localC_209_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 989 \
    name localC_208_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_208_out \
    op interface \
    ports { localC_208_out { O 32 vector } localC_208_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 990 \
    name localC_207_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_207_out \
    op interface \
    ports { localC_207_out { O 32 vector } localC_207_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 991 \
    name localC_206_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_206_out \
    op interface \
    ports { localC_206_out { O 32 vector } localC_206_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 992 \
    name localC_205_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_205_out \
    op interface \
    ports { localC_205_out { O 32 vector } localC_205_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 993 \
    name localC_204_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_204_out \
    op interface \
    ports { localC_204_out { O 32 vector } localC_204_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 994 \
    name localC_203_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_203_out \
    op interface \
    ports { localC_203_out { O 32 vector } localC_203_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 995 \
    name localC_202_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_202_out \
    op interface \
    ports { localC_202_out { O 32 vector } localC_202_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 996 \
    name localC_201_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_201_out \
    op interface \
    ports { localC_201_out { O 32 vector } localC_201_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 997 \
    name localC_200_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_200_out \
    op interface \
    ports { localC_200_out { O 32 vector } localC_200_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 998 \
    name localC_199_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_199_out \
    op interface \
    ports { localC_199_out { O 32 vector } localC_199_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 999 \
    name localC_198_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_198_out \
    op interface \
    ports { localC_198_out { O 32 vector } localC_198_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1000 \
    name localC_197_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_197_out \
    op interface \
    ports { localC_197_out { O 32 vector } localC_197_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1001 \
    name localC_196_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_196_out \
    op interface \
    ports { localC_196_out { O 32 vector } localC_196_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1002 \
    name localC_195_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_195_out \
    op interface \
    ports { localC_195_out { O 32 vector } localC_195_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1003 \
    name localC_194_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_194_out \
    op interface \
    ports { localC_194_out { O 32 vector } localC_194_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1004 \
    name localC_193_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_193_out \
    op interface \
    ports { localC_193_out { O 32 vector } localC_193_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1005 \
    name localC_192_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_192_out \
    op interface \
    ports { localC_192_out { O 32 vector } localC_192_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1006 \
    name localC_191_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_191_out \
    op interface \
    ports { localC_191_out { O 32 vector } localC_191_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1007 \
    name localC_190_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_190_out \
    op interface \
    ports { localC_190_out { O 32 vector } localC_190_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1008 \
    name localC_189_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_189_out \
    op interface \
    ports { localC_189_out { O 32 vector } localC_189_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1009 \
    name localC_188_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_188_out \
    op interface \
    ports { localC_188_out { O 32 vector } localC_188_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1010 \
    name localC_187_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_187_out \
    op interface \
    ports { localC_187_out { O 32 vector } localC_187_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1011 \
    name localC_186_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_186_out \
    op interface \
    ports { localC_186_out { O 32 vector } localC_186_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1012 \
    name localC_185_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_185_out \
    op interface \
    ports { localC_185_out { O 32 vector } localC_185_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1013 \
    name localC_184_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_184_out \
    op interface \
    ports { localC_184_out { O 32 vector } localC_184_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1014 \
    name localC_183_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_183_out \
    op interface \
    ports { localC_183_out { O 32 vector } localC_183_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1015 \
    name localC_182_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_182_out \
    op interface \
    ports { localC_182_out { O 32 vector } localC_182_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1016 \
    name localC_181_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_181_out \
    op interface \
    ports { localC_181_out { O 32 vector } localC_181_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1017 \
    name localC_180_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_180_out \
    op interface \
    ports { localC_180_out { O 32 vector } localC_180_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1018 \
    name localC_179_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_179_out \
    op interface \
    ports { localC_179_out { O 32 vector } localC_179_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1019 \
    name localC_178_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_178_out \
    op interface \
    ports { localC_178_out { O 32 vector } localC_178_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1020 \
    name localC_177_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_177_out \
    op interface \
    ports { localC_177_out { O 32 vector } localC_177_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1021 \
    name localC_176_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_176_out \
    op interface \
    ports { localC_176_out { O 32 vector } localC_176_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1022 \
    name localC_175_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_175_out \
    op interface \
    ports { localC_175_out { O 32 vector } localC_175_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1023 \
    name localC_174_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_174_out \
    op interface \
    ports { localC_174_out { O 32 vector } localC_174_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1024 \
    name localC_173_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_173_out \
    op interface \
    ports { localC_173_out { O 32 vector } localC_173_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1025 \
    name localC_172_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_172_out \
    op interface \
    ports { localC_172_out { O 32 vector } localC_172_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1026 \
    name localC_171_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_171_out \
    op interface \
    ports { localC_171_out { O 32 vector } localC_171_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1027 \
    name localC_170_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_170_out \
    op interface \
    ports { localC_170_out { O 32 vector } localC_170_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1028 \
    name localC_169_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_169_out \
    op interface \
    ports { localC_169_out { O 32 vector } localC_169_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1029 \
    name localC_168_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_168_out \
    op interface \
    ports { localC_168_out { O 32 vector } localC_168_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1030 \
    name localC_167_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_167_out \
    op interface \
    ports { localC_167_out { O 32 vector } localC_167_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1031 \
    name localC_166_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_166_out \
    op interface \
    ports { localC_166_out { O 32 vector } localC_166_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1032 \
    name localC_165_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_165_out \
    op interface \
    ports { localC_165_out { O 32 vector } localC_165_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1033 \
    name localC_164_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_164_out \
    op interface \
    ports { localC_164_out { O 32 vector } localC_164_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1034 \
    name localC_163_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_163_out \
    op interface \
    ports { localC_163_out { O 32 vector } localC_163_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1035 \
    name localC_162_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_162_out \
    op interface \
    ports { localC_162_out { O 32 vector } localC_162_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1036 \
    name localC_161_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_161_out \
    op interface \
    ports { localC_161_out { O 32 vector } localC_161_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1037 \
    name localC_160_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_160_out \
    op interface \
    ports { localC_160_out { O 32 vector } localC_160_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1038 \
    name localC_159_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_159_out \
    op interface \
    ports { localC_159_out { O 32 vector } localC_159_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1039 \
    name localC_158_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_158_out \
    op interface \
    ports { localC_158_out { O 32 vector } localC_158_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1040 \
    name localC_157_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_157_out \
    op interface \
    ports { localC_157_out { O 32 vector } localC_157_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1041 \
    name localC_156_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_156_out \
    op interface \
    ports { localC_156_out { O 32 vector } localC_156_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1042 \
    name localC_155_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_155_out \
    op interface \
    ports { localC_155_out { O 32 vector } localC_155_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1043 \
    name localC_154_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_154_out \
    op interface \
    ports { localC_154_out { O 32 vector } localC_154_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1044 \
    name localC_153_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_153_out \
    op interface \
    ports { localC_153_out { O 32 vector } localC_153_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1045 \
    name localC_152_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_152_out \
    op interface \
    ports { localC_152_out { O 32 vector } localC_152_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1046 \
    name localC_151_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_151_out \
    op interface \
    ports { localC_151_out { O 32 vector } localC_151_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1047 \
    name localC_150_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_150_out \
    op interface \
    ports { localC_150_out { O 32 vector } localC_150_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1048 \
    name localC_149_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_149_out \
    op interface \
    ports { localC_149_out { O 32 vector } localC_149_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1049 \
    name localC_148_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_148_out \
    op interface \
    ports { localC_148_out { O 32 vector } localC_148_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1050 \
    name localC_147_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_147_out \
    op interface \
    ports { localC_147_out { O 32 vector } localC_147_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1051 \
    name localC_146_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_146_out \
    op interface \
    ports { localC_146_out { O 32 vector } localC_146_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1052 \
    name localC_145_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_145_out \
    op interface \
    ports { localC_145_out { O 32 vector } localC_145_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1053 \
    name localC_144_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_144_out \
    op interface \
    ports { localC_144_out { O 32 vector } localC_144_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1054 \
    name localC_143_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_143_out \
    op interface \
    ports { localC_143_out { O 32 vector } localC_143_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1055 \
    name localC_142_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_142_out \
    op interface \
    ports { localC_142_out { O 32 vector } localC_142_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1056 \
    name localC_141_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_141_out \
    op interface \
    ports { localC_141_out { O 32 vector } localC_141_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1057 \
    name localC_140_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_140_out \
    op interface \
    ports { localC_140_out { O 32 vector } localC_140_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1058 \
    name localC_139_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_139_out \
    op interface \
    ports { localC_139_out { O 32 vector } localC_139_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1059 \
    name localC_138_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_138_out \
    op interface \
    ports { localC_138_out { O 32 vector } localC_138_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1060 \
    name localC_137_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_137_out \
    op interface \
    ports { localC_137_out { O 32 vector } localC_137_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1061 \
    name localC_136_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_136_out \
    op interface \
    ports { localC_136_out { O 32 vector } localC_136_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1062 \
    name localC_135_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_135_out \
    op interface \
    ports { localC_135_out { O 32 vector } localC_135_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1063 \
    name localC_134_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_134_out \
    op interface \
    ports { localC_134_out { O 32 vector } localC_134_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1064 \
    name localC_133_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_133_out \
    op interface \
    ports { localC_133_out { O 32 vector } localC_133_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1065 \
    name localC_132_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_132_out \
    op interface \
    ports { localC_132_out { O 32 vector } localC_132_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1066 \
    name localC_131_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_131_out \
    op interface \
    ports { localC_131_out { O 32 vector } localC_131_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1067 \
    name localC_130_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_130_out \
    op interface \
    ports { localC_130_out { O 32 vector } localC_130_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1068 \
    name localC_129_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_129_out \
    op interface \
    ports { localC_129_out { O 32 vector } localC_129_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1069 \
    name localC_128_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_128_out \
    op interface \
    ports { localC_128_out { O 32 vector } localC_128_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1070 \
    name localC_127_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_127_out \
    op interface \
    ports { localC_127_out { O 32 vector } localC_127_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1071 \
    name localC_126_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_126_out \
    op interface \
    ports { localC_126_out { O 32 vector } localC_126_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1072 \
    name localC_125_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_125_out \
    op interface \
    ports { localC_125_out { O 32 vector } localC_125_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1073 \
    name localC_124_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_124_out \
    op interface \
    ports { localC_124_out { O 32 vector } localC_124_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1074 \
    name localC_123_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_123_out \
    op interface \
    ports { localC_123_out { O 32 vector } localC_123_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1075 \
    name localC_122_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_122_out \
    op interface \
    ports { localC_122_out { O 32 vector } localC_122_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1076 \
    name localC_121_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_121_out \
    op interface \
    ports { localC_121_out { O 32 vector } localC_121_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1077 \
    name localC_120_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_120_out \
    op interface \
    ports { localC_120_out { O 32 vector } localC_120_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1078 \
    name localC_119_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_119_out \
    op interface \
    ports { localC_119_out { O 32 vector } localC_119_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1079 \
    name localC_118_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_118_out \
    op interface \
    ports { localC_118_out { O 32 vector } localC_118_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1080 \
    name localC_117_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_117_out \
    op interface \
    ports { localC_117_out { O 32 vector } localC_117_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1081 \
    name localC_116_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_116_out \
    op interface \
    ports { localC_116_out { O 32 vector } localC_116_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1082 \
    name localC_115_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_115_out \
    op interface \
    ports { localC_115_out { O 32 vector } localC_115_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1083 \
    name localC_114_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_114_out \
    op interface \
    ports { localC_114_out { O 32 vector } localC_114_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1084 \
    name localC_113_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_113_out \
    op interface \
    ports { localC_113_out { O 32 vector } localC_113_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1085 \
    name localC_112_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_112_out \
    op interface \
    ports { localC_112_out { O 32 vector } localC_112_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1086 \
    name localC_111_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_111_out \
    op interface \
    ports { localC_111_out { O 32 vector } localC_111_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1087 \
    name localC_110_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_110_out \
    op interface \
    ports { localC_110_out { O 32 vector } localC_110_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1088 \
    name localC_109_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_109_out \
    op interface \
    ports { localC_109_out { O 32 vector } localC_109_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1089 \
    name localC_108_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_108_out \
    op interface \
    ports { localC_108_out { O 32 vector } localC_108_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1090 \
    name localC_107_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_107_out \
    op interface \
    ports { localC_107_out { O 32 vector } localC_107_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1091 \
    name localC_106_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_106_out \
    op interface \
    ports { localC_106_out { O 32 vector } localC_106_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1092 \
    name localC_105_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_105_out \
    op interface \
    ports { localC_105_out { O 32 vector } localC_105_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1093 \
    name localC_104_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_104_out \
    op interface \
    ports { localC_104_out { O 32 vector } localC_104_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1094 \
    name localC_103_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_103_out \
    op interface \
    ports { localC_103_out { O 32 vector } localC_103_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1095 \
    name localC_102_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_102_out \
    op interface \
    ports { localC_102_out { O 32 vector } localC_102_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1096 \
    name localC_101_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_101_out \
    op interface \
    ports { localC_101_out { O 32 vector } localC_101_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1097 \
    name localC_100_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_100_out \
    op interface \
    ports { localC_100_out { O 32 vector } localC_100_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1098 \
    name localC_99_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_99_out \
    op interface \
    ports { localC_99_out { O 32 vector } localC_99_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1099 \
    name localC_98_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_98_out \
    op interface \
    ports { localC_98_out { O 32 vector } localC_98_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1100 \
    name localC_97_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_97_out \
    op interface \
    ports { localC_97_out { O 32 vector } localC_97_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1101 \
    name localC_96_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_96_out \
    op interface \
    ports { localC_96_out { O 32 vector } localC_96_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1102 \
    name localC_95_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_95_out \
    op interface \
    ports { localC_95_out { O 32 vector } localC_95_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1103 \
    name localC_94_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_94_out \
    op interface \
    ports { localC_94_out { O 32 vector } localC_94_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1104 \
    name localC_93_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_93_out \
    op interface \
    ports { localC_93_out { O 32 vector } localC_93_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1105 \
    name localC_92_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_92_out \
    op interface \
    ports { localC_92_out { O 32 vector } localC_92_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1106 \
    name localC_91_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_91_out \
    op interface \
    ports { localC_91_out { O 32 vector } localC_91_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1107 \
    name localC_90_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_90_out \
    op interface \
    ports { localC_90_out { O 32 vector } localC_90_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1108 \
    name localC_89_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_89_out \
    op interface \
    ports { localC_89_out { O 32 vector } localC_89_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1109 \
    name localC_88_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_88_out \
    op interface \
    ports { localC_88_out { O 32 vector } localC_88_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1110 \
    name localC_87_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_87_out \
    op interface \
    ports { localC_87_out { O 32 vector } localC_87_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1111 \
    name localC_86_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_86_out \
    op interface \
    ports { localC_86_out { O 32 vector } localC_86_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1112 \
    name localC_85_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_85_out \
    op interface \
    ports { localC_85_out { O 32 vector } localC_85_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1113 \
    name localC_84_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_84_out \
    op interface \
    ports { localC_84_out { O 32 vector } localC_84_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1114 \
    name localC_83_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_83_out \
    op interface \
    ports { localC_83_out { O 32 vector } localC_83_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1115 \
    name localC_82_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_82_out \
    op interface \
    ports { localC_82_out { O 32 vector } localC_82_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1116 \
    name localC_81_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_81_out \
    op interface \
    ports { localC_81_out { O 32 vector } localC_81_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1117 \
    name localC_80_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_80_out \
    op interface \
    ports { localC_80_out { O 32 vector } localC_80_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1118 \
    name localC_79_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_79_out \
    op interface \
    ports { localC_79_out { O 32 vector } localC_79_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1119 \
    name localC_78_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_78_out \
    op interface \
    ports { localC_78_out { O 32 vector } localC_78_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1120 \
    name localC_77_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_77_out \
    op interface \
    ports { localC_77_out { O 32 vector } localC_77_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1121 \
    name localC_76_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_76_out \
    op interface \
    ports { localC_76_out { O 32 vector } localC_76_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1122 \
    name localC_75_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_75_out \
    op interface \
    ports { localC_75_out { O 32 vector } localC_75_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1123 \
    name localC_74_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_74_out \
    op interface \
    ports { localC_74_out { O 32 vector } localC_74_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1124 \
    name localC_73_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_73_out \
    op interface \
    ports { localC_73_out { O 32 vector } localC_73_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1125 \
    name localC_72_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_72_out \
    op interface \
    ports { localC_72_out { O 32 vector } localC_72_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1126 \
    name localC_71_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_71_out \
    op interface \
    ports { localC_71_out { O 32 vector } localC_71_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1127 \
    name localC_70_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_70_out \
    op interface \
    ports { localC_70_out { O 32 vector } localC_70_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1128 \
    name localC_69_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_69_out \
    op interface \
    ports { localC_69_out { O 32 vector } localC_69_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1129 \
    name localC_68_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_68_out \
    op interface \
    ports { localC_68_out { O 32 vector } localC_68_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1130 \
    name localC_67_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_67_out \
    op interface \
    ports { localC_67_out { O 32 vector } localC_67_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1131 \
    name localC_66_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_66_out \
    op interface \
    ports { localC_66_out { O 32 vector } localC_66_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1132 \
    name localC_65_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_65_out \
    op interface \
    ports { localC_65_out { O 32 vector } localC_65_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1133 \
    name localC_64_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_64_out \
    op interface \
    ports { localC_64_out { O 32 vector } localC_64_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1134 \
    name localC_63_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_63_out \
    op interface \
    ports { localC_63_out { O 32 vector } localC_63_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1135 \
    name localC_62_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_62_out \
    op interface \
    ports { localC_62_out { O 32 vector } localC_62_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1136 \
    name localC_61_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_61_out \
    op interface \
    ports { localC_61_out { O 32 vector } localC_61_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1137 \
    name localC_60_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_60_out \
    op interface \
    ports { localC_60_out { O 32 vector } localC_60_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1138 \
    name localC_59_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_59_out \
    op interface \
    ports { localC_59_out { O 32 vector } localC_59_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1139 \
    name localC_58_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_58_out \
    op interface \
    ports { localC_58_out { O 32 vector } localC_58_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1140 \
    name localC_57_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_57_out \
    op interface \
    ports { localC_57_out { O 32 vector } localC_57_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1141 \
    name localC_56_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_56_out \
    op interface \
    ports { localC_56_out { O 32 vector } localC_56_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1142 \
    name localC_55_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_55_out \
    op interface \
    ports { localC_55_out { O 32 vector } localC_55_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1143 \
    name localC_54_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_54_out \
    op interface \
    ports { localC_54_out { O 32 vector } localC_54_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1144 \
    name localC_53_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_53_out \
    op interface \
    ports { localC_53_out { O 32 vector } localC_53_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1145 \
    name localC_52_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_52_out \
    op interface \
    ports { localC_52_out { O 32 vector } localC_52_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1146 \
    name localC_51_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_51_out \
    op interface \
    ports { localC_51_out { O 32 vector } localC_51_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1147 \
    name localC_50_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_50_out \
    op interface \
    ports { localC_50_out { O 32 vector } localC_50_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1148 \
    name localC_49_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_49_out \
    op interface \
    ports { localC_49_out { O 32 vector } localC_49_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1149 \
    name localC_48_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_48_out \
    op interface \
    ports { localC_48_out { O 32 vector } localC_48_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1150 \
    name localC_47_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_47_out \
    op interface \
    ports { localC_47_out { O 32 vector } localC_47_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1151 \
    name localC_46_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_46_out \
    op interface \
    ports { localC_46_out { O 32 vector } localC_46_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1152 \
    name localC_45_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_45_out \
    op interface \
    ports { localC_45_out { O 32 vector } localC_45_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1153 \
    name localC_44_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_44_out \
    op interface \
    ports { localC_44_out { O 32 vector } localC_44_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1154 \
    name localC_43_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_43_out \
    op interface \
    ports { localC_43_out { O 32 vector } localC_43_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1155 \
    name localC_42_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_42_out \
    op interface \
    ports { localC_42_out { O 32 vector } localC_42_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1156 \
    name localC_41_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_41_out \
    op interface \
    ports { localC_41_out { O 32 vector } localC_41_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1157 \
    name localC_40_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_40_out \
    op interface \
    ports { localC_40_out { O 32 vector } localC_40_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1158 \
    name localC_39_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_39_out \
    op interface \
    ports { localC_39_out { O 32 vector } localC_39_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1159 \
    name localC_38_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_38_out \
    op interface \
    ports { localC_38_out { O 32 vector } localC_38_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1160 \
    name localC_37_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_37_out \
    op interface \
    ports { localC_37_out { O 32 vector } localC_37_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1161 \
    name localC_36_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_36_out \
    op interface \
    ports { localC_36_out { O 32 vector } localC_36_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1162 \
    name localC_35_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_35_out \
    op interface \
    ports { localC_35_out { O 32 vector } localC_35_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1163 \
    name localC_34_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_34_out \
    op interface \
    ports { localC_34_out { O 32 vector } localC_34_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1164 \
    name localC_33_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_33_out \
    op interface \
    ports { localC_33_out { O 32 vector } localC_33_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1165 \
    name localC_32_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_32_out \
    op interface \
    ports { localC_32_out { O 32 vector } localC_32_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1166 \
    name localC_31_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_31_out \
    op interface \
    ports { localC_31_out { O 32 vector } localC_31_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1167 \
    name localC_30_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_30_out \
    op interface \
    ports { localC_30_out { O 32 vector } localC_30_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1168 \
    name localC_29_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_29_out \
    op interface \
    ports { localC_29_out { O 32 vector } localC_29_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1169 \
    name localC_28_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_28_out \
    op interface \
    ports { localC_28_out { O 32 vector } localC_28_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1170 \
    name localC_27_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_27_out \
    op interface \
    ports { localC_27_out { O 32 vector } localC_27_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1171 \
    name localC_26_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_26_out \
    op interface \
    ports { localC_26_out { O 32 vector } localC_26_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1172 \
    name localC_25_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_25_out \
    op interface \
    ports { localC_25_out { O 32 vector } localC_25_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1173 \
    name localC_24_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_24_out \
    op interface \
    ports { localC_24_out { O 32 vector } localC_24_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1174 \
    name localC_23_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_23_out \
    op interface \
    ports { localC_23_out { O 32 vector } localC_23_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1175 \
    name localC_22_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_22_out \
    op interface \
    ports { localC_22_out { O 32 vector } localC_22_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1176 \
    name localC_21_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_21_out \
    op interface \
    ports { localC_21_out { O 32 vector } localC_21_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1177 \
    name localC_20_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_20_out \
    op interface \
    ports { localC_20_out { O 32 vector } localC_20_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1178 \
    name localC_19_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_19_out \
    op interface \
    ports { localC_19_out { O 32 vector } localC_19_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1179 \
    name localC_18_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_18_out \
    op interface \
    ports { localC_18_out { O 32 vector } localC_18_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1180 \
    name localC_17_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_17_out \
    op interface \
    ports { localC_17_out { O 32 vector } localC_17_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1181 \
    name localC_16_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_16_out \
    op interface \
    ports { localC_16_out { O 32 vector } localC_16_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1182 \
    name localC_15_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_15_out \
    op interface \
    ports { localC_15_out { O 32 vector } localC_15_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1183 \
    name localC_14_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_14_out \
    op interface \
    ports { localC_14_out { O 32 vector } localC_14_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1184 \
    name localC_13_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_13_out \
    op interface \
    ports { localC_13_out { O 32 vector } localC_13_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1185 \
    name localC_12_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_12_out \
    op interface \
    ports { localC_12_out { O 32 vector } localC_12_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1186 \
    name localC_11_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_11_out \
    op interface \
    ports { localC_11_out { O 32 vector } localC_11_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1187 \
    name localC_10_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_10_out \
    op interface \
    ports { localC_10_out { O 32 vector } localC_10_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1188 \
    name localC_9_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_9_out \
    op interface \
    ports { localC_9_out { O 32 vector } localC_9_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1189 \
    name localC_8_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_8_out \
    op interface \
    ports { localC_8_out { O 32 vector } localC_8_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1190 \
    name localC_7_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_7_out \
    op interface \
    ports { localC_7_out { O 32 vector } localC_7_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1191 \
    name localC_6_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_6_out \
    op interface \
    ports { localC_6_out { O 32 vector } localC_6_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1192 \
    name localC_5_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_5_out \
    op interface \
    ports { localC_5_out { O 32 vector } localC_5_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1193 \
    name localC_4_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_4_out \
    op interface \
    ports { localC_4_out { O 32 vector } localC_4_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1194 \
    name localC_3_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_3_out \
    op interface \
    ports { localC_3_out { O 32 vector } localC_3_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1195 \
    name localC_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_2_out \
    op interface \
    ports { localC_2_out { O 32 vector } localC_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1196 \
    name localC_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_1_out \
    op interface \
    ports { localC_1_out { O 32 vector } localC_1_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1197 \
    name localC_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_localC_out \
    op interface \
    ports { localC_out { O 32 vector } localC_out_ap_vld { O 1 bit } } \
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
set InstName mmult_flow_control_loop_pipe_sequential_init_U
set CompName mmult_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix mmult_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


