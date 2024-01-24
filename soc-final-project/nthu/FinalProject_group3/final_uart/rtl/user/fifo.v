`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2024 09:59:35 AM
// Design Name: 
// Module Name: fifo
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


module fifo #(
    parameter FIFO_DEPTH = 8
)
(
  input rst_n,
  input clk,
  input [7:0] idata,
  input push,
  input pop,

  output [7:0] odata,
  output empty,
  output full
);

reg [7:0]mem[FIFO_DEPTH - 1:0];
reg [2:0] start_ptr,end_ptr;
reg [3:0] data_cnt;

wire [7:0] debug0;
wire [7:0] debug1;
wire [7:0] debug2;
wire [7:0] debug3;
wire [7:0] debug4;
wire [7:0] debug5;
wire [7:0] debug6;
wire [7:0] debug7;

assign debug0 = mem[0];
assign debug1 = mem[1];
assign debug2 = mem[2];
assign debug3 = mem[3];
assign debug4 = mem[4];
assign debug5 = mem[5];
assign debug6 = mem[6];
assign debug7 = mem[7];

	

/*always @(*) begin
    if(start_ptr == end_ptr) begin
      full = 1'b0;
      empty = 1'b1;
    end else if(start_ptr == end_ptr + 1'b1) begin
      full = 1'b1;
      empty = 1'b0;
    end else begin
      full = 1'b0;
      empty = 1'b0;
    end
end
*/
assign empty = (data_cnt == 4'h0);
assign full =  (data_cnt == 4'h8);

assign odata = (pop)?mem[start_ptr]:8'd0;

always @(posedge clk or negedge rst_n) begin
    if(push) mem[end_ptr] = idata;
    else mem[end_ptr] = mem[end_ptr];
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      start_ptr <= 4'h0;
      end_ptr <= 4'h0;
      data_cnt <= 4'h0;
    end else begin
      if(push && !full) begin
        start_ptr <= start_ptr;
        end_ptr <= end_ptr + 4'h1;
        data_cnt <= data_cnt + 4'h1;
      end 
      if(pop && !empty) begin
        start_ptr <= start_ptr + 4'h1;
        end_ptr <= end_ptr;
        data_cnt <= data_cnt - 4'h1;
      end
    end
end

endmodule
