## simulation result log file for reference
https://github.com/bol-edu/caravel-soc_fpga-lab/tree/main/fsic-sim/fsic_fpga/rtl/user/testbench/tc/log/xsim.log

# FSIC – IC Validation System
The FSIC system consists of three components, the Caravel chip, FPGA and remote Jupyter Notebook.  The Caravel chip hosts the user projects. There could be multiple user projects in the user area. The Caravel chip contains a prebuilt SOC design released from eFabless. For details, please refer to Caravel Harness. The FPGA is an FPGA chip with SOC. Currently, we support the PYNQ-Z2 board. The following is the block diagram. It consists of PS (SOC) and PL (FPGA). A Jupyter notebook server runs on the PS. The designer can access the system remotely through a Jupyter Notebook web service. The PL part consists of part of the extended user project and testing functions.  The designer uses Jupyter Notebook web browser to access and control the remote validation system. It performs various tasks, including

Develop Caravel RISCV test program and download into Caravel chip
Develop FPGA test logics and download it into FPGA chip.
Communicate with Caravel RISCV to conduct various testing functions.

![fsic](https://github.com/kevinjantw/fsic_validation_dev/assets/11850122/2f59f43e-f85c-46f7-b190-2ff76c9bb978)

## A Proposed Architecture for Accelerator Design
![fsic-arch](https://github.com/kevinjantw/fsic_validation_dev/assets/11850122/392e7c5c-1a96-4df8-bcbf-948d4e842a21)

## Embed Application Accelerator in Caravel Harness
![Embed Application](https://github.com/kevinjantw/fsic_validation_dev/assets/11850122/a6f4b96a-0fc5-4d57-b7ec-c216e6c97763)

## User Project is readily integrated into SoC – AXI Interface
![User Project](https://github.com/kevinjantw/fsic_validation_dev/assets/11850122/d8eae521-5b76-4ab8-9325-afd919aa9b49)


