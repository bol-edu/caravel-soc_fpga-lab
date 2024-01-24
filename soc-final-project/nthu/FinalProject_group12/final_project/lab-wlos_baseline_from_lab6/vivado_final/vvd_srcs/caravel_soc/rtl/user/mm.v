module mm 
#(  parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32
)
(
    input   wire                     axis_clk,
    input   wire                     axis_rst_n,
    
    // ap_start from DMA
    input   wire                     mm_start_whole,
    output   wire                     mm_done_whole,
    /////output   wire                     mm_idle,

    // Data in (AXI-Stream)
    input   wire                     ss_tvalid, 
    input   wire [(pDATA_WIDTH-1):0] ss_tdata, 
    //input   wire                     ss_tlast, //not used
    output  reg                     ss_tready,

    // Data out (AXI-Stream)
    input   wire                     sm_tready, 
    output  reg                     sm_tvalid, 
    output  reg [(pDATA_WIDTH-1):0] sm_tdata
    //output  wire                     sm_tlast, //not used
);

// Design by yuhungwei, testbench by zeus950068, modified by whywhytellmewhy
localparam IDLE = 4'd0;
localparam WAIT_MATRIX_A1_HANDSHAKE = 4'd1;
localparam INPUT_MATRIX_A_row1= 4'd2;

localparam WAIT_MATRIX_B_HANDSHAKE= 4'd3;
localparam INPUT_MATRIX_B_column = 4'd4;

localparam OUTPUT_row1 = 4'd5;
localparam WAIT_MATRIX_A_rest_row_HANDSHAKE = 4'd6;
localparam INPUT_MATRIX_A_rest_row = 4'd7;
localparam OUTPUT_rest_row = 4'd8;
localparam DONE = 4'd9;


wire mm_start; // modified
wire mm_done; // modified
wire mm_idle; // modified
assign mm_done_whole=mm_idle; // modified

reg ss_tready_before_FF;
reg sm_tvalid_before_FF;
reg [(pDATA_WIDTH-1):0] sm_tdata_before_FF;

reg         [3:0]           n_state;
reg         [3:0]           c_state;
//matrix A * matrix B == matrix C
reg         [4:0]           cnt_output, next_cnt_output;
reg         [1:0]           cnt_input, next_cnt_input;

reg    [(pDATA_WIDTH-1):0]  A1,A2,A3,A4;
reg    [(pDATA_WIDTH-1):0]  B11,B12,B13,B14;
reg    [(pDATA_WIDTH-1):0]  B21,B22,B23,B24;
reg    [(pDATA_WIDTH-1):0]  B31,B32,B33,B34;
reg    [(pDATA_WIDTH-1):0]  B41,B42,B43,B44;
reg    [(pDATA_WIDTH-1):0]  next_A1,next_A2,next_A3,next_A4;
reg    [(pDATA_WIDTH-1):0]  next_B11,next_B12,next_B13,next_B14;
reg    [(pDATA_WIDTH-1):0]  next_B21,next_B22,next_B23,next_B24;
reg    [(pDATA_WIDTH-1):0]  next_B31,next_B32,next_B33,next_B34;
reg    [(pDATA_WIDTH-1):0]  next_B41,next_B42,next_B43,next_B44;
wire   [(pDATA_WIDTH-1):0]  mac1,mac2,mac3,mac4; // MUL & ADD


assign mm_start = (ss_tvalid && ss_tready) ? 1:0;
assign mm_done = (sm_tvalid && sm_tready) ? 1:0;
//assign mm_idle = (sm_tvalid && sm_tready && cnt_output == 5'd15) ? 1:0;
assign mm_idle = (c_state == DONE) ? 1:0;


//MAC
assign mac1 = A1 * B11 + A2 * B21 + A3 * B31 + A4 * B41;
assign mac2 = A1 * B12 + A2 * B22 + A3 * B32 + A4 * B42;
assign mac3 = A1 * B13 + A2 * B23 + A3 * B33 + A4 * B43;
assign mac4 = A1 * B14 + A2 * B24 + A3 * B34 + A4 * B44;

/////////////////////////////////////////////
///FSM
/////////////////////////////////////////////
always @(posedge axis_clk or negedge axis_rst_n) begin
	if(!axis_rst_n) begin
		c_state <= IDLE;
        ss_tready <= 0;
        sm_tvalid <= 0;
        sm_tdata <= 0;
        A1  <= 0;
        A2  <= 0;
        A3  <= 0;
        A4  <= 0;
        B11 <= 0;
        B12 <= 0;
        B13 <= 0;
        B14 <= 0;
        B21 <= 0;
        B22 <= 0;
        B23 <= 0;
        B24 <= 0;
        B31 <= 0;
        B32 <= 0;
        B33 <= 0;
        B34 <= 0;
        B41 <= 0;
        B42 <= 0;
        B43 <= 0;
        B44 <= 0;
        cnt_output <= 0;
        cnt_input <= 0;
	end
	else begin
		c_state <= n_state;
        ss_tready <= ss_tready_before_FF;
        sm_tvalid <= sm_tvalid_before_FF;
        sm_tdata <= sm_tdata_before_FF;
        A1  <= next_A1 ;
        A2  <= next_A2 ;
        A3  <= next_A3 ;
        A4  <= next_A4 ;
        B11 <= next_B11;
        B12 <= next_B12;
        B13 <= next_B13;
        B14 <= next_B14;
        B21 <= next_B21;
        B22 <= next_B22;
        B23 <= next_B23;
        B24 <= next_B24;
        B31 <= next_B31;
        B32 <= next_B32;
        B33 <= next_B33;
        B34 <= next_B34;
        B41 <= next_B41;
        B42 <= next_B42;
        B43 <= next_B43;
        B44 <= next_B44;
        cnt_output <= next_cnt_output;
        cnt_input <= next_cnt_input;
	end
end

