`default_nettype wire

module exmem #(
	parameter BITS = 32,
	parameter DELAYS = 10,
    parameter MPRJ_IO_PADS = 38
    )(
    // Wishbone Slave ports (WB MI A)
    input         wb_clk_i,
    input         wb_rst_i,
    input         wb_valid,
    input         wbs_we_i,
    input  [3:0]  wbs_sel_i,
    input  [31:0] wbs_dat_i,
    input  [31:0] wbs_adr_i,
    output        wbs_ack_o,
    output [31:0] wbs_dat_o
    );
    
    reg             ready; // output by slave(READY)
    wire [3:0]      bram_WE; // bram write enable(byte)
    wire [31:0]     addr_i;  // address in bram
    wire [BITS-1:0] data_o;  // bram data_read-out
    wire [BITS-1:0] data_i;  // bram data write-in

//----------------- Wishbone Handshake Signals --------------------

    assign wbs_ack_o = ready;                                    // slave side program ACK signal
    assign bram_WE   = wbs_sel_i & {4{wbs_we_i}};                // write enable, extend "wbs_we_i" to 4 bit in order to match the byte enable

//------------------------- Address -------------------------------    
    assign addr_i    = wbs_adr_i;

//----------------------- Data in/out -----------------------------
    assign wbs_dat_o = data_o;      // RISC-V CPU read the code in out bram
    assign data_i    = wbs_dat_i;

//----------------------  Delay Count -----------------------------
    reg  [3:0] delay_cnt; // count the delay cycle
    wire [3:0] next_delay_cnt;
    wire       next_ready;

    assign next_delay_cnt = (delay_cnt == DELAYS-1)? 4'd0 : delay_cnt + 1'b1;
    assign next_ready     = (delay_cnt == DELAYS-1)? 1'b1 : 1'b0;

    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            delay_cnt <= 4'd0;
        end
        else begin
            if (wb_valid && !ready) begin  // If VALID, wait for READY
                delay_cnt <= next_delay_cnt;
            end
            else begin
                delay_cnt <= 4'd0;
            end
        end
    end
    
    // ready asserted in the next cycle
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            ready <= 1'b0;
        end
        else begin
            ready <= next_ready;
        end
    end

    bram USER_BRAM (
        .CLK (wb_clk_i),
        .WE0 (bram_WE),
        .EN0 (wb_valid),
        .Di0 (data_i),
        .Do0 (data_o),
        .A0  (addr_i)
    );

endmodule