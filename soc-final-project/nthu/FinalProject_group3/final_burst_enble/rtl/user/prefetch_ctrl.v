`default_nettype wire

// Prefetch controller
module prefetch_ctrl (
    input         wb_clk_i,
    input         wb_rst_i,
    input         wbs_stb_i,
    input         wbs_cyc_i,
    //input [31:0]  wbs_dat_i,  // May not be used since data will save in buffer
    input  [31:0] wbs_adr_i,    // Decode it (init_addr(W)/Read(R)/Check the hit)
    output        wbs_ack_o,    // If HIT, return 1 and the data
    //output [31:0] wbs_dat_o,  // May not be used since data will save/read in/from buffer
    output [31:0] addr2ram,     // Address for prefetching data from SDRAM or store data
    
//============= Initialize ==============//
    input  [31:0] dma_init_addr_FIR,
    input  [31:0] dma_init_addr_QS,
    input  [31:0] dma_init_addr_MM,
    input  [2:0]  init_ready,
//=======================================//

//============= Nop index ===============//
    output [3:0]  mis_idx_FIR,
    output [3:0]  mis_idx_QS,
    output [3:0]  mis_idx_MM,
//=======================================//
        
    input  [2:0]  f_ack,        // Prefetch ACK from SDRAM
    
    input         busy,         // From buffer, means that buffer is prefetching the data
    output [5:0]  state_reg,    // Send to buffer
    output [2:0]  hit,          // If hit, we should terminate the WB flowing into SDRAM and return ack
    
    output [2:0]  burst_req,
    
    output        start,        // Tell CPU to start (ap_start)
    
    input         arb_choose
);

//|-------------------------------------- SPEC ------------------------------------------\ 
//|INITready|   FIR       |  QS         |  MM       |           Signal from DMA          |
//|BIT      |   2         |  1          |  0        |                                    |
//+---------+-------------+-------------+-----------+------------+-----------+-----------+
//|MEET/HIT |   FIR       |  QS         |  MM       |  Check if meet the data in buffer  |
//|BIT      |   2         |  1          |  0        |                                    |
//+---------+-------------+-------------+-----------+------------+-----------+-----------+
//|FetchACK |   FIR       |  QS         |  MM       | The ACK signal of fetching request |
//|BIT      |   2         |  1          |  0        |                                    |
//+---------+-------------+-------------+-----------+------------+-----------+-----------+
//|STAT_REG |   FIR FULL  |  FIR empty  |  QS FULL  |  QS empty  |  MM FULL  |  MM empty |
//|BIT      |   5         |  4          |  3        |  2         |  1        |  0        |
//+---------+-------------+-------------+-----------+------------+-----------+-----------+
//|Module   |     FIR     |     QS      |    MM     |                                    |
//|Address  |  3800_1000  |  3800_1180  | 3800_1100 |                                    |
//|Length   |     64      |     10      |    32     |                                    |
//+---------+-------------+-------------+-----------+------------+-----------+-----------+
//|===================================== Setup ==========================================| 
//| 1. Data will store in SDRAM first                                                    |
//| 2. After we get the initial address => start prefetch                                |
//| 3. If nop==8, stop the prefetch of that buffer (State set to FULL)                   | 
//| 3. After all prefetch buffer is "FULL", call ap_start                                |
//|==================================== Running =========================================|
//| 1. If input address meet the saving address => HIT                                   |
//| 2. If HIT, terminate the wishbone read request by sending the ack immediately        |
//| 3. Also send the data in buffer => saving address +4 => prefetch data from SDRAM     |
//| 4. NOP-1, send a read request into SDRAM_controller, wait for ctrl_out_valid         |
//|--------------------------------------------------------------------------------------|
 
    reg  [5:0]  pref_state;
    wire [5:0]  state_reg = pref_state;

// Initial address buffer for prefetch buffer
    wire [31:0] init_addr_FIR = dma_init_addr_FIR;
    wire [31:0] init_addr_QS  = dma_init_addr_QS;
    wire [31:0] init_addr_MM  = dma_init_addr_MM;
    wire [2:0]  init_ready;  // DMA will gives us the directly initial address

// When Setup, save initial address in buffer such that we can use when running
    reg  [31:0] save_addr_FIR;
    reg  [31:0] save_addr_QS;
    reg  [31:0] save_addr_MM;
    reg  [31:0] next_save_addr_FIR;
    reg  [31:0] next_save_addr_QS;
    reg  [31:0] next_save_addr_MM;
    
    reg  [31:0] adr_ptr_FIR;
    reg  [31:0] adr_ptr_QS;
    reg  [31:0] adr_ptr_MM;
    reg  [31:0] next_adr_ptr_FIR;
    reg  [31:0] next_adr_ptr_QS;
    reg  [31:0] next_adr_ptr_MM;
    
    reg  [5:0]  addr_cnt_FIR; // length of 64
    reg  [3:0]  addr_cnt_QS;  // length of 10
    reg  [4:0]  addr_cnt_MM;  // length of 32
    
    wire [2:0]  meet;
    
    reg  ack_q;
    wire ack_d;
    assign wbs_ack_o = ack_q;
//================ Check the Meet ======================//
    assign meet[2] = (wbs_adr_i == adr_ptr_FIR && ~pref_state[4])? 1 : 0;
    assign meet[1] = (wbs_adr_i == adr_ptr_QS  && ~pref_state[2])? 1 : 0;
    assign meet[0] = (wbs_adr_i == adr_ptr_MM  && ~pref_state[0])? 1 : 0;
    assign hit = meet;
    
    assign ack_d = (|meet)? 1 : 0;
    /*
    always @* begin
        if (run && meet[2] && ~pref_state[4]) next_adr_ptr_FIR = adr_ptr_FIR + 3'd4;
        if (run && meet[1] && ~pref_state[2]) next_adr_ptr_QS  = adr_ptr_QS  + 3'd4;
        if (run && meet[0] && ~pref_state[0]) next_adr_ptr_MM  = adr_ptr_MM  + 3'd4;
    end
    */
    always @* begin
    	next_adr_ptr_FIR = adr_ptr_FIR;
    	next_adr_ptr_QS = adr_ptr_QS;
    	next_adr_ptr_MM = adr_ptr_MM;
    end
    
    always @(posedge wb_clk_i) begin
    	if (wb_rst_i) begin
    	    adr_ptr_FIR <= 32'd0;
    	    adr_ptr_QS  <= 32'd0;
    	    adr_ptr_MM  <= 32'd0;
    	    ack_q       <= 1'b0;
    	end
    	else begin
    	    if (run && meet[2] && ~pref_state[4])
    	        adr_ptr_FIR <= next_adr_ptr_FIR + 4;
    	    else
    	        adr_ptr_FIR <= next_adr_ptr_FIR;
    	    
    	    if (run && meet[1] && ~pref_state[2])
    	        adr_ptr_QS  <= next_adr_ptr_QS + 4;
    	    else
    	        adr_ptr_QS  <= next_adr_ptr_QS; 
    	    if (run && meet[0] && ~pref_state[0])
    	        adr_ptr_MM  <= next_adr_ptr_MM + 4;
    	    else
    	        adr_ptr_MM  <= next_adr_ptr_MM;
    	    ack_q       <= ack_d;
    	end
    end
    
    
//=============== Index of Prefetch Buffer =============//
    reg  [3:0]      nop_FIR,     nop_QS,     nop_MM; // For missing address in prefetch
    reg  [3:0]  tmp_nop_FIR, tmp_nop_QS, tmp_nop_MM;
    wire [3:0]  mis_idx_FIR, mis_idx_QS, mis_idx_MM;
    assign mis_idx_FIR = nop_FIR;
    assign mis_idx_QS  = nop_QS;
    assign mis_idx_MM  = nop_MM;
    
//=================== Setup signal =====================//
    wire        SetupFull;  // All buffers are FULL when setup
    reg         run;        // If prefetch buffers are FULL when setup => 1
    reg  [2:0]  initialize; // State to check whether initial address have set
    reg  [2:0]  tmp_initialize;
    assign start = run;
    
    localparam BRST_LEN = 8;
    localparam IDLE	 = 3'd0;
    localparam FIR_BRST = 3'd1;
    localparam QS_BRST  = 3'd2;
    localparam MM_BRST  = 3'd3;
    localparam WAIT 	 = 3'd4;
    
    reg  [2:0]  state;
    reg  [2:0]  next_state;
    reg  [4:0]  brst_cnt_q, brst_cnt_d;
    reg         request;  // sent the burst request
    reg  [2:0]  bursting;
    reg [31:0]  brst_adr;
    assign burst_req = bursting;
    assign addr2ram  = brst_adr;
//====================== Setup =========================//
    assign SetupFull = (~run && pref_state[5] && pref_state[3] && pref_state[1])? 1 : 0;
    always @(posedge wb_clk_i) begin
        if      (wb_rst_i)  run <= 0;
        else if (SetupFull) run <= 1;
    end
    
    localparam INST = 1'b1;
    localparam BUFF = 1'b0;
    
    always @* begin
    	case (state)
    	    IDLE: begin
    	    	if      (pref_state[4] && (initialize == 3'b111) && ~arb_choose) next_state = FIR_BRST;
    	    	else if (pref_state[0] && (initialize == 3'b111) && ~arb_choose) next_state = MM_BRST;
    	    	else if (pref_state[2] && (initialize == 3'b111) && ~arb_choose) next_state = QS_BRST;
    	    	else 			                           next_state = state;
    	    	brst_cnt_d = BRST_LEN;
    	    	bursting   = 3'b000;
    	    	brst_adr   = 32'd0;
    	    end
    	    FIR_BRST: begin
    	    	if (f_ack[2] && burst_req[2] && ~arb_choose) begin
    	    	    next_state         = WAIT;
    	    	    brst_cnt_d         = brst_cnt_q - 1'b1;
    	    	    next_save_addr_FIR = save_addr_FIR + 4;
    	    	end
    	    	bursting[2] = 1;
    	    	request     = 1;
    	    	brst_adr    = save_addr_FIR;
    	    end
    	    QS_BRST: begin
    	    	if (f_ack[1] && burst_req[1] && ~arb_choose) begin
    	    	    next_state        = WAIT;
    	    	    brst_cnt_d        = brst_cnt_q - 1'b1;
    	    	    next_save_addr_QS = save_addr_QS + 4;
    	    	end
    	    	bursting[1] = 1;
    	    	request     = 1;
    	    	brst_adr    = save_addr_QS;
    	    end
    	    MM_BRST: begin
    	    	if (f_ack[0] && burst_req[0] && ~arb_choose) begin
    	    	    next_state        = WAIT;
    	    	    brst_cnt_d        = brst_cnt_q - 1'b1;
    	    	    next_save_addr_MM = save_addr_MM + 4;
    	    	end
    	    	bursting[0] = 1;
    	    	request     = 1;
    	    	brst_adr    = save_addr_MM;
    	    end
    	    WAIT: begin
    	    	if (|f_ack && (brst_cnt_q != 0)) brst_cnt_d = brst_cnt_q - 1'b1;
    	    	else        brst_cnt_d = brst_cnt_q;
    	    	if (f_ack[2] && burst_req[2] && (brst_cnt_q != 0)) begin
    	    	    next_save_addr_FIR = save_addr_FIR + 4;
    	    	    brst_adr           = save_addr_FIR;
    	    	end 
    	    	else if (f_ack[1] && burst_req[1]&& (brst_cnt_q != 0)) begin
    	    	    next_save_addr_QS  = save_addr_QS  + 4;
    	    	    brst_adr           = save_addr_QS;
    	    	end
    	    	else if (f_ack[0] && burst_req[0]&& (brst_cnt_q != 0)) begin
    	    	    next_save_addr_MM  = save_addr_MM  + 4;
    	    	    brst_adr           = save_addr_MM;
    	    	end
    	    	else begin 
    	    	    next_save_addr_FIR = save_addr_FIR;
    	    	    next_save_addr_QS  = save_addr_QS;                       
    	    	    next_save_addr_MM  = save_addr_MM;
    	    	end
    	    	if (brst_cnt_q == 0) next_state = IDLE;
    	    	else                 next_state = state;
    	    end
    	    default: begin
    	    	if      (pref_state[4] && (initialize == 3'b111) && ~arb_choose) next_state = FIR_BRST;
    	    	else if (pref_state[0] && (initialize == 3'b111) && ~arb_choose) next_state = MM_BRST;
    	    	else if (pref_state[2] && (initialize == 3'b111) && ~arb_choose) next_state = QS_BRST;
    	    	else 			                           next_state = state;
    	    	brst_cnt_d = BRST_LEN;
    	    	bursting   = 3'b000;
    	    	brst_adr   = 32'd0;
    	    end
    	endcase
    end
//======================================================//

    always @* begin
//================ FIR initialize addr =================//
        // Load the initial address
        if (init_ready[2] && ~initialize[2]) begin
            next_save_addr_FIR = init_addr_FIR;
            next_adr_ptr_FIR   = init_addr_FIR;
            tmp_initialize[2]  = 1;
        end
        else tmp_initialize[2] = initialize[2];
//================ QS initialize addr  =================//
        if (init_ready[1] && ~initialize[1]) begin
            next_save_addr_QS = init_addr_QS;
            next_adr_ptr_QS   = init_addr_QS;
            tmp_initialize[1] = 1;
        end 
        else tmp_initialize[1] = initialize[1];
//================ MM initialize addr  =================//
        if (init_ready[0] && ~initialize[0]) begin
            next_save_addr_MM = init_addr_MM;
            next_adr_ptr_MM   = init_addr_MM;
            tmp_initialize[0] = 1;
        end
        else tmp_initialize[0] = initialize[0];
    end
    
    always @(posedge wb_clk_i) begin
        if (wb_rst_i) begin
            save_addr_FIR <= 32'd0;
            save_addr_QS  <= 32'd0;
            save_addr_MM  <= 32'd0;
            initialize    <= 3'b000;
            brst_cnt_q    <= BRST_LEN;
            state	   <= IDLE;
        end
        else begin  // Saved Address will +4 when prefetching data
            save_addr_FIR <= next_save_addr_FIR;
            save_addr_QS  <= next_save_addr_QS;
            save_addr_MM  <= next_save_addr_MM;
            initialize    <= tmp_initialize;
            brst_cnt_q    <= brst_cnt_d;
            state         <= next_state;
        end
    end
    
    // Empty or FULL
    always @(posedge  wb_clk_i) begin
        if (wb_rst_i) begin
            pref_state[5:4] <= 2'b01; // FIR
            pref_state[3:2] <= 2'b01; // QS
            pref_state[1:0] <= 2'b01; // MM
        end
        else begin
            if (nop_FIR == 8) pref_state[5] <= 1;
            else              pref_state[5] <= 0;
            if (nop_FIR == 0) pref_state[4] <= 1;
            else              pref_state[4] <= 0;
            if (nop_QS  == 8) pref_state[3] <= 1;
            else              pref_state[3] <= 0;
            if (nop_QS  == 0) pref_state[2] <= 1;
            else              pref_state[2] <= 0;
            if (nop_MM  == 8) pref_state[1] <= 1;
            else              pref_state[1] <= 0;
            if (nop_MM  == 0) pref_state[0] <= 1;
            else              pref_state[0] <= 0;
        end
    end
    
    // Prefetch DATA
    always @* begin
        // FIR
        if (nop_FIR == 4'd0)
            if (meet[2]) // Will not trigger since we don't have data in buffer
                tmp_nop_FIR = 4'd0;
            else
                if (f_ack[2] && burst_req[2])
                    tmp_nop_FIR = nop_FIR + 1'b1;
                else
                    tmp_nop_FIR = nop_FIR;
        else
            if (meet[2])
                if (f_ack[2] && burst_req[2])
                    tmp_nop_FIR = nop_FIR;
                else
                    tmp_nop_FIR = nop_FIR - 1'b1;
            else
                if (f_ack[2] && burst_req[2] && (nop_FIR != 4'd8)) // Will not trigger since our buffer is FULL
                    tmp_nop_FIR = nop_FIR + 1'b1;
                else
                    tmp_nop_FIR = nop_FIR;
        // QS
        if (nop_QS == 4'd0)
            if (meet[1]) // Will not trigger since we don't have data in buffer
                tmp_nop_QS = 4'd0;
            else
                if (f_ack[1] && burst_req[1])
                    tmp_nop_QS = nop_QS + 1'b1;
                else
                    tmp_nop_QS = nop_QS;
        else
            if (meet[1])
                if (f_ack[1] && burst_req[1])
                    tmp_nop_QS = nop_QS;
                else
                    tmp_nop_QS = nop_QS - 1'b1;
            else
                if (f_ack[1] && burst_req[1] && (nop_QS != 4'd8)) // Will not trigger since our buffer is FULL
                    tmp_nop_QS = nop_QS + 1'b1;
                else
                    tmp_nop_QS = nop_QS;
        // MM
        if (nop_MM == 4'd0)
            if (meet[0]) // Will not trigger since we don't have data in buffer
                tmp_nop_MM = 4'd0;
            else
                if (f_ack[0] && burst_req[0])
                    tmp_nop_MM = nop_MM + 1'b1;
                else
                    tmp_nop_MM = nop_MM;
        else
            if (meet[0])
                if (f_ack[0] && burst_req[0])
                    tmp_nop_MM = nop_MM;
                else
                    tmp_nop_MM = nop_MM - 1'b1;
            else
                if (f_ack[0] && burst_req[0] && (nop_MM != 4'd8)) // Will not trigger since our buffer is FULL
                    tmp_nop_MM = nop_MM + 1'b1;
                else
                    tmp_nop_MM = nop_MM;
    end
    
    always @(posedge wb_clk_i) begin
        if (wb_rst_i) begin
            nop_FIR <= 4'd0;
            nop_QS  <= 4'd0;
            nop_MM  <= 4'd0;
        end
        else begin
            nop_FIR <= tmp_nop_FIR;
            nop_QS  <= tmp_nop_QS;
            nop_MM  <= tmp_nop_MM;
        end
    end
    
    /*
//================= Arb Sent the Prefetch ==================//
    reg  [31:0] addr_fifo[0:2];
    wire [31:0] arb_addr;
    reg  [1:0]  arb_cnt;
    
    //assign addr2ram = addr_fifo[0];
      
    assign arb_addr = (nop_FIR < nop_MM)? save_addr_FIR + 4 * (nop_FIR - 1) : 
                      (nop_MM  < nop_QS)? save_addr_MM  + 4 * (nop_MM - 1) : 
                                          save_addr_QS  + 4 * (nop_QS - 1);
    */
    /*
    always @(posedge clk) begin
        if (rst) begin
            for (integer i = 0; i < 3; i = i + 1) begin
                addr_fifo[i] <= 0;
            end
        end
        else begin
            if (f_ack[2] || f_ack[1] || f_ack[0]) begin
                addr_fifo[0] <= addr_fifo[1];
                addr_fifo[1] <= addr_fifo[2];
                addr_fifo[2] <= arb_addr;
            end
        end
    end
    */

endmodule
