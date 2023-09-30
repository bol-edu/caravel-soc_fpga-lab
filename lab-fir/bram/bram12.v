// bram behavior code (can't be synthesis)
// 11 words
module bram12 
(
    CLK,
    WE,
    EN,
    Di,
    Do,
    A
);

    input   wire            CLK;
    input   wire    [3:0]   WE;
    input   wire            EN;
    input   wire    [31:0]  Di;
    output  reg     [31:0]  Do;
    input   wire    [11:0]   A; 

    //  11 words
	reg [31:0] RAM[0:11];
    reg [11:0] r_A;

    always @(posedge CLK) begin
        r_A <= A;
    end

    assign Do = 32{EN} & RAM[r_A>>2];    // read

    reg [31:0] Temp_D;
    always @(posedge CLK) begin
        if(EN) begin
            Temp_D = RAM[A>>2];
            if(WE[0]) RAM[A>>2] <= {Temp_D[31:24], Temp_D[23:16], Temp_D[15:8], Di[7:0]};
            if(WE[1]) RAM[A>>2] <= {Temp_D[31:24], Temp_D[23:16], Di[15:8], Temp_D[7:0]};
            if(WE[2]) RAM[A>>2] <= {Temp_D[31:24], Di[23:16], Temp_D[15:8], Temp_D[7:0]};
            if(WE[3]) RAM[A>>2] <= {Di[31:24], Temp_D[23:16], Temp_D[15:8], Temp_D[7:0]};
        end
    end

endmodule
