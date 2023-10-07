/**************************************************************************
*
*    File Name:  sdr.v  
*      Version:  2.2
*         Date:  October 12th, 2010
*        Model:  BUS Functional
*    Simulator:  Model Technology
*
* Dependencies:  None
*
*        Email:  modelsupport@micron.com
*      Company:  Micron Technology, Inc.
*
*  Description:  Micron SDRAM Verilog model
*
*   Limitation:  - Doesn't check for refresh timing
*
*         Note:  - Set simulator resolution to "ps" accuracy
*                - Set Debug = 0 to disable $display messages
*
*   Disclaimer:  THESE DESIGNS ARE PROVIDED "AS IS" WITH NO WARRANTY 
*                WHATSOEVER AND MICRON SPECIFICALLY DISCLAIMS ANY 
*                IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR
*                A PARTICULAR PURPOSE, OR AGAINST INFRINGEMENT.
*
*                Copyright ? 2001 Micron Semiconductor Products, Inc.
*                All rights researved
*
* Rev  Author          Date        Changes
* ---  --------------------------  ---------------------------------------
* 2.3  SH              05/12/2016  - Update tAC, tHZ timing
*      Micron Technology Inc.
*
* 2.2  SH              10/12/2010  - Combine all parts into sdr_parameters.vh
*      Micron Technology Inc.
*
* 2.1  SH              06/06/2002  - Typo in bank multiplex
*      Micron Technology Inc.
*
* 2.0  SH              04/30/2002  - Second release
*      Micron Technology Inc.
*
**************************************************************************/

// This is a synthesiable SDRAM design, interface signals includes
// 1. SDRAM interface - from sdr_controller
// 2. BRAM - Xilinx BRAM Interface 
// 


