# Config_Ctrl Implementation Specification

All IP in the user project wrapper area uses Axilite interface. This module generates axilite transaction is to configure all modules in user project wrapper area, including
- User Projects
- Logic_Analyzer
- Axis_Axilite
    - Mailbox
- IO Serdes

There are two initiators for the configuration transaction
1. Caravel/RISC-V Wishbone bus
2. FPGA Axilite through Axis_Axilite

It performs the following functions
1. Wishbone to Axilite bus conversion
2. Arbitraion among Caravel and FPGA
3. Target decoding determines the target of the configuration cycles. It outputs **cc_?target?_enable** signals.

It is a 32-bit data bus and a 12-bit address + cc_?target?_enable. The 12-bit address is an offset indexed to its configuration space, refer to memory_map. Thus, the configuration space of each IP is limited to 4KB. If we need more configuration space, we can expand number of address bits.

Note: The user project wrapper is located in the address range from 32'h3000_0000' to 32'h3FFF_FFFF'. In case of a transcation target address that is not covered by all slave component, the CC will response the transcation, if reads, return 32'b0. if writes, complete directly.

- User Projects (32'h3000_**0**000~32'h3000_**0**xxx)
- Logic_Analyzer (32'h3000_**1**000~32'h3000_**1**xxx)
- Axis_Axilite (32'h3000_**2**000~32'h3000_**2**xxx)
    - Mailbox (32'h3000_**3**000~32'h3000_**3**xxx)
- IO Serdes (32'h3000_**4**000~32'h3000_**4**xxx)

