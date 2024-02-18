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

//`timescale 1 ns / 1 ps

module fsic_tb;
	reg clock;
        reg RSTB;
	reg CSB;

	reg power1, power2;

	wire gpio;
	wire uart_tx;
	wire [37:0] mprj_io;
	wire checkbits;

	assign checkbits  = mprj_io[37];
	assign uart_tx = mprj_io[6];

	always #12.5 clock <= (clock === 1'b0);

	initial begin
		clock = 0;
	end

	// assign mprj_io[3] = 1'b1;

	initial begin
		$dumpfile("fsic.vcd");
		$dumpvars(0, fsic_tb);

		// Repeat cycles of 1000 clock edges as needed to complete testbench
		repeat (250) begin
			repeat (1000) @(posedge clock);
			// $display("+1000 cycles");
		end
		$display("%c[1;31m",27);
		`ifdef GL
			$display ("Monitor: Timeout, Test LA (GL) Failed");
		`else
			$display ("Monitor: Timeout, Test LA (RTL) Failed");
		`endif
		$display("%c[0m",27);
		$finish;
	end

	initial begin
		wait(checkbits == 1'b0);
		$display("FSIC Test started");

		wait(checkbits == 1'b1);
		$display("FSIC FW reading FSIC modules Test passed");

		#10000;
		$finish;
	end

	initial begin
		RSTB <= 1'b0;
		CSB  <= 1'b1;		// Force CSB high
		#2000;
		RSTB <= 1'b1;	    	// Release reset
		#170000;
		CSB = 1'b0;		// CSB can be released
	end

	initial begin		// Power-up sequence
		power1 <= 1'b0;
		power2 <= 1'b0;
		#200;
		power1 <= 1'b1;
		#200;
		power2 <= 1'b1;
	end

	wire flash_csb;
	wire flash_clk;
	wire flash_io0;
	wire flash_io1;

	wire VDD1V8;
	wire VDD3V3;
	wire VSS;


        wire  [31:0] romcode_Addr_A;
        wire         romcode_EN_A;
        wire  [3:0]  romcode_WEN_A;
        wire  [31:0] romcode_Din_A;
        wire  [31:0] romcode_Dout_A;
        wire         romcode_Clk_A;
        wire         romcode_Rst_A;

    
	assign VDD3V3 = power1;
	assign VDD1V8 = power2;
	assign VSS = 1'b0;

	assign mprj_io[3] = 1;  // Force CSB high.
	assign mprj_io[0] = 0;  // Disable debug mode

	caravel uut (
/*
		.vddio	  (VDD3V3),
		.vddio_2  (VDD3V3),
		.vssio	  (VSS),
		.vssio_2  (VSS),
		.vdda	  (VDD3V3),
		.vssa	  (VSS),
		.vccd	  (VDD1V8),
		.vssd	  (VSS),
		.vdda1    (VDD3V3),
		.vdda1_2  (VDD3V3),
		.vdda2    (VDD3V3),
		.vssa1	  (VSS),
		.vssa1_2  (VSS),
		.vssa2	  (VSS),
		.vccd1	  (VDD1V8),
		.vccd2	  (VDD1V8),
		.vssd1	  (VSS),
		.vssd2	  (VSS),
*/
		.clock    (clock),
		.gpio     (gpio),
		.mprj_io  (mprj_io),
		.flash_csb(flash_csb),
		.flash_clk(flash_clk),
		.flash_io0(flash_io0),
		.flash_io1(flash_io1),
		.resetb	  (RSTB)
	);

	spiflash spiflash (
		.ap_clk(clock),
                .ap_rst(RSTB),
                .romcode_Addr_A(romcode_Addr_A),
                .romcode_EN_A(romcode_EN_A),
                .romcode_WEN_A(romcode_WEN_A),
                .romcode_Din_A(romcode_Din_A),
                .romcode_Dout_A(romcode_Dout_A),
                .romcode_Clk_A(romcode_Clk_A),
                .romcode_Rst_A(romcode_Rst_A),
                .csb(flash_csb),
                .spiclk(flash_clk),
		.io0(flash_io0),
		.io1(flash_io1)
	);

        bram #(
             .FILENAME("fsic.hex")
        ) bram (
                 .CLK(clock),
                 .WE0(romcode_WEN_A),
                 .EN0(romcode_EN_A),
                 .Di0(romcode_Din_A),
                 .Do0(romcode_Dout_A),
                 .A0(romcode_Addr_A)
        );

	// Testbench UART
	tbuart tbuart (
		.ser_rx(uart_tx)
	);

endmodule
`default_nettype wire
