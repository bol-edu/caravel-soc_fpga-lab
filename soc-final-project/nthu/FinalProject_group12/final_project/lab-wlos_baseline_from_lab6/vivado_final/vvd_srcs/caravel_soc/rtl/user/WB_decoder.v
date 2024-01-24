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

//`default_nettype none // modified by us
`default_nettype wire // modified by us
`define MPRJ_IO_PADS_1 19	/* number of user GPIO pads on user1 side */ // modified by us
`define MPRJ_IO_PADS_2 19	/* number of user GPIO pads on user2 side */ // modified by us
`define MPRJ_IO_PADS (`MPRJ_IO_PADS_1 + `MPRJ_IO_PADS_2) // modified by us
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

/////module user_proj_example #(
module WB_decoder #(
    parameter BITS = 32,
    parameter DELAYS=10,
    parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32
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
    
    ///////////////////////////////////////// (For test) /////////////////////////////////////////
    wire test2;

    assign test2=(wbs_adr_i==32'h38000218);

    //////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    wire clk;
    wire rst;

    wire [`MPRJ_IO_PADS-1:0] io_in;
    wire [`MPRJ_IO_PADS-1:0] io_out;
    wire [`MPRJ_IO_PADS-1:0] io_oeb;

    ///////////////////////////////// Added /////////////////////////////////
    reg wbs_stb_SDRAM;
    reg wbs_cyc_SDRAM;
    reg wbs_stb_WB_FIR;
    reg wbs_cyc_WB_FIR;
    reg wbs_stb_WB_MM;
    reg wbs_cyc_WB_MM;

    always @* begin
        if(decoded==2'b01) begin
            wbs_stb_SDRAM=0;
            wbs_cyc_SDRAM=0;
            wbs_stb_WB_FIR=wbs_stb_i;
            wbs_cyc_WB_FIR=wbs_cyc_i;
            wbs_stb_WB_MM=0;
            wbs_cyc_WB_MM=0;
        end
        else if(decoded==2'b10) begin
            wbs_stb_SDRAM=0;
            wbs_cyc_SDRAM=0;
            wbs_stb_WB_FIR=0;
            wbs_cyc_WB_FIR=0;
            wbs_stb_WB_MM=wbs_stb_i;
            wbs_cyc_WB_MM=wbs_cyc_i;
        end
        else if(decoded==2'b11) begin
            wbs_stb_SDRAM=wbs_stb_i;
            wbs_cyc_SDRAM=wbs_cyc_i;
            wbs_stb_WB_FIR=0;
            wbs_cyc_WB_FIR=0;
            wbs_stb_WB_MM=0;
            wbs_cyc_WB_MM=0;
        end
        else begin
            wbs_stb_SDRAM=0;
            wbs_cyc_SDRAM=0;
            wbs_stb_WB_FIR=0;
            wbs_cyc_WB_FIR=0;
            wbs_stb_WB_MM=0;
            wbs_cyc_WB_MM=0;
        end
    end
    /*wire wbs_stb_SDRAM;
    wire wbs_cyc_SDRAM;
    wire wbs_stb_WB_FIR;
    wire wbs_cyc_WB_FIR;

    assign wbs_stb_SDRAM=wbs_stb_i;
    assign wbs_stb_WB_FIR=wbs_stb_i;
    assign wbs_cyc_SDRAM=wbs_cyc_i;
    assign wbs_cyc_WB_FIR=wbs_cyc_i;*/

    wire wbs_we_SDRAM;
    wire wbs_we_WB_FIR;
    wire wbs_we_WB_MM;

    assign wbs_we_SDRAM=wbs_we_i;
    assign wbs_we_WB_FIR=wbs_we_i;
    assign wbs_we_WB_MM=wbs_we_i;

    wire [3:0] wbs_sel_SDRAM;
    wire [3:0] wbs_sel_WB_FIR;
    wire [3:0] wbs_sel_WB_MM;

    assign wbs_sel_SDRAM=wbs_sel_i;
    assign wbs_sel_WB_FIR=wbs_sel_i;
    assign wbs_sel_WB_MM=wbs_sel_i;

    wire [31:0] input_address_SDRAM;
    wire [31:0] input_address_WB_FIR; // to be more specific, it's "[(pADDR_WIDTH-1):0]"
    wire [31:0] input_address_WB_MM; // to be more specific, it's "[(pADDR_WIDTH-1):0]"

    assign input_address_SDRAM=wbs_adr_i;
    /////assign input_address_WB_FIR=wbs_adr_i[11:0];
    assign input_address_WB_FIR=wbs_adr_i;
    assign input_address_WB_MM=wbs_adr_i;

    wire [31:0] input_data_SDRAM;
    wire [31:0] input_data_WB_FIR;
    wire [31:0] input_data_WB_MM;

    assign input_data_SDRAM=wbs_dat_i;
    assign input_data_WB_FIR=wbs_dat_i;
    assign input_data_WB_MM=wbs_dat_i;
    
    reg merged_output_ACK;
    wire wbs_ack_SDRAM;
    wire wbs_ack_WB_FIR;
    wire wbs_ack_WB_MM;
    reg [31:0] merged_output_data;
    wire [31:0] output_data_SDRAM;
    wire [31:0] output_data_WB_FIR;
    wire [31:0] output_data_WB_MM;

    always @* begin
        if(decoded==2'b01) begin
            merged_output_data=output_data_WB_FIR;
            merged_output_ACK=wbs_ack_WB_FIR;
        end
        else if(decoded==2'b10) begin
            merged_output_data=output_data_WB_MM;
            merged_output_ACK=wbs_ack_WB_MM;
        end
        else if(decoded==2'b11) begin
            merged_output_data=output_data_SDRAM;
            merged_output_ACK=wbs_ack_SDRAM;
        end
        else begin
            merged_output_data=0;
            merged_output_ACK=0;
        end
    end


    ////////////////////////// global signal //////////////////////////
    reg [1:0] decoded;

    // Assuming LA probes [65:64] are for controlling the SDRAM clk & reset  
    assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
    assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;

    //assign decoded = wbs_adr_i[31:20] == 12'h380 ? 1'b1 : 1'b0;
    always @* begin
        if(wbs_adr_i[31:20] == 12'h380) begin  // SDRAM
            decoded=2'b11;
        end
        //else if((wbs_adr_i[31:20] == 12'h300) && (wbs_adr_i[19] == 0)) begin
        else if(wbs_adr_i[31:16] == 16'h3000) begin  // FIR
            decoded=2'b01;
        end
        //else if((wbs_adr_i[31:20] == 12'h300) && (wbs_adr_i[19] == 1)) begin
        else if(wbs_adr_i[31:16] == 16'h3001) begin  // MM
            decoded=2'b10;
        end
        else begin
            decoded=2'b00;
        end
    end


    ////////////////////////// interface output //////////////////////////
    assign wbs_dat_o = merged_output_data;
    //assign wdata = wbs_dat_i;
    assign wbs_ack_o = merged_output_ACK;

    // IO
    assign io_out = merged_output_data;
    assign io_oeb = {(`MPRJ_IO_PADS-1){rst}};

    // IRQ
    assign irq = 3'b000;	// Not implemented here

    // LA
    assign la_data_out = {{(127-BITS){1'b0}}, merged_output_data};



    ////////////////////////// FIR branch //////////////////////////
    wire [22:0] FIR_address;
    wire FIR_rw;
    wire [31:0] data_from_FIR;
    wire [31:0] data_to_FIR;
    wire FIR_busy;
    wire FIR_in_valid;
    wire FIR_out_valid;
    wire FIR_prefetch_step;

    DMA_FIR DMA_FIR_U0 (

        // WB interface
        .wb_clk_i(clk),
        .wb_rst_i(rst),
        .wbs_stb_i(wbs_stb_WB_FIR),
        .wbs_cyc_i(wbs_cyc_WB_FIR),
        .wbs_we_i(wbs_we_WB_FIR),
        .wbs_sel_i(wbs_sel_WB_FIR),
        .wbs_dat_i(input_data_WB_FIR),
        .wbs_adr_i(input_address_WB_FIR),
        .wbs_ack_o(wbs_ack_WB_FIR),
        .wbs_dat_o(output_data_WB_FIR),

        // SDRAM request from FIR (controller interface)
        .FIR_address(FIR_address),
        .FIR_rw(FIR_rw),
        .data_from_FIR(data_from_FIR),
        .data_to_FIR(data_to_FIR),
        .FIR_busy(FIR_busy),
        .FIR_in_valid(FIR_in_valid),
        .FIR_out_valid(FIR_out_valid),
        .FIR_prefetch_step(FIR_prefetch_step)

    );

    ////////////////////////// MM branch //////////////////////////
    wire [22:0] MM_address;
    wire MM_rw;
    wire [31:0] data_from_MM;
    wire [31:0] data_to_MM;
    wire MM_busy;
    wire MM_in_valid;
    wire MM_out_valid;
    wire MM_prefetch_step;

    DMA_MM DMA_MM_U0 (

        // WB interface
        .wb_clk_i(clk),
        .wb_rst_i(rst),
        .wbs_stb_i(wbs_stb_WB_MM),
        .wbs_cyc_i(wbs_cyc_WB_MM),
        .wbs_we_i(wbs_we_WB_MM),
        .wbs_sel_i(wbs_sel_WB_MM),
        .wbs_dat_i(input_data_WB_MM),
        .wbs_adr_i(input_address_WB_MM),
        .wbs_ack_o(wbs_ack_WB_MM),
        .wbs_dat_o(output_data_WB_MM),

        // SDRAM request from MM (controller interface)
        .MM_address(MM_address),
        .MM_rw(MM_rw),
        .data_from_MM(data_from_MM),
        .data_to_MM(data_to_MM),
        .MM_busy(MM_busy),
        .MM_in_valid(MM_in_valid),
        .MM_out_valid(MM_out_valid),
        .MM_prefetch_step(MM_prefetch_step)

    );
    
    ////////////////////////// SDRAM branch //////////////////////////

    WB_to_controller WB_to_controller_U0 (

        // WB interface
        .wb_clk_i(clk),
        .wb_rst_i(rst),
        .wbs_stb_i(wbs_stb_SDRAM),
        .wbs_cyc_i(wbs_cyc_SDRAM),
        .wbs_we_i(wbs_we_SDRAM),
        .wbs_sel_i(wbs_sel_SDRAM),
        .wbs_dat_i(input_data_SDRAM),
        .wbs_adr_i(input_address_SDRAM),
        .wbs_ack_o(wbs_ack_SDRAM),
        .wbs_dat_o(output_data_SDRAM),

        // SDRAM request from FIR (controller interface)
        .FIR_address(FIR_address),
        .FIR_rw(FIR_rw),
        .data_from_FIR(data_from_FIR),
        .data_to_FIR(data_to_FIR),
        .FIR_busy(FIR_busy),
        .FIR_in_valid(FIR_in_valid),
        .FIR_out_valid(FIR_out_valid),
        .FIR_prefetch_step(FIR_prefetch_step),

        // SDRAM request from MM (controller interface)
        .MM_address(MM_address),
        .MM_rw(MM_rw),
        .data_from_MM(data_from_MM),
        .data_to_MM(data_to_MM),
        .MM_busy(MM_busy),
        .MM_in_valid(MM_in_valid),
        .MM_out_valid(MM_out_valid),
        .MM_prefetch_step(MM_prefetch_step)

    );


endmodule

`default_nettype wire
