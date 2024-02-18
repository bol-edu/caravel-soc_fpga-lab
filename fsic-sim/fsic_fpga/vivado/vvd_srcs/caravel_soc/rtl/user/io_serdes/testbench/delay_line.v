`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2023 03:37:37 PM
// Design Name: 
// Module Name: delay_line
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


module dly_line #(
        parameter SHIFT_DEPTH = 13
    )
    (
        input dlyclk,
        input dly_in,
        input rst,
        input [7:0] dly_time,  //real delay = (dly_time+1) * dlyclk's clock cycle time
        output dly_out
    );
    
    reg [SHIFT_DEPTH-1:0] ShiftReg;
    

    assign    dly_out =  ShiftReg[dly_time];
    always @(posedge dlyclk) begin
        if (rst) begin
//            ShiftReg <= 0;        
//            ShiftReg[SHIFT_DEPTH-1:0] <= 0;
            ShiftReg <= {SHIFT_DEPTH{1'b0}};
        end 
        else begin
            ShiftReg[0] <= dly_in;
            ShiftReg[SHIFT_DEPTH-1:1] <= ShiftReg[SHIFT_DEPTH-2:0];
        end
        
    end 
endmodule