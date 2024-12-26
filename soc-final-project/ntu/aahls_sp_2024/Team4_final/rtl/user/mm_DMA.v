module mm_DMA #(
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
    output        dma_stb_i,
    output        dma_cyc_i,
    output        dma_we_i,
    output [ 3:0] dma_sel_i,
    output [31:0] dma_dat_i,
    output [31:0] dma_adr_i,
    input 		  dma_ack_o,
    input  [31:0] dma_dat_o,

    // stream
    input         sm_tvalid,
    input [31:0]  sm_tdata,
    input 		  ss_tready,
    output        ss_tvalid,
    output [31:0] ss_tdata,
    output        sm_tready
);

    localparam RESET = 0;
    localparam IDLE  = 1;
    localparam READ  = 2;
    localparam WRITE = 3;
    localparam AADDR = 32'h30000084;
    localparam BADDR = 32'h30000088;
    localparam CADDR = 32'h3000008c;
    localparam data_len = 15;


    // reg wire definition
    reg [1:0] state, next_state;
    reg [31:0] r_addr_counter, r_addr_counter_nxt;
    reg [31:0] w_addr_counter, w_addr_counter_nxt;
    wire [31:0] r_real_addr;
    wire [31:0] w_real_addr;
    reg a_b_state, a_b_state_nxt;

    // FSM
    always @(*) begin
        case(state)
            // if in reset and get 
            RESET: begin
                if (wbs_adr_i == 32'h0 && (wbs_dat_i == 32'h1)) next_state = IDLE;
                else next_state = state;
            end
            IDLE: begin
                if ((w_real_addr - 4) >> 2 == data_len) next_state = RESET;
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
    assign wb_hs = wbs_stb_i & wbs_cyc_i & wbs_we_i; // why need wbs_we_i

    // when handshake and the address from CPU is as same as AADDR(where stores the address of A matrix), then update A_real_addr as the value in AADDR. So does B and C.
    // Also, we need raise wbs_ack_o to tell CPU that we have received the address. (TODO: may raise one cycle ahead?)
    reg [31:0] A_real_addr_base_nxt, A_real_addr_base;
    reg [31:0] B_real_addr_base_nxt, B_real_addr_base;
    reg [31:0] C_real_addr_base_nxt, C_real_addr_base;
    reg wbs_ack_o_nxt;
    always@(*) begin
        if (wb_hs && (wbs_adr_i == AADDR)) A_real_addr_base_nxt = wbs_dat_i;
        else                               A_real_addr_base_nxt = A_real_addr_base;
        if (wb_hs && (wbs_adr_i == BADDR)) B_real_addr_base_nxt = wbs_dat_i;
        else                               B_real_addr_base_nxt = B_real_addr_base;
        if (wb_hs && (wbs_adr_i == CADDR)) C_real_addr_base_nxt = wbs_dat_i;
        else                               C_real_addr_base_nxt = C_real_addr_base;
        
        wbs_ack_o_nxt = wb_hs && ((wbs_adr_i == AADDR) || (wbs_adr_i == BADDR) || (wbs_adr_i == CADDR));
    end


    // address counter for fetching data from SDRAM
    // reg [31:0] a_addr_counter, a_addr_counter_nxt;
    // reg [31:0] b_addr_counter, b_addr_counter_nxt;
    // reg [31:0] c_addr_counter, c_addr_counter_nxt;



    assign r_real_addr = a_b_state? (A_real_addr_base + r_addr_counter) : (B_real_addr_base + r_addr_counter);
    assign w_real_addr = C_real_addr_base + w_addr_counter;

    always@(*) begin
        if (state == RESET) begin
            r_addr_counter_nxt = 0;
            a_b_state_nxt = 1;
        end else if (dma_ack_o && (state == READ)) begin
            if (r_addr_counter >> 2 == data_len) begin
                r_addr_counter_nxt = 0;
                a_b_state_nxt = ~a_b_state;
            end else begin  
                r_addr_counter_nxt = r_addr_counter + 4;
                a_b_state_nxt = a_b_state;
            end
        end else begin
            r_addr_counter_nxt = r_addr_counter;
            a_b_state_nxt = a_b_state;
        end
    end

    always@(*) begin
        if (state == RESET) begin
            w_addr_counter_nxt = 0;
        end else if (dma_ack_o && (state == WRITE)) begin
            w_addr_counter_nxt = w_addr_counter + 4;
        end else begin
            w_addr_counter_nxt = w_addr_counter;
        end
    end



    always @(posedge wb_clk_i) begin
        if (wb_rst_i) begin
            r_addr_counter <= 0;
            w_addr_counter <= 0;
            a_b_state <= 1;
            A_real_addr_base <= 0;
            B_real_addr_base <= 0;
            C_real_addr_base <= 0;
        end else begin
            r_addr_counter <= r_addr_counter_nxt;
            w_addr_counter <= w_addr_counter_nxt;
            a_b_state <= a_b_state_nxt;
            A_real_addr_base <= A_real_addr_base_nxt;
            B_real_addr_base <= B_real_addr_base_nxt;
            C_real_addr_base <= C_real_addr_base_nxt;
        end
    end

    always @(posedge wb_clk_i) begin
        if(wb_rst_i) begin
            state <= RESET;
            wbs_ack_o   <= 0;
        end else begin
            state <= next_state;
            wbs_ack_o   <= wbs_ack_o_nxt;
        end
    end


    // interface signal to arbiter
    // if we need read or write, raise dma_stb_i and dma_cyc_i.(Why?)
    assign dma_stb_i = (state == READ || state == WRITE);
    assign dma_cyc_i = (state == READ || state == WRITE);

    // if we need write, raise dma_we_i.
    assign dma_we_i  = (state == WRITE);

    // What is this?
    assign dma_sel_i = 4'b1;

    // write data is in write buffer
    assign dma_dat_i = write_buffer;

    // address depend on write or read (original grammer is weird)
    assign dma_adr_i = (state == READ) ?  r_real_addr :
                       (state == WRITE) ? w_real_addr : 
                       32'b0;

    
    // read/write buffer
    reg read_buf_full, read_buf_full_nxt;
    reg write_buf_full, write_buf_full_nxt;
    reg [31:0] read_buffer, read_buffer_nxt;
    reg [31:0] write_buffer, write_buffer_nxt;

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
        end else begin
            read_buf_full <= read_buf_full_nxt;
            read_buffer <= read_buffer_nxt;
            write_buf_full <= write_buf_full_nxt;
            write_buffer <= write_buffer_nxt;
        end
    end
endmodule