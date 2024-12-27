module arbiter(
    input         clk,
    input         rst,
    // decoder 30000
    input         wbs_stb_i,
    input         wbs_cyc_i,
    input         wbs_we_i,
    input  [3:0]  wbs_sel_i,
    input  [31:0] wbs_dat_i,
    input  [31:0] wbs_adr_i,
        
    // Wishbone Interface 1  decoder 3800
    input         dma_stb_i_cpu,
    input         dma_cyc_i_cpu,
    input         dma_we_i_cpu,
    input  [ 3:0] dma_sel_i_cpu,
    input  [31:0] dma_dat_i_cpu,
    input  [31:0] dma_adr_i_cpu,
    output        dma_ack_o_cpu,
    output [31:0] dma_dat_o_cpu,

    // Wishbone Interface 2  fir
    input         dma_stb_i_fir,
    input         dma_cyc_i_fir,
    input         dma_we_i_fir,
    input  [ 3:0] dma_sel_i_fir,
    input  [31:0] dma_dat_i_fir,
    input  [31:0] dma_adr_i_fir,
    output        dma_ack_o_fir,
    output [31:0] dma_dat_o_fir,

    // Wishbone Interface 3 qsort
    input         dma_stb_i_qsort,
    input         dma_cyc_i_qsort,
    input         dma_we_i_qsort,
    input  [ 3:0] dma_sel_i_qsort,
    input  [31:0] dma_dat_i_qsort,
    input  [31:0] dma_adr_i_qsort,
    output        dma_ack_o_qsort,
    output [31:0] dma_dat_o_qsort,
    
    // Wishbone Interface 4 mm
    input         dma_stb_i_mm,
    input         dma_cyc_i_mm,
    input         dma_we_i_mm,
    input  [ 3:0] dma_sel_i_mm,
    input  [31:0] dma_dat_i_mm,
    input  [31:0] dma_adr_i_mm,
    output        dma_ack_o_mm,
    output [31:0] dma_dat_o_mm,

    // mem signal
    output [31:0] mem_dat_o,
    output        mem_ack_o
);

    // local parameter definition
    localparam IDLE  = 3'd0;
    localparam CPU   = 3'd1;
    localparam FIR   = 3'd2;
    localparam QSORT = 3'd3;
    localparam MM    = 3'd4;

    wire        sdram_ack_o;
    reg  [22:0] sdc_user_addr;
    reg         sdc_rw;
    reg  [31:0] sdc_data_in;
    wire [31:0] sdc_data_out;
    wire        sdc_busy;
    wire        sdc_in_valid;
    wire        sdc_out_valid;
    wire         valid;
    wire [31:0] d2c_data;
    wire [31:0] c2d_data;
    wire [31:0] sdram_data_o;
    wire [ 3:0] bram_mask;
    reg         sdc_in_valid_q;

    // FSM
    // in arbiter, we need to check which wishbone interface is requesting.
    // in idle state, arbiter can receive request from any dma. the priority is fir > qsort > mm > cpu. // DO NEED CPU?
    // for other states, if SDRAM tell us that SDRAM has send data (also DMA has space to store read data if it is read), back to idle state then. else, stay.
    // update: if read buffer is full, the FSM won't enter READ state in DMA, so engine can't send read signal to DMA. Thus, we don't need to consider the case that read when read buffer if full.
    reg [2:0] state, next_state;
    always@(*) begin
        case(state) // TODO
            IDLE: if      (dma_cyc_i_fir)   next_state = FIR;   // why no need stb?
                  else if (dma_cyc_i_qsort) next_state = QSORT; // why no need stb?
                  else if (dma_cyc_i_mm)    next_state = MM;    // why no need stb?
                  else if (dma_cyc_i_cpu)   next_state = CPU;   // why no need stb?
                  else next_state = state;
            FIR:  if (sdram_ack_o) next_state = IDLE;
                  else next_state = state;
            QSORT: if (sdram_ack_o) next_state = IDLE;
                  else next_state = state;
            MM:   if (sdram_ack_o) next_state = IDLE;
                  else next_state = state;
            CPU:  if (sdram_ack_o) next_state = IDLE;
                  else next_state = state;
            default: next_state = IDLE;

        endcase
    end

    // Interface to DMAs 
    // we have dma_ack_o and dma_dat_o for each dma.
    // sdram_ack_o means SDRAM has send data.
    assign dma_ack_o_fir   = (sdram_ack_o && state == FIR);
    assign dma_ack_o_qsort = (sdram_ack_o && state == QSORT);
    assign dma_ack_o_mm    = (sdram_ack_o && state == MM);
    assign dma_ack_o_cpu   = (sdram_ack_o && state == CPU);

    // since dma_ack_o only raise when data is prepared, we can directly assign value.    
    assign dma_dat_o_fir   = sdram_data_o;
    assign dma_dat_o_qsort = sdram_data_o;
    assign dma_dat_o_mm    = sdram_data_o;
    assign dma_dat_o_cpu   = sdram_data_o;

    // interface to SDRAM and sdr
    // sdr have these inputs: rst_n, clk, cke, cs_n, ras_n, cas_n, we_n, addr, ba, dqm, dqi
    // sdr have these outputs: dqo
    // inputs; cke, cs-n, ras-n, cas-n, we-n, addr, ba is directly from sdram_controller

    wire sdram_cle;
    wire sdram_cs;
    wire sdram_cas;
    wire sdram_ras;
    wire sdram_we;
    wire sdram_dqm;
    wire [1:0] sdram_ba;
    wire [12:0] sdram_a;

    // signals we need to assign; user_addr, rw, data_in, data_out, busy, in_valid, out_valid. sdc means sdram controller
    // signal meaning;
    // sdc_busy: controller is busy when high (output from sdc)
    // sdc_data_out: data for a write (output from sdc)
    // sdc_out_valid: pulses high when data from read is valid (output from sdc)
    // sdc_in_valid: pulse high to initiate a read/write (input to sdc)

    // signals based on arbiter state
    // always@(*) begin
    //     case(state)
    //         IDLE: begin
    //             valid         = 0;
    //             sdc_rw        = 0;
    //             sdc_data_in   = 0;
    //             sdc_user_addr = 0;
    //         end
    //         FIR: begin
    //             valid         = dma_cyc_i_fir && dma_stb_i_fir;
    //             sdc_rw        = dma_we_i_fir;
    //             sdc_data_in   = dma_dat_i_fir;
    //             sdc_user_addr = dma_adr_i_fir[22:0];
    //         end
    //         QSORT: begin
    //             valid         = dma_cyc_i_qsort && dma_stb_i_qsort;
    //             sdc_rw        = dma_we_i_qsort;
    //             sdc_data_in   = dma_dat_i_qsort;
    //             sdc_user_addr = dma_adr_i_qsort[22:0];
    //         end
    //         MM:  begin
    //             valid         = dma_cyc_i_mm && dma_stb_i_mm;
    //             sdc_rw        = dma_we_i_mm;
    //             sdc_data_in   = dma_dat_i_mm;
    //             sdc_user_addr = dma_adr_i_mm[22:0];
    //         end
    //         CPU: begin
    //             valid         = dma_cyc_i_cpu && dma_stb_i_cpu;
    //             sdc_rw        = dma_we_i_cpu;
    //             sdc_data_in   = dma_dat_i_cpu;
    //             sdc_user_addr = dma_adr_i_cpu[22:0];
    //         end
    //         default: begin
    //             valid         = 0;
    //             sdc_rw        = 0;
    //             sdc_data_in   = 0;
    //             sdc_user_addr = 0;
    //         end
    //     endcase
    // end

    reg         stb;
    reg         cyc;	// command strobe -request
    reg         we;		// 1: write, 0: read
    reg  [3:0]  sel;		// byte-enable
    reg  [31:0] dat;	// data in
    reg  [31:0] adr;		// address in
    
    
    //would be change to bus
    // assign we = (wb1_we_i&(decoder==2'b1))|(wb2_we_i&(decoder==2'b10))|(wb3_we_i&(decoder==2'b11))|(wb4_we_i&(decoder==3'b100));
    // assign sel= (wb1_sel_i&{4{(decoder==2'b1)}})|(wb2_sel_i&{4{(decoder==2'b10)}})|(wb3_sel_i&{4{(decoder==2'b11)}})|(wb4_sel_i&{4{(decoder==3'b100)}});
    // assign dat= (wb1_dat_i&{32{(decoder==2'b1)}})|(wb2_dat_i&{32{(decoder==2'b10)}})|(wb3_dat_i&{32{(decoder==2'b11)}})|(wb4_dat_i&{32{(decoder==3'b100)}});
    // assign adr= (wb1_adr_i&{32{(decoder==2'b1)}})|(wb2_adr_i&{32{(decoder==2'b10)}})|(wb3_adr_i&{32{(decoder==2'b11)}})|(wb4_adr_i&{32{(decoder==3'b100)}});	
    // assign cyc =(wb1_cyc_i&(decoder==2'b1))|(wb2_cyc_i&(decoder==2'b10))|(wb3_cyc_i&(decoder==2'b11))|(wb4_cyc_i&(decoder==3'b100));
    // //assign cyc =(wb1_cyc_i&(state==CPU))|(wb2_cyc_i&(state==FIR))|(wb3_cyc_i&(state==QS))|(wb4_cyc_i&(state===MM));
    // assign stb =(wb1_stb_i&(decoder==2'b1))|(wb2_stb_i&(decoder==2'b10))|(wb3_stb_i&(decoder==2'b11))|(wb4_stb_i&(decoder==3'b100));

    always@(*) begin
        case(state)
            IDLE: begin
                we        = 0;
                sel        = 0;
                dat        = 0;
                adr        = 0;
                cyc        = 0;
                stb        = 0;
            end
            FIR: begin
                we        = dma_we_i_fir;
                sel        = dma_sel_i_fir;
                dat        = dma_dat_i_fir;
                adr        = dma_adr_i_fir;
                cyc        = dma_cyc_i_fir;
                stb        = dma_stb_i_fir;
            end
            QSORT: begin
                we        = dma_we_i_qsort;
                sel        = dma_sel_i_qsort;
                dat        = dma_dat_i_qsort;
                adr        = dma_adr_i_qsort;
                cyc        = dma_cyc_i_qsort;
                stb        = dma_stb_i_qsort;
            end
            MM:  begin
                we        = dma_we_i_mm;
                sel        = dma_sel_i_mm;
                dat        = dma_dat_i_mm;
                adr        = dma_adr_i_mm;
                cyc        = dma_cyc_i_mm;
                stb        = dma_stb_i_mm;
            end
            CPU: begin
                we        = dma_we_i_cpu;
                sel        = dma_sel_i_cpu;
                dat        = dma_dat_i_cpu;
                adr        = dma_adr_i_cpu;
                cyc        = dma_cyc_i_cpu;
                stb        = dma_stb_i_cpu;
            end
            default: begin
                we        = 0;
                sel        = 0;
                dat        = 0;
                adr        = 0;
                cyc        = 0;
                stb        = 0;
            end
        endcase
    end

    // wire valid;

    // wire sdram_cle;
    // wire sdram_cs;
    // wire sdram_cas;
    // wire sdram_ras;
    // wire sdram_we;
    // wire sdram_dqm;
    // wire [1:0] sdram_ba;
    // wire [12:0] sdram_a;
    // wire [31:0] d2c_data;
    // wire [31:0] c2d_data;
    // wire [3:0]  bram_mask;

    wire [22:0] ctrl_addr;
    wire ctrl_busy;
    wire ctrl_in_valid, ctrl_out_valid;

    reg ctrl_in_valid_q;
    
    // WB MI A
    
    
    
    
    
    assign valid = cyc && stb;
    assign ctrl_in_valid = we ? valid : ~ctrl_in_valid_q && valid;
    assign sdram_ack_o = (we) ? ~ctrl_busy && valid : ctrl_out_valid; 
    assign bram_mask = sel & {4{we}};
    assign ctrl_addr = adr[22:0];

    // assign rst_n = ~rst;
    always @(posedge clk) begin
        if (rst) begin
            ctrl_in_valid_q <= 1'b0;
        end
        else begin
            if (~we && valid && ~ctrl_busy && ctrl_in_valid_q == 1'b0)
                ctrl_in_valid_q <= 1'b1;
            else if (ctrl_out_valid)
                ctrl_in_valid_q <= 1'b0;
        end
    end


    


    // DFF
    always@(posedge clk) begin
        if(rst) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end





    sdram_controller user_sdram_controller (
        .clk       (clk),
        .rst       (rst),
        // To SDRAM
        .sdram_cle (sdram_cle),
        .sdram_cs  (sdram_cs),
        .sdram_cas (sdram_cas),
        .sdram_ras (sdram_ras),
        .sdram_we  (sdram_we),
        .sdram_dqm (sdram_dqm),
        .sdram_ba  (sdram_ba),
        .sdram_a   (sdram_a),
        .sdram_dqi (d2c_data),
        .sdram_dqo (c2d_data),
        // SDRAM Control Signals
        .user_addr (ctrl_addr),
        .rw        (we),
        .data_in   (dat),
        .data_out  (sdram_data_o),
        .busy      (ctrl_busy),
        .in_valid  (ctrl_in_valid),
        .out_valid (ctrl_out_valid)
    );
    wire rst_n;
    assign rst_n = ~rst;
    sdr user_bram (
        .Rst_n (rst_n),
        .Clk   (clk),
        .Cke   (sdram_cle),
        .Cs_n  (sdram_cs),
        .Ras_n (sdram_ras),
        .Cas_n (sdram_cas),
        .We_n  (sdram_we),
        .Addr  (sdram_a),
        .Ba    (sdram_ba),
        .Dqm   (bram_mask),
        .Dqi   (c2d_data),
        .Dqo   (d2c_data)
    );

    // IO in sdram_controller and sdr
    /*module sdram_controller (
    input   clk,
    input   rst,
    
    // these signals go directly to the IO pins   
    // output  sdram_clk,
    //============ Control Signals ============//       
    output  sdram_cle,          // Command Latch Enable 
    output  sdram_cs,           // Chip Select          
    output  sdram_cas,          // Column Address Strobe
    output  sdram_ras,          // Row Address Strobe   
    output  sdram_we,           // Write Enable         
    
    //=========== Data Mask Signal ============//
    output  sdram_dqm,          // Data Mask
        
    //============ Address Signals ============//
    output  [1:0]  sdram_ba,    // Bank Address
    output  [12:0] sdram_a,     // Address Lines
        
    //============= Data Signals ==============//
    // Jiin: split dq into dqi (input) dqo (output)
    // inout [7:0] sdram_dq,    
    input   [31:0] sdram_dqi,   // Input Data
    output  [31:0] sdram_dqo,   // Output Data
        
    // User interface
    // Note: we want to remap addr (see below)
    // input [22:0] addr,       // address to read/write
    input   [22:0] user_addr,   // the address will be remap to addr later
        
    input          rw,          // 1 = write, 0 = read
    input   [31:0] data_in,     // data from a read
    output  [31:0] data_out,    // data for a write
    output         busy,        // controller is busy when high
    input          in_valid,    // pulse high to initiate a read/write
    output         out_valid    // pulses high when data from read is valid
    );    */

    /* sdr
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
    */
endmodule
