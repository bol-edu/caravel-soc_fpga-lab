module DMA_FIR 
#(  parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32,
    parameter DATA_LENGTH=64
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

    // SDRAM request FIR (controller interface)
    output reg  [22:0] FIR_address,
    output reg  FIR_rw, // 1 = write, 0 = read
    output reg  [31:0] data_from_FIR,
    input  [31:0] data_to_FIR,
    input  FIR_busy,
    output reg  FIR_in_valid,
    input  FIR_out_valid,
    output reg  FIR_prefetch_step
);

    ///////////////////////////////////////// (For test) /////////////////////////////////////////
    //wire test1;
    ///wire [31:0] output_buffer0;
    ///wire [31:0] output_buffer1;
    ///wire [31:0] output_buffer2;
    ///wire [31:0] output_buffer3;
    ///wire [31:0] output_buffer4;
    ///wire [31:0] output_buffer5;
    ///wire [31:0] output_buffer6;
    ///wire [31:0] output_buffer7;
    ///wire [31:0] output_buffer8;
    ///wire [31:0] output_buffer9;
    ///wire [31:0] output_buffer10;
    ///
    ///assign output_buffer0=output_buffer[0];
    ///assign output_buffer1=output_buffer[1];
    ///assign output_buffer2=output_buffer[2];
    ///assign output_buffer3=output_buffer[3];
    ///assign output_buffer4=output_buffer[4];
    ///assign output_buffer5=output_buffer[5];
    ///assign output_buffer6=output_buffer[6];
    ///assign output_buffer7=output_buffer[7];
    ///assign output_buffer8=output_buffer[8];
    ///assign output_buffer9=output_buffer[9];
    ///assign output_buffer10=output_buffer[10];


    //assign test1=(wbs_adr_i[7:0]==8'h88);
    //////////////////////////////////////////////////////////////////////////////////////////////
    
    localparam DMA_FIR_IDLE = 3'd0, DMA_FIR_BASE_ADDRESS = 3'd1, DMA_FIR_DETECT_Yn_Xn = 3'd2, DMA_FIR_STREAM_IN = 3'd3, DMA_FIR_STREAM_OUT = 3'd4,/* DMA_FIR_WAIT_FOR_AP_DONE = 3'd2,*/ DMA_FIR_DONE = 3'd5;
    localparam DMA_FIR_REQUEST_IDLE = 3'd0, DMA_FIR_REQUEST_SDRAM_WRITE_INPUT_BUFFER = 3'd1, DMA_FIR_REQUEST_SDRAM_READ_OUTPUT_BUFFER = 3'd2, DMA_FIR_NO_REQUEST = 3'd3, DMA_FIR_REQUEST_DONE = 3'd4;
    
    reg wbs_ack_o_before_FF;
    reg [31:0] wbs_dat_o_before_FF;

    reg [22:0] FIR_address_before_FF;
    reg FIR_rw_before_FF;
    reg [31:0] data_from_FIR_before_FF;
    reg FIR_in_valid_before_FF;
    reg FIR_prefetch_step_before_FF;
    
    reg [2:0] state_DMA_FIR;
    reg [2:0] next_state_DMA_FIR;
    reg [2:0] state_DMA_FIR_request_SDRAM;
    reg [2:0] next_state_DMA_FIR_request_SDRAM;

    reg [31:0] input_buffer; // To buffer 1 data
    reg [31:0] next_input_buffer;
    reg input_buffer_valid;
    reg next_input_buffer_valid;
    ///reg [31:0] output_buffer [0:10]; // To buffer 11 data, because in software fir.h, N is set to 11
    ///reg [31:0] next_output_buffer [0:10];
    reg [31:0] output_buffer;
    reg [31:0] next_output_buffer;
    reg output_buffer_valid;
    reg next_output_buffer_valid;
    reg [22:0] output_SDRAM_address_pointer_counter;
    reg [22:0] next_output_SDRAM_address_pointer_counter;
    reg [22:0] input_SDRAM_address_pointer_counter;
    reg [22:0] next_input_SDRAM_address_pointer_counter;

    // We use input_buffer as input buffer, and output_y_buffer as output buffer
    // thus Yn_valid_Xn_ready[1] means output_buffer_valid, and Yn_valid_Xn_ready[0] means "~input_buffer_valid"
    always @* begin
        Yn_valid_Xn_ready[0] = (~input_buffer_valid);
    ///    output_buffer_valid = Yn_valid_Xn_ready[1];
    ///    input_x_buffer = input_buffer;
    ///    output_buffer = output_y_buffer;
        Yn_valid_Xn_ready[1] = output_buffer_valid;
    end

    reg [22:0] FIR_base_address_buffer; // Be caution of its bit number !! (Because it is with controller protocol)
    reg [22:0] next_FIR_base_address_buffer;

    reg [6:0] input_number_counter;
    reg [6:0] next_input_number_counter;
    
    reg wbs_stb_DMA_to_FIR;
    reg wbs_cyc_DMA_to_FIR;
    reg wbs_we_DMA_to_FIR;
    reg [3:0] wbs_sel_DMA_to_FIR;
    reg [31:0] input_data_DMA_to_FIR;
    reg [31:0] input_address_DMA_to_FIR;
    reg wbs_ack_FIR_to_DMA;
    reg [31:0] output_data_FIR_to_DMA;

    reg FIR_done_shown_in_DMA;
    reg next_FIR_done_shown_in_DMA;

    integer i;

    always @* begin
        if((state_DMA_FIR==DMA_FIR_DONE) && (output_buffer_valid==0)) begin
            next_FIR_done_shown_in_DMA=1;
        end
        else if((wbs_stb_i==1) && (wbs_cyc_i==1) && (wbs_we_i==0) && (wbs_adr_i[7:0]==8'h00)) begin
            next_FIR_done_shown_in_DMA=0;
        end
        else begin
            next_FIR_done_shown_in_DMA=FIR_done_shown_in_DMA;
        end
    end

    always @* begin
        if((sm_tready==1) && (sm_tvalid==1)) begin
            next_output_buffer_valid=1;
        end
        else if((state_DMA_FIR_request_SDRAM==DMA_FIR_REQUEST_SDRAM_READ_OUTPUT_BUFFER) && (FIR_busy==1)/* && (FIR_in_valid==0)*/) begin
            next_output_buffer_valid=0;
        end
        else begin
            next_output_buffer_valid=output_buffer_valid;
        end
    end

    always @* begin
        if((state_DMA_FIR_request_SDRAM==DMA_FIR_REQUEST_SDRAM_WRITE_INPUT_BUFFER) && (FIR_out_valid==1)) begin
            next_input_buffer_valid=1;
        end
        ///else if((state_DMA_FIR==DMA_FIR_STREAM_IN) && (wbs_ack_FIR_to_DMA==1)) begin
        else if((state_DMA_FIR==DMA_FIR_STREAM_IN) && ((ss_tready==1) && (ss_tvalid==1))) begin
            next_input_buffer_valid=0;
        end
        else begin
            next_input_buffer_valid=input_buffer_valid;
        end
    end

    // When input buffer is empty or used, make a request to SDRAM. / When output buffer is valid, send it to SDRAM
    always @* begin
        case(state_DMA_FIR_request_SDRAM)
            DMA_FIR_REQUEST_IDLE: begin
                FIR_rw_before_FF=0;
                data_from_FIR_before_FF=0;
                next_input_buffer=input_buffer;
                //next_input_buffer_valid=input_buffer_valid;
                next_input_number_counter=0;
                next_output_SDRAM_address_pointer_counter=0;
                next_input_SDRAM_address_pointer_counter=0;

                if(FIR_base_address_buffer==3721) begin // Maybe using the concept of buffer_valid signal would be better
                    next_state_DMA_FIR_request_SDRAM=DMA_FIR_REQUEST_IDLE;
                    FIR_in_valid_before_FF=0;
                    FIR_address_before_FF=0;
                end
                else begin
                    next_state_DMA_FIR_request_SDRAM=DMA_FIR_REQUEST_SDRAM_WRITE_INPUT_BUFFER;
                    FIR_in_valid_before_FF=1;
                    FIR_address_before_FF=FIR_base_address_buffer;
                end
            end
            DMA_FIR_REQUEST_SDRAM_WRITE_INPUT_BUFFER: begin
                FIR_rw_before_FF=0;
                data_from_FIR_before_FF=0;
                next_output_SDRAM_address_pointer_counter=output_SDRAM_address_pointer_counter;

                //next_input_buffer_valid=

                if(FIR_out_valid) begin
                    if(input_number_counter==7'd63) begin
                        next_state_DMA_FIR_request_SDRAM=DMA_FIR_NO_REQUEST; //DMA_FIR_REQUEST_DONE;
                        FIR_in_valid_before_FF=0;
                        FIR_address_before_FF=FIR_address;
                        next_input_SDRAM_address_pointer_counter=input_SDRAM_address_pointer_counter;
                        next_input_buffer=data_to_FIR;
                        //next_input_number_counter=6'd63;
                        next_input_number_counter=input_number_counter;
                    end
                    else begin
                        next_state_DMA_FIR_request_SDRAM=DMA_FIR_NO_REQUEST;
                        FIR_in_valid_before_FF=0;
                        FIR_address_before_FF=FIR_address + 4;
                        next_input_SDRAM_address_pointer_counter=input_SDRAM_address_pointer_counter+4;
                        next_input_buffer=data_to_FIR;
                        next_input_number_counter=input_number_counter+1;
                    end
                end
                else if(FIR_busy) begin
                    next_state_DMA_FIR_request_SDRAM=DMA_FIR_REQUEST_SDRAM_WRITE_INPUT_BUFFER;
                    FIR_in_valid_before_FF=0;
                    FIR_address_before_FF=FIR_address;
                    next_input_SDRAM_address_pointer_counter=input_SDRAM_address_pointer_counter;
                    next_input_buffer=input_buffer;
                    next_input_number_counter=input_number_counter;
                end
                else begin
                    next_state_DMA_FIR_request_SDRAM=DMA_FIR_REQUEST_SDRAM_WRITE_INPUT_BUFFER;
                    FIR_in_valid_before_FF=FIR_in_valid;
                    FIR_address_before_FF=FIR_address;
                    next_input_SDRAM_address_pointer_counter=input_SDRAM_address_pointer_counter;
                    next_input_buffer=input_buffer;
                    next_input_number_counter=input_number_counter;
                end
            end
            DMA_FIR_REQUEST_SDRAM_READ_OUTPUT_BUFFER: begin
                FIR_address_before_FF=FIR_base_address_buffer+output_SDRAM_address_pointer_counter;
                data_from_FIR_before_FF=output_buffer;
                next_input_buffer=input_buffer;
                next_input_number_counter=input_number_counter;
                next_input_SDRAM_address_pointer_counter=input_SDRAM_address_pointer_counter;
                if(FIR_busy) begin
                    FIR_in_valid_before_FF=0;
                    FIR_rw_before_FF=0;
                    if(output_SDRAM_address_pointer_counter==23'd252) begin // = 4*(64-1)
                        next_state_DMA_FIR_request_SDRAM=DMA_FIR_REQUEST_DONE;
                        next_output_SDRAM_address_pointer_counter=output_SDRAM_address_pointer_counter;
                    end
                    else begin
                        next_state_DMA_FIR_request_SDRAM=DMA_FIR_NO_REQUEST;
                        next_output_SDRAM_address_pointer_counter=output_SDRAM_address_pointer_counter+4;
                    end
                end
                else begin
                    next_state_DMA_FIR_request_SDRAM=DMA_FIR_REQUEST_SDRAM_READ_OUTPUT_BUFFER;
                    FIR_in_valid_before_FF=FIR_in_valid;
                    FIR_rw_before_FF=1;
                    next_output_SDRAM_address_pointer_counter=output_SDRAM_address_pointer_counter;
                end
            end
            DMA_FIR_NO_REQUEST: begin
                //next_input_buffer_valid=input_buffer_valid;
                next_input_SDRAM_address_pointer_counter=input_SDRAM_address_pointer_counter;
                if(output_buffer_valid==1) begin
                    next_state_DMA_FIR_request_SDRAM=DMA_FIR_REQUEST_SDRAM_READ_OUTPUT_BUFFER;
                    FIR_in_valid_before_FF=1;
                    FIR_rw_before_FF=1;
                    FIR_address_before_FF=FIR_base_address_buffer+output_SDRAM_address_pointer_counter;
                    data_from_FIR_before_FF=output_buffer;
                    next_input_buffer=input_buffer;
                    next_input_number_counter=input_number_counter;
                    next_output_SDRAM_address_pointer_counter=output_SDRAM_address_pointer_counter;
                end
                else if(input_buffer_valid==0) begin
                    next_state_DMA_FIR_request_SDRAM=DMA_FIR_REQUEST_SDRAM_WRITE_INPUT_BUFFER;
                    FIR_in_valid_before_FF=1;
                    FIR_rw_before_FF=0;
                    //FIR_address_before_FF=FIR_address;
                    FIR_address_before_FF=FIR_base_address_buffer+input_SDRAM_address_pointer_counter;
                    data_from_FIR_before_FF=0;
                    next_input_buffer=input_buffer;
                    next_input_number_counter=input_number_counter;
                    next_output_SDRAM_address_pointer_counter=output_SDRAM_address_pointer_counter;
                end
                else begin
                    next_state_DMA_FIR_request_SDRAM=DMA_FIR_NO_REQUEST;
                    FIR_in_valid_before_FF=0;
                    FIR_rw_before_FF=0;
                    FIR_address_before_FF=FIR_address;
                    data_from_FIR_before_FF=0;
                    next_input_buffer=input_buffer;
                    next_input_number_counter=input_number_counter;
                    next_output_SDRAM_address_pointer_counter=output_SDRAM_address_pointer_counter;
                end
            end
            DMA_FIR_REQUEST_DONE: begin
                next_state_DMA_FIR_request_SDRAM=DMA_FIR_REQUEST_DONE;
                FIR_in_valid_before_FF=0;
                FIR_rw_before_FF=0;
                FIR_address_before_FF=FIR_address;
                next_input_SDRAM_address_pointer_counter=0;
                data_from_FIR_before_FF=0;
                next_input_buffer=input_buffer;
                next_input_number_counter=input_number_counter;
                next_output_SDRAM_address_pointer_counter=0;
            end
            default: begin
                next_state_DMA_FIR_request_SDRAM=DMA_FIR_REQUEST_IDLE;
                FIR_in_valid_before_FF=0;
                FIR_rw_before_FF=0;
                FIR_address_before_FF=0;
                data_from_FIR_before_FF=0;

                next_input_buffer=input_buffer;
                //next_input_buffer_valid=input_buffer_valid;
                next_input_number_counter=0;
                next_output_SDRAM_address_pointer_counter=0;
                next_input_SDRAM_address_pointer_counter=0;
            end
        endcase
        
    end

    // DMA interacts with WB (in the upper level) and WB_to_AXI (in the downer level) <-- We have modified this to become WB_to_AXI function merged into DMA_FIR after Q&A session
    always @* begin
        FIR_prefetch_step_before_FF=0;
        wbs_stb_DMA_to_FIR=wbs_stb_i; // In AXI-Lite part (in below), we have a firewall to filter out WB requests with "wbs_adr_i > 0x7F," and thus we do NOT need to filter them out here.
        wbs_cyc_DMA_to_FIR=wbs_cyc_i;
        wbs_we_DMA_to_FIR=wbs_we_i;
        wbs_sel_DMA_to_FIR=wbs_sel_i;
        input_data_DMA_to_FIR=wbs_dat_i;
        input_address_DMA_to_FIR=wbs_adr_i;

        case(state_DMA_FIR)
            DMA_FIR_IDLE: begin
                ///wbs_cyc_DMA_to_FIR=wbs_cyc_i;
                ///wbs_we_DMA_to_FIR=wbs_we_i;
                ///wbs_sel_DMA_to_FIR=wbs_sel_i;
                ///input_data_DMA_to_FIR=wbs_dat_i;
                ///input_address_DMA_to_FIR=wbs_adr_i;
                ss_tvalid=0;
                ss_tdata=0;
                ss_tlast=0;
                sm_tready=0;
                next_output_buffer = output_buffer;

                if((wbs_stb_i==1) && (wbs_cyc_i==1) && (wbs_we_i==1) && (wbs_adr_i[7:0]==8'h88)) begin // that is, program base_address_buffer(0x30000088)
                    next_state_DMA_FIR=DMA_FIR_BASE_ADDRESS;
                    wbs_ack_o_before_FF=1;
                    wbs_dat_o_before_FF=0;
                    ///wbs_stb_DMA_to_FIR=0;
                    next_FIR_base_address_buffer=wbs_dat_i[22:0];
                end
                // Because FIR_done_shown_in_DMA=0 at this time, we don't need this conditional statement
                /*else if((wbs_stb_i==1) && (wbs_cyc_i==1) && (wbs_we_i==0) && (wbs_adr_i[7:0]==8'h00)) begin // that is, read ap_register(0x30000000)
                end*/
                else begin
                    next_state_DMA_FIR=DMA_FIR_IDLE;
                    wbs_ack_o_before_FF=wbs_ack_FIR_to_DMA;
                    wbs_dat_o_before_FF=output_data_FIR_to_DMA;
                    ///wbs_stb_DMA_to_FIR=wbs_stb_i;
                    next_FIR_base_address_buffer=FIR_base_address_buffer;
                end
            end
            DMA_FIR_BASE_ADDRESS: begin
                ///wbs_stb_DMA_to_FIR=wbs_stb_i;
                ///wbs_cyc_DMA_to_FIR=wbs_cyc_i;
                ///wbs_we_DMA_to_FIR=wbs_we_i;
                ///wbs_sel_DMA_to_FIR=wbs_sel_i;
                ///input_data_DMA_to_FIR=wbs_dat_i;
                ///input_address_DMA_to_FIR=wbs_adr_i;
                ss_tvalid=0;
                ss_tdata=0;
                ss_tlast=0;
                sm_tready=0;
                next_FIR_base_address_buffer=FIR_base_address_buffer;
                next_output_buffer = output_buffer;

                if((wbs_stb_i==1) && (wbs_cyc_i==1) && (wbs_we_i==1) && (wbs_adr_i[7:0]==8'h00) && (wbs_dat_i==1) && (wbs_ack_FIR_to_DMA==1)) begin // that is, program ap_start
                    //next_state_DMA_FIR=DMA_FIR_WAIT_FOR_AP_DONE;
                    next_state_DMA_FIR=DMA_FIR_DETECT_Yn_Xn;
                    wbs_ack_o_before_FF=1;
                    wbs_dat_o_before_FF=0;
                end
                // Because FIR_done_shown_in_DMA=0 at this time, we don't need this conditional statement
                /*else if((wbs_stb_i==1) && (wbs_cyc_i==1) && (wbs_we_i==0) && (wbs_adr_i[7:0]==8'h00)) begin // that is, read ap_register(0x30000000)
                end*/
                else begin
                    next_state_DMA_FIR=DMA_FIR_BASE_ADDRESS;
                    wbs_ack_o_before_FF=wbs_ack_FIR_to_DMA;
                    wbs_dat_o_before_FF=output_data_FIR_to_DMA;
                end
            end
            // We do NOT need this part after we integrate WB_to_AXI module into DMA_FIR, because it is done in WB_to_AXI module <-- No, after re-thinking, we think we can integrate AXI-Stream ss/sm part here, and leave AXI-Lite below
            DMA_FIR_DETECT_Yn_Xn: begin
                if((wbs_stb_i==1) && (wbs_cyc_i==1) && (wbs_we_i==0) && (wbs_adr_i[7:0]==8'h00)/* && (wbs_ack_FIR_to_DMA==1)*/) begin // that is, read ap_register(0x30000000)
                    wbs_ack_o_before_FF=wbs_ack_FIR_to_DMA;
                    wbs_dat_o_before_FF={25'd0,FIR_done_shown_in_DMA,output_data_FIR_to_DMA[5:0]}; //32'd0; // that is, {25'd0,FIR_done_shown_in_DMA,6'd0} with FIR_done_shown_in_DMA=0
                end
                else begin
                    wbs_ack_o_before_FF=wbs_ack_FIR_to_DMA;
                    wbs_dat_o_before_FF=output_data_FIR_to_DMA;
                end

                ///wbs_stb_DMA_to_FIR=1;
                ///wbs_cyc_DMA_to_FIR=1;
                ///wbs_we_DMA_to_FIR=0;
                ///wbs_sel_DMA_to_FIR=4'b1111;
                ///input_data_DMA_to_FIR=0;
                ///input_address_DMA_to_FIR=32'h30000000;
                ss_tvalid=0;
                ss_tdata=0;
                ss_tlast=0;
                sm_tready=0;
                next_FIR_base_address_buffer=FIR_base_address_buffer;
                next_output_buffer = output_buffer;

                ///if((wbs_ack_FIR_to_DMA==1) && (output_data_FIR_to_DMA[5]==1)) begin  // output_data_FIR_to_DMA[5] means Yn_valid
                ///    next_state_DMA_FIR=DMA_FIR_STREAM_OUT;
                ///end
                /////else if((wbs_ack_FIR_to_DMA==1) && (output_data_FIR_to_DMA[1]==1)) begin  // output_data_FIR_to_DMA[1] means ap_done
                ///else if((wbs_ack_FIR_to_DMA==1) && (output_data_FIR_to_DMA[2]==1)) begin  // output_data_FIR_to_DMA[2] means ap_idle
                ///    next_state_DMA_FIR=DMA_FIR_DONE;
                ///end
                ///else if((wbs_ack_FIR_to_DMA==1) && (output_data_FIR_to_DMA[4]==1) && (input_buffer_valid==1)) begin  // output_data_FIR_to_DMA[4] means Xn_ready
                ///    next_state_DMA_FIR=DMA_FIR_STREAM_IN;
                ///end
                ///else begin
                ///    next_state_DMA_FIR=DMA_FIR_DETECT_Yn_Xn;
                ///end

                // We use Yn_valid and Xn_ready signals directly to improve the speed performance.
                //if(Yn_valid_Xn_ready[1]==1) begin  // means Yn_valid
                //    next_state_DMA_FIR=DMA_FIR_STREAM_OUT;
                //    
                //end
                //else if((wbs_ack_FIR_to_DMA==1) && (output_data_FIR_to_DMA[2]==1)) begin  // output_data_FIR_to_DMA[2] means ap_idle
                //    next_state_DMA_FIR=DMA_FIR_DONE;
                //end
                //else if((Yn_valid_Xn_ready[0]==1) && (input_buffer_valid==1)) begin  // means Xn_ready
                //    next_state_DMA_FIR=DMA_FIR_STREAM_IN;
                //end
                //else begin
                //    next_state_DMA_FIR=DMA_FIR_DETECT_Yn_Xn;
                //end
                if((sm_tvalid==1) && (output_buffer_valid==0)) begin // Detect Y[n], making sure output_buffer data is empty / has been sent to SDRAM
                    next_state_DMA_FIR=DMA_FIR_STREAM_OUT;
                end
                else if((ss_tready==1) && (input_buffer_valid==1)) begin // Detect X[n]
                    next_state_DMA_FIR=DMA_FIR_STREAM_IN;
                end
                else begin
                    next_state_DMA_FIR=DMA_FIR_DETECT_Yn_Xn;
                end


            end
            DMA_FIR_STREAM_IN: begin
                if((wbs_stb_i==1) && (wbs_cyc_i==1) && (wbs_we_i==0) && (wbs_adr_i[7:0]==8'h00)/* && (wbs_ack_FIR_to_DMA==1)*/) begin // that is, read ap_register(0x30000000)
                    wbs_ack_o_before_FF=wbs_ack_FIR_to_DMA;
                    wbs_dat_o_before_FF={25'd0,FIR_done_shown_in_DMA,output_data_FIR_to_DMA[5:0]}; //32'd0; // that is, {25'd0,FIR_done_shown_in_DMA,6'd0} with FIR_done_shown_in_DMA=0
                end
                else begin
                    wbs_ack_o_before_FF=wbs_ack_FIR_to_DMA;
                    wbs_dat_o_before_FF=output_data_FIR_to_DMA;
                end

                ///wbs_stb_DMA_to_FIR=1;
                ///wbs_cyc_DMA_to_FIR=1;
                ///wbs_we_DMA_to_FIR=1;
                ///wbs_sel_DMA_to_FIR=4'b1111;
                ///input_data_DMA_to_FIR=input_buffer;
                ///input_address_DMA_to_FIR=32'h30000080;
                ss_tvalid=1;
                ss_tdata=input_buffer;
                if(input_number_counter==7'd64) begin
                    ss_tlast=1;
                end
                else begin
                    ss_tlast=0;
                end
                sm_tready=0;
                next_FIR_base_address_buffer=FIR_base_address_buffer;
                next_output_buffer = output_buffer;

                if((ss_tready==1) && (ss_tvalid==1)) begin
                    next_state_DMA_FIR=DMA_FIR_DETECT_Yn_Xn;
                end
                else begin
                    next_state_DMA_FIR=DMA_FIR_STREAM_IN;
                end
            end
            DMA_FIR_STREAM_OUT: begin
                if((wbs_stb_i==1) && (wbs_cyc_i==1) && (wbs_we_i==0) && (wbs_adr_i[7:0]==8'h00)/* && (wbs_ack_FIR_to_DMA==1)*/) begin // that is, read ap_register(0x30000000)
                    wbs_ack_o_before_FF=wbs_ack_FIR_to_DMA;
                    wbs_dat_o_before_FF={25'd0,FIR_done_shown_in_DMA,output_data_FIR_to_DMA[5:0]}; //32'd0; // that is, {25'd0,FIR_done_shown_in_DMA,6'd0} with FIR_done_shown_in_DMA=0
                end
                else begin
                    wbs_ack_o_before_FF=wbs_ack_FIR_to_DMA;
                    wbs_dat_o_before_FF=output_data_FIR_to_DMA;
                end

                ///wbs_stb_DMA_to_FIR=1;
                ///wbs_cyc_DMA_to_FIR=1;
                ///wbs_we_DMA_to_FIR=0;
                ///wbs_sel_DMA_to_FIR=4'b1111;
                ///input_data_DMA_to_FIR=0;
                ///input_address_DMA_to_FIR=32'h30000084;
                ss_tvalid=0;
                ss_tdata=0;
                ss_tlast=0;
                sm_tready=1;
                next_FIR_base_address_buffer=FIR_base_address_buffer;
                next_output_buffer = sm_tdata;

                //if((sm_tready==1) && (sm_tvalid==1)) begin <-- We do NOT need this conditional statement because we need to have "sm_tvalid=1" to go into this state, and in this state we have "sm_tready=1"
                if(sm_tlast) begin
                    next_state_DMA_FIR=DMA_FIR_DONE;
                end
                else begin
                    next_state_DMA_FIR=DMA_FIR_DETECT_Yn_Xn;
                end
            end
            // Remember to add a data-movement state here !! <-- Actually we do NOT need this state because this function has been done in "AXI Stream (sm) for y[n]" part
            /*DMA_FIR_OUTPIT_DATA_MOVEMENT: begin
            end*/
            /*DMA_FIR_WAIT_FOR_AP_DONE: begin // Here we use sm_tlast signal to indicate ap_done (they are almost at the same time)  
            end*/
            DMA_FIR_DONE: begin // which means FIR engine is done, but we still have to wait for all the output data to move to SDRAM, at that time, we can raise "FIR_done_shown_in_DMA" signal to indicate finish
                next_state_DMA_FIR=DMA_FIR_DONE;
                //next_state_DMA_FIR=DMA_FIR_BASE_ADDRESS; // to wait the second round
                ///wbs_cyc_DMA_to_FIR=wbs_cyc_i;
                ///wbs_we_DMA_to_FIR=wbs_we_i;
                ///wbs_sel_DMA_to_FIR=wbs_sel_i;
                ///input_data_DMA_to_FIR=wbs_dat_i;
                ///input_address_DMA_to_FIR=wbs_adr_i;
                ss_tvalid=0;
                ss_tdata=0;
                ss_tlast=0;
                sm_tready=0;
                next_FIR_base_address_buffer=FIR_base_address_buffer;
                next_output_buffer = output_buffer;

                if((wbs_stb_i==1) && (wbs_cyc_i==1) && (wbs_we_i==0) && (wbs_adr_i[7:0]==8'h00)) begin
                    wbs_ack_o_before_FF=wbs_ack_FIR_to_DMA;
                    wbs_dat_o_before_FF={25'd0,FIR_done_shown_in_DMA,output_data_FIR_to_DMA[5:0]};
                    ///wbs_stb_DMA_to_FIR=wbs_stb_i;
                end
                //else if((wbs_stb_i==1) && (wbs_cyc_i==1) && (wbs_we_i==0)) begin
                //    wbs_ack_o_before_FF=1;
                //    ///wbs_stb_DMA_to_FIR=0;
                //    case(wbs_adr_i[7:0])
                //        8'h8C: wbs_dat_o_before_FF=output_buffer[0];
                //        8'h90: wbs_dat_o_before_FF=output_buffer[1];
                //        8'h94: wbs_dat_o_before_FF=output_buffer[2];
                //        8'h98: wbs_dat_o_before_FF=output_buffer[3];
                //        8'h9C: wbs_dat_o_before_FF=output_buffer[4];
                //        8'hA0: wbs_dat_o_before_FF=output_buffer[5];
                //        8'hA4: wbs_dat_o_before_FF=output_buffer[6];
                //        8'hA8: wbs_dat_o_before_FF=output_buffer[7];
                //        8'hAC: wbs_dat_o_before_FF=output_buffer[8];
                //        8'hB0: wbs_dat_o_before_FF=output_buffer[9];
                //        8'hB4: wbs_dat_o_before_FF=output_buffer[10];
                //        default: wbs_dat_o_before_FF=0;
                //    endcase
                //end
                else begin
                    wbs_ack_o_before_FF=wbs_ack_FIR_to_DMA;
                    wbs_dat_o_before_FF=output_data_FIR_to_DMA;
                    ///wbs_stb_DMA_to_FIR=0;
                end
            end
            default: begin
                next_state_DMA_FIR=DMA_FIR_IDLE;
                wbs_ack_o_before_FF=0;
                wbs_dat_o_before_FF=0;
                

                ///wbs_stb_DMA_to_FIR=wbs_stb_i;
                ///wbs_cyc_DMA_to_FIR=wbs_cyc_i;
                ///wbs_we_DMA_to_FIR=wbs_we_i;
                ///wbs_sel_DMA_to_FIR=wbs_sel_i;
                ///input_data_DMA_to_FIR=wbs_dat_i;
                ///input_address_DMA_to_FIR=wbs_adr_i;
                ss_tvalid=0;
                ss_tdata=0;
                ss_tlast=0;
                sm_tready=0;

                next_FIR_base_address_buffer=FIR_base_address_buffer;
                next_output_buffer = output_buffer;
                
            end
        endcase
    end


    always@(posedge wb_clk_i) begin
        if(wb_rst_i) begin // positive reset
            state_DMA_FIR <= DMA_FIR_IDLE;
            state_DMA_FIR_request_SDRAM <= DMA_FIR_REQUEST_IDLE;
            wbs_ack_o <= 0;
            wbs_dat_o <= 0;
            FIR_address <= 0;
            FIR_rw <= 0;
            data_from_FIR <= 0;
            FIR_in_valid <= 0;
            FIR_prefetch_step <= 0;
            input_buffer <= 0;
            input_buffer_valid <= 0;
            FIR_base_address_buffer <= 3721;
            input_number_counter <= 0;
            FIR_done_shown_in_DMA <= 0;
            output_SDRAM_address_pointer_counter <= 0;
            //ss_tvalid <= 0;
            //ss_tdata <= 0;
            //ss_tlast <= 0;
            //sm_tready <= 0;
            output_buffer <= 0;
            output_buffer_valid <= 0;
            input_SDRAM_address_pointer_counter <= 0;
        end
        else begin
            state_DMA_FIR <= next_state_DMA_FIR;
            state_DMA_FIR_request_SDRAM <= next_state_DMA_FIR_request_SDRAM;
            wbs_ack_o <= wbs_ack_o_before_FF;
            wbs_dat_o <= wbs_dat_o_before_FF;
            FIR_address <= FIR_address_before_FF;
            FIR_rw <= FIR_rw_before_FF;
            data_from_FIR <= data_from_FIR_before_FF;
            FIR_in_valid <= FIR_in_valid_before_FF;
            FIR_prefetch_step <= FIR_prefetch_step_before_FF;
            input_buffer <= next_input_buffer;
            input_buffer_valid <= next_input_buffer_valid;
            FIR_base_address_buffer <= next_FIR_base_address_buffer;
            input_number_counter <= next_input_number_counter;
            FIR_done_shown_in_DMA <= next_FIR_done_shown_in_DMA;
            output_SDRAM_address_pointer_counter <= next_output_SDRAM_address_pointer_counter;
            //ss_tvalid <= next_ss_tvalid;
            //ss_tdata <= next_ss_tdata;
            //ss_tlast <= next_ss_tlast;
            //sm_tready <= next_sm_tready;
            output_buffer <= next_output_buffer;
            output_buffer_valid <= next_output_buffer_valid;
            input_SDRAM_address_pointer_counter <= next_input_SDRAM_address_pointer_counter;
        end
    end





    
    
    //////////////////// (The following section is about converting between WB protocol and AXI(-Lite/-Stream) protocols) ////////////////////
    
    // AXI-Lite
    wire                        awready;
    wire                        wready;
    reg                        awvalid;
    reg  [(pADDR_WIDTH-1): 0]  awaddr;
    reg                        wvalid;
    reg signed [(pDATA_WIDTH-1) : 0] wdata;
    wire                        arready;
    reg                        rready;
    reg                        arvalid;
    reg         [(pADDR_WIDTH-1): 0] araddr;
    wire                        rvalid;
    wire signed [(pDATA_WIDTH-1): 0] rdata;

    // AXI-Stream (ss)
    reg                        ss_tvalid;
    reg signed [(pDATA_WIDTH-1) : 0] ss_tdata;
    reg                        ss_tlast;
    wire                        ss_tready;

    // AXI-Stream (sm)
    reg                        sm_tready;
    wire                        sm_tvalid;
    wire signed [(pDATA_WIDTH-1) : 0] sm_tdata;
    wire                        sm_tlast;

    /////wire                        axis_clk;
    /////wire                        axis_rst_n;

    // ram for tap
    wire                     tap_WE_merge;
    wire                     tap_RE;
    wire [(pDATA_WIDTH-1):0] tap_Di;
    wire [(pADDR_WIDTH-1):0] tap_A_shifted;
    wire [(pDATA_WIDTH-1):0] tap_Do;
    
    // ram for data RAM
    wire                     data_WE_merge;
    wire                     data_RE;
    wire [(pDATA_WIDTH-1):0] data_Di;
    wire [(pADDR_WIDTH-1):0] data_A_shifted;
    wire [(pDATA_WIDTH-1):0] data_Do;

    // We don NOT use WB_to_AXI module to do this work as before,
    // but implement/embed this function in DMA, as the following shows.

    /////WB_to_AXI WB_to_AXI_U0(
    /////    // WB interface
    /////    .wb_clk_i(wb_clk_i),
    /////    .wb_rst_i(wb_rst_i),
    /////    .wbs_stb_i(wbs_stb_DMA_to_FIR),
    /////    .wbs_cyc_i(wbs_cyc_DMA_to_FIR),
    /////    .wbs_we_i(wbs_we_DMA_to_FIR),
    /////    .wbs_sel_i(wbs_sel_DMA_to_FIR),
    /////    .wbs_dat_i(input_data_DMA_to_FIR),
    /////    .wbs_adr_i(input_address_DMA_to_FIR),
    /////    .wbs_ack_o(wbs_ack_FIR_to_DMA),
    /////    .wbs_dat_o(output_data_FIR_to_DMA),
    /////
    /////    // AXI-Lite interface
    /////    .awready(awready),
    /////    .wready(wready),
    /////    .awvalid(awvalid),
    /////    .awaddr(awaddr),
    /////    .wvalid(wvalid),
    /////    .wdata(wdata),
    /////    .arready(arready),
    /////    .rready(rready),
    /////    .arvalid(arvalid),
    /////    .araddr(araddr),
    /////    .rvalid(rvalid),
    /////    .rdata(rdata),
    /////
    /////    // AXI-Stream interface
    /////    .ss_tvalid(ss_tvalid),
    /////    .ss_tdata(ss_tdata),
    /////    .ss_tlast(ss_tlast),
    /////    .ss_tready(ss_tready),
    /////    .sm_tready(sm_tready),
    /////    .sm_tvalid(sm_tvalid),
    /////    .sm_tdata(sm_tdata),
    /////    .sm_tlast(sm_tlast)
    /////);

    reg AXI_Lite_valid;
    ///reg AXI_ss_valid;
    ///reg AXI_sm_valid;

    always @* begin
        if(wbs_cyc_DMA_to_FIR && wbs_stb_DMA_to_FIR && (input_address_DMA_to_FIR[7:0] <= 8'h7F)) begin
            AXI_Lite_valid=1;
        end
        else begin
            AXI_Lite_valid=0;
        end
        ///if(wbs_cyc_DMA_to_FIR && wbs_stb_DMA_to_FIR && (input_address_DMA_to_FIR[7:0] == 8'h80)) begin
        ///    AXI_ss_valid=1;
        ///end
        ///else begin
        ///    AXI_ss_valid=0;
        ///end
        ///if(wbs_cyc_DMA_to_FIR && wbs_stb_DMA_to_FIR && (input_address_DMA_to_FIR[7:0] == 8'h84)) begin
        ///    AXI_sm_valid=1;
        ///end
        ///else begin
        ///    AXI_sm_valid=0;
        ///end
    end

    ////////////////////////// For debugging //////////////////////////
    wire debug;
    //assign debug = wbs_cyc_DMA_to_FIR && wbs_stb_DMA_to_FIR && (input_address_DMA_to_FIR[7:0] == 8'h84);
    //assign debug = wbs_cyc_DMA_to_FIR && wbs_stb_DMA_to_FIR && (input_address_DMA_to_FIR[31:20] == 12'h300);
    assign debug = wbs_cyc_DMA_to_FIR && wbs_stb_DMA_to_FIR && (input_address_DMA_to_FIR[31:20] == 12'h300) && (input_address_DMA_to_FIR[7:0] == 8'h00);

    ///wire debug_ss;
    ///wire debug_sm;
    ///assign debug_ss = wbs_cyc_DMA_to_FIR && wbs_stb_DMA_to_FIR && (input_address_DMA_to_FIR[31:20] == 12'h300) && (input_address_DMA_to_FIR[7:0] == 8'h80);
    ///assign debug_sm = wbs_cyc_DMA_to_FIR && wbs_stb_DMA_to_FIR && (input_address_DMA_to_FIR[31:20] == 12'h300) && (input_address_DMA_to_FIR[7:0] == 8'h84);

    ///////////////////////////////////////////////////////////////////

    always @* begin
        if(wbs_cyc_DMA_to_FIR && wbs_stb_DMA_to_FIR && (input_address_DMA_to_FIR[7:0] <= 8'h7F)) begin
            wbs_ack_FIR_to_DMA=wbs_ack_Lite;
            output_data_FIR_to_DMA=wbs_dat_Lite;
        end
        ///else if(wbs_cyc_DMA_to_FIR && wbs_stb_DMA_to_FIR && (input_address_DMA_to_FIR[7:0] == 8'h80)) begin
        ///    wbs_ack_FIR_to_DMA=wbs_ack_Stream_ss;
        ///    output_data_FIR_to_DMA=wbs_dat_Stream_ss;
        ///end
        ///else if(wbs_cyc_DMA_to_FIR && wbs_stb_DMA_to_FIR && (input_address_DMA_to_FIR[7:0] == 8'h84)) begin
        ///    wbs_ack_FIR_to_DMA=wbs_ack_Stream_sm;
        ///    output_data_FIR_to_DMA=wbs_dat_Stream_sm;
        ///end
        else begin
            wbs_ack_FIR_to_DMA=0;
            output_data_FIR_to_DMA=0;
        end
    end

    localparam Lite_IDLE = 3'd0, Lite_WRITE = 3'd1, Lite_READ = 3'd2, Lite_WAIT_FOR_COUNTER = 3'd3, Lite_ACK = 3'd4;

    reg wbs_ack_Lite;
    reg wbs_ack_Lite_before_FF;
    reg [31:0] wbs_dat_Lite;
    reg [31:0] wbs_dat_Lite_before_FF;
    reg awvalid_before_FF;
    reg [(pADDR_WIDTH-1):0] awaddr_before_FF;
    reg wvalid_before_FF;
    reg [(pDATA_WIDTH-1):0] wdata_before_FF;
    reg arvalid_before_FF;
    reg [(pADDR_WIDTH-1):0] araddr_before_FF;
    reg rready_before_FF;

    reg [2:0] state_Lite;
    reg [2:0] next_state_Lite;
    reg [15:0] delay_counter;
    reg [15:0] next_delay_counter;

    reg [1:0] Yn_valid_Xn_ready; // original name is "Xn_ready_Yn_valid", but it's confusing
    //reg [1:0] next_Yn_valid_Xn_ready;



    always @* begin
        case(state_Lite)
            Lite_IDLE: begin
                wbs_ack_Lite_before_FF=0;
                wbs_dat_Lite_before_FF=0;

                awaddr_before_FF=input_address_DMA_to_FIR[11:0];
                araddr_before_FF=input_address_DMA_to_FIR[11:0];

                if(AXI_Lite_valid==1) begin
                    if(wbs_we_DMA_to_FIR) begin
                        next_state_Lite=Lite_WRITE;
                        awvalid_before_FF=1;
                        wvalid_before_FF=1;
                        if(input_address_DMA_to_FIR[11:0]==12'h000) begin
                            wdata_before_FF={29'd0,input_data_DMA_to_FIR[2:0]};
                            //next_Yn_valid_Xn_ready=input_data_DMA_to_FIR[5:4]; // read only
                        end
                        else begin
                            wdata_before_FF=input_data_DMA_to_FIR;
                        end

                        arvalid_before_FF=0;
                        ///araddr_before_FF=0;
                        rready_before_FF=0;
                    end
                    else begin
                        next_state_Lite=Lite_READ;
                        awvalid_before_FF=0;
                        wvalid_before_FF=0;
                        wdata_before_FF=input_data_DMA_to_FIR;
                        arvalid_before_FF=1;
                        //araddr_before_FF=1;
                        rready_before_FF=0;
                    end

                    next_delay_counter=delay_counter+1;
                end
                else begin
                    next_state_Lite=Lite_IDLE;
                    awvalid_before_FF=0;
                    wvalid_before_FF=0;
                    wdata_before_FF=input_data_DMA_to_FIR;
                    arvalid_before_FF=0;
                    //araddr_before_FF=0;
                    rready_before_FF=0;
                    next_delay_counter=0;
                end
            end
            Lite_WRITE: begin
                wbs_dat_Lite_before_FF=0;
                awaddr_before_FF=input_address_DMA_to_FIR[11:0];
                arvalid_before_FF=0;
                araddr_before_FF=input_address_DMA_to_FIR[11:0];;
                rready_before_FF=0;

                if(awvalid & wvalid & awready & wready) begin    /////// Write coefficient & ap ///////
                    if(delay_counter >= 1) begin // Assume DELAYS=1
                        next_state_Lite=Lite_ACK;
                        wbs_ack_Lite_before_FF=1;
                        next_delay_counter=0;
                    end
                    else begin
                        next_state_Lite=Lite_WAIT_FOR_COUNTER;
                        wbs_ack_Lite_before_FF=0;
                        next_delay_counter=delay_counter+1;
                    end
                    awvalid_before_FF=0;
                    wvalid_before_FF=0;
                    wdata_before_FF=0;

                end
                else begin
                    next_state_Lite=Lite_WRITE;
                    wbs_ack_Lite_before_FF=0;
                    awvalid_before_FF=1;
                    wvalid_before_FF=1;
                    wdata_before_FF=wdata;
                    next_delay_counter=delay_counter+1;
                end
            end
            Lite_READ: begin
                awvalid_before_FF=0;
                awaddr_before_FF=input_address_DMA_to_FIR[11:0];
                wvalid_before_FF=0;
                wdata_before_FF=0;

                if(arvalid & arready) begin     /////// Read coefficient & ap ///////
                    next_state_Lite=Lite_READ;
                    wbs_ack_Lite_before_FF=0;
                    wbs_dat_Lite_before_FF=0;
                    arvalid_before_FF=0;
                    araddr_before_FF=input_address_DMA_to_FIR[11:0];
                    rready_before_FF=1;
                    next_delay_counter=delay_counter+1;
                end
                else if(rvalid & rready) begin
                    arvalid_before_FF=0;
                    araddr_before_FF=input_address_DMA_to_FIR[11:0];
                    rready_before_FF=0;

                    if(delay_counter >= 1) begin // Assume DELAYS=1
                        next_state_Lite=Lite_ACK;
                        wbs_ack_Lite_before_FF=1;
                        next_delay_counter=0;
                    end
                    else begin
                        next_state_Lite=Lite_WAIT_FOR_COUNTER;
                        wbs_ack_Lite_before_FF=0;
                        next_delay_counter=delay_counter+1;
                    end

                    if(input_address_DMA_to_FIR[11:0]==12'h000) begin
                        wbs_dat_Lite_before_FF={26'd0,Yn_valid_Xn_ready,1'b0,rdata[2:0]};
                    end
                    else begin
                        wbs_dat_Lite_before_FF=rdata;
                    end
                end
                else begin
                    next_state_Lite=Lite_READ;
                    wbs_ack_Lite_before_FF=0;
                    wbs_dat_Lite_before_FF=0;
                    arvalid_before_FF=arvalid;
                    araddr_before_FF=input_address_DMA_to_FIR[11:0];
                    rready_before_FF=rready;
                    next_delay_counter=delay_counter+1;
                end
            end
            Lite_WAIT_FOR_COUNTER: begin
                awvalid_before_FF=0;
                awaddr_before_FF=input_address_DMA_to_FIR[11:0];
                wvalid_before_FF=0;
                wdata_before_FF=0;
                arvalid_before_FF=0;
                araddr_before_FF=input_address_DMA_to_FIR[11:0];;
                rready_before_FF=0;

                if(delay_counter >= 1) begin // Assume DELAYS=1
                    next_state_Lite=Lite_ACK;
                    wbs_ack_Lite_before_FF=1;
                    wbs_dat_Lite_before_FF=wbs_dat_Lite;
                    next_delay_counter=0;
                end
                else begin
                    next_state_Lite=Lite_WAIT_FOR_COUNTER;
                    wbs_ack_Lite_before_FF=0;
                    wbs_dat_Lite_before_FF=wbs_dat_Lite;
                    next_delay_counter=delay_counter+1;
                end
            end
            Lite_ACK: begin
                next_state_Lite=Lite_IDLE;
                wbs_ack_Lite_before_FF=0;
                wbs_dat_Lite_before_FF=wbs_dat_Lite;

                awvalid_before_FF=0;
                awaddr_before_FF=input_address_DMA_to_FIR[11:0];
                wvalid_before_FF=0;
                wdata_before_FF=0;
                arvalid_before_FF=0;
                araddr_before_FF=input_address_DMA_to_FIR[11:0];;
                rready_before_FF=0;

                next_delay_counter=0;
            end
            default:begin
                /*next_state_Lite=
                wbs_ack_Lite_before_FF=
                wbs_dat_Lite_before_FF=

                awvalid_before_FF=
                awaddr_before_FF=
                wvalid_before_FF=
                wdata_before_FF=
                arvalid_before_FF=
                araddr_before_FF=
                rready_before_FF=

                //next_Yn_valid_Xn_ready=
                next_delay_counter=*/

                next_state_Lite=Lite_IDLE;
                wbs_ack_Lite_before_FF=0;
                wbs_dat_Lite_before_FF=0;

                awvalid_before_FF=0;
                awaddr_before_FF=input_address_DMA_to_FIR[11:0];
                wvalid_before_FF=0;
                wdata_before_FF=0;
                arvalid_before_FF=0;
                araddr_before_FF=input_address_DMA_to_FIR[11:0];;
                rready_before_FF=0;

                next_delay_counter=0;

            end
        endcase
    end

    always@(posedge wb_clk_i) begin
        if(wb_rst_i) begin // positive reset
            state_Lite <= Lite_IDLE;
            wbs_ack_Lite <= 0;
            wbs_dat_Lite <= 0;
            awvalid <= 0;
            awaddr <= 0;
            wvalid <= 0;
            wdata <= 0;
            arvalid <= 0;
            araddr <= 0;
            rready <= 0;
            delay_counter <= 0;
            //Yn_valid_Xn_ready <= 0;
        end
        else begin
            state_Lite <= next_state_Lite;
            wbs_ack_Lite <= wbs_ack_Lite_before_FF;
            wbs_dat_Lite <= wbs_dat_Lite_before_FF;
            awvalid <= awvalid_before_FF;
            awaddr <= awaddr_before_FF;
            wvalid <= wvalid_before_FF;
            wdata <= wdata_before_FF;
            arvalid <= arvalid_before_FF;
            araddr <= araddr_before_FF;
            rready <= rready_before_FF;
            delay_counter <= next_delay_counter;
            //Yn_valid_Xn_ready <= next_Yn_valid_Xn_ready;
        end
    end













    // We integrate AXI-Stream ss/sm into DMA FSM
    ////////////////////////////////////////// AXI Stream (ss) for x[n] ///////////////////////////////////////
    ///localparam Stream_ss_IDLE = 3'd0, /*Stream_ss_WRITE_BUFFER = 3'd1, */Stream_ss_FEED_FIR = 3'd3, Stream_ss_WAIT_FOR_COUNTER = 3'd1, Stream_ss_ACK = 3'd2;
///
    ///reg wbs_ack_Stream_ss;
    ///reg wbs_ack_Stream_ss_before_FF;
    ///reg [31:0] wbs_dat_Stream_ss;
    ///reg [31:0] wbs_dat_Stream_ss_before_FF;
///
    ///reg ss_tvalid_before_FF;
    ///reg [(pDATA_WIDTH-1):0] ss_tdata_before_FF;
    ///reg ss_tlast_before_FF;
///
    ///reg [2:0] state_Stream_ss;
    ///reg [2:0] next_state_Stream_ss;
    ///reg [15:0] delay_counter_Stream_ss;
    ///reg [15:0] next_delay_counter_Stream_ss;
///
    ///reg [(pDATA_WIDTH-1):0] input_buffer;
    ///reg [(pDATA_WIDTH-1):0] next_input_buffer;
///
///
    ///always @* begin
    ///    wbs_dat_Stream_ss_before_FF=0;
///
    ///    case(state_Stream_ss)
    ///        Stream_ss_IDLE: begin // input_buffer is out-of-date / has been used
    ///            wbs_ack_Stream_ss_before_FF=0;
    ///            //wbs_dat_Stream_ss_before_FF=0;
    ///            ss_tvalid_before_FF=0;
    ///            ss_tdata_before_FF=0;
    ///            ss_tlast_before_FF=0;
    ///            next_Yn_valid_Xn_ready[0]=1;
///
    ///            if(AXI_ss_valid==1) begin
    ///                next_state_Stream_ss=Stream_ss_WAIT_FOR_COUNTER;
    ///                ///next_input_buffer=input_data_DMA_to_FIR;
    ///                next_delay_counter_Stream_ss=delay_counter_Stream_ss+1;
    ///            end
    ///            else begin
    ///                next_state_Stream_ss=Stream_ss_IDLE;
    ///                ///next_input_buffer=0;
    ///                next_delay_counter_Stream_ss=0;
    ///            end
    ///        end
    ///        Stream_ss_WAIT_FOR_COUNTER: begin
    ///            ss_tvalid_before_FF=0;
    ///            ss_tdata_before_FF=0;
    ///            ss_tlast_before_FF=0;
    ///            ///next_input_buffer=input_buffer;
    ///            next_delay_counter_Stream_ss=0;
///
    ///            if(delay_counter_Stream_ss == 1) begin // Assume DELAYS=1
    ///                next_state_Stream_ss=Stream_ss_ACK;
    ///                wbs_ack_Stream_ss_before_FF=1;
    ///                next_delay_counter_Stream_ss=0;
    ///                next_Yn_valid_Xn_ready[0]=0;
    ///            end
    ///            else begin
    ///                next_state_Stream_ss=Stream_ss_WAIT_FOR_COUNTER;
    ///                wbs_ack_Stream_ss_before_FF=0;
    ///                next_delay_counter_Stream_ss=delay_counter_Stream_ss+1;
    ///                next_Yn_valid_Xn_ready[0]=1;
    ///            end
    ///        end
    ///        Stream_ss_ACK: begin
    ///            next_state_Stream_ss=Stream_ss_FEED_FIR;
    ///            wbs_ack_Stream_ss_before_FF=0;
    ///            ss_tvalid_before_FF=1;
    ///            ss_tdata_before_FF=input_buffer;
///
    ///            if(input_number_counter==DATA_LENGTH) begin
    ///                ss_tlast_before_FF=1;
    ///            end
    ///            else begin
    ///                ss_tlast_before_FF=0;
    ///            end
///
    ///            next_Yn_valid_Xn_ready[0]=0;
    ///            ///next_input_buffer=input_buffer;
    ///            next_delay_counter_Stream_ss=0;
    ///        end
    ///        Stream_ss_FEED_FIR: begin
    ///            wbs_ack_Stream_ss_before_FF=0;
    ///            next_delay_counter_Stream_ss=0;
///
    ///            if(ss_tvalid & ss_tready) begin
    ///                next_state_Stream_ss=Stream_ss_IDLE;
    ///                ss_tvalid_before_FF=0;
    ///                ss_tdata_before_FF=0;
    ///                ss_tlast_before_FF=0;
    ///                next_Yn_valid_Xn_ready[0]=1;
    ///                ///next_input_buffer=0;
    ///            end
    ///            else begin
    ///                next_state_Stream_ss=Stream_ss_FEED_FIR;
    ///                ss_tvalid_before_FF=1;
    ///                ss_tdata_before_FF=input_buffer;
    ///                ss_tlast_before_FF=ss_tlast;
    ///                next_Yn_valid_Xn_ready[0]=0;
    ///                ///next_input_buffer=input_buffer;
    ///            end
    ///        end
///
    ///        default:begin
    ///            next_state_Stream_ss=Stream_ss_IDLE;
    ///            wbs_ack_Stream_ss_before_FF=0;
    ///            //wbs_dat_Stream_ss_before_FF=0;
///
    ///            ss_tvalid_before_FF=0;
    ///            ss_tdata_before_FF=0;
    ///            ss_tlast_before_FF=0;
///
    ///            next_Yn_valid_Xn_ready[0]=0;
    ///            ///next_input_buffer=0;
    ///            next_delay_counter_Stream_ss=0;
    ///        end
    ///    endcase
    ///end
///
    /////always @* begin
    ///    /*if(state_Stream_ss==Stream_ss_IDLE) begin
    ///        next_delay_counter_Stream_ss=1;
    ///    end
    ///    else begin
    ///        next_delay_counter_Stream_ss=delay_counter_Stream_ss+1;
    ///    end
///
    ///    if(delay_counter_Stream_ss == DELAYS) begin
    ///        wbs_ack_Stream_ss_before_FF=1;
    ///    end
    ///    else begin
    ///        wbs_ack_Stream_ss_before_FF=0;
    ///    end*/
///
    /////    wbs_dat_Stream_ss_before_FF=0;
    /////end
///
    ///always@(posedge wb_clk_i) begin
    ///    if(wb_rst_i) begin // positive reset
    ///        state_Stream_ss <= Stream_ss_IDLE;
    ///        wbs_ack_Stream_ss <= 0;
    ///        wbs_dat_Stream_ss <= 0;
    ///        ss_tvalid <= 0;
    ///        ss_tdata <= 0;
    ///        ss_tlast <= 0;
    ///        delay_counter_Stream_ss <= 0;
    ///        Yn_valid_Xn_ready[0] <= 0;
    ///        input_number_counter <= 0;
    ///    end
    ///    else begin
    ///        state_Stream_ss <= next_state_Stream_ss;
    ///        wbs_ack_Stream_ss <= wbs_ack_Stream_ss_before_FF;
    ///        wbs_dat_Stream_ss <= wbs_dat_Stream_ss_before_FF;
    ///        ss_tvalid <= ss_tvalid_before_FF;
    ///        ss_tdata <= ss_tdata_before_FF;
    ///        ss_tlast <= ss_tlast_before_FF;
    ///        delay_counter_Stream_ss <= next_delay_counter_Stream_ss;
    ///        Yn_valid_Xn_ready[0] <= next_Yn_valid_Xn_ready[0];
    ///        ///input_buffer <= next_input_buffer;
    ///        input_number_counter <= next_input_number_counter;
    ///    end
    ///end
///
///
///
///
///
///
///
///
///
///
///
///
///
///
    ////////////////////////////////////////// AXI Stream (sm) for y[n] ///////////////////////////////////////
    ///localparam /*Stream_sm_IDLE = 3'd0, */Stream_sm_WRITE_BUFFER = 3'd0, Stream_sm_WB_OUTPUT = 3'd1, Stream_sm_WAIT_FOR_COUNTER = 3'd2, Stream_sm_ACK = 3'd3;
///
    ///reg wbs_ack_Stream_sm;
    ///reg wbs_ack_Stream_sm_before_FF;
    ///reg [31:0] wbs_dat_Stream_sm;
    ///reg [31:0] wbs_dat_Stream_sm_before_FF;
///
    ///reg sm_tready_before_FF;
///
    ///reg [2:0] state_Stream_sm;
    ///reg [2:0] next_state_Stream_sm;
    ///reg [15:0] delay_counter_Stream_sm;
    ///reg [15:0] next_delay_counter_Stream_sm;
///
    ///reg [(pDATA_WIDTH-1):0] output_buffer;
    ///reg [(pDATA_WIDTH-1):0] next_output_buffer;
///
///
    ///always @* begin
    ///    case(state_Stream_sm)
    ///        Stream_sm_WRITE_BUFFER: begin // output_buffer is out-of-date / has been given out
    ///            next_delay_counter_Stream_sm=0;
    ///            wbs_ack_Stream_sm_before_FF=0;
///
    ///            if(sm_tvalid & sm_tready) begin
    ///                next_state_Stream_sm=Stream_sm_WB_OUTPUT;
    ///                sm_tready_before_FF=0;
    ///                next_Yn_valid_Xn_ready[1]=1;
    ///                next_output_buffer=sm_tdata;
    ///            end
    ///            else begin
    ///                next_state_Stream_sm=Stream_sm_WRITE_BUFFER;
    ///                sm_tready_before_FF=1;
    ///                next_Yn_valid_Xn_ready[1]=0;
    ///                next_output_buffer=0;
    ///            end
    ///        end
    ///        Stream_sm_WB_OUTPUT: begin
    ///            sm_tready_before_FF=0;
    ///            next_Yn_valid_Xn_ready[1]=1;
    ///            next_output_buffer=output_buffer;
    ///            wbs_ack_Stream_sm_before_FF=0;
///
    ///            if(AXI_sm_valid==1) begin
    ///                next_state_Stream_sm=Stream_sm_WAIT_FOR_COUNTER;
    ///                next_delay_counter_Stream_sm=delay_counter_Stream_sm+1;
    ///            end
    ///            else begin
    ///                next_state_Stream_sm=Stream_sm_WB_OUTPUT;
    ///                next_delay_counter_Stream_sm=0;
    ///            end
    ///        end
    ///        Stream_sm_WAIT_FOR_COUNTER: begin
    ///            sm_tready_before_FF=0;
    ///            next_Yn_valid_Xn_ready[1]=1;
    ///            next_output_buffer=output_buffer;
///
    ///           if(delay_counter_Stream_sm == 1) begin // Assume DELAYS=1
    ///                next_state_Stream_sm=Stream_sm_ACK;
    ///                wbs_ack_Stream_sm_before_FF=1;
    ///                next_delay_counter_Stream_sm=0;
    ///            end
    ///            else begin
    ///                next_state_Stream_sm=Stream_sm_WAIT_FOR_COUNTER;
    ///                wbs_ack_Stream_sm_before_FF=0;
    ///                next_delay_counter_Stream_sm=delay_counter_Stream_sm+1;
    ///            end
    ///        end
    ///        Stream_sm_ACK: begin
    ///            next_state_Stream_sm=Stream_sm_WRITE_BUFFER;
    ///            wbs_ack_Stream_sm_before_FF=0;
    ///            sm_tready_before_FF=1;
    ///            next_Yn_valid_Xn_ready[1]=0;
    ///            next_output_buffer=0;
    ///            next_delay_counter_Stream_sm=0;
    ///        end
    ///        default:begin
    ///            next_state_Stream_sm=Stream_sm_WRITE_BUFFER;
    ///            wbs_ack_Stream_sm_before_FF=0;
///
    ///            sm_tready_before_FF=0;
///
    ///            next_Yn_valid_Xn_ready[1]=0;
    ///            next_output_buffer=0;
    ///            next_delay_counter_Stream_sm=0;
    ///        end
    ///    endcase
    ///end
///
    ///always @* begin
    ///    wbs_dat_Stream_sm_before_FF=output_buffer;
    ///end
///
    ///always@(posedge wb_clk_i) begin
    ///    if(wb_rst_i) begin // positive reset
    ///        state_Stream_sm <= Stream_sm_WRITE_BUFFER;
    ///        wbs_ack_Stream_sm <= 0;
    ///        wbs_dat_Stream_sm <= 0;
    ///        sm_tready <= 0;
    ///        delay_counter_Stream_sm <= 0;
    ///        Yn_valid_Xn_ready[1] <= 0;
    ///        output_buffer <= 0;
    ///    end
    ///    else begin
    ///        state_Stream_sm <= next_state_Stream_sm;
    ///        wbs_ack_Stream_sm <= wbs_ack_Stream_sm_before_FF;
    ///        wbs_dat_Stream_sm <= wbs_dat_Stream_sm_before_FF;
    ///        sm_tready <= sm_tready_before_FF;
    ///        delay_counter_Stream_sm <= next_delay_counter_Stream_sm;
    ///        Yn_valid_Xn_ready[1] <= next_Yn_valid_Xn_ready[1];
    ///        output_buffer <= next_output_buffer;
    ///    end
    ///end

    fir fir_U0(
        .awready(awready),
        .wready(wready),
        .awvalid(awvalid),
        .awaddr(awaddr),
        .wvalid(wvalid),
        .wdata(wdata),
        .arready(arready),
        .rready(rready),
        .arvalid(arvalid),
        .araddr(araddr),
        .rvalid(rvalid),
        .rdata(rdata),
        .ss_tvalid(ss_tvalid),
        .ss_tdata(ss_tdata),
        .ss_tlast(ss_tlast),
        .ss_tready(ss_tready),
        .sm_tready(sm_tready),
        .sm_tvalid(sm_tvalid),
        .sm_tdata(sm_tdata),
        .sm_tlast(sm_tlast),

        // ram for tap
        .tap_WE_merge(tap_WE_merge),
        .tap_RE(tap_RE),
        .tap_Di(tap_Di),
        .tap_A_shifted(tap_A_shifted),
        .tap_Do(tap_Do),

        // ram for data
        .data_WE_merge(data_WE_merge),
        .data_RE(data_RE),
        .data_Di(data_Di),
        .data_A_shifted(data_A_shifted),
        .data_Do(data_Do),

        .axis_clk(wb_clk_i),
        .axis_rst_n(~wb_rst_i)

    );
    
    // RAM for tap
    bram11 tap_RAM (
        .clk(wb_clk_i),
        .we(tap_WE_merge),
        .re(tap_RE),
        .waddr(tap_A_shifted),
        .raddr(tap_A_shifted),
        .wdi(tap_Di),
        .rdo(tap_Do)
    );

    // RAM for data
    bram11 data_RAM(
        .clk(wb_clk_i),
        .we(data_WE_merge),
        .re(data_RE),
        .waddr(data_A_shifted),
        .raddr(data_A_shifted),
        .wdi(data_Di),
        .rdo(data_Do)
    );
 
endmodule