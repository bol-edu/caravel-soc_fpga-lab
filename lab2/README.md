# Lab2 spiflash Protocol Design and Validation
## Design Presentation
[全端 IC 設計工程師伴學松 第十三次 Lab2](https://youtu.be/WFnW_dvzIE8)  
[報告投影片](https://github.com/bol-edu/caravel-soc_fpga-lab/blob/main/lab2/doc/SPI_Device_Simulation.pptx)

## Behavior spiflash.v to RTL spiflash.v and Behavior bram.v - XSIM Simulation
The original Efabless Caravel harness used behavior [caravel-soc_fpga/vip/spiflash.v](https://github.com/bol-edu/caravel-soc_fpga/blob/main/vip/spiflash.v). We rewrote to RTL [caravel-soc_fpga/rtl/soc/spiflash.v](https://github.com/bol-edu/caravel-soc_fpga/blob/main/rtl/soc/spiflash.v) (FPGA synthesizable) and behavior [caravel-soc_fpga/vip/bram.v](https://github.com/bol-edu/caravel-soc_fpga/blob/main/vip/bram.v) (needs FPGA BRAM porting). The behavior bram module was also be instantiated in [counter_wb_tb.v](https://github.com/bol-edu/caravel-soc_fpga/blob/main/testbench/counter_wb/counter_wb_tb.v), [counter_la_tb.v](https://github.com/bol-edu/caravel-soc_fpga/blob/main/testbench/counter_la/counter_la_tb.v) and [gcd_la_tb.v](https://github.com/bol-edu/caravel-soc_fpga/blob/main/testbench/gcd_la/gcd_la_tb.v).

## Integrate RTL spiflash.v into Caravel SoC FPGA - Vivado Block Design, Synthesis
Generate and open Caravel FPGA block design Vivado project.
```sh
cd ~/caravel-soc_fpga-lab/labi
source run_vitis.sh
source run_vivado.sh
vivado ./vvd_caravel_fpga/vvd_caravel_fpga.xpr
```
Click Open Block Design in Flow Navigator to validate [spiflash](https://github.com/bol-edu/caravel-soc_fpga-lab/blob/main/labi/vvd_srcs/spiflash.v) and its block memory (behavior bram.v is ported to Vivado block memory).

![001](https://github.com/bol-edu/caravel-soc_fpga-lab/assets/98332019/0f0f0cee-603f-4216-b3c3-1122cb94c06f)
![002](https://github.com/bol-edu/caravel-soc_fpga-lab/assets/98332019/3f9c9bff-5cf2-4d18-9c29-2e8a41abfc66)

