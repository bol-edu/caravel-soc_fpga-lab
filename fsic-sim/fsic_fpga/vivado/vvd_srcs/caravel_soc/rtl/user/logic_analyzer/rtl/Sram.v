`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2023 03:52:53 PM
// Design Name: 
// Module Name: sram
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

module sram #( parameter pADDR_WIDTH = 7,
               parameter pDATA_WIDTH = 32 
             )
(   
    // Port 0: RW
    input wire clk0,
    input wire csb0,
    input wire web0,
    input wire [(pDATA_WIDTH/8)-1:0] wmask0,
    input wire [pADDR_WIDTH-1:0]addr0,
    input wire [pDATA_WIDTH-1:0]din0,
    output reg [pDATA_WIDTH-1:0]dout0,
    
    // Port 1: R
    input wire clk1,
    input wire csb1,
    input wire [pADDR_WIDTH-1:0]addr1,
    output reg [pDATA_WIDTH-1:0]dout1
);

    localparam MAX_DEPTH = (1 << pADDR_WIDTH);
	reg [pDATA_WIDTH-1:0] mem[MAX_DEPTH-1: 0];
	
    reg  csb0_reg;
    reg  web0_reg;
    reg [(pDATA_WIDTH/8)-1:0]   wmask0_reg;
    reg [pADDR_WIDTH-1:0]  addr0_reg;
    reg [pDATA_WIDTH-1:0]  din0_reg;
    
    always @(posedge clk0)
    begin
        csb0_reg = csb0;
        web0_reg = web0;
        wmask0_reg = wmask0;
        addr0_reg = addr0;
        din0_reg = din0;
    end

    reg  csb1_reg;
    reg [pADDR_WIDTH-1:0]  addr1_reg;

    always @(posedge clk1)
    begin
        csb1_reg = csb1;
        addr1_reg = addr1;
    end    
    
    always @ (negedge clk0)
    begin
        if ( !csb0_reg && !web0_reg ) begin
            if (wmask0_reg[0])
                mem[addr0_reg][7:0] = din0_reg[7:0];
            if (wmask0_reg[1])
                mem[addr0_reg][15:8] = din0_reg[15:8];
            if (wmask0_reg[2])
                mem[addr0_reg][23:16] = din0_reg[23:16];
            if (wmask0_reg[3])
                mem[addr0_reg][31:24] = din0_reg[31:24];
        end
    end

    always @ (negedge clk0)
    begin
    if (!csb0_reg && web0_reg)
       dout0 <= mem[addr0_reg];
    end  
    
    always @ (negedge clk1)
    begin
    if (!csb1_reg)
       dout1 <= mem[addr1_reg];
    end       
        
endmodule