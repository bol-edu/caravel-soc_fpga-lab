// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_proj_example
 *
 * This is an example of a (trivially simple) user project,
 * showing how the user project can connect to the logic
 * analyzer, the wishbone bus, and the I/O pads.
 *
 * This project generates an integer count, which is output
 * on the user area GPIO pads (digital output only).  The
 * wishbone connection allows the project to be controlled
 * (start and stop) from the management SoC program.
 *
 * See the testbenches in directory "mprj_counter" for the
 * example programs that drive this user project.  The three
 * testbenches are "io_ports", "la_test1", and "la_test2".
 *
 *-------------------------------------------------------------
 */

// `define MPRJ_IO_PADS_1 19	/* number of user GPIO pads on user1 side */
// `define MPRJ_IO_PADS_2 19	/* number of user GPIO pads on user2 side */
// `define MPRJ_IO_PADS (`MPRJ_IO_PADS_1 + `MPRJ_IO_PADS_2)

module user_project_exmem (
    `ifdef USE_POWER_PINS
        inout vccd1,	// User area 1 1.8V supply
        inout vssd1,	// User area 1 digital ground
    `endif
    // Wishbone Slave ports (WB MI A)
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

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    output [2:0] irq
);
    wire clk;
    wire rst;

    wire [`MPRJ_IO_PADS-1:0] io_in;
    wire [`MPRJ_IO_PADS-1:0] io_out;
    wire [`MPRJ_IO_PADS-1:0] io_oeb;

    // TODO: Lab4-1: EXMEM
    // ! Don't-care signals in our project
    // ===LA Signals===
    // la_data_in: (ignored: output)
    assign la_data_out = 0;
    // la_oenb: (ignored: output)

    // ===IOs Signals===
    // io_in: (ignored: output)
    assign io_out = 0;
    assign io_oeb = 0;

    // ===IRQ Signals===
    assign irq = 0;

    // // Main Logics
    // localparam DELAY = 10;
    // localparam WIDTH = 32;

    // wire wbs_adr_hit;
    // wire wbs_valid;
    
    // wire [3:0]  bram_we0;
    // wire        bram_en0;
    // wire [WIDTH-1:0] bram_wdata;
    // wire [WIDTH-1:0] bram_rdata;
    // wire [WIDTH-1:0] bram_addr;
    // // assign bram_we0 = {4{wbs_cyc_i}} & {4{wbs_we_i}} & wbs_sel_i;
    // assign bram_we0 = {4{wbs_we_i}} & wbs_sel_i;
    // assign bram_en0 = wbs_valid; // Enable when valid WB read/write
    // assign bram_wdata = wbs_dat_i;
    // // bram_rdata: (ignored: output)
    // assign bram_addr = wbs_adr_i; 

    // bram user_bram (
    //     .CLK(clk),
    //     .WE0(bram_we0),
    //     .EN0(bram_en0),
    //     .Di0(bram_wdata),
    //     .Do0(bram_rdata),
    //     .A0(bram_addr)
    // );

    // ~ CLK & RST
    assign clk = wb_clk_i;
    assign rst = wb_rst_i;

    // // ~ Main FFs
    // reg         ready_r, ready_w;
    // reg  [3:0]  count_r, count_w;
    // wire [3:0]  count_nxt = count_r + 1'd1;

    // // ~ Main output logic
    // assign wbs_ack_o = ready_r;
    // assign wbs_dat_o = bram_rdata;

    // assign wbs_adr_hit = (wbs_adr_i[31:20]==12'h380) ? 1 : 0;
    // assign wbs_valid = wbs_cyc_i && wbs_stb_i && wbs_adr_hit;

    // always @(*) begin
    //     ready_w = 0;
    //     count_w = count_r;
    //     if (wbs_valid && !ready_r) begin
    //         if (count_r==DELAY) begin
    //             ready_w = 1;
    //             count_w = 0;
    //         end 
    //         else begin
    //             count_w = count_nxt;
    //         end
    //     end
    // end

    // always @(posedge clk) begin
    //     if(rst) begin
    //         ready_r <= 0;
    //         count_r <= 0;
    //     end
    //     else begin
    //         ready_r <= ready_w;
    //         count_r <= count_w;
    //     end
    // end

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

    wire         stb;
    wire         cyc;	// command strobe -request
    wire         we;		// 1: write, 0: read
    wire  [3:0]  sel;		// byte-enable
    wire  [31:0] dat;	// data in
    wire  [31:0] adr;		// address in
    
    assign we = wbs_we_i;
    assign sel = wbs_sel_i;
    assign dat = wbs_dat_i;
    assign adr = wbs_adr_i;
    assign cyc = wbs_cyc_i && (wbs_adr_i[31:20]==12'h380); // check addr too
    assign stb = wbs_stb_i;

    wire valid;

    wire [22:0] ctrl_addr;
    wire ctrl_busy;
    wire ctrl_in_valid, ctrl_out_valid;
    reg ctrl_in_valid_q;
    
    assign valid = cyc && stb;
    assign ctrl_in_valid = we ? valid : ~ctrl_in_valid_q && valid;
     
    assign bram_mask = sel & {4{we}};
    assign ctrl_addr = adr[22:0];

    wire rst_n;
    assign rst_n = ~rst;
    always @(posedge clk) begin
        if (rst) begin
            ctrl_in_valid_q <= 1'b0;
        end
        else begin
            if (~we && valid && ~ctrl_busy && ctrl_in_valid_q == 1'b0)
                ctrl_in_valid_q <= 1'b1;
            else if (ctrl_out_valid)
                ctrl_in_valid_q <= 1'b0;
        end
    end

    wire bus_ack_o;
    wire [31:0] bus_dat_o;
    assign bus_ack_o = (we) ? ~ctrl_busy && valid : ctrl_out_valid;

    assign wbs_ack_o = bus_ack_o;
    assign wbs_dat_o = bus_dat_o;

    sdram_controller user_sdram_controller (
        .clk       (clk),
        .rst       (rst),
        // To SDRAM
        .sdram_cle (sdram_cle),
        .sdram_cs  (sdram_cs),
        .sdram_cas (sdram_cas),
        .sdram_ras (sdram_ras),
        .sdram_we  (sdram_we),
        .sdram_dqm (sdram_dqm),
        .sdram_ba  (sdram_ba),
        .sdram_a   (sdram_a),
        .sdram_dqi (d2c_data),
        .sdram_dqo (c2d_data),
        // SDRAM Control Signals
        .user_addr (ctrl_addr),
        .rw        (we),
        .data_in   (dat),
        .data_out  (bus_dat_o),
        .busy      (ctrl_busy),
        .in_valid  (ctrl_in_valid),
        .out_valid (ctrl_out_valid)
    );
    sdr user_bram (
        .Rst_n (rst_n),
        .Clk   (clk),
        .Cke   (sdram_cle),
        .Cs_n  (sdram_cs),
        .Ras_n (sdram_ras),
        .Cas_n (sdram_cas),
        .We_n  (sdram_we),
        .Addr  (sdram_a),
        .Ba    (sdram_ba),
        .Dqm   (bram_mask),
        .Dqi   (c2d_data),
        .Dqo   (d2c_data)
    );

endmodule

`default_nettype wire
