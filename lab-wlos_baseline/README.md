# WorkLoad Optimize SOC (WLOS) Baseline

## Simulation with iverilog
### Simulation for matrix multiplication
```sh
cd ~/caravel-soc_fpga-lab/lab-wlos_baseline/testbench/counter_la_mm
source run_clean
source run_sim
```

### Simulation for FIR
```sh
cd ~/caravel-soc_fpga-lab/lab-wlos_baseline/testbench/counter_la_fir
source run_clean
source run_sim
```

### Simulation for qsort
```sh
cd ~/caravel-soc_fpga-lab/lab-wlos_baseline/testbench/counter_la_qs
source run_clean
source run_sim
```

### Simulation for mm + fir + qs
```sh
cd ~/caravel-soc_fpga-lab/lab-wlos_baseline/testbench/counter_la_wlop
source run_clean
source run_sim
```

## Verification with Vivado
### Synthesis and Generate bitstream
```sh
cd ~/caravel-soc_fpga-lab/lab-wlos_baseline/vivado
source run_vivado
```

### Deploy on FPGA
Preparations
- ./jupyter_notebook/caravel_fpga.bit
- ./jupyter_notebook/caravel_fpga.hwh
- ~/caravel-soc_fpga-lab/lab-wlos_baseline/testbench/counter_la_wlop/counter_la_wlop.hex

## What should you learn in this lab
- Linker for arrangemnet of data and standard library
- Compilation of assembly and C code
- How does the data transfer from PS to spiflash
- How does the firmware code excute in the RISCV32I
- How does the RISCV32I access the firmware code from user's synthesized BRAM by the wishbone bus