Note: 
1. In case of read/write address ouside the decode range, read will return ‘hffff_ffff, write will direct complete.
2. There is no cc_mb_enable signal due to Mailbox is direct attached behind the Axis_Axilite, the transaction toward to Mailbox will be forwarded to Axis_Axilite directly. Also, cc_aa_enable will assert in which case. Axis_Axilite must takes the responsability of Mailbox transaction.
3. The address below are defined as debug registers in /caravel-soc/firmware/defs.h. For safty, that must not to be used.  
![b01](https://github.com/bol-edu/fsic_fpga/assets/98332019/0cf3bde8-7d25-476e-970b-e9c08311f659)

![b02](https://github.com/bol-edu/fsic_fpga/assets/98332019/0599e57f-8098-4d3a-b21e-e3d320bb0936)

## Interface Blocks
![b03](https://github.com/bol-edu/fsic_fpga/assets/98332019/a3cb182f-4453-49bf-b462-f9a41d3251e4)


## Feature Lists
List of functions and features
1. Wishbone to AXI-Lite Translation
2. AXI-Lite request sources arbitration
3. Address Decoding for Slaves enabling
4. User Projects Selection

## Interface Signals
### ==Wishbone from User_Project_Wrapper==
| Port | in/out | Descriptiion |
|:------:|:------:|:------------ |
|wb_rst_n_i |   in   | Reset, active-Low |
|wb_clk_i   |   in   | WISHBONE Clock |
|wbs_adr_i[31:0]| in | WISHBONE Address |
|wbs_data_i[31:0]| in | WISHBONE Data Write |
|wbs_sel_i[3:0]| in | WISHBONE Selection |
|wbs_cyc_i| in | WISHBONE Cycle |
|wbs_stb_i| in | WISHBONE Strobe |
|wbs_we_i| in | WISHBONE Write Enable |
### ==Wishbone to User_Project_Wrapper==
| Port | in/out | Descriptiion |
|:------:|:------:|:------------ |
|wbs_ack_o| out | WISHBONE Acknolodgement |
|wbs_data_o[31:0]| out | WISHBONE Data Read |
### ==System Controls to AXI-Lite==
| Port | in/out | Descriptiion |
|:------:|:------:|:------------ |
|axi_areset_n_i | in | AXI Reset, active-Low |
|axi_aclk_o | out | AXI Clock |
### ==AXI-Lite to Slaves (Config_Ctrl as Master)==
AXI-Lite output from Control_Ctrl to each Slave are shared togehter.
| Port | in/out | Descriptiion |
|:------:|:------:|:------------ |
|axi_awaddr[31:0] | out | AXI Write address |
|axi_awvalid | out | AXI Write Address valid |
|axi_wdata[31:0]| out| AXI Write data |
|axi_wstrb[3:0]| out | AXI Write data strobe |
|axi_wvalid| out | AXI Write data valid |
|axi_araddr[31:0] | out | AXI Read address |
|axi_arvalid | out | AXI Read address valid |
|axi_rready | out | AXI Read data ready |
### ==AXI-Lite from Slaves (Config_Ctrl as Master)==
AXI-Lite from each Slave will be isolated with crossponding enable singles. For example, all the Axis_Axilite responses signals will be gated to low in case of cc_aa_enable is 1'b0.
### ==Slave User Project==
| Port | in/out | Descriptiion |
|:------:|:------:|:------------ |
|axi_awready | in | AXI Write Address ready |
|axi_wready | in | AXI Write data ready |
|axi_arready | in | AXI Read address ready |
|axi_rdata[31:0] | in | AXI Read data |
|axi_rvalid | in | AXI Read valid |
### ==Slave LogicAnalyzer==
| Port | in/out | Descriptiion |
|:------:|:------:|:------------ |
|axi_awready | in | AXI Write Address ready |
|axi_wready | in | AXI Write data ready |
|axi_arready | in | AXI Read address ready |
|axi_rdata[31:0] | in | AXI Read data |
|axi_rvalid | in | AXI Read valid |
### ==Slave Axis_Axilite==
| Port | in/out | Descriptiion |
|:------:|:------:|:------------ |
|axi_awready | in | AXI Write Address ready |
|axi_wready | in | AXI Write data ready |
|axi_arready | in | AXI Read address ready |
|axi_rdata[31:0] | in | AXI Read data |
|axi_rvalid | in | AXI Read valid |
### ==Slave IO Serdes==
| Port | in/out | Descriptiion |
|:------:|:------:|:------------ |
|axi_awready | in | AXI Write Address ready |
|axi_wready | in | AXI Write data ready |
|axi_arready | in | AXI Read address ready |
|axi_rdata[31:0] | in | AXI Read data |
|axi_rvalid | in | AXI Read valid |
### ==AXI-Lite from FPGA (Axis-Axilite as Master)==
| Port | in/out | Descriptiion |
|:------:|:------:|:------------ |
|axi_awaddr[31:0] | in | AXI Write address |
|axi_awvalid | in | AXI Write Address valid |
|axi_wdata[31:0] | in| AXI Write data |
|axi_wstrb[3:0] | in | AXI Write data strobe |
|axi_wvalid | in | AXI Write data valid |
|axi_araddr[31:0] | in | AXI Read address |
|axi_arvalid | in | AXI Read address valid |
|axi_rready | in | AXI Read data ready |
### ==AXI-Lite to FPGA (Config_Ctrl as Master)==
| Port | in/out | Descriptiion |
|:------:|:------:|:------------ |
|axi_awready | out | AXI Write Address ready |
|axi_wready | out | AXI Write data ready |
|axi_arready | out | AXI Read address ready |
|axi_rdata[31:0] | out | AXI Read data |
|axi_rvalid | out | AXI Read valid |
### ==Sideband - Slaves Enable (to each slave)==
| Port | in/out | Descriptiion |
|:------:|:------:|:------------ |
|cc_up_enable | out | AXI Slave User project enable |
|cc_la_enable | out | AXI Slave Logic-analyzer enable | 
|cc_aa_enable | out | AXI Slave Axis_Axilite enable |
|cc_is_enable | out | AXI Slave IO Serdes enable |
### ==Sideband - User Project Select (to Top or User Project Control)==
| Port | in/out | Descriptiion |
|:------:|:------:|:------------ |
|user_prj_sel[4:0] | out | User Project Selection |
## Register Description
### ==Configuration Control Group:== 32’h3**8**00_0000~32’h3**8**000_0FFF
|RegisterName|Offset Address| Description |
|:----------:|:------------:| :-----------|
|User Project Selction Control|'h0| User Project Selection Control Register Definition<br>This 5bits register is used for User Project selection. The selection mapping is defined as following:<br>5'h0: All disable (Defalut) <br>5'h1: User Project 0 enabled<br>5'h2: User Project 1 enabled<br>5'h2: User Project 2 enabled<br>...<br>5'h1F: User Project 30 enabled|

## Function Description
### Function 1 - WISHBONE To AXI-Lite Translation:
Description of the function, including 
- block diagram
- Datapath flow
- Control flow
- Logic structure
- Structure component used, e.g. RAM, Shifter, State machine 
### Function 2 - AXI-Lite Request sources arbitration:
Basic idea of AXI-Lite request soruces (CaravelSoC Wishbone to Axilite and FPGA-Axilite) arbitration is applying the Round-Robin stratege.
### Function 3 - Address Decoding for Slaves enabling:
The decoding is supprted for the following modules, and the corrsponding cc_?target?_enable will asserted.
- User Projects (32’h3000_**0**000~32’h3000_**0**FFF), cc_up_enable
- Logic_Analyzer (32’h3000_**1**000~32’h3000_**1**FFF), cc_la_enable
- Axis_Axilite (32’h3000_**2**000~32’h0000_**2**FFF), cc_aa_enable
    - Mailbox (32'h3000_**3**000~32'h3000_**3**xxx)

Note: The address width of the AXI-Lite request from FPGA side may not support full 32bits. In this case, the minimal address width 15 should be mantained (axi_axaddr[15:12] for slave decode, and axi_axaddr[11:0] for register offset).

### Function 4 - User Projects Selection:
In case of multiple User Projects, the Config_Ctrl's User Project Selection Control Register is used for User Project selection. The basic idea of the selection is to gate either clock or reset of the target user project with corresponding control signal (wired-AND with the corrsponding enable signal). This implementaion is not in scope of Config_Ctrl and User Project itself, it should be covered through in other modules of Top integration).
- Example Control path  
![Example Control path](https://github.com/bol-edu/fsic_fpga/assets/98332019/789f9ebc-1459-4f6a-b988-334c67a37e6c)

## Programming Guide
==(TBD)==
- Code illustration to control the function
## Note
#### - The AWPROT, ARPROT, RRESP, and Write Response Channel are not supported in this AXI-Lite implementation.

## Future Work
==(TBD)==

