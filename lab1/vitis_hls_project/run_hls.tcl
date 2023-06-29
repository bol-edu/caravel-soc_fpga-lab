############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project lab1
set_top read_romcode
add_files src/read_romcode.cpp
add_files -tb src/main.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
csim_design -O
csynth_design
# enable this line for cosim
#cosim_design -wave_debug -trace_level all
export_design -rtl verilog -format ip_catalog
exit