always @(*) begin
    next_A1=A1;
    next_A2=A2;
    next_A3=A3;
    next_A4=A4;
    next_B11=B11;
    next_B12=B12;
    next_B13=B13;
    next_B14=B14;
    next_B21=B21;
    next_B22=B22;
    next_B23=B23;
    next_B24=B24;
    next_B31=B31;
    next_B32=B32;
    next_B33=B33;
    next_B34=B34;
    next_B41=B41;
    next_B42=B42;
    next_B43=B43;
    next_B44=B44;


    case(c_state)
        //0
        IDLE: begin // modified
            sm_tvalid_before_FF=0;
            sm_tdata_before_FF=0;
            next_cnt_input=0;
            next_cnt_output=0;
            
            if(mm_start_whole) begin // ap_start
                n_state = WAIT_MATRIX_A1_HANDSHAKE;
                ss_tready_before_FF=1;
            end
            else begin
                n_state = IDLE;
                ss_tready_before_FF=0;
            end
        end
        WAIT_MATRIX_A1_HANDSHAKE:begin
            ss_tready_before_FF=1;
            sm_tvalid_before_FF=0;
            sm_tdata_before_FF=0;
            next_cnt_input=0;
            next_cnt_output=0;

            if(mm_start) begin // ss handshake
                n_state = INPUT_MATRIX_A_row1;
            end
            else begin
                n_state = WAIT_MATRIX_A1_HANDSHAKE;
            end
        end
        INPUT_MATRIX_A_row1:begin
            ss_tready_before_FF=1;
            sm_tvalid_before_FF=0;
            sm_tdata_before_FF=0;
            next_cnt_output=0;

            if(cnt_input==3) begin
                n_state = WAIT_MATRIX_B_HANDSHAKE;
                next_A4=ss_tdata;
                next_cnt_input=0;
            end
            else if(cnt_input==2) begin
                n_state = INPUT_MATRIX_A_row1;
                next_A3=ss_tdata;
                next_cnt_input=cnt_input+1;
            end
            else if(cnt_input==1) begin
                n_state = INPUT_MATRIX_A_row1;
                next_A2=ss_tdata;
                next_cnt_input=cnt_input+1;
            end
            else begin
                n_state = INPUT_MATRIX_A_row1;
                next_A1=ss_tdata;
                next_cnt_input=cnt_input+1;
            end
        end
        WAIT_MATRIX_B_HANDSHAKE:begin
            ss_tready_before_FF=1;
            sm_tvalid_before_FF=0;
            sm_tdata_before_FF=0;
            next_cnt_input=0;
            next_cnt_output=cnt_output;

            if(mm_start) begin // ss handshake
                n_state = INPUT_MATRIX_B_column;
            end
            else begin
                n_state = WAIT_MATRIX_B_HANDSHAKE;
            end
        end
        INPUT_MATRIX_B_column:begin
            sm_tvalid_before_FF=0;
            sm_tdata_before_FF=0;
            next_cnt_output=cnt_output;

            if(cnt_input==3) begin
                n_state = OUTPUT_row1;
                ss_tready_before_FF=0;
                if(cnt_output==0) begin
                    next_B41=ss_tdata;
                end
                else if(cnt_output==1) begin
                    next_B42=ss_tdata;
                end
                else if(cnt_output==2) begin
                    next_B43=ss_tdata;
                end
                else begin
                    next_B44=ss_tdata;
                end
                next_cnt_input=0;
            end
            else if(cnt_input==2) begin
                n_state = INPUT_MATRIX_B_column;
                ss_tready_before_FF=1;
                if(cnt_output==0) begin
                    next_B31=ss_tdata;
                end
                else if(cnt_output==1) begin
                    next_B32=ss_tdata;
                end
                else if(cnt_output==2) begin
                    next_B33=ss_tdata;
                end
                else begin
                    next_B34=ss_tdata;
                end
                next_cnt_input=cnt_input+1;
            end
            else if(cnt_input==1) begin
                n_state = INPUT_MATRIX_B_column;
                ss_tready_before_FF=1;
                if(cnt_output==0) begin
                    next_B21=ss_tdata;
                end
                else if(cnt_output==1) begin
                    next_B22=ss_tdata;
                end
                else if(cnt_output==2) begin
                    next_B23=ss_tdata;
                end
                else begin
                    next_B24=ss_tdata;
                end
                next_cnt_input=cnt_input+1;
            end
            else begin
                n_state = INPUT_MATRIX_B_column;
                ss_tready_before_FF=1;
                if(cnt_output==0) begin
                    next_B11=ss_tdata;
                end
                else if(cnt_output==1) begin
                    next_B12=ss_tdata;
                end
                else if(cnt_output==2) begin
                    next_B13=ss_tdata;
                end
                else begin
                    next_B14=ss_tdata;
                end

                next_cnt_input=cnt_input+1;
            end
        end
        OUTPUT_row1:begin
            next_cnt_input=0;

            if (mm_done) begin // sm handshake
                sm_tvalid_before_FF=0;
                sm_tdata_before_FF=0;
                next_cnt_output=cnt_output+1;
                if(cnt_output==3) begin
                    n_state = WAIT_MATRIX_A_rest_row_HANDSHAKE;
                    ss_tready_before_FF=1;
                end
                else begin
                    n_state = WAIT_MATRIX_B_HANDSHAKE;
                    ss_tready_before_FF=0;
                end
            end
            else begin
                n_state = OUTPUT_row1;
                ss_tready_before_FF=0;
                sm_tvalid_before_FF=1;
                next_cnt_output=cnt_output;
                if(cnt_output==0) begin
                    sm_tdata_before_FF=mac1;
                end
                else if(cnt_output==1) begin
                    sm_tdata_before_FF=mac2;
                end
                else if(cnt_output==2) begin
                    sm_tdata_before_FF=mac3;
                end
                else begin
                    sm_tdata_before_FF=mac4;
                end
                
            end
        end
        WAIT_MATRIX_A_rest_row_HANDSHAKE:begin
            ss_tready_before_FF=1;
            sm_tvalid_before_FF=0;
            sm_tdata_before_FF=0;
            next_cnt_input=0;
            next_cnt_output=cnt_output;

            if(mm_start) begin // ss handshake
                n_state = INPUT_MATRIX_A_rest_row;
            end
            else begin
                n_state = WAIT_MATRIX_A_rest_row_HANDSHAKE;
            end
        end
        INPUT_MATRIX_A_rest_row:begin
            sm_tvalid_before_FF=0;
            sm_tdata_before_FF=0;
            next_cnt_output=cnt_output;

            if(cnt_input==3) begin
                n_state = OUTPUT_rest_row;
                ss_tready_before_FF=0;
                next_A4=ss_tdata;
                next_cnt_input=0;
            end
            else if(cnt_input==2) begin
                n_state = INPUT_MATRIX_A_rest_row;
                ss_tready_before_FF=1;
                next_A3=ss_tdata;
                next_cnt_input=cnt_input+1;
            end
            else if(cnt_input==1) begin
                n_state = INPUT_MATRIX_A_rest_row;
                ss_tready_before_FF=1;
                next_A2=ss_tdata;
                next_cnt_input=cnt_input+1;
            end
            else begin
                n_state = INPUT_MATRIX_A_rest_row;
                ss_tready_before_FF=1;
                next_A1=ss_tdata;

                next_cnt_input=cnt_input+1;
            end
        end
        OUTPUT_rest_row:begin
            ss_tready_before_FF=0;
            

            if (mm_done) begin // sm handshake
                next_cnt_output=cnt_output+1;
                if(cnt_input==3) begin
                    sm_tvalid_before_FF=0;
                    sm_tdata_before_FF=0;
                    next_cnt_input=0;
                    if(cnt_output==15) begin
                        n_state = DONE;
                    end
                    else begin
                        n_state = WAIT_MATRIX_A_rest_row_HANDSHAKE;
                    end
                end
                else begin
                    n_state = OUTPUT_rest_row;
                    sm_tvalid_before_FF=1;
                    if(cnt_input==0) begin
                        sm_tdata_before_FF=mac2;
                    end
                    else if(cnt_input==1) begin
                        sm_tdata_before_FF=mac3;
                    end
                    else if(cnt_input==2) begin
                        sm_tdata_before_FF=mac4;
                    end
                    else begin
                        sm_tdata_before_FF=0;
                    end
                    next_cnt_input=cnt_input+1;
                end
            end
            else begin
                n_state = OUTPUT_rest_row;
                ss_tready_before_FF=0;
                sm_tvalid_before_FF=1;
                next_cnt_input=cnt_input;
                next_cnt_output=cnt_output;

                if(cnt_input==0) begin
                    sm_tdata_before_FF=mac1;
                end
                else if(cnt_input==1) begin
                    sm_tdata_before_FF=mac2;
                end
                else if(cnt_input==2) begin
                    sm_tdata_before_FF=mac3;
                end
                else begin
                    sm_tdata_before_FF=mac4;
                end
                
            end
        end
        DONE:begin
            n_state = DONE;
            ss_tready_before_FF=0;
            sm_tvalid_before_FF=0;
            sm_tdata_before_FF=0;
            next_cnt_input=0;
            next_cnt_output=cnt_output;
        end
        default : begin
            n_state = IDLE;
            ss_tready_before_FF=0;
            sm_tvalid_before_FF=0;
            sm_tdata_before_FF=0;

            next_cnt_input=0;
            next_cnt_output=cnt_output;
            
        end
    endcase
