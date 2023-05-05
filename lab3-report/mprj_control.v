`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/14 10:02:11
// Design Name: 
// Module Name: mprj_control_1
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


module mprj_control_1
#(
    parameter GPIO_SIZE = 'd38
)
(
    input clk,
    input [GPIO_SIZE-1:0] mprj_i,
    output reg [GPIO_SIZE-1:0] mprj_o,
    output [GPIO_SIZE-1:0] mprj_en
    );
    reg [GPIO_SIZE-1:0] mprj_temp;
    reg [GPIO_SIZE-1:0] mprj_en_temp;
    reg [GPIO_SIZE-3:0] count;
    wire ona;
    wire loopback_en;
    integer i =0;
    initial begin
        for(i=0;i<GPIO_SIZE ; i=i+1)begin
        mprj_temp[i] = 1;
        mprj_en_temp[i] = 0;
        count[i] = 0;
	   end
	   
	   
    end

   assign ona = mprj_i[GPIO_SIZE-1];
    assign mprj_en = (ona)? 38'hfffffffff: 38'h000000000;

   always@(posedge clk)begin

       if(mprj_i[GPIO_SIZE-2]) begin
            mprj_temp  = mprj_i;
       end else begin
           mprj_temp<= 38'h1234;
       end
       
       mprj_o  <= mprj_temp;
      
   end
endmodule