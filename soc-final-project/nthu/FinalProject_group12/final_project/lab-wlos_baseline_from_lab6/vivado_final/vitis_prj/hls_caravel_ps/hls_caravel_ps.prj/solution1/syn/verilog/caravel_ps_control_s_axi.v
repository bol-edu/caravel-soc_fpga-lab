// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module caravel_ps_control_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 6,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire [37:0]                   ps_mprj_in,
    input  wire [37:0]                   ps_mprj_out,
    input  wire                          ps_mprj_out_ap_vld,
    input  wire [37:0]                   ps_mprj_en,
    input  wire                          ps_mprj_en_ap_vld
);
//------------------------Address Info-------------------
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of ps_mprj_in
//        bit 31~0 - ps_mprj_in[31:0] (Read/Write)
// 0x14 : Data signal of ps_mprj_in
//        bit 5~0 - ps_mprj_in[37:32] (Read/Write)
//        others  - reserved
// 0x18 : reserved
// 0x1c : Data signal of ps_mprj_out
//        bit 31~0 - ps_mprj_out[31:0] (Read)
// 0x20 : Data signal of ps_mprj_out
//        bit 5~0 - ps_mprj_out[37:32] (Read)
//        others  - reserved
// 0x24 : Control signal of ps_mprj_out
//        bit 0  - ps_mprj_out_ap_vld (Read/COR)
//        others - reserved
// 0x34 : Data signal of ps_mprj_en
//        bit 31~0 - ps_mprj_en[31:0] (Read)
// 0x38 : Data signal of ps_mprj_en
//        bit 5~0 - ps_mprj_en[37:32] (Read)
//        others  - reserved
// 0x3c : Control signal of ps_mprj_en
//        bit 0  - ps_mprj_en_ap_vld (Read/COR)
//        others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_PS_MPRJ_IN_DATA_0  = 6'h10,
    ADDR_PS_MPRJ_IN_DATA_1  = 6'h14,
    ADDR_PS_MPRJ_IN_CTRL    = 6'h18,
    ADDR_PS_MPRJ_OUT_DATA_0 = 6'h1c,
    ADDR_PS_MPRJ_OUT_DATA_1 = 6'h20,
    ADDR_PS_MPRJ_OUT_CTRL   = 6'h24,
    ADDR_PS_MPRJ_EN_DATA_0  = 6'h34,
    ADDR_PS_MPRJ_EN_DATA_1  = 6'h38,
    ADDR_PS_MPRJ_EN_CTRL    = 6'h3c,
    WRIDLE                  = 2'd0,
    WRDATA                  = 2'd1,
    WRRESP                  = 2'd2,
    WRRESET                 = 2'd3,
    RDIDLE                  = 2'd0,
    RDDATA                  = 2'd1,
    RDRESET                 = 2'd2,
    ADDR_BITS                = 6;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg  [37:0]                   int_ps_mprj_in = 'b0;
    reg                           int_ps_mprj_out_ap_vld;
    reg  [37:0]                   int_ps_mprj_out = 'b0;
    reg                           int_ps_mprj_en_ap_vld;
    reg  [37:0]                   int_ps_mprj_en = 'b0;

//------------------------Instantiation------------------


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_PS_MPRJ_IN_DATA_0: begin
                    rdata <= int_ps_mprj_in[31:0];
                end
                ADDR_PS_MPRJ_IN_DATA_1: begin
                    rdata <= int_ps_mprj_in[37:32];
                end
                ADDR_PS_MPRJ_OUT_DATA_0: begin
                    rdata <= int_ps_mprj_out[31:0];
                end
                ADDR_PS_MPRJ_OUT_DATA_1: begin
                    rdata <= int_ps_mprj_out[37:32];
                end
                ADDR_PS_MPRJ_OUT_CTRL: begin
                    rdata[0] <= int_ps_mprj_out_ap_vld;
                end
                ADDR_PS_MPRJ_EN_DATA_0: begin
                    rdata <= int_ps_mprj_en[31:0];
                end
                ADDR_PS_MPRJ_EN_DATA_1: begin
                    rdata <= int_ps_mprj_en[37:32];
                end
                ADDR_PS_MPRJ_EN_CTRL: begin
                    rdata[0] <= int_ps_mprj_en_ap_vld;
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign ps_mprj_in = int_ps_mprj_in;
// int_ps_mprj_in[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_ps_mprj_in[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_PS_MPRJ_IN_DATA_0)
            int_ps_mprj_in[31:0] <= (WDATA[31:0] & wmask) | (int_ps_mprj_in[31:0] & ~wmask);
    end
end

// int_ps_mprj_in[37:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_ps_mprj_in[37:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_PS_MPRJ_IN_DATA_1)
            int_ps_mprj_in[37:32] <= (WDATA[31:0] & wmask) | (int_ps_mprj_in[37:32] & ~wmask);
    end
end

// int_ps_mprj_out
always @(posedge ACLK) begin
    if (ARESET)
        int_ps_mprj_out <= 0;
    else if (ACLK_EN) begin
        if (ps_mprj_out_ap_vld)
            int_ps_mprj_out <= ps_mprj_out;
    end
end

// int_ps_mprj_out_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_ps_mprj_out_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (ps_mprj_out_ap_vld)
            int_ps_mprj_out_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_PS_MPRJ_OUT_CTRL)
            int_ps_mprj_out_ap_vld <= 1'b0; // clear on read
    end
end

// int_ps_mprj_en
always @(posedge ACLK) begin
    if (ARESET)
        int_ps_mprj_en <= 0;
    else if (ACLK_EN) begin
        if (ps_mprj_en_ap_vld)
            int_ps_mprj_en <= ps_mprj_en;
    end
end

// int_ps_mprj_en_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_ps_mprj_en_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (ps_mprj_en_ap_vld)
            int_ps_mprj_en_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_PS_MPRJ_EN_CTRL)
            int_ps_mprj_en_ap_vld <= 1'b0; // clear on read
    end
end


//------------------------Memory logic-------------------

endmodule