end








/*localparam IDLE = 4'd0;
localparam WAIT_FOR_INPUT = 4'd1;
localparam WAIT_FOR_OUTPUT = 4'd2;
localparam INPUT_MATRIX_A= 4'd3;
localparam INPUT_MATRIX_B= 4'd4;
localparam OUTPUT_MATRIX_C = 4'd5;

localparam INPUT_A_ROW2 = 4'd6;
localparam OUTPUT_C_ROW2 = 4'd7;
localparam INPUT_A_ROW3 = 4'd8;
localparam OUTPUT_C_ROW3 = 4'd9;
localparam INPUT_A_ROW4 = 4'd10;
localparam OUTPUT_C_ROW4 = 4'd11;

localparam DONE = 4'd12;
localparam INITIAL = 4'd13; // modified
localparam ERROR = 4'd14; // modified

wire mm_start; // modified
wire mm_done; // modified
wire mm_idle; // modified
assign mm_done_whole=mm_idle; // modified

reg         [3:0]           n_state;
reg         [3:0]           c_state;
//matrix A * matrix B == matrix C
reg         [4:0]           cnt_output;
reg         [2:0]           cnt_A_input;
reg         [4:0]           cnt_B_input;

reg    [(pDATA_WIDTH-1):0]  A1,A2,A3,A4;
reg    [(pDATA_WIDTH-1):0]  B11,B12,B13,B14;
reg    [(pDATA_WIDTH-1):0]  B21,B22,B23,B24;
reg    [(pDATA_WIDTH-1):0]  B31,B32,B33,B34;
reg    [(pDATA_WIDTH-1):0]  B41,B42,B43,B44;

wire                         output_flag;
wire                         input_A_flag;
wire                         input_B_flag;

wire                         input_valid;

reg   [3:0]                 stop_state;

wire   [(pDATA_WIDTH-1):0]  mac1,mac2,mac3,mac4; // MUL & ADD

assign input_valid = (c_state == INPUT_MATRIX_A || c_state == INPUT_A_ROW2 || c_state == INPUT_A_ROW3 || c_state == INPUT_A_ROW4 || c_state == INPUT_MATRIX_B)?1:0;
assign output_valid = ( c_state == OUTPUT_MATRIX_C || c_state == OUTPUT_C_ROW2 || c_state == OUTPUT_C_ROW3 || c_state == OUTPUT_C_ROW4)?1:0;
assign ss_tready = (cnt_B_input == 16 || n_state == OUTPUT_C_ROW2 || n_state == OUTPUT_C_ROW3 || n_state == OUTPUT_C_ROW4 || n_state == DONE)? 0:1;
assign sm_tvalid = output_flag;

assign mm_start = (ss_tvalid && ss_tready) ? 1:0;
assign mm_done = (sm_tvalid && sm_tready) ? 1:0;
assign mm_idle = (sm_tvalid && sm_tready && cnt_output == 5'd15) ? 1:0;

// assign input_A_flag =   (cnt_B_input == 5'd16)?0:
//                         (cnt_A_input == 3'd3 || c_state == INPUT_MATRIX_B || c_state == OUTPUT_MATRIX_C)?1:0;
assign input_A_flag = (n_state == INPUT_MATRIX_B || cnt_B_input == 4 || cnt_B_input == 8 || cnt_B_input == 12 || cnt_B_input == 16 || output_valid)?1:0;
assign input_B_flag =   (cnt_B_input == 5'd16 || cnt_B_input == 5'd12 || cnt_B_input == 5'd8 || cnt_B_input == 5'd4 || c_state == OUTPUT_C_ROW2 || c_state == OUTPUT_C_ROW3 || c_state == OUTPUT_C_ROW4)? 1:0;

assign output_flag  =   (input_A_flag && input_B_flag )? 1:0;

//MAC
assign mac1 = (output_flag)? (A1 * B11 + A2 * B21 + A3 * B31 + A4 * B41):0;
assign mac2 = (output_flag)? (A1 * B12 + A2 * B22 + A3 * B32 + A4 * B42):0;
assign mac3 = (output_flag)? (A1 * B13 + A2 * B23 + A3 * B33 + A4 * B43):0;
assign mac4 = (output_flag)? (A1 * B14 + A2 * B24 + A3 * B34 + A4 * B44):0;

assign sm_tdata = (mm_done && (cnt_output)%4==0)?mac1:
                  (mm_done && (cnt_output)%4==1)?mac2:
                  (mm_done && (cnt_output)%4==2)?mac3:mac4;
/////////////////////////////////////////////
///FSM
/////////////////////////////////////////////
always @(posedge axis_clk or negedge axis_rst_n) begin
	if(!axis_rst_n) begin
		c_state <= IDLE; // modified
        /////c_state <= INITIAL;
	end
	else begin
		c_state <= n_state;
	end
end

always @(*) begin
    //stop_state=ERROR; // modified

    case(c_state)
        //0
        INITIAL: begin // modified
            if(mm_start_whole) begin
                n_state = IDLE;
            end
            else begin
                n_state = INITIAL;
            end
        end
        IDLE:begin
            if(mm_start)
                n_state = INPUT_MATRIX_A;
            else begin
                n_state = WAIT_FOR_INPUT; 
                stop_state=INPUT_MATRIX_A; // modified
            end
        end
        //3
        INPUT_MATRIX_A:begin
            if(cnt_A_input == 3'd4)
                n_state = INPUT_MATRIX_B;
            else if (mm_start) begin
                n_state = INPUT_MATRIX_A;
            end
            else begin
                n_state = WAIT_FOR_INPUT;
                stop_state=INPUT_MATRIX_A; // modified
            end
        end
        //4
        INPUT_MATRIX_B:begin
            if(input_B_flag)begin
                n_state = OUTPUT_MATRIX_C;
            end
            else if(mm_start)begin
                n_state = INPUT_MATRIX_B;
            end
            else begin
                n_state = WAIT_FOR_INPUT;
                stop_state=INPUT_MATRIX_B; // modified
            end
        end
        //1
        WAIT_FOR_INPUT: begin
            if(~mm_start)
                n_state = WAIT_FOR_INPUT;
            else if(mm_start && stop_state == INPUT_MATRIX_A)
                n_state = INPUT_MATRIX_A;
            else if(mm_start && stop_state == INPUT_MATRIX_B)
                n_state = INPUT_MATRIX_B;
            else if(mm_start && stop_state == INPUT_A_ROW2)
                n_state = INPUT_A_ROW2;
            else if(mm_start && stop_state == INPUT_A_ROW3)
                n_state = INPUT_A_ROW3;
            else if(mm_start && stop_state == INPUT_A_ROW4)
                n_state = INPUT_A_ROW4;
            else n_state = WAIT_FOR_INPUT;
        end
        //5
        OUTPUT_MATRIX_C :begin
            if(cnt_output == 5'd4)
                n_state = INPUT_A_ROW2;
            else if(mm_start)
                n_state = INPUT_MATRIX_B;
            else if(~mm_done)
                n_state = WAIT_FOR_OUTPUT;
            else begin
                n_state = WAIT_FOR_INPUT;
                stop_state=INPUT_MATRIX_B;
            end
        end
        //6
        INPUT_A_ROW2:begin
            if(cnt_A_input == 3'd4)
                n_state = OUTPUT_C_ROW2;
            else if (mm_start) 
                n_state = INPUT_A_ROW2;
            else begin
                n_state = WAIT_FOR_INPUT;
                stop_state=INPUT_A_ROW2; // modified
            end
        end
        //8
        INPUT_A_ROW3:begin
            if(cnt_A_input == 3'd4)
                n_state = OUTPUT_C_ROW3;
            else if (mm_start) begin
                n_state = INPUT_A_ROW3;
            end
            else begin
                n_state = WAIT_FOR_INPUT;
                stop_state=INPUT_A_ROW3; // modified
            end
        end
        //10
        INPUT_A_ROW4:begin
            if(cnt_A_input == 3'd4)
                n_state = OUTPUT_C_ROW4;
            else if (mm_start) begin
                n_state = INPUT_A_ROW4;
            end
            else begin
                n_state = WAIT_FOR_INPUT;
                stop_state=INPUT_A_ROW4; // modified
            end
        end
        //7
        OUTPUT_C_ROW2 :begin
            if(~mm_done)
                n_state = WAIT_FOR_OUTPUT;
            else if(mm_done && cnt_output == 5'd7)
                n_state = INPUT_A_ROW3;
            else 
                n_state = OUTPUT_C_ROW2;
        end
        //9
        OUTPUT_C_ROW3 :begin
            if(~mm_done)
                n_state = WAIT_FOR_OUTPUT;
            else if(mm_done && cnt_output == 5'd11)
                n_state = INPUT_A_ROW4;
            else 
                n_state = OUTPUT_C_ROW3;
        end
        //11
        OUTPUT_C_ROW4 :begin
            if(~mm_done)
                n_state = WAIT_FOR_OUTPUT;
            else if(mm_idle && cnt_output == 5'd15)
                n_state = DONE;
            else 
                n_state = OUTPUT_C_ROW4;
        end
        //12
        DONE: begin
            n_state = IDLE;
        end
        default : begin
            n_state = IDLE;
        end
    endcase
end

/////////////////////////////////////////////
///counter
/////////////////////////////////////////////


// if a row of matrix A is done of input
// then change matrix B to input a column : input_A_flag will pull high 

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        cnt_A_input <= 3'd0;
    else if(cnt_A_input >= 3'd4)
        cnt_A_input <= 3'd0;
    else begin
        case (n_state)
            INPUT_MATRIX_A:
            if(mm_start)
                cnt_A_input <= cnt_A_input + 3'd1; 
            INPUT_A_ROW2:
            if(mm_start)
                cnt_A_input <= cnt_A_input + 3'd1; 
            INPUT_A_ROW3:
            if(mm_start)
                cnt_A_input <= cnt_A_input + 3'd1;
            INPUT_A_ROW4: 
            if(mm_start)
                cnt_A_input <= cnt_A_input + 3'd1; 
            OUTPUT_MATRIX_C:
                cnt_A_input <= 3'd0;
            OUTPUT_C_ROW2:
                cnt_A_input <= 3'd0;
            OUTPUT_C_ROW3:
                cnt_A_input <= 3'd0;
            OUTPUT_C_ROW4:
                cnt_A_input <= 3'd0;

            default: cnt_A_input <= cnt_A_input;
        endcase
    end
end


always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        cnt_B_input <= 5'd0;
    else if (mm_idle) 
        cnt_B_input <= 5'd0;
    else if(cnt_B_input >= 5'd17) 
        cnt_B_input <= cnt_B_input;
    else if(mm_start && input_A_flag && n_state == INPUT_MATRIX_B) 
        cnt_B_input <= cnt_B_input + 5'd1;
    else if(cnt_B_input >= 5'd4 && cnt_B_input % 4 == 0)
        cnt_B_input <= cnt_B_input + 1;
    else cnt_B_input <= cnt_B_input;
end

//cnt_output count to 15 means the mm is done
always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        cnt_output <= 5'd0;
    else if(mm_idle)
        cnt_output <= 5'd0;
    else if(mm_done)
        cnt_output <= cnt_output + 5'd1;
    else 
        cnt_output <= cnt_output;
end

/////////////////////////////////////////////
///stop state
/////////////////////////////////////////////
/////always @(*) begin // modified
/////    if(cnt_B_input > 5'd0 && cnt_B_input < 5'd16)
/////        stop_state = 5'd4;
/////    else if(cnt_B_input == 5'd0 && cnt_A_input < 3'd4)
/////        stop_state = 5'd3;
/////    else if(cnt_output == 5'd4)
/////        stop_state = 5'd6;
/////    else if(cnt_output == 5'd7 || cnt_output == 5'd8)
/////        stop_state = 5'd8;
/////    else
/////        stop_state = 5'd10;
/////end

/////////////////////////////////////////////
///input matrix A
/////////////////////////////////////////////

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        A1 <= 0;
    else if (mm_start && cnt_A_input == 3'd0)begin
        case (n_state)
            INPUT_MATRIX_A:
                A1 <= ss_tdata; 
            WAIT_FOR_INPUT:
                A1 <= A1;
            INPUT_A_ROW2:
                A1 <= ss_tdata;
            INPUT_A_ROW3:
                A1 <= ss_tdata;
            INPUT_A_ROW4:
                A1 <= ss_tdata;
            default: 
            A1 <= A1;
        endcase
    end
    else A1 <= A1;
end
always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        A2 <= 0;
    else if (mm_start && cnt_A_input == 3'd1)begin
        case (n_state)
            INPUT_MATRIX_A:
                A2 <= ss_tdata; 
            WAIT_FOR_INPUT:
                A2 <= A2;
            INPUT_A_ROW2:
                A2 <= ss_tdata;
            INPUT_A_ROW3:
                A2 <= ss_tdata;
            INPUT_A_ROW4:
                A2 <= ss_tdata;
            default: 
            A2 <= A2;
        endcase
    end
    else A2 <= A2;
end
always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        A3 <= 0;
    else if (mm_start && cnt_A_input == 3'd2)begin
        case (n_state)
            INPUT_MATRIX_A:
                A3 <= ss_tdata; 
            WAIT_FOR_INPUT:
                A3 <= A3;
            INPUT_A_ROW2:
                A3 <= ss_tdata;
            INPUT_A_ROW3:
                A3 <= ss_tdata;
            INPUT_A_ROW4:
                A3 <= ss_tdata;
            default: 
            A3 <= A3;
        endcase
    end
    else A3 <= A3;
end
always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        A4 <= 0;
    else if (mm_start && cnt_A_input == 3'd3)begin
        case (n_state)
            INPUT_MATRIX_A:
                A4 <= ss_tdata; 
            WAIT_FOR_INPUT:
                A4 <= A4;
            INPUT_A_ROW2:
                A4 <= ss_tdata;
            INPUT_A_ROW3:
                A4 <= ss_tdata;
            INPUT_A_ROW4:
                A4 <= ss_tdata;
            default: 
            A4 <= A4;
        endcase
    end
    else A4 <= A4;
end


/////////////////////////////////////////////
///input matrix B
/////////////////////////////////////////////

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B11 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd0)
        B11 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B11 <= B11;
    else B11 <= B11;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B21 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd1)
        B21 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B21 <= B21;
    else B21 <= B21;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B31 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd2)
        B31 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B31 <= B31;
    else B31 <= B31;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B41 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd3)
        B41 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B41 <= B41;
    else B41 <= B41;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B12 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd4)
        B12 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B12 <= B12;
    else B12 <= B12;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B22 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd5)
        B22 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B22 <= B22;
    else B22 <= B22;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B32 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd6)
        B32 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B32 <= B32;
    else B32 <= B32;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B42 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd7)
        B42 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B42 <= B42;
    else B42 <= B42;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B13 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd8)
        B13 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B13 <= B13;
    else B13 <= B13;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B23 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd9)
        B23 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B23 <= B23;
    else B23 <= B23;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B33 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd10)
        B33 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B33 <= B33;
    else B33 <= B33;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B43 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd11)
        B43 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B43 <= B43;
    else B43 <= B43;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B14 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd12)
        B14 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B14 <= B14;
    else B14 <= B14;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B24 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd13)
        B24 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B24 <= B24;
    else B24 <= B24;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B34 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd14)
        B34 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B34 <= B34;
    else B34 <= B34;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B44 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd15)
        B44 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B44 <= B44;
    else B44 <= B44;
end*/
    

