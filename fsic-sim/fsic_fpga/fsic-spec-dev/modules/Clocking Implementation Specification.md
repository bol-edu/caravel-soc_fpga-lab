# Clocking Implementation Specification
The FSIC validation system is consisted of two components FPGA and Caravel chip. The FPGA provides the system clock which is used for IO interface (io_clk). The system clock is balancedly fed into FPGA and Caravel. Both FPGA and Caravel runs synchronous clock with the same frequency and balanced skew. In the FPGA, the frequency of clk_out (system clock) is programmable. 

In the FPGA and Caravel chip, the system clock is divided by 8 for core_clk, the main clock for logic function. The following shows its system clocking scheme. 

#### system clocking scheme

![a01](https://github.com/bol-edu/fsic_fpga/assets/98332019/35a0976c-bb1b-4a2c-876e-3e32678f6b53)

clocking scheme for user project wrapper.
There are two clocks defined in user project wrapper, core_clk, and io_clk which is corresponding to Caravel core_clk, and user_clk shown in the below picture.

#### Caravel clocking scheme
![a02](https://github.com/bol-edu/fsic_fpga/assets/98332019/6798c8af-cc9d-42fa-a3aa-07fd5fdc4c6f)

The user_clk is x8 faster than core_clk. That means sel2 is div-1, sel is div-8. In the user_projet_wrapper, the user_clk is used for io_clk. 
The io_clk is used for io_serdes, and serialize user_project signals (user_io) to IO. 
The ratio of io_clk and core_clock is 8 times. It virtual gives 8 times of IO signals. Or we can reduce the user project signals by 8 times.

## Clock Skew Control
The Caravel chip and FPGA runs synchronously both on core_clk and io_clk, i.e. the skew of the core clock separately in Caravel chip and FPGA is controlled, so is the io_clk. The skew is controlled by board layout, and matched IO buffer delay. 
Within Caravel and FPGA, the skew between core_clk and io_clk is also controlled by balanced clock tree layout. A detailed post-layout static timing analysis guarantee there is no hold time violation when signal is passed between core_clk and io_clk. A synchronizer using negative io_clk edge is a method to ensure safe hold time. 


## Interface Blocks
Block diagram shows its interconnected module

## Feature Lists
List of functions and features
1. Feature#1
2. Feature#2

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


