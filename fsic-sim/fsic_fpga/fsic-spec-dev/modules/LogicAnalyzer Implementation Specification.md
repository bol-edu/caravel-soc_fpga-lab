{%hackmd theme-dark %}

# LogicAnalyzer Implementation Specification
LogicAnalyzer performs the following functions
1. Monitor signals provided by user project. Support up to  TBD (64?) monitoring signals
2. Singal conditioning to trigger signal logging
3. Compress (Waveform compression, e.g. **Run-Length-Encoding RLE****) the logged signals and sent them to remote users using the Axis port- Waveform display in remote jupyter notebook.

In first implementation, we have the Step 2 (signal conditioning done at the host side).

**Note:** Use Waveform compression (Run-Length-Encoding RLE) with customized coding scheme to save data bandwidth and internal data buffers

**Note:** The LogicAnalyzer function is different from the Caravel LogicAnalyzer function (signals: la_xx ). In Caravel LogicAnzlyzer signals are used for general-purpose gpio signals controlled by RISC-V.

## Compression Algorightm and its encoding scheme
The data send to SW side in 72 bit format.  
Normal mode:  
- {length[7:0], data[63:0]}: length and data of RLE  

If buffer overflow happend:
- {8'b0, overflow cycle counts[63:0]}: indicate SW side that how many cycles has no data

Period reset package:
- {72'b0}: indicate the head of AXI pack

### Run-Length Encoding (RLE)

compressed data[71:0] = {length[7:0], data[63:0]}  
- length[7:0]: repeate counter of up_la_data, 8 bit for fully use of AXIS data width, so that 4*72 bit = 9 * 32(AXIS data width) bit. Length start from 1.  
- data[63:0]: up_la_data  

Software emulation code below, this is a brief, for more detail, ref to https://github.com/ultraembedded/openlogicbit/blob/83eae101e173ddcd444730682db83635ae0decc9/core/capture/capture_rle.v  

```cpp
#include <iostream>
#include <random>
#include <fstream>
#include <bitset>

using namespace std;

#define Length_bit 8
#define Data_size 64

struct DataPack{
    bitset<Length_bit> length;
    bitset<Data_size> data;
};

bool RLE(unsigned long long data, DataPack &data_pack){
    static unsigned long counter = 1;  //reset value
    static unsigned long long data_previous = 0;  //reset value
    bool push;
    if(data == data_previous){  // current == previous
        counter ++;
        if(counter==255){  // if counter full
            data_pack.length = counter;
            data_pack.data = data_previous;
            // reset counter and data
            counter = 1;
            data_previous = data;
            push = true;  // push to FIFO
        }
        push = false;
    }else{
        data_pack.length = counter;
        data_pack.data = data_previous;
        counter = 1;
        data_previous = data;
        push = true;  // push to FIFO
    }
    return push;
}
```

### Analytic model
Define a relationship between compressed data and AXIS bandwidth.  
Assume the period of original up_la_data is **T_in**, and the time required to send all the compressed data is **T_out**. If all all data can been sent, T_in and T_out must be:  
:::info
T_in >= T_out ----(1)
:::
Here we assum: 
- Repeat_ratio: the probability that current up_la_data is the same as the previous.
- Pack_bit: the bit width of compressed data.  
- AXIS_DATA_W: write data width of AXIS, current is 32
- AXIS_Efficiency: efficiency ratio of AXIS in the LA view, for example, if LA need 2n cycle to send n*AXIS_DATA_W data, we define the AXIS_Efficiency = n/2n = 1/2  

We have the relation below:
:::info
T_in * (1-Repeat_ratio) * Pack_bit * (1/AXIS_DATA_W) * (1/AXIS_Efficiency) = T_out ----(2)
:::

Combine (1) and (2), we have:
:::success
(1-Repeat_ratio) * Pack_bit * (1/AXIS_DATA_W) * (1/AXIS_Efficiency) <= 1
:::
to satisfy that AXIS can send all compressed data.  
If we assum AXIS_Efficiency = 0.5, means farelly use of AXIS with user project, the Repeat_ratio should >= 7/9 to send all data without losing.  
### Buffer overflow  
If the internal FIFO full, LA start to count the cycles that FIFO has been full, and write a data pack[71:0] = {8'b0, cycles[63:0]} to FIFO once the FIFO has at least two slots.  
Once the SW side receive length = 8'b0 and data != 0, indicate FIFO overflow happend, it should draw cycles[63:0] unknowns on waveform, and append the next data.
### Data Pack on AXIS bus
Because AXI data width must be 32 bits, to avoid additional padding on AXI data, 4 * data[71:0] will transive as 9 * 32 bit AXIS data.  
The SW side should decompose the 9 * 32bits into 4 * 72 bits.  
LA should always keep data pack format, no matter the FIFO full condition happend.
### Recoverable by inserting header in period
For every 256 * data[71:0], LA will send a dummy data[71:0] = 72'b0 at the head of AXI data pack, to indicate SW side the start point of AXI data pack.  
This method can let SW side to reset the start point of AXI data pack if there are something wrong.

## Interface Blocks
![d01](https://github.com/bol-edu/fsic_fpga/assets/98332019/6a569101-18ef-452a-ab96-9134d91e39fa)

## Feature Lists
1. Compress data from user project and send to AXIS Switch.
2. Configurable high/low threshold for internal buffer.
3. Recoverable by inserting header in period.
4. Indicate SW side buffer overflow happend, and provide cycle counts that LA do not record data.

## Interface Signals
* ### General
| Port | in/out | Descriptiion |
|:------:|:------:|:------------ |
|  clk   |   in   | clock        |
| rst_n |   in   | reset is active low        |
|la_hpri_req | out | signal to indicate internal buffer is near full |

* ### Axilite  
| Port| in/out | Descriptiion |
|:------:|:------:|:------------ |
|cc_la_enable | in | Set to 1 when LA is selected|
|axi_awvalid | in | Set to 1 when write command address is valid|
|axi_awaddr | in | Write command address|
|axi_wvalid | in | Set to 1 when a write command data is valid|
|axi_wdata | in |  Write command data|
|axi_wstrb| in | Strb signal of write command data |
|axi_arvalid| in| Set to 1 when read command address is valid
|axi_araddr| in| Read command address
|axi_rready|in|Set to 1 when a read command is received|
|axi_awready | out | Set to 1 when write command address is received|
|axi_wready | out | Set to 1 when a write command is received|
|axi_arready | out | Set to 1 when read command address is received|
|axi_rdata | out | Feedback of read command|
|axi_rvalid | out | Set to 1 when the feedback of read command is valid|





* ### Axis
| Port| in/out | Descriptiion |
|:------:|:------:|:------------ |
|axis_tvalid | out  | This signal indicates that valid data and control information is available on the channel. |
|axis_tdata  | out  | This is the main data bus and carries the payload of the transfer |
|axis_tstrb  | out  | This is the byte strobe signal and is typically used in memory interfaces to indicate valid bytes in axis_tdata. |
|axis_tkeep  | out  | This is a data byte valid indicator. |
|axis_tlast  | out  | This signal indicates the end of a frame or packet |
|axis_tid    | out  |This signal is the source of data stream identifier  |
|axis_tuser  | out  | It can be used for any extra control or status information that the user wants to include with the data stream. |

## Register Description
|RegisterName|Offset Address| Description |
|:----------:|:------------:| :-----------|
|ctrl         |'h00       | bit 0: enabled |
|la_hprj_high_th |'h04       | Thresould to enable <br> `la_hpri_req` |
|la_hprj_low_th  |'h08       | Thresould to disable <br> `la_hpri_req` |


## Function Description

### Compress data from user project and send to AXIS Switch
Use Run-Length-Encoding to compress data and save into buffer. Buffer size is 1KB for now. The actual buffer size can be desided after simulation with user project.
### Configurable high/low threshold for internal buffer
When buffer is near full, LA will send `la_hprj_req` to `Axis-switch` until buffer is near empty. User can confiure threshold from `la_hprj_high_th` and `la_hprj_low_th`.
## Block Diagram:
![d02](https://github.com/bol-edu/fsic_fpga/assets/98332019/1a0ce19e-a577-4e4e-88a0-7e1154867a4d)


## Programming Guide
- Code illustration to control the function

## Future Work

## Discuss


## TODO
- SW simulation

## Ref
https://github.com/ultraembedded/openlogicbit/tree/83eae101e173ddcd444730682db83635ae0decc9



