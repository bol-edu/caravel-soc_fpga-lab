module SDRAM_arbiter (
        input   clk,
        input   rst,

        
        /*// CPU WB interface
        //input wb_clk_i,
        //input wb_rst_i,
        input wbs_stb_i_CPU,
        input wbs_cyc_i_CPU,
        input wbs_we_i_CPU,
        input [3:0] wbs_sel_i_CPU,
        input [31:0] wbs_dat_i_CPU,
        input [31:0] wbs_adr_i_CPU,
        output wbs_ack_o_CPU,
        output [31:0] wbs_dat_o_CPU,


        // FIR WB interface
        //input wb_clk_i,
        //input wb_rst_i,
        input wbs_stb_i_FIR,
        input wbs_cyc_i_FIR,
        input wbs_we_i_FIR,
        input [3:0] wbs_sel_i_FIR,
        input [31:0] wbs_dat_i_FIR,
        input [31:0] wbs_adr_i_FIR,
        output wbs_ack_o_FIR,
        output [31:0] wbs_dat_o_FIR,

        // MM WB interface
        //input wb_clk_i,
        //input wb_rst_i,
        input wbs_stb_i_MM,
        input wbs_cyc_i_MM,
        input wbs_we_i_MM,
        input [3:0] wbs_sel_i_MM,
        input [31:0] wbs_dat_i_MM,
        input [31:0] wbs_adr_i_MM,
        output wbs_ack_o_MM,
        output [31:0] wbs_dat_o_MM,*/

        // CPU interface
        input   [22:0] CPU_address,
        input   CPU_rw, // 1 = write, 0 = read
        input   [31:0] data_from_CPU,
        output reg [31:0] data_to_CPU,
        output reg CPU_busy,
        input   CPU_in_valid,
        output reg CPU_out_valid,
        input   CPU_prefetch_step,

        // FIR interface
        input   [22:0] FIR_address,
        input   FIR_rw, // 1 = write, 0 = read
        input   [31:0] data_from_FIR,
        output reg [31:0] data_to_FIR,
        output reg FIR_busy,
        input   FIR_in_valid,
        output reg FIR_out_valid,
        input   FIR_prefetch_step,

        // MM interface
        input   [22:0] MM_address,
        input   MM_rw, // 1 = write, 0 = read
        input   [31:0] data_from_MM,
        output reg [31:0] data_to_MM,
        output reg MM_busy,
        input   MM_in_valid,
        output reg MM_out_valid,
        input   MM_prefetch_step,

        // SDRAM controller interface
        output reg   [22:0] controller_address,   // the address will be remap to addr in sdram_controller
        output reg  controller_rw,                 // 1 = write, 0 = read
        output reg  [31:0] data_to_controller,
        input  [31:0] data_from_controller,
        input  controller_busy,               // controller is busy when high
        output reg  controller_in_valid,           // pulse high to initiate a read/write
        input  controller_out_valid,           // pulses high when data from read is valid
        output reg controller_prefetch_step
    );

    ///////////////////////////////////////// (For test) /////////////////////////////////////////
    wire [22:0] prefetch_address_CPU0;
    wire [22:0] prefetch_address_CPU1;
    wire [22:0] prefetch_address_CPU2;
    wire [31:0] prefetch_buffer_CPU0;
    wire [31:0] prefetch_buffer_CPU1;
    wire [31:0] prefetch_buffer_CPU2;
    wire [22:0] prefetch_address_FIR0;
    wire [22:0] prefetch_address_FIR1;
    wire [22:0] prefetch_address_FIR2;
    wire [31:0] prefetch_buffer_FIR0;
    wire [31:0] prefetch_buffer_FIR1;
    wire [31:0] prefetch_buffer_FIR2;
    wire [22:0] prefetch_address_MM0;
    wire [22:0] prefetch_address_MM1;
    wire [22:0] prefetch_address_MM2;
    wire [31:0] prefetch_buffer_MM0;
    wire [31:0] prefetch_buffer_MM1;
    wire [31:0] prefetch_buffer_MM2;
    wire [2:0] request_FIFO_0;
    wire [2:0] request_FIFO_1;
    wire [2:0] request_FIFO_2;

    assign prefetch_address_CPU0=prefetch_address_CPU[0];
    assign prefetch_address_CPU1=prefetch_address_CPU[1];
    assign prefetch_address_CPU2=prefetch_address_CPU[2];
    assign prefetch_buffer_CPU0=prefetch_buffer_CPU[0];
    assign prefetch_buffer_CPU1=prefetch_buffer_CPU[1];
    assign prefetch_buffer_CPU2=prefetch_buffer_CPU[2];
    assign prefetch_address_FIR0=prefetch_address_FIR[0];
    assign prefetch_address_FIR1=prefetch_address_FIR[1];
    assign prefetch_address_FIR2=prefetch_address_FIR[2];
    assign prefetch_buffer_FIR0=prefetch_buffer_FIR[0];
    assign prefetch_buffer_FIR1=prefetch_buffer_FIR[1];
    assign prefetch_buffer_FIR2=prefetch_buffer_FIR[2];
    assign prefetch_address_MM0=prefetch_address_MM[0];
    assign prefetch_address_MM1=prefetch_address_MM[1];
    assign prefetch_address_MM2=prefetch_address_MM[2];
    assign prefetch_buffer_MM0=prefetch_buffer_MM[0];
    assign prefetch_buffer_MM1=prefetch_buffer_MM[1];
    assign prefetch_buffer_MM2=prefetch_buffer_MM[2];
    assign request_FIFO_0=request_FIFO[0];
    assign request_FIFO_1=request_FIFO[1];
    assign request_FIFO_2=request_FIFO[2];
    //////////////////////////////////////////////////////////////////////////////////////////////

    localparam CPU_IDLE = 2'd0, CPU_WRITE = 2'd1,/* CPU_CHECK_PREFETCH = 3'd2, CPU_READ_REQUEST = 3'd3,*/ CPU_READ = 2'd2, CPU_OUTPUT = 2'd3;
    localparam FIFO_IDLE = 2'd0, FIFO_WRITE = 2'd1, FIFO_READ = 2'd2, FIFO_PREFETCH = 2'd3;
    localparam FIR_IDLE = 2'd0, FIR_WRITE = 2'd1, FIR_READ = 2'd2, FIR_OUTPUT = 2'd3;
    localparam MM_IDLE = 2'd0, MM_WRITE = 2'd1, MM_READ = 2'd2, MM_OUTPUT = 2'd3;
    
    
    reg [22:0] controller_address_before_FF;
    reg controller_rw_before_FF;
    reg [31:0] data_to_controller_before_FF;
    reg controller_in_valid_before_FF;
    reg controller_prefetch_step_before_FF;

    
    reg [31:0] data_to_CPU_before_FF;
    reg CPU_busy_before_FF;
    reg CPU_out_valid_before_FF;
    reg [31:0] data_to_FIR_before_FF;
    reg FIR_busy_before_FF;
    reg FIR_out_valid_before_FF;
    reg [31:0] data_to_MM_before_FF;
    reg MM_busy_before_FF;
    reg MM_out_valid_before_FF;

    reg [2:0] request_FIFO [0:2], next_request_FIFO [0:2]; // request_FIFO[XX][2]: CPU; request_FIFO[XX][1]: FIR; request_FIFO[XX][0]: MM
    reg [1:0] state_FIFO;
    reg [1:0] next_state_FIFO;
    reg [1:0] prefetch_counter;
    reg [1:0] next_prefetch_counter;
    reg request_CPU, next_request_CPU;
    reg request_CPU_accept, next_request_CPU_accept;
    reg request_FIR, next_request_FIR;
    reg request_FIR_accept, next_request_FIR_accept;
    reg request_MM, next_request_MM;
    reg request_MM_accept, next_request_MM_accept;

    reg [1:0] state_CPU;
    reg [1:0] next_state_CPU;
    reg [1:0] state_FIR;
    reg [1:0] next_state_FIR;
    reg [1:0] state_MM;
    reg [1:0] next_state_MM;

    reg [31:0] prefetch_buffer_CPU [0:2], next_prefetch_buffer_CPU [0:2];
    reg [22:0] prefetch_address_CPU [0:2], next_prefetch_address_CPU [0:2];
    reg [22:0] CPU_address_saved, next_CPU_address_saved;
    reg CPU_rw_saved, next_CPU_rw_saved;
    reg [31:0] data_from_CPU_saved, next_data_from_CPU_saved;
    reg [31:0] prefetch_buffer_FIR [0:2], next_prefetch_buffer_FIR [0:2];
    reg [22:0] prefetch_address_FIR [0:2], next_prefetch_address_FIR [0:2];
    reg [22:0] FIR_address_saved, next_FIR_address_saved;
    reg FIR_rw_saved, next_FIR_rw_saved;
    reg [31:0] data_from_FIR_saved, next_data_from_FIR_saved;
    reg [31:0] prefetch_buffer_MM [0:2], next_prefetch_buffer_MM [0:2];
    reg [22:0] prefetch_address_MM [0:2], next_prefetch_address_MM [0:2];
    reg [22:0] MM_address_saved, next_MM_address_saved;
    reg MM_rw_saved, next_MM_rw_saved;
    reg [31:0] data_from_MM_saved, next_data_from_MM_saved;

    integer i;

    
    //always @* begin
    //    next_request_CPU_processed = (request_CPU & )
    //end

    //////////////////////////////////////////// (CPU request) ////////////////////////////////////////////
    always @* begin
        case(state_CPU)
            /*++++++++++++++++++++++++++++++ (This works! But we can do better to reduce prefetched hits by 1 cycle.) ++++++++++++++++++++++++++++++
            CPU_IDLE: begin
                CPU_out_valid_before_FF=0;
                data_to_CPU_before_FF=0;

                //if(wbs_adr_i[11:0]==12'h000) begin
                //end
                //else begin
                //end
                if(CPU_in_valid) begin
                    CPU_busy_before_FF=1;
                    next_CPU_rw_saved=CPU_rw;
                    next_CPU_address_saved=CPU_address;
                    next_data_from_CPU_saved=data_from_CPU;
                    if(CPU_rw) begin // 1 for write
                        next_state_CPU=CPU_WRITE;
                        next_request_CPU=1;
                    end
                    else begin // 0 for read
                        next_state_CPU=CPU_CHECK_PREFETCH;
                        next_request_CPU=0;
                    end
                end
                else begin
                    next_state_CPU=CPU_IDLE;
                    CPU_busy_before_FF=0;
                    next_CPU_address_saved=0;
                    next_CPU_rw_saved=0;
                    next_data_from_CPU_saved=0;
                    next_request_CPU=0;
                end

                
            end
            CPU_WRITE: begin
                CPU_busy_before_FF=0;
                CPU_out_valid_before_FF=0;
                data_to_CPU_before_FF=0;
                next_CPU_address_saved=CPU_address_saved;
                next_data_from_CPU_saved=data_from_CPU_saved;
                next_CPU_rw_saved=CPU_rw_saved;
                if(request_CPU_accept) begin
                    next_request_CPU=0;
                end
                else begin
                    next_request_CPU=request_CPU;
                end

                if((request_FIFO[0][2]==1) && (state_FIFO==FIFO_WRITE)) begin // [0] means the being-processed request; [2] is the place of CPU_request (request_FIFO[XX][2]: CPU)
                    next_state_CPU=CPU_IDLE;
                end
                else begin
                    next_state_CPU=CPU_WRITE;
                end

            end
            CPU_CHECK_PREFETCH: begin
                CPU_busy_before_FF=0;
                next_CPU_address_saved=CPU_address_saved;
                next_data_from_CPU_saved=data_from_CPU_saved;
                next_CPU_rw_saved=CPU_rw_saved;

                if(CPU_address_saved == prefetch_address_CPU[0]) begin
                    next_state_CPU=CPU_OUTPUT;
                    CPU_out_valid_before_FF=1;
                    data_to_CPU_before_FF=prefetch_buffer_CPU[0];
                    next_request_CPU=0;
                end
                else if(CPU_address_saved == prefetch_address_CPU[1]) begin
                    next_state_CPU=CPU_OUTPUT;
                    CPU_out_valid_before_FF=1;
                    data_to_CPU_before_FF=prefetch_buffer_CPU[1];
                    next_request_CPU=0;
                end
                else if(CPU_address_saved == prefetch_address_CPU[2]) begin
                    next_state_CPU=CPU_OUTPUT;
                    CPU_out_valid_before_FF=1;
                    data_to_CPU_before_FF=prefetch_buffer_CPU[2];
                    next_request_CPU=0;
                end
                else begin
                    next_state_CPU=CPU_READ;
                    CPU_out_valid_before_FF=0;
                    data_to_CPU_before_FF=0;
                    next_request_CPU=1;
                end
            end
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
            CPU_IDLE: begin

                //if(wbs_adr_i[11:0]==12'h000) begin
                //end
                //else begin
                //end
                if(CPU_in_valid) begin
                    CPU_busy_before_FF=1;
                    next_CPU_rw_saved=CPU_rw;
                    next_CPU_address_saved=CPU_address;
                    next_data_from_CPU_saved=data_from_CPU;
                    if(CPU_rw) begin // 1 for write
                        next_state_CPU=CPU_WRITE;
                        next_request_CPU=1;
                        CPU_out_valid_before_FF=0;
                        data_to_CPU_before_FF=0;
                    end
                    else begin // 0 for read
                        if(CPU_address == prefetch_address_CPU[0]) begin
                            next_state_CPU=CPU_OUTPUT;
                            CPU_out_valid_before_FF=1;
                            data_to_CPU_before_FF=prefetch_buffer_CPU[0];
                            next_request_CPU=0;
                        end
                        else if(CPU_address == prefetch_address_CPU[1]) begin
                            next_state_CPU=CPU_OUTPUT;
                            CPU_out_valid_before_FF=1;
                            data_to_CPU_before_FF=prefetch_buffer_CPU[1];
                            next_request_CPU=0;
                        end
                        else if(CPU_address == prefetch_address_CPU[2]) begin
                            next_state_CPU=CPU_OUTPUT;
                            CPU_out_valid_before_FF=1;
                            data_to_CPU_before_FF=prefetch_buffer_CPU[2];
                            next_request_CPU=0;
                        end
                        else begin
                            next_state_CPU=CPU_READ;
                            CPU_out_valid_before_FF=0;
                            data_to_CPU_before_FF=0;
                            next_request_CPU=1;
                        end
                    end
                end
                else begin
                    next_state_CPU=CPU_IDLE;
                    CPU_busy_before_FF=0;
                    CPU_out_valid_before_FF=0;
                    data_to_CPU_before_FF=0;
                    next_CPU_address_saved=0;
                    next_CPU_rw_saved=0;
                    next_data_from_CPU_saved=0;
                    next_request_CPU=0;
                end

                
            end
            CPU_WRITE: begin
                //CPU_busy_before_FF=1;
                CPU_out_valid_before_FF=0;
                data_to_CPU_before_FF=0;
                next_CPU_address_saved=CPU_address_saved;
                next_data_from_CPU_saved=data_from_CPU_saved;
                next_CPU_rw_saved=CPU_rw_saved;
                if(request_CPU_accept) begin
                    next_request_CPU=0;
                end
                else begin
                    next_request_CPU=request_CPU;
                end

                if((request_FIFO[0][2]==1) && (state_FIFO==FIFO_WRITE)) begin // [0] means the being-processed request; [2] is the place of CPU_request (request_FIFO[XX][2]: CPU)
                    next_state_CPU=CPU_IDLE;
                    CPU_busy_before_FF=0;
                end
                else begin
                    next_state_CPU=CPU_WRITE;
                    CPU_busy_before_FF=1;
                end

            end
            //CPU_CHECK_PREFETCH: begin
            //end
            CPU_READ: begin
                CPU_busy_before_FF=0;
                next_CPU_address_saved=CPU_address_saved;
                next_data_from_CPU_saved=data_from_CPU_saved;
                next_CPU_rw_saved=CPU_rw_saved;

                if(request_CPU_accept) begin
                    next_request_CPU=0;
                end
                else begin
                    next_request_CPU=request_CPU;
                end
                
                if((request_FIFO[0][2]==1) && (controller_out_valid==1)) begin // [0] means the being-processed request; [2] is the place of CPU_request (request_FIFO[XX][2]: CPU)
                    next_state_CPU=CPU_OUTPUT;
                    CPU_out_valid_before_FF=1;
                    data_to_CPU_before_FF=data_from_controller;
                end
                else begin
                    next_state_CPU=CPU_READ;
                    CPU_out_valid_before_FF=0;
                    data_to_CPU_before_FF=0;
                end
            end
            CPU_OUTPUT: begin
                next_state_CPU=CPU_IDLE;
                CPU_busy_before_FF=0;
                CPU_out_valid_before_FF=0;
                data_to_CPU_before_FF=0;
                next_CPU_address_saved=0;
                next_data_from_CPU_saved=0;
                next_CPU_rw_saved=0;
                next_request_CPU=0;
            end
            default:begin
                next_state_CPU=CPU_IDLE;
                CPU_busy_before_FF=0;
                CPU_out_valid_before_FF=0;
                data_to_CPU_before_FF=0;
                next_CPU_address_saved=0;
                next_data_from_CPU_saved=0;
                next_CPU_rw_saved=0;
                next_request_CPU=0;
            end
        endcase
    end

    //////////////////////////////////////////// (FIR request) ////////////////////////////////////////////
    always @* begin
        case(state_FIR)
            FIR_IDLE: begin
                if(FIR_in_valid) begin
                    FIR_busy_before_FF=1;
                    next_FIR_rw_saved=FIR_rw;
                    next_FIR_address_saved=FIR_address;
                    next_data_from_FIR_saved=data_from_FIR;
                    if(FIR_rw) begin // 1 for write
                        next_state_FIR=FIR_WRITE;
                        next_request_FIR=1;
                        FIR_out_valid_before_FF=0;
                        data_to_FIR_before_FF=0;
                    end
                    else begin // 0 for read
                        if(FIR_address == prefetch_address_FIR[0]) begin
                            next_state_FIR=FIR_OUTPUT;
                            FIR_out_valid_before_FF=1;
                            data_to_FIR_before_FF=prefetch_buffer_FIR[0];
                            next_request_FIR=0;
                        end
                        else if(FIR_address == prefetch_address_FIR[1]) begin
                            next_state_FIR=FIR_OUTPUT;
                            FIR_out_valid_before_FF=1;
                            data_to_FIR_before_FF=prefetch_buffer_FIR[1];
                            next_request_FIR=0;
                        end
                        else if(FIR_address == prefetch_address_FIR[2]) begin
                            next_state_FIR=FIR_OUTPUT;
                            FIR_out_valid_before_FF=1;
                            data_to_FIR_before_FF=prefetch_buffer_FIR[2];
                            next_request_FIR=0;
                        end
                        else begin
                            next_state_FIR=FIR_READ;
                            FIR_out_valid_before_FF=0;
                            data_to_FIR_before_FF=0;
                            next_request_FIR=1;
                        end
                    end
                end
                else begin
                    next_state_FIR=FIR_IDLE;
                    FIR_busy_before_FF=0;
                    FIR_out_valid_before_FF=0;
                    data_to_FIR_before_FF=0;
                    next_FIR_address_saved=0;
                    next_FIR_rw_saved=0;
                    next_data_from_FIR_saved=0;
                    next_request_FIR=0;
                end

                
            end
            FIR_WRITE: begin
                FIR_busy_before_FF=0;
                FIR_out_valid_before_FF=0;
                data_to_FIR_before_FF=0;
                next_FIR_address_saved=FIR_address_saved;
                next_data_from_FIR_saved=data_from_FIR_saved;
                next_FIR_rw_saved=FIR_rw_saved;
                if(request_FIR_accept) begin
                    next_request_FIR=0;
                end
                else begin
                    next_request_FIR=request_FIR;
                end

                if((request_FIFO[0][1]==1) && (state_FIFO==FIFO_WRITE)) begin // [0] means the being-processed request; [1] is the place of FIR_request (request_FIFO[XX][1]: FIR)
                    next_state_FIR=FIR_IDLE;
                end
                else begin
                    next_state_FIR=FIR_WRITE;
                end

            end
            //FIR_CHECK_PREFETCH: begin
            //end
            FIR_READ: begin
                FIR_busy_before_FF=0;
                next_FIR_address_saved=FIR_address_saved;
                next_data_from_FIR_saved=data_from_FIR_saved;
                next_FIR_rw_saved=FIR_rw_saved;

                if(request_FIR_accept) begin
                    next_request_FIR=0;
                end
                else begin
                    next_request_FIR=request_FIR;
                end
                
                if((request_FIFO[0][1]==1) && (controller_out_valid==1)) begin // [0] means the being-processed request; [1] is the place of FIR_request (request_FIFO[XX][1]: FIR)
                    next_state_FIR=FIR_OUTPUT;
                    FIR_out_valid_before_FF=1;
                    data_to_FIR_before_FF=data_from_controller;
                end
                else begin
                    next_state_FIR=FIR_READ;
                    FIR_out_valid_before_FF=0;
                    data_to_FIR_before_FF=0;
                end
            end
            FIR_OUTPUT: begin
                next_state_FIR=FIR_IDLE;
                FIR_busy_before_FF=0;
                FIR_out_valid_before_FF=0;
                data_to_FIR_before_FF=0;
                next_FIR_address_saved=0;
                next_data_from_FIR_saved=0;
                next_FIR_rw_saved=0;
                next_request_FIR=0;
            end
            default:begin
                next_state_FIR=FIR_IDLE;
                FIR_busy_before_FF=0;
                FIR_out_valid_before_FF=0;
                data_to_FIR_before_FF=0;
                next_FIR_address_saved=0;
                next_data_from_FIR_saved=0;
                next_FIR_rw_saved=0;
                next_request_FIR=0;
            end
        endcase
    end

    //////////////////////////////////////////// (MM request) ////////////////////////////////////////////
    always @* begin
        case(state_MM)
            MM_IDLE: begin
                if(MM_in_valid) begin
                    MM_busy_before_FF=1;
                    next_MM_rw_saved=MM_rw;
                    next_MM_address_saved=MM_address;
                    next_data_from_MM_saved=data_from_MM;
                    if(MM_rw) begin // 1 for write
                        next_state_MM=MM_WRITE;
                        next_request_MM=1;
                        MM_out_valid_before_FF=0;
                        data_to_MM_before_FF=0;
                    end
                    else begin // 0 for read
                        if(MM_address == prefetch_address_MM[0]) begin
                            next_state_MM=MM_OUTPUT;
                            MM_out_valid_before_FF=1;
                            data_to_MM_before_FF=prefetch_buffer_MM[0];
                            next_request_MM=0;
                        end
                        else if(MM_address == prefetch_address_MM[1]) begin
                            next_state_MM=MM_OUTPUT;
                            MM_out_valid_before_FF=1;
                            data_to_MM_before_FF=prefetch_buffer_MM[1];
                            next_request_MM=0;
                        end
                        else if(MM_address == prefetch_address_MM[2]) begin
                            next_state_MM=MM_OUTPUT;
                            MM_out_valid_before_FF=1;
                            data_to_MM_before_FF=prefetch_buffer_MM[2];
                            next_request_MM=0;
                        end
                        else begin
                            next_state_MM=MM_READ;
                            MM_out_valid_before_FF=0;
                            data_to_MM_before_FF=0;
                            next_request_MM=1;
                        end
                    end
                end
                else begin
                    next_state_MM=MM_IDLE;
                    MM_busy_before_FF=0;
                    MM_out_valid_before_FF=0;
                    data_to_MM_before_FF=0;
                    next_MM_address_saved=0;
                    next_MM_rw_saved=0;
                    next_data_from_MM_saved=0;
                    next_request_MM=0;
                end

                
            end
            MM_WRITE: begin
                //if(request_MM_accept) begin
                //    MM_busy_before_FF=0;
                //end
                //else begin
                //    MM_busy_before_FF=MM_busy;
                //end
                MM_busy_before_FF=0;
                MM_out_valid_before_FF=0;
                data_to_MM_before_FF=0;
                next_MM_address_saved=MM_address_saved;
                next_data_from_MM_saved=data_from_MM_saved;
                next_MM_rw_saved=MM_rw_saved;
                if(request_MM_accept) begin
                    next_request_MM=0;
                end
                else begin
                    next_request_MM=request_MM;
                end

                if((request_FIFO[0][0]==1) && (state_FIFO==FIFO_WRITE)) begin // [0] means the being-processed request; [0] is the place of MM_request (request_FIFO[XX][0]: MM)
                    next_state_MM=MM_IDLE;
                end
                else begin
                    next_state_MM=MM_WRITE;
                end

            end
            //MM_CHECK_PREFETCH: begin
            //end
            MM_READ: begin
                MM_busy_before_FF=0;
                next_MM_address_saved=MM_address_saved;
                next_data_from_MM_saved=data_from_MM_saved;
                next_MM_rw_saved=MM_rw_saved;

                if(request_MM_accept) begin
                    next_request_MM=0;
                end
                else begin
                    next_request_MM=request_MM;
                end
                
                if((request_FIFO[0][0]==1) && (controller_out_valid==1)) begin // [0] means the being-processed request; [0] is the place of MM_request (request_FIFO[XX][0]: MM)
                    next_state_MM=MM_OUTPUT;
                    MM_out_valid_before_FF=1;
                    data_to_MM_before_FF=data_from_controller;
                end
                else begin
                    next_state_MM=MM_READ;
                    MM_out_valid_before_FF=0;
                    data_to_MM_before_FF=0;
                end
            end
            MM_OUTPUT: begin
                next_state_MM=MM_IDLE;
                MM_busy_before_FF=0;
                MM_out_valid_before_FF=0;
                data_to_MM_before_FF=0;
                next_MM_address_saved=0;
                next_data_from_MM_saved=0;
                next_MM_rw_saved=0;
                next_request_MM=0;
            end
            default:begin
                next_state_MM=MM_IDLE;
                MM_busy_before_FF=0;
                MM_out_valid_before_FF=0;
                data_to_MM_before_FF=0;
                next_MM_address_saved=0;
                next_data_from_MM_saved=0;
                next_MM_rw_saved=0;
                next_request_MM=0;
            end
        endcase
    end

    //////////////////////////////////////////// (FIFO) ////////////////////////////////////////////
    always @* begin
        if(request_FIFO[0][2]==1) begin
            controller_address_before_FF=CPU_address_saved;
            controller_rw_before_FF=CPU_rw_saved;
            data_to_controller_before_FF=data_from_CPU_saved;
            controller_prefetch_step_before_FF=CPU_prefetch_step;
        end
        else if(request_FIFO[0][1]==1) begin
            controller_address_before_FF=FIR_address_saved;
            controller_rw_before_FF=FIR_rw_saved;
            data_to_controller_before_FF=data_from_FIR_saved;
            controller_prefetch_step_before_FF=FIR_prefetch_step;
        end
        else if(request_FIFO[0][0]==1) begin
            controller_address_before_FF=MM_address_saved;
            controller_rw_before_FF=MM_rw_saved;
            data_to_controller_before_FF=data_from_MM_saved;
            controller_prefetch_step_before_FF=MM_prefetch_step;
        end
        else begin
            controller_address_before_FF=controller_address;
            controller_rw_before_FF=controller_rw;
            data_to_controller_before_FF=data_to_controller;
            controller_prefetch_step_before_FF=controller_prefetch_step;
        end
    end

    always @* begin
        case(state_FIFO)
            FIFO_IDLE: begin
                //controller_address_before_FF=0;
                //controller_rw_before_FF=0;
                //data_to_controller_before_FF=0;
                //controller_in_valid_before_FF=0;
                next_prefetch_counter=0;
                for(i=0;i<3;i=i+1)begin
                    next_prefetch_buffer_CPU[i] <= prefetch_buffer_CPU[i];
                    next_prefetch_address_CPU[i] <= prefetch_address_CPU[i];
                    next_prefetch_buffer_FIR[i] <= prefetch_buffer_FIR[i];
                    next_prefetch_address_FIR[i] <= prefetch_address_FIR[i];
                    next_prefetch_buffer_MM[i] <= prefetch_buffer_MM[i];
                    next_prefetch_address_MM[i] <= prefetch_address_MM[i];
                end

                /*if(wbs_adr_i[11:0]==12'h000) begin
                end
                else begin
                end*/
                if(request_CPU & (~request_CPU_accept)) begin
                    next_state_FIFO=FIFO_IDLE;
                    controller_in_valid_before_FF=0;
                    next_request_CPU_accept=1;
                    next_request_FIR_accept=0;
                    next_request_MM_accept=0;
                    if(request_FIFO[0]==3'b000) begin
                        next_request_FIFO[0]=3'b100;
                        next_request_FIFO[1]=request_FIFO[1];
                        next_request_FIFO[2]=request_FIFO[2];
                    end
                    else if(request_FIFO[1]==3'b000) begin
                        next_request_FIFO[0]=request_FIFO[0];
                        next_request_FIFO[1]=3'b100;
                        next_request_FIFO[2]=request_FIFO[2];
                    end
                    else begin
                        next_request_FIFO[0]=request_FIFO[0];
                        next_request_FIFO[1]=request_FIFO[1];
                        next_request_FIFO[2]=3'b100;
                    end
                end
                else if(request_FIR & (~request_FIR_accept)) begin
                    next_state_FIFO=FIFO_IDLE;
                    controller_in_valid_before_FF=0;
                    next_request_CPU_accept=0;
                    next_request_FIR_accept=1;
                    next_request_MM_accept=0;
                    if(request_FIFO[0]==3'b000) begin
                        next_request_FIFO[0]=3'b010;
                        next_request_FIFO[1]=request_FIFO[1];
                        next_request_FIFO[2]=request_FIFO[2];
                    end
                    else if(request_FIFO[1]==3'b000) begin
                        next_request_FIFO[0]=request_FIFO[0];
                        next_request_FIFO[1]=3'b010;
                        next_request_FIFO[2]=request_FIFO[2];
                    end
                    else begin
                        next_request_FIFO[0]=request_FIFO[0];
                        next_request_FIFO[1]=request_FIFO[1];
                        next_request_FIFO[2]=3'b010;
                    end
                end
                else if(request_MM & (~request_MM_accept)) begin
                    next_state_FIFO=FIFO_IDLE;
                    controller_in_valid_before_FF=0;
                    next_request_CPU_accept=0;
                    next_request_FIR_accept=0;
                    next_request_MM_accept=1;
                    if(request_FIFO[0]==3'b000) begin
                        next_request_FIFO[0]=3'b001;
                        next_request_FIFO[1]=request_FIFO[1];
                        next_request_FIFO[2]=request_FIFO[2];
                    end
                    else if(request_FIFO[1]==3'b000) begin
                        next_request_FIFO[0]=request_FIFO[0];
                        next_request_FIFO[1]=3'b001;
                        next_request_FIFO[2]=request_FIFO[2];
                    end
                    else begin
                        next_request_FIFO[0]=request_FIFO[0];
                        next_request_FIFO[1]=request_FIFO[1];
                        next_request_FIFO[2]=3'b001;
                    end
                end
                else if(request_FIFO[0]!=3'b000) begin
                    controller_in_valid_before_FF=1;
                    if(((request_FIFO[0][2]==1) && (CPU_rw_saved==1)) || ((request_FIFO[0][1]==1) && (FIR_rw_saved==1)) || ((request_FIFO[0][0]==1) && (MM_rw_saved==1))) begin
                        next_state_FIFO=FIFO_WRITE;
                    end
                    else begin
                        next_state_FIFO=FIFO_READ;
                    end
                    next_request_CPU_accept=0;
                    next_request_FIR_accept=0;
                    next_request_MM_accept=0;
                    next_request_FIFO[0] <= request_FIFO[0];
                    next_request_FIFO[1] <= request_FIFO[1];
                    next_request_FIFO[2] <= request_FIFO[2];
                    
                end
                else begin
                    next_state_FIFO=FIFO_IDLE;
                    controller_in_valid_before_FF=0;
                    next_request_CPU_accept=0;
                    next_request_FIR_accept=0;
                    next_request_MM_accept=0;
                    next_request_FIFO[0] <= request_FIFO[0];
                    next_request_FIFO[1] <= request_FIFO[1];
                    next_request_FIFO[2] <= request_FIFO[2];
                end
            end
            FIFO_WRITE: begin
                next_request_CPU_accept=0;
                next_request_FIR_accept=0;
                next_request_MM_accept=0;
                next_prefetch_counter=0;
                for(i=0;i<3;i=i+1)begin
                    next_prefetch_buffer_CPU[i] <= prefetch_buffer_CPU[i];
                    next_prefetch_address_CPU[i] <= prefetch_address_CPU[i];
                    next_prefetch_buffer_FIR[i] <= prefetch_buffer_FIR[i];
                    next_prefetch_address_FIR[i] <= prefetch_address_FIR[i];
                    next_prefetch_buffer_MM[i] <= prefetch_buffer_MM[i];
                    next_prefetch_address_MM[i] <= prefetch_address_MM[i];
                end

                if(controller_busy) begin
                    next_state_FIFO=FIFO_WRITE;
                    controller_in_valid_before_FF=controller_in_valid;
                    next_request_FIFO[0] <= request_FIFO[0];
                    next_request_FIFO[1] <= request_FIFO[1];
                    next_request_FIFO[2] <= request_FIFO[2];
                end
                else begin
                    next_state_FIFO=FIFO_IDLE;
                    controller_in_valid_before_FF=0;
                    next_request_FIFO[0] <= request_FIFO[1];
                    next_request_FIFO[1] <= request_FIFO[2];
                    next_request_FIFO[2] <= 3'b000;
                end
            end
            FIFO_READ: begin
                next_request_CPU_accept=0;
                next_request_FIR_accept=0;
                next_request_MM_accept=0;
                next_prefetch_counter=0;
                for(i=0;i<3;i=i+1)begin
                    next_prefetch_buffer_CPU[i] <= prefetch_buffer_CPU[i];
                    next_prefetch_address_CPU[i] <= prefetch_address_CPU[i];
                    next_prefetch_buffer_FIR[i] <= prefetch_buffer_FIR[i];
                    next_prefetch_address_FIR[i] <= prefetch_address_FIR[i];
                    next_prefetch_buffer_MM[i] <= prefetch_buffer_MM[i];
                    next_prefetch_address_MM[i] <= prefetch_address_MM[i];
                end
                next_request_FIFO[0] <= request_FIFO[0];
                next_request_FIFO[1] <= request_FIFO[1];
                next_request_FIFO[2] <= request_FIFO[2];

                if(controller_busy) begin
                    next_state_FIFO=FIFO_READ;
                    controller_in_valid_before_FF=controller_in_valid;
                end
                else if(controller_out_valid) begin
                    next_state_FIFO=FIFO_PREFETCH;
                    controller_in_valid_before_FF=0;
                end
                else begin
                    next_state_FIFO=FIFO_READ;
                    controller_in_valid_before_FF=0;
                end
            end
            FIFO_PREFETCH: begin
                next_prefetch_counter = prefetch_counter+1;
                if(prefetch_counter==2'd2) begin
                    next_state_FIFO=FIFO_IDLE;
                    next_request_FIFO[0] <= request_FIFO[1];
                    next_request_FIFO[1] <= request_FIFO[2];
                    next_request_FIFO[2] <= 3'b000;

                    if(request_FIFO[0][2]==1) begin // CPU
                        next_prefetch_address_CPU[0]=prefetch_address_CPU[0];
                        next_prefetch_address_CPU[1]=prefetch_address_CPU[1];
                        next_prefetch_address_CPU[2]=prefetch_address_CPU[2];
                        next_prefetch_buffer_CPU[0]=prefetch_buffer_CPU[0];
                        next_prefetch_buffer_CPU[1]=prefetch_buffer_CPU[1];
                        next_prefetch_buffer_CPU[2]=data_from_controller;
                        for(i=0;i<3;i=i+1)begin
                            next_prefetch_buffer_FIR[i] <= prefetch_buffer_FIR[i];
                            next_prefetch_address_FIR[i] <= prefetch_address_FIR[i];
                            next_prefetch_buffer_MM[i] <= prefetch_buffer_MM[i];
                            next_prefetch_address_MM[i] <= prefetch_address_MM[i];
                        end
                    end
                    else if(request_FIFO[0][1]==1) begin // FIR
                        next_prefetch_address_FIR[0]=prefetch_address_FIR[0];
                        next_prefetch_address_FIR[1]=prefetch_address_FIR[1];
                        next_prefetch_address_FIR[2]=prefetch_address_FIR[2];
                        next_prefetch_buffer_FIR[0]=prefetch_buffer_FIR[0];
                        next_prefetch_buffer_FIR[1]=prefetch_buffer_FIR[1];
                        next_prefetch_buffer_FIR[2]=data_from_controller;
                        for(i=0;i<3;i=i+1)begin
                            next_prefetch_buffer_CPU[i] <= prefetch_buffer_CPU[i];
                            next_prefetch_address_CPU[i] <= prefetch_address_CPU[i];
                            next_prefetch_buffer_MM[i] <= prefetch_buffer_MM[i];
                            next_prefetch_address_MM[i] <= prefetch_address_MM[i];
                        end
                    end
                    else begin // MM
                        next_prefetch_address_MM[0]=prefetch_address_MM[0];
                        next_prefetch_address_MM[1]=prefetch_address_MM[1];
                        next_prefetch_address_MM[2]=prefetch_address_MM[2];
                        next_prefetch_buffer_MM[0]=prefetch_buffer_MM[0];
                        next_prefetch_buffer_MM[1]=prefetch_buffer_MM[1];
                        next_prefetch_buffer_MM[2]=data_from_controller;
                        for(i=0;i<3;i=i+1)begin
                            next_prefetch_buffer_CPU[i] <= prefetch_buffer_CPU[i];
                            next_prefetch_address_CPU[i] <= prefetch_address_CPU[i];
                            next_prefetch_buffer_FIR[i] <= prefetch_buffer_FIR[i];
                            next_prefetch_address_FIR[i] <= prefetch_address_FIR[i];
                        end
                    end
                end
                else if(prefetch_counter==2'd1) begin
                    next_state_FIFO=FIFO_PREFETCH;
                    next_request_FIFO[0] <= request_FIFO[0];
                    next_request_FIFO[1] <= request_FIFO[1];
                    next_request_FIFO[2] <= request_FIFO[2];

                    if(request_FIFO[0][2]==1) begin // CPU
                        next_prefetch_address_CPU[0]=prefetch_address_CPU[0];
                        next_prefetch_address_CPU[1]=prefetch_address_CPU[1];
                        next_prefetch_address_CPU[2]=prefetch_address_CPU[2];
                        next_prefetch_buffer_CPU[0]=prefetch_buffer_CPU[0];
                        next_prefetch_buffer_CPU[1]=data_from_controller;
                        next_prefetch_buffer_CPU[2]=prefetch_buffer_CPU[2];
                        for(i=0;i<3;i=i+1)begin
                            next_prefetch_buffer_FIR[i] <= prefetch_buffer_FIR[i];
                            next_prefetch_address_FIR[i] <= prefetch_address_FIR[i];
                            next_prefetch_buffer_MM[i] <= prefetch_buffer_MM[i];
                            next_prefetch_address_MM[i] <= prefetch_address_MM[i];
                        end
                    end
                    else if(request_FIFO[0][1]==1) begin // FIR
                        next_prefetch_address_FIR[0]=prefetch_address_FIR[0];
                        next_prefetch_address_FIR[1]=prefetch_address_FIR[1];
                        next_prefetch_address_FIR[2]=prefetch_address_FIR[2];
                        next_prefetch_buffer_FIR[0]=prefetch_buffer_FIR[0];
                        next_prefetch_buffer_FIR[1]=data_from_controller;
                        next_prefetch_buffer_FIR[2]=prefetch_buffer_FIR[2];
                        for(i=0;i<3;i=i+1)begin
                            next_prefetch_buffer_CPU[i] <= prefetch_buffer_CPU[i];
                            next_prefetch_address_CPU[i] <= prefetch_address_CPU[i];
                            next_prefetch_buffer_MM[i] <= prefetch_buffer_MM[i];
                            next_prefetch_address_MM[i] <= prefetch_address_MM[i];
                        end
                    end
                    else begin // MM
                        next_prefetch_address_MM[0]=prefetch_address_MM[0];
                        next_prefetch_address_MM[1]=prefetch_address_MM[1];
                        next_prefetch_address_MM[2]=prefetch_address_MM[2];
                        next_prefetch_buffer_MM[0]=prefetch_buffer_MM[0];
                        next_prefetch_buffer_MM[1]=data_from_controller;
                        next_prefetch_buffer_MM[2]=prefetch_buffer_MM[2];
                        for(i=0;i<3;i=i+1)begin
                            next_prefetch_buffer_CPU[i] <= prefetch_buffer_CPU[i];
                            next_prefetch_address_CPU[i] <= prefetch_address_CPU[i];
                            next_prefetch_buffer_FIR[i] <= prefetch_buffer_FIR[i];
                            next_prefetch_address_FIR[i] <= prefetch_address_FIR[i];
                        end
                    end
                end
                else begin
                    next_state_FIFO=FIFO_PREFETCH;
                    next_request_FIFO[0] <= request_FIFO[0];
                    next_request_FIFO[1] <= request_FIFO[1];
                    next_request_FIFO[2] <= request_FIFO[2];
                    
                    if(request_FIFO[0][2]==1) begin // CPU
                        if(controller_prefetch_step) begin
                            next_prefetch_address_CPU[0]=controller_address+16;
                            next_prefetch_address_CPU[1]=controller_address+32;
                            next_prefetch_address_CPU[2]=controller_address+48;
                        end
                        else begin
                            next_prefetch_address_CPU[0]=controller_address+4;
                            next_prefetch_address_CPU[1]=controller_address+8;
                            next_prefetch_address_CPU[2]=controller_address+12;
                        end
                        next_prefetch_buffer_CPU[0]=data_from_controller;
                        next_prefetch_buffer_CPU[1]=0;
                        next_prefetch_buffer_CPU[2]=0;
                        for(i=0;i<3;i=i+1)begin
                            next_prefetch_buffer_FIR[i] <= prefetch_buffer_FIR[i];
                            next_prefetch_address_FIR[i] <= prefetch_address_FIR[i];
                            next_prefetch_buffer_MM[i] <= prefetch_buffer_MM[i];
                            next_prefetch_address_MM[i] <= prefetch_address_MM[i];
                        end
                    end
                    else if(request_FIFO[0][1]==1) begin // FIR
                        if(controller_prefetch_step) begin
                            next_prefetch_address_FIR[0]=controller_address+16;
                            next_prefetch_address_FIR[1]=controller_address+32;
                            next_prefetch_address_FIR[2]=controller_address+48;
                        end
                        else begin
                            next_prefetch_address_FIR[0]=controller_address+4;
                            next_prefetch_address_FIR[1]=controller_address+8;
                            next_prefetch_address_FIR[2]=controller_address+12;
                        end
                        next_prefetch_buffer_FIR[0]=data_from_controller;
                        next_prefetch_buffer_FIR[1]=0;
                        next_prefetch_buffer_FIR[2]=0;
                        for(i=0;i<3;i=i+1)begin
                            next_prefetch_buffer_CPU[i] <= prefetch_buffer_CPU[i];
                            next_prefetch_address_CPU[i] <= prefetch_address_CPU[i];
                            next_prefetch_buffer_MM[i] <= prefetch_buffer_MM[i];
                            next_prefetch_address_MM[i] <= prefetch_address_MM[i];
                        end
                    end
                    else begin // MM
                        if(controller_prefetch_step) begin
                            next_prefetch_address_MM[0]=controller_address+16;
                            next_prefetch_address_MM[1]=controller_address+32;
                            next_prefetch_address_MM[2]=controller_address+48;
                        end
                        else begin
                            next_prefetch_address_MM[0]=controller_address+4;
                            next_prefetch_address_MM[1]=controller_address+8;
                            next_prefetch_address_MM[2]=controller_address+12;
                        end
                        next_prefetch_buffer_MM[0]=data_from_controller;
                        next_prefetch_buffer_MM[1]=0;
                        next_prefetch_buffer_MM[2]=0;
                        for(i=0;i<3;i=i+1)begin
                            next_prefetch_buffer_CPU[i] <= prefetch_buffer_CPU[i];
                            next_prefetch_address_CPU[i] <= prefetch_address_CPU[i];
                            next_prefetch_buffer_FIR[i] <= prefetch_buffer_FIR[i];
                            next_prefetch_address_FIR[i] <= prefetch_address_FIR[i];
                        end
                    end
                end
            end
            default:begin
                next_state_FIFO=FIFO_IDLE;
                //controller_address_before_FF=0;
                //controller_rw_before_FF=0;
                //data_to_controller_before_FF=0;
                controller_in_valid_before_FF=0;
                next_request_FIFO[0] <= 0;
                next_request_FIFO[1] <= 0;
                next_request_FIFO[2] <= 0;

                next_request_CPU_accept=0;
                next_request_FIR_accept=0;
                next_request_MM_accept=0;
                next_prefetch_counter=0;
                for(i=0;i<3;i=i+1)begin
                    next_prefetch_buffer_CPU[i] <= 0;
                    next_prefetch_address_CPU[i] <= 0;
                    next_prefetch_buffer_FIR[i] <= 0;
                    next_prefetch_address_FIR[i] <= 0;
                    next_prefetch_buffer_MM[i] <= 0;
                    next_prefetch_address_MM[i] <= 0;
                end
                
            end
        endcase
    end


    
    always@(posedge clk) begin
    if(rst) begin // positive reset
        controller_address <= 0;
        controller_rw <= 0;
        data_to_controller <= 0;
        controller_in_valid <= 0;
        controller_prefetch_step <= 0;

        state_FIFO <= FIFO_IDLE;
        for(i=0;i<3;i=i+1)begin
            request_FIFO[i] <= 0;
        end
        prefetch_counter <= 0;

        state_CPU <= CPU_IDLE;
        data_to_CPU <= 0;
        CPU_busy <= 0;
        CPU_out_valid <= 0;
        request_CPU <= 0;
        request_CPU_accept <= 0;
        for(i=0;i<3;i=i+1)begin
            prefetch_buffer_CPU[i] <= 0;
            prefetch_address_CPU[i] <= 1;
        end
        CPU_address_saved <= 0;
        CPU_rw_saved <= 0;
        data_from_CPU_saved <= 0;

        state_FIR <= FIR_IDLE;
        data_to_FIR <= 0;
        FIR_busy <= 0;
        FIR_out_valid <= 0;
        request_FIR <= 0;
        request_FIR_accept <= 0;
        for(i=0;i<3;i=i+1)begin
            prefetch_buffer_FIR[i] <= 0;
            prefetch_address_FIR[i] <= 1;
        end
        FIR_address_saved <= 0;
        FIR_rw_saved <= 0;
        data_from_FIR_saved <= 0;

        state_MM <= MM_IDLE;
        data_to_MM <= 0;
        MM_busy <= 0;
        MM_out_valid <= 0;
        request_MM <= 0;
        request_MM_accept <= 0;
        for(i=0;i<3;i=i+1)begin
            prefetch_buffer_MM[i] <= 0;
            prefetch_address_MM[i] <= 1;
        end
        MM_address_saved <= 0;
        MM_rw_saved <= 0;
        data_from_MM_saved <= 0;
    end
    else begin
        controller_address <= controller_address_before_FF;
        controller_rw <= controller_rw_before_FF;
        data_to_controller <= data_to_controller_before_FF;
        controller_in_valid <= controller_in_valid_before_FF;
        controller_prefetch_step <= controller_prefetch_step_before_FF;

        state_FIFO <= next_state_FIFO;
        for(i=0;i<3;i=i+1)begin
            request_FIFO[i] <= next_request_FIFO[i];
        end
        prefetch_counter <= next_prefetch_counter;

        state_CPU <= next_state_CPU;
        data_to_CPU <= data_to_CPU_before_FF;
        CPU_busy <= CPU_busy_before_FF;
        CPU_out_valid <= CPU_out_valid_before_FF;
        request_CPU <= next_request_CPU;
        request_CPU_accept <= next_request_CPU_accept;
        for(i=0;i<3;i=i+1)begin
            prefetch_buffer_CPU[i] <= next_prefetch_buffer_CPU[i];
            prefetch_address_CPU[i] <= next_prefetch_address_CPU[i];
        end
        CPU_address_saved <= next_CPU_address_saved;
        CPU_rw_saved <= next_CPU_rw_saved;
        data_from_CPU_saved <= next_data_from_CPU_saved;

        state_FIR <= next_state_FIR;
        data_to_FIR <= data_to_FIR_before_FF;
        FIR_busy <= FIR_busy_before_FF;
        FIR_out_valid <= FIR_out_valid_before_FF;
        request_FIR <= next_request_FIR;
        request_FIR_accept <= next_request_FIR_accept;
        for(i=0;i<3;i=i+1)begin
            prefetch_buffer_FIR[i] <= next_prefetch_buffer_FIR[i];
            prefetch_address_FIR[i] <= next_prefetch_address_FIR[i];
        end
        FIR_address_saved <= next_FIR_address_saved;
        FIR_rw_saved <= next_FIR_rw_saved;
        data_from_FIR_saved <= next_data_from_FIR_saved;

        state_MM <= next_state_MM;
        data_to_MM <= data_to_MM_before_FF;
        MM_busy <= MM_busy_before_FF;
        MM_out_valid <= MM_out_valid_before_FF;
        request_MM <= next_request_MM;
        request_MM_accept <= next_request_MM_accept;
        for(i=0;i<3;i=i+1)begin
            prefetch_buffer_MM[i] <= next_prefetch_buffer_MM[i];
            prefetch_address_MM[i] <= next_prefetch_address_MM[i];
        end
        MM_address_saved <= next_MM_address_saved;
        MM_rw_saved <= next_MM_rw_saved;
        data_from_MM_saved <= next_data_from_MM_saved;
    end
end

endmodule
