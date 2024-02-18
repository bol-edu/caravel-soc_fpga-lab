
wire kernel_monitor_reset;
wire kernel_monitor_clock;
assign kernel_monitor_reset = ~ap_rst_n;
assign kernel_monitor_clock = ap_clk;
wire [1:0] axis_block_sigs;
wire [9:0] inst_idle_sigs;
wire [4:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~getinstream_U0.grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132.inStreamTop_TDATA_blk_n;
assign axis_block_sigs[1] = ~sendoutstream_U0.grp_sendoutstream_Pipeline_VITIS_LOOP_151_2_fu_101.outStreamTop_TDATA_blk_n;

assign inst_idle_sigs[0] = entry_proc_U0.ap_idle;
assign inst_block_sigs[0] = (entry_proc_U0.ap_done & ~entry_proc_U0.ap_continue) | ~entry_proc_U0.s2m_sts_clear_c_blk_n | ~entry_proc_U0.s2mbuf_c_blk_n | ~entry_proc_U0.m2s_sts_clear_c_blk_n;
assign inst_idle_sigs[1] = getinstream_U0.ap_idle;
assign inst_block_sigs[1] = (getinstream_U0.ap_done & ~getinstream_U0.ap_continue) | ~getinstream_U0.grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132.inbuf_blk_n | ~getinstream_U0.grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132.incount47_blk_n | ~getinstream_U0.s2m_len_c_blk_n | ~getinstream_U0.s2m_enb_clrsts_c_blk_n;
assign inst_idle_sigs[2] = streamtoparallelwithburst_U0.ap_idle;
assign inst_block_sigs[2] = (streamtoparallelwithburst_U0.ap_done & ~streamtoparallelwithburst_U0.ap_continue) | ~streamtoparallelwithburst_U0.grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_23_2_fu_148.inbuf_blk_n | ~streamtoparallelwithburst_U0.incount47_blk_n | ~streamtoparallelwithburst_U0.in_en_clrsts_blk_n | ~streamtoparallelwithburst_U0.sts_clear_blk_n | ~streamtoparallelwithburst_U0.in_s2m_len_blk_n | ~streamtoparallelwithburst_U0.out_memory_blk_n;
assign inst_idle_sigs[3] = paralleltostreamwithburst_U0.ap_idle;
assign inst_block_sigs[3] = (paralleltostreamwithburst_U0.ap_done & ~paralleltostreamwithburst_U0.ap_continue) | ~paralleltostreamwithburst_U0.grp_paralleltostreamwithburst_Pipeline_VITIS_LOOP_107_2_fu_173.outbuf_blk_n | ~paralleltostreamwithburst_U0.outcount48_blk_n | ~paralleltostreamwithburst_U0.m2s_enb_clrsts_c_blk_n;
assign inst_idle_sigs[4] = sendoutstream_U0.ap_idle;
assign inst_block_sigs[4] = (sendoutstream_U0.ap_done & ~sendoutstream_U0.ap_continue) | ~sendoutstream_U0.grp_sendoutstream_Pipeline_VITIS_LOOP_151_2_fu_101.outbuf_blk_n | ~sendoutstream_U0.outcount48_blk_n | ~sendoutstream_U0.in_en_clrsts_blk_n | ~sendoutstream_U0.sts_clear_blk_n;

assign inst_idle_sigs[5] = 1'b0;
assign inst_idle_sigs[6] = getinstream_U0.ap_idle;
assign inst_idle_sigs[7] = getinstream_U0.grp_getinstream_Pipeline_VITIS_LOOP_48_1_fu_132.ap_idle;
assign inst_idle_sigs[8] = sendoutstream_U0.ap_idle;
assign inst_idle_sigs[9] = sendoutstream_U0.grp_sendoutstream_Pipeline_VITIS_LOOP_151_2_fu_101.ap_idle;

userdma_hls_deadlock_idx0_monitor userdma_hls_deadlock_idx0_monitor_U (
    .clock(kernel_monitor_clock),
    .reset(kernel_monitor_reset),
    .axis_block_sigs(axis_block_sigs),
    .inst_idle_sigs(inst_idle_sigs),
    .inst_block_sigs(inst_block_sigs),
    .block(kernel_block)
);

always @ (kernel_block or kernel_monitor_reset) begin
    if (kernel_block == 1'b1 && kernel_monitor_reset == 1'b0) begin
        find_kernel_block = 1'b1;
    end
    else begin
        find_kernel_block = 1'b0;
    end
end
