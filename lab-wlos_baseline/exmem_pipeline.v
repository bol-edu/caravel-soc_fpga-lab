// exmem_pipeline
//    A Memory system in user project area, with the following specificaiton
// Interface timing:  10T latency for read/write access
//          1   2   3   4   5   6   7   8   9   10  11  12  13  14  15  16  17
// clk    |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
// stb    _/---\___/-------\___/-------\_______
// we     _/---\_______/---\___________________
// addr   __a1_____a2__a3_______a4_a5
// dat_i  __d1_________d2_______
// ack(10T)____________________________________/--\____/-------\___/-------\____
// dat_o   _________________________________________________d3______d4_d5_______
// 

`default_nettype none
module exmem_pipeline #(
    parameter N     // delay
)(
    input clk,
    input rst,              // active-high
    input stb,              // command strobe - request
    input we,               // 1=write, 0=read
    input [3:0] sel,        // byte-enable
    input [31:0]  dat_i,    // data input 
    input [31:0]  addr,     // address input
    output ack,             // ack - ready
    output [31:0] dat_o,    // data output
);

// The following are shift_fifo
// it shifts from N-1 to 0 for every cycles
reg [N-1:0]  valid_fifo; 
reg [63:0]   req_fifo[N-1:0];    // request_fifo = {addr, dat_i}
reg [N-1:0]  we_fifo;            // write enable queue

// req_in
`define  SEL_POS  3:0
`define  DAT_POS  35:4
`define  ADR_POS  67:36

wire [63:0] req_in = {addr, dat_i, sel}; 

// initalize valid_fifo, we_fifo and perform shift_fifo
always @(posedge clk or posedge rst) begin
    if( rst ) begin
        valid_fifo <= N'b0;   // initialize
        we_fifo <= N'b0;
    end else begin
        valid_fifo <= {stb, valid_fifo[N-1:1]};
        we_fifo <= {we, we_fifo[N-1:1]};
    end
end

// shift req_fifo - it can be implemented with SRAM with read/write pointer
// but need to take care the 1T delay for read 
generate
    genvar j;
    for (j = 0; j < N-2; j = j + 1) begin : SHIFT_INST_GENERATE
      always @(posedge clk) begin
          req_fifo[j] <= req_fifo[j+1];
      end
    end
endgenerate

always @(posedge clk) begin 
    req_fifo[N-1] <= {addr, dat_i, sel};

//
// ack is generate 1T after valid_fifo[0] = 1 because BRAM read access take 1T delay
// 
reg ack;
always @(posedge clk or posedge rst) begin
    if( rst ) begin
        ack <= 0;
    end else
        ack <= valid_fifo[0];
end


// access bram - block ram 
wire wstrb = we_fifo[0];
wire valid = valid_fifo[0];
wire wbs_dat_i = req_fifo[0][`DAT_POS];
wire wbs_adr_i = req_fifo[0][`ADR_POS];
wire [31:0] rdata;
assign dat_o = rdata;
wire [3:0] byte_we = req_fifo[0][`SEL_POS] & 4{we_fifo[0]};

    bram user_bram (
        .CLK(clk),
        .WE0(byte_we),
        .EN0(valid_fifo[0]),
        .Di0(req_fifo[0][`DAT_POS]),
        .Do0(dat_o),
        .A0(req_fifo[0][`ADR_POS])
    );

endmodule

`default_nettype wire
