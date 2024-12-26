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

`default_nettype wire
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32,
    parameter pADDR_WIDTH = 32,
    parameter pDATA_WIDTH = 32
) (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
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

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);
    // Wishbone
    wire [(pDATA_WIDTH-1):0] usr_dat_o;
    wire        usr_ack_o;
    
    wire [(pDATA_WIDTH-1):0] uart_dat_o;
    wire        uart_ack_o;

    /*--------------------------------------*/
    /*  User project (EXMEM) is instantiated here   */
    /*--------------------------------------*/
    user_project_exmem exmem (
        `ifdef USE_POWER_PINS
            // .vccd1(vccd1),	// User area 1 1.8V power
            // .vssd1(vssd1),	// User area 1 digital ground
            .vccd1(),	// User area 1 1.8V power
            .vssd1(),	// User area 1 digital ground
        `endif
        .wb_clk_i(wb_clk_i),
        .wb_rst_i(wb_rst_i),
        // MGMT SoC Wishbone Slave
        .wbs_cyc_i(wbs_cyc_i),
        .wbs_stb_i(wbs_stb_i),
        .wbs_we_i(wbs_we_i),
        .wbs_sel_i(wbs_sel_i),
        .wbs_adr_i(wbs_adr_i),
        .wbs_dat_i(wbs_dat_i),
        .wbs_ack_o(usr_ack_o), // take the WB_READY from user project FIR
        .wbs_dat_o(usr_dat_o), // tale the output from user project FIR
        // Logic Analyzer
        .la_data_in(la_data_in),
        // .la_data_out(la_data_out),
        .la_data_out(),
        .la_oenb (la_oenb),
        // IO Pads
        .io_in (io_in),
        // .io_out(io_out),
        // .io_oeb(io_oeb),
        .io_out(),
        .io_oeb(),
        // IRQ
        // .irq(user_irq)
        .irq()
    );

    /*--------------------------------------*/
    /* User project (UART) is instantiated  here   */
    /*--------------------------------------*/
    user_project_uart #(
        .BAUD_RATE(115200)
    ) 
    uart (
    `ifdef USE_POWER_PINS
        .vccd1(vccd1),	// User area 1 1.8V power
        .vssd1(vssd1),	// User area 1 digital ground
    `endif
        .wb_clk_i(wb_clk_i),
        .wb_rst_i(wb_rst_i),

        // MGMT SoC Wishbone Slave

        .wbs_stb_i(wbs_stb_i),
        .wbs_cyc_i(wbs_cyc_i),
        .wbs_we_i(wbs_we_i),
        .wbs_sel_i(wbs_sel_i),
        .wbs_dat_i(wbs_dat_i),
        .wbs_adr_i(wbs_adr_i),
        .wbs_ack_o(uart_ack_o),
        .wbs_dat_o(uart_dat_o),

        // IO ports
        .io_in  (io_in      ),
        .io_out (io_out     ),
        .io_oeb (io_oeb     ),

        // irq
        .user_irq (user_irq)
    );

    // AXI-Lite Interface
    wire        awready;
    wire        wready; 
    wire        awvalid;
    wire [(pADDR_WIDTH-1):0] awaddr; 
    wire        wvalid; 
    wire [(pDATA_WIDTH-1):0] wdata;  
    wire        arready;
    wire        rready;
    wire        arvalid;
    wire [(pADDR_WIDTH-1):0] araddr;
    wire        rvalid;
    wire [(pDATA_WIDTH-1):0] rdata;
    
    // AXI-Stream Interface (FIR)
    wire        ss_tvalid; 
    wire [(pDATA_WIDTH-1):0] ss_tdata;
    wire        ss_tlast;
    wire        ss_tready; 
    wire        sm_tready;
    wire        sm_tvalid;
    wire [(pDATA_WIDTH-1):0] sm_tdata;
    wire        sm_tlast;

    // Default
    wire        axis_clk;
    wire        axis_rst_n;  // Active Low (~wb_rst_i)
    
    // ram for tap
    wire [3:0]  tap_WE;
    wire        tap_EN;
    wire [31:0] tap_Di;
    wire [31:0] tap_A;
    wire [31:0] tap_Do;

    // ram for data RAM
    wire [3:0]  data_WE;
    wire        data_EN;
    wire [31:0] data_Di;
    wire [31:0] data_A;
    wire [31:0] data_Do;

    /*--------------------------------------*/
    /*  Hardware FIR is instantiated here   */
    /*--------------------------------------*/
    fir fir_hardware(
        // AXI-lite
        .awready(awready),
        .wready(wready),
        .awvalid(awvalid),
        .awaddr(awaddr),
        .wvalid(wvalid),
        .wdata(wdata),
        .arready(arready),
        .rready(rready),
        .arvalid(arvalid),
        .araddr(araddr),
        .rvalid(rvalid),
        .rdata(rdata),
        // AXI-Stream
        .ss_tvalid(ss_tvalid),
        .ss_tdata(ss_tdata),
        .ss_tlast(ss_tlast),
        .ss_tready(ss_tready),
        .sm_tready(sm_tready),
        .sm_tvalid(sm_tvalid),
        .sm_tdata(sm_tdata),
        .sm_tlast(sm_tlast),
        // ram for tap
        .tap_WE(tap_WE),
        .tap_EN(tap_EN),
        .tap_Di(tap_Di),
        .tap_A(tap_A),
        .tap_Do(tap_Do),
        // ram for data
        .data_WE(data_WE),
        .data_EN(data_EN),
        .data_Di(data_Di),
        .data_A(data_A),
        .data_Do(data_Do),
        // default
        .axis_clk(axis_clk),
        .axis_rst_n(axis_rst_n)
    );

    bram11 tap_RAM (
        .CLK(axis_clk),
        .WE(tap_WE),
        .EN(tap_EN),
        .A(tap_A),
        .Di(tap_Di),
        .Do(tap_Do)
    );

    bram11 data_RAM (
        .CLK(axis_clk),
        .WE(data_WE),
        .EN(data_EN),
        .A(data_A),
        .Di(data_Di),
        .Do(data_Do)
    );

    /*--------------------------------------*/
    /*  wb2axi Decoder is instantiated here */
    /*--------------------------------------*/
    wb2axi wb2axi (
        // Wishbone Slave ports (WB MI A)
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
        //----------- AXI-Lite Interface (Read/Write Transaction) ------
        .awready(awready),    
        .wready(wready),  
        .awvalid(awvalid),
        .wvalid(wvalid),
        .awaddr(awaddr),   
        .wdata(wdata),  
        .arready(arready), 
        .rready(rready), 
        .arvalid(arvalid), 
        .rvalid(rvalid), 
        .araddr(araddr), 
        .rdata(rdata),  
        //------------------ AXI-Stream In X[n] (FIR) ----------------------
        .ss_tready(ss_tready),
        .ss_tvalid(ss_tvalid),
        .ss_tdata(ss_tdata), 
        .ss_tlast(ss_tlast),
        //----------------- AXI-Stream Out Y[t] (FIR) ----------------------
        .sm_tready(sm_tready),
        .sm_tvalid(sm_tvalid),
        .sm_tdata(sm_tdata),  
        .sm_tlast(sm_tlast), 
        //----------------- Default ----------------------
        .axis_clk(axis_clk),
        .axis_rst_n(axis_rst_n),
        //----------------- EXMEM Project -----------------
        .usr_dat_o(usr_dat_o),
        .usr_ack_o(usr_ack_o),
        //----------------- UART Project -----------------
        .uart_dat_o(uart_dat_o),
        .uart_ack_o(uart_ack_o)
    );

endmodule	// user_project_wrapper

`default_nettype wire
