# Integrator Implementation Specification
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

## Interface Blocks
Block diagram shows its interconnected module

## Feature Lists
- AXI4 compliant
- Direct Register Mode (no scatter/gather support)
Transfers are commanded by setting a Source Address (for MM2S) or Destination Address (For S2MM) and then specifying a byte count in a length register.
- AXI4 data width support of 64 (to match PS/PL HP port data width)
- AXI4-Stream data width support of 32
- Only support 32-bit data alignment
- Support for up to 32-bit addressing


Note: The following features will be supported in the future
Optional Scatter/Gather Direct Memory Access (DMA) support 
- AXI4 data width support of 32, 64, 128, 256, 512 and 1,024 bits
- AXI4-Stream data width support of 8, 16, 32, 64, 128, 256, 512 and 1,024 bits
- Optional Keyhole support
- Optional Data Re-Alignment support for streaming data widths up to 512 bits
- Optional AXI Control and Status Streams
- Optional Micro DMA Support
- Support for up to 64-bit addressing- 

## Interface Signals


| Port | in/out | Descriptiion |
|:------:|:------:|:------------ |
|  clk   |   in   | clock        |
| rst_n |   in   | reset is active low        |
|sig1_i | in | signal #1 indicates data is valid |
|sig2_o | out | sig_o is an output signal |
|sig3_i_n| in | sign3_ni is active low input |

## Register Description
A table shows register definitions
### Register Group Name : Based Address

|RegisterName|Offset Address| Description |
|:----------:|:------------:| :-----------|
|Control     |'h0             | Control Register block Definition<br>bit 0: bit 0 function<br>bit 1: bit 1 function<br>bit 2: bit 2 function is<br>bit 3: bit 3 function |
|Status      | 'h4          | Status register block definition<br>bit 0: bit 0 status is<br>bit 1: bit 1 interrupt status|

## Function Description

### Function 1:
Description of the function 1, including 
- block diagram
- Datapath flow
- Control flow
- Logic structure
- Structure component used, e.g. RAM, Shifter, State machine 

## Programming Guide
- Code illustration to control the function

## Future Work