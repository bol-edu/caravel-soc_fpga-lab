// bram code (synthesizable)
module bram_1B (clk, we, re, waddr, raddr, wdi, rdo);
    `define RAMinitFile "./sfmx.dat"
    parameter SIZE = 8192;
    parameter ADDR_WIDTH = 13;
    parameter COL_WIDTH = 9;
    parameter NB_COL = 4;
    parameter BIT_WIDTH = 8;
    input                          clk;
    input                          we, re;
    input [ADDR_WIDTH-1:0]         waddr, raddr;
    input [BIT_WIDTH-1:0]          wdi;
    output reg [BIT_WIDTH-1:0]     rdo;
    reg [BIT_WIDTH-1:0] RAM [SIZE-1:0];
    initial $readmemh(`RAMinitFile, RAM);
    
    always @(posedge clk)begin
        if(re) rdo <= RAM[raddr];
    end
    
    always @(posedge clk)begin
        if(we) RAM[waddr] <= wdi;
    end
    
endmodule