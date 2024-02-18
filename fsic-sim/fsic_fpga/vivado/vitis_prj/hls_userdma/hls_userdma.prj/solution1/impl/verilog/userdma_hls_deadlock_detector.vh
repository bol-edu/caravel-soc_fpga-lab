
    wire dl_reset;
    wire dl_clock;
    assign dl_reset = ap_rst_n;
    assign dl_clock = ap_clk;
    wire [3:0] proc_0_data_FIFO_blk;
    wire [3:0] proc_0_data_PIPO_blk;
    wire [3:0] proc_0_start_FIFO_blk;
    wire [3:0] proc_0_TLF_FIFO_blk;
    wire [3:0] proc_0_input_sync_blk;
    wire [3:0] proc_0_output_sync_blk;
    wire [3:0] proc_dep_vld_vec_0;
    reg [3:0] proc_dep_vld_vec_0_reg;
    wire [3:0] in_chan_dep_vld_vec_0;
    wire [19:0] in_chan_dep_data_vec_0;
    wire [3:0] token_in_vec_0;
    wire [3:0] out_chan_dep_vld_vec_0;
    wire [4:0] out_chan_dep_data_0;
    wire [3:0] token_out_vec_0;
    wire dl_detect_out_0;
    wire dep_chan_vld_1_0;
    wire [4:0] dep_chan_data_1_0;
    wire token_1_0;
    wire dep_chan_vld_2_0;
    wire [4:0] dep_chan_data_2_0;
    wire token_2_0;
    wire dep_chan_vld_3_0;
    wire [4:0] dep_chan_data_3_0;
    wire token_3_0;
    wire dep_chan_vld_4_0;
    wire [4:0] dep_chan_data_4_0;
    wire token_4_0;
    wire [3:0] proc_1_data_FIFO_blk;
    wire [3:0] proc_1_data_PIPO_blk;
    wire [3:0] proc_1_start_FIFO_blk;
    wire [3:0] proc_1_TLF_FIFO_blk;
    wire [3:0] proc_1_input_sync_blk;
    wire [3:0] proc_1_output_sync_blk;
    wire [3:0] proc_dep_vld_vec_1;
    reg [3:0] proc_dep_vld_vec_1_reg;
    wire [3:0] in_chan_dep_vld_vec_1;
    wire [19:0] in_chan_dep_data_vec_1;
    wire [3:0] token_in_vec_1;
    wire [3:0] out_chan_dep_vld_vec_1;
    wire [4:0] out_chan_dep_data_1;
    wire [3:0] token_out_vec_1;
    wire dl_detect_out_1;
    wire dep_chan_vld_0_1;
    wire [4:0] dep_chan_data_0_1;
    wire token_0_1;
    wire dep_chan_vld_2_1;
    wire [4:0] dep_chan_data_2_1;
    wire token_2_1;
    wire dep_chan_vld_3_1;
    wire [4:0] dep_chan_data_3_1;
    wire token_3_1;
    wire dep_chan_vld_4_1;
    wire [4:0] dep_chan_data_4_1;
    wire token_4_1;
    wire [2:0] proc_2_data_FIFO_blk;
    wire [2:0] proc_2_data_PIPO_blk;
    wire [2:0] proc_2_start_FIFO_blk;
    wire [2:0] proc_2_TLF_FIFO_blk;
    wire [2:0] proc_2_input_sync_blk;
    wire [2:0] proc_2_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_2;
    reg [2:0] proc_dep_vld_vec_2_reg;
    wire [2:0] in_chan_dep_vld_vec_2;
    wire [14:0] in_chan_dep_data_vec_2;
    wire [2:0] token_in_vec_2;
    wire [2:0] out_chan_dep_vld_vec_2;
    wire [4:0] out_chan_dep_data_2;
    wire [2:0] token_out_vec_2;
    wire dl_detect_out_2;
    wire dep_chan_vld_0_2;
    wire [4:0] dep_chan_data_0_2;
    wire token_0_2;
    wire dep_chan_vld_1_2;
    wire [4:0] dep_chan_data_1_2;
    wire token_1_2;
    wire dep_chan_vld_4_2;
    wire [4:0] dep_chan_data_4_2;
    wire token_4_2;
    wire [2:0] proc_3_data_FIFO_blk;
    wire [2:0] proc_3_data_PIPO_blk;
    wire [2:0] proc_3_start_FIFO_blk;
    wire [2:0] proc_3_TLF_FIFO_blk;
    wire [2:0] proc_3_input_sync_blk;
    wire [2:0] proc_3_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_3;
    reg [2:0] proc_dep_vld_vec_3_reg;
    wire [2:0] in_chan_dep_vld_vec_3;
    wire [14:0] in_chan_dep_data_vec_3;
    wire [2:0] token_in_vec_3;
    wire [2:0] out_chan_dep_vld_vec_3;
    wire [4:0] out_chan_dep_data_3;
    wire [2:0] token_out_vec_3;
    wire dl_detect_out_3;
    wire dep_chan_vld_0_3;
    wire [4:0] dep_chan_data_0_3;
    wire token_0_3;
    wire dep_chan_vld_1_3;
    wire [4:0] dep_chan_data_1_3;
    wire token_1_3;
    wire dep_chan_vld_4_3;
    wire [4:0] dep_chan_data_4_3;
    wire token_4_3;
    wire [3:0] proc_4_data_FIFO_blk;
    wire [3:0] proc_4_data_PIPO_blk;
    wire [3:0] proc_4_start_FIFO_blk;
    wire [3:0] proc_4_TLF_FIFO_blk;
    wire [3:0] proc_4_input_sync_blk;
    wire [3:0] proc_4_output_sync_blk;
    wire [3:0] proc_dep_vld_vec_4;
    reg [3:0] proc_dep_vld_vec_4_reg;
    wire [3:0] in_chan_dep_vld_vec_4;
    wire [19:0] in_chan_dep_data_vec_4;
    wire [3:0] token_in_vec_4;
    wire [3:0] out_chan_dep_vld_vec_4;
    wire [4:0] out_chan_dep_data_4;
    wire [3:0] token_out_vec_4;
    wire dl_detect_out_4;
    wire dep_chan_vld_0_4;
    wire [4:0] dep_chan_data_0_4;
    wire token_0_4;
    wire dep_chan_vld_1_4;
    wire [4:0] dep_chan_data_1_4;
    wire token_1_4;
    wire dep_chan_vld_2_4;
    wire [4:0] dep_chan_data_2_4;
    wire token_2_4;
    wire dep_chan_vld_3_4;
    wire [4:0] dep_chan_data_3_4;
    wire token_3_4;
    wire [4:0] dl_in_vec;
    wire dl_detect_out;
    wire token_clear;
    reg [4:0] origin;

    reg ap_done_reg_0;// for module getinstream_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_0 <= 'b0;
        end
        else begin
            ap_done_reg_0 <= getinstream_U0.ap_done & ~getinstream_U0.ap_continue;
        end
    end

    reg ap_done_reg_1;// for module streamtoparallelwithburst_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_1 <= 'b0;
        end
        else begin
            ap_done_reg_1 <= streamtoparallelwithburst_U0.ap_done & ~streamtoparallelwithburst_U0.ap_continue;
        end
    end

    reg ap_done_reg_2;// for module sendoutstream_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_2 <= 'b0;
        end
        else begin
            ap_done_reg_2 <= sendoutstream_U0.ap_done & ~sendoutstream_U0.ap_continue;
        end
    end

