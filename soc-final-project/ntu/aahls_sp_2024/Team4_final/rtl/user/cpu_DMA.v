module cpu_DMA(
    input        wbs_clk_i,
    input        wbs_rst_i,
    input        wbs_stb_i,
    input        wbs_cyc_i,
    input        wbs_we_i,
    input [ 3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output dma_stb_cpu,
    output dma_cyc_cpu,
    output dma_we_cpu,
    output [3:0] dma_sel_cpu,
    output [31:0] dma_adr_cpu,
    output [31:0] dma_dat_cpu
);

    assign dma_stb_cpu = wbs_stb_i & (wbs_adr_i[31:24] == 8'h38);
    assign dma_cyc_cpu = wbs_cyc_i & (wbs_adr_i[31:24] == 8'h38);
    assign dma_we_cpu  = wbs_we_i  & (wbs_adr_i[31:24] == 8'h38);
    assign dma_sel_cpu = wbs_sel_i & {4{(wbs_adr_i[31:24] == 8'h38)}};
    assign dma_adr_cpu = wbs_adr_i;
    assign dma_dat_cpu = wbs_dat_i;
endmodule