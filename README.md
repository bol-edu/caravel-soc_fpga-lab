# Caravel SoC FPGA Lab
3 Labs to experiment with Verilog & HLS

## Introduce to 3 Labs
* Lab1: AXI master read/write BRAM
* Lab2: spiflash protocol design and validation
* Lab1+2: integrate Lab1 and Lab2
* Lab3: Axilite access GPIO pins  

Note: None of the design sources are verified. You have to verify it by yourself.

## Background Prerequisites
* VitisHLS – [Lab1](https://github.com/bol-edu/course-lab_1) and [Lab2](https://github.com/bol-edu/course-lab_2)
* Xilinx XSIM
* Basic Verilog & HLS coding

[Draft design sources link](https://drive.google.com/drive/folders/15WaEzAkgZPE97dyX6pHcDiDTv6b-hRhJ?usp=sharing)

## Toolchain Prerequisites
* [Ubuntu 20.04+](https://releases.ubuntu.com/focal/)
* [GTKWave v3.3.103](https://gtkwave.sourceforge.net/)
* [RISC-V GCC Toolchains rv32i-4.0.0](https://github.com/stnolting/riscv-gcc-prebuilt)
* [Xilinx Vitis 2022.1](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/2022-1.html)

## Setup
GTKWave and RISC-V GCC Toolchains
```console
$ sudo apt update
$ sudo apt install gtkwave git -y
$ sudo wget -O /tmp/riscv32-unknown-elf.gcc-12.1.0.tar.gz https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/rv32i-4.0.0/riscv32-unknown-elf.gcc-12.1.0.tar.gz
$ sudo mkdir /opt/riscv
$ sudo tar -xzf /tmp/riscv32-unknown-elf.gcc-12.1.0.tar.gz -C /opt/riscv
$ git clone https://github.com/bol-edu/caravel-soc_fpga
$ cd caravel-soc_fpga/
$ chmod +x ~/caravel-soc_fpga/testbench/counter_la/run_xsim ~/caravel-soc_fpga/testbench/counter_wb/run_xsim ~/caravel-soc_fpga/testbench/gcd_la/run_xsim
$ chmod +x ~/caravel-soc_fpga/testbench/counter_la/run_clean ~/caravel-soc_fpga/testbench/counter_wb/run_clean ~caravel-soc_fpga/testbench/gcd_la/run_clean
$ echo 'export PATH=$PATH:/opt/riscv/bin' >> ~/.bashrc
$ source ~/.bashrc
```
Xilinx Vitis
* Install Vitis dependencies `sudo apt install libtinfo5 libncurses5 -y` then 
* Follow offical installation guide: https://docs.xilinx.com/r/2022.1-English/ug1400-vitis-embedded/Installation-Requirements  
  (copy and paste above URL to new browser tab)
* Add to /home/$user/.bashrc after completed Vitis installation   
`source /$installed_path/Xilinx/Vitis/2022.1/settings64.sh`  
`source /$installed_path/xilinx/xrt/setup.sh`

## 3 Labs Specification
### Lab1 : AXI Master to read/write BRAM
* Design source: read_romcode.cpp  

* Lab Content:  
1. Add another axi-master path to write to PS Memory
2. Load program.hex (RISCV code from any of the Caravel testbench) to PS memory buffer
3. Develop host code to load program.hex to BRAM, and read from BRAM
4. Compare the input and output buffer content is the same
<img src="https://user-images.githubusercontent.com/98332019/236379493-6fc15e9a-d093-4a80-8519-5984e8e25b26.png" width=40%>

### Lab2 : spiflash protocol design and validation
* Design source: spiflash.cpp  
Note: this spiflash design only implements: single bit spiflash read  

* Lab Content:  
1. Develop flash controller spiflash_ctrl.v (you can find the design from Caravel) in Verilog
2. Synthesize spiflash.cpp (this is flash memory device)
3. Develop a simple BRAM behavior model, preload the content in testbench
4. Integrate the spiflash_ctrl.v + spiflash.v and verify spiflash_ctrl.v can correctly read data from BRAM through spiflash.cpp  
Note: spiflash.cpp is not verified
<img src="https://user-images.githubusercontent.com/98332019/236381842-5591dd9c-ee11-40d9-8741-dad50b16bc9d.png" width=40%>

### Lab3 : Axiliteaccess GPIO pins
* Reference Design: caravel_ps.cpp  

* Lab Content:  
1. Design a simple module mprj_control.v  
Use one mprj_i pin (synchronize with host code) to stage through several steps, e.g.  
a. Change mprj_o pins value  
b. Some of mprj pins used for loop-back, e.g. (b1) mprj_o[x] =mprj_i[n] (b2) Control mprj_en accordingly  
c. Host use axilite to read mprj_o, mprj_en values
3. Integrate mprj_control.v & caravel_ps.v in Block design–generate bitstream
4. Develop Python host code to verify its behavior
<img src="https://user-images.githubusercontent.com/98332019/236385692-287a8af4-7f22-478f-83ea-afa46f6d09dc.png" width=60%>
