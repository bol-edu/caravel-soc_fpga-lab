//single-port RAM model 
module SPRAM
#(
parameter data_width = 8,
parameter addr_width = 7,
parameter depth = 128
)(
	adr, d, en, we, clk, q
);

	input [addr_width-1:0] adr;    // address
	input [data_width-1:0] d;      // data in
	input en;                      // active-high enable (clock enable)
	input we;                      // active-high write-enable
	input clk;                     // rising edge clock
	output[data_width-1:0] q;      // data out

	reg [data_width-1:0] q;

	reg [data_width-1:0] mem [depth-1:0];

	always @(posedge clk) begin
		if (en) begin
			if (we) begin
				mem[adr] <= d;
				q <= {data_width{1'bX}} ;
			end
			else begin
				q <= mem[adr];
			end
		end
	end

endmodule
