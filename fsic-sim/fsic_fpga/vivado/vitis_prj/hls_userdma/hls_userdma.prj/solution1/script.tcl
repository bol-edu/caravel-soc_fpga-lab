############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project userdma_upsb_1204_refine
set_top userdma
add_files userdma.cpp
add_files userdma.h
add_files -tb userdma_test.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl verilog
source "./userdma_upsb_1204_refine/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level all
export_design -rtl verilog -format ip_catalog
