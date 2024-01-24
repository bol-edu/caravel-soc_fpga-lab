module WB_to_controller (

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

    /*
    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    output [2:0] irq*/

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
    wire clk;
    wire rst, rst_n;

    wire valid;

    wire sdram_cle;
    wire sdram_cs;
    wire sdram_cas;
    wire sdram_ras;
    wire sdram_we;
    wire sdram_dqm;
    wire [1:0] sdram_ba;
    wire [12:0] sdram_a;
    wire [31:0] d2c_data;
    wire [31:0] c2d_data;
    wire [3:0]  bram_mask;

    wire [22:0] CPU_address;
    wire CPU_busy;
    wire CPU_in_valid, CPU_out_valid;

    reg CPU_in_valid_q;
    
    // WB MI A
    
    assign valid = wbs_stb_i && wbs_cyc_i;
    assign CPU_in_valid = wbs_we_i ? valid : ~CPU_in_valid_q && valid;
    assign wbs_ack_o = (wbs_we_i) ? ~CPU_busy && valid : CPU_out_valid; 
    assign bram_mask = wbs_sel_i & {4{wbs_we_i}};
    assign CPU_address = wbs_adr_i[22:0];


    //assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
    assign clk = wb_clk_i;
    //assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;
    assign rst = wb_rst_i;
    assign rst_n = ~rst;

    always @(posedge clk) begin
        if (rst) begin
            CPU_in_valid_q <= 1'b0;
        end
        else begin
            if (~wbs_we_i && valid && ~CPU_busy && CPU_in_valid_q == 1'b0)
                CPU_in_valid_q <= 1'b1;
            else if (CPU_out_valid)
                CPU_in_valid_q <= 1'b0;
        end
    end


    wire CPU_prefetch_step;

    assign CPU_prefetch_step=0;

    wire [22:0] controller_address;
    wire controller_rw;
    wire [31:0] data_to_controller;
    wire [31:0] data_from_controller;
    wire controller_busy;
    wire controller_in_valid;
    wire controller_out_valid;
    wire controller_prefetch_step;



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

`default_nettype wire
