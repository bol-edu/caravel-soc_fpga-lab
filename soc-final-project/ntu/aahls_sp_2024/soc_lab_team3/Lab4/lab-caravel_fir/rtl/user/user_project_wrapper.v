`timescale 1ns / 1ps
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
`define MPRJ_IO_PADS 38

module user_project_wrapper #(
    parameter BITS = 32
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

    wire        usr_decode; // If MPRJ_addr = 0x3800_0000
    wire        fir_decode; // If MPRJ_addr = 0x3000_0000
    wire        fir_strin;
    wire        fir_strout;
    
//  AXI-Lite Interaface
    wire        awready;
    wire        wready; 
    wire        awvalid;
    wire [31:0] awaddr; 
    wire        wvalid; 
    wire [31:0] wdata;  
    wire        arready;
    wire        rready;
    wire        arvalid;
    wire [31:0] araddr;
    wire        rvalid;
    wire [31:0] rdata;
    
//  AXI-Stream Interface
    wire        ss_tvalid; 
    wire [31:0] ss_tdata;
    wire        ss_tlast;
    wire        ss_tready; 
    wire        sm_tready;
    wire        sm_tvalid;
    wire [31:0] sm_tdata;
    wire        sm_tlast;
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
    
    
    // WB-to-AXI
    wire        axi_w_ack; // axilite WRITE
    wire [31:0] axi_r_dat; // axilite READ data
    wire        axi_r_ack; // axilite READ 
    wire        axi_s_ack; // axis
    wire [31:0] axi_m_dat; // axis data-out
    wire        axi_m_ack; // axis
    
    wire [31:0] usr_dat_o;
    wire        usr_ack_o;
    
    reg         tmp_wb_ack;
    reg  [31:0] tmp_wb_dat;
    
//====================== WB Address Decode =========================
    // User project memory starting:  0x3800_0000
    // User project FIR base address: 0x3000_0000 
    assign usr_decode = (wbs_adr_i[31:16] == 16'h3800)? 1'b1 : 1'b0; // Send to user project memory
    assign fir_decode = (wbs_adr_i[31:16] == 16'h3000)? 1'b1 : 1'b0; // Send to FIR
    assign fir_strin  = (fir_decode && wbs_adr_i[15:0] == 16'h0080)? 1'b1 : 1'b0;
    assign fir_strout = (fir_decode && wbs_adr_i[15:0] == 16'h0084)? 1'b1 : 1'b0;
    
    assign wbs_ack_o = tmp_wb_ack; // ready
    assign wbs_dat_o = tmp_wb_dat;
    
//------------------------- WB-to-AXI ------------------------------
    // AXI WRITE 
    assign awvalid   = fir_decode && (!fir_strin) && (!fir_strout) && wbs_cyc_i && wbs_stb_i && wbs_we_i; // address valid when processing(CYC)
    assign wvalid    = fir_decode && (!fir_strin) && (!fir_strout) && wbs_cyc_i && wbs_stb_i && wbs_we_i; // data valid when strobe
    assign awaddr    = wbs_adr_i; 
    assign wdata     = wbs_dat_i;
    assign axi_w_ack = wready && wvalid;
    
    // AXI READ
    assign arvalid   = fir_decode && wbs_cyc_i && wbs_stb_i && (!wbs_we_i);
    assign rready    = fir_decode && wbs_cyc_i && wbs_stb_i && (!wbs_we_i);
    assign araddr    = wbs_adr_i;
    assign axi_r_dat = rdata;
    assign axi_r_ack = rvalid && rready;
    
    // Input FIR (Stream-in)
    assign ss_tvalid = wbs_cyc_i && wbs_stb_i && fir_strin;
    assign ss_tdata  = wbs_dat_i;
    assign axi_s_ack = ss_tready;
    
    // FIR output (Stream-out)
    assign sm_tready = wbs_cyc_i && wbs_stb_i && fir_strout;
    assign axi_m_dat = sm_tdata;   // Y from FIR
    assign axi_m_ack = sm_tvalid;
    
    assign axis_clk   = wb_clk_i; 
    assign axis_rst_n = ~wb_rst_i; // WB: active high AXI: active low
    
    always @* begin
        if (fir_decode) begin
            if (wbs_we_i) begin // WRITE
                if (wbs_adr_i[7:0] == 8'h80) begin // WRITE X (stream)
                    tmp_wb_ack = axi_s_ack; // ss
                    tmp_wb_dat = 32'dx;
                end
                else begin    // 0x40:TAP 0x10:data_length 0x00:ap_ctrl
                    tmp_wb_ack = axi_w_ack; // AXI 
                    tmp_wb_dat = 32'dx;
                end
            end
            else begin          // READ
                if (wbs_adr_i[7:0] == 8'h84) begin // READ Y (stream)
                    tmp_wb_ack = axi_m_ack; // sm_tvalid
                    tmp_wb_dat = axi_m_dat; // sm_tdata
                end
                else begin    // 0x40:TAP 0x00:ap_ctrl both using AXI
                    tmp_wb_ack = axi_r_ack; 
                    tmp_wb_dat = axi_r_dat;
                end
            end
        end
        else begin
            tmp_wb_ack = usr_ack_o;
            tmp_wb_dat = usr_dat_o;
        end
    end

/*--------------------------------------*/
/*  User project is instantiated here   */
/*--------------------------------------*/

    user_proj_example mprj (
    `ifdef USE_POWER_PINS
	    .vccd1(vccd1),	// User area 1 1.8V power
        .vssd1(vssd1),	// User area 1 digital ground
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
        .la_data_out(la_data_out),
        .la_oenb (la_oenb),

        // IO Pads

        .io_in (io_in),
        .io_out(io_out),
        .io_oeb(io_oeb),

        // IRQ
        .irq(user_irq)
    );

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


endmodule	// user_project_wrapper

`default_nettype wire