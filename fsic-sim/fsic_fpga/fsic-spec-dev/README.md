# Implementation Specification for FSIC Modules
The following the list of implementation specifications for FISC Validation System (located in /modules). The documents marked "TBD" will be furnished in a later stage.

**Carvel Chip** 
* Config_Ctrl Implementation Specification
* Axilite_Axis (Axilite-Axis Protocol Converter) 
* Axis_Switch Implementation Specification
* IO_Serdes Implementation Specification
* LogicAnalyzer Implementation Specification
* Mailbox Implementation Specification - Exchange message between Caravel_RISC-V and FPGA
* User_project Interface specification
* Tester Implementation Specification (TBD)
* Integrator Implementation Specification (TBD)

**Validation FPGA**
* AxiDMA (FPGA Axis to Axim DMA) Implementation Specification


**System Specification**
* Clocking Implementation Specification
* FSIC-AXIS interface specification
* Power-on_Reset  Implementation Specification (TBD)
* Caravel Chip Software Programming Guide (TBD)
* Validation FPGA Software Programming Guide (TBD)
   
# FSIC Architecture Specification
Full-Stack IC (FSIC) is an IC validation system that trains a full-stack IC designer. A Full-stack IC designer can complete an IC product development with the skills of  IC design, FPGA design, and embedded programming. 
This document defines the architecture for the IC validation platform, namely FSIC Test Architecture. 


### IC Validation System Block Diagram
The following is the proposed IC validation system. 

