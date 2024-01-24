module SDRAM_branch (

    // WB interface
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // SDRAM request from FIR (controller interface)
    input   [22:0] FIR_address,
    input   FIR_rw, // 1 = write, 0 = read
    input   [31:0] data_from_FIR,
    output  [31:0] data_to_FIR,
    output  FIR_busy,
    input   FIR_in_valid,
    output  FIR_out_valid,
    input   FIR_prefetch_step,

    // SDRAM request from MM (controller interface)
    input   [22:0] MM_address,
    input   MM_rw, // 1 = write, 0 = read
    input   [31:0] data_from_MM,
    output  [31:0] data_to_MM,
    output  MM_busy,
    input   MM_in_valid,
    output  MM_out_valid,
    input   MM_prefetch_step
);

    wire [22:0] controller_address;
    wire controller_rw;
    wire [31:0] data_to_controller;
    wire [31:0] data_from_controller;
    wire controller_busy;
    wire controller_in_valid;
    wire controller_out_valid;
    wire controller_prefetch_step;


    
    WB_controller WB_controller_U0 (
        // WB interface
        .wb_clk_i(wb_clk_i),
        .wb_rst_i(wb_rst_i),
        .wbs_stb_i(wbs_stb_i),
        .wbs_cyc_i(wbs_cyc_i),
        .wbs_we_i(wbs_we_i),
        .wbs_sel_i(wbs_sel_i),
        .wbs_dat_i(wbs_dat_i),
        .wbs_adr_i(wbs_adr_i),
        .wbs_ack_o(wbs_ack_o),
        .wbs_dat_o(wbs_dat_o),

        // SDRAM request from CPU (controller interface)
        .CPU_address(FIR_address),
        .CPU_rw(FIR_rw),
        .data_from_CPU(data_from_FIR),
        .data_to_CPU(data_to_FIR),
        .CPU_busy(FIR_busy),
        .CPU_in_valid(FIR_in_valid),
        .CPU_out_valid(FIR_out_valid),
        .CPU_prefetch_step(FIR_prefetch_step)
    );

    SDRAM_arbiter user_sdram_arbiter (
        .clk(clk),
        .rst(rst),

        // CPU interface
        .CPU_address(CPU_address),
        .CPU_rw(wbs_we_i),
        .data_from_CPU(wbs_dat_i),
        .data_to_CPU(wbs_dat_o),
        .CPU_busy(CPU_busy),
        .CPU_in_valid(CPU_in_valid),
        .CPU_out_valid(CPU_out_valid),
        .CPU_prefetch_step(CPU_prefetch_step),

        // FIR interface
        .FIR_address(FIR_address),
        .FIR_rw(FIR_rw),
        .data_from_FIR(data_from_FIR),
        .data_to_FIR(data_to_FIR),
        .FIR_busy(FIR_busy),
        .FIR_in_valid(FIR_in_valid),
        .FIR_out_valid(FIR_out_valid),
        .FIR_prefetch_step(FIR_prefetch_step),

        // MM interface
        .MM_address(MM_address),
        .MM_rw(MM_rw),
        .data_from_MM(data_from_MM),
        .data_to_MM(data_to_MM),
        .MM_busy(MM_busy),
        .MM_in_valid(MM_in_valid),
        .MM_out_valid(MM_out_valid),
        .MM_prefetch_step(MM_prefetch_step),

        // SDRAM controller interface
        .controller_address(controller_address),
        .controller_rw(controller_rw),
        .data_to_controller(data_to_controller),
        .data_from_controller(data_from_controller),
        .controller_busy(controller_busy),
        .controller_in_valid(controller_in_valid),
        .controller_out_valid(controller_out_valid),
        .controller_prefetch_step(controller_prefetch_step)
    );
    
    sdram_controller user_sdram_controller (
        .clk(clk),
        .rst(rst),
        
        .sdram_cle(sdram_cle),
        .sdram_cs(sdram_cs),
        .sdram_cas(sdram_cas),
        .sdram_ras(sdram_ras),
        .sdram_we(sdram_we),
        .sdram_dqm(sdram_dqm),
        .sdram_ba(sdram_ba),
        .sdram_a(sdram_a),
        .sdram_dqi(d2c_data),
        .sdram_dqo(c2d_data),

        .user_addr(controller_address),
        .rw(controller_rw),
        .data_in(data_to_controller),
        .data_out(data_from_controller),
        .busy(controller_busy),
        .in_valid(controller_in_valid),
        .out_valid(controller_out_valid),
        .prefetch_step(controller_prefetch_step)
    );

    sdr user_bram (
        .Rst_n(rst_n),
        .Clk(clk),
        .Cke(sdram_cle),
        .Cs_n(sdram_cs),
        .Ras_n(sdram_ras),
        .Cas_n(sdram_cas),
        .We_n(sdram_we),
        .Addr(sdram_a),
        .Ba(sdram_ba),
        .Dqm(bram_mask),
        .Dqi(c2d_data),
        .Dqo(d2c_data)
    );

endmodule
