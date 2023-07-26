# Caravel SoC FPGA Labs
Labs to experiment Caravel SoC FPGA module design with Verilog & HLS.

## Introduce to Labs
* lab1: AXI master read/write BRAM
* lab2: spiflash protocol design and validation
* lab3: Axilite access GPIO pins
* labi: Caravel SoC FPGA integration ([Community released Caravel SoC FPGA](https://github.com/bol-edu/caravel-soc_fpga))
* lab-exmem: Executing Function in User Project Memory
* lab-interrupt: User Project Interrupt Enabling and Handling
* lab-uart: AXI UART Lite for Caravel

## Background Prerequisites
* Vitis HLS - [course-lab_1](https://github.com/bol-edu/course-lab_1) and [course-lab_2](https://github.com/bol-edu/course-lab_2)
* Xilinx XSIM - [XSIM of GCD](https://github.com/bol-edu/soclab-nthusp23/tree/main/lab/02.xsim-gcd)
* Basic Verilog & HLS coding

## Toolchain Prerequisites
* [Ubuntu 20.04+](https://releases.ubuntu.com/focal/)
* [Xilinx Vitis 2022.1](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/2022-1.html)
* [GTKWave v3.3.103](https://gtkwave.sourceforge.net/)
* [RISC-V GCC Toolchains rv32i-4.0.0](https://github.com/stnolting/riscv-gcc-prebuilt)

## Setup Toolchain
Get presetup Vitis Virtual Machine from course TA or setup following toolchains yourself.
* Ubuntu 20.04+ and Xilinx Vitis [HLS tools installation guide](https://github.com/bol-edu/course-lab_1/blob/2022.1/HLS%20Tools%20Installation%20Guide%202022.1_ubuntu.md)
* GTKWave and RISC-V GCC Toolchains
```console
$ sudo apt update
$ sudo apt install gtkwave git -y
$ sudo wget -O /tmp/riscv32-unknown-elf.gcc-12.1.0.tar.gz https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/rv32i-4.0.0/riscv32-unknown-elf.gcc-12.1.0.tar.gz
$ sudo mkdir /opt/riscv
$ sudo tar -xzf /tmp/riscv32-unknown-elf.gcc-12.1.0.tar.gz -C /opt/riscv
$ echo 'export PATH=$PATH:/opt/riscv/bin' >> ~/.bashrc
$ source ~/.bashrc
```

## Git Clone Caravel SoC FPGA Labs
```sh
git clone https://github.com/bol-edu/caravel-soc_fpga-lab ~/caravel-soc_fpga-lab
```

## Labs Specification
Draft [design specs](https://github.com/bol-edu/caravel-soc_fpga-lab/blob/main/caravel-fpga-lab.pdf) and [design reference sources](https://drive.google.com/drive/folders/15WaEzAkgZPE97dyX6pHcDiDTv6b-hRhJ?usp=sharing) of labs.

### Lab1 : AXI Master to read/write BRAM
* Design spec: read_romcode.cpp
* Lab Content:  
1. Add another axi-master path to write to PS Memory
2. Load program.hex (RISCV code from any of the Caravel testbench) to PS memory buffer
3. Develop host code to load program.hex to BRAM, and read from BRAM
4. Compare the input and output buffer content is the same
<img src="https://user-images.githubusercontent.com/98332019/236379493-6fc15e9a-d093-4a80-8519-5984e8e25b26.png" width=40%>

### Lab2 : spiflash protocol design and validation
* Design spec: spiflash.cpp  
Note: this spiflash design only implements: single bit spiflash read
* Lab Content:  
1. Develop flash controller spiflash_ctrl.v (you can find the design from Caravel) in Verilog
2. Synthesize spiflash.cpp (this is flash memory device)
3. Develop a simple BRAM behavior model, preload the content in testbench
4. Integrate the spiflash_ctrl.v + spiflash.v and verify spiflash_ctrl.v can correctly read data from BRAM through spiflash.cpp  
Note: spiflash.cpp is not verified
<img src="https://user-images.githubusercontent.com/98332019/236381842-5591dd9c-ee11-40d9-8741-dad50b16bc9d.png" width=40%>

### Lab3 : Axilite access GPIO pins
* Design spec: caravel_ps.cpp
* Lab Content:  
1. Design a simple module mprj_control.v  
Use one mprj_i pin (synchronize with host code) to stage through several steps, e.g.  
a. Change mprj_o pins value  
b. Some of mprj pins used for loop-back, e.g. (b1) mprj_o[x] =mprj_i[n], (b2) Control mprj_en accordingly  
c. Host use axilite to read mprj_o, mprj_en values
3. Integrate mprj_control.v & caravel_ps.v in Block design–generate bitstream
4. Develop Python host code to verify its behavior
<img src="https://user-images.githubusercontent.com/98332019/236385692-287a8af4-7f22-478f-83ea-afa46f6d09dc.png" width=60%>
