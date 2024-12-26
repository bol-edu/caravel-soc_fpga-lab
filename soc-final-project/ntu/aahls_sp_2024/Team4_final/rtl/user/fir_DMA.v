module fir_DMA(
    // Wishbone Slave ports (WB MI A)
    input         wb_clk_i,
    input         wb_rst_i, 
    input         wbs_stb_i,
    input         wbs_cyc_i,
    input         wbs_we_i,
    input  [3:0]  wbs_sel_i,
    input  [31:0] wbs_dat_i,
    input  [31:0] wbs_adr_i,
    output reg    wbs_ack_o,
    output [31:0] wbs_dat_o,
    
    // dma to arb
    output        dma_stb_i,
    output        dma_cyc_i,
    output        dma_we_i,
    output [3:0]  dma_sel_i,
    output [31:0] dma_dat_i,
    output [31:0] dma_adr_i,
    input         dma_ack_o,
    input  [31:0] dma_dat_o,

    // stream
    input         sm_tvalid,
    input  [31:0] sm_tdata,
    input         ss_tready,
    output        ss_tvalid,
    output [31:0] ss_tdata,
    output        sm_tready
);

    // local parameter definition
    localparam RESET = 2'b00;
    localparam IDLE  = 2'b01;
    localparam READ  = 2'b10;
    localparam WRITE = 2'b11;
    localparam XADDR = 32'h30000004; // base address of stream-in of X
    localparam YADDR = 32'h30000008; // base address of stream-out of Y
    localparam DATA_LEN = 64; // data length

    // Handshake signal
    // wire wb_hs = wbs_stb_i & wbs_cyc_i;

    // reg and wire definition
    reg [1:0] state, next_state;
    reg [31:0] read_buffer, write_buffer, read_buffer_nxt, write_buffer_nxt;
    reg        read_buf_full, read_buf_full_nxt, write_buf_full, write_buf_full_nxt;
    reg [31:0] w_addr_fir, w_addr_fir_nxt;

    // FSM
    always @(*) begin
        case(state)
            // if in reset and get 
            RESET: begin
                if (wbs_adr_i == 32'h30000000 && (wbs_dat_i == 32'h1)) next_state = IDLE;
                else next_state = state;
            end
            IDLE: begin
                if (Y_addr_fir >> 2 == DATA_LEN) next_state = RESET;
                else if (!read_buf_full) next_state = READ;
                else if (write_buf_full) next_state = WRITE;
                else                     next_state = state;
            end
            // when DMA in read state, wait SDRAM give dma_ack_o(meaning SDRAM has give back data)
            READ: begin
                if (dma_ack_o) next_state = IDLE;
                else           next_state = state;
            end
            // when DMA in write state, wait SDRAM give dma_ack_o(meaning SDRAM has give back data)
            WRITE: begin
                if (dma_ack_o) next_state = IDLE;
                else           next_state = state;
            end
        endcase
    end

    // read/write address
    // the write of AXILITE (coefficient) is not belongs to DMA.
    // READ. In read, we need to read stream-in of X.

    // remember the base address of stream-in of X. Address at XADDR in .c store the address of stream-in of X, so we remember this value as the start of read address.
    reg [31:0] X_real_addr_base_nxt, X_real_addr_base;
    reg wb_hs;
    reg wbs_ack_o_nxt;
    always@(*) begin
        wb_hs = wbs_stb_i & wbs_cyc_i & wbs_we_i;
        if (wb_hs && (wbs_adr_i == XADDR)) X_real_addr_base_nxt = wbs_dat_i;
        else                               X_real_addr_base_nxt = X_real_addr_base;
        wbs_ack_o_nxt = wb_hs && ((wbs_adr_i == XADDR) || (wbs_adr_i == YADDR));
    end 

    // after getting the base address of stream-in of X, receive accumulative stream-in X from SDRAM.
    reg [31:0] X_addr_fir_nxt, X_addr_fir;
    reg [31:0] X_real_addr_nxt, X_real_addr;

    always@(*) begin
        // if reset, read address accumulate from Q_real_addr_base
        X_real_addr = X_real_addr_base + X_addr_fir;

        if(state == RESET) begin
            X_addr_fir_nxt = 0;
        end else if(dma_ack_o && (state == READ)) begin
            X_addr_fir_nxt = X_addr_fir + 4;
        end else begin
            X_addr_fir_nxt = X_addr_fir;
        end
    end

    // write 
    // similar to read. First, remember the base address of stream-out of Y. Next, move the address of stream-out of Y progressively.
    reg [31:0] Y_real_addr_base_nxt, Y_real_addr_base, Y_real_addr;
    always@(*) begin
        if (wb_hs && (wbs_adr_i == YADDR)) Y_real_addr_base_nxt = wbs_dat_i;
        else                               Y_real_addr_base_nxt = Y_real_addr_base;
    end

    reg [31:0] Y_addr_fir_nxt, Y_addr_fir;
    always@(*) begin
        Y_real_addr = Y_real_addr_base + Y_addr_fir;

        if(state == RESET) begin
            Y_addr_fir_nxt = 0;
        end else if(dma_ack_o && (state == WRITE)) begin
            Y_addr_fir_nxt = Y_addr_fir + 4;
        end else begin
            Y_addr_fir_nxt = Y_addr_fir;
        end
    end

    always @(posedge wb_clk_i) begin
        if(wb_rst_i) begin
            X_real_addr_base <= 0;
            X_addr_fir      <= 0;
            Y_real_addr_base <= 0;
            Y_addr_fir      <= 0;
            wbs_ack_o       <= 0;
        end else begin
            X_real_addr_base <= X_real_addr_base_nxt;
            X_addr_fir      <= X_addr_fir_nxt;
            Y_real_addr_base <= Y_real_addr_base_nxt;
            Y_addr_fir      <= Y_addr_fir_nxt;
            wbs_ack_o       <= wbs_ack_o_nxt;
        end
    end
    
    // read/write buffer
    // if read buffer has something, meaning we can send data to engine, so raise ss_tvalid tell engine dma sends valid data. And the data is in read_buffer.
    assign ss_tvalid = read_buf_full;
    assign ss_tdata  = read_buffer;

    // if write buffer is empty, meaning we can receive data from engine, so raise sm_tready tell engine dma is ready to receive data.
    assign sm_tready = !write_buf_full;

    always@(*) begin
        if (state == RESET) begin
            write_buf_full_nxt = 0;
            write_buffer_nxt = 0;
        end else if (!write_buf_full && sm_tvalid) begin
            write_buf_full_nxt = 1;
            write_buffer_nxt = sm_tdata;
        end else if (write_buf_full && dma_ack_o && (state == WRITE)) begin
            write_buf_full_nxt = 0;
            write_buffer_nxt = 0;
        end else begin
            write_buf_full_nxt = write_buf_full;
            write_buffer_nxt = write_buffer;
        end
    end

    always@(*) begin
        if (state == RESET) begin
            read_buf_full_nxt = 0;
            read_buffer_nxt = 0;
        end else if (!read_buf_full && ss_tready) begin
            read_buf_full_nxt = 1;
            read_buffer_nxt = ss_tdata;
        end else if (read_buf_full && dma_ack_o && (state == READ)) begin
            read_buf_full_nxt = 0;
            read_buffer_nxt = 0;
        end else begin
            read_buf_full_nxt = read_buf_full;
            read_buffer_nxt = read_buffer;
        end
    end

    always @(posedge wb_clk_i) begin
        if(wb_rst_i) begin
            read_buf_full <= 0;
            read_buffer <= 0;
            write_buf_full <= 0;
            write_buffer <= 0;
            state <= RESET;
        end else begin
            read_buf_full <= read_buf_full_nxt;
            read_buffer <= read_buffer_nxt;
            write_buf_full <= write_buf_full_nxt;
            write_buffer <= write_buffer_nxt;
            state <= next_state;
        end
    end


    // interface signal to arbiter
    // if we need read or write, raise dma_stb_i and dma_cyc_i.(Why?)
    assign dma_stb_i = (state == READ || state == WRITE);
    assign dma_cyc_i = (state == READ || state == WRITE);

    // if we need write, raise dma_we_i.
    assign dma_we_i  = (state == WRITE);

    // What is this?
    assign dma_sel_i = 4'b1111;

    // write data is in write buffer
    assign dma_dat_i = write_buffer;

    // address depend on write or read (original grammer is weird)
    assign dma_adr_i = (state == READ) ?  X_real_addr :
                       (state == WRITE) ? Y_real_addr : 
                       32'b0;


endmodule