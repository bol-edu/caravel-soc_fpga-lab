// bram behavior code (can't be synthesis)
// 11 words
module bram11 (CLK, WE, EN, Di, Do, A);

    input   wire            CLK;  // CLK : connect to global clk.
    input   wire    [3:0]   WE;   //  WE : Write enable, while ready set to 4'b1111.
    input   wire            EN;   //  EN : Data input / output enable.
    input   wire    [31:0]  Di;   //  Di : Data input.
    output  wire    [31:0]  Do;   //  Do : Data output.    
    input   wire    [11:0]   A;   //   A : Address given

    reg [31:0] RAM [0:10]; // depth 32, length 
    reg [11:0] r_A;        // r_a : read Address.

    // Synchronous Read Data : 
    // After a posedge clk, address is write to r_a,
    // then while en = 1, Do reads the data at address r_a.
    
    always @(posedge CLK) begin
        r_A <= A;
    end

    assign Do = {32{EN}} & RAM[r_A>>2];

    always @(posedge CLK) begin
        if(EN) begin
	    	if(WE[0]) RAM[A>>2][7:0] <= Di[7:0];
	    	if(WE[1]) RAM[A>>2][15:8] <= Di[15:8];
	    	if(WE[2]) RAM[A>>2][23:16] <= Di[23:16];
	    	if(WE[3]) RAM[A>>2][31:24] <= Di[31:24];
        end
    end

endmodule