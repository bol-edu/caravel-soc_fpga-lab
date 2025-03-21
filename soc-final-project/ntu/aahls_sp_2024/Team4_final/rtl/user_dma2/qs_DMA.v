 // This is a DMA for Qsort.
module qs_DMA #(
    parameter BITS = 32,
    parameter pADDR_WIDTH =12,
    parameter pDATA_WIDTH =32,
    parameter Tape_Num =11
)(

    // Wishbone Slave ports (WB MI A)
    input 		  wb_clk_i,
    input 		  wb_rst_i, 
    input 		  wbs_stb_i,
    input 		  wbs_cyc_i,
    input 		  wbs_we_i,
    input  [ 3:0] wbs_sel_i,
    input  [31:0] wbs_dat_i,
    input  [31:0] wbs_adr_i,
    output reg    wbs_ack_o,
    output [31:0] wbs_dat_o,
    
    // dma  to arb
    output 		   dma_stb_i,
    output 		   dma_cyc_i,
    output 		   dma_we_i,
    output  [ 3:0] dma_sel_i,
    output  [31:0] dma_dat_i,
    output  [31:0] dma_adr_i,
    input 		   dma_ack_o,
    input [31:0]   dma_dat_o,

    // stream
    input         sm_tvalid,
    input [31:0]  sm_tdata,
    input 		  ss_tready,
    output        ss_tvalid,
    output [31:0] ss_tdata,
    output        sm_tready
);

    // DMA has the following states.
    // 1. RESET: RESET
    // 2. IDLE: waiting
    // 3. r_ADDR: read data from SDRAM
    // 4. w_ADDR: write data to SDRAM

    // local parameter definition
    localparam RESET = 2'b00;
    localparam IDLE  = 2'b01;
    localparam READ  = 2'b10;
    localparam WRITE = 2'b11;
    localparam QADDR = 32'h30000080;
    localparam RADDR = 32'h30000090;
    localparam data_len = 10;

    // Handshake signal
    // wire wb_hs = wbs_stb_i & wbs_cyc_i;

    // reg wire definition
    reg        wbs_ack_o_nxt;
    reg        read_buf_full, write_buf_full, read_buf_full_nxt, write_buf_full_nxt;
    reg [ 1:0] state, next_state;
    reg [31:0] read_buffer, write_buffer;
    reg [31:0] read_buffer_nxt, write_buffer_nxt;
    reg [31:0] y_FF;  // Output data buffer

    reg [31:0] r_addr_counter, r_addr_counter_nxt;
    reg [31:0] w_addr_counter, w_addr_counter_nxt;
    reg [31:0] Q_real_addr_base,  Q_real_addr_base_nxt,  Q_real_addr;
    reg [31:0] QR_real_addr_base, QR_real_addr_base_nxt, QR_real_addr;
    reg wb_hs;

    // assign statements
    assign dma_stb_i = (state == READ || state == WRITE);
    assign dma_cyc_i = (state == READ || state == WRITE);
    assign dma_we_i  = (state == WRITE);
    assign dma_sel_i = 4'b1;
    assign dma_dat_i = write_buffer;
    assign dma_adr_i = (state == READ) ? Q_real_addr : 
                       (state == WRITE) ? QR_real_addr : 32'b0;
    // FSM
    always @(*) begin
        case(state)
            // if in reset and get 
            RESET: begin
                if (wbs_adr_i == 32'h30000000 && (wbs_dat_i == 32'h1)) next_state = IDLE; // #define reg_fir_control  (*(volatile uint32_t*)0x30000000)                else next_state = state;
                else next_state = state;
            end
            IDLE: begin
                if (w_addr_counter >> 2 == data_len) next_state = RESET;
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

    // prepare infos for read data from SDRAM
    // 1. read address. since use Stream, no address from engine. We need to count here.
    // Reset first. If ss_tready and we read data from SDRAM successfully, then add 4.
    // 30000080 only store the address of Q[0], so we need to fetch the address of Q[0] from 30000080 and store it at Q_real_addr.
    always@(*) begin
        wb_hs = wbs_stb_i & wbs_cyc_i & wbs_we_i;
        // input array address
        if (wb_hs && wbs_adr_i == QADDR) Q_real_addr_base_nxt = wbs_dat_i;
        else                             Q_real_addr_base_nxt = Q_real_addr_base;

        // output array address
        if (wb_hs && wbs_adr_i == RADDR) QR_real_addr_base_nxt = wbs_dat_i;
        else                             QR_real_addr_base_nxt = QR_real_addr_base;
        
        wbs_ack_o_nxt = wb_hs && (wbs_adr_i == QADDR || wbs_adr_i == RADDR);
    end

    // Signal that represent able to receive data from CPU
    always@(posedge wb_clk_i) begin
        if(wb_rst_i) begin
            wbs_ack_o <= 0;
            Q_real_addr_base <= 0;
            QR_real_addr_base <= 0;
        end else begin
            wbs_ack_o <= wbs_ack_o_nxt;
            Q_real_addr_base <= Q_real_addr_base_nxt;
            QR_real_addr_base <= QR_real_addr_base_nxt;
        end
    end

    always@(*) begin
        // if reset, read address accumulate from Q_real_addr_base
        Q_real_addr = Q_real_addr_base + r_addr_counter;

        if(state == RESET) begin
            r_addr_counter_nxt = 0;
        end else if(dma_ack_o && (state == READ)) begin
            r_addr_counter_nxt = r_addr_counter + 4;
        end else begin
            r_addr_counter_nxt = r_addr_counter;
        end
    end

    // prepare infos for write data to SDRAM
    // 1. write request. When receive sm_tvalid(write need from engine) and we have sm_tready, then send requestto SDRAM.
    // 2. write address. If we have write request, then also send address to SDRAM.
        
    always@(*) begin
        QR_real_addr = QR_real_addr_base + w_addr_counter;
        if(state == RESET) begin
            w_addr_counter_nxt = 0;
        end else if(dma_ack_o && (state == WRITE)) begin
            w_addr_counter_nxt = w_addr_counter + 4;
        end else begin
            w_addr_counter_nxt = w_addr_counter;
        end
    end

    // FFs
    always @(posedge wb_clk_i) begin
        if(wb_rst_i) begin
            state <= RESET;
            read_buf_full <= 0;
            read_buffer <= 0;
            write_buf_full <= 0;
            write_buffer <= 0;
            r_addr_counter <= 0;
            w_addr_counter <= 0;
            // y_FF <= 0;
        end else begin
            // y_FF <= y_FF_nxt;
            state <= next_state;
            read_buffer <= read_buffer_nxt;
            write_buffer <= write_buffer_nxt;
            read_buf_full <= read_buf_full_nxt;
            write_buf_full <= write_buf_full_nxt;
            r_addr_counter <= r_addr_counter_nxt;
            w_addr_counter <= w_addr_counter_nxt;
        end
    end

    // read/write buffer
    assign ss_tvalid = read_buf_full;
    assign sm_tready = !write_buf_full;
    assign ss_tdata = read_buffer;

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
        end else if (!read_buf_full && dma_ack_o && (state == READ)) begin
            read_buf_full_nxt = 1;
            read_buffer_nxt = dma_dat_o;
        end else if (read_buf_full && ss_tready) begin
            read_buf_full_nxt = 0;
            read_buffer_nxt = 0;
        end else begin
            read_buf_full_nxt = read_buf_full;
            read_buffer_nxt = read_buffer;
        end
    end

    // always @(posedge wb_clk_i) begin
    //     if(wb_rst_i) begin
    //         read_buffer    <= 0;
    //         write_buffer   <= 0;
    //         read_buf_full  <= 0;
    //         write_buf_full <= 0;
    //     end else begin
    //         read_buffer    <= read_buffer_nxt;
    //         write_buffer   <= write_buffer_nxt;
    //         read_buf_full  <= read_buf_full_nxt;
    //         write_buf_full <= write_buf_full_nxt;
    //     end
    // end
endmodule