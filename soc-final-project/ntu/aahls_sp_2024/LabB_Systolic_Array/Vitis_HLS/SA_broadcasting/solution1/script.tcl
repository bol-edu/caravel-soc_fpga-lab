############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project SA_broadcasting
set_top mmult
add_files SA_broadcasting/src/mmult.cpp
add_files SA_broadcasting/src/mmult.h
add_files -tb SA_broadcasting/src/mmultTester.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xcu50-fsvh2104-2-e}
create_clock -period 10 -name default
source "./SA_broadcasting/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
