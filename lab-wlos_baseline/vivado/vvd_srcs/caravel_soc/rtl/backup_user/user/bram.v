module bram(
    CLK,
    WE0,
    EN0,
    Di0,
    Do0,
    A0
);

    input   wire            CLK;
    input   wire    [3:0]   WE0;
    input   wire            EN0;
    input   wire    [31:0]  Di0;
    output  reg     [31:0]  Do0;
    input   wire    [31:0]   A0;

    // 4 kB
	reg [7:0] RAM[0:4*1024-1];


    always @(posedge CLK)
    	if(rst) begin
    	    Do0 <= 0;
    	    for(integer i=0; i<A0; i=i+1) begin
    	    	RAM[A0] <= 0;
    	    	end
    	end
        else if(EN0) begin
            Do0 <= {RAM[{A0[11:2],2'b11}],
                    RAM[{A0[11:2],2'b10}],
                    RAM[{A0[11:2],2'b01}],
                    RAM[{A0[11:2],2'b00}]} ;
            if(WE0[0]) RAM[{A0[11:2],2'b00}] <= Di0[7:0];
            if(WE0[1]) RAM[{A0[11:2],2'b01}] <= Di0[15:8];
            if(WE0[2]) RAM[{A0[11:2],2'b10}] <= Di0[23:16];
            if(WE0[3]) RAM[{A0[11:2],2'b11}] <= Di0[31:24];
        end
        else
            Do0 <= 32'b0;
endmodule
