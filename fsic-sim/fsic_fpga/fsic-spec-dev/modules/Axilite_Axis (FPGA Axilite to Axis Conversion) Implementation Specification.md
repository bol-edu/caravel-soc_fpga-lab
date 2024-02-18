# Axilite_Axis (Axilite Axis Protocol Conversion) Implementation Specification
This module provides protocol conversion from axi4 lite (axilite) to axi4 stream (axis) and from axi4 stream to axi4 lite, as shown below.

![](https://drive.google.com/uc?export=view&id=1n7GhsaW1yYoY2KRnGE6839jNQ_jcM4Zl)

For protocol conversion from axilite to axis, it uses s_axilite (input) and m_axis (output).
For protocol conversion from axis to axilite, it uses s_axis (input) and m_axilite (output).

The module provides a channel for FPGA/PS to access modules in Caravel chip, and vice-versa. FPGA/PS can access (read/write) all the modules in user_wrapper area, i.e. 0x3000_0000 address range. it converts axilite transaction to [modified axis transaction](https://github.com/bol-edu/fsic-spec-dev/blob/main/modules/FSIC-AXIS%20interface%20specification.md). for more details, please refer to the spec. also, the behavior is different when this module located in caravel or fpga, software needs to configure **location register**.

this module has axilite master to access external configuration storage mailbox. if axilite write transaction come from other side want to write the mailbox, an interrupt can be generated to notify software, then software can check the **interrupt status register**. e.g.: transaction from caravel want to write fpga mailbox and interrupt is enabled in **interrupt control register**, will raise an interrupt for fpga/ps.

The Caravel and FPGA share the same Caravel memory-map. If it conflicts with FPGA system memory-map address. FPGA side remapping scheme is needed. in case of the mailbox base address in address map may change at fpga side, this module implements **remap control register / remap addr register** for software configuration.

## bus protocol conversion
![bus protocol conversion](https://drive.google.com/uc?export=view&id=15UyfNoBsNcn67D7s8WNFNhD4migp2xPY)
as shown in the image, 
1. the transaction received from axilite slave will convert to axis issued by axis master with **tid** = 2'b01, where
<br>  a. axilite write address / write data become a two-cycle axis data, and send with **tuser** = 2'b01.
<br>  b. axilite read address become a one-cycle axis data with **tuser** = 2'b10.
<br>  c. axilite read data will return from axis slave, identified with **tuser** = 2'b11. please note the axilite master shall not send new axilite read request before read data returned. this module keeps axilite read address channel slave ready low until the read data returned. in other words, the new axilite read request will not be accepted until previous read data returned. in case of the data not returned thus the system stuck, we will implement an error handling process: 
<br> (i) when timeout, return a fake data (0xFFFF_FFFF) to the read request sender.
<br> (ii) also generate an interrupt with error status to the read request sender. 
<br> (iii) this module treats the timeout read request as completed.
<br>  the error handling process will be implemented in later phase. the definition of timeout? may need a register for that.
2. the transaction received from axis slave will convert to axilite issued by axilite master, where
<br>  a. axis slave two-cycle data with **tuser** = 2'b01, can be converted to axilite write address / write data.
<br>  b. axis slave one-cycle data with **tuser** = 2'b10, can be converted to axilite read address.
<br>  c. once the read data returned from axilite master, the data will convert to axis master transaction with **tuser** = 2'b11.
3. about the address bus width difference:
<br>  a. addr[31:0] is send by config control. when convert to axis, this module removes addr[31:28] to make addr[27:0].
<br>  b. for addr[27:0] in axis slave, convert to axilite master addr[31:0], this module appends zero. at caravel side, config_control can identify.
<br>  c. for fpga/ps, we need addr[31:0] for axilite slave.

## Interface Blocks
![interface](https://drive.google.com/uc?export=view&id=1-FyWw92OE82LvBXjQsf79M83n-i9EhoD)
note: at fpga side, the gray out axilite master block, which have clock signal gated. because we do not need a axilite master sending request to fpga/ps.

how the transaction travel between two sides, because there are several paths for a transaction can go through, here is a python like pseudo code to demonstrate:
```python
# addr is the address received by s_axilite, could be from config_control or fpga/PS

if addr in range(0x3000_3000, 0x3000_3FFF): # mailbox address space
	if caravel:
		if read:    # path 1
			=> read caravel mailbox
		elif write: # path 2
			=> write caravel mailbox
			=> write fpga mailbox (raise interrupt in fpga)

	elif fpga:
		fpga_mb_addr = addr
		if remap:
			fpga_mb_addr += remap_base_addr
		if read:    # path 3
			=> read fpga mailbox using fpga_mb_addr
		elif write: # path 4
			=> write fpga mailbox using fpga_mb_addr
			=> write caravel mailbox using addr (raise interrupt in caravel)

elif addr in range(0x3000_0000, 0x3FFF_FFFF): # caravel address space
	if caravel:
		=> NOP (handled by config_control)

	elif fpga:
		if read:    # path 5
			=> read caravel
		elif write: # path 6
			=> write caravel (no interrupt in caravel)
```
there are some factors to decide how the transaction being processed, as you can see in the if-elif branches, 
<br> first is the address received by s_axilite: the range of the addr belong to indicate the transaction is for mailbox or caravel address space (module in user_wrapper area). 
<br> second is which side this module located in **location register**: caravel or fpga, in fpga we have to consider if remap is enabled or not.
<br> third is read or write transaction: if read transaction is done locally. if write the transaction need to be send to other side for mailbox syncing.

1. caravel read/write mailbox at caravel side: (path 1 and path 2 in pseudo code)
<br>  a. the axilite transaction from config_control received by s_axilite at caravel side. the address is within the range of mailbox address space.
<br>  b. control_logic send this axilite transaction to caravel mailbox through m_axilite(mailbox).
<br>  c. if read, the data returned to config_control.
<br>  d. if write, caravel side control_logic also send this transaction to fpga mailbox through m_axis. m_axis convert this transaction to axis transaction. 
<br>  (i) when received by fpga side control_logic, the address and data are extracted in control_logic, if remap is enabled in **remap control register**, the remap_base_address will add to address, then this transaction send to fpga mailbox through m_axilite(mailbox).
<br>  (ii) if **interrupt control register** is enabled, will generate an interrupt at fpga side, tell software a transaction from caravel reached mailbox.

2. fpga/ps read/write mailbox at fpga side: (path 3 and path 4 in pseudo code)
<br>  a. the axilite transaction from fpga/ps received by s_axilite at fpga side. the address is within the range of mailbox address space.
<br>  b. control_logic will extract address and consider remap, then send this axilite transaction to fpga mailbox through m_axilite(mailbox).
<br>  c. if read, and read data returned, will send back to fpga/ps.
<br>  d. if write, fpga side control_logic also send this transaction (original address without remap) to caravel mailbox through m_axis. m_axis convert this transaction to axis transaction.
<br>  (i) when received by caravel side control_logic, this transaction will send to caravel mailbox through m_axilite(mailbox).
<br>  (ii) if **interrupt control register** is enabled, will generate an interrupt at caravel side, tell software a transaction from fpga reached mailbox.

3. fpga/ps read/write modules in caravel user_wrapper area: (path 5 and path 6 in pseudo code)
<br>  a. the axilite transaction from fpga/ps received by s_axilite at fpga side. the address is within the range of caravel address space outside mailbox address space.
<br>  b. control_logic will send this transaction to caravel config_control through m_axis. m_axis convert this transaction to axis transaction.
<br>  c. when received by caravel side control_logic, will send this transaction to config_control through m_axilite. no interrupt will be generated in this case.

## Feature Lists
1. convert axilite transaction to [modified axis transaction](https://github.com/bol-edu/fsic-spec-dev/blob/main/modules/FSIC-AXIS%20interface%20specification.md), and convert axis back to axilite.
2. syncing mailbox in caravel and fpga, can generate interrupt with status if mailbox is written by transaction from other side.
3. maintain the access of modules in caravel user_wrapper from fpga/ps.
4. in case of the mailbox base address in address map may change at fpga side, this module implements **remap control register / remap addr register** for software configuration.

## Interface Signals
### common signal
| Port | in/out | Description |
|:------:|:------:|:------------ |
| axi_aclk | in | axi clock | 
| axi_areset_n | in | axi reset active low | 
| **cc_aa_enable** | in | config control enable axilite to axis module | 

### caravel side axilite master
| Port | in/out | Description |
|:------:|:------:|:------------ |
| axi_awvalid | out | axi write address valid | 
| axi_awaddr[31:0] | out | axi write address | 
| axi_wvalid | out | axi write data valid | 
| axi_wdata[31:0] | out | axi write data | 
| axi_wstrb[3:0] | out | axi write data strobe | 
| axi_arvalid | out | axi read address valid | 
| axi_araddr[31:0] | out | axi read address | 
| axi_rready | out | axi read data ready | 
| axi_rdata[31:0] | in | axi read data | 
| axi_awready | in | axi write address ready | 
| axi_wready | in | axi write data ready | 
| axi_arready | in | axi read address ready | 
| axi_rvalid | in | axi read data valid | 

### axilite slave
| Port | in/out | Description |
|:------:|:------:|:------------ |
| axi_awready | out | refer to above description | 
| axi_wready | out | refer to above description | 
| axi_arready | out | refer to above description | 
| axi_rvalid | out | refer to above description | 
| axi_rdata[31:0] | out | refer to above description | 
| axi_awvalid | in | refer to above description | 
| axi_awaddr[31:0] | in | refer to above description | 
| axi_wvalid | in | refer to above description | 
| axi_wdata[31:0] | in | refer to above description | 
| axi_wstrb[3:0] | in | refer to above description | 
| axi_arvalid | in | refer to above description | 
| axi_araddr[31:0] | in | refer to above description | 
| axi_rready | in | refer to above description | 

### axis master
| Port | in/out | Description |
|:------:|:------:|:------------ |
| axis_tvalid | out | axis valid | 
| axis_tad[31:0] | out | axis address / data | 
| axis_tstrb[3:0] | out | axis strobe | 
| axis_tkeep[3:0] | out | axis keep | 
| axis_tlast | out | axis last | 
| axis_tid[1:0] | out | axis source id | 
| axis_tuser[1:0] | out | axis user signal | 
| axis_tready | in | axis ready | 

### axis slave
| Port | in/out | Description |
|:------:|:------:|:------------ |
| axis_tready | out | refer to above description | 
| axis_tad[31:0] | in | refer to above description | 
| axis_tstrb[3:0] | in | refer to above description | 
| axis_tkeep[3:0] | in | refer to above description | 
| axis_tlast | in | refer to above description | 
| axis_tid[1:0] | in | refer to above description | 
| axis_tvalid | in | refer to above description | 
| axis_tuser[1:0] | in | refer to above description | 

### axilite master (for mailbox)
| Port | in/out | Description |
|:------:|:------:|:------------ |
| axi_awvalid | out | refer to above description | 
| axi_awaddr[11:0] | out | refer to above description | 
| axi_wvalid | out | refer to above description | 
| axi_wdata[31:0] | out | refer to above description | 
| axi_wstrb[3:0] | out | refer to above description | 
| axi_arvalid | out | refer to above description | 
| axi_araddr[11:0] | out | refer to above description | 
| axi_rready | out | refer to above description | 
| axi_rdata[31:0] | in | refer to above description | 
| axi_awready | in | refer to above description | 
| axi_wready | in | refer to above description | 
| axi_arready | in | refer to above description | 
| axi_rvalid | in | refer to above description | 

fpga side interface signal is like caravel side, but
1. axilite master is the gray out block in interface block figure, with clock signal gated. because we do not need a axilite master send request to fpga/ps.
2. the **cc_aa_enable** in tied to 1'b1 in fpga top level.

please note we only implement a subset of axi4 lite / axi4 stream signals
1. response channel in axi4 lite is not implemented, including write / read response, thus the axilite write transaction is treated as completed without waiting.
2. protection signals awprot, arprot in axi4 lite are not implemented.
3. tkeep, tstrb, tdest in axi4 stream are not implemented, we will drive the bus with default value defined in axi4 stream spec.

## Register Description

### location register : ***???***
|RegisterName|Offset Address| Description |
|:----------:|:------------:| :-----------|
| location_is | 'h0 | where this module located.<br>1'b0 (default): caravel <br>1'b1: fpga |

note: because the reset default value is 1'b0 (caravel) on both side axilite_axis, it's important to make sure software correctly configure this register after system boot up.

### remap control register : ***???***
|RegisterName|Offset Address| Description |
|:----------:|:------------:| :-----------|
| remap_enable | 'h0 | enable remap at fpga side, this module will send address plus base address offset in **remap addr register** <br>1'b0: (default) remap disabled<br>1'b1: remap enabled | 

### remap addr register : ***???***
|RegisterName|Offset Address| Description |
|:----------:|:------------:| :-----------|
| remap_base_addr | 'h0 | base address for address map at fpga side. 32'h0: (default) | 

### interrupt control register : ***???***
|RegisterName|Offset Address| Description |
|:----------:|:------------:| :-----------|
| interrupt_enable | 'h0 | enable interrupt if write transaction from other side send to mailbox <br>1'b0: (default) disabled<br>1'b1: interrupt enabled | 

### interrupt status register : ***???***
|RegisterName|Offset Address| Description |
|:----------:|:------------:| :-----------|
| mb_wr | 'h0 | (write one clear) mailbox is written by the transaction from other side. <br>1'b0 (default): no other side write transaction <br>1'b1: mailbox is written | 


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


