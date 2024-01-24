module WB_controller (

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

    // SDRAM request from CPU (controller interface)
    output   [22:0] CPU_address,
    output   CPU_rw, // 1 = write, 0 = read
    output   [31:0] data_from_CPU,
    input    [31:0] data_to_CPU,
    input    CPU_busy,
    output   CPU_in_valid,
    input    CPU_out_valid,
    output   CPU_prefetch_step,
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


    //////////////////////// (SDRAM request from CPU) ////////////////////////
    assign wbs_dat_o=CPU_out_valid;
    assign CPU_rw=wbs_we_i;
    assign data_from_CPU=wbs_dat_i;
    assign CPU_prefetch_step=0;
    


    


endmodule

`default_nettype wire
