`timescale 1ns / 1ps
module calc_pipeline
#(  parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32,
    parameter Tape_Num    = 11
)
(
    input   wire [(pDATA_WIDTH-1):0]  data_Do,
    input   wire [(pDATA_WIDTH-1):0]  tap_Do,
    input   wire                      Data_control,
    input   wire                      Tape_control,
    input   wire                      adder_rst_control,
    input   wire                      output_control,
    input   wire                      axis_clk,
    input   wire                      axis_rst_n,
    input   wire                      cal_rst_n,
    output  wire [(pDATA_WIDTH-1):0]  y_output
);

    wire [(pDATA_WIDTH-1):0] new_add;
    wire [(pDATA_WIDTH-1):0] old_add;
    wire [(pDATA_WIDTH-1):0] sum;

    reg  [(pDATA_WIDTH-1):0] sm_tdata_reg;
    reg  [(pDATA_WIDTH-1):0] D_reg, next_D_reg;
    reg  [(pDATA_WIDTH-1):0] T_reg, next_T_reg;
    reg  [(pDATA_WIDTH-1):0] Mul_reg, next_Mul_reg;
    reg  [(pDATA_WIDTH-1):0] Add_reg, next_Add_reg;

    assign y_output = sm_tdata_reg;
    assign new_add  = Mul_reg;
    assign old_add  = Add_reg;

    always @(posedge axis_clk or negedge axis_rst_n) begin 
        if(!axis_rst_n | !cal_rst_n) begin 
            D_reg   <= 32'b0;
            T_reg   <= 32'b0;
            Mul_reg <= 32'b0;
            Add_reg <= 32'b0;
        end
        else begin 
            D_reg   <= next_D_reg;
            T_reg   <= next_T_reg;
            Mul_reg <= next_Mul_reg;
            Add_reg <= next_Add_reg;
        end
    end

    // DATA & TAPE input
    always @(*) begin 
        next_D_reg = (Data_control) ? 32'b0 : data_Do;
        next_T_reg = (Tape_control) ? 32'b0 : tap_Do;
    end

    // MULTIPLICATION
    always @(*) begin 
        next_Mul_reg = D_reg * T_reg;
    end

    // ADD
    assign sum = new_add + old_add;

    // while next cycle, adder reset
    always @(*) begin 
        next_Add_reg = (adder_rst_control) ? 0 : sum;
    end

    // Output
    always @(*) begin 
        sm_tdata_reg = (output_control) ? Add_reg : y_output;
    end

endmodule
