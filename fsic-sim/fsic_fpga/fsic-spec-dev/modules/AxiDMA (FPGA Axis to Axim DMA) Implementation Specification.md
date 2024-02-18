# AxiDMA (FPGA Axis to Axim DMA) Implementation Specification
The AxiDMA is a reduced version of of the [Xilinx® LogiCORE™ IP AXI Direct Memory Access (AXI DMA) core](https://docs.xilinx.com/r/en-US/pg021_axi_dma/AXI-DMA-v7.1-LogiCORE-IP-Product-Guide). The AxiDMA provides high-bandwidth direct memory access between memory and AXI4-Stream target peripherals. 

#### AxiDMA Block Diagram
![001](https://github.com/bol-edu/fsic_fpga/assets/98332019/b931ec17-be2b-4d20-bd28-51e6d8ecba61)

**Note:** To ease early design integration, we can instantiate [Xilinx® LogiCORE™ IP AXI Direct Memory Access (AXI DMA) core](https://docs.xilinx.com/r/en-US/pg021_axi_dma/AXI-DMA-v7.1-LogiCORE-IP-Product-Guide).

## Interface Blocks
Block diagram shows its interconnected module

![002](https://github.com/bol-edu/fsic_fpga/assets/98332019/82b03c1a-0807-4a5b-9ce9-165d723f440e)



## Feature Lists
- AXI4 compliant
- Direct Register Mode (no scatter/gather support)
Transfers are commanded by setting a Source Address (for MM2S) or Destination Address (For S2MM) and then specifying a byte count in a length register.
- Support 4 Streams TID<1:0>, i.e. 4 sets of descriptor (00:user project, 01:Logic Analyzer, 10: Axilite, 11: Reserved)
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


|   Port   | in/out | Descriptiion                      | Width |
|:--------:|:------:|:----- |:----- |
|   clk    |   in   | clock |       |
|  rst_n   |   in   | reset is active low               |    1  |
|  mm2s_intr   |   out   |interrupt for MM2S            |    1  |
|  s2mm_intr   |   out   |interrupt for S2MM            |    1  |


AXI4 Lite Interface Signals
| Port | in/out | Desciption | Width |
| -------- | -------- | -------- |-----|
| axi_lite_awvalid  | in   |     |  1  |
| axi_lite_awready  | out  |     |  1   |
| axi_lite_awaddr  |  in |     |  32   |
| axi_lite_awprot  |  in |     |  3   |
| axi_lite_wvalid  |  in |     |  1   |
| axi_lite_wready  | out   |     |  1   |
| axi_lite_wdata   | in  |     |  32   |
| axi_lite_wstrb   | in  |     |   4  |
| axi_lite_bvalid  | out   |     |  1   |
| axi_lite_bready  | in  |     |   1  |
| axi_lite_bresp   | out  |     |  2   |
| axi_lite_arvalid | in   |     |   1  |
| axi_lite_aready  | out  |     |   1  |
| axi_lite_araddr  | in  |     |  32   |
| axi_lite_arprot  | in  |     |  3   |
| axi_lite_rvalid  | out  |     |    1 |
| axi_lite_rready  | in  |     |   1  |
| axi_lite_rdata   | out   |     |    32 |
| axi_lite_rresp   | out   |     |    2 |

MM2S Read Master Interface Signals
| Port | in/out | Desciption | Width |
| -------- | -------- | -------- |-----|
| m_axi_mm2s_arid | out   |      |   4   |
| m_axi_mm2s_araddr | out  |      |  32    |
| m_axi_mm2s_arlen |  out  |      |   8   |
| m_axi_mm2s_arsize | out   |      |  3    |
| m_axi_mm2s_arburst | out  |      |  2    |
| m_axi_mm2s_arvalid| out   |      |  1    |
| m_axi_mm2s_arready | in   |      |  1    |
| m_axi_mm2s_arlock | out   |      |  2    |
| m_axi_mm2s_arcache| out   |      |  4    |
| m_axi_mm2s_arprot | out   |      |  3    |
| m_axi_mm2s_rid |   in |      |   4   |
| m_axi_mm2s_rdata | in   |      |   64   |
| m_axi_mm2s_rresp | in   |      |   2   |
| m_axi_mm2s_rlast | in   |      |   1   |
| m_axi_mm2s_rvalid | in   |      |   1   |
| m_axi_mm2s_rready | out   |      |   1   |

MM2S Master Stream Interface Signals
| Port | in/out | Desciption | Width |
| -------- | -------- | -------- |-----|
| m_axis_mm2s_tvalid |  out  |      |   1   |
| m_axis_mm2s_tready |  in  |      |   1   |
| m_axis_mm2s_tdata |  out |      |   32  |
| m_axis_mm2s_tstrb |  out   |      | 4     |
| m_axis_mm2s_tkeep |  out   |      | 4     |
| m_axis_mm2s_tlast |  out  |      |  1    |
| m_axis_mm2s_tid   |  out   |      | 2    |
| m_axis_mm2s_tuser |  out   |      | 2     |

S2MM Write Master Interface Signals
| Port | in/out | Desciption | Width |
| -------- | -------- | -------- |-----|
| m_axi_s2mm_awid     | out     |   | 4 |
| m_axi_s2mm_awaddr   | out     |   | 32|
| m_axi_s2mm_awlen    | out     | Up to 256 beats for incrementing  | 8|
| m_axi_s2mm_awsize  | out    |   |3 |
| m_axi_s2mm_awburst | out     |   | 2 |
| m_axi_s2mm_awvalid | out    |   | 1 |
| m_axi_s2mm_awready | in     |   | 1 |
| m_axi_s2mm_awlock  | out    |   | 2 |
| m_axi_s2mm_awcach  | out    |   | 4|
| m_axi_s2mm_awprot  | out    |   | 3 |
| m_axi_s2mm_wid    | out    |   | 4 |
| m_axi_s2mm_wdata  | out    |   | 64 |
| m_axi_s2mm_wstrb  | out    |   | 8 |
| m_axi_s2mm_wlast  | out    |   | 1 |
| m_axi_s2mm_wvalid | out    |   | 1 |
| m_axi_s2mm_wready | in     |   | 1 |
| m_axi_s2mm_bid    | in     |   | 4 |
| m_axi_s2mm_bresp  | in     |   | 2 |
| m_axi_s2mm_bvalid | in     |   | 1 |
| m_axi_s2mm_bready | out    |   | 1 |

S2MM Slave Stream Interface Signals
| Port | in/out | Desciption | Width |
| -------- | -------- | -------- |-----|
| s_axis_s2mm_tvalid |   in |      |   1   |
| s_axis_s2mm_tready |   out |      |  1    |
| s_axis_s2mm_tdata |  in |      |     32 |
| s_axis_s2mm_tstrb |  in  |      |     4 |
| s_axis_s2mm_tkeep |  in  |      |    4  |
| s_axis_s2mm_tlast |  in  |      |    1  |
| s_axis_s2mm_tid |  in  |      |    2  |
| s_axis_s2mm_tuser | in   |      |  2    |

## Register Description
A table shows register definitions
### Register Group Name : Based Address
|RegisterName|Offset Address| Description |
|:----------:|:------------:| :-----------|
|MM2S_DMACR     |'h0             |MM2S DMA Control register<br>bit 0 RS: 0=Stop -DMA stop  For direct register mode pending transfers are flushed or completed. AXI4 stream are potentially terminated. This bit is cleared by AXI DMA hardware when error occurs. The CPU can also choose to clear this bit to stop DMA opearations. 1=Run - Start DMA operations. The halted bit in the DMA Status registers deasserts to 0 when DMA engine begin operations. <br>bit 1 Reset : Reset Soft reset for resetting the AXI DMA core. 0 = Normal operation. 1= Reset in progresss. <br> bit 2 IrqEn : IrqEn Interrupt on Complete Interrupt Enable. When to set to 1, allows DMASR.Irq to generate an interrupt. |
|MM2S_DMASR      | 'h4          | MM2S DMA Status register<br>bit 0 Halted: Halted DMA Channel Halted. 0= DMA channel running. 1= DMAchannel halted. <br>bit 1 Idle : DMA Channel Idle. To indicate the current transfer has finished. 0= Not idle. 1= Idle <br> bit 2 IOC_Irq : Interrupt on Complete. To indicate an interrupt event is generated on completion of a transfer. 0= No Interrupt. 1= Interrupt is generated.|
|MM2S_SA      | 'h8          | MM2S_SA register<br> Indicates the source address in DDR for AXI DMA read transfer.|
|MM2S_LENGTH     | 'hC          | MM2S Transfer Length register <br>Indicates the number of bytes to transfer on MM2S read channel. 2^(Length) is the actual transfer length.|
|S2MM_DMACR      | 'h10          | S2MM DMA Control register<br>bit 0 RS:Run/Stop to control running and stopping DMA. 0= Stop DMA, 1= Run DMA. <br>bit 1 Reset: 0=Normal operation. 1= Reset in progess.<br> bit 2 Err_IrqEn: Interrupt on Error Interrupt Enable. When the ring buffer occurs overflow, the write engine will generate an interrupt. 0= Error Interrup disabled. 1= Error Interrupt enable. |
|S2MM_DMASR      | 'h14          | S2MM DMA Status register<br>bit 0 Halted: DMA Channel Halted. 0= DMA channel running. 1= DMA channel halted. <br>bit 1 Idle: DMA Channel Idle 0= Not idle, 1= Idle <br>bit 2 IRQ : Error Interrupt. 0 = No Error Interrupt, 1= Error Interrupt generated.|
|S2MM_DA      | 'h18          | S2MM Destination Address<br>To indicate the destination address for S2MM write channel.|
|S2MM_LENGTH      | 'h1C         | S2MM Buffer Length(Bytes)<br> To indicate that the DDR space that S2MM write master can use. If write pointer will exceed the end of the ring buffer, then the write pointer wraps the ring buffer around and returns to the start address specified in the S2MM_DA register. |
|Write Address   | 'h20   |   Rinbg buffer Write Address<br> To indicates the location that S2MM write master currently writes to in the ring buffer. It is updated by S2MM write master.|
|Read Address | 'h24 | Ring buffer Read Address <br> To indicates the location that CPU currently reads in the ring buffer. It is only updated by the CPU. |
 
## Function Description

### Function 1:
Description of the function 1, including 
- block diagram
- ![003](https://github.com/bol-edu/fsic_fpga/assets/98332019/40947ae9-e3d1-4fb7-bafa-bd3bf81051e8)
- read data flow (downstream):
   When Read fifo has a space size of read burst length, then MM2S Read Master can assert valid in the address channel to initiate a AXI read transaction. When Read FIFO stores the data byte number of burst legth, AXIS Master can assert valid and start to read out data from Read FIFO to initiates a burst write to AXIS Switch.
- Write data flow (upstream): When AXIS Switch assert valid to initiates a axis burst write transaction to write data byte number of burst length to AXIS Slave Stream, after Write FIFO stores the data byte number of the burst length, S2MM Write Master will assert valid to initiate a AXI write data transaction.
- Control flow
- Logic structure
- Read fifo will use a size 256x2x64 bits two port sram for AXI read with burst length of 256. Write fifo also use the smae size as Read fifo.<br><br>
![004](https://github.com/bol-edu/fsic_fpga/assets/98332019/a5dfa834-b4ff-4d8f-bc06-245f6962b1e9)

## Programming Guide
- Code illustration to control the function

## Future Work

## Reference
[Xilinx® LogiCORE™ IP AXI Direct Memory Access (AXI DMA) core](https://docs.xilinx.com/r/en-US/pg021_axi_dma/AXI-DMA-v7.1-LogiCORE-IP-Product-Guide)


