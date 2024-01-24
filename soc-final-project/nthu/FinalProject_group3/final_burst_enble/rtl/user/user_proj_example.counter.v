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

module user_proj_example #(
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
//--------------------------------------------------




// -----global -------
    assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
    assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;	
    assign wbs_ack_o=  ex_ack|wb2_ack|wb3_ack|wb4_ack;
    assign wbs_dat_o = (wbs_adr_i[31:24]==8'h38) ? ex_dat_o: wb2_dat_o;

// ------ when adr=3000_0000 to wb2axi------
    wire wb2_stb;
    wire wb2_cyc;
    wire wb2_we;
    wire [3:0] wb2_sel;
    wire [31:0] wb2_dat_o;
    wire wb2_ack;
    assign wb2_stb = wbs_stb_i & (wbs_adr_i[31:24]==8'h30);
    assign wb2_cyc = wbs_cyc_i & (wbs_adr_i[31:24]==8'h30);
    assign wb2_we = wbs_we_i & (wbs_adr_i[31:24]==8'h30);
    assign wb2_sel = wbs_sel_i & {4{(wbs_adr_i[31:24]==8'h30)}};
    
    
    
    wire wb3_stb;
    wire wb3_cyc;
    wire wb3_we;
    wire [3:0] wb3_sel;
    wire [31:0] wb3_dat_o;
    wire wb3_ack;
    assign wb3_stb = wbs_stb_i & (wbs_adr_i[31:24]==8'h30);
    assign wb3_cyc = wbs_cyc_i & (wbs_adr_i[31:24]==8'h30);
    assign wb3_we = wbs_we_i & (wbs_adr_i[31:24]==8'h30);
    assign wb3_sel = wbs_sel_i & {4{(wbs_adr_i[31:24]==8'h30)}};
    
        
    wire wb4_stb;
    wire wb4_cyc;
    wire wb4_we;
    wire [3:0] wb4_sel;
    wire [31:0] wb4_dat_o;
    wire wb4_ack;
    assign wb4_stb = wbs_stb_i & (wbs_adr_i[31:24]==8'h30);
    assign wb4_cyc = wbs_cyc_i & (wbs_adr_i[31:24]==8'h30);
    assign wb4_we = wbs_we_i & (wbs_adr_i[31:24]==8'h30);
    assign wb4_sel = wbs_sel_i & {4{(wbs_adr_i[31:24]==8'h30)}};
    
    
    
    
    
    
    
    
     wire				dma1_stb_i;
     wire 				dma1_cyc_i;
     wire 				dma1_we_i;
     wire  [3:0] 			dma1_sel_i;
     wire  [(31):0]	dma1_dat_i;
     wire  [(31):0]	dma1_adr_i;
     wire 			        dma1_ack_o;
     wire [(31):0] 	dma1_dat_o;
    //there should be delete;
     wire				dma2_stb_i;
     wire 				dma2_cyc_i;
     wire 				dma2_we_i;
     wire  [3:0] 			dma2_sel_i;
     wire  [(31):0]	dma2_dat_i;
     wire  [(31):0]	dma2_adr_i;
     wire 	        dma2_ack_o;
     wire [(31):0] 	dma2_dat_o;
        
        
        
     wire				dma3_stb_i;
     wire 				dma3_cyc_i;
     wire 				dma3_we_i;
     wire  [3:0] 			dma3_sel_i;
     wire  [(31):0]	dma3_dat_i;
     wire  [(31):0]	dma3_adr_i;
     wire 	        dma3_ack_o;
     wire [(31):0] 	dma3_dat_o;
    fir_DMA fir_DMA (
     .wb_clk_i(clk),
     .wb_rst_i(rst),
     .wbs_stb_i(wb2_stb),
     .wbs_cyc_i(wb2_cyc),
     .wbs_we_i(wb2_we),
     .wbs_sel_i(wb2_sel),
     .wbs_dat_i(wbs_dat_i),
     .wbs_adr_i(wbs_adr_i),
     .wbs_ack_o(wb2_ack),
     .wbs_dat_o(wb2_dat_o),
     
     
     //dma
     .dma_stb_i(dma1_stb_i),
     .dma_cyc_i(dma1_cyc_i),
     .dma_we_i(dma1_we_i),
     .dma_sel_i(dma1_sel_i),
     .dma_dat_i(dma1_dat_i),
     .dma_adr_i(dma1_adr_i),
     .dma_ack_o(dma1_ack_o),
     .dma_dat_o(dma1_dat_o)
     
     
     
         
    );
    
   qs_DMA qs_DMA (
     .wb_clk_i(clk),
     .wb_rst_i(rst),
     .wbs_stb_i(wb3_stb),
     .wbs_cyc_i(wb3_cyc),
     .wbs_we_i(wb3_we),
     .wbs_sel_i(wb3_sel),
     .wbs_dat_i(wbs_dat_i),
     .wbs_adr_i(wbs_adr_i),
     .wbs_ack_o(wb3_ack),
     .wbs_dat_o(wb3_dat_o),
     
     
     //dma
     .dma_stb_i(dma2_stb_i),
     .dma_cyc_i(dma2_cyc_i),
     .dma_we_i(dma2_we_i),
     .dma_sel_i(dma2_sel_i),
     .dma_dat_i(dma2_dat_i),
     .dma_adr_i(dma2_adr_i),
     .dma_ack_o(dma2_ack_o),
     .dma_dat_o(dma2_dat_o)
     
     
     
         
    );


   mm_DMA mm_DMA (
     .wb_clk_i(clk),
     .wb_rst_i(rst),
     .wbs_stb_i(wb4_stb),
     .wbs_cyc_i(wb4_cyc),
     .wbs_we_i(wb4_we),
     .wbs_sel_i(wb4_sel),
     .wbs_dat_i(wbs_dat_i),
     .wbs_adr_i(wbs_adr_i),
     .wbs_ack_o(wb4_ack),
     .wbs_dat_o(wb4_dat_o),
     
     
     //dma
     .dma_stb_i(dma3_stb_i),
     .dma_cyc_i(dma3_cyc_i),
     .dma_we_i(dma3_we_i),
     .dma_sel_i(dma3_sel_i),
     .dma_dat_i(dma3_dat_i),
     .dma_adr_i(dma3_adr_i),
     .dma_ack_o(dma3_ack_o),
     .dma_dat_o(dma3_dat_o)
     
     
     
         
    );
    
    
    
     // ------ when adr=3800_0000 to exmemfir------
    wire ex_stb;
    wire ex_cyc;
    wire ex_we;
    wire [3:0] ex_sel;
    wire [31:0] ex_dat_o;
    wire ex_ack;
    assign ex_stb = wbs_stb_i & (wbs_adr_i[31:24]==8'h38);
    assign ex_cyc = wbs_cyc_i & (wbs_adr_i[31:24]==8'h38);
    assign ex_we = wbs_we_i & (wbs_adr_i[31:24]==8'h38);
    assign ex_sel = wbs_sel_i & {4{(wbs_adr_i[31:24]==8'h38)}};
  

    wishbone_arbiter arb (
     .clk(clk),
     .rst(rst),
     .wb_stb_i(wb2_stb),
     .wb_cyc_i(wb2_cyc),
     .wb_we_i(wb2_we),
     .wb_sel_i(wb2_sel),
     .wb_dat_i(wbs_dat_i),
     .wb_adr_i(wbs_adr_i),
     
     .wb1_stb_i(ex_stb),
     .wb1_cyc_i(ex_cyc),
     .wb1_we_i(ex_we),
     .wb1_sel_i(ex_sel),
     .wb1_dat_i(wbs_dat_i),
     .wb1_adr_i(wbs_adr_i),
     .wb1_ack_o(ex_ack),
     .wb1_dat_o(ex_dat_o),
     
     .wb2_stb_i(dma1_stb_i),
     .wb2_cyc_i(dma1_cyc_i),
     .wb2_we_i(dma1_we_i),
     .wb2_sel_i(dma1_sel_i),
     .wb2_dat_i(dma1_dat_i),
     .wb2_adr_i(dma1_adr_i),
     .wb2_ack_o(dma1_ack_o),
     .wb2_dat_o(dma1_dat_o),
     
     
     .wb3_stb_i(dma2_stb_i),
     .wb3_cyc_i(dma2_cyc_i),
     .wb3_we_i(dma2_we_i),
     .wb3_sel_i(dma2_sel_i),
     .wb3_dat_i(dma2_dat_i),
     .wb3_adr_i(dma2_adr_i),
     .wb3_ack_o(dma2_ack_o),
     .wb3_dat_o(dma2_dat_o),
     
     .wb4_stb_i(dma3_stb_i),
     .wb4_cyc_i(dma3_cyc_i),
     .wb4_we_i(dma3_we_i),
     .wb4_sel_i(dma3_sel_i),
     .wb4_dat_i(dma3_dat_i),
     .wb4_adr_i(dma3_adr_i),
     .wb4_ack_o(dma3_ack_o),
     .wb4_dat_o(dma3_dat_o)
     
     
    );
    

    
    
    
    
    
    
    
    
// -----Unused------------
    assign io_out = wbs_dat_o;
    assign io_oeb = {(`MPRJ_IO_PADS-1){rst}};
    assign irq = 3'b000;
    assign la_data_out = 0;	
    
endmodule



`default_nettype wire
