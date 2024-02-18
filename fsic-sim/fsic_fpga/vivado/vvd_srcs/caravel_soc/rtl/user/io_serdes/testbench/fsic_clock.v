`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author : Tony Ho
//
// Create Date: 06/23/2023 09:18:34 AM
// Design Name:
// Module Name: fsic_clock
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
//20230710
// 2. use counter + FF
//20230710
// 1. using counter to avoid hold time issue when using 2 x clk->q delay from the clk.

`define USE_BLOCK_ASSIGNMENT 1




module fsic_clock_div (
	in, out, resetb
);
	input in;			// input clock
	input resetb;		// asynchronous reset (sense negative)
	output out;			// divided output clock

	reg clk_out;
	assign out = clk_out;
	reg cnt;	 // use 1 bit for support div4

	always @(posedge in or negedge resetb) begin
		if ( !resetb ) begin
		  cnt <= 0;
		end		  
		else  begin
			cnt <= cnt + 1;
		end
	end

`ifdef 	USE_BLOCK_ASSIGNMENT

//for use block assigmnet to avoid race condition in simulation

	always @(posedge in or negedge resetb) begin
		if ( !resetb ) begin
		  clk_out = 1;
		end		  
		else  begin
			if ( cnt == 0 ) clk_out = ~clk_out;
			else clk_out = clk_out;
		end
	end

`else	  //USE_BLOCK_ASSIGNMENT

//for use non-block assigmnet

	always @(posedge in or negedge resetb) begin
		if ( !resetb ) begin
		  clk_out <= 1;
		end		  
		else  begin
			if ( cnt == 0 ) clk_out <= ~clk_out;
			else clk_out <= clk_out;
		end
	end

`endif 		//USE_BLOCK_ASSIGNMENT

endmodule

