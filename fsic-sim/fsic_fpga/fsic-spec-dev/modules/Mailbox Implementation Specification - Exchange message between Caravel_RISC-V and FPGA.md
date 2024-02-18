#  Mailbox Implementation Specification - Exchange message between Caravel/RISC-V and FPGA
The mailbox is a set of registers which provides a communication channel between Caravel/RISC-V and FPGA/ARM. The operation mechanism is below:
1. The mailbox registers are duplicated in Caravel chip and in FPGA.
2. When one side (either Caravel or FPGA) write to mailbox, the transaction is passed to other side. 
3. When the mailbox is updated, an interrupt is generated to the other side.
4. The mailbox addresses is defined in the user address space in 'h3300_000 - 'h33ff_ffff.

One ready usage is to provide a test-bench enviornment as in existing Caravel verification environment. In current Caravel testbench, RISCV communicates with the Verilog test bench through mprj_io pins. Verilog testbench observes the mprj_io pins, to take different action. In mailbox scheme, we replace the mprj_io with the mailbox registers.

The mailbox module is instantiated seprately in Caravel and FPGA. Its operation 

#### Mailbox operation

|Operation     |  FPGA side    |  Caravel side |
|:-------------|:--------------|:--------------|
|Caravel Write  | Update mailbox, generate interrupt to ARM |Update mailbox, generate message cycle to FPGA|
|Caravel Read | NOP | Return mailbox content |
|FPGA Write  | Update mailbox, generate message cycle to Caravel | Update mailbox, generate interrupt to Caravel |
|FPGA Read | Return mail content | NOP|



## Interface Blocks
Block diagram shows its interconnected module
![image](https://drive.google.com/uc?export=view&id=1JJsYVHvTaw90FsLAUMLdrQPlJvF6oTIe)





## Feature Lists
List of functions and features
1. Update Mailbox register when a avalidable write command occur. 
2. Response Mailbox register data when a avalidable read command occur.



## Interface Signals
### Common 

| Port | in/out | Descriptiion |
|:------:|:------:|:------------ |
|  clk   |   in   | clock        |
| rst_n |   in   | reset is active low        |


### AXILite slave for Axilite_Axis

| Port | in/out | Descriptiion |
|:------:|:------:|:------------ |
|aa_mb_axi_awvalid | in | Set to 1 when write command address is valid.|
|aa_mb_axi_awaddr[11:0] | in | Write command address .|
|aa_mb_axi_awready | out | Set to 1 when mailbox receive a write command address .|
|aa_mb_axi_wvalid | in | Set to 1 when write command data is valid.|
|aa_mb_axi_wdata[31:0] | in |  Write command data.|
|aa_mb_axi_wready | out | Set to 1 when mailbox receive a write command data .|
|aa_mb_axi_wstrb[3:0]| in | Strb signal of write command data. |
|aa_mb_axi_arvalid| in| Set to 1 when read command address is valid.
|aa_mb_axi_rready|out|Set to 1 when mailbox receive a read command.|
|aa_mb_axi_araddr[11:0]| in| Read command address.
|aa_mb_axi_rvalid | out | Set to 1 when the feedback of read command is valid.|
|aa_mb_axi_rdata[31:0] | out | Feedback of read command.|




## Register Description
A table shows register definitions
### Register Group Name : Based Address

|RegisterName|Offset Address| Description |
|:----------:|:------------:| :-----------|
|mb_reg_0[31:0]|'h0||
|mb_reg_1[31:0]|'h4||
|mb_reg_2[31:0]|'h8||
|mb_reg_3[31:0]|'hc||
|mb_reg_4[31:0]|'h10||
|mb_reg_5[31:0]|'h14||
|mb_reg_6[31:0]|'h18||
|mb_reg_7[31:0]|'h1c||

## Function Description

### Handle Write Command:
While both of axi_awvalid and axi_wvalid is set to 1, a write command for Mailbox is avalidable. When a write command happen, Mailbox module follows the steps below to handle:<br> 1. Get write command address, data and strb.<br> 2. Sends axi_awready and axi_wready in response to AXIlite master<br> 3. Update the local register. <br>~~If remote signal is set to 1 while the write command is avlidable, it means the write command is from the remote side. Mailbox send a interrupt signal to local CPU after finish a write command which is from remote side. Software needs to write relative interrupt status bit to clear interrupt.~~

### Handle Read Command:
While axi_arvalid is set to 1, a read command for Mailbox is avalidable.<br>When a read command happen, Mailbox module follows the steps below to handle:  <br>1. Get read command address. <br>2. Sends axi_rready in response to AXIlite master.<br>3. Send axi_rvalid and axi_rdata as the feedback of read command.

## Programming Guide
- Code illustration to control the function

## Future Work
TBD
