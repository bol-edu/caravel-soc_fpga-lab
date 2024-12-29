`default_nettype wire

module DMA #(
    parameter BITS = 32,
    parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32,
    parameter Tape_Num = 11
)(
    // Wishbone Slave ports (WB MI A)
    input                   wb_clk_i,
    input                   wb_rst_i, 
    input                   wbs_stb_i,
    input                   wbs_cyc_i,
    input                   wbs_we_i,
    input  [3:0]            wbs_sel_i,
    input  [(pDATA_WIDTH-1):0] wbs_dat_i,
    input  [(pDATA_WIDTH-1):0] wbs_adr_i,
    output                  wbs_ack_o,
    output [(pDATA_WIDTH-1):0] wbs_dat_o,
    
    // DMA to arbiter
    output                  dma_stb_i,
    output                  dma_cyc_i,
    output                  dma_we_i,
    output  [3:0]           dma_sel_i,
    output  [(pDATA_WIDTH-1):0] dma_dat_i,
    output  [(pDATA_WIDTH-1):0] dma_adr_i,
    input                   dma_ack_o,
    input [(pDATA_WIDTH-1):0] dma_dat_o
);

    // FSM states
    localparam RESET = 2'd0, IDLE = 2'd1, X_ADDR = 2'd2, Y_ADDR = 2'd3;
    reg [1:0] state, next_state;

    // Registers
    reg [(pDATA_WIDTH-1):0] dma_x_addr, dma_y_addr;
    reg [(pDATA_WIDTH-1):0] x_addr_counter, y_addr_counter;
    reg [(pDATA_WIDTH-1):0] data_len;
    reg                     x_FF_state, y_FF_state;
    reg [(pDATA_WIDTH-1):0] x_FF, y_FF;
    reg                     x_o_count, y_o_count;

    // Internal signals
    wire wb_hs = wbs_stb_i & wbs_cyc_i & wbs_we_i;
    wire x_addr_signal = (wbs_adr_i == 32'h3000_0004);
    wire y_addr_signal = (wbs_adr_i == 32'h3000_0008);

    // FSM State Machine
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) state <= RESET;
        else state <= next_state;
    end

    always @(*) begin
        case (state)
            RESET: next_state = (wbs_adr_i == 32'h3000_0000 && wbs_dat_i == 32'h0000_0001) ? IDLE : RESET;
            IDLE: next_state = (y_addr_counter >> 2) == data_len ? RESET :
                               (~x_FF_state ? X_ADDR : (y_FF_state ? Y_ADDR : IDLE));
            X_ADDR: next_state = dma_ack_o ? IDLE : X_ADDR;
            Y_ADDR: next_state = dma_ack_o ? IDLE : Y_ADDR;
            default: next_state = RESET;
        endcase
    end

    // Address Counters
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i || state == RESET) begin
            x_addr_counter <= 0;
            y_addr_counter <= 0;
        end else if (dma_ack_o && state == X_ADDR) begin
            x_addr_counter <= x_addr_counter + 32'd4;
        end else if (dma_ack_o && state == Y_ADDR) begin
            y_addr_counter <= y_addr_counter + 32'd4;
        end
    end

    // Address Generators
    assign dma_adr_i = (state == X_ADDR) ? dma_x_addr + x_addr_counter : 
                       (state == Y_ADDR) ? dma_y_addr + y_addr_counter : 32'b0;

    // Data Length Register
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) data_len <= 0;
        else if (wbs_adr_i == 32'h3000_0010) data_len <= wbs_dat_i;
    end

    // Input and Output Buffers
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            x_FF <= 0; x_FF_state <= 0;
            y_FF <= 0; y_FF_state <= 0;
        end else begin
            if (~x_FF_state && dma_ack_o && state == X_ADDR) begin
                x_FF <= dma_dat_o; x_FF_state <= 1;
            end else if (x_FF_state && wb_hs) begin
                x_FF_state <= 0; x_FF <= 0;
            end

            if (~y_FF_state && wb_hs && state == Y_ADDR) begin
                y_FF <= wbs_dat_i; y_FF_state <= 1;
            end else if (y_FF_state && dma_ack_o && state == Y_ADDR) begin
                y_FF_state <= 0; y_FF <= 0;
            end
        end
    end

    // DMA Control Signals
    assign dma_stb_i = (state == X_ADDR || state == Y_ADDR);
    assign dma_cyc_i = (state == X_ADDR || state == Y_ADDR);
    assign dma_we_i  = (state == Y_ADDR);
    assign dma_sel_i = 4'b1111;
    assign dma_dat_i = y_FF;

    // Wishbone Acknowledge
    assign wbs_ack_o = x_o_count | y_o_count;

    // Output Data
    reg [(pDATA_WIDTH-1):0] wbdato;
    assign wbs_dat_o = wbdato;

    always @(*) begin
        wbdato = 32'd0;
        if (wbs_adr_i == 32'h3000_0014) begin
            wbdato = {27'd0, y_FF_state, x_FF_state};
        end
    end

endmodule

`default_nettype wire
