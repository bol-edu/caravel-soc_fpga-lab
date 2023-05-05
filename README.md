# Caravel SoC FPGA Lab
3 Labs to experiment with Verilog & HLS

## Introduce to 3 Labs
* Lab1: AXI master read/write BRAM
* Lab2: spiflash protocol design and validation
* Lab1+2: integrate Lab1 and Lab2
* Lab3: Axiliteaccess GPIO pins  

Note: None of the design sources are verified. You have to verify it by yourself.

## Background Prerequisites
* VitisHLS – [Lab1](https://github.com/bol-edu/course-lab_1) and [Lab2](https://github.com/bol-edu/course-lab_2)
* Xilinx XSIM
* Basic Verilog & HLS coding  

[Draft design sources link](https://drive.google.com/drive/folders/15WaEzAkgZPE97dyX6pHcDiDTv6b-hRhJ?usp=sharing).

## 3 Labs Spec
### Lab1 : AXI Master to read/write BRAM
* Design source: read_romcode.cpp
* Lab Content:  
1. Add anotheraxi-master path to write to PS
Memory  
2. Loadprogram.hex(RISCV code from any of the
Caraveltestbench) to PS memory buffer  
3. Develop host code to loadprogram.hexto
BRAM, and read from BRAM.  
4. Compare the input and output buffer content
is the same
![Lab1](https://user-images.githubusercontent.com/98332019/236379493-6fc15e9a-d093-4a80-8519-5984e8e25b26.png)