/*localparam IDLE = 4'd0;
localparam WAIT_FOR_INPUT = 4'd1;
localparam WAIT_FOR_OUTPUT = 4'd2;
localparam INPUT_MATRIX_A= 4'd3;
localparam INPUT_MATRIX_B= 4'd4;
localparam OUTPUT_MATRIX_C = 4'd5;

localparam INPUT_A_ROW2 = 4'd6;
localparam OUTPUT_C_ROW2 = 4'd7;
localparam INPUT_A_ROW3 = 4'd8;
localparam OUTPUT_C_ROW3 = 4'd9;
localparam INPUT_A_ROW4 = 4'd10;
localparam OUTPUT_C_ROW4 = 4'd11;

localparam DONE = 4'd12;
localparam INITIAL = 4'd13; // modified

wire mm_start; // modified
wire mm_done; // modified
wire mm_idle; // modified
assign mm_done_whole=mm_idle; // modified

reg         [3:0]           n_state;
reg         [3:0]           c_state;
//matrix A * matrix B == matrix C
reg         [4:0]           cnt_output;
reg         [2:0]           cnt_A_input;
reg         [4:0]           cnt_B_input;

reg    [(pDATA_WIDTH-1):0]  A1,A2,A3,A4;
reg    [(pDATA_WIDTH-1):0]  B11,B12,B13,B14;
reg    [(pDATA_WIDTH-1):0]  B21,B22,B23,B24;
reg    [(pDATA_WIDTH-1):0]  B31,B32,B33,B34;
reg    [(pDATA_WIDTH-1):0]  B41,B42,B43,B44;

wire                         output_flag;
wire                         input_A_flag;
wire                         input_B_flag;

wire                         input_valid;

reg   [3:0]                 stop_state;

wire   [(pDATA_WIDTH-1):0]  mac1,mac2,mac3,mac4; // MUL & ADD

assign input_valid = (c_state == INPUT_MATRIX_A || c_state == INPUT_A_ROW2 || c_state == INPUT_A_ROW3 || c_state == INPUT_A_ROW4 || c_state == INPUT_MATRIX_B)?1:0;
assign output_valid = ( c_state == OUTPUT_MATRIX_C || c_state == OUTPUT_C_ROW2 || c_state == OUTPUT_C_ROW3 || c_state == OUTPUT_C_ROW4)?1:0;
assign ss_tready = (cnt_B_input == 16 || n_state == OUTPUT_C_ROW2 || n_state == OUTPUT_C_ROW3 || n_state == OUTPUT_C_ROW4 || n_state == DONE)? 0:1;
/////assign sm_tvalid = output_flag; // modified
reg output_flag_delay; // modified
assign sm_tvalid = output_flag_delay; // modified

assign mm_start = (ss_tvalid && ss_tready) ? 1:0;
assign mm_done = (sm_tvalid && sm_tready) ? 1:0;
assign mm_idle = (sm_tvalid && sm_tready && cnt_output == 5'd15) ? 1:0;

// assign input_A_flag =   (cnt_B_input == 5'd16)?0:
//                         (cnt_A_input == 3'd3 || c_state == INPUT_MATRIX_B || c_state == OUTPUT_MATRIX_C)?1:0;
assign input_A_flag = (n_state == INPUT_MATRIX_B || cnt_B_input == 4 || cnt_B_input == 8 || cnt_B_input == 12 || cnt_B_input == 16 || output_valid)?1:0;
assign input_B_flag =   (cnt_B_input == 5'd16 || cnt_B_input == 5'd12 || cnt_B_input == 5'd8 || cnt_B_input == 5'd4 || c_state == OUTPUT_C_ROW2 || c_state == OUTPUT_C_ROW3 || c_state == OUTPUT_C_ROW4)? 1:0;

assign output_flag  =   (input_A_flag && input_B_flag )? 1:0;

//MAC
/////assign mac1 = (output_flag)? (A1 * B11 + A2 * B21 + A3 * B31 + A4 * B41):0; // modified
/////assign mac2 = (output_flag)? (A1 * B12 + A2 * B22 + A3 * B32 + A4 * B42):0; // modified
/////assign mac3 = (output_flag)? (A1 * B13 + A2 * B23 + A3 * B33 + A4 * B43):0; // modified
/////assign mac4 = (output_flag)? (A1 * B14 + A2 * B24 + A3 * B34 + A4 * B44):0; // modified
assign mac1 = (output_flag_delay)? (A1 * B11 + A2 * B21 + A3 * B31 + A4 * B41):0;
assign mac2 = (output_flag_delay)? (A1 * B12 + A2 * B22 + A3 * B32 + A4 * B42):0;
assign mac3 = (output_flag_delay)? (A1 * B13 + A2 * B23 + A3 * B33 + A4 * B43):0;
assign mac4 = (output_flag_delay)? (A1 * B14 + A2 * B24 + A3 * B34 + A4 * B44):0;

assign sm_tdata = (mm_done && (cnt_output)%4==0)?mac1:
                  (mm_done && (cnt_output)%4==1)?mac2:
                  (mm_done && (cnt_output)%4==2)?mac3:mac4;
/////////////////////////////////////////////
///FSM
/////////////////////////////////////////////
always @(posedge axis_clk or negedge axis_rst_n) begin
	if(!axis_rst_n) begin
		c_state <= IDLE; // modified
        /////c_state <= INITIAL;
        output_flag_delay <= 0; // modified
	end
	else begin
		c_state <= n_state;
        output_flag_delay <= output_flag; // modified
	end
end

always @(*) begin
    case(c_state)
        //0
        INITIAL: begin // modified
            if(mm_start_whole) begin
                n_state = IDLE;
            end
            else begin
                n_state = INITIAL;
            end
        end
        IDLE:begin
            if(mm_start)
                n_state = INPUT_MATRIX_A;
            else 
                n_state = IDLE; 
        end
        //3
        INPUT_MATRIX_A:begin
            if(cnt_A_input == 3'd4)
                n_state = INPUT_MATRIX_B;
            else if (mm_start) begin
                n_state = INPUT_MATRIX_A;
            end
            else n_state = INPUT_MATRIX_A;
        end
        //4
        INPUT_MATRIX_B:begin
            if(input_B_flag)begin
                n_state = OUTPUT_MATRIX_C;
            end
            else if(mm_start)begin
                n_state = INPUT_MATRIX_B;
            end
            else n_state = INPUT_MATRIX_B;
        end
        //1
        WAIT_FOR_INPUT: begin
            if(~mm_start)
                n_state = WAIT_FOR_INPUT;
            else if(mm_start && stop_state == INPUT_MATRIX_A)
                n_state = INPUT_MATRIX_A;
            else if(mm_start && stop_state == INPUT_MATRIX_B)
                n_state = INPUT_MATRIX_B;
            else if(mm_start && stop_state == INPUT_A_ROW2)
                n_state = INPUT_A_ROW2;
            else if(mm_start && stop_state == INPUT_A_ROW3)
                n_state = INPUT_A_ROW3;
            else if(mm_start && stop_state == INPUT_A_ROW4)
                n_state = INPUT_A_ROW4;
            else n_state = WAIT_FOR_INPUT;
        end
        //5
        OUTPUT_MATRIX_C :begin
            if(cnt_output == 5'd4)
                n_state = INPUT_A_ROW2;
            else if(mm_start)
                n_state = INPUT_MATRIX_B;
            else if(~mm_done)
                n_state = OUTPUT_MATRIX_C;
        end
        //6
        INPUT_A_ROW2:begin
            if(cnt_A_input == 3'd4)
                n_state = OUTPUT_C_ROW2;
            else if (mm_start) 
                n_state = INPUT_A_ROW2;
            else n_state = INPUT_A_ROW2;
        end
        //8
        INPUT_A_ROW3:begin
            if(cnt_A_input == 3'd4)
                n_state = OUTPUT_C_ROW3;
            else if (mm_start) begin
                n_state = INPUT_A_ROW3;
            end
            else n_state = INPUT_A_ROW3;
        end
        //10
        INPUT_A_ROW4:begin
            if(cnt_A_input == 3'd4)
                n_state = OUTPUT_C_ROW4;
            else if (mm_start) begin
                n_state = INPUT_A_ROW4;
            end
            else n_state = INPUT_A_ROW4;
        end
        //7
        OUTPUT_C_ROW2 :begin
            if(~mm_done)
                n_state = WAIT_FOR_OUTPUT;
            else if(mm_done && cnt_output == 5'd7)
                n_state = INPUT_A_ROW3;
            else 
                n_state = OUTPUT_C_ROW2;
        end
        //9
        OUTPUT_C_ROW3 :begin
            if(~mm_done)
                n_state = WAIT_FOR_OUTPUT;
            else if(mm_done && cnt_output == 5'd11)
                n_state = INPUT_A_ROW4;
            else 
                n_state = OUTPUT_C_ROW3;
        end
        //11
        OUTPUT_C_ROW4 :begin
            if(~mm_done)
                n_state = WAIT_FOR_OUTPUT;
            else if(mm_idle && cnt_output == 5'd15)
                n_state = DONE;
            else 
                n_state = OUTPUT_C_ROW4;
        end
        //12
        DONE: begin
            n_state = IDLE;
        end
        default : begin
            n_state = IDLE;
        end
    endcase
end

/////////////////////////////////////////////
///counter
/////////////////////////////////////////////


// if a row of matrix A is done of input
// then change matrix B to input a column : input_A_flag will pull high 

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        cnt_A_input <= 3'd0;
    else if(cnt_A_input >= 3'd4)
        cnt_A_input <= 3'd0;
    else begin
        case (n_state)
            INPUT_MATRIX_A:
            if(mm_start)
                cnt_A_input <= cnt_A_input + 3'd1; 
            INPUT_A_ROW2:
            if(mm_start)
                cnt_A_input <= cnt_A_input + 3'd1; 
            INPUT_A_ROW3:
            if(mm_start)
                cnt_A_input <= cnt_A_input + 3'd1;
            INPUT_A_ROW4: 
            if(mm_start)
                cnt_A_input <= cnt_A_input + 3'd1; 
            OUTPUT_MATRIX_C:
                cnt_A_input <= 3'd0;
            OUTPUT_C_ROW2:
                cnt_A_input <= 3'd0;
            OUTPUT_C_ROW3:
                cnt_A_input <= 3'd0;
            OUTPUT_C_ROW4:
                cnt_A_input <= 3'd0;

            default: cnt_A_input <= cnt_A_input;
        endcase
    end
end


always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        cnt_B_input <= 5'd0;
    else if (mm_idle) 
        cnt_B_input <= 5'd0;
    else if(cnt_B_input >= 5'd17) 
        cnt_B_input <= cnt_B_input;
    else if(mm_start && input_A_flag && n_state == INPUT_MATRIX_B)
        cnt_B_input <= cnt_B_input + 5'd1;
    else if(cnt_B_input >= 5'd4 && cnt_B_input % 4 == 0)
        cnt_B_input <= cnt_B_input + 1;
    else cnt_B_input <= cnt_B_input;
end

//cnt_output count to 15 means the mm is done
always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        cnt_output <= 5'd0;
    else if(mm_idle)
        cnt_output <= 5'd0;
    else if(mm_done)
        cnt_output <= cnt_output + 5'd1;
    else 
        cnt_output <= cnt_output;
end

/////////////////////////////////////////////
///stop state
/////////////////////////////////////////////
always @(*) begin
    if(cnt_B_input > 5'd0 && cnt_B_input < 5'd16)
        stop_state = 5'd4;
    else if(cnt_B_input == 5'd0 && cnt_A_input < 3'd4)
        stop_state = 5'd3;
    else if(cnt_output == 5'd4)
        stop_state = 5'd6;
    else if(cnt_output == 5'd7 || cnt_output == 5'd8)
        stop_state = 5'd8;
    else
        stop_state = 5'd10;
end

/////////////////////////////////////////////
///input matrix A
/////////////////////////////////////////////

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        A1 <= 0;
    else if (mm_start && cnt_A_input == 3'd0)begin
        case (n_state)
            INPUT_MATRIX_A:
                A1 <= ss_tdata; 
            WAIT_FOR_INPUT:
                A1 <= A1;
            INPUT_A_ROW2:
                A1 <= ss_tdata;
            INPUT_A_ROW3:
                A1 <= ss_tdata;
            INPUT_A_ROW4:
                A1 <= ss_tdata;
            default: 
            A1 <= A1;
        endcase
    end
    else A1 <= A1;
end
always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        A2 <= 0;
    else if (mm_start && cnt_A_input == 3'd1)begin
        case (n_state)
            INPUT_MATRIX_A:
                A2 <= ss_tdata; 
            WAIT_FOR_INPUT:
                A2 <= A2;
            INPUT_A_ROW2:
                A2 <= ss_tdata;
            INPUT_A_ROW3:
                A2 <= ss_tdata;
            INPUT_A_ROW4:
                A2 <= ss_tdata;
            default: 
            A2 <= A2;
        endcase
    end
    else A2 <= A2;
end
always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        A3 <= 0;
    else if (mm_start && cnt_A_input == 3'd2)begin
        case (n_state)
            INPUT_MATRIX_A:
                A3 <= ss_tdata; 
            WAIT_FOR_INPUT:
                A3 <= A3;
            INPUT_A_ROW2:
                A3 <= ss_tdata;
            INPUT_A_ROW3:
                A3 <= ss_tdata;
            INPUT_A_ROW4:
                A3 <= ss_tdata;
            default: 
            A3 <= A3;
        endcase
    end
    else A3 <= A3;
end
always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        A4 <= 0;
    else if (mm_start && cnt_A_input == 3'd3)begin
        case (n_state)
            INPUT_MATRIX_A:
                A4 <= ss_tdata; 
            WAIT_FOR_INPUT:
                A4 <= A4;
            INPUT_A_ROW2:
                A4 <= ss_tdata;
            INPUT_A_ROW3:
                A4 <= ss_tdata;
            INPUT_A_ROW4:
                A4 <= ss_tdata;
            default: 
            A4 <= A4;
        endcase
    end
    else A4 <= A4;
end


/////////////////////////////////////////////
///input matrix B
/////////////////////////////////////////////

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B11 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd0)
        B11 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B11 <= B11;
    else B11 <= B11;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B21 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd1)
        B21 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B21 <= B21;
    else B21 <= B21;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B31 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd2)
        B31 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B31 <= B31;
    else B31 <= B31;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B41 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd3)
        B41 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B41 <= B41;
    else B41 <= B41;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B12 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd5) //4) // modified
        B12 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B12 <= B12;
    else B12 <= B12;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B22 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd6) //5) // modified
        B22 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B22 <= B22;
    else B22 <= B22;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B32 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd7) //6) // modified
        B32 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B32 <= B32;
    else B32 <= B32;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B42 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd8) //7) // modified
        B42 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B42 <= B42;
    else B42 <= B42;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B13 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd9) //8) // modified
        B13 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B13 <= B13;
    else B13 <= B13;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B23 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd10) //9) // modified
        B23 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B23 <= B23;
    else B23 <= B23;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B33 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd11) //10) // modified
        B33 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B33 <= B33;
    else B33 <= B33;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B43 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd12) //11) // modified
        B43 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B43 <= B43;
    else B43 <= B43;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B14 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd13) //12) // modified
        B14 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B14 <= B14;
    else B14 <= B14;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B24 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd14) //13) // modified
        B24 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B24 <= B24;
    else B24 <= B24;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B34 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd15) //14) // modified
        B34 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B34 <= B34;
    else B34 <= B34;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) 
        B44 <= 0;
    else if(input_A_flag && cnt_B_input == 5'd16) //15) // modified
        B44 <= ss_tdata; 
    else if(n_state == WAIT_FOR_INPUT)
        B44 <= B44;
    else B44 <= B44;
end*/
    

endmodule