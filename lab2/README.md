# Lab2 spiflash Protocol Design and Validation
## Design presentation
[全端 IC 設計工程師伴學松 第十三次 Lab2](https://youtu.be/WFnW_dvzIE8)  
[報告投影片](https://github.com/bol-edu/caravel-soc_fpga-lab/blob/main/lab2/doc/SPI_Device_Simulation.pptx)

## Behavior spiflash.v to RTL spiflash.v and Behavior bram.v - XSIM simulation
The original Efabless Caravel harness used behavior [caravel-soc_fpga/vip/spiflash.v](https://github.com/bol-edu/caravel-soc_fpga/blob/main/vip/spiflash.v). We rewrote to RTL [caravel-soc_fpga/rtl/soc/spiflash.v](https://github.com/bol-edu/caravel-soc_fpga/blob/main/rtl/soc/spiflash.v) (FPGA synthesizable) and behavior [caravel-soc_fpga/vip/bram.v](https://github.com/bol-edu/caravel-soc_fpga/blob/main/vip/bram.v) (needs FPGA BRAM porting). The behavior bram module was also be instantiated in [counter_wb_tb.v](https://github.com/bol-edu/caravel-soc_fpga/blob/main/testbench/counter_wb/counter_wb_tb.v), [counter_la_tb.v](https://github.com/bol-edu/caravel-soc_fpga/blob/main/testbench/counter_la/counter_la_tb.v) and [gcd_la_tb.v](https://github.com/bol-edu/caravel-soc_fpga/blob/main/testbench/gcd_la/gcd_la_tb.v).

## Integrate RTL spiflash.v into Caravel SoC FPGA - Vivado block design, synthesis and PYNQ-Z2 validation
