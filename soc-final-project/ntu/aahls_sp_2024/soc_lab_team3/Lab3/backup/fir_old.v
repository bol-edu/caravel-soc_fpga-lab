////////////////////////////////////////////////////
// Function Description : 
// AXI-Lite : 
// AXI-Stream : 
// FIR Control :
// 
////////////////////////////////////////////////////

module fir
#(  
    parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32,
    parameter Tape_Num    = 4'd11
)
(
    // Axi-lite write
    output  wire                     awready,
    output  wire                     wready,
    input   wire                     awvalid,
    input   wire [(pADDR_WIDTH-1):0] awaddr,
    input   wire                     wvalid,
    input   wire [(pDATA_WIDTH-1):0] wdata,

    // Axi-lite read
    output  wire                     arready,
    input   wire                     rready,
    input   wire                     arvalid,
    input   wire [(pADDR_WIDTH-1):0] araddr,
    output  wire                     rvalid,
    output  wire [(pDATA_WIDTH-1):0] rdata,    

    // Axi-stream write 
    input   wire                     ss_tvalid, 
    input   wire [(pDATA_WIDTH-1):0] ss_tdata, 
    input   wire                     ss_tlast, 
    output  wire                     ss_tready, 
    
    // Axi-stream read
    input   wire                     sm_tready, 
    output  wire                     sm_tvalid, 
    output  wire [(pDATA_WIDTH-1):0] sm_tdata, 
    output  wire                     sm_tlast, 
    
    // bram for tap RAM
    output  wire [3:0]               tap_WE,
    output  wire                     tap_EN,
    output  wire [(pDATA_WIDTH-1):0] tap_Di,
    output  wire [(pADDR_WIDTH-1):0] tap_A,
    input   wire [(pDATA_WIDTH-1):0] tap_Do,

    // bram for data RAM
    output  wire [3:0]               data_WE,
    output  wire                     data_EN,
    output  wire [(pDATA_WIDTH-1):0] data_Di,
    output  wire [(pADDR_WIDTH-1):0] data_A,
    input   wire [(pDATA_WIDTH-1):0] data_Do,

    input   wire                     axis_clk,
    input   wire                     axis_rst_n
);
//*******************************************************************************************
// - axi-lite write
//  - awready   : when awvalid is asserted , awready will check fifo status , if not full is ready.
//  - wready    : when wvalid is asserted , awready will check fifo status , if not full is ready.     
//  - fifo_push : fifo not full & data valid.
//  - fifo_pop  : aw_fifo and w_fifo both not empty will pop to SRAM. (pop_axi_fifo)         
//*******************************************************************************************
    localparam AXI_FIFO_DEPTH = 3;

    wire w_fifo_full,w_fifo_empty,aw_fifo_full,aw_fifo_empty;
    wire pop_axi_fifo;
    wire [pADDR_WIDTH-1 : 0] aw_fifo_out;
    wire [pDATA_WIDTH-1 : 0] w_fifo_out;

    assign awready       = awvalid & !aw_fifo_full; // valid can remove ? -JIANG
    assign wready        = wvalid  & !w_fifo_full;
    assign pop_axi_fifo  = !w_fifo_empty & !aw_fifo_empty; 

    fifo
    #(  .WIDTH      (pADDR_WIDTH),
        .DEPTH      (AXI_FIFO_DEPTH)
    )   aw_fifo
    (
        .clk         (axis_clk),
        .rst_n       (axis_rst_n),
        .pre_full   (aw_fifo_full),
        .pre_empty  (aw_fifo_empty),
        .w_valid     (awvalid),
        .r_ready     (pop_axi_fifo),
        .data_in     (awaddr),
        .data_out    (aw_fifo_out)
    );
    fifo
    #(  .WIDTH      (pDATA_WIDTH),
        .DEPTH      (AXI_FIFO_DEPTH)
    )   w_fifo
    (
        .clk         (axis_clk),
        .rst_n       (axis_rst_n),
        .pre_full   (w_fifo_full),
        .pre_empty  (w_fifo_empty),
        .w_valid     (wvalid),
        .r_ready     (pop_axi_fifo),
        .data_in     (wdata),
        .data_out    (w_fifo_out)
    );


