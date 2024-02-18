# IO_Serdes Implementation Specification
The purpose of this module is to virtually increase the number of IO pins by ratioing the core clock and io clock. In the following diagram, there are m* core signals to IO, and there are n * io pins. To match its throughput, it needs to meet the equation, **m x core_clk = n x io_clk**. For example, if there are only 16 IO pins available for interconnetion between Caravel and FPGA, and the clock ratio m/n = 10, i.e. IO runs at 50Mhz, and core runs at 5Mhz. We virtual have 160 IO pins available. 

![c01](https://github.com/bol-edu/fsic_fpga/assets/98332019/007e8a7c-3d8f-42c9-bc2a-e3a94773c915)


In designing IO_Serdes, one design issue is that both Caravel and FPGA chip needs to agree on a common phase. The IO_Serdes is implemented by shifters and muxes. Both transmission and receiving sides need to agree on a common phase states, i.e. counter value for the mux select. The initialization is done right after Caravel chip comes out reset state by sending a intialization patterns. After the initialization phase, both side runs synchronously afterward, until Caravel chip reset again. 

## Brief Explanation about the module function

### clock and reset
![](https://hackmd.io/_uploads/rJ6WvcaPh.png)

### block diagram

![](https://hackmd.io/_uploads/By2qI9Twh.png)

### No Need Training Pattern

#### txclock forward with data
In default the txclk is off, when txen=1 then txclk is running and data is come with clock.
In Rx side, the first data in RxFIFO is the txdata[0]. In this method no need Training Patter for symbol(4 bits) lock.

### Tx(local) side provide txclk from ioclk and Rx(remote) side received it as rxclk
- Tx side output serial_data align with txclk rising edge.
- Rx side use rxclk negative edge to sample the serial_data

![](https://hackmd.io/_uploads/HyXAi5pwh.png)


### axis_data_fifo to Serial_Data_out
![](https://hackmd.io/_uploads/S1n_o9aP3.png)

### Serial_Data_in to rxdata_out
- Serial_Data_in to RxFIFO
    - use w_ptr
- RxFIFO to rx_shift_reg
    - use r_ptr
- rx_shift_reg to rx_data_out
    - move when rx_shift_phase_cnt = 3
![](https://hackmd.io/_uploads/Hy7YloTD3.png)


### Init sequence
- Step 1. system power on and reset de-assert
- Step 2. rxen = 1 with in 100ms after reset de-assert
    - rxen for avoid glitch issue when GPIO setting changed.
- Step 3. Tx side provide txclk with data when txen =1. 
    - Must wait enough time for Rx side reset de-assert and rxen=1
    - Use negedge to generate txen to avoid glitch in txclk.
    - For example : Tx side wait 200 ms after reset de-assert then set txen =1. 
- Step 4. Rx side read Serial_data_in as below
    - Step 4-1. Use rxclk to sample Serial_data_in to RxFIFO(deep=5)  by w_ptr
        - Need 2 filp-flops for avoid metastable issue when read w_ptr (Gray code).
- Step 4-2. Use ioclk to read RxFIFO and push to Rx_Shift_Reg 
- Step 4-3. Use ioclk to move Rx_Shift_Reg to Rx_Sync_FIFO when Rx_Shift_Reg_Valid (4 bits  data ready in Rx_Shift_Reg)
- Step 4-4. Use coreclk to get Rx_Sync_FIFO when Rx_Sync_FIFO_Valid


## Interface Blocks
Block diagram shows its interconnected module

## Feature Lists
List of functions and features
1. Feature#1
2. Feature#2

## Interface Signals

TX/RX need 47 (47 < 48 = 12*4) signals and use 12 pins for each direction.

| Port | in/out | Descriptiion |
|:------:|:------:|:------------ |
|??_is_axis_clk_i|	In	|axis clock Input|
|??_is_axis_rst_i|	In	|axis reset Input|
|??_is_io_clk_i	1|	In	|io clock|
| rst_n |   in   | reset is active low        |
|as_is_axis_tvalid_i	|In	|as to is Valid			|
|as_is_axis_tready_o	|Out	|as to is Ready			|
|as_is_axis_tdata_i[32]	|In	|as to is Data			|
|as_is_axis_tstrb_i[4]	|In	|as to is Strobe			|
|as_is_axis_tkeep_i[4]	|In	|as to is Keep			|
|as_is_axis_tlast_i	|In	|as to is Last			|
|as_is_axis_tid_i[2]	|In	|as to is Source ID			|
|as_is_axis_tuser_i[2]	|In	|as to is User Siginal			|
|is_as_axis_tvalid_o	|Out|	is to as Valid			|
|is_as_axis_tready_i	|In	|is to as Ready			|
|is_as_axis_tdata_o[32]	|Out	|is to as Data			|
|is_as_axis_tstrb_o[4]	|Out	|is to as Strobe			|
|is_as_axis_tkeep_o[4]	|Out	|is to as Keep			|
|is_as_axis_tlast_o	|Out	|is to as Last			|
|is_as_axis_tid_o[2]	|Out	|is to as Source ID			|
|is_as_axis_tuser_o[2]	|Out	|is to as User Siginal			|
|is_mprj_tx[12]|Out | is to mprj_io TX|
|mprj_is_rx[12]|In | mprj_io to is RX|

## Register Description
A table shows register definitions
### Register Group Name : Based Address

|RegisterName|Offset Address| Description |
|:----------:|:------------:| :-----------|
|IO Serdes Control     |'h0             | Control Register block Definition<br>bit 0: rxen_ctl<br>FSIC FW set this bit to 1 when GPIO config setting is done for io serdes. set this bit within 100ms after reset de-assert<br>bit 1: txen_ctl<br>FSIC FW set this bit to 1 when remote side had enable rx. set this bit after 200ms after reset de-assert
 |
|Status      | 'h4          | Status register block definition<br>NA|

## Function Description

### Flow Control by axis_switch
- issue: the ready signal from local side need 2T to observed in remote side
    - in below figure the data in axis_data_fifo in local side take 2T to axis_ad_out in remote side
![](https://hackmd.io/_uploads/SyZXPTTvh.png)

- axis_switch need implment a buffer, base on the thresh hold ( for example, available slot in buffer <= 2) to generate  ready signal to remote side.

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



