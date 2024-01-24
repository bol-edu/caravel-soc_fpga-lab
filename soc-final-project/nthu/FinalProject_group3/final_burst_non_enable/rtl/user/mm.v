`timescale 1ns / 1ps
module mm
#(  parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32
)
(
    output  wire                     ss_tready,
    input   wire                     ss_tvalid,
    input   wire [(pDATA_WIDTH-1):0] ss_tdata,

    input   wire                     sm_tready,
    output  wire                     sm_tvalid,
    output  wire [(pDATA_WIDTH-1):0] sm_tdata,

    input   wire                     axis_clk,   // Clock source.
    input   wire                     axis_rst  // Global reset source, active low.
);

    reg  A_done, B_done, idle_reg;

    reg  [(pDATA_WIDTH-1):0]    A1_RAM [0:3];   // 0
    reg  [(pDATA_WIDTH-1):0]    A2_RAM [0:3];   // 4
    reg  [(pDATA_WIDTH-1):0]    A3_RAM [0:3];   // 8
    reg  [(pDATA_WIDTH-1):0]    A4_RAM [0:3];   // 12

    reg  [(pDATA_WIDTH-1):0]    B1_RAM [0:3];
    reg  [(pDATA_WIDTH-1):0]    B2_RAM [0:3];
    reg  [(pDATA_WIDTH-1):0]    B3_RAM [0:3];
    reg  [(pDATA_WIDTH-1):0]    B4_RAM [0:3];

    reg [4:0]   a_counter, a_next_counter;
    reg [4:0]   b_counter, b_next_counter;
	reg [1:0]   state, next_state;

    localparam  RESET = 2'd0, INIT = 2'd1, CALC = 2'd2, DONE = 2'd3;
    
    assign ss_tready = (state==INIT);
    assign sm_tvalid = (state==DONE);
    
    wire idle = ((state==DONE) & (C1_counter)) ? 1 : idle_reg;
    wire nA_done, nB_done;
    assign nA_done = (~A_done & a_counter==5'd16) ? 1 : A_done;
    assign nB_done = (~B_done & b_counter==5'd16) ? 1 : B_done;
    
    always @(posedge axis_clk or posedge axis_rst) begin
		if (axis_rst) begin
			A_done <= 0;
            B_done <= 0;
            idle_reg <= 0;
		end
		else begin
			A_done <= nA_done;
            B_done <= nB_done;
            idle_reg <= idle;
		end
    end

    // sequential part
    always @(posedge axis_clk or posedge axis_rst) begin
		if (axis_rst) begin
			state <= RESET;
            a_counter <= 0;
            b_counter <= 0;
		end
		else begin
			state <= next_state;
            a_counter <= a_next_counter;
            b_counter <= b_next_counter;
		end
	end

    // counter   
    always @(*) begin 
        if (state==RESET) begin
            a_next_counter=0;
            b_next_counter=0;
        end
        else if (state==INIT) begin
            if (ss_tvalid) begin
                if (~A_done) begin
                    a_next_counter = a_counter + 1;
                end
                else begin
                    b_next_counter = b_counter + 1;                 
                end
            end
        end
    end
    

    // combinational part, state transition
    always @(*) begin 
        case (state)
            RESET: begin 
                if (idle) begin
                    next_state = RESET;
                end 
                else begin
                    next_state = INIT;
                end
            end
            INIT: begin 
                if (A_done & B_done) begin
                    next_state = CALC;
                end
                else begin
                    next_state = INIT;
                end
            end
            CALC: begin 
                if (C1_counter==16) begin
                    next_state = DONE;
                end
                else begin
                    next_state = CALC;
                end
            end
            DONE: begin 
                if (C1_counter==16) begin
                    next_state = RESET;
                end
                else begin
                    next_state = DONE;
                end
            end
            default: begin 
                next_state = RESET;
            end
        endcase
    end

    // Data Storage
    integer i;
    always @(posedge axis_clk or posedge axis_rst) begin 
        if (axis_rst) begin
            for (i=0;i<4;i=i+1)begin
	            A1_RAM[i] <= 0;
                A2_RAM[i] <= 0;
                A3_RAM[i] <= 0;
                A4_RAM[i] <= 0;
                B1_RAM[i] <= 0;
                B2_RAM[i] <= 0;
                B3_RAM[i] <= 0;
                B4_RAM[i] <= 0;
	        end
	        C1_counter <= 0;
        end
        else if (state==INIT & ss_tvalid) begin
            if (~A_done) begin
                if (a_counter[3:2]==2'd0) begin
                    A1_RAM[a_counter[1:0]] <= ss_tdata;
                end
                else if (a_counter[3:2]==2'd1) begin
                    A2_RAM[a_counter[1:0]] <= ss_tdata;
                end
                else if (a_counter[3:2]==2'd2) begin
                    A3_RAM[a_counter[1:0]] <= ss_tdata;
                end
                else if (a_counter[3:2]==2'd3) begin
                    A4_RAM[a_counter[1:0]] <= ss_tdata;
                end
            end
            else if (A_done & ~B_done) begin
                if (b_counter[1:0]==2'd0) begin
                    B1_RAM[b_counter[3:2]] <= ss_tdata;
                end
                else if (b_counter[1:0]==2'd1) begin
                    B2_RAM[b_counter[3:2]] <= ss_tdata;
                end
                else if (b_counter[1:0]==2'd2) begin
                    B3_RAM[b_counter[3:2]] <= ss_tdata;
                end
                else if (b_counter[1:0]==2'd3) begin
                    B4_RAM[b_counter[3:2]] <= ss_tdata;
                end
            end
        end
        else if (state==CALC) begin
            for(i = 0; i < 3; i=i+1) begin
                A1_RAM[i] <= A1_RAM[i+1];
                A2_RAM[i] <= A2_RAM[i+1];
                A3_RAM[i] <= A3_RAM[i+1];
                A4_RAM[i] <= A4_RAM[i+1];
                B1_RAM[i] <= B1_RAM[i+1];
                B2_RAM[i] <= B2_RAM[i+1];
                B3_RAM[i] <= B3_RAM[i+1];
                B4_RAM[i] <= B4_RAM[i+1];
            end
            A1_RAM[3] <= A1_RAM[0];
            A2_RAM[3] <= A2_RAM[0];
            A3_RAM[3] <= A3_RAM[0];
            A4_RAM[3] <= A4_RAM[0];
            B1_RAM[3] <= B4_RAM[0];
            B2_RAM[3] <= B1_RAM[0];
            B3_RAM[3] <= B2_RAM[0];
            B4_RAM[3] <= B3_RAM[0];
            C1_counter <= C1_counter + 1;
            if (C1_counter==16) begin
                C1_counter <= 0;
            end
        end
        else if (state==DONE) begin
            if (sm_tready) begin
                C1_counter <= C1_counter + 1;
            end
        end
    end
    
    reg  [4:0]  C1_counter;
    wire [31:0] C1_mul, C2_mul, C3_mul, C4_mul;
    reg  [31:0] C1[3:0], C2[3:0], C3[3:0], C4[3:0];

    assign C1_mul = A1_RAM[0] * B1_RAM[0];
    assign C2_mul = A2_RAM[0] * B2_RAM[0];
    assign C3_mul = A3_RAM[0] * B3_RAM[0];
    assign C4_mul = A4_RAM[0] * B4_RAM[0];
    
    
    always @(posedge axis_clk or posedge axis_rst) begin
        if (axis_rst) begin
            for(i=0;i<4;i=i+1) begin 
                C1[i]<=0;
                C2[i]<=0;
                C3[i]<=0;
                C4[i]<=0;
            end
        end
        else begin
            if (state==CALC)begin
                if (C1_counter >>2 == 0)begin
                    C1[0]<=C1[0]+C1_mul;
                    C2[1]<=C2[1]+C2_mul;
                    C3[2]<=C3[2]+C3_mul;
                    C4[3]<=C4[3]+C4_mul;
                end    
                else if (C1_counter >>2 == 1) begin
                    C1[3]<=C1[3]+C1_mul;
                    C2[0]<=C2[0]+C2_mul;
                    C3[1]<=C3[1]+C3_mul;
                    C4[2]<=C4[2]+C4_mul;
                end
                else if (C1_counter >>2 == 2) begin
                    C1[2]<=C1[2]+C1_mul;
                    C2[3]<=C2[3]+C2_mul;
                    C3[0]<=C3[0]+C3_mul;
                    C4[1]<=C4[1]+C4_mul;
                end
                else if (C1_counter >>2 == 3) begin
                    C1[1]<=C1[1]+C1_mul;
                    C2[2]<=C2[2]+C2_mul;
                    C3[3]<=C3[3]+C3_mul;
                    C4[0]<=C4[0]+C4_mul;
                end
                /*
                else begin
   
                end
                */
            end
        end
    end
    
    reg [31:0] output_reg;
    assign sm_tdata = (state==DONE) ? output_reg : 0;

    always @(*) begin 
        if (state==DONE) begin
            if (sm_tready) begin
                if (C1_counter >>2 == 0)begin
                    output_reg <= C1[C1_counter[1:0]];
                end    
                else if (C1_counter >>2 == 1) begin
                    output_reg <= C2[C1_counter[1:0]];
                end
                else if (C1_counter >>2 == 2) begin
                    output_reg <= C3[C1_counter[1:0]];
                end
                else if (C1_counter >>2 == 3) begin
                    output_reg <= C4[C1_counter[1:0]];
                end
            end
            else begin
                output_reg <= output_reg;
            end
        end
        else begin
            output_reg <= 0;
        end
    end
    
    
    // test c part
    
    wire [31:0] C11;
    assign C11 = C1[0];
    wire [31:0] C12;
    assign C12 = C1[1];
    wire [31:0] C13;
    assign C13 = C1[2];
    wire [31:0] C14;
    assign C14 = C1[3];
    

    wire [31:0] C21;
    assign C21 = C2[0];
    wire [31:0] C22;
    assign C22 = C2[1];
    wire [31:0] C23;
    assign C23 = C2[2];
    wire [31:0] C24;
    assign C24 = C2[3];
    
    
    wire [31:0] C31;
    assign C31 = C3[0];
    wire [31:0] C32;
    assign C32 = C3[1];
    wire [31:0] C33;
    assign C33 = C3[2];
    wire [31:0] C34;
    assign C34 = C3[3];
    

    wire [31:0] C41;
    assign C41 = C4[0];
    wire [31:0] C42;
    assign C42 = C4[1];
    wire [31:0] C43;
    assign C43 = C4[2];
    wire [31:0] C44;
    assign C44 = C4[3];
    

    
    // test storev part 
    
    wire[31:0] A1_ram0;
    assign A1_ram0=A1_RAM[0];
    wire[31:0] A1_ram1;
    assign A1_ram1=A1_RAM[1];
    wire[31:0] A1_ram2;
    assign A1_ram2=A1_RAM[2];
    wire[31:0] A1_ram3;
    assign A1_ram3=A1_RAM[3];
    
    wire[31:0] A2_ram0;
    assign A2_ram0=A2_RAM[0];
    wire[31:0] A2_ram1;
    assign A2_ram1=A2_RAM[1];
    wire[31:0] A2_ram2;
    assign A2_ram2=A2_RAM[2];
    wire[31:0] A2_ram3;
    assign A2_ram3=A2_RAM[3];
 
 
    wire[31:0] A3_ram0;
    assign A3_ram0=A3_RAM[0];
    wire[31:0] A3_ram1;
    assign A3_ram1=A3_RAM[1];
    wire[31:0] A3_ram2;
    assign A3_ram2=A3_RAM[2];
    wire[31:0] A3_ram3;
    assign A3_ram3=A3_RAM[3];
 
 
    wire[31:0] A4_ram0;
    assign A4_ram0=A4_RAM[0];
    wire[31:0] A4_ram1;
    assign A4_ram1=A4_RAM[1];
    wire[31:0] A4_ram2;
    assign A4_ram2=A4_RAM[2];
    wire[31:0] A4_ram3;
    assign A4_ram3=A4_RAM[3];
    
 
 
    wire[31:0] B1_ram0;
    assign B1_ram0=B1_RAM[0];
    wire[31:0] B1_ram1;
    assign B1_ram1=B1_RAM[1];
    wire[31:0] B1_ram2;
    assign B1_ram2=B1_RAM[2];
    wire[31:0] B1_ram3;
    assign B1_ram3=B1_RAM[3];
    
    wire[31:0] B2_ram0;
    assign B2_ram0=B2_RAM[0];
    wire[31:0] B2_ram1;
    assign B2_ram1=B2_RAM[1];
    wire[31:0] B2_ram2;
    assign B2_ram2=B2_RAM[2];
    wire[31:0] B2_ram3;
    assign B2_ram3=B2_RAM[3];
 
 
    wire[31:0] B3_ram0;
    assign B3_ram0=B3_RAM[0];
    wire[31:0] B3_ram1;
    assign B3_ram1=B3_RAM[1];
    wire[31:0] B3_ram2;
    assign B3_ram2=B3_RAM[2];
    wire[31:0] B3_ram3;
    assign B3_ram3=B3_RAM[3];
 
 
    wire[31:0] B4_ram0;
    assign B4_ram0=B4_RAM[0];
    wire[31:0] B4_ram1;
    assign B4_ram1=B4_RAM[1];
    wire[31:0] B4_ram2;
    assign B4_ram2=B4_RAM[2];
    wire[31:0] B4_ram3;
    assign B4_ram3=B4_RAM[3];   

endmodule
