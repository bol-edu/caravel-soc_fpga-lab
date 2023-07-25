# Caravel SoC FPGA Integration
Project detail are explained in [README.pptx](https://github.com/bol-edu/caravel-soc_fpga-lab/blob/main/labi/doc/README.pptx).
<p align="center"><img src="https://github.com/bol-edu/caravel-soc_fpga-lab/assets/98332019/fd9c7658-03fe-47c1-af51-f3d0d3c413f9" width=70%></p>

## Design Presentation
[全民一起學 IC 設計：Caravel SoC FPGA 驗證平台](https://www.youtube.com/watch?v=EF3vXdaVof0&t=63m46s)  
[報告投影片](https://github.com/bol-edu/caravel-soc_fpga-lab/files/12035595/Caravel.FPGA.Introduction.pdf)

## Build Up Vitis HLS Projects and Export IPs Automatically
```sh
source run_vitis.sh
```

## Build Up Vivado Project for Caravel-FPGA and Execute “write_bitstream” Step to Generate Bitstream
1. run_vivado.sh: generate bitstream of user project counter with clock 50MHz  
2. run_vivado_gcd.sh: generate bitstream of user project gcd with clock 10MHz

```sh
source run_vivado.sh
```
## Run on FPGA
1. connect to remote PYNQ-Z2
2. create ipy_fpga folder on jupyter notebook and upload bitstream, hex and ipynb files to ipy_fpga folder  
   a. counter bitstream should be tested with counter_wb.hex/counter_la.hex  
   b. gcd bitstream should be tested with gcd_la.hex
4. open caravel_fpga.ipynb and run (default loaded hex is counter_wb.hex in caravel_fpga.ipynb)
