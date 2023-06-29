# Caravel SoC FPGA Integration
Project detail are explained in [README.pptx](https://github.com/bol-edu/caravel-soc_fpga-lab/blob/main/labi/doc/README.pptx).
<p align="center"><img src="https://github.com/bol-edu/caravel-soc_fpga-lab/assets/98332019/fd9c7658-03fe-47c1-af51-f3d0d3c413f9" width=70%></p>


## Build up Vitis HLS projects and export IPs automatically
```sh
source run_vitis.sh
```

## Build up Vivado project for Caravel-FPGA and execute “write_bitstream” step to generate bitstream
```sh
source run_vivado.sh
```
## Run on FPGA
1. connect to remote PYNQ-Z2
2. create ipy_fpga folder on jupyter notebook and upload bitstream and ipynb files to ipy_fpga folder
3. open ipynb file and run (default test is counter_wb.hex)
