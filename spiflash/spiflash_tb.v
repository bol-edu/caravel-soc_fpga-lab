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

`timescale 1 ns / 1 ps

module spiflash_tb;

	initial begin
		$dumpfile("spiflash.vcd");
		$dumpvars(0, spiflash_tb);
	end


// clock generator
reg ap_clk = 0;
reg ap_rst;
reg csb;
reg spiclk = 0;
reg io0;
wire io1;


// clock generator
  always #5 ap_clk = ~ap_clk;

// spiclk = ap_clk/4
always begin
	@(posedge ap_clk);
	@(posedge ap_clk);
	#1 spiclk = ~spiclk;
end

initial begin  // reset
  ap_rst = 0;
  #100 ap_rst = 1;
end


// spiflash interface stimulus
reg [23:0] spi_addr;
reg [7:0] spi_cmd;
reg [7:0] bitcount;
reg [7:0] value;
task sendbyte;
	begin
		for (bitcount = 0; bitcount < 8; bitcount = bitcount + 1) begin
			io0 = value[7];
			value = value <<1;
			@(negedge spiclk);
		end
	end
endtask

reg [7:0] spidata;
task readbyte;
	begin
		for (bitcount = 0; bitcount < 8; bitcount = bitcount + 1) begin
			@(posedge spiclk);
			spidata = {spidata[6:0],io1};
		end
	end
endtask

integer i;
// Read data from SPI Flash
  initial begin
    // Read command
    csb = 1;  	// spiflash reset
	@(negedge spiclk);
	csb = 0;

	// read a byte
	value = 8'h03; 
	sendbyte;			// send read command

	spi_addr = 24'h0; 				// send address
	value = spi_addr[23:16];  sendbyte;
	value = spi_addr[15:8]; sendbyte;
	value = spi_addr[7:0]; sendbyte;
	readbyte;
	$display("spi read[%0h]:%0h", spi_addr, spidata);

	@(negedge spiclk);  // reset
	csb = 1;

	// read 3 byte
	@(negedge spiclk);
	csb = 0;

	// read a byte
	value = 8'h03; 
	sendbyte;			// send read command

	spi_addr = 24'h000020; 				// send address
	value = spi_addr[23:16];  sendbyte;
	value = spi_addr[15:8]; sendbyte;
	value = spi_addr[7:0]; sendbyte;
	for(i = 0; i < 20; i=i+1) begin
	     readbyte;
	     $display("spi read[%h]:%h", spi_addr, spidata);
		 spi_addr = spi_addr + 1;
	end 
	
	@(negedge spiclk);
	csb = 1;
	@(negedge spiclk);
	$finish;
	
  end

wire [31:0]      romcode_Addr_A;
wire        romcode_EN_A;
wire  [3:0]     romcode_WEN_A;
wire  [31:0]      romcode_Din_A;
wire  [31:0]     romcode_Dout_A;
wire romcode_Clk_A;
wire romcode_Rst_A;

spiflash  spiflash 
(
        ap_clk,
        ap_rst,
// BRAM Interface
        romcode_Addr_A,
        romcode_EN_A,
        romcode_WEN_A,
        romcode_Din_A,
        romcode_Dout_A,
        romcode_Clk_A,
        romcode_Rst_A,
// Spiflash Interface
        csb,
        spiclk,
        io0,
        io1
);

bram  #(.FILENAME("counter_la.hex")
) bram
(
    ap_clk,  			// CLK,
    romcode_WEN_A,   	// WE0,
    romcode_EN_A, 		// EN0,
    romcode_Din_A,		// Di0,
    romcode_Dout_A, 	// Do0,
    romcode_Addr_A		// A0
);

endmodule
`default_nettype wire