//*******************************************************************************************
// - pop data check address condition
//  - 0x00          :
//      - wire name : pop_cfg 
//      - [0] : ap_start    --- set 1 in axi write 0x00 ; reset at first axis data transfer & ap_idle = 1; 
//      - [1] : ap_done     --- set 1 at Y data is transfered finish , reset in axi-read address 0x00.
//      - [2] : ap_idle     --- when ap_start = 1 , set 1 ; reset at Y data is calculated finish.
//  - 0x10 ~ 0x14   : 
//      - wire name : pop_datalength
//      - data length     
//  - 0x20 ~ 0xFF   :  
//      - wire name : pop_tap
//      - tap data       
//*******************************************************************************************
    reg ap_start,ap_done,ap_idle;
    reg [pDATA_WIDTH-1 : 0] data_length;
    wire pop_cfg,pop_datalength,pop_tap;

    assign pop_cfg          = pop_axi_fifo & (aw_fifo_out == 12'h0);
    assign pop_datalength   = pop_axi_fifo & (aw_fifo_out >= 'h10) & (aw_fifo_out <= 'h14);
    assign pop_tap          = pop_axi_fifo & (aw_fifo_out >= 'h20) & (aw_fifo_out <= 'hFF);

    always@(posedge axis_clk or negedge axis_rst_n)
    begin
        if(!axis_rst_n)
        begin
            ap_start    <= 0;
            ap_done     <= 0;
            ap_idle     <= 1; //reset is 1; 
            data_length <= 0;
        end
        else
        begin
            // --- resetting
            /*
            if(first axis data transfer & ap_idle == 0) 
                ap_start <= 0;
            if(last Y data is calculated) ap_idle <= 1;
            */
            if((araddr[pADDR_WIDTH-1 : 0] == 12'h0) & arvalid)
                ap_done <= 0;

            // --- setting
            // if(last Y data is transfered) ap_done <= 1
            if(ap_start)
                ap_idle <= 0;
            if(pop_cfg)
                ap_start <= w_fifo_out[0];
            else if(pop_datalength)
                data_length <= w_fifo_out;
        end
    end

//*******************************************************************************************
// - tap_ram control
//  - tap_ram address : tap_addr_sel
//      - it will plus one choose tap_wr_addr or tap_rd_addr.
//          - tap_wr_addr : from axi-wr-fifo. 
//          - tap_rd_addr : [11:2] to select read address. 
//  - .EN is connect to pop_tap, when pop_tap high, it will write w_fifo_out data.
//*******************************************************************************************
    wire [pADDR_WIDTH-1 : 0] tap_wr_addr, tap_cal_addr, tap_rd_addr;
    wire [pADDR_WIDTH-1 : 0] tap_addr_sel;
    wire [pDATA_WIDTH-1 : 0] tap_data;
    wire pe_req;

    assign tap_addr_sel[pADDR_WIDTH-1 : 0] = (pop_tap) ? tap_wr_addr :  // --!!! if tap data transfer finish, but still transfer tap when ap_idle = 1, it maybe will have problem.  - JIANG
                                              (pe_req)  ? tap_cal_addr : 
                                              tap_rd_addr ;

    assign tap_wr_addr  = aw_fifo_out - 'h20;
    assign tap_rd_addr  = araddr - 'h20;


    // assign port ------------------------------
    assign tap_WE = 4'b1111;
    assign tap_EN = pop_tap;
    assign tap_Di = w_fifo_out;
    assign tap_A  = tap_addr_sel;
    assign tap_Do = tap_data;    

//*******************************************************************************************
// - axi-lite read
//  - tap_rd_data : to select tap_ram address data;
//  - rvalid    : when tap_ram is select rd(not cal and write request), data is valid.
//  - arready   : when arready is asserted , TB will reset arvalid and araddr in next cycle. 
//*******************************************************************************************
    assign rvalid   = !pe_req & !pop_tap;
    assign arready  = arvalid & rvalid;
// rready in rvalid out . ready sample valid and set valid down
    assign rdata = (araddr == 12'h0)                        ? {29'b0,ap_start,ap_done,ap_idle}   : 
                   ((araddr >= 'h10) & (araddr <= 'h14))    ?   data_length : 
                   ((araddr >= 'h20) & (araddr <= 'hFF))    ?   tap_data : 32'hFFFFFFFF;




//*******************************************************************************************
// - PE Address Generate
//*******************************************************************************************
    localparam TAPE_NUM_BIT = $clog2(Tape_Num);
    localparam DATA_RAM_NUM = 'd10;
    localparam DATA_NUM_BIT = $clog2(DATA_RAM_NUM);

    reg [TAPE_NUM_BIT-1 : 0] tap_ptr, tap_count;
    reg [DATA_NUM_BIT-1 : 0] data_ptr;
    reg [DATA_NUM_BIT-1 : 0] data_addr;
    reg pe_start;
    wire cal_on;

    always@(posedge axis_clk or negedge axis_rst_n)
    begin
        if(!axis_rst_n)
        begin
            tap_ptr     <= 0;
            tap_count   <= 0;
            data_ptr    <= 0;
            data_addr   <= 0;
            pe_start    <= 0;
        end
        else
        begin
            if(ss_tready) 
                pe_start <= 1;
            if(ap_done)
                pe_start <= 0;
            if(pe_start)
            begin
                if(ss_tready) // - final data calculate : reset data_ptr/tap_ptr, tap_count++, data_addr++
                begin
                    data_addr <= data_addr + 1;
                    data_ptr <= data_addr;  
                    if(tap_count < (Tape_Num - 1))
                        tap_count <= tap_count + 1;  
                end
                if(tap_ptr == tap_count)
                    tap_ptr <= 0;
                else
                    if(cal_on)
                        tap_ptr <= tap_ptr + 1;
                if(cal_on)
                    if(data_ptr>0)
                        data_ptr <= data_ptr -1;
                    else
                        data_ptr <= DATA_RAM_NUM - 1;
            end
            else
            begin
                tap_ptr     <= 0;
                tap_count   <= 0;
                data_ptr    <= 0;
                data_addr   <= 0;
            end
        end
    end



//*******************************************************************************************
// - write sram
//*******************************************************************************************
    wire [pADDR_WIDTH-1 : 0] data_addr_sel;
    wire [pADDR_WIDTH-1 : 0] data_wr_addr, data_rd_addr;
    reg  [pDATA_WIDTH-1  : 0] latch_final;
    
    always@(posedge axis_clk)
    begin
        latch_final <= ss_tdata;
    end
    // Set data address and latch data--------------------------------
    assign data_addr_sel    = (data_EN) ? data_wr_addr : data_rd_addr; 
    assign data_wr_addr     = data_addr << 2;
    assign data_rd_addr     = data_ptr  << 2; 

    // stream port----------------------------------------------------
    assign ss_tready        = (ss_tvalid & tap_ptr == 0);

    // data ram port--------------------------------------------------
    assign data_WE          = 4'b1111;
    assign data_EN          = ss_tready;
    assign data_Di          = latch_final; // write latch_final
    assign data_A           = data_addr_sel;

    // tap control ---------------------------------------------------
    assign tap_cal_addr     = tap_ptr << 2 ; 
    assign pe_req           = pe_start | ss_tready; 

//*******************************************************************************************
// - PE-Port  CALCULATION
//*******************************************************************************************
    wire [pDATA_WIDTH-1  : 0] mul_a,mul_b,result;
    wire x_data_sel;
    wire acc_on;
    assign cal_on       = !((tap_ptr == 0) & (ss_tready == 0));
    assign acc_on       = (tap_count > 0) & (tap_ptr != 1);
    assign x_data_sel   = !acc_on;
    assign mul_a        = (x_data_sel) ? ss_tdata : data_Do;
    assign mul_b        = tap_data;

    pe
    #(  .pDATA_WIDTH (pDATA_WIDTH),
    )   pe
    (
        .clk    (axis_clk),
        .rst_n  (axis_rst_n),
        .mul_a  (mul_a),
        .mul_b  (mul_b),
        .acc_on (acc_on),
        .cal    (cal_on),
        .result (result)
    );
/*
    localparam DATA_DEPTH = 10;
    localparam DATA_DEPTH_BIT = $clog2(DATA_DEPTH);

    // --- IDLE > UPDATE > CAL_LATCH(1) > CAL_RAM(cycles) > UPDATE(1)(stream write)
    localparam [1:0] IDLE       = 2'b00;    // -> if(pop)pop x data to x latch / calculate result to output / enter UPDATE
    localparam [1:0] CAL_LATCH  = 2'b01;    // -> pop data to x_input and calculate the mul result( tap 0 * h(wptr) )
    localparam [1:0] CAL_RAM    = 2'b11;    // -> Cal and ag
    localparam [1:0] UPDATE     = 2'b10;    // send result and and reset count -> stream to output 

    reg [pDATA_WIDTH-1 : 0]  x_input;
    reg [pDATA_WIDTH-1 : 0]  mul_result;

    reg [pDATA_WIDTH-1 : 0]  PE_output [0 : Tape_Num-1];
    reg [TAPE_NUM_BIT-1 : 0] input_count;
    reg [DATA_DEPTH_BIT-1 : 0] data_ram_wptr;
    reg [1:0] state;
    integer i;


    assign pe_req_data = (state == IDLE | state == UPDATE);
    // tap
    assign tap_rd_addr = tap_count;

    // x
    assign pe_ready = (state == IDLE) | (state == POP);




    always@(posedge axis_clk or negedge axis_rst_n)
    begin
        if(!axis_rst_n)
        begin
            state <= IDLE;
            tap_input   <= 0;
            tap_count   <= 0;
            input_count <= 0;

        end
        else 
            case(state)
            IDLE : 
            begin
                if(pop_ss_fifo)
                begin
                    state       <= UPDATE;
                    x_input     <= x_data;
                    mul_result  <= x_data * tap_data;
                    if(input_count > 0)
                        input_count <= input_count - 1; 
                end
            end
            CAL_LATCH : 
            begin
                //pop data to x_input ----------------
                x_input <= x_data;
            end
            CAL_RAM : 
            begin
                if()
                begin

                end
            end
            UPDATE : //PE Finish
            begin
                //output result ----------------
                state       <= CAL_LATCH;
                //reset PTR ----------------
                input_count <= data_ram_wptr;


                x_input <= 
            end
            endcase
    end
*/
/*
    localparam [1:0] IDLE = 2'b00;      // IDLE     : (when pop x and tap)  ----> CAL
    localparam [1:0] CAL = 2'b01;       // CAL      : (when tap_count == 0) ----> POP (when tap_count == 0 & input_count == Tape_Num) ----> FINISH
    localparam [1:0] POP = 2'b11;       // POP      : (when pop x and tap)  ----> CAL
    localparam [1:0] FINISH = 2'b10;    // FINISH   : (when Setting Ending) ----> IDLE

    reg [pDATA_WIDTH-1 : 0]  x_input,tap_input;
    reg [pDATA_WIDTH-1 : 0]  PE_output [0 : Tape_Num-1];
    reg [TAPE_NUM_BIT-1 : 0] tap_count;
    reg [TAPE_NUM_BIT-1 : 0] input_count;
    reg [1:0] state;
    integer i;

    // tap
    assign tap_rd_addr = tap_count;

    // x
    assign pe_ready = (state == IDLE) | (state == POP);




    always@(posedge axis_clk or negedge axis_rst_n)
    begin
        if(!axis_rst_n)
        begin
            state <= IDLE;
            x_input     <= 0;
            tap_input   <= 0;
            tap_count   <= Tape_Num;
            input_count <= 0;
            for(i = 0 ; i < Tape_Num ; i = i+1)
                PE_output[i]  <= 0;
        end
        else 
            case(state)
            IDLE : 
            begin
                if(pop_ss_fifo)
                begin
                    state       <= CAL;
                    x_input     <= x_data;
                    tap_input   <= tap_data;
                    input_count <= input_count + 1; // that maybe can do better to reduce gate count. --JIANG
                end
            end
            CAL : 
            begin
                if(tap_count == 0)
                begin
                    state       <= POP;
                    tap_count   <= Tape_Num - input_count; // delay 1 , so need in front of enter state.
                end
                if((tap_count == 0) & (input_count == Tape_Num - 1))
                    state       <= FINISH;

                PE_output[tap_count]    <= x_input * tap_input + PE_output[tap_count];
                tap_input               <= tap_data;
                tap_count               <= tap_count-1;
            end
            POP : 
            begin
                if(pop_ss_fifo)
                begin
                    state       <= CAL;
                    x_input     <= x_data;
                    tap_input   <= tap_data;
                    input_count <= input_count + 1; // that maybe can do better to reduce gate count. --JIANG
                end
            end
            FINISH : //PE Finish
            begin
                state <= IDLE;
            end
            endcase
    end
*/

//*******************************************************************************************
// - axi-stream read
//*******************************************************************************************

endmodule