reg [15:0] trans_in_cnt_0;// for process entry_proc_U0
always @(negedge dl_reset or posedge dl_clock) begin
    if (~dl_reset) begin
         trans_in_cnt_0 <= 16'h0;
    end
    else if (entry_proc_U0.start_write == 1'b1) begin
        trans_in_cnt_0 <= trans_in_cnt_0 + 16'h1;
    end
    else begin
        trans_in_cnt_0 <= trans_in_cnt_0;
    end
end

reg [15:0] trans_out_cnt_0;// for process entry_proc_U0
always @(negedge dl_reset or posedge dl_clock) begin
    if (~dl_reset) begin
         trans_out_cnt_0 <= 16'h0;
    end
    else if (entry_proc_U0.ap_done == 1'b1 && entry_proc_U0.ap_continue == 1'b1) begin
        trans_out_cnt_0 <= trans_out_cnt_0 + 16'h1;
    end
    else begin
        trans_out_cnt_0 <= trans_out_cnt_0;
    end
end

    // Process: entry_proc_U0
    userdma_hls_deadlock_detect_unit #(5, 0, 4, 4) userdma_hls_deadlock_detect_unit_0 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_0),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_0),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_0),
        .token_in_vec(token_in_vec_0),
        .dl_detect_in(dl_detect_out),
        .origin(origin[0]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_0),
        .out_chan_dep_data(out_chan_dep_data_0),
        .token_out_vec(token_out_vec_0),
        .dl_detect_out(dl_in_vec[0]));

    assign proc_0_data_FIFO_blk[0] = 1'b0 | (~entry_proc_U0.s2m_sts_clear_c_blk_n) | (~entry_proc_U0.s2mbuf_c_blk_n);
    assign proc_0_data_PIPO_blk[0] = 1'b0;
    assign proc_0_start_FIFO_blk[0] = 1'b0 | (~start_for_streamtoparallelwithburst_U0_U.if_full_n & entry_proc_U0.ap_start & ~entry_proc_U0.real_start & (trans_in_cnt_0 == trans_out_cnt_0) & ~start_for_streamtoparallelwithburst_U0_U.if_read);
    assign proc_0_TLF_FIFO_blk[0] = 1'b0;
    assign proc_0_input_sync_blk[0] = 1'b0;
    assign proc_0_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_0[0] = dl_detect_out ? proc_dep_vld_vec_0_reg[0] : (proc_0_data_FIFO_blk[0] | proc_0_data_PIPO_blk[0] | proc_0_start_FIFO_blk[0] | proc_0_TLF_FIFO_blk[0] | proc_0_input_sync_blk[0] | proc_0_output_sync_blk[0]);
    assign proc_0_data_FIFO_blk[1] = 1'b0 | (~entry_proc_U0.m2s_sts_clear_c_blk_n);
    assign proc_0_data_PIPO_blk[1] = 1'b0;
    assign proc_0_start_FIFO_blk[1] = 1'b0 | (~start_for_sendoutstream_U0_U.if_full_n & entry_proc_U0.ap_start & ~entry_proc_U0.real_start & (trans_in_cnt_0 == trans_out_cnt_0) & ~start_for_sendoutstream_U0_U.if_read);
    assign proc_0_TLF_FIFO_blk[1] = 1'b0;
    assign proc_0_input_sync_blk[1] = 1'b0;
    assign proc_0_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_0[1] = dl_detect_out ? proc_dep_vld_vec_0_reg[1] : (proc_0_data_FIFO_blk[1] | proc_0_data_PIPO_blk[1] | proc_0_start_FIFO_blk[1] | proc_0_TLF_FIFO_blk[1] | proc_0_input_sync_blk[1] | proc_0_output_sync_blk[1]);
    assign proc_0_data_FIFO_blk[2] = 1'b0;
    assign proc_0_data_PIPO_blk[2] = 1'b0;
    assign proc_0_start_FIFO_blk[2] = 1'b0;
    assign proc_0_TLF_FIFO_blk[2] = 1'b0;
    assign proc_0_input_sync_blk[2] = 1'b0 | (ap_sync_entry_proc_U0_ap_ready & entry_proc_U0.ap_idle & ~ap_sync_getinstream_U0_ap_ready);
    assign proc_0_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_0[2] = dl_detect_out ? proc_dep_vld_vec_0_reg[2] : (proc_0_data_FIFO_blk[2] | proc_0_data_PIPO_blk[2] | proc_0_start_FIFO_blk[2] | proc_0_TLF_FIFO_blk[2] | proc_0_input_sync_blk[2] | proc_0_output_sync_blk[2]);
    assign proc_0_data_FIFO_blk[3] = 1'b0;
    assign proc_0_data_PIPO_blk[3] = 1'b0;
    assign proc_0_start_FIFO_blk[3] = 1'b0;
    assign proc_0_TLF_FIFO_blk[3] = 1'b0;
    assign proc_0_input_sync_blk[3] = 1'b0 | (ap_sync_entry_proc_U0_ap_ready & entry_proc_U0.ap_idle & ~ap_sync_paralleltostreamwithburst_U0_ap_ready);
    assign proc_0_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_0[3] = dl_detect_out ? proc_dep_vld_vec_0_reg[3] : (proc_0_data_FIFO_blk[3] | proc_0_data_PIPO_blk[3] | proc_0_start_FIFO_blk[3] | proc_0_TLF_FIFO_blk[3] | proc_0_input_sync_blk[3] | proc_0_output_sync_blk[3]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_0_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_0_reg <= proc_dep_vld_vec_0;
        end
    end
    assign in_chan_dep_vld_vec_0[0] = dep_chan_vld_1_0;
    assign in_chan_dep_data_vec_0[4 : 0] = dep_chan_data_1_0;
    assign token_in_vec_0[0] = token_1_0;
    assign in_chan_dep_vld_vec_0[1] = dep_chan_vld_2_0;
    assign in_chan_dep_data_vec_0[9 : 5] = dep_chan_data_2_0;
    assign token_in_vec_0[1] = token_2_0;
    assign in_chan_dep_vld_vec_0[2] = dep_chan_vld_3_0;
    assign in_chan_dep_data_vec_0[14 : 10] = dep_chan_data_3_0;
    assign token_in_vec_0[2] = token_3_0;
    assign in_chan_dep_vld_vec_0[3] = dep_chan_vld_4_0;
    assign in_chan_dep_data_vec_0[19 : 15] = dep_chan_data_4_0;
    assign token_in_vec_0[3] = token_4_0;
    assign dep_chan_vld_0_2 = out_chan_dep_vld_vec_0[0];
    assign dep_chan_data_0_2 = out_chan_dep_data_0;
    assign token_0_2 = token_out_vec_0[0];
    assign dep_chan_vld_0_4 = out_chan_dep_vld_vec_0[1];
    assign dep_chan_data_0_4 = out_chan_dep_data_0;
    assign token_0_4 = token_out_vec_0[1];
    assign dep_chan_vld_0_1 = out_chan_dep_vld_vec_0[2];
    assign dep_chan_data_0_1 = out_chan_dep_data_0;
    assign token_0_1 = token_out_vec_0[2];
    assign dep_chan_vld_0_3 = out_chan_dep_vld_vec_0[3];
    assign dep_chan_data_0_3 = out_chan_dep_data_0;
    assign token_0_3 = token_out_vec_0[3];

    // Process: getinstream_U0
    userdma_hls_deadlock_detect_unit #(5, 1, 4, 4) userdma_hls_deadlock_detect_unit_1 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_1),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_1),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_1),
        .token_in_vec(token_in_vec_1),
        .dl_detect_in(dl_detect_out),
        .origin(origin[1]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_1),
        .out_chan_dep_data(out_chan_dep_data_1),
        .token_out_vec(token_out_vec_1),
        .dl_detect_out(dl_in_vec[1]));

    assign proc_1_data_FIFO_blk[0] = 1'b0 | (~getinstream_U0.grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132.inbuf_blk_n) | (~getinstream_U0.grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132.incount47_blk_n) | (~getinstream_U0.s2m_len_c_blk_n) | (~getinstream_U0.s2m_enb_clrsts_c_blk_n);
    assign proc_1_data_PIPO_blk[0] = 1'b0;
    assign proc_1_start_FIFO_blk[0] = 1'b0;
    assign proc_1_TLF_FIFO_blk[0] = 1'b0;
    assign proc_1_input_sync_blk[0] = 1'b0;
    assign proc_1_output_sync_blk[0] = 1'b0 | (ap_done_reg_0 & getinstream_U0.ap_done & ~streamtoparallelwithburst_U0.ap_done);
    assign proc_dep_vld_vec_1[0] = dl_detect_out ? proc_dep_vld_vec_1_reg[0] : (proc_1_data_FIFO_blk[0] | proc_1_data_PIPO_blk[0] | proc_1_start_FIFO_blk[0] | proc_1_TLF_FIFO_blk[0] | proc_1_input_sync_blk[0] | proc_1_output_sync_blk[0]);
    assign proc_1_data_FIFO_blk[1] = 1'b0;
    assign proc_1_data_PIPO_blk[1] = 1'b0;
    assign proc_1_start_FIFO_blk[1] = 1'b0;
    assign proc_1_TLF_FIFO_blk[1] = 1'b0;
    assign proc_1_input_sync_blk[1] = 1'b0 | (ap_sync_getinstream_U0_ap_ready & getinstream_U0.ap_idle & ~ap_sync_entry_proc_U0_ap_ready);
    assign proc_1_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_1[1] = dl_detect_out ? proc_dep_vld_vec_1_reg[1] : (proc_1_data_FIFO_blk[1] | proc_1_data_PIPO_blk[1] | proc_1_start_FIFO_blk[1] | proc_1_TLF_FIFO_blk[1] | proc_1_input_sync_blk[1] | proc_1_output_sync_blk[1]);
    assign proc_1_data_FIFO_blk[2] = 1'b0;
    assign proc_1_data_PIPO_blk[2] = 1'b0;
    assign proc_1_start_FIFO_blk[2] = 1'b0;
    assign proc_1_TLF_FIFO_blk[2] = 1'b0;
    assign proc_1_input_sync_blk[2] = 1'b0 | (ap_sync_getinstream_U0_ap_ready & getinstream_U0.ap_idle & ~ap_sync_paralleltostreamwithburst_U0_ap_ready);
    assign proc_1_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_1[2] = dl_detect_out ? proc_dep_vld_vec_1_reg[2] : (proc_1_data_FIFO_blk[2] | proc_1_data_PIPO_blk[2] | proc_1_start_FIFO_blk[2] | proc_1_TLF_FIFO_blk[2] | proc_1_input_sync_blk[2] | proc_1_output_sync_blk[2]);
    assign proc_1_data_FIFO_blk[3] = 1'b0;
    assign proc_1_data_PIPO_blk[3] = 1'b0;
    assign proc_1_start_FIFO_blk[3] = 1'b0;
    assign proc_1_TLF_FIFO_blk[3] = 1'b0;
    assign proc_1_input_sync_blk[3] = 1'b0;
    assign proc_1_output_sync_blk[3] = 1'b0 | (ap_done_reg_0 & getinstream_U0.ap_done & ~sendoutstream_U0.ap_done);
    assign proc_dep_vld_vec_1[3] = dl_detect_out ? proc_dep_vld_vec_1_reg[3] : (proc_1_data_FIFO_blk[3] | proc_1_data_PIPO_blk[3] | proc_1_start_FIFO_blk[3] | proc_1_TLF_FIFO_blk[3] | proc_1_input_sync_blk[3] | proc_1_output_sync_blk[3]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_1_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_1_reg <= proc_dep_vld_vec_1;
        end
    end
    assign in_chan_dep_vld_vec_1[0] = dep_chan_vld_0_1;
    assign in_chan_dep_data_vec_1[4 : 0] = dep_chan_data_0_1;
    assign token_in_vec_1[0] = token_0_1;
    assign in_chan_dep_vld_vec_1[1] = dep_chan_vld_2_1;
    assign in_chan_dep_data_vec_1[9 : 5] = dep_chan_data_2_1;
    assign token_in_vec_1[1] = token_2_1;
    assign in_chan_dep_vld_vec_1[2] = dep_chan_vld_3_1;
    assign in_chan_dep_data_vec_1[14 : 10] = dep_chan_data_3_1;
    assign token_in_vec_1[2] = token_3_1;
    assign in_chan_dep_vld_vec_1[3] = dep_chan_vld_4_1;
    assign in_chan_dep_data_vec_1[19 : 15] = dep_chan_data_4_1;
    assign token_in_vec_1[3] = token_4_1;
    assign dep_chan_vld_1_2 = out_chan_dep_vld_vec_1[0];
    assign dep_chan_data_1_2 = out_chan_dep_data_1;
    assign token_1_2 = token_out_vec_1[0];
    assign dep_chan_vld_1_0 = out_chan_dep_vld_vec_1[1];
    assign dep_chan_data_1_0 = out_chan_dep_data_1;
    assign token_1_0 = token_out_vec_1[1];
    assign dep_chan_vld_1_3 = out_chan_dep_vld_vec_1[2];
    assign dep_chan_data_1_3 = out_chan_dep_data_1;
    assign token_1_3 = token_out_vec_1[2];
    assign dep_chan_vld_1_4 = out_chan_dep_vld_vec_1[3];
    assign dep_chan_data_1_4 = out_chan_dep_data_1;
    assign token_1_4 = token_out_vec_1[3];

    // Process: streamtoparallelwithburst_U0
    userdma_hls_deadlock_detect_unit #(5, 2, 3, 3) userdma_hls_deadlock_detect_unit_2 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_2),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_2),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_2),
        .token_in_vec(token_in_vec_2),
        .dl_detect_in(dl_detect_out),
        .origin(origin[2]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_2),
        .out_chan_dep_data(out_chan_dep_data_2),
        .token_out_vec(token_out_vec_2),
        .dl_detect_out(dl_in_vec[2]));

    assign proc_2_data_FIFO_blk[0] = 1'b0 | (~streamtoparallelwithburst_U0.grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148.inbuf_blk_n) | (~streamtoparallelwithburst_U0.incount47_blk_n) | (~streamtoparallelwithburst_U0.in_en_clrsts_blk_n) | (~streamtoparallelwithburst_U0.in_s2m_len_blk_n);
    assign proc_2_data_PIPO_blk[0] = 1'b0;
    assign proc_2_start_FIFO_blk[0] = 1'b0;
    assign proc_2_TLF_FIFO_blk[0] = 1'b0;
    assign proc_2_input_sync_blk[0] = 1'b0;
    assign proc_2_output_sync_blk[0] = 1'b0 | (ap_done_reg_1 & streamtoparallelwithburst_U0.ap_done & ~getinstream_U0.ap_done);
    assign proc_dep_vld_vec_2[0] = dl_detect_out ? proc_dep_vld_vec_2_reg[0] : (proc_2_data_FIFO_blk[0] | proc_2_data_PIPO_blk[0] | proc_2_start_FIFO_blk[0] | proc_2_TLF_FIFO_blk[0] | proc_2_input_sync_blk[0] | proc_2_output_sync_blk[0]);
    assign proc_2_data_FIFO_blk[1] = 1'b0 | (~streamtoparallelwithburst_U0.sts_clear_blk_n) | (~streamtoparallelwithburst_U0.out_memory_blk_n);
    assign proc_2_data_PIPO_blk[1] = 1'b0;
    assign proc_2_start_FIFO_blk[1] = 1'b0 | (~start_for_streamtoparallelwithburst_U0_U.if_empty_n & streamtoparallelwithburst_U0.ap_idle & ~start_for_streamtoparallelwithburst_U0_U.if_write);
    assign proc_2_TLF_FIFO_blk[1] = 1'b0;
    assign proc_2_input_sync_blk[1] = 1'b0;
    assign proc_2_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_2[1] = dl_detect_out ? proc_dep_vld_vec_2_reg[1] : (proc_2_data_FIFO_blk[1] | proc_2_data_PIPO_blk[1] | proc_2_start_FIFO_blk[1] | proc_2_TLF_FIFO_blk[1] | proc_2_input_sync_blk[1] | proc_2_output_sync_blk[1]);
    assign proc_2_data_FIFO_blk[2] = 1'b0;
    assign proc_2_data_PIPO_blk[2] = 1'b0;
    assign proc_2_start_FIFO_blk[2] = 1'b0;
    assign proc_2_TLF_FIFO_blk[2] = 1'b0;
    assign proc_2_input_sync_blk[2] = 1'b0;
    assign proc_2_output_sync_blk[2] = 1'b0 | (ap_done_reg_1 & streamtoparallelwithburst_U0.ap_done & ~sendoutstream_U0.ap_done);
    assign proc_dep_vld_vec_2[2] = dl_detect_out ? proc_dep_vld_vec_2_reg[2] : (proc_2_data_FIFO_blk[2] | proc_2_data_PIPO_blk[2] | proc_2_start_FIFO_blk[2] | proc_2_TLF_FIFO_blk[2] | proc_2_input_sync_blk[2] | proc_2_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_2_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_2_reg <= proc_dep_vld_vec_2;
        end
    end
    assign in_chan_dep_vld_vec_2[0] = dep_chan_vld_0_2;
    assign in_chan_dep_data_vec_2[4 : 0] = dep_chan_data_0_2;
    assign token_in_vec_2[0] = token_0_2;
    assign in_chan_dep_vld_vec_2[1] = dep_chan_vld_1_2;
    assign in_chan_dep_data_vec_2[9 : 5] = dep_chan_data_1_2;
    assign token_in_vec_2[1] = token_1_2;
    assign in_chan_dep_vld_vec_2[2] = dep_chan_vld_4_2;
    assign in_chan_dep_data_vec_2[14 : 10] = dep_chan_data_4_2;
    assign token_in_vec_2[2] = token_4_2;
    assign dep_chan_vld_2_1 = out_chan_dep_vld_vec_2[0];
    assign dep_chan_data_2_1 = out_chan_dep_data_2;
    assign token_2_1 = token_out_vec_2[0];
    assign dep_chan_vld_2_0 = out_chan_dep_vld_vec_2[1];
    assign dep_chan_data_2_0 = out_chan_dep_data_2;
    assign token_2_0 = token_out_vec_2[1];
    assign dep_chan_vld_2_4 = out_chan_dep_vld_vec_2[2];
    assign dep_chan_data_2_4 = out_chan_dep_data_2;
    assign token_2_4 = token_out_vec_2[2];

    // Process: paralleltostreamwithburst_U0
    userdma_hls_deadlock_detect_unit #(5, 3, 3, 3) userdma_hls_deadlock_detect_unit_3 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_3),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_3),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_3),
        .token_in_vec(token_in_vec_3),
        .dl_detect_in(dl_detect_out),
        .origin(origin[3]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_3),
        .out_chan_dep_data(out_chan_dep_data_3),
        .token_out_vec(token_out_vec_3),
        .dl_detect_out(dl_in_vec[3]));

    assign proc_3_data_FIFO_blk[0] = 1'b0 | (~paralleltostreamwithburst_U0.grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_107_2_fu_173.outbuf_blk_n) | (~paralleltostreamwithburst_U0.outcount48_blk_n) | (~paralleltostreamwithburst_U0.m2s_enb_clrsts_c_blk_n);
    assign proc_3_data_PIPO_blk[0] = 1'b0;
    assign proc_3_start_FIFO_blk[0] = 1'b0;
    assign proc_3_TLF_FIFO_blk[0] = 1'b0;
    assign proc_3_input_sync_blk[0] = 1'b0;
    assign proc_3_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_3[0] = dl_detect_out ? proc_dep_vld_vec_3_reg[0] : (proc_3_data_FIFO_blk[0] | proc_3_data_PIPO_blk[0] | proc_3_start_FIFO_blk[0] | proc_3_TLF_FIFO_blk[0] | proc_3_input_sync_blk[0] | proc_3_output_sync_blk[0]);
    assign proc_3_data_FIFO_blk[1] = 1'b0;
    assign proc_3_data_PIPO_blk[1] = 1'b0;
    assign proc_3_start_FIFO_blk[1] = 1'b0;
    assign proc_3_TLF_FIFO_blk[1] = 1'b0;
    assign proc_3_input_sync_blk[1] = 1'b0 | (ap_sync_paralleltostreamwithburst_U0_ap_ready & paralleltostreamwithburst_U0.ap_idle & ~ap_sync_entry_proc_U0_ap_ready);
    assign proc_3_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_3[1] = dl_detect_out ? proc_dep_vld_vec_3_reg[1] : (proc_3_data_FIFO_blk[1] | proc_3_data_PIPO_blk[1] | proc_3_start_FIFO_blk[1] | proc_3_TLF_FIFO_blk[1] | proc_3_input_sync_blk[1] | proc_3_output_sync_blk[1]);
    assign proc_3_data_FIFO_blk[2] = 1'b0;
    assign proc_3_data_PIPO_blk[2] = 1'b0;
    assign proc_3_start_FIFO_blk[2] = 1'b0;
    assign proc_3_TLF_FIFO_blk[2] = 1'b0;
    assign proc_3_input_sync_blk[2] = 1'b0 | (ap_sync_paralleltostreamwithburst_U0_ap_ready & paralleltostreamwithburst_U0.ap_idle & ~ap_sync_getinstream_U0_ap_ready);
    assign proc_3_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_3[2] = dl_detect_out ? proc_dep_vld_vec_3_reg[2] : (proc_3_data_FIFO_blk[2] | proc_3_data_PIPO_blk[2] | proc_3_start_FIFO_blk[2] | proc_3_TLF_FIFO_blk[2] | proc_3_input_sync_blk[2] | proc_3_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_3_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_3_reg <= proc_dep_vld_vec_3;
        end
    end
    assign in_chan_dep_vld_vec_3[0] = dep_chan_vld_0_3;
    assign in_chan_dep_data_vec_3[4 : 0] = dep_chan_data_0_3;
    assign token_in_vec_3[0] = token_0_3;
    assign in_chan_dep_vld_vec_3[1] = dep_chan_vld_1_3;
    assign in_chan_dep_data_vec_3[9 : 5] = dep_chan_data_1_3;
    assign token_in_vec_3[1] = token_1_3;
    assign in_chan_dep_vld_vec_3[2] = dep_chan_vld_4_3;
    assign in_chan_dep_data_vec_3[14 : 10] = dep_chan_data_4_3;
    assign token_in_vec_3[2] = token_4_3;
    assign dep_chan_vld_3_4 = out_chan_dep_vld_vec_3[0];
    assign dep_chan_data_3_4 = out_chan_dep_data_3;
    assign token_3_4 = token_out_vec_3[0];
    assign dep_chan_vld_3_0 = out_chan_dep_vld_vec_3[1];
    assign dep_chan_data_3_0 = out_chan_dep_data_3;
    assign token_3_0 = token_out_vec_3[1];
    assign dep_chan_vld_3_1 = out_chan_dep_vld_vec_3[2];
    assign dep_chan_data_3_1 = out_chan_dep_data_3;
    assign token_3_1 = token_out_vec_3[2];

    // Process: sendoutstream_U0
    userdma_hls_deadlock_detect_unit #(5, 4, 4, 4) userdma_hls_deadlock_detect_unit_4 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_4),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_4),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_4),
        .token_in_vec(token_in_vec_4),
        .dl_detect_in(dl_detect_out),
        .origin(origin[4]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_4),
        .out_chan_dep_data(out_chan_dep_data_4),
        .token_out_vec(token_out_vec_4),
        .dl_detect_out(dl_in_vec[4]));

    assign proc_4_data_FIFO_blk[0] = 1'b0 | (~sendoutstream_U0.grp_sendoutstream_Pipeline_VITIS_LOOP_151_2_fu_101.outbuf_blk_n) | (~sendoutstream_U0.outcount48_blk_n) | (~sendoutstream_U0.in_en_clrsts_blk_n);
    assign proc_4_data_PIPO_blk[0] = 1'b0;
    assign proc_4_start_FIFO_blk[0] = 1'b0;
    assign proc_4_TLF_FIFO_blk[0] = 1'b0;
    assign proc_4_input_sync_blk[0] = 1'b0;
    assign proc_4_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_4[0] = dl_detect_out ? proc_dep_vld_vec_4_reg[0] : (proc_4_data_FIFO_blk[0] | proc_4_data_PIPO_blk[0] | proc_4_start_FIFO_blk[0] | proc_4_TLF_FIFO_blk[0] | proc_4_input_sync_blk[0] | proc_4_output_sync_blk[0]);
    assign proc_4_data_FIFO_blk[1] = 1'b0 | (~sendoutstream_U0.sts_clear_blk_n);
    assign proc_4_data_PIPO_blk[1] = 1'b0;
    assign proc_4_start_FIFO_blk[1] = 1'b0 | (~start_for_sendoutstream_U0_U.if_empty_n & sendoutstream_U0.ap_idle & ~start_for_sendoutstream_U0_U.if_write);
    assign proc_4_TLF_FIFO_blk[1] = 1'b0;
    assign proc_4_input_sync_blk[1] = 1'b0;
    assign proc_4_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_4[1] = dl_detect_out ? proc_dep_vld_vec_4_reg[1] : (proc_4_data_FIFO_blk[1] | proc_4_data_PIPO_blk[1] | proc_4_start_FIFO_blk[1] | proc_4_TLF_FIFO_blk[1] | proc_4_input_sync_blk[1] | proc_4_output_sync_blk[1]);
    assign proc_4_data_FIFO_blk[2] = 1'b0;
    assign proc_4_data_PIPO_blk[2] = 1'b0;
    assign proc_4_start_FIFO_blk[2] = 1'b0;
    assign proc_4_TLF_FIFO_blk[2] = 1'b0;
    assign proc_4_input_sync_blk[2] = 1'b0;
    assign proc_4_output_sync_blk[2] = 1'b0 | (ap_done_reg_2 & sendoutstream_U0.ap_done & ~getinstream_U0.ap_done);
    assign proc_dep_vld_vec_4[2] = dl_detect_out ? proc_dep_vld_vec_4_reg[2] : (proc_4_data_FIFO_blk[2] | proc_4_data_PIPO_blk[2] | proc_4_start_FIFO_blk[2] | proc_4_TLF_FIFO_blk[2] | proc_4_input_sync_blk[2] | proc_4_output_sync_blk[2]);
    assign proc_4_data_FIFO_blk[3] = 1'b0;
    assign proc_4_data_PIPO_blk[3] = 1'b0;
    assign proc_4_start_FIFO_blk[3] = 1'b0;
    assign proc_4_TLF_FIFO_blk[3] = 1'b0;
    assign proc_4_input_sync_blk[3] = 1'b0;
    assign proc_4_output_sync_blk[3] = 1'b0 | (ap_done_reg_2 & sendoutstream_U0.ap_done & ~streamtoparallelwithburst_U0.ap_done);
    assign proc_dep_vld_vec_4[3] = dl_detect_out ? proc_dep_vld_vec_4_reg[3] : (proc_4_data_FIFO_blk[3] | proc_4_data_PIPO_blk[3] | proc_4_start_FIFO_blk[3] | proc_4_TLF_FIFO_blk[3] | proc_4_input_sync_blk[3] | proc_4_output_sync_blk[3]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_4_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_4_reg <= proc_dep_vld_vec_4;
        end
    end
    assign in_chan_dep_vld_vec_4[0] = dep_chan_vld_0_4;
    assign in_chan_dep_data_vec_4[4 : 0] = dep_chan_data_0_4;
    assign token_in_vec_4[0] = token_0_4;
    assign in_chan_dep_vld_vec_4[1] = dep_chan_vld_1_4;
    assign in_chan_dep_data_vec_4[9 : 5] = dep_chan_data_1_4;
    assign token_in_vec_4[1] = token_1_4;
    assign in_chan_dep_vld_vec_4[2] = dep_chan_vld_2_4;
    assign in_chan_dep_data_vec_4[14 : 10] = dep_chan_data_2_4;
    assign token_in_vec_4[2] = token_2_4;
    assign in_chan_dep_vld_vec_4[3] = dep_chan_vld_3_4;
    assign in_chan_dep_data_vec_4[19 : 15] = dep_chan_data_3_4;
    assign token_in_vec_4[3] = token_3_4;
    assign dep_chan_vld_4_3 = out_chan_dep_vld_vec_4[0];
    assign dep_chan_data_4_3 = out_chan_dep_data_4;
    assign token_4_3 = token_out_vec_4[0];
    assign dep_chan_vld_4_0 = out_chan_dep_vld_vec_4[1];
    assign dep_chan_data_4_0 = out_chan_dep_data_4;
    assign token_4_0 = token_out_vec_4[1];
    assign dep_chan_vld_4_1 = out_chan_dep_vld_vec_4[2];
    assign dep_chan_data_4_1 = out_chan_dep_data_4;
    assign token_4_1 = token_out_vec_4[2];
    assign dep_chan_vld_4_2 = out_chan_dep_vld_vec_4[3];
    assign dep_chan_data_4_2 = out_chan_dep_data_4;
    assign token_4_2 = token_out_vec_4[3];


`include "userdma_hls_deadlock_report_unit.vh"
