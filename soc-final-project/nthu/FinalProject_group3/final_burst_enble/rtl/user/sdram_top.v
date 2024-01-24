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
`define MPRJ_IO_PADS 38

module sdram_top #(
    parameter BITS = 32,
    parameter DELAYS=10
)(
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
    output [31:0] wbs_dat_o

    // Logic Analyzer Signals
    //input  [127:0] la_data_in,
    //output [127:0] la_data_out,
    //input  [127:0] la_oenb,

    // IOs
    //input  [`MPRJ_IO_PADS-1:0] io_in,
    //output [`MPRJ_IO_PADS-1:0] io_out,
    //output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    //output [2:0] irq
);
    wire clk;
    wire rst, rst_n;

    //wire [`MPRJ_IO_PADS-1:0] io_in;
    //wire [`MPRJ_IO_PADS-1:0] io_out;
    //wire [`MPRJ_IO_PADS-1:0] io_oeb;

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

    wire [22:0] ctrl_addr;
    wire ctrl_busy;
    wire ctrl_in_valid, ctrl_out_valid;

    reg ctrl_in_valid_q;
    
    // WB MI A
    
    assign valid = wbs_stb_i && wbs_cyc_i;
    assign ctrl_in_valid = wbs_we_i ? valid : ~ctrl_in_valid_q && valid;
    assign wbs_ack_o = (wbs_we_i) ? ~ctrl_busy && valid : ctrl_out_valid; 
    assign bram_mask = wbs_sel_i & {4{wbs_we_i}};
    assign ctrl_addr = wbs_adr_i[22:0];

    // IO
    // assign io_out = d2c_data;
    // assign io_oeb = {(`MPRJ_IO_PADS-1){rst}};

    // IRQ
    // assign irq = 3'b000;	// Unused

    // LA
    //  assign la_data_out = {{(127-BITS){1'b0}}, d2c_data};
    //  Assuming LA probes [65:64] are for controlling the count clk & reset  
    //  assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
    //  assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;
      assign clk =  wb_clk_i;
      assign rst =  wb_rst_i;
    assign rst_n = ~rst;

    always @(posedge clk) begin
        if (rst) begin
            ctrl_in_valid_q <= 1'b0;
        end
        else begin
            if (~wbs_we_i && valid && ~ctrl_busy && ctrl_in_valid_q == 1'b0)
                ctrl_in_valid_q <= 1'b1;
            else if (ctrl_out_valid)
                ctrl_in_valid_q <= 1'b0;
        end
    end
/*
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
        .rw        (wbs_we_i),
        .data_in   (wbs_dat_i),
        .data_out  (wbs_dat_o),
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
    );*/




    sdram_controller_example user_sdram_controller_test (
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
        .rw        (wbs_we_i),
        .data_in   (wbs_dat_i),
        .data_out  (wbs_dat_o),
        .busy      (ctrl_busy),
        .in_valid  (ctrl_in_valid),
        .out_valid (ctrl_out_valid)
    );

    sdr_example user_bram (
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
