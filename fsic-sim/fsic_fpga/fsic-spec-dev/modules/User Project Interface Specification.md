# User Project Interface Specification
We use a new user project interface which is different from Caravel chip. It has the following interface
- io_clk - This is the high-speed io clock, same as Caravel Chip IO Serialization. We use the clock to serialize the interface signals to reduce the signal counts.
- core_clk - This is for function module.
- control_in & status_out - This is from external axilite module. Since there is only one user project active at at time. We can share the config_ctrl module with other user projects.
- la_data - Debugging signals to Logic Analyzer.
- axis_in/axis_out - AXI stream interface for data transfer. 

The interface signals (control_in, status_out, axis_in, axis_out, and la_data, irq) can go through user_io_block which serializes to external modules. This applies the same IO seraialization machanism to reduce interconnection resources.
![f01](https://github.com/bol-edu/fsic_fpga/assets/98332019/9b316b61-4e7f-4370-bd78-894f6f1d342c)

#### User project IO serialization
We apply the same IO serialization technique in **io_serdes** to reduce the interconnetion from user project to wrapper. Further the signals from multiple user projects are searilly transmitted. The user IO section is either a mux plus an optional flip-flop depending on the need of retiming. The mux select the signal either from the previous user_project or current project depends on if the current project is active project.

![f02](https://github.com/bol-edu/fsic_fpga/assets/98332019/652ec54f-545c-4921-854e-66684cbfa8cd)

#### Example user project : FIR 
We will implement FIR as an user project. The user project can be implementated in HLS or Verilog.
A reference [FIR HLS Implementation](https://drive.google.com/drive/folders/1wLCObbCZG8J_jPthsk_LtaD3eCcifRRU?usp=sharing) below. The coefficient array (c[N]) is programmed by Axilite (Note: change the following code to have coef_t c[N] as a function argument). The input data **x** and output data **y** is Axi-stream.

```cpp
`void fir(data_t *y, data_t x) {
	coef_t c[N] = {53, 0, -91, 0, 313, 500, 313, 0, -91, 0, 53};
#pragma HLS ARRAY_PARTITION variable=c complete dim=1
	static data_t shift_reg[N];
#pragma HLS ARRAY_PARTITION variable=shift_reg complete dim=1
	acc_t acc;
	int i;

	acc = 0;

TDL:
for (i = N - 1; i > 0; i--) {
#pragma HLS UNROLL
	shift_reg[i] = shift_reg[i - 1];
}
shift_reg[0] = x;

acc = 0;
MAC:
for (i = N - 1; i >= 0; i--) {
#pragma HLS UNROLL
	acc += shift_reg[i] * c[i];
}

*y = acc;

}
```



## Interface Blocks
Block diagram shows its interconnected module

## Feature Lists


## Interface Signals


| Port   | in/out | Descriptiion |
|:------:|:------:|:------------ |
|  clk   |   in   | clock        |
| rst_n  |   in   | reset is active low        |
|sig1_i  | in | signal #1 indicates data is   valid |
|sig2_o  | out | sig_o is an output signal |
|sig3_i_n| in | sign3_ni is active low input |
* ### Interface With Axilite  
| Port| in/out | Descriptiion |
|:------:|:------:|:------------ |
|  axi_awready  |   out   |Write address ready|
|  axi_wready   |   out   |Write data ready   |
|  axi_arready  |   out   |Read address ready |
|  axi_rdata    |   out   |Read data          |
|  axi_rvalid   |   out   |Read data valid         |
* ### Interface With Axis_Switch
#### Input 
| Port | in/out | Descriptiion |
|:------:|:------:|:------------ |
|axis_tvalid | in  | This signal indicates that valid data and control information is available on the channel. |
|axis_tready | out | This signal indicates that the sink is ready to accept the data. |
|axis_tdata  | in  | This is the main data bus and carries the payload of the transfer |
|axis_tstrb  | in  | This is the byte strobe signal and is typically used in memory interfaces to indicate valid bytes in axis_tdata. |
|axis_tkeep  | in  | This is a data byte valid indicator. |
|axis_tlast  | in  | This signal indicates the end of a frame or packet |
|axis_tid    | in  |This signal is the source of data stream identifier  |
|axis_tuser  | in  | It can be used for any extra control or status information that the user wants to include with the data stream. |
#### Output 
| Port | in/out | Descriptiion |
|:------:|:------:|:------------ |
|axis_tvalid | out  | This signal indicates that valid data and control information is available on the channel. |
|axis_tready | in | This signal indicates that the sink is ready to accept the data. |
|axis_tdata  | out  | This is the main data bus and carries the payload of the transfer |
|axis_tstrb  | out  | This is the byte strobe signal and is typically used in memory interfaces to indicate valid bytes in axis_tdata. |
|axis_tkeep  | out  | This is a data byte valid indicator. |
|axis_tlast  | out  | This signal indicates the end of a frame or packet |
|axis_tid    | out  |This signal is the source of data stream identifier  |
|axis_tuser  | out  | It can be used for any extra control or status information that the user wants to include with the data stream. |

* ### Interface With Logic Analyzer
| Port | in/out | Descriptiion
|:------:|:------:|:------------ |
## Register Description
A table shows register definitions

## Function Description
### Register Group Name : Based Address

|RegisterName|Offset Address| Description |
|:----------:|:------------:| :-----------|
|Control     |'h0             | Control Register block Definition<br>bit 0: bit 0 function<br>bit 1: bit 1 function<br>bit 2: bit 2 function is<br>bit 3: bit 3 function |
|Status      | 'h4          | Status register block definition<br>bit 0: bit 0 status is<br>bit 1: bit 1 interrupt status|

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

## Reference

