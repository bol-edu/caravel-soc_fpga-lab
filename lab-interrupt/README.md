# User Project Interrupt Enabling and Handling
Offical Caravel Management SoC – [Interrupt (IRQ) document](https://caravel-mgmt-soc-litex.readthedocs.io/en/latest/index.html#interrupts-irq).

## Design Presentation
[Introduce UART, Interrupt, User BRAM by Willy, Josh](https://www.youtube.com/watch?v=o_KWWsHzoB4&t=53m35s)  
[報告投影片](https://github.com/bol-edu/caravel-soc_fpga-lab/files/12158619/Caravel.SoC.User.Project.Interrupt.Enabling.and.Handling.in.Caravel.SoC.by.Josh.pdf)

## Run IRQ Enabled counter_la Testbench
Run XSIM simulation
```sh
cd ~/caravel-soc_fpga-lab/lab-interrupt/testbench/counter_la
source run_xsim
```
Validate the `USER_PROJ_IRQ0 Test passed` is printed
```
****** Webtalk v2021.1 (64-bit)
  **** SW Build 3247384 on Thu Jun 10 19:36:07 MDT 2021
  **** IP Build 3246043 on Fri Jun 11 00:30:35 MDT 2021
    ** Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.

source /home/hls03/caravel-soc_fpga/testbench/counter_la/xsim.dir/counter_la_tb_elab/webtalk/xsim_webtalk.tcl -notrace
INFO: [Common 17-206] Exiting Webtalk at Tue Jul 25 15:51:41 2023...

****** xsim v2021.1 (64-bit)
  **** SW Build 3247384 on Thu Jun 10 19:36:07 MDT 2021
  **** IP Build 3246043 on Fri Jun 11 00:30:35 MDT 2021
    ** Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.

source xsim.dir/counter_la_tb_elab/xsim_script.tcl
# xsim {counter_la_tb_elab} -autoloadwcfg -runall
Time resolution is 1 ps
run -all
Reading counter_la.hex
counter_la.hex loaded into memory
Memory 5 bytes = 0x6f 0x00 0x00 0x0b 0x13
LA Test 1 started
LA Test 2 passed
USER_PROJ_IRQ0 Test passed
$finish called at time : 5609562500 ps : File "/home/hls03/caravel-soc_fpga/testbench/counter_la/counter_la_tb.v" Line 168
run: Time (s): cpu = 00:00:00.36 ; elapsed = 00:00:36 . Memory (MB): peak = 2666.957 ; gain = 0.000 ; free physical = 40594 ; free virtual = 78402
exit
INFO: [Common 17-206] Exiting xsim at Tue Jul 25 15:52:22 2023...
```

## Build Up Vivado Project for Caravel-FPGA and Generate Bitstream
Generate Caravel SoC FPGA bitstream of [IRQ enabled counter](https://github.com/bol-edu/caravel-soc_fpga-lab/blob/main/lab-interrupt/vivado/vvd_srcs/caravel_soc/rtl/user/user_proj_example.counter.v).

```sh
source run_vivado
```
## Run on FPGA
1. connect to remote PYNQ-Z2
2. create ipy_irq folder on jupyter notebook and upload following bitstream, ipynb and hex files to ipy_irq folder  
   a. vivado/jupyter_notebooks_project/caravel_fpga.bit  
   b. vivado/jupyter_notebooks_project/caravel_fpga.hwh  
   c. vivado/jupyter_notebooks_project/caravel_fpga.ipynb  
   d. testbench/counter_la/counter_la.hex     
4. open caravel_fpga.ipynb and run

## Appendix
Modification is refered to [Add-user-project-irq0-test-related-co.patch](https://github.com/bol-edu/caravel-soc_fpga-lab/blob/main/lab-interrupt/Add-user-project-irq0-test-related-co.patch).
<img src="https://github.com/bol-edu/caravel-soc_fpga-lab/assets/98332019/2cf441bc-3ce1-4a84-9a95-f4ec81da4bfc" width=90%>
