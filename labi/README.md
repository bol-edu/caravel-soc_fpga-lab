# Caravel SoC FPGA Integration
Project detail are explained in [README.pptx](https://github.com/bol-edu/caravel-soc_fpga-lab/blob/main/labi/doc/README.pptx).

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
