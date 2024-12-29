module pe
#(
    parameter pDATA_WIDTH = 32
)
(
    input [pDATA_WIDTH-1:0] mul_a,
    input [pDATA_WIDTH-1:0] mul_b,
    input acc_on,
    input cal,
    input clk,
    input rst_n,
    input last,
    output [pDATA_WIDTH-1:0] result
);
    wire [pDATA_WIDTH-1:0] mul_result;
    reg  [pDATA_WIDTH-1:0] acc_result;
    assign mul_result   = mul_a * mul_b;
    assign result       = (last) ? mul_result + acc_result : 0;
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            acc_result <= 0;
        else
            if(cal)
                if(acc_on)
                    acc_result <= mul_result + acc_result;
                else
                    acc_result <= mul_result;
    end
endmodule