# AXI UART Lite for Caravel
AXI UART Lite details are explained in [pg142-axi-uartlite](https://docs.xilinx.com/v/u/en-US/pg142-axi-uartlite).

## Design presentation
[Introduce UART, Interrupt, User BRAM by Willy, Josh](https://www.youtube.com/watch?v=o_KWWsHzoB4&t=28m55s)  
[報告投影片](https://github.com/bol-edu/caravel-soc_fpga-lab/files/12157210/AXI_UART_Lite.for.Caravel.pptx)

## Build AXI UART Lite Test Hex
Generate counter_la_uart.hex after `source run_xsim`.
```sh
git clone https://github.com/bol-edu/caravel-soc_fpga ~/caravel-soc_fpga
cd ~/caravel-soc_fpga/testbench
cp -rf ~/caravel-soc_fpga-lab/lab-uart/counter_la_uart ./
cd counter_la_uart/
source run_xsim
```

## Open AXI UART Lite Vivado Block Design
```sh
cd ~/caravel-soc_fpga-lab/lab-uart/vivado/vvd_caravel_fpga
vivado vvd_caravel_fpga.xpr
```
Click Open Block Design in left panel
![2023-07-25 11 31 57](https://github.com/bol-edu/caravel-soc_fpga-lab/assets/98332019/9bee2398-4f82-45c4-a0d9-7854a5258162)
