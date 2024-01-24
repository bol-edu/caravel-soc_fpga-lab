module DMA_MM 
#(  parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32
)
(

    // WB interface
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output reg wbs_ack_o,
    output reg [31:0] wbs_dat_o,

    // SDRAM request MM (controller interface)
    output reg  [22:0] MM_address,
    output reg  MM_rw, // 1 = write, 0 = read
    output reg  [31:0] data_from_MM,
    input   [31:0] data_to_MM,
    input   MM_busy,
    output reg  MM_in_valid,
    input   MM_out_valid,
    output reg  MM_prefetch_step
);

    ///////////////////////////////////////// (For test) /////////////////////////////////////////
    ///wire [31:0] MM_output_buffer0;
    ///wire [31:0] MM_output_buffer1;
    ///wire [31:0] MM_output_buffer2;
    ///wire [31:0] MM_output_buffer3;
    ///wire [31:0] MM_output_buffer4;
    ///wire [31:0] MM_output_buffer5;
    ///wire [31:0] MM_output_buffer6;
    ///wire [31:0] MM_output_buffer7;
    ///wire [31:0] MM_output_buffer8;
    ///wire [31:0] MM_output_buffer9;
    ///wire [31:0] MM_output_buffer10;
    ///wire [31:0] MM_output_buffer11;
    ///wire [31:0] MM_output_buffer12;
    ///wire [31:0] MM_output_buffer13;
    ///wire [31:0] MM_output_buffer14;
    ///wire [31:0] MM_output_buffer15;
    ///wire [31:0] MM_input_buffer0;
    ///wire [31:0] MM_input_buffer1;
    ///wire [31:0] MM_input_buffer2;
    ///wire [31:0] MM_input_buffer3;
    ///
    ///assign MM_output_buffer0=output_buffer[0];
    ///assign MM_output_buffer1=output_buffer[1];
    ///assign MM_output_buffer2=output_buffer[2];
    ///assign MM_output_buffer3=output_buffer[3];
    ///assign MM_output_buffer4=output_buffer[4];
    ///assign MM_output_buffer5=output_buffer[5];
    ///assign MM_output_buffer6=output_buffer[6];
    ///assign MM_output_buffer7=output_buffer[7];
    ///assign MM_output_buffer8=output_buffer[8];
    ///assign MM_output_buffer9=output_buffer[9];
    ///assign MM_output_buffer10=output_buffer[10];
    ///assign MM_output_buffer11=output_buffer[11];
    ///assign MM_output_buffer12=output_buffer[12];
    ///assign MM_output_buffer13=output_buffer[13];
    ///assign MM_output_buffer14=output_buffer[14];
    ///assign MM_output_buffer15=output_buffer[15];
    ///assign MM_input_buffer0=input_buffer[0];
    ///assign MM_input_buffer1=input_buffer[1];
    ///assign MM_input_buffer2=input_buffer[2];
    ///assign MM_input_buffer3=input_buffer[3];

    //////////////////////////////////////////////////////////////////////////////////////////////
    
    localparam DMA_MM_IDLE = 3'd0, DMA_MM_BASE_ADDRESS = 3'd1, DMA_MM_DETECT_Yn_Xn = 3'd2, DMA_MM_STREAM_IN = 3'd3, DMA_MM_STREAM_OUT = 3'd4, DMA_MM_DONE = 3'd5;
    localparam DMA_MM_REQUEST_IDLE = 3'd0, DMA_MM_REQUEST_SDRAM_WRITE_INPUT_BUFFER = 3'd1, DMA_MM_REQUEST_SDRAM_READ_OUTPUT_BUFFER = 3'd2, DMA_MM_REQUEST_SDRAM_READ_OUTPUT_BUFFER_WAIT = 3'd3, DMA_MM_NO_REQUEST = 3'd4, DMA_MM_REQUEST_DONE = 3'd5;

    reg wbs_ack_o_before_FF;
    reg [31:0] wbs_dat_o_before_FF;

    reg [22:0] MM_address_before_FF;
    reg MM_rw_before_FF;
    reg [31:0] data_from_MM_before_FF;
    reg MM_in_valid_before_FF;
    reg MM_prefetch_step_before_FF;

    reg [2:0] state_DMA_MM;
    reg [2:0] next_state_DMA_MM;
    reg [2:0] state_DMA_MM_request_SDRAM;
    reg [2:0] next_state_DMA_MM_request_SDRAM;

    reg [31:0] input_buffer [0:3]; // To buffer 4 data
    reg [31:0] next_input_buffer [0:3];
    reg input_buffer_valid; // "All" of the input buffer have been used
    reg next_input_buffer_valid;
    //reg [31:0] output_buffer [0:15]; // To buffer 16 data, because in software matmul.h, result array is set to have 4*4 elements
    //reg [31:0] next_output_buffer [0:15];
    reg [31:0] output_buffer;
    reg [31:0] next_output_buffer;
    reg output_buffer_valid;
    reg next_output_buffer_valid;
    reg [22:0] output_SDRAM_address_pointer_counter;
    reg [22:0] next_output_SDRAM_address_pointer_counter;
    reg [3:0] output_delay_counter; // to aviod conflicting between read into input_buffer and write from output_buffer
    reg [3:0] next_output_delay_counter;

    reg [22:0] MM_base_address_A_buffer; // Be caution of its bit number !! (Because it is with controller protocol)
    reg [22:0] next_MM_base_address_A_buffer;
    reg [22:0] MM_base_address_B_buffer; // Be caution of its bit number !! (Because it is with controller protocol)
    reg [22:0] next_MM_base_address_B_buffer;

    reg [2:0] input_number_counter_coarse; // (0)A_row0 -> (1)B_column0 -> (2)B_column1 -> (3)B_column2 -> (4)B_column3 -> (5)A_row1 -> (6)A_row2 -> (7)A_row3
    reg [2:0] next_input_number_counter_coarse;
    reg [1:0] input_number_counter_fine; // Within one row/column, there are 4 elements
    reg [1:0] next_input_number_counter_fine;

    reg [1:0] input_number_counter; // For counting input_buffer to MM (in the down layer)
    reg [1:0] next_input_number_counter;

    reg MM_done_shown_in_DMA;
    reg next_MM_done_shown_in_DMA;

    integer i;

    always @* begin
        if((state_DMA_MM==DMA_MM_DONE) && (output_buffer_valid==0)) begin
            next_MM_done_shown_in_DMA=1;
        end
        else if((wbs_stb_i==1) && (wbs_cyc_i==1) && (wbs_we_i==0) && (wbs_adr_i[7:0]==8'h00)) begin
            next_MM_done_shown_in_DMA=0;
        end
        else begin
            next_MM_done_shown_in_DMA=MM_done_shown_in_DMA;
        end
    end

    always @* begin
        if((sm_tready==1) && (sm_tvalid==1)) begin
            next_output_buffer_valid=1;
        end
        else if((state_DMA_MM_request_SDRAM==DMA_MM_REQUEST_SDRAM_READ_OUTPUT_BUFFER) && (MM_busy==1) && (MM_in_valid==0)) begin
            next_output_buffer_valid=0;
        end
        else begin
            next_output_buffer_valid=output_buffer_valid;
        end
    end

    always @* begin
        if((state_DMA_MM_request_SDRAM==DMA_MM_REQUEST_SDRAM_WRITE_INPUT_BUFFER) && (MM_out_valid==1) && (input_number_counter_fine==2'd3)) begin
            next_input_buffer_valid=1;
        end
        else if((state_DMA_MM==DMA_MM_STREAM_IN) && (input_number_counter==2'd3) && ((ss_tready==1) && (ss_tvalid==1))) begin
            next_input_buffer_valid=0;
        end
        else begin
            next_input_buffer_valid=input_buffer_valid;
        end
    end

    // When input buffer is all empty or used, make a request to SDRAM
    always @* begin
        case(state_DMA_MM_request_SDRAM)
            DMA_MM_REQUEST_IDLE: begin
                MM_rw_before_FF=0;
                data_from_MM_before_FF=0;
                MM_prefetch_step_before_FF=0;

                next_input_buffer[0]=input_buffer[0];
                next_input_buffer[1]=input_buffer[1];
                next_input_buffer[2]=input_buffer[2];
                next_input_buffer[3]=input_buffer[3];
                next_input_number_counter_coarse=0;
                next_input_number_counter_fine=0;
                next_output_SDRAM_address_pointer_counter=0;
                next_output_delay_counter=0;

                if(MM_base_address_A_buffer==3721) begin // Maybe using the concept of buffer_valid signal would be better
                    next_state_DMA_MM_request_SDRAM=DMA_MM_REQUEST_IDLE;
                    MM_in_valid_before_FF=0;
                    MM_address_before_FF=0;
                end
                else begin
                    next_state_DMA_MM_request_SDRAM=DMA_MM_REQUEST_SDRAM_WRITE_INPUT_BUFFER;
                    MM_in_valid_before_FF=1;
                    MM_address_before_FF=MM_base_address_A_buffer;
                end
            end
            DMA_MM_REQUEST_SDRAM_WRITE_INPUT_BUFFER: begin
                MM_rw_before_FF=0;
                data_from_MM_before_FF=0;
                MM_prefetch_step_before_FF=MM_prefetch_step;
                next_output_SDRAM_address_pointer_counter=output_SDRAM_address_pointer_counter;
                next_output_delay_counter=0;

                if(MM_out_valid) begin
                    if(input_number_counter_fine==2'd3) begin
                        MM_in_valid_before_FF=0;
                        MM_address_before_FF=MM_address;
                        next_input_buffer[0]=input_buffer[0];
                        next_input_buffer[1]=input_buffer[1];
                        next_input_buffer[2]=input_buffer[2];
                        next_input_buffer[3]=data_to_MM;
                        next_input_number_counter_fine=input_number_counter_fine;

                        if(input_number_counter_coarse==3'd7) begin
                            next_state_DMA_MM_request_SDRAM=DMA_MM_NO_REQUEST; //DMA_MM_REQUEST_DONE;
                            next_input_number_counter_coarse=input_number_counter_coarse;
                        end
                        else begin
                            next_state_DMA_MM_request_SDRAM=DMA_MM_NO_REQUEST;
                            next_input_number_counter_coarse=input_number_counter_coarse+1;
                        end
                    end
                    else begin
                        next_state_DMA_MM_request_SDRAM=DMA_MM_REQUEST_SDRAM_WRITE_INPUT_BUFFER;
                        MM_in_valid_before_FF=1;
                        if((input_number_counter_coarse==3'd0) || (input_number_counter_coarse==3'd5) || (input_number_counter_coarse==3'd6) || (input_number_counter_coarse==3'd7)) begin // A_row
                            MM_address_before_FF=MM_address+4;
                        end
                        else begin // B_column
                            MM_address_before_FF=MM_address+16;
                        end
                        case(input_number_counter_fine)
                            2'd0: begin
                                next_input_buffer[0]=data_to_MM;
                                next_input_buffer[1]=input_buffer[1];
                                next_input_buffer[2]=input_buffer[2];
                                next_input_buffer[3]=input_buffer[3];
                            end
                            2'd1: begin
                                next_input_buffer[0]=input_buffer[0];
                                next_input_buffer[1]=data_to_MM;
                                next_input_buffer[2]=input_buffer[2];
                                next_input_buffer[3]=input_buffer[3];
                            end
                            2'd2: begin
                                next_input_buffer[0]=input_buffer[0];
                                next_input_buffer[1]=input_buffer[1];
                                next_input_buffer[2]=data_to_MM;
                                next_input_buffer[3]=input_buffer[3];
                            end
                            default: begin
                                next_input_buffer[0]=input_buffer[0];
                                next_input_buffer[1]=input_buffer[1];
                                next_input_buffer[2]=input_buffer[2];
                                next_input_buffer[3]=input_buffer[3];
                            end
                        endcase
                        next_input_number_counter_coarse=input_number_counter_coarse;
                        next_input_number_counter_fine=input_number_counter_fine+1;
                    end
                end
                else if(MM_busy) begin
                    next_state_DMA_MM_request_SDRAM=DMA_MM_REQUEST_SDRAM_WRITE_INPUT_BUFFER;
                    MM_in_valid_before_FF=MM_in_valid;
                    MM_address_before_FF=MM_address;
                    next_input_buffer[0]=input_buffer[0];
                    next_input_buffer[1]=input_buffer[1];
                    next_input_buffer[2]=input_buffer[2];
                    next_input_buffer[3]=input_buffer[3];
                    next_input_number_counter_coarse=input_number_counter_coarse;
                    next_input_number_counter_fine=input_number_counter_fine;
                end
                else begin
                    next_state_DMA_MM_request_SDRAM=DMA_MM_REQUEST_SDRAM_WRITE_INPUT_BUFFER;
                    MM_in_valid_before_FF=0;
                    MM_address_before_FF=MM_address;
                    next_input_buffer[0]=input_buffer[0];
                    next_input_buffer[1]=input_buffer[1];
                    next_input_buffer[2]=input_buffer[2];
                    next_input_buffer[3]=input_buffer[3];
                    next_input_number_counter_coarse=input_number_counter_coarse;
                    next_input_number_counter_fine=input_number_counter_fine;
                end
            end
            DMA_MM_REQUEST_SDRAM_READ_OUTPUT_BUFFER: begin
                MM_address_before_FF=MM_base_address_A_buffer+output_SDRAM_address_pointer_counter;
                data_from_MM_before_FF=output_buffer;
                MM_prefetch_step_before_FF=0;
                next_input_buffer[0]=input_buffer[0];
                next_input_buffer[1]=input_buffer[1];
                next_input_buffer[2]=input_buffer[2];
                next_input_buffer[3]=input_buffer[3];
                next_input_number_counter_coarse=input_number_counter_coarse;
                next_input_number_counter_fine=input_number_counter_fine;
                next_output_delay_counter=0;
                if(MM_busy) begin
                    if(MM_in_valid) begin
                        next_state_DMA_MM_request_SDRAM=DMA_MM_REQUEST_SDRAM_READ_OUTPUT_BUFFER;
                        MM_in_valid_before_FF=MM_in_valid;
                        MM_rw_before_FF=1;
                        next_output_SDRAM_address_pointer_counter=output_SDRAM_address_pointer_counter;
                    end
                    else begin
                        MM_in_valid_before_FF=0;
                        MM_rw_before_FF=0;

                        if(output_SDRAM_address_pointer_counter==23'd60) begin
                            next_state_DMA_MM_request_SDRAM=DMA_MM_REQUEST_DONE;
                            next_output_SDRAM_address_pointer_counter=output_SDRAM_address_pointer_counter;
                        end
                        else begin
                            next_state_DMA_MM_request_SDRAM=DMA_MM_REQUEST_SDRAM_READ_OUTPUT_BUFFER_WAIT;
                            next_output_SDRAM_address_pointer_counter=output_SDRAM_address_pointer_counter+4;
                        end
                    end
                end
                else begin
                    next_state_DMA_MM_request_SDRAM=DMA_MM_REQUEST_SDRAM_READ_OUTPUT_BUFFER;
                    MM_in_valid_before_FF=0;
                    MM_rw_before_FF=1;
                    next_output_SDRAM_address_pointer_counter=output_SDRAM_address_pointer_counter;
                end
            end
            DMA_MM_REQUEST_SDRAM_READ_OUTPUT_BUFFER_WAIT: begin
                MM_address_before_FF=MM_base_address_A_buffer+output_SDRAM_address_pointer_counter;
                data_from_MM_before_FF=output_buffer;
                MM_prefetch_step_before_FF=0;
                next_input_buffer[0]=input_buffer[0];
                next_input_buffer[1]=input_buffer[1];
                next_input_buffer[2]=input_buffer[2];
                next_input_buffer[3]=input_buffer[3];
                next_input_number_counter_coarse=input_number_counter_coarse;
                next_input_number_counter_fine=input_number_counter_fine;
                MM_in_valid_before_FF=0;
                MM_rw_before_FF=0;
                next_output_SDRAM_address_pointer_counter=output_SDRAM_address_pointer_counter;
                next_output_delay_counter=output_delay_counter+1;

                if(output_delay_counter==1) begin
                    next_state_DMA_MM_request_SDRAM=DMA_MM_NO_REQUEST;

                end
                else begin
                    next_state_DMA_MM_request_SDRAM=DMA_MM_REQUEST_SDRAM_READ_OUTPUT_BUFFER_WAIT;
                end

            end
            DMA_MM_NO_REQUEST: begin
                next_output_delay_counter=0;

                if(output_buffer_valid==1) begin
                    next_state_DMA_MM_request_SDRAM=DMA_MM_REQUEST_SDRAM_READ_OUTPUT_BUFFER;
                    MM_in_valid_before_FF=1;
                    MM_rw_before_FF=1;
                    MM_address_before_FF=MM_base_address_A_buffer+output_SDRAM_address_pointer_counter;
                    data_from_MM_before_FF=output_buffer;
                    MM_prefetch_step_before_FF=0;
                    next_input_buffer[0]=input_buffer[0];
                    next_input_buffer[1]=input_buffer[1];
                    next_input_buffer[2]=input_buffer[2];
                    next_input_buffer[3]=input_buffer[3];
                    next_input_number_counter_coarse=input_number_counter_coarse;
                    next_input_number_counter_fine=input_number_counter_fine;
                    next_output_SDRAM_address_pointer_counter=output_SDRAM_address_pointer_counter;
                end
                else if(input_buffer_valid==0) begin
                    next_state_DMA_MM_request_SDRAM=DMA_MM_REQUEST_SDRAM_WRITE_INPUT_BUFFER;
                    MM_in_valid_before_FF=1;
                    MM_rw_before_FF=0;
                    data_from_MM_before_FF=0;
                    next_input_buffer[0]=input_buffer[0];
                    next_input_buffer[1]=input_buffer[1];
                    next_input_buffer[2]=input_buffer[2];
                    next_input_buffer[3]=input_buffer[3];
                    next_input_number_counter_coarse=input_number_counter_coarse;
                    next_input_number_counter_fine=0;
                    next_output_SDRAM_address_pointer_counter=output_SDRAM_address_pointer_counter;
                    
                    case(input_number_counter_coarse)
                        3'd1: MM_address_before_FF=MM_base_address_B_buffer;
                        3'd2: MM_address_before_FF=MM_base_address_B_buffer+4;
                        3'd3: MM_address_before_FF=MM_base_address_B_buffer+8;
                        3'd4: MM_address_before_FF=MM_base_address_B_buffer+12;
                        3'd5: MM_address_before_FF=MM_base_address_A_buffer+16;
                        3'd6: MM_address_before_FF=MM_base_address_A_buffer+32;
                        3'd7: MM_address_before_FF=MM_base_address_A_buffer+48;
                        default: MM_address_before_FF=MM_base_address_A_buffer;
                    endcase

                    case(input_number_counter_coarse)
                        3'd1: MM_prefetch_step_before_FF=1;
                        3'd2: MM_prefetch_step_before_FF=1;
                        3'd3: MM_prefetch_step_before_FF=1;
                        3'd4: MM_prefetch_step_before_FF=1;
                        3'd5: MM_prefetch_step_before_FF=0;
                        3'd6: MM_prefetch_step_before_FF=0;
                        3'd7: MM_prefetch_step_before_FF=0;
                        default: MM_prefetch_step_before_FF=0;
                    endcase
                end
                else begin
                    next_state_DMA_MM_request_SDRAM=DMA_MM_NO_REQUEST;
                    MM_in_valid_before_FF=0;
                    MM_rw_before_FF=0;
                    MM_address_before_FF=MM_address;
                    data_from_MM_before_FF=0;
                    MM_prefetch_step_before_FF=MM_prefetch_step;
                    next_input_buffer[0]=input_buffer[0];
                    next_input_buffer[1]=input_buffer[1];
                    next_input_buffer[2]=input_buffer[2];
                    next_input_buffer[3]=input_buffer[3];
                    next_input_number_counter_coarse=input_number_counter_coarse;
                    next_input_number_counter_fine=input_number_counter_fine;
                    next_output_SDRAM_address_pointer_counter=output_SDRAM_address_pointer_counter;
                end
            end
            DMA_MM_REQUEST_DONE: begin
                next_state_DMA_MM_request_SDRAM=DMA_MM_REQUEST_DONE;
                MM_in_valid_before_FF=0;
                MM_rw_before_FF=0;
                MM_address_before_FF=MM_address;
                data_from_MM_before_FF=0;
                MM_prefetch_step_before_FF=0;
                next_input_buffer[0]=input_buffer[0];
                next_input_buffer[1]=input_buffer[1];
                next_input_buffer[2]=input_buffer[2];
                next_input_buffer[3]=input_buffer[3];
                next_input_number_counter_coarse=input_number_counter_coarse;
                next_input_number_counter_fine=input_number_counter_fine;
                next_output_SDRAM_address_pointer_counter=0;
                next_output_delay_counter=0;
            end
            default: begin
                next_state_DMA_MM_request_SDRAM=DMA_MM_REQUEST_IDLE;
                MM_in_valid_before_FF=0;
                MM_rw_before_FF=0;
                MM_address_before_FF=0;
                data_from_MM_before_FF=0;
                MM_prefetch_step_before_FF=0;

                next_input_buffer[0]=input_buffer[0];
                next_input_buffer[1]=input_buffer[1];
                next_input_buffer[2]=input_buffer[2];
                next_input_buffer[3]=input_buffer[3];
                next_input_number_counter_coarse=0;
                next_input_number_counter_fine=0;
                next_output_SDRAM_address_pointer_counter=0;
                next_output_delay_counter=0;

            end
        endcase
    end

    // DMA interacts with WB (in the upper level) and MM (in the downer level)
    always @* begin
        case(state_DMA_MM)
            DMA_MM_IDLE: begin
                mm_start=0;
                ss_tvalid=0;
                ss_tdata=0;
                sm_tready=0;
                next_input_number_counter=0;
                next_output_buffer=output_buffer;

                /*if((next_MM_base_address_A_buffer!=3721) && (next_MM_base_address_B_buffer!=3721)) begin 
                    next_state_DMA_MM=DMA_MM_BASE_ADDRESS;
                end
                else */
                if((wbs_stb_i==1) && (wbs_cyc_i==1) && (wbs_we_i==1) && (wbs_adr_i[7:0]==8'h04)) begin // that is, program base_address_A_buffer(0x30010004)
                    next_state_DMA_MM=DMA_MM_IDLE;
                    wbs_ack_o_before_FF=1;
                    wbs_dat_o_before_FF=0;
                    next_MM_base_address_A_buffer=wbs_dat_i[22:0];
                    next_MM_base_address_B_buffer=MM_base_address_B_buffer;

                end
                else if((wbs_stb_i==1) && (wbs_cyc_i==1) && (wbs_we_i==1) && (wbs_adr_i[7:0]==8'h08)) begin // that is, program base_address_B_buffer(0x30010008)
                    next_state_DMA_MM=DMA_MM_BASE_ADDRESS;
                    wbs_ack_o_before_FF=1;
                    wbs_dat_o_before_FF=0;
                    next_MM_base_address_A_buffer=MM_base_address_A_buffer;
                    next_MM_base_address_B_buffer=wbs_dat_i[22:0];
                    
                end
                else if((wbs_stb_i==1) && (wbs_cyc_i==1) && (wbs_we_i==0) && (wbs_adr_i[7:0]==8'h00)) begin // that is, read ap_register(0x30010000)
                    next_state_DMA_MM=DMA_MM_IDLE;
                    wbs_ack_o_before_FF=1;
                    wbs_dat_o_before_FF=32'b100; // {MM_done_shown_in_DMA,0,0,0,ap_idle, ap_done, ap_start} with MM_done_shown_in_DMA=0 at this time
                    next_MM_base_address_A_buffer=MM_base_address_A_buffer;
                    next_MM_base_address_B_buffer=MM_base_address_B_buffer;
                    
                end
                else begin
                    next_state_DMA_MM=DMA_MM_IDLE;
                    wbs_ack_o_before_FF=0;
                    wbs_dat_o_before_FF=0;
                    next_MM_base_address_A_buffer=MM_base_address_A_buffer;
                    next_MM_base_address_B_buffer=MM_base_address_B_buffer;
                end
            end
            DMA_MM_BASE_ADDRESS: begin
                ss_tvalid=0;
                ss_tdata=0;
                sm_tready=0;
                next_MM_base_address_A_buffer=MM_base_address_A_buffer;
                next_MM_base_address_B_buffer=MM_base_address_B_buffer;
                next_input_number_counter=0;
                next_output_buffer=output_buffer;

                if((wbs_stb_i==1) && (wbs_cyc_i==1) && (wbs_we_i==1) && (wbs_adr_i[7:0]==8'h00) && (wbs_dat_i==1)) begin // that is, program ap_start
                    next_state_DMA_MM=DMA_MM_DETECT_Yn_Xn;
                    wbs_ack_o_before_FF=1;
                    wbs_dat_o_before_FF=0;
                    mm_start=1;
                end
                else if((wbs_stb_i==1) && (wbs_cyc_i==1) && (wbs_we_i==0) && (wbs_adr_i[7:0]==8'h00)) begin // that is, read ap_register(0x30010000)
                    next_state_DMA_MM=DMA_MM_BASE_ADDRESS;
                    wbs_ack_o_before_FF=1;
                    wbs_dat_o_before_FF=32'b100; // {MM_done_shown_in_DMA,0,0,0,ap_idle, ap_done, ap_start} with MM_done_shown_in_DMA=0 at this time
                    mm_start=0;
                end
                else begin
                    next_state_DMA_MM=DMA_MM_BASE_ADDRESS;
                    wbs_ack_o_before_FF=0;
                    wbs_dat_o_before_FF=0;
                    mm_start=0;
                end
            end
            DMA_MM_DETECT_Yn_Xn: begin
                if((wbs_stb_i==1) && (wbs_cyc_i==1) && (wbs_we_i==0) && (wbs_adr_i[7:0]==8'h00)) begin // that is, read ap_register(0x30010000)
                    wbs_ack_o_before_FF=1;
                    wbs_dat_o_before_FF=32'd0; // {MM_done_shown_in_DMA,0,0,0,ap_idle, ap_done, ap_start} with MM_done_shown_in_DMA=0 at this time
                end
                else begin
                    wbs_ack_o_before_FF=0;
                    wbs_dat_o_before_FF=0;
                end
                mm_start=0;
                ss_tvalid=0;
                ss_tdata=0;
                sm_tready=0;
                next_MM_base_address_A_buffer=MM_base_address_A_buffer;
                next_MM_base_address_B_buffer=MM_base_address_B_buffer;
                next_input_number_counter=0;
                next_output_buffer=output_buffer;
                
                if((sm_tvalid==1) && (output_buffer_valid==0)) begin // Detect Y[n], making sure output_buffer data is empty / has been sent to SDRAM
                    next_state_DMA_MM=DMA_MM_STREAM_OUT;
                end
                else if(mm_done) begin // Detect done signal
                    next_state_DMA_MM=DMA_MM_DONE;
                end
                else if((ss_tready==1) && (input_buffer_valid==1)) begin // Detect X[n]
                    next_state_DMA_MM=DMA_MM_STREAM_IN;
                end
                else begin
                    next_state_DMA_MM=DMA_MM_DETECT_Yn_Xn;
                end
            end
            DMA_MM_STREAM_IN: begin
                if((wbs_stb_i==1) && (wbs_cyc_i==1) && (wbs_we_i==0) && (wbs_adr_i[7:0]==8'h00)) begin // that is, read ap_register(0x30010000)
                    wbs_ack_o_before_FF=1;
                    wbs_dat_o_before_FF=32'd0; // {MM_done_shown_in_DMA,0,0,0,ap_idle, ap_done, ap_start} with MM_done_shown_in_DMA=0 at this time
                end
                else begin
                    wbs_ack_o_before_FF=0;
                    wbs_dat_o_before_FF=0;
                end
                mm_start=0;
                ss_tvalid=1;
                case(input_number_counter)
                    2'd0: ss_tdata=input_buffer[0];
                    2'd1: ss_tdata=input_buffer[1];
                    2'd2: ss_tdata=input_buffer[2];
                    2'd3: ss_tdata=input_buffer[3];
                    default: ss_tdata=0;
                endcase
                sm_tready=0;
                next_MM_base_address_A_buffer=MM_base_address_A_buffer;
                next_MM_base_address_B_buffer=MM_base_address_B_buffer;
                next_output_buffer=output_buffer;

                if((ss_tready==1) && (ss_tvalid==1)) begin
                    if(input_number_counter==2'd3) begin
                        next_state_DMA_MM=DMA_MM_DETECT_Yn_Xn;
                        next_input_number_counter=0;
                    end
                    else begin
                        next_state_DMA_MM=DMA_MM_STREAM_IN;
                        next_input_number_counter=input_number_counter+1;
                    end
                end
                else begin
                    next_state_DMA_MM=DMA_MM_STREAM_IN;
                    next_input_number_counter=input_number_counter;
                end
            end
            DMA_MM_STREAM_OUT: begin
                /////if((sm_tready==1) && (sm_tvalid==1)) begin
                /////    next_state_DMA_MM=DMA_MM_DETECT_Yn_Xn;
                /////end
                /////else begin
                /////    next_state_DMA_MM=DMA_MM_STREAM_OUT;
                /////end
                next_state_DMA_MM=DMA_MM_DETECT_Yn_Xn;
                if((wbs_stb_i==1) && (wbs_cyc_i==1) && (wbs_we_i==0) && (wbs_adr_i[7:0]==8'h00)) begin // that is, read ap_register(0x30010000)
                    wbs_ack_o_before_FF=1;
                    wbs_dat_o_before_FF=32'd0; // {MM_done_shown_in_DMA,0,0,0,ap_idle, ap_done, ap_start} with MM_done_shown_in_DMA=0 at this time
                end
                else begin
                    wbs_ack_o_before_FF=0;
                    wbs_dat_o_before_FF=0;
                end
                mm_start=0;
                ss_tvalid=0;
                ss_tdata=0;
                sm_tready=1;
                next_MM_base_address_A_buffer=MM_base_address_A_buffer;
                next_MM_base_address_B_buffer=MM_base_address_B_buffer;
                next_input_number_counter=0;
                next_output_buffer = sm_tdata;
            end
            DMA_MM_DONE: begin // which means MM engine is done, but we still have to wait for all the output data to move to SDRAM, at that time, we can raise "MM_done_shown_in_DMA" signal to indicate finish 
                next_state_DMA_MM=DMA_MM_DONE;
                mm_start=0;
                ss_tvalid=0;
                ss_tdata=0;
                sm_tready=0;
                next_MM_base_address_A_buffer=MM_base_address_A_buffer;
                next_MM_base_address_B_buffer=MM_base_address_B_buffer;
                next_input_number_counter=0;
                next_output_buffer=output_buffer;

                if((wbs_stb_i==1) && (wbs_cyc_i==1) && (wbs_we_i==0) && (wbs_adr_i[7:0]==8'h00)) begin
                    wbs_ack_o_before_FF=0;
                    wbs_dat_o_before_FF={25'd0,MM_done_shown_in_DMA,6'b10}; // {MM_done_shown_in_DMA,0,0,0,ap_idle, ap_done, ap_start} with MM_done_shown_in_DMA=0 at this time; here it's better to reset ap_done to 0 after read.
                end
                else if((wbs_stb_i==1) && (wbs_cyc_i==1) && (wbs_we_i==0)) begin
                    wbs_ack_o_before_FF=1;
                    case(wbs_adr_i[7:0])
                        8'h0C: wbs_dat_o_before_FF=output_buffer[0];
                        8'h10: wbs_dat_o_before_FF=output_buffer[1];
                        8'h14: wbs_dat_o_before_FF=output_buffer[2];
                        8'h18: wbs_dat_o_before_FF=output_buffer[3];
                        8'h1C: wbs_dat_o_before_FF=output_buffer[4];
                        8'h20: wbs_dat_o_before_FF=output_buffer[5];
                        8'h24: wbs_dat_o_before_FF=output_buffer[6];
                        8'h28: wbs_dat_o_before_FF=output_buffer[7];
                        8'h2C: wbs_dat_o_before_FF=output_buffer[8];
                        8'h30: wbs_dat_o_before_FF=output_buffer[9];
                        8'h34: wbs_dat_o_before_FF=output_buffer[10];
                        8'h38: wbs_dat_o_before_FF=output_buffer[11];
                        8'h3C: wbs_dat_o_before_FF=output_buffer[12];
                        8'h40: wbs_dat_o_before_FF=output_buffer[13];
                        8'h44: wbs_dat_o_before_FF=output_buffer[14];
                        8'h48: wbs_dat_o_before_FF=output_buffer[15];
                        default: wbs_dat_o_before_FF=0;
                    endcase
                end
                else begin
                    wbs_ack_o_before_FF=0;
                    wbs_dat_o_before_FF=0;
                end

            end
            default: begin
                next_state_DMA_MM=DMA_MM_IDLE;
                wbs_ack_o_before_FF=0;
                wbs_dat_o_before_FF=0;
                
                mm_start=0;
                ss_tvalid=0;
                ss_tdata=0;
                sm_tready=0;

                next_MM_base_address_A_buffer=MM_base_address_A_buffer;
                next_MM_base_address_B_buffer=MM_base_address_B_buffer;
                next_input_number_counter=0;
                next_output_buffer=output_buffer;
            end
        endcase
    end



    always@(posedge wb_clk_i) begin
        if(wb_rst_i) begin // positive reset
            state_DMA_MM <= DMA_MM_IDLE;
            state_DMA_MM_request_SDRAM <= DMA_MM_REQUEST_IDLE;
            wbs_ack_o <= 0;
            wbs_dat_o <= 0;
            MM_address <= 0;
            MM_rw <= 0;
            data_from_MM <= 0;
            MM_in_valid <= 0;
            MM_prefetch_step <= 0;
            input_buffer[0] <= 0;
            input_buffer[1] <= 0;
            input_buffer[2] <= 0;
            input_buffer[3] <= 0;
            input_buffer_valid <= 0;
            MM_base_address_A_buffer <= 3721;
            MM_base_address_B_buffer <= 3721;
            input_number_counter_coarse <= 0;
            input_number_counter_fine <= 0;
            input_number_counter <= 0;
            output_buffer <= 0;
            MM_done_shown_in_DMA <= 0;
            output_buffer_valid <= 0;
            output_SDRAM_address_pointer_counter <= 0;
            output_delay_counter <= 0;
        end
        else begin
            state_DMA_MM <= next_state_DMA_MM;
            state_DMA_MM_request_SDRAM <= next_state_DMA_MM_request_SDRAM;
            wbs_ack_o <= wbs_ack_o_before_FF;
            wbs_dat_o <= wbs_dat_o_before_FF;
            MM_address <= MM_address_before_FF;
            MM_rw <= MM_rw_before_FF;
            data_from_MM <= data_from_MM_before_FF;
            MM_in_valid <= MM_in_valid_before_FF;
            MM_prefetch_step <= MM_prefetch_step_before_FF;
            input_buffer[0] <= next_input_buffer[0];
            input_buffer[1] <= next_input_buffer[1];
            input_buffer[2] <= next_input_buffer[2];
            input_buffer[3] <= next_input_buffer[3];
            input_buffer_valid <= next_input_buffer_valid;
            MM_base_address_A_buffer <= next_MM_base_address_A_buffer;
            MM_base_address_B_buffer <= next_MM_base_address_B_buffer;
            input_number_counter_coarse <= next_input_number_counter_coarse;
            input_number_counter_fine <= next_input_number_counter_fine;
            input_number_counter <= next_input_number_counter;
            output_buffer <= next_output_buffer;
            MM_done_shown_in_DMA <= next_MM_done_shown_in_DMA;
            output_buffer_valid <= next_output_buffer_valid;
            output_SDRAM_address_pointer_counter <= next_output_SDRAM_address_pointer_counter;
            output_delay_counter <= next_output_delay_counter;
        end
    end
    
    reg mm_start;
    wire mm_done;
    reg ss_tvalid;
    reg signed [(pDATA_WIDTH-1) : 0] ss_tdata;
    wire ss_tready;
    reg sm_tready;
    wire sm_tvalid;
    wire signed [(pDATA_WIDTH-1) : 0] sm_tdata;
    
    mm mm_U0 (

        .axis_clk(wb_clk_i),
        .axis_rst_n(~wb_rst_i),

        .mm_start_whole(mm_start),
        .mm_done_whole(mm_done),

        .ss_tvalid(ss_tvalid),
        .ss_tdata(ss_tdata),
        .ss_tready(ss_tready),

        .sm_tready(sm_tready),
        .sm_tvalid(sm_tvalid),
        .sm_tdata(sm_tdata)

    );

endmodule