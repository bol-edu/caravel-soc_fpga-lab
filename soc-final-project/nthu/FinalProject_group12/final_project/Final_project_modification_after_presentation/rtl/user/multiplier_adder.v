module multiplier_adder 
#(  parameter pDATA_WIDTH = 32
)
(
    input   wire [(pDATA_WIDTH-1):0] in1,
    input   wire [(pDATA_WIDTH-1):0] in2,
    input   wire [(pDATA_WIDTH-1):0] sum_in,
    output  wire [(pDATA_WIDTH-1):0] sum_out
);

wire [(2*pDATA_WIDTH-1):0] product;

assign product = in1*in2; // Multiplier*1
assign sum_out = product[(pDATA_WIDTH-1):0]+sum_in; // Adder*1

endmodule