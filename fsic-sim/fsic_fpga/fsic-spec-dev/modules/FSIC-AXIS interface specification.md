# FSIC-AXIS interface specification
This is an extensition of Axis specification to include FSIC architecture specific function, inclduing
1. Axilite configuration transaction (Axilite Overload)
2. Data payload for Axis transaction

#### Axilite configuration transaction (Axilite Overload)
Axilite configuration transaction can be Downstream/Upstream.
- Remote host access downstream to axilite register in FSIC( user logic, mail box, etc) via IO_Serdes.
- master in FSIC (mail box) access upstream to axilite register in remote host( mail box) via IO_Serdes.

#### Data payload for Axis transaction
- Downstream Data payload is from axis master in remote host to user logic(axis slave) of FSIC.
- Upstream Data payload is from axis master(user logic, Logic Analyzer) of FSIC output data to axis slave in remote host.

#### Transaction Table - TUSER<1:0> Definitiion
TUSER is used to distinguish different transaction types.

| TUSER<1:0>| # of T| Transaction Type |
|:---------:|:-----:|:----------------|
| 00        |    n     | Data payload for axis transaction. Limitation: all User pojects Data payload in asix MUST <= Max_axis_Data_payload(=32)    |
| 01        | 2     | Axilite write transaction Address + Data. TAD 1^st^ T is the Byte-enable + address, i.e. {BE[3:0],ADDR[27:0]}, 2^nd^ T is the Data[31:0]. Note: Axilite write transaction only support 1T in data phase. |
| 10        | 1     | Axilite read Command (Address Phase). TAD<31:0> is the address ADDR[31:0] |
| 11        | 1     | Axilite read Completion (Data Phase). TAD<31:0> is the return data DATA[31:0]. Note: 1. Axilite read transaction only support 1T in data phase(Axilite read Completion). 2. If Axilite read Command is Upstream then the Axilite read Completion is Downstream, and vice versa.|


Axilite read transaction is split into address phase(Axilite read Command) and data phase(Axilite read Completion) issued by axilite master.

Axis switch is allow to issue axis and axilite transaction base on the request and no need to check the order rule in Note 1. the axilist master MUST garrentee the order rule in Note 1.


Note 1: The axilite master issue Axilite read Command MUST wait for the Axilite read Completion to finish the Axilite read transaction then allow to issue next Axilite read Command. It is allow to issue Axilite write transaction for the same master when Axilite read Completion not ready.


Note 2: axilite master issue Axilite write transaction is posted. for example: ARM cpu core in remote host can issue next Axilite read/write transaction without wait for the last Axilite write transaction actually completed in the traget.

Note 3: caravel_soc write axilite register in Mailbox also generate Axilite write transaction to remote host. caravel_soc read axilite register in Mailbox is completed locally and do not generate Axilite read transaction to remote host.


## Routing 

### use TID only
Axis_Switch use Upstream/Downstream and TID to decide the Source & Destination Module.

| DIR | TID<1:0> | Source Module | Destination Module |
|:--------:|:--------:|:--------|:--------|
|Down| 00       | User DMA (M_AXIS_MM2S) in remote host (optional include extended user project)      |User Project - the current active user project in Caravel.|
|Down| 01       | Axilite Master (R/W) in remote host (include Mail box write)        |Axis-Axilite (include Mail box) in Caravel       |
|Down| 1x      | Reserved |Reserved |
|Up| 00      | User Project - the current active user project in Caravel.|User DMA (S_AXIS_S2MM) in remote host (optional include extended user project)|
|Up| 01       | Axis-Axilite (for Mail box) in Caravel       |Axilite slave in remote host ( for mail box write)|
|Up| 10      | Logic Analyzer in Caravel |Logic Analyzer data receiver - DMA (S_AXIS_S2MM) in remote host|
|Up| 11       | Reserved        |Reserved        |



TODO: sync with master defined in [Axis_Switch Implementation Specification](https://github.com/bol-edu/fsic-spec-dev/blob/main/modules/Axis_Switch%20Implementation%20Specification.md)


## Interface Blocks
Block diagram shows its interconnected module
NA

## Feature Lists
List of functions and features
NA

## Interface Signals
Refer to [AMBA 4 AXI4-Stream Protocol Specification](https://developer.arm.com/documentation/ihi0051/a/).

The following in/out is defined from the master (producer) side.

| Port | in/out | Descriptiion |
|:------:|:------:|:------------ |
|  clk   |   in   | clock        |
| rst_n |   in   | reset is active low        |
|TVALID | out | TVALID indicates that the master is driving a valid transfer.A transfer takes place when both TVALID and TREADY areasserted. |
|TREADY | in | TREADY indicates that the slave can accept a transfer in the current cycle. |
|TSTRB  | out | TLAST indicates the boundary of a packet|
|TKEEP  | out | TLAST indicates the boundary of a packet|
|TLAST  | out | TLAST indicates the boundary of a packet|
| TID<1:0> | out | TID is the data stream identifier.|
|TUSER<1:0> | out | TUSER indicates the transaction type that is transferred along with the data|
| TAD<31:0> | out | TAD is the Address/Data bus Its definition is defined in transaction table |


## Register Description
A table shows register definitions
NA
### Register Group Name : Based Address

NA

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

## Limitation
- issue: IO serdes Rx get corrupt data
    - Do not support error recovery when received corrupt data in Rx.


## Future Work
- error reporting
    - add parity check in IO Serdes for error reporting and report the error status in axilite register parity_error_detected.
    - remote host (FPGA) need implement a timeout mechanism for axilite read completion to avoid system hang.
    - implement a parity_error_interrupt_enable bit for generate interrrupt.



