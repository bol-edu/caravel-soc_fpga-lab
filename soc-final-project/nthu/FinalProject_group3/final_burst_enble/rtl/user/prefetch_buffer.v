`default_nettype wire

// Prefetch buffer
module prefetch_buffer (
    input         clk,
    input         rst,
    
    input  [31:0] sdram_dat_o, // data in from sdram for prefetch
   // output [31:0] wbs_dat_o,
    
    input  [3:0]  mis_index_FIR,
    input  [3:0]  mis_index_QS,
    input  [3:0]  mis_index_MM,
    
    input  [2:0]  f_ack,
    
    input  [2:0]  HIT,
    
    output [31:0] data_out, // Return the meeting data
    
    // Control signal
    input  [5:0]  state_reg,
    
    input  [2:0]  burst_req
    
    );

    reg [31:0] data_o;
    
    assign data_out= data_o;
    reg [31:0] buff_FIR[0:7]; // Prefetch Buffer for FIR
    reg [31:0] buff_QS [0:7]; // Prefetch Buffer for QS
    reg [31:0] buff_MM [0:7]; // Prefetch Buffer for MM
    
    wire [31:0] fir_0 = buff_FIR[0];
    wire [31:0] fir_1 = buff_FIR[1];
    wire [31:0] fir_2 = buff_FIR[2];
    wire [31:0] fir_3 = buff_FIR[3];
    wire [31:0] fir_4 = buff_FIR[4];
    wire [31:0] fir_5 = buff_FIR[5];
    wire [31:0] fir_6 = buff_FIR[6];
    wire [31:0] fir_7 = buff_FIR[7];
    

//+------+-------+-------+------------+-------------+-----------+------------+-----------+-----------+
//|STAT_REG|  RESERVERD  |  FIR FULL  |  FIR empty  |  QS FULL  |  QS empty  |  MM FULL  |  MM empty |
//|        |    31-6     |  5         |  4          |  3        |  2         |  1        |  0        |
//+------+-------+-------+------------+-------------+-----------+------------+-----------+-----------+
    always @(posedge clk) begin
        if (rst) begin
            data_o <= 32'd0;
        end
        else begin
            if (HIT[2]) data_o <= buff_FIR[0];
            if (HIT[1]) data_o <= buff_QS[0];
            if (HIT[0]) data_o <= buff_MM[0];
        end
    end
    integer i,f,q,m;
    
    always @(posedge clk) begin
        if (rst) begin
            for ( i = 0; i < 8; i = i + 1) begin
                buff_FIR[i] <= 0;
                buff_QS[i]  <= 0;
                buff_MM[i]  <= 0;
            end
        end
        else begin
            if (burst_req[2] && f_ack[2]) begin
                buff_FIR[mis_index_FIR] <= sdram_dat_o;
            end
            else if (HIT[2]) begin
                for ( f = 0; f < 7; f = f + 1) begin
                    buff_FIR[f] <= buff_FIR[f+1];
                end
                buff_FIR[7] <= 0;
            end
            if (burst_req[1] && f_ack[1]) begin
                buff_QS[mis_index_QS] <= sdram_dat_o;
            end
            else if (HIT[1]) begin
                for ( q = 0; q < 7; q = q + 1) begin
                    buff_QS[q] <= buff_QS[q+1];
                end
                buff_QS[7] <= 0;
            end
            if (burst_req[0] && f_ack[0]) begin
                buff_MM[mis_index_MM] <= sdram_dat_o;
            end
            else if (HIT[0]) begin
                for ( m = 0; m < 7; m = m + 1) begin
                    buff_MM[m] <= buff_MM[m+1];
                end
                buff_MM[7] <= 0;
            end
        end
    end
    


endmodule