`timescale 1ns / 1ps

// Modification
// 1. 32-bit devices  DQ_BITS = 32, DM_BITS = 4
// 2. No timing check
// 3. Memory Bank Bank0-3 mapped to BRAM
//    - add BRAM interface control
//    - BRAM size 16KB, each Bank is 4KB, use address [15:14] to distinguish Bank
// 4. Dq (in/out) separate into
module sdr (
        // Dq separate into Dqi (input), Dqo (output)
        Dqi,
        Dqo,
        //Dq, //////////////////////////////////////////////////// remove Dq
        
        Addr, Ba, Clk, Cke, Cs_n, Ras_n, Cas_n, We_n, Dqm,  // sdr interface
        
        // Reset - active low
        Rst_n
        
        
        // BRAM Interface
        // BRAM Interface
        
        
        
        
        
        //BRAM_Addr,
        //BRAM_EN_A,
        //BRAM_WEN_A,
        //BRAM_Din_A,
        //BRAM_Dout_A
);
    
    // mem_sizes - 4 * 4K (Sub-bank)
    // address mapping scheme, need to reduce its size
    // Each Bank is 4KB (one BRAM) = 32bit * 1024
    // parameter mem_sizes = 2**(ROW_BITS+COL_BITS) - 1;
    parameter mem_sizes = 1024;
    
    // timing parameters  - in terms of # of tCK
    parameter tCK              =     6.0; // tCK    ns    Nominal Clock Cycle Time
    parameter tCK3_min         =     6.0; // tCK    ns    Nominal Clock Cycle Time
    parameter tCK2_min         =    10.0; // tCK    ns    Nominal Clock Cycle Time
    parameter tCK1_min         =    20.0; // tCK    ns    Nominal Clock Cycle Time
    parameter tAC3             =     5.4; // tAC3   ns    Access time from CLK (pos edge) CL = 3
    parameter tAC2             =     7.5; // tAC2   ns    Access time from CLK (pos edge) CL = 2
    parameter tAC1             =    17.0; // tAC1   ns    Parameter definition for compilation - CL = 1 illegal for sg75
    
    
    
    parameter tAC             =    5.4;
    
    
    
    parameter tHZ3             =     5.4; // tHZ3   ns    Data Out High Z time - CL = 3
    parameter tHZ2             =     7.5; // tHZ2   ns    Data Out High Z time - CL = 2
    parameter tHZ1             =    17.0; // tHZ1   ns    Parameter definition for compilation - CL = 1 illegal for sg75
    parameter tOH              =     3.0; // tOH    ns    Data Out Hold time
    parameter tMRD             =     2.0; // tMRD   tCK   Load Mode Register command cycle time (2 * tCK)
    parameter tRAS             =    42.0; // tRAS   ns    Active to Precharge command time
    parameter tRC              =    60.0; // tRC    ns    Active to Active/Auto Refresh command time
    parameter tRFC             =    60.0; // tRFC   ns    Refresh to Refresh Command interval time
    parameter tRCD             =    18.0; // tRCD   ns    Active to Read/Write command time
    parameter tRP              =    18.0; // tRP    ns    Precharge command period
    parameter tRRD             =     2.0; // tRRD   tCK   Active bank a to Active bank b command time (2 * tCK)
    parameter tWRa             =     6.0; // tWR    ns    Write recovery time (auto-precharge mode - must add 1 CLK)
    parameter tWRm             =    12.0; // tWR    ns    Write recovery time

    //localparam tRCD              = 3;    // 3T - active to read/write command time
    //localparam tRP               = 3;    // 3T - Precharge command period
    localparam tCL               = 3;    // 3T - CAS latency 
    //localparam tRC               = 10;   // 10T - Active to Active/Auto Referesh command time
    //localparam tRAS              = 7;    // 7T - Active to Precharge command time
    //localparam tRRD              = 2;    // Active bank to Active bank command time
    

    parameter ADDR_BITS         = 13;   // ROW address: 8K A[12:0], COL address [9:0] + A11 (Auto-precharge)
    parameter BA_BITS           = 2;    // 4 banks
    parameter DQ_BITS           = 32;   // 32-bit
    parameter DM_BITS           = 4;    // 4 bytes
    parameter COL_BITS          = 10;   // # of COL module sdr
    
    
    
    
    
    
    
    input                         Rst_n;          // Jiin new Reset low
    input                         Clk;
    input                         Cke;
    input                         Cs_n;
    input                         Ras_n;
    input                         Cas_n;
    input                         We_n;
    input     [ADDR_BITS - 1 : 0] Addr;
    input       [BA_BITS - 1 : 0] Ba;
    //inout       [DQ_BITS - 1 : 0] Dq; //////////////////////////////////////////////  remove Dq
    input       [DM_BITS - 1 : 0] Dqm;
    input       [DQ_BITS - 1 : 0] Dqi;
    output      [DQ_BITS - 1 : 0] Dqo;
    
    // BRAM Interface
    //output      [31:0]              BRAM_Addr;
    //output                          BRAM_EN;
    //output                      BRAM_WEN;
    //output      [DQ_BITS -1 : 0] BRAM_Din;
    //input       [DQ_BITS -1 : 0] BRAM_Dout;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

// Accesss Bank0-3 mapped to BRAM
    //reg         [DQ_BITS - 1 : 0] Bank0 [0 : mem_sizes];
    //reg         [DQ_BITS - 1 : 0] Bank1 [0 : mem_sizes];
    //reg         [DQ_BITS - 1 : 0] Bank2 [0 : mem_sizes];
    //reg         [DQ_BITS - 1 : 0] Bank3 [0 : mem_sizes];

    reg                   [1 : 0] Bank_addr [0 : 3];                // Bank Address Pipeline
    reg                   [1 : 0] Bank_temp;                        // Bank Address 
    reg                   [1 : 0] Bank_temp_buf;                        // Bank Address 
    reg        [COL_BITS - 1 : 0] Col_addr [0 : 3];                 // Column Address Pipeline
    reg                   [3 : 0] Command [0 : 3];                  // Command Operation Pipeline
    reg                   [1 : 0] Dqm_reg0, Dqm_reg1;               // DQM Operation Pipeline
    reg       [ADDR_BITS - 1 : 0] B0_row_addr, B1_row_addr, B2_row_addr, B3_row_addr;

    reg        [ADDR_BITS - 1: 0] Mode_reg;
    reg         [DQ_BITS - 1 : 0] Dq_reg, Dq_dqm;
    reg        [COL_BITS - 1 : 0] Col_temp, Burst_counter;

    reg                           Act_b0, Act_b1, Act_b2, Act_b3;   // Bank Activate
    reg                           Pc_b0, Pc_b1, Pc_b2, Pc_b3;       // Bank Precharge

    reg                   [1 : 0] Bank_precharge       [0 : 3];     // Precharge Command
    reg                           A10_precharge        [0 : 3];     // Addr[10] = 1 (All banks)
    reg                           Auto_precharge       [0 : 3];     // RW Auto Precharge (Bank)
    reg                           Read_precharge       [0 : 3];     // R  Auto Precharge
    reg                           Write_precharge      [0 : 3];     //  W Auto Precharge
    reg                           RW_interrupt_read    [0 : 3];     // RW Interrupt Read with Auto Precharge
    reg                           RW_interrupt_write   [0 : 3];     // RW Interrupt Write with Auto Precharge
    reg                   [1 : 0] RW_interrupt_bank;                // RW Interrupt Bank

// Do not support precharge
    integer                       RW_interrupt_counter [0 : 3];     // RW Interrupt Counter
    integer                       Count_precharge      [0 : 3];     // RW Auto Precharge Counter

    reg                           Data_in_enable;
    reg                           Data_out_enable;
    reg                           Data_out_enable_buf;
    reg                   [1 : 0] Bank, Prev_bank;
    reg       [ADDR_BITS - 1 : 0] Row;
    reg        [COL_BITS - 1 : 0] Col, Col_brst;

    // Internal system clock
    reg                           CkeZ;
    wire                       Sys_clk;

    // Commands Decode
    wire      Active_enable    = ~Cs_n & ~Ras_n &  Cas_n &  We_n;
    wire      Aref_enable      = ~Cs_n & ~Ras_n & ~Cas_n &  We_n;
    wire      Burst_term       = ~Cs_n &  Ras_n &  Cas_n & ~We_n;
    wire      Mode_reg_enable  = ~Cs_n & ~Ras_n & ~Cas_n & ~We_n;
    wire      Prech_enable     = ~Cs_n & ~Ras_n &  Cas_n & ~We_n;
    wire      Read_enable      = ~Cs_n &  Ras_n & ~Cas_n &  We_n;
    wire      Write_enable     = ~Cs_n &  Ras_n & ~Cas_n & ~We_n;

// Mode_reg Defition
// Mode_reg[2:0] = Burst Length = 3'b11 = 8, 3'b00 = 1
// Mode_reg[3] = Burst Type = 0 Sequential
// Mode_reg[6:4] = Cas_latency = 3  3'b011
// Mode_reg[8:7] = Operation Mode = 2'b00  Standard
// Mode_reg[9] = 0  read/write burst, 1 : write single
// Mode_reg[12:10] = reserved
// Mode_reg = 13'b000_0_00_011_0_011;
    // Burst Length Decode
    // Fixed at Burst_length_8, i.e. Mode_reg[2:0]= 3'b011
    wire      Burst_length_1   = ~Mode_reg[2] & ~Mode_reg[1] & ~Mode_reg[0];
    wire      Burst_length_2   = ~Mode_reg[2] & ~Mode_reg[1] &  Mode_reg[0];
    wire      Burst_length_4   = ~Mode_reg[2] &  Mode_reg[1] & ~Mode_reg[0];
    wire      Burst_length_8   = ~Mode_reg[2] &  Mode_reg[1] &  Mode_reg[0];
    wire      Burst_length_f   =  Mode_reg[2] &  Mode_reg[1] &  Mode_reg[0];

    // CAS Latency Decode
    // Fixed Cas_latency = 3;  i.e. Mode_reg[6:4] = 3'b011
    wire [2 : 0] Cas_latency   =  {Mode_reg[6],  Mode_reg[5],   Mode_reg[4]};

    // Write Burst Mode
    wire      Write_burst_mode = Mode_reg[9];

    wire      Debug            = 1'b1;                          // Debug messages : 1 = On
    wire      Dq_chk           = Sys_clk & Data_in_enable;      // Check setup/hold time for DQ
    
    // Dq separate Dqi, Dqo
    // assign    Dq               = Dq_reg;                        // DQ buffer
    wire    [DQ_BITS - 1 : 0]  Dqo;
    // assign      Dqo = Dq_reg;
    assign      Dqo = Dq_temp;
    wire    [DQ_BITS - 1 : 0]  Dq_temp;
    assign      Dq_temp = (Data_out_enable_buf) ? bdq[Bank_temp_buf] : 0;
    //assign      Dq  = Data_out_enable ? Dq_reg : Dqi;

    

    // Commands Operation
    `define   ACT       0
    `define   NOP       1
    `define   READ      2
    `define   WRITE     3
    `define   PRECH     4
    `define   A_REF     5
    `define   BST       6
    `define   LMR       7

// Remove timing check
/*
    // These timing dynamically adjust based on CAS Latency
    time  tAC, tHZ;

    // Timing Check variable
    time  MRD_chk;
    time  WR_chkm [0 : 3];
    time  RFC_chk, RRD_chk;
    time  RC_chk0, RC_chk1, RC_chk2, RC_chk3;
    time  RAS_chk0, RAS_chk1, RAS_chk2, RAS_chk3;
    time  RCD_chk0, RCD_chk1, RCD_chk2, RCD_chk3;
    time  RP_chk0, RP_chk1, RP_chk2, RP_chk3;

    initial begin
        Dq_reg = {DQ_BITS{1'bz}};
        Data_in_enable = 0; Data_out_enable = 0;
        Act_b0 = 1; Act_b1 = 1; Act_b2 = 1; Act_b3 = 1;
        Pc_b0 = 0; Pc_b1 = 0; Pc_b2 = 0; Pc_b3 = 0;
        WR_chkm[0] = 0; WR_chkm[1] = 0; WR_chkm[2] = 0; WR_chkm[3] = 0;
        RW_interrupt_read[0] = 0; RW_interrupt_read[1] = 0; RW_interrupt_read[2] = 0; RW_interrupt_read[3] = 0;
        RW_interrupt_write[0] = 0; RW_interrupt_write[1] = 0; RW_interrupt_write[2] = 0; RW_interrupt_write[3] = 0;
        MRD_chk = 0; RFC_chk = 0; RRD_chk = 0;
        RAS_chk0 = 0; RAS_chk1 = 0; RAS_chk2 = 0; RAS_chk3 = 0;
        RCD_chk0 = 0; RCD_chk1 = 0; RCD_chk2 = 0; RCD_chk3 = 0;
        RC_chk0 = 0; RC_chk1 = 0; RC_chk2 = 0; RC_chk3 = 0;
        RP_chk0 = 0; RP_chk1 = 0; RP_chk2 = 0; RP_chk3 = 0;
        $timeformat (-9, 1, " ns", 12);
    end
*/
// Instead perform the following timing check - tRCD
// If timing check fails ->  read/write inverted value
/*
    parameter tRCD              = 3;    // 3T - active to read/write command time
    parameter tRP               = 3;    // 3T - Precharge command period
    parameter tCL               = 3;    // 3T - CAS latency 
    parameter tRC               = 10;   // 10T - Active to Active/Auto Referesh command time
    parameter tRAS              = 7;    // 7T - Active to Precharge command time
    parameter tRRD              = 2;    // Active bank to Active bank command time
*/


    // System clock generator
    /* 
    always begin
        @ (posedge Clk) begin
            Sys_clk = CkeZ;
            CkeZ = Cke;
        end
        @ (negedge Clk) begin
            Sys_clk = 1'b0;
        end
    end
    */
    // CKe timing
    //      /--\__/--\__/--\__/--\__/--\__/--\__/
    // CKe  -------\___________/-----------------
    // iCKe_r------------\___________/-----------
    // iCKe_f --------------\___________/--------
    // Sys_clk/-\_/--\__/--\______________/--\__
    
    wire [DQ_BITS-1:0] bdq [0:3];
    reg  [DQ_BITS-1:0] bdi [0:3];
    reg  [3:0] bren;
    reg  [3:0] bwen;
    always@(*)begin
        bwen = 4'b0000;
        bren = 4'b0000;
        if(Data_in_enable)begin//Data_in_enable||Data_out_enable
            case(Bank_temp)
                2'b00:begin
                    bwen = 4'b0001;
                    bren = 4'b0000;
                end
                2'b01:begin
                    bwen = 4'b0010;
                    bren = 4'b0000;
                end
                2'b10:begin
                    bwen = 4'b0100;
                    bren = 4'b0000;
                end
                2'b11:begin
                    bwen = 4'b1000;
                    bren = 4'b0000;
                end
            endcase
        end else if(Command[2] == `READ)begin//Data_out_enable, Command[1] == `READ
            case(Bank_temp)
                2'b00:begin
                    bwen = 4'b0000;
                    bren = 4'b0001;
                end
                2'b01:begin
                    bwen = 4'b0000;
                    bren = 4'b0010;
                end
                2'b10:begin
                    bwen = 4'b0000;
                    bren = 4'b0100;
                end
                2'b11:begin
                    bwen = 4'b0000;
                    bren = 4'b1000;
                end
            endcase
        end
    end
    blkRam#(.SIZE(mem_sizes), .BIT_WIDTH(DQ_BITS))
    Bank0(
        .clk(Sys_clk), 
        .we(bwen[0]), 
        .re(bren[0]), 
        .waddr(Col_brst[9:0]), 
        .raddr(Col_brst[9:0]), 
        .d(bdi[0]), 
        .q(bdq[0])
    );
    blkRam#(.SIZE(mem_sizes), .BIT_WIDTH(DQ_BITS))
    Bank1(
        .clk(Sys_clk), 
        .we(bwen[1]), 
        .re(bren[1]), 
        .waddr(Col_brst[9:0]), 
        .raddr(Col_brst[9:0]), 
        .d(bdi[1]), 
        .q(bdq[1])
    );
    blkRam#(.SIZE(mem_sizes), .BIT_WIDTH(DQ_BITS))
    Bank2(
        .clk(Sys_clk), 
        .we(bwen[2]), 
        .re(bren[2]), 
        .waddr(Col_brst[9:0]), 
        .raddr(Col_brst[9:0]), 
        .d(bdi[2]), 
        .q(bdq[2])
    );
    blkRam#(.SIZE(mem_sizes), .BIT_WIDTH(DQ_BITS))
    Bank3(
        .clk(Sys_clk), 
        .we(bwen[3]), 
        .re(bren[3]), 
        .waddr(Col_brst[9:0]), 
        .raddr(Col_brst[9:0]), 
        .d(bdi[3]), 
        .q(bdq[3])
    );
    
    reg iCKe_f,     // CKe by Clk falling edge, used to gate Sys_clk
        iCKe_r;     // CKe sampled by Clk rising edge
    always @(posedge Clk or negedge Rst_n) begin
        if(!Rst_n) begin
            iCKe_r = 0;
        end else begin
            iCKe_r = Cke;
        end
    end
    always @(negedge Clk or negedge Rst_n) begin
        if(!Rst_n) begin
            iCKe_f = 0;
        end else begin
            iCKe_f = iCKe_r;
        end
    end
    assign Sys_clk = iCKe_f & Clk;

    // pipeline Command, Col_addr, Bank_addr, 
    integer i;
    always @ (posedge Sys_clk or negedge Rst_n) begin
     /*
        // Internal Commamd Pipelined
        Command[0] = Command[1];
        Command[1] = Command[2];
        Command[2] = Command[3];
        Command[3] = `NOP;

        Col_addr[0] = Col_addr[1];
        Col_addr[1] = Col_addr[2];
        Col_addr[2] = Col_addr[3];
        Col_addr[3] = {COL_BITS{1'b0}};

        Bank_addr[0] = Bank_addr[1];
        Bank_addr[1] = Bank_addr[2];
        Bank_addr[2] = Bank_addr[3];
        Bank_addr[3] = 2'b0;

        Bank_precharge[0] = Bank_precharge[1];
        Bank_precharge[1] = Bank_precharge[2];
        Bank_precharge[2] = Bank_precharge[3];
        Bank_precharge[3] = 2'b0;

        A10_precharge[0] = A10_precharge[1];
        A10_precharge[1] = A10_precharge[2];
        A10_precharge[2] = A10_precharge[3];
        A10_precharge[3] = 1'b0;

        // Dqm pipeline for Read
        Dqm_reg0 = Dqm_reg1;
        Dqm_reg1 = Dqm;
        */
        if(!Rst_n)begin
            for(i=0;i<4;i=i+1)begin
                Command[i] <= `NOP;
                Col_addr[i] <= {COL_BITS{1'b0}};
                Bank_addr[i] <= 2'b0;
                Bank_precharge[i] <= 2'b0;
                A10_precharge[i] <= 1'b0;
            end
            Dqm_reg0 <= {DM_BITS{1'b0}};
            Dqm_reg1 <= {DM_BITS{1'b0}};
            Bank_temp <= 2'd0;
            Bank_temp_buf <= 2'd0;
        end else begin
            if (Prech_enable == 1'b1) begin
                Command[Cas_latency - 1] <= `PRECH;
                Bank_precharge[Cas_latency - 1] <= Ba;
                A10_precharge[Cas_latency - 1] <= Addr[10];
            end
            else if (Burst_term === 1'b1) begin
                Command[Cas_latency - 1] <= `BST;
            end
            else if (Read_enable === 1'b1) begin
                Command[Cas_latency - 1] <= `READ;//Cas_latency - 1
                Col_addr[Cas_latency - 1] <= Addr;//Cas_latency - 1
                Bank_addr[Cas_latency - 1] <= Ba;//Cas_latency - 1
            end    
            else if (Write_enable == 1'b1) begin
                Command[Cas_latency - 1] <= `WRITE;//0
                Col_addr[Cas_latency - 1] <= Addr;//0
                Bank_addr[Cas_latency - 1] <= Ba;//0
            end else begin
                {Command[2]} <= {Command[3]};
                {Col_addr[2]} <= {Col_addr[3]};
                {Bank_addr[2]} <= {Bank_addr[3]};
                {Bank_precharge[2]} <= {Bank_precharge[3]};
                {A10_precharge[0], A10_precharge[1]} <= {A10_precharge[1], A10_precharge[2]};
            end
            
            {Command[0], Command[1]} <= {Command[1], Command[2]};
            {Col_addr[0], Col_addr[1]} <= {Col_addr[1], Col_addr[2]};
            {Bank_addr[0], Bank_addr[1]} <= {Bank_addr[1], Bank_addr[2]};
                
            {Bank_precharge[0], Bank_precharge[1]} <= {Bank_precharge[1], Bank_precharge[2]};
            {A10_precharge[0], A10_precharge[1]} <= {A10_precharge[1], A10_precharge[2]};
            if(Read_enable)begin//Command[2] == `READ
                Bank_temp <= Ba;//Bank_addr[2]
                Bank_temp_buf <= Bank_temp;
            end else begin
                Bank_temp <= Bank_addr[0];
                Bank_temp_buf <= Bank_temp;
            end
        end
    end

    // Mode Register, default value
    always @(posedge Sys_clk or negedge Rst_n) begin
        if(!Rst_n) begin
            // Mode_reg =  13'b000_0_00_011_0_011;  // Cas-latency = 3; burst-length = 8; write burst
            // Currently we run at non-burst mode
            Mode_reg <=  13'b000_1_00_011_0_000;  // Cas-latency = 3; burst-length = 1; No write burst
        end else if (Mode_reg_enable === 1'b1) begin
            // Register Mode
            Mode_reg <= 13'b000_1_00_011_0_000;//Addr;
        end
    end 

    // Active Block (Latch Bank Address and Row Address)
    reg Error;          // Set if error happen
    always @(posedge Sys_clk or negedge Rst_n) begin
        if(!Rst_n)begin
            Error <= 1'b0;
            Dq_reg <= {DQ_BITS{1'b0}};
            Dq_dqm <= {DQ_BITS{1'b0}};
            
            Act_b0 <= 1'b0;
            Act_b1 <= 1'b0;
            Act_b2 <= 1'b0;
            Act_b3 <= 1'b0;
            Pc_b0  <= 1'b0;
            Pc_b1  <= 1'b0;
            Pc_b2  <= 1'b0;
            Pc_b3  <= 1'b0;
            
            B0_row_addr <= {ADDR_BITS{1'b0}};
            B1_row_addr <= {ADDR_BITS{1'b0}};
            B2_row_addr <= {ADDR_BITS{1'b0}};
            B3_row_addr <= {ADDR_BITS{1'b0}};
            
            
            for(i=0;i<4;i=i+1)begin
                bdi[i] <= {DQ_BITS{1'b0}};
            end
        end else begin
            if (Active_enable === 1'b1) begin
                // Activate an open bank can corrupt data
                if ((Ba === 2'b00 && Act_b0 === 1'b1) || (Ba === 2'b01 && Act_b1 === 1'b1) ||
                    (Ba === 2'b10 && Act_b2 === 1'b1) || (Ba === 2'b11 && Act_b3 === 1'b1)) begin
                    Error <= 1;     // Bank already activated 
                    // $display ("%m : at time %t ERROR: Bank already activated -- data can be corrupted", $time);
                end
    
                case(Ba) 
                    2'b00:  
                        begin
                            Act_b0 <= 1'b1;
                            Pc_b0 <= 1'b0;
                            B0_row_addr <= Addr[ADDR_BITS - 1: 0];
                        end
                    2'b01:  
                        begin
                            Act_b1 <= 1'b1;
                            Pc_b1 <= 1'b0;
                            B1_row_addr <= Addr[ADDR_BITS - 1: 0];
                        end
                    2'b10:  
                        begin
                            Act_b2 <= 1'b1;
                            Pc_b2 <= 1'b0;
                            B2_row_addr <= Addr[ADDR_BITS - 1: 0];
                        end
                    2'b11:  
                        begin
                            Act_b3 <= 1'b1;
                            Pc_b3 <= 1'b0;
                            B3_row_addr <= Addr[ADDR_BITS - 1: 0];
                        end
                    default:  
                        begin
                            {Act_b3, Act_b2, Act_b1, Act_b0} <= 4'b0;
                            {Pc_b3, Pc_b2, Pc_b1, Pc_b0} <= 4'b0;
                        end
                endcase
            end
        
    // Precharge Block
            if (Prech_enable == 1'b1) begin
    
                // Precharge Bank 0
                if ((Addr[10] === 1'b1 || (Addr[10] === 1'b0 && Ba === 2'b00)) && Act_b0 === 1'b1) begin
                    Act_b0 <= 1'b0;
                    Pc_b0 <= 1'b1;
                end
    
                // Precharge Bank 1
                if ((Addr[10] === 1'b1 || (Addr[10] === 1'b0 && Ba === 2'b01)) && Act_b1 === 1'b1) begin
                    Act_b1 <= 1'b0;
                    Pc_b1 <= 1'b1;
                end
    
                // Precharge Bank 2
                if ((Addr[10] === 1'b1 || (Addr[10] === 1'b0 && Ba === 2'b10)) && Act_b2 === 1'b1) begin
                    Act_b2 <= 1'b0;
                    Pc_b2 <= 1'b1;
                end
    
                // Precharge Bank 3
                if ((Addr[10] === 1'b1 || (Addr[10] === 1'b0 && Ba === 2'b11)) && Act_b3 === 1'b1) begin
                    Act_b3 <= 1'b0;
                    Pc_b3 <= 1'b1;
                end
    
                // Terminate a Write Immediately (if same bank or all banks)
                //if (Data_in_enable === 1'b1 && (Bank === Ba || Addr[10] === 1'b1)) begin
                //    Data_in_enable = 1'b0;
                //end
    
    
    
                // Precharge Command Pipeline for Read
                //Command[Cas_latency - 1] = `PRECH;
                //Bank_precharge[Cas_latency - 1] = Ba;
                //A10_precharge[Cas_latency - 1] = Addr[10];
            end
        
               
        // Burst terminate
            //if (Burst_term === 1'b1) begin
                // Terminate a Write Immediately
                //if (Data_in_enable == 1'b1) begin
                //    Data_in_enable = 1'b0;
                //end
    
                // Terminate a Read Depend on CAS Latency
                //Command[Cas_latency - 1] = `BST;
            //end
        
        // Read
            if (Read_enable === 1'b1) begin
                // Check to see if bank is open (ACT)
                if ((Ba == 2'b00 && Pc_b0 == 1'b1) || (Ba == 2'b01 && Pc_b1 == 1'b1) ||
                    (Ba == 2'b10 && Pc_b2 == 1'b1) || (Ba == 2'b11 && Pc_b3 == 1'b1)) begin
                    Error <= 1;
`ifdef SIM
                    $display("%m : at time %t ERROR: Bank is not Activated for Read", $time);
`endif
                end

                // CAS Latency pipeline
                //Command[Cas_latency - 1] <= `READ;
                //Col_addr[Cas_latency - 1] <= Addr;
                //Bank_addr[Cas_latency - 1] <= Ba;
    
                // Read interrupt Write (terminate Write immediately)
                if (Data_in_enable == 1'b1) begin
                    //Data_in_enable = 1'b0;
    
                    // Interrupting a Write with Autoprecharge
                    if (Auto_precharge[RW_interrupt_bank] == 1'b1 && Write_precharge[RW_interrupt_bank] == 1'b1) begin
                        RW_interrupt_write[RW_interrupt_bank] <= 1'b1;
                        RW_interrupt_counter[RW_interrupt_bank] <= 0;
    
                        // Display debug message
`ifdef SIM
                        $display ("%m : at time %t NOTE : Read interrupt Write with Autoprecharge", $time);
`endif
                    end
                end
    
                // Read with Auto Precharge
                if (Addr[10] == 1'b1) begin
                    Auto_precharge[Ba] <= 1'b1;
                    Count_precharge[Ba] <= 0;
                    RW_interrupt_bank <= Ba;
                    Read_precharge[Ba] <= 1'b1;
                end
            end
    // Write Command
            if (Write_enable == 1'b1) begin
                // Activate to Write
                if ((Ba == 2'b00 && Pc_b0 == 1'b1) || (Ba == 2'b01 && Pc_b1 == 1'b1) ||
                    (Ba == 2'b10 && Pc_b2 == 1'b1) || (Ba == 2'b11 && Pc_b3 == 1'b1)) begin
                    Error <= 1;
`ifdef SIM
                    $display("%m : at time %t ERROR: Bank is not Activated for Write", $time);
`endif
                end

                // Latch Write command, Bank, and Column
                //Command[0] = `WRITE;
                //Col_addr[0] = Addr;
                //Bank_addr[0] = Ba;
    
                // Write interrupt Write (terminate Write immediately)
                if (Data_in_enable == 1'b1) begin
                    //Data_in_enable = 1'b0;
    
                    // Interrupting a Write with Autoprecharge
                    if (Auto_precharge[RW_interrupt_bank] == 1'b1 && Write_precharge[RW_interrupt_bank] == 1'b1) begin
                        RW_interrupt_write[RW_interrupt_bank] <= 1'b1;
`ifdef SIM
                        // Display debug message
                        $display ("%m : at time %t NOTE : Read Bank %d interrupt Write Bank %d with Autoprecharge", $time, Ba, RW_interrupt_bank);
`endif
                    end
                end

                // Write interrupt Read (terminate Read immediately)
                if (Data_out_enable == 1'b1) begin
                    //Data_out_enable = 1'b0;
                    
                    // Interrupting a Read with Autoprecharge
                    if (Auto_precharge[RW_interrupt_bank] == 1'b1 && Read_precharge[RW_interrupt_bank] == 1'b1) begin
                        RW_interrupt_read[RW_interrupt_bank] <= 1'b1;
    
                        // Display debug message
`ifdef SIM           
                        $display ("%m : at time %t NOTE : Write Bank %d interrupt Read Bank %d with Autoprecharge", $time, Ba, RW_interrupt_bank);
`endif             
                    end
                end
    
                // Write with Auto Precharge
                if (Addr[10] == 1'b1) begin
                    Auto_precharge[Ba] <= 1'b1;
                    Count_precharge[Ba] <= 0;
                    RW_interrupt_bank <= Ba;
                    Write_precharge[Ba] <= 1'b1;
                end
            end
    
    // Detect Read or Write command
            if (Read_enable || Command[0] == `WRITE) begin//Command[2] == `READ
                if(Read_enable)begin//Command[2] == `READ
                    Bank <= Ba;//Bank_addr[2]
                    Col <= Addr;//Col_addr[2]
                    Col_brst <= Addr;//Col_addr[2]
                    case (Ba)//Bank_addr[2]
                        2'b00 : Row <= B0_row_addr;
                        2'b01 : Row <= B1_row_addr;
                        2'b10 : Row <= B2_row_addr;
                        2'b11 : Row <= B3_row_addr;
                    endcase
                    Burst_counter <= 0;
                end else begin
                    Bank <= Bank_addr[0];
                    Col <= Col_addr[0];
                    Col_brst <= Col_addr[0];
                    case (Bank_addr[0])
                        2'b00 : Row <= B0_row_addr;
                        2'b01 : Row <= B1_row_addr;
                        2'b10 : Row <= B2_row_addr;
                        2'b11 : Row <= B3_row_addr;
                    endcase
                    Burst_counter <= 0;
                end
                //Data_in_enable = 1'b0;
                //Data_out_enable = 1'b1;
                //if(Command[0] == `READ) begin
                //    Data_in_enable = 1'b0;
                //    Data_out_enable = 1'b1;
                //end else begin
                //    Data_in_enable = 1'b1;
                //    Data_out_enable = 1'b0;
                //end
                if(Command[0] == `WRITE) begin
                    case (Bank_addr[0])
                        2'b00 : bdi[0] <= Dq_dqm;//Bank0 [{Row, Col}] = Dq_dqm;
                        2'b01 : bdi[1] <= Dq_dqm;//Bank1 [{Row, Col}] = Dq_dqm;
                        2'b10 : bdi[2] <= Dq_dqm;//Bank2 [{Row, Col}] = Dq_dqm;
                        2'b11 : bdi[3] <= Dq_dqm;//Bank3 [{Row, Col}] = Dq_dqm;
                    endcase
                end  
            end 

// `ifdef SIM
//             // Display debug message
//             if (Dqm !== 2'b11) begin
//                 // Record tWR for manual precharge
//                 WR_chkm [Bank] = $time;

//                 if (Debug) begin
//                     $display("%m : at time %t WRITE: Bank = %d Row = %d, Col = %d, Data = %h", $time, Bank, Row, Col, Dq_dqm);
//                 end
//             end else begin
//                 if (Debug) begin
//                     $display("%m : at time %t WRITE: Bank = %d Row = %d, Col = %d, Data = Hi-Z due to DQM", $time, Bank, Row, Col);
//                 end
//             end
//             // Advance burst counter subroutine
//             #tHZ Burst_decode;
// `endif     
//             end 
//             else if (Data_out_enable == 1'b1) begin                         // Reading Data from Memory
//                 // Array buffer
//                 //case (Bank)   
//                 //    2'b00 : Dq_reg <= bdq[0];//Dq_dqm = Bank0 [{Row, Col}];
//                 //    2'b01 : Dq_reg <= bdq[1];//Dq_dqm = Bank1 [{Row, Col}];
//                 //    2'b10 : Dq_reg <= bdq[2];//Dq_dqm = Bank2 [{Row, Col}];
//                 //    2'b11 : Dq_reg <= bdq[3];//Dq_dqm = Bank3 [{Row, Col}];
//                 //endcase
//                 // Dqm operation
// `ifdef x4
//                 if (Dqm_reg0 [0] == 1'b1) begin
//                     Dq_dqm [ 3 : 0] = 4'bz;
//                 end
// `elsif x8
//                 if (Dqm_reg0 [0] == 1'b1) begin
//                     Dq_dqm [ 7 : 0] = 8'bz;
//                 end
// `elsif x16
//                 if (Dqm_reg0 [0] == 1'b1) begin
//                     Dq_dqm [ 7 : 0] = 8'bz;
//                 end
//                 if (Dqm_reg0 [1] == 1'b1) begin
//                     Dq_dqm [15 : 8] = 8'bz;
//                 end
// `endif

//                 // Display debug message
//                 //Dq_reg = #tAC Dq_dqm;
// `ifdef SIM
//                 if (Debug) begin
//                     $display("%m : at time %t READ : Bank = %d Row = %d, Col = %d, Dqm = %b, Data = %h", $time, Bank, Row, Col, Dqm_reg0, Dq_reg);
//                 end
// `endif
//                 // Advance burst counter subroutine
//                 // Burst_decode;
//                 // Reduce the Burst_decode to handle only
//                 //  - Sequential Burst
//                 //  - Burst-length = 8
//                 // Advance Burst Counter
//                 /*
//                 Burst_counter = Burst_counter + 1;
//                 Col_temp = Col + 1;             // Sequntial Burst only
//                 Col[2:0] = Col_temp[2:0];       // Burst Length = 8
//                 if(Burst_counter >= 8) begin
//                     Data_in_enable = 1'b0;
//                     Data_out_enable = 1'b0;
//                 end
//                 // Burst Read Single Write            
//                 if (Write_burst_mode == 1'b1) begin
//                     Data_in_enable = 1'b0;
//                 end 
//                 */
                
            if(Write_enable) begin
                Dq_dqm <= Dqi;
            end
            
            if (Data_out_enable_buf) begin
                case (Bank_temp_buf)   
                    2'b00 : Dq_reg <= bdq[0];
                    2'b01 : Dq_reg <= bdq[1];
                    2'b10 : Dq_reg <= bdq[2];
                    2'b11 : Dq_reg <= bdq[3];
                endcase
            end
            
           //Burst_decode;
        end
    end

    always@(posedge Sys_clk or negedge Rst_n)begin
        if(!Rst_n)begin
            Data_out_enable_buf <= 1'b0;
        end else begin
            if(|bren)
                Data_out_enable_buf <= 1'b1;
            else
                Data_out_enable_buf <= 1'b0;
        end
    end
    
    always@(posedge Sys_clk or negedge Rst_n)begin
        if(!Rst_n)begin
            Data_in_enable <= 1'b0;
            Data_out_enable <= 1'b0;
        end else begin
            if (Prech_enable == 1'b1) begin
                if (Data_in_enable === 1'b1 && (Bank === Ba || Addr[10] === 1'b1)) begin
                    Data_in_enable <= 1'b0;
                end
            end
            else if (Burst_term === 1'b1) begin
            // Terminate a Write Immediately
                if (Data_in_enable == 1'b1) begin
                    Data_in_enable <= 1'b0;
                end
            end
            else if (Read_enable === 1'b1) begin
                if (Data_in_enable == 1'b1) begin
                    Data_in_enable <= 1'b0;
                end
            end            
            else if (Write_enable == 1'b1) begin
                if (Data_in_enable == 1'b1) begin
                    Data_in_enable <= 1'b0;
                end
                if (Data_out_enable == 1'b1) begin
                    Data_out_enable <= 1'b0;
                end
            end    
            else if (Read_enable || Command[0] == `WRITE) begin//Command[2] == `READ
                //Data_in_enable <= 1'b0;
                //Data_out_enable <= 1'b1;
                if(Read_enable) begin//Command[2] == `READ
                    Data_in_enable <= 1'b0;
                    Data_out_enable <= 1'b1;
                end else begin
                    Data_in_enable <= 1'b1;
                    Data_out_enable <= 1'b0;
                end
            end else begin
                if(Data_in_enable)
                    Data_in_enable <= 1'b0;
                if(Data_out_enable)
                Data_out_enable <= 1'b0;
            end
        end        
    end


// Burst counter decode
    task Burst_decode;
        begin
            // Advance Burst Counter
            Burst_counter = Burst_counter + 1;

            // Burst Type
            if (Mode_reg[3] == 1'b0) begin                                  // Sequential Burst
                Col_temp = Col + 1;
            end else if (Mode_reg[3] == 1'b1) begin                         // Interleaved Burst
                Col_temp[2] =  Burst_counter[2] ^  Col_brst[2];
                Col_temp[1] =  Burst_counter[1] ^  Col_brst[1];
                Col_temp[0] =  Burst_counter[0] ^  Col_brst[0];
            end

            // Burst Length
            if (Burst_length_2) begin                                       // Burst Length = 2
                Col [0] = Col_temp [0];
            end else if (Burst_length_4) begin                              // Burst Length = 4
                Col [1 : 0] = Col_temp [1 : 0];
            end else if (Burst_length_8) begin                              // Burst Length = 8
                Col [2 : 0] = Col_temp [2 : 0];
            end else begin                                                  // Burst Length = FULL
                Col = Col_temp;
            end

            // Burst Read Single Write            
            if (Write_burst_mode == 1'b1) begin
                Data_in_enable = 1'b0;
            end

            // Data Counter
            if (Burst_length_1 == 1'b1) begin
                if (Burst_counter >= 1) begin
                    Data_in_enable = 1'b0;
                    Data_out_enable = 1'b0;
                end
            end else if (Burst_length_2 == 1'b1) begin
                if (Burst_counter >= 2) begin
                    Data_in_enable = 1'b0;
                    Data_out_enable = 1'b0;
                end
            end else if (Burst_length_4 == 1'b1) begin
                if (Burst_counter >= 4) begin
                    Data_in_enable = 1'b0;
                    Data_out_enable = 1'b0;
                end
            end else if (Burst_length_8 == 1'b1) begin
                if (Burst_counter >= 8) begin
                    Data_in_enable = 1'b0;
                    Data_out_enable = 1'b0;
                end
            end
        end
    endtask
endmodule


module blkRam #(parameter SIZE = 8192, parameter BIT_WIDTH = 8)(clk, we, re, waddr, raddr, d, q);
    //`define RAMinitFile "./sfmx.dat"
    parameter ADDR_WIDTH = $clog2(SIZE);
    parameter COL_WIDTH = 9;
    parameter NB_COL = 4;
    input                          clk;
    input                          we, re;
    input [ADDR_WIDTH-1:0]         waddr, raddr;
    input [BIT_WIDTH-1:0]          d;
    output reg [BIT_WIDTH-1:0]     q;
    reg [BIT_WIDTH-1:0] RAM [0:SIZE-1];
    //initial $readmemh(`RAMinitFile, RAM);
    
    always @(posedge clk)begin
        if(re) q <= RAM[raddr];
    end
    
    always @(posedge clk)begin
        if(we) RAM[waddr] <= d;
    end
    
endmodule
