// bram behavior code (can't be synthesis)
// (DEPTH) words
module bram
#(
    parameter DEPTH = 12
)
(
    input           CLK,
    input   [3:0]   WE,
    input           EN,
    input   [31:0]  Di,
    output  [31:0]  Do,
    input   [11:0]  A
);

    //  12 words
	reg [31:0] RAM [0:DEPTH-1];
    reg [11:0] r_A;

    always @(posedge CLK) begin
        r_A <= A;
    end

    assign Do = {32{EN}} & RAM[r_A>>2];    // read

    always @(posedge CLK) begin
        if(EN) begin
	        if(WE[0]) RAM[A>>2][7:0]    <= Di[7:0];
            if(WE[1]) RAM[A>>2][15:8]   <= Di[15:8];
            if(WE[2]) RAM[A>>2][23:16]  <= Di[23:16];
            if(WE[3]) RAM[A>>2][31:24]  <= Di[31:24];
        end
    end

endmodule
