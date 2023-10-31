module bram12 (clk, we, re, waddr, raddr, wdi, rdo);
    parameter ADDR_WIDTH = 12;
    parameter SIZE = 12;
    parameter BIT_WIDTH = 32;
    input                          clk;
    input [3:0]                    we, re;
    input [ADDR_WIDTH-1:0]         waddr, raddr;
    input [BIT_WIDTH-1:0]          wdi;
    output reg [BIT_WIDTH-1:0]     rdo;
    reg [BIT_WIDTH-1:0] RAM [SIZE-1:0];
    
    always @(posedge clk)begin
        if(re) rdo <= RAM[raddr];
    end
    
    always @(posedge clk)begin
        if(we) RAM[waddr] <= wdi;
    end
    
endmodule
