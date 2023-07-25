module bram #( parameter FILENAME = "firmware.hex")
(
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

    // 16 MB (128Mb) Flash
	reg [7:0] RAM[0:4*1024*1024-1];


    always @(posedge CLK)
        if(EN0) begin
            Do0 <= {RAM[{A0[31:2],2'b11}],
                    RAM[{A0[31:2],2'b10}],
                    RAM[{A0[31:2],2'b01}],
                    RAM[{A0[31:2],2'b00}]} ;
            if(WE0[0]) RAM[{A0[31:2],2'b00}] <= Di0[7:0];
            if(WE0[1]) RAM[{A0[31:2],2'b01}] <= Di0[15:8];
            if(WE0[2]) RAM[{A0[31:2],2'b10}] <= Di0[23:16];
            if(WE0[3]) RAM[{A0[31:2],2'b11}] <= Di0[31:24];
        end
        else
            Do0 <= 32'b0;

   
	initial begin
		$display("Reading %s",  FILENAME);
		$readmemh(FILENAME, RAM);
		//$display("Memory 5 bytes = 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x",
		//	memory[0], memory[1], memory[2],
		//	memory[3], memory[4]);
		$display("%s loaded into memory", FILENAME);
		    $display("Memory 5 bytes = 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x",
			RAM[0], RAM[1], RAM[2],
			RAM[3], RAM[4]);
	end

endmodule
