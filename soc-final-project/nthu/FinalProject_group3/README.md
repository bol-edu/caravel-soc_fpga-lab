# SOC Lab Final Project - WLOS Optimization

---

Contributers: 陳冠晰、劉祐瑋、王彥智、陳昇達、陳柏翰

## Computation System Overview

In this final project, we designed Arbitrary, DMA, SDRAM, and hardware accelerators based on the foundations of Lab 4 and Lab 6, aiming to improve upon previous results. The hardware accelerator section includes three modules: Fir, Matrix Multiplication, and Qsort. Fir was previously used in Lab 3 and Lab 4. We utilize three DMAs to facilitate data transfer for these modules, and the sequencing of data between them is controlled by the Arbitrary module, which assigns weights.

For storing instructions and data sets, we employ SDRAM, allowing the hardware to handle data transfer without relying on the CPU, thereby reducing cycles. Further enhancements include Prefetch design, enabling the retrieval of more data within a 3T latency, ultimately reducing the time spent fetching data.

![image](https://hackmd.io/_uploads/rJ4f2cMFT.png)


---

## Firmware
First, modify the section.ids to relocate the data that needs to be computed to SDRAM.

 ![螢幕擷取畫面 2024-01-16 212642](https://hackmd.io/_uploads/Hyy4E-4tT.png) ![螢幕擷取畫面 2024-01-16 212631](https://hackmd.io/_uploads/HJImV-4Kp.png)

Our firmware in this final project primarily serves to configure data addresses and confirm the completion of all computations. A, B, and C represent the positions used for matrix multiplication, while X and Y denote the positions used for FIR. Q represents the position used for qsort.

![image](https://hackmd.io/_uploads/BJavg5MFT.png)

![image](https://hackmd.io/_uploads/HkFsxcMYp.png)

![image](https://hackmd.io/_uploads/ByEbZcfFa.png)

Since these three computations are performed simultaneously, we determined from the waveform that FIR is the slowest operation. Therefore, we set it up to return to AB51 when we receive the final data from FIR. This approach also allows us to confirm that our computed values are indeed written to the designated positions in SDRAM.

![image](https://hackmd.io/_uploads/S1LSb9MYa.png)

---

## Hardware Accelerator

In Lab 6, we utilized firmware code to run FIR, matrix multiplication (mm), and quicksort (qs) on the Carvel SoC. However, the CPU computation time was excessively long, prompting us to seek faster calculation speeds through the use of hardware acceleration.

### FIR & DMA

![image](https://hackmd.io/_uploads/SkBFPZVF6.png)

The design of FIR follows the architecture used in Lab 3 and Lab 4, with the addition of a Y_buffer to allow DMA to receive computed data. When FIR completes its calculation, it sends data to the Y_buffer and sends a signal indicating it is full, allowing DMA to receive the data. At the same time, it waits for DMA to send new X data.

![image](https://hackmd.io/_uploads/HJ2skYGF6.png)

The functionality of DMA_fir encompasses the decoder from Lab 4 and the DMA itself, operating around four states: RESET, IDLE, X_addr, and Y_addr.

Initially, in the IDLE state, if X_FF is found to be empty (~x_FF_full), the system transitions to the X_addr state, awaiting data from the arb. It returns to IDLE when dma_ack_o is asserted. On the other hand, if X_FF is full and y_FF is also full (y_FF_full), it enters the Y_addr state, waiting for the arb to retrieve data. It returns to IDLE when dma_ack_o is asserted.

![image](https://hackmd.io/_uploads/ryzRUtGKT.png)


### Matrix Multiplication

The datapath for the Matrix Multiplication (MM) is designed as shown in the diagram. We utilize shift registers to design A_Ram and B_Ram, aligning them with the subsequent multiplication steps. We also adopt a pipeline design, enabling the calculation of all data within 16 cycles.

![image](https://hackmd.io/_uploads/ByvbsKGFT.png)



### Q Sort

We use the method of insertion sorting, employing ten comparators to find the index that determines the position for insertion.

![image](https://hackmd.io/_uploads/HkPL1qzKT.png) ![image](https://hackmd.io/_uploads/r1zMyqMt6.png)

### Arbitrary

There is a priority-based arbiter in place.

![image](https://hackmd.io/_uploads/rkqmkMEK6.png)



---


## SDRAM with SDRAM Controller

### Original Block Diagram

- The overall diagram of SDRAM are shown below:
![螢幕擷取畫面 2024-01-16 211732](https://hackmd.io/_uploads/SyJbM-Vta.png)

- The wishbone cycle will pass through SDRAM controller and store/write data from/into SDRAM. We have do some optimize since the memory size of the original source code of SDRAM is not enough.

#### FSM in SDRAM controller:

![螢幕擷取畫面 2024-01-16 215237](https://hackmd.io/_uploads/ryYVcWNFp.png)

- Some details about each state:

![螢幕擷取畫面 2024-01-16 215401](https://hackmd.io/_uploads/H1s5c-4YT.png)

- **tCASL=3T tPRE=3T tACT=3T tREF=7T**

#### In SDRAM:

![螢幕擷取畫面 2024-01-16 215526](https://hackmd.io/_uploads/S19Acb4Fp.png)

- We decode the command sent from controller and mode register defined by user.

![螢幕擷取畫面 2024-01-16 215632](https://hackmd.io/_uploads/HJkmi-VKp.png)

- Read/write enable and address/data input/output

![螢幕擷取畫面 2024-01-16 221328](https://hackmd.io/_uploads/rJrSyMVYp.png)

- Command pipelined

![螢幕擷取畫面 2024-01-16 221527](https://hackmd.io/_uploads/HkAF1f4tp.png)

- MUX select the operation at current state.
- MUX detect read/write command.


**We may be curious about the meaning of `Active` state and `Precharge` state. Here we have a brief explanation about SDRAM:**

1. Dynamic Storage:
    *SDRAM stores data in cells that use capacitors to hold charges. SDRAM cells lose their charge over time due to leakage. To maintain the stored data, SDRAM needs to periodically refresh the charges in the cells.*
3. Row Activation:
    *Activating a row in SDRAM involves loading the contents of that row into a row buffer for read/write operations, which allows for faster access to the data in the row.*
5. Precharge Operation:
    *After accessing a row, it needs to be precharged to restore the charge in the cells. This is essential for the proper functioning of the memory and to prepare it for the activation of others rows.*


### Problems/Solved about Original code:

#### Problem 1 - Address Mapping

``` verilog=
`define BA 9:8
`define RA 22:10
`define CA 7:0
```
- We may encounter a situation that all data are stored in the same bank since our linker was designed as shown below:

![螢幕擷取畫面 2024-01-16 212631](https://hackmd.io/_uploads/HJImV-4Kp.png)

![螢幕擷取畫面 2024-01-16 212642](https://hackmd.io/_uploads/Hyy4E-4tT.png)

- Each data type needs at least 12-bit,but SDRAM only takes 8-bit for column address, and bank_address[9:8] will restrict our size.

#### Problem 2 - Address send into SDRAM

- In SDRAM, we have 4 banks to store data, source code are shown below:

``` verilog=
blkRam$(.SIZE(mem_sizes), .BIT_WIDTH(DQ_BITS))
Bank0(
    .clk(Sys_clk),
    .we(bwen[0]),
    .re(bren[0]),
    .waddr(Col_brst[9:0]),
    .raddr(Col_brst[9:0]),
    .d(bdi[0]),
    .q(bqd[0])
);
```

- Only 10-bit for column address

``` verilog=
READ: begin
    cmd_d = CMD_READ;
    a_d = {2'b0, 1'b0, addr_q[7:0], 2'b0};
    state_d = WAIT;
end
```

- Since the address of assembly code plus 4 each time, we may not need to add the 2’b0 at the LSB. 

=> **Original memory size: 2^10(width)/4(shift left) * 4(banks) = 1K bytes**

#### Solution

- My design (remapping)
``` verilog=
`define Ba 13:12
`define Ra 22:14
`define CA 11:0
```
- Then we can get 12 bits for column address.

- I also remap the `a_d` since `a_d[10]`is the precharge signal. Note that `BA` is 13:12.

``` verilog=
READ: begin
    cmd_d   = CMD_READ;
    a_d     = {addr_q[11:10], 1'b0, addr_q[9:0]};
    ba_d    = addr_q[9:8];
    state_d = WAIT;
end
```

- When read:

``` verilog=
If (Read_enable) begin
    Bank     <= Ba;
    Col      <= {Addr[12:11], Addr[9:0]};
    Col_brst <= {Addr[12:11], Addr[9:0]};
end
```

- Decode the remapping address, prevent the `addr[10]` (precharge bit) load into block memory.

- Now, address load into memory have 12 bits:

``` verilog=
blkRam$(.SIZE(mem_sizes), .BIT_WIDTH(DQ_BITS))
Bank0(
    .clk(Sys_clk),
    .we(bwen[0]),
    .re(bren[0]),
    .waddr(Col_brst[11:0]),
    .raddr(Col_brst[11:0]),
    .d(bdi[0]),
    .q(bqd[0])
);
```

- Also, seems that the block memory in the source code don't have the row address, it may not support the on/off page characteristic.

=> **Memory size: 2^12(width) * 4 = 16K bytes**

---

## Optimization

We already know that, under the condition of latency = 1T and smooth data reading, the time required for the three hardware components is as follows: 

- 64x11=704 (fir), 
- 10x2+10+10x2=50 (qsort), 
- 32x2+16+16=96 (mm). 

Therefore, our optimization target should be based on this longest cycle.

Firstly, for the first part, our design is as follows:

![image](https://hackmd.io/_uploads/rJ4f2cMFT.png)

We measured the time required for fir, qsort, and mm separately, and the results are as follows:
fir (1471 cycles)

![image](https://hackmd.io/_uploads/HyuYOZVFp.png)

mm (756 cycles)

![image](https://hackmd.io/_uploads/SJd4_-EtT.png)

qsort (315 cycles)

![image](https://hackmd.io/_uploads/rJgYu-NKT.png)


However, due to the functionality of the arbiter, concurrent execution is possible! 

Therefore, the actual time required to complete all three is (1570):

![image](https://hackmd.io/_uploads/Hkm2K-EY6.png)


waveform:

![image](https://hackmd.io/_uploads/rJns1GVtT.png)

![image](https://hackmd.io/_uploads/ryx1ezNF6.png)

![image](https://hackmd.io/_uploads/B1rWlGNKp.png)

From the above, we can infer that SDRAM read operations take at least 7 cycles to receive an acknowledgment. Therefore, for further optimization, we need to design SDRAM with burst functionality and integrate prefetching.

---

## SDRAM with Prefetch Buffer

### Design Consideration

- Here we may want to prefetch data for faster reading access since SDRAM have the 3T delay for CAS latency when reading.


### Block Diagram

![螢幕擷取畫面 2024-01-17 235311](https://github.com/vic9112/SOC/assets/137171415/580de566-589b-4012-b0d4-634e2cbb7fac)

### Prefetch Buffer:

![螢幕擷取畫面 2024-01-16 223444](https://hackmd.io/_uploads/SJrGEMNt6.png)

- We have 3 prefetch buffers (FIR/MM/QS), here I use FIR buffer to explan our idea.

Our prefetch buffer acts like shift registers, it shift out the stored data when the read access came. It prefetch data untill all buffers are filled up before our workload start. If the buffer is empty, controller will send a `Empty` signal to tell the **arbiter** to let the priority of that buffer to be the last since the status of that buffer is `busy`, it is being filled up.


### Prefetch Controller:

![螢幕擷取畫面 2024-01-16 223725](https://hackmd.io/_uploads/Hyn3NM4K6.png)

Above figure shows our design about prefetch controller.

--- Setup
- When setup(before all buffers are FULL), data will store in SDRAM first.
- After we got the initial address(sent by DMA) => start prefetch.
- Fill the data until it buffer length, then set the state of that buffer to 'FULL'.
- After all prefetch buffer is 'FULL', call ap_start.

--- Running
- If input address meet the saving address => HIT
- If HIT, terminate the wishbone read request by sending the ACK immediately.
- If the buffer is Empty, start prefetch the data from SDRAM into buffer.

### SDRAM burst

- Since our prefetch buffer have the length of 8, if we can achieve the burst length of 8, it can fill up the empty buffer rapidly.






#### burst result

![image](https://hackmd.io/_uploads/HJCdOGNKa.png)

![image](https://hackmd.io/_uploads/HyD1tzVKT.png)

![image](https://hackmd.io/_uploads/H1SIFGEFa.png)

![image](https://hackmd.io/_uploads/B12gcMVYT.png)


---

## Uart with I/O FIFO
### Design for Optimization
Original UART implementation flow vs.  UART with FIFO
![image](https://hackmd.io/_uploads/H1Hxw0GKa.png =40%x) to![image](https://hackmd.io/_uploads/BkoqPAzFp.png =50%x)
With FIFO, we can lower the number of interrupt to make the execution faster since we can first keep the data sent in the buffer and wait until the buffer is full, then we send the data all at once.
### How to implement into original design
![image](https://hackmd.io/_uploads/ByImR14Y6.png)
Signals in FIFO
![IMG_1852](https://hackmd.io/_uploads/S1B6YbNt6.jpg)
![JPEG影像-4094-965B-FD-0](https://hackmd.io/_uploads/SJCedWNY6.jpg) 


#### Simulation
In simulation we only sent 8 data.

**Without FIFO**
![IMG_1847](https://hackmd.io/_uploads/BJrDyxNK6.jpg)
Latnecy=8397900ns

**FIFO with depth 4**
![IMG_1849](https://hackmd.io/_uploads/S1EEegEFp.jpg)
Latnecy=1966020ns


### **FPGA**
In FPGA, we sent 512 data.
**Without FIFO**
![IMG_1850](https://hackmd.io/_uploads/SJdWkgVta.jpg)
Latency = 2.68s
**FIFO with depth 4**
![IMG_1848](https://hackmd.io/_uploads/B19y1lEFa.jpg)
Latency = 2.17s
#### Performance
|       | Latency(cycle * period) | Metric(ms) | Improvement |
|:-----:|:--------:|:-------------------------:|:-------------------------:|
|  Without FIFO       |  114582 * 25ns   |          44.78           |  *  |
|  FIFO depth 4       |  54076  * 25ns   |          10.48           |4.27x|



---

## Performance Summary

|       | Software(cycles) | Hardware without prefetch(cycles) | Hardware with prefetch (cycles)  |
|:-----:|:--------:|:-------------------------:|:-------------------------: |
|  MM   |  55303   |            756            |    X(no test)                       |
|  FIR  |  65890   |            1471           |  X(no test)                       |
|  QS   |  14394   |            315            |     X(no test)
Total| 135587|1570|801

---

## Problem & Solution