![01](https://github.com/bol-edu/fsic_fpga/assets/98332019/442b4493-b25c-4712-a936-92d9a9efeca5)


The system consists of three components, the Caravel chip, FPGA and remote Jupyter Notebook.  The Caravel chip hosts the user projects. There could be multiple user projects in the user area. The Caravel chip contains a prebuilt SOC design released from eFabless. For details, please refer to [Caravel Harness](https://caravel-harness.readthedocs.io/en/latest). 
The FPGA is an FPGA chip with SOC. Currently, we support the PYNQ-Z2 board. The following is the block diagram. It consists of PS (SOC) and PL (FPGA). A Jupyter notebook server runs on the PS. The designer can access the system remotely through a Jupyter Notebook web service. The PL part consists of part of the extended user project and testing functions. 
The designer uses Jupyter Notebook web browser to access and control the remote validation system. It performs various tasks, including
1. Develop Caravel RISCV test program and download into Caravel chip
2. Develop FPGA test logics and download it into FPGA chip.
3. Communicate with Caravel RISCV to conduct various testing functions.

![PYNQ-Z2 FPGA Block Diagram](https://github.com/bol-edu/fsic_fpga/assets/98332019/b0b6081a-1f12-4eea-af50-58f6c5cb4682)


## FSIC IC Validation System Function 


1. The standard IO frame and packaging are used for hosting the chip. This way, we can use a standard circuit board with the socket to host different user project
2. Multiple user projects can be embedded in one chip ( DUT )
3. A RISCV SOC performs a management function embedded in the chip. The designer uses the embedded processor for chip initialization and testing. 
4. In addition to the RISC-V SOC, an external FPGA is used to perform the following functions :
    1. Extend the design function in FPGA - each design can use a limited chip area; only the most core functions can be put in, and the rest of the functions are placed in FPGA, and the memory of FPGA can also be used as temporary memory to extend. It enables large systems to be designed with a limited area.
    2. Realize the real-time interactive test function (Tester) on FPGA. Generally, during simulation, the designer will develop a test function (Testbench). This interactive test function can be implemented on the hardware FPGA.
    3. Realize the functions of Logic Analyzer and Tester on FPGA. As a result, it can save expensive instrument construction and be controlled and observed remotely.
    4. The server running Jupyter notebook on the SOC in the FPGA is used to interact with the remote tester.
5. Remote test software development – Designers can use Python to develop test software at the remote end, including the test software for the embedded microprocessor in the DUT. Various functions in the FPGA can be remotely controlled and observed.
6. Remote control, scalability – The verification platform in the remote laboratory has an automatic management function, and users can rent a test platform for verification anytime, anywhere, as long as they have access to the Internet. Multiple designers share one verification machine. Such establishments can be extended to all parts of the world.

### A Proposed Architecture for Accelerator Design
The following Refer to the course [Application Acceleration with High-Level Synthesis](https://youtube.com/playlist?list=PL5CoDA0gtOHWDIbsYuOj10_ocqetwUlWF) proposes an architecture for accelerator design. 
1.	This architecture separates the memory IO subsystem from the kernel processing system. 
2.	The Memory IO subsystem performs memory access extraction/transformation/optimization (Polyhedral Analysis). 
3.	The kernel processing system uses dataflow architecture. 
4.	The memory IO subsystem and kernel processing interface is the stream （axis）interface. 


![03](https://github.com/bol-edu/fsic_fpga/assets/98332019/460f2ab6-fddc-41a4-bae8-340e1314434a)

### Embed Accelerator Architecture into FSIC Architecture
The two subsystems (IOP and PE)  of the accelerator architecture are partitioned in FPGA and Caravel chips. The Memory IO subsystem is implemented in the FPGA. And the kernel processing system is implemented in the Caravel SOC chip. 

#### FPGA
1. Memory, IO Access function, includes memoryaccess extraction/transformation/optimization (Polyhedral Analysis). Note: itcan be an evolutionary optimization process. FPGA provides the benefit ofreprogramming when a new idea comes up.
2. It provides necessary memory buffers.
3. Part of kernel processing can be moved to the FPGA side o reduce the area of the Caravel chip.
4. Provide data to the kernel processing system through the stream interface (axis)
5. Kernel-specific testbench code implemented in FPGA hardware (through direct wires). It provides a hardware level of cycle-by-cycle activation and response interaction. 

#### Caravel Chip
The Processing part is implemented in Caravel chip.
1. Kernel processing logic is in the user project area. Its interface is standard AXI interface, using Axilite, Axis. It interfaces with FPGA through stream (axis) interfaces or direct wires （GPIO pins). 
2. Multiple kernel processing logics are wrapped in user project wrapper to interface with the standard Caravel interface, i.e. Wishbone and/or LogicAnalyzer. 

![04](https://github.com/bol-edu/fsic_fpga/assets/98332019/fe558d4a-6615-41a1-8c81-9af1df8017a1)

### System Operation Paths
The system supports three operation paths in the below figure. 
1. splash download from the remote user before Caravel RISCV boots
2. RISCV communicates with the remote user through FPGA SOC
3. Remote user program user projects in Caravel chip just like Caravel RISCV communicate with users project through Wishbone

![05](https://github.com/bol-edu/fsic_fpga/assets/98332019/9d041f1d-3ed2-4f4c-8de3-e107bec5c9e2)

#### Remote user downloads RISCV test code to spiflash 
Remote user need to download RISC-V test code to spiflash on Caravel board before RISCV boots. Later the control is transferred to RISCV. Thus, the spiflash control is mixed between Caravel and the remote. In the eFabless Caravel board, the spiflash is mixed between the Caravel chip and USB. Refer to [Caravel_schematic](https://github.com/efabless/caravel_board/blob/main/docs/Caravel_schematic.pdf) We will use FPGA to replace USB. By properly controlling the IO enables of the Caravel chip and FPGA, we can have direct wire FPGA and Caravel flash control signals to spiflash.

#### RISCV communicates with remote user
In current practice, RISCV communicates with the test bench through mprj_io (GPIO). The role of FPGA is like the test bench in the simulation system. We will use a mailbox for communication between Caravel RISCV and FPGA. Define a mailbox address rang in user address space in 'h3000_0000 - 'h3fff_ffff. Caravel/RISCV and FPGA/ARM exchange messages through the mailbox.

#### Remote User Programs User Projects
In the case of a test chip without SOC built-in, the FPGA needs a way to act the role of RISC-V in the Caravel chip.  FPGA uses the same memory-mapped IO addresses as defined in Caravel to access user project areas. 

## **User Project Area**
User project area is defined in the blue box in the following picture. It occupies about 10 mm^2^. 
![06](https://github.com/bol-edu/fsic_fpga/assets/98332019/e3e79708-3268-4c93-8c6b-a181051a6413)


### User Projects (module:user_project)
We use a new user project interface which is different from Caravel chip. It has the following interface
- io_clk - This is the high-speed io clock, same as Caravel Chip IO Serialization. We use the clock to serialize the interface signals to reduce the signal counts.
- core_clk - This is for function module.
- control_in & status_out - This is from external axilite module. Since there is only one user project active at at time. We can share the config_ctrl module with other user projects.
- la_data - Debugging signals to Logic Analyzer.
- axis_in/axis_out - AXI stream interface for data transfer. 

The interface signals (control_in, status_out, axis_in, axis_out, and la_data, irq) can go through user_io_block which serializes to external modules. This applies the same IO seraialization machanism to reduce interconnection resources.
![07](https://github.com/bol-edu/fsic_fpga/assets/98332019/639cbe10-3dcd-4deb-be1d-ecf44dd97007)

#### User project IO serialization
We apply the same IO serialization technique in **io_serdes** to reduce the interconnetion from user project to wrapper. Further the signals from multiple user projects are searilly transmitted. The user IO section is either a mux plus an optional flip-flop depending on the need of retiming. The mux select the signal either from the previous user_project or current project depends on if the current project is active project.

![08](https://github.com/bol-edu/fsic_fpga/assets/98332019/03f16fea-ec91-4027-9ad2-09ce9a247ddd)

### New User Project Wrapper (module: user_project_wrapper)
There will be multiple user projects wrapped in a user_projext warpper. 

![09](https://github.com/bol-edu/fsic_fpga/assets/98332019/1bed4bb8-80c9-4598-bbd9-b152fba49369)
![](https://hackmd.io/_uploads/rJrNhToU2.png)


The **User Project Wrapper** includes
1. One or more user projects. There is only one active user project in a running system.
2. **Integrator** logic, include aggregator and disaggregator for
3. Instrumentation tools, including
    - **LogicAnalyzer**
    - **Tester**
4. Protocol Converter
    - **Config_Ctrl** (WB_Axilite)
    - **Axis_AxiLite**
5. IO serialization logic - **IO_Serdes**
6. Communication bwtween Caravel and FPGA 
    - **Mailbox**
7. **Axis_Switch**

Inside **FPGA** 
- **AxiDMA** (Axis to Axim DMA) - Data Mover
- **Axilite-Axis**
- **Mailbox**
- **Extended User Project** - this is the extension of user project which is not in the scope of the architecture.

![10](https://github.com/bol-edu/fsic_fpga/assets/98332019/5238e0db-da3b-415f-b176-a36c740819fc)


### Compatible with original Caravel User Wrapper
The design of the new **User Project Wrapper** needs to be compatible with existing Caravel User Wrapper as below, include
- user_clock2
- Wishbone interface (wb_xxx) 
- mprj_io (38 GPIO pins, io_in, io_out, io_oeb )
- logic analyzer data (la_data_in, la_data_out, la_oenb)
- user_irq
Note: the user_project_wrapper should be compatible with current Caravel SOC definition. 

![11](https://github.com/bol-edu/fsic_fpga/assets/98332019/e8e05553-c822-4820-b519-bd65f8af3c5a)

### Supported AXI Signals
FSIC architecture does not support full set of AXI signals. It only supports those signals that are sufficient to implement the necessary functions. 

#### Table of Supported AXI Signals  
![12](https://github.com/bol-edu/fsic_fpga/assets/98332019/65b1d927-0838-404c-baeb-90c45ba00f8d)

The following highlights functions supported
- 32-bit data width
- 32-bit address
- AXILite supports only 12 address bits, i.e. 4K address range. Cfg_Ctrl will decode upper address ranges to provide **enable** signal to each module.
- Not spport
    - size - fixed at 32-bit
    - burst type - fixed at increment 
    - cache - no cache support
    - protect, exclusive access
    - quality of service (qos)
    - region
    - user defined signals
- tuser[1:0] is provided for the purpose of overlay axilite on axis.
- tid[1:0] and tdest[2:0] - TBD



### Config_Ctrl - Configuration Control Module

All IP in the user project wrapper area uses Axilite interface. This module generates axilite transaction is to configure all modules in user project wrapper area, including
- user projects
- Axis_Switch
- Logic_Analyzer
- IO_serdes
- Tester
- Mailbox

There are two initiators for the configuration transaction
1. Caravel/RISC-V Wishbone bus
2. FPGA Axilite through Axilite-Axis

It performs the following functions
1. Wishbone to Axilite bus conversion
2. Arbitraion among Caravel and FPGA
3. Target decoding determines the target of the configuration cycles. It outputs **target_axilite_enable** signals.

It is a 32-bit data bus and a 10-bit address + target_axilite_enable. The 10-bit address is an offset indexed to its configuration space, refer to memory_map. Thus, the configuration space of each IP is limited to 1KB. If we need more configuration space, we can expand number of address bits.

Note: The user project wrapper is located in the address range from 'h3000_000' to 'h3fff_fff'.
![13](https://github.com/bol-edu/fsic_fpga/assets/98332019/24f1f6fe-e656-4322-b429-49c232f6b007)


### Axis_Switch
There are two data flow directions of AXI stream. 
- **Upstream**: data flows from Caravel to FPGA/Memory
- **Downstream**: data flows from FPGA/Memory to Caravel

The possible data producers and consumers include
- User Project (in Caravel)
- Extended User Project (in FPGA)
- Logic Analyzer (in Caravel)
- Tester (in Caravel)
- Axilite-Axis (in both Caravel, FPGA)
- AxiDMA (in FPGA)

The following is Switch port mapping for both upstream and downstream data flow.
![14](https://github.com/bol-edu/fsic_fpga/assets/98332019/cf11b344-4582-4628-8bc0-cdbe183db2bc)

## Axilite_Axis (Axilite Axis Protocol Conversion) Implementation Specification
This module provides protocol conversion from Axilite to Axis and from Axis to Axilite, as shown below

![15](https://github.com/bol-edu/fsic_fpga/assets/98332019/d36f4a84-ee25-4a70-b584-22852407ceb7)

For protocol conversion from Axilite to Axis, it uses s_axilite (input) and m_axis(output).  
For protocol conversion from Axis to Axilite, it uses s_axis(input) and m_axilite (output).

The module does not contains configuration storage. It generates simple memory-like interface (addr, d_in, d_out, rcmd, wcmd) to access external configuration storage, e.g. mailbox. To act as a s_axilite port, there are configuration registers for the module to decode if the access is to its local configuration or it should converts to axis or both.

The module provides a channel for FPGA/ARM to access modules in Caravel chip, and vice-versa. The Axilite transaction is translated to Axis protocol (refer to fsic-axis specification), and send to axis interface. For Axilite read transaction it is splited to address phase which is 1 cycle of address phase downstream, and one cycle of data phase in later time. When the later axis data phase completes, it sends axilite data and complete the axilite read transaction. 
For axilite write, we use a simple 2 cycle of axis transaction, one cycle for address, one cycle for data. **Please note, the axilite write completion is returned without waiting the downstream axilie is actually completed to simplified the design** The chance of running into race condition is very low. 

The Caravel and FPGA share the same Caravel memory-map. If it conflicts with FPGA system memory-map address. FPGA side remapping scheme is needed. For example if user-project mmio 'h3000-0000'-'3fff_ffff' is used by FPGA, then we can remap to 'hf000-0000' - 'hffff-ffff' if it is available. 

The following illustrates the flow for FPGA/ARM (as initiator) to program Caravel user projects.The FPGA/ARM use PS/GP ports to generate Axilite transaction. It, then, transalates to Axis transaction and passes to Caravel chip. In Caravel chip, the Axis transaction is converted to Axilite transaction, and passed to user project to perform the configuration.
![16](https://github.com/bol-edu/fsic_fpga/assets/98332019/77844290-ee6d-4f9b-afe1-c723062307a5)

The following illustrates the flow for Caravel/RISC-V (as initiator) to communicate with FPGA/ARM by sending message to the mailbox. Caravel uses Wishbone bus, thus, a WB-Axilite bus conversion is used to generate Axilite. The Axilite is converted to Axis, and passed to FPGA. On the FPGA side, the Axis transation is converted to Axilite, and, in this case, to write to the Mailbox. 
![17](https://github.com/bol-edu/fsic_fpga/assets/98332019/03f5f5f6-f1c1-4bb4-bcdc-63c81dafaba2)


### LogicAnalyzer
LogicAnalyzer performs the following functions
1. Monitor signals provided by user project. Support up to  TBD (64?) monitoring signals
2. Singal conditioning to trigger signal logging
3. Compress (Waveform compression, e.g. **Run-Length-Encoding RLE**) the logged signals and sent them to remote users using the Axis port- Waveform display in remote jupyter notebook.

In first implementation, we have the Step 2 (signal conditioning done at the host side).

**Note:** Use Waveform compression (Run-Length-Encoding RLE) with customized coding scheme to save data bandwidth and internal data buffers

**Note:** The LogicAnalyzer function is different from the Caravel LogicAnalyzer function (signals: la_xx ). In Caravel LogicAnzlyzer signals are used for general-purpose gpio signals controlled by RISC-V.

**Note:** The compression algorithm should use as minimum area as possible.

**Note:** The LogicAnalyzer function is different from the Caravel LogicAnalyzer function (signals: la_xx ). In Caravel LogicAnzlyzer signals are used for general-purpose gpio signals controlled by RISC-V.

### Tester - will be implement in a later stage ??
The test program development flow is
1. Define a test instruction set
2. Test program s generated by monitoring interface signals
3. Translate the cycle-by-cycle vectors into test program
4. The output is compared with expected value (in the test program)

### Mailbox - Exchange message between Caravel/RISC-V and FPGA
The mailbox is a set of registers which provides a communication channel between Caravel/RISC-V and FPGA/ARM. The operation mechanism is below:
1. The mailbox registers are duplicated in Caravel chip and in FPGA.
2. When one side (either Caravel or FPGA) write to mailbox, the transaction is passed to other side. 
3. When the mailbox is updated, an interrupt is generated to the other side.
4. The mailbox addresses is defined in the user address space in 'h3000_000 - 'h3fff_ffff.

One ready usage is to provide a test-bench enviornment as in existing Caravel verification environment. In current Caravel testbench, RISCV communicates with the Verilog test bench through mprj_io pins. Verilog testbench observes the mprj_io pins, to take different action. In mailbox scheme, we replace the mprj_io with the mailbox registers.

The mailbox module is instantiated seprately in Caravel and FPGA. Its operation 

#### Mailbox operation

|Operation     |  FPGA side    |  Caravel side |
|:-------------|:--------------|:--------------|
|Caravel Write  | Update mailbox, generate interrupt to ARM |Update mailbox, generate message cycle to FPGA|
|Caravel Read | NOP | Return mailbox content |
|FPGA Write  | Update mailbox, generate message cycle to Caravel | Update mailbox, generate interrupt to Caravel |
|FPGA Read | Return mail content | NOP|


### Integrator
Integration is a module to integrate top level signals, e.g. interrupt, status signals from each user project, or control signal to each user project. It should be designed in a parametrized way, depending on the number of user projects. Considering using HLS C++ template coding style for easy extension. It includes two functions, **Disaggreator** and **Aggregator**.

#### Disaggregator ####
The function of disaggregator is to demultiplex signal, i.e. from a source signal to selected target by some sort of decoding. The following is some usage cases:
- Configuration transaction from Config_Ctrl to multiple targets. It decodes the address range and generate appropriate axilite_en signal
- Axis downstream data to each user project. It is a common bus data for each user project. Only the active user project will receive the data. It may use a shift bus to reduce the interconnect signals.

#### Aggregator
The function of aggregator is to combine multiple signals and multiplexed into one signal, i.e. signas from multiple source modules, and merge/select to an output, by some sort of decoding. The following is some usage cases:
- Axis from multiple user projects and select a user projects to output to Axis-Switch. 
- Config_Ctrl read configuration from multiple targets. 
- LogicAnalyzer selects signals from multiple user projects 
- user_irq

### IO_Serdes
The purpose of this module is to virtually increase the number of IO pins by ratioing the core clock and io clock. In the following diagram, there are m* core signals to IO, and there are n * io pins. To match its throughput, it needs to meet the equation, **m x core_clk = n x io_clk**. For example, if there are only 16 IO pins available for interconnetion between Caravel and FPGA, and the clock ratio m/n = 10, i.e. IO runs at 50Mhz, and core runs at 5Mhz. We virtual have 160 IO pins available. 

![18](https://github.com/bol-edu/fsic_fpga/assets/98332019/dfe0230f-da11-47fb-9ce7-d28dc0653d72)


In designing IO_Serdes, one design issue is that both Caravel and FPGA chip needs to agree on a common phase The IO_Serdes is implemented by shifters and muxes. Both transmission and receiving sides need to agree on a common phase states, i.e. counter value for the mux select. The initialization is done right after Caravel chip comes out reset state by sending a intialization patterns. After the initialization phase, both side runs synchronously afterward, until Caravel chip reset again. 

### AxiDMA (Axis to Axim DMA) - FPGA
The AxiDMA is a reduced version of of the [Xilinx® LogiCORE™ IP AXI Direct Memory Access (AXI DMA) core](https://docs.xilinx.com/r/en-US/pg021_axi_dma/AXI-DMA-v7.1-LogiCORE-IP-Product-Guide). The AxiDMA provides high-bandwidth direct memory access between memory and AXI4-Stream target peripherals. 

#### AxiDMA Block Diagram
![19](https://github.com/bol-edu/fsic_fpga/assets/98332019/878d3c81-fcf4-41ef-a8f3-b58bd4a41b94)

**Note:** To ease early design integration, we can instantiate [Xilinx® LogiCORE™ IP AXI Direct Memory Access (AXI DMA) core](https://docs.xilinx.com/r/en-US/pg021_axi_dma/AXI-DMA-v7.1-LogiCORE-IP-Product-Guide).



## System Specifications
### FSIC-AXIS interface specification
This is an extensition of Axis specification to include FSIC architecture specific function, inclduing
1. Axilite configuration transaction (Axilite Overload)
2. Data payload


#### Transaction Table
TUSER is used to distinguish different transaction types.

| TUSER<1:0>| # of T| Transaction Type |
|:---------:|:-----:|:----------------|
| 00        |    n     | Data payload      |
| 10        | 1     | Axilite read Address Phase. TAD<31:0> is the address ADDR[31:0] |
| 11        | 2     | Axilite write Address + Data. TAD 1^st^ T is the Byte-enable + address, i.e. {BE[3:0],ADDR[27:0]}, 2^nd^ T is the Data[31:0] |
| 01        | 1     | Axilite read Completion. AD<31:0> is the return data DATA[31:0]|

Axilite read transaction is split into address phase and data phase. There are other Axis (Data payload) transaction allowed between the splitted address and data phases, but not another axilite transaction. 
To implement a axilite read transation, master performs

#### Stream ID Table - TID<1:0> Definition
TID is the data stream identifier that indicates different streams of data.

| TID<1:0> | Module |
|:--------:|:--------|
| 00       | User Project - the current active user project|
| 01       | Logic Analyzer |
| 10       | Axilite        |
| 11       | Reserved       |


### FSIC Memory_Map (Memory map table)
This defines memory map for FSIC IP implemented in user project wrapper and validation FPGA. 

### System Clocking Scheme
The FSIC validation system is consisted of two components FPGA and Caravel chip. The FPGA provides the system clock which is used for IO interface (io_clk). The system clock is balancedly fed into FPGA and Caravel. In the FPGA and Caravel chip, the system clock is divided by 8 for core_clk, the main clock for logic function. The following shows its system clocking scheme.


![20](https://github.com/bol-edu/fsic_fpga/assets/98332019/729694e7-6bf3-4dc7-b804-d4cd89c80d0d)



clocking scheme for user project wrapper.
There are two clocks defined in user project wrapper, core_clk, and io_clk which is corresponding to Caravel core_clk, and user_clk shown in the below picture.

#### Caravel clocking scheme
![21](https://github.com/bol-edu/fsic_fpga/assets/98332019/94017f96-44f8-433d-9a50-cd734236195a)

The user_clk is x8 faster than core_clk. That means sel2 is div-1, sel is div-8. In the user_projet_wrapper, the user_clk is used for io_clk. 
The io_clk is used for io_serdes, and serialize user_project signals (user_io) to IO. 
The ratio of io_clk and core_clock is 8 times. It virtual gives 8 times of IO signals. Or we can reduce the user project signals by 8 times.

### Power-on and reset 
Power-on and reset sequence and its control mechanism in the validation system of Caravel-FPGA

### Spliflash download 
Define the sequence and its control mechanism for remote user to download RISC-V executable to Caravel spiflash

### Caravel (RISC-V) software programming guide
Programming guide and examples for Caravel RISC-V program.

### Validation FPGA software programming guide
Programming guide and examples for validation FPGA ARM program

## Implementation Note
To facilitate integration and future enhancement. We will recommend the following coding style

#### Automate the user-project wrapper integration process. 
- Use standard naming for signals. There two type of naming: port name, and signal name. If the signal is user project specific, the interconnect signal is named as **portname_userid**. User id is predefined before design integration.
- Develop a script to assembly and integrate user projects for wrapper module integration. 

#### Coding style to allow for extension
Aggregator, Disaggregate, Axi-Switch and other should adopt parameterized coding style. If use HLS, use C++ template coding. 

## Others

## System Initialization Sequence
1.	Reset Exit Sequence : FPGA -> Caravel
    - FPGA GPIO output (default: assert to reset)  to control Caravel reset, and power circuit
    - Caravel power-on After FPGA bit-stream download
    - Caravel reset released after Caravel firmware download
2.	FPGA download Caravel flash content from host
3.	FPGA release Caravel reset-pin, and wait for Caravel chip initialization done
4.	Caravel chip initialization
