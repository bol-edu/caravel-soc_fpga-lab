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
    wire cal_start; 
    wire data_wr_en;

    assign pop_cfg          = pop_axi_fifo & (aw_fifo_out == 12'h0) & ap_idle;
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
            if(cal_start)
            begin
                if(data_wr_en) 
                    data_length <= data_length - 1; //1105 ----JIANG
                if(ss_tready) 
                    ap_start <= 0;
                if(data_length == 0 & sm_tready)
                    ap_done <= 1;
                if(data_length == 0)
                    ap_idle <= 1;
            end
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

    assign tap_addr_sel = (pop_tap) ? tap_wr_addr :  tap_rd_addr;// --!!! if tap data transfer finish, but still transfer tap when ap_idle = 1, it maybe will have problem.  - JIANG

    assign tap_wr_addr  = aw_fifo_out - 'h40;
    assign tap_rd_addr  = ((araddr >= 'h20) & (araddr <= 'hFF) & arready) ? (araddr - 'h20) : tap_cal_addr << 2;


    // assign port ------------------------------
    assign tap_WE   = {4{pop_tap}};
    assign tap_EN   = 1;
    assign tap_Di   = w_fifo_out;
    assign tap_A    = tap_addr_sel;
    assign tap_data = tap_Do;    

//*******************************************************************************************
// - axi-lite read
//  - tap_rd_data : to select tap_ram address data;
//  - rvalid    : when tap_ram is select rd(not cal and write request), data is valid.
//  - arready   : when arready is asserted , TB will reset arvalid and araddr in next cycle. 
//*******************************************************************************************
    reg arvalid_d1;
    assign arready   = !pe_req & !pop_tap;
    assign rvalid = ((araddr >= 'h20) & (araddr <= 'hFF)) ? (arvalid_d1 & arready) : (arvalid & arready);
// rready in rvalid out . ready sample valid and set valid down
    assign rdata = (araddr == 12'h0)                        ? {29'b0,ap_done,ap_idle,ap_start}   : 
                   ((araddr >= 'h10) & (araddr <= 'h14))    ?   data_length : 
                   ((araddr >= 'h20) & (araddr <= 'hFF))    ?   tap_data : 32'hFFFFFFFF;


    always@(posedge axis_clk)
    begin
        arvalid_d1 <= arvalid;
    end

//*******************************************************************************************
// - PE Address Generate
//*******************************************************************************************
    localparam TAPE_NUM_BIT = $clog2(Tape_Num);
    localparam DATA_RAM_NUM = 'd10;
    localparam DATA_NUM_BIT = $clog2(DATA_RAM_NUM);
    localparam CAL  = 'b0;
    localparam WAIT = 'b1;

    reg [TAPE_NUM_BIT-1 : 0] tap_ptr, tap_count;
    reg [DATA_NUM_BIT-1 : 0] data_ptr;
    reg [DATA_NUM_BIT-1 : 0] data_addr;
    reg pe_start_reg, state;


    assign cal_start    = !ap_idle | ss_tready;
    assign ss_tready    = (state)                     ? ss_tvalid & !sm_full   : (tap_ptr == 1 & ss_tvalid & !sm_full) | (tap_count == 0 & ss_tvalid & pe_start_reg);
    assign tap_cal_addr = (state)                     ? ss_tready   :
                          (tap_ptr == 1 & (!ss_tvalid | sm_full)) ? 0           : tap_ptr;
                          
    always@(posedge axis_clk or negedge axis_rst_n)
    begin
        if(!axis_rst_n | ap_done)
        begin
            state       <= CAL;
            tap_ptr     <= 0;
            tap_count   <= 0;
            data_ptr    <= 0;
        end
        else
        begin
            if(state == CAL)
            begin
                //************************CAL STATE TRANSITION**********************
                if(tap_ptr == 1 & (!ss_tvalid | sm_full))
                begin 
                    state <= WAIT;
                    tap_ptr <= 0;
                end
                //************************CAL STATE**********************
                else
                begin
                    if(cal_start)
                    begin
                        if(tap_ptr == tap_count)
                        begin
                            if(tap_count < (Tape_Num-1))
                                if(tap_count == 0)
                                    if(ss_tready)
                                        tap_count <= tap_count + 1;
                                    else
                                        tap_count <= 0;
                                else
                                    tap_count   <= tap_count + 1;
                            tap_ptr     <= 0;
                        end
                        else
                        begin
                            tap_ptr <= tap_ptr + 1;
                        end
                        if(tap_count < 2)
                            data_ptr <= 0;
                        else if(data_wr_en)
                            data_ptr <= data_addr;
                        else
                            if(data_ptr == 0) 
                                data_ptr <= (DATA_RAM_NUM - 1);
                            else
                                data_ptr <= data_ptr - 1; 
                    end
                end
            end
            if(state == WAIT)
            begin
                //************************WAIT STATE TRANSITION**********************
                if(ss_tready & !sm_full)
                begin
                    state <= CAL;
                    if(tap_count == 1)
                    begin
                        tap_count <= tap_count + 1;
                        tap_ptr <= 0; // --------!!!!!!
                    end
                    else
                    begin
                        tap_ptr <= 2;
                    end
                    if(data_ptr == 0) 
                        data_ptr <= (DATA_RAM_NUM - 1);
                    else
                        data_ptr <= data_ptr - 1;
                end
                //************************WAIT STATE*********************
                else
                begin
                end
            end
        end
    end


    always@(posedge axis_clk or negedge axis_rst_n)
    begin
        if(!axis_rst_n)
        begin
            pe_start_reg    <= 0;
        end
        else
        begin
            if(ap_start)
                pe_start_reg    <=  1;
            else if(ap_done)
                pe_start_reg    <=  0;
        end
    end


    always@(posedge axis_clk or negedge axis_rst_n)
    begin
        if(!axis_rst_n | ap_idle)
        begin
            data_addr    <= 0;
        end
        else
        begin
            if(data_wr_en)
                if(data_addr < (DATA_RAM_NUM - 1))
                    data_addr <= data_addr + 1;
                else
                    data_addr <= 0;
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
        if(ss_tready)
            latch_final <= ss_tdata;
    end
    // Set data address and latch data--------------------------------
    assign data_addr_sel    = (data_wr_en) ? data_wr_addr : data_rd_addr; 
    assign data_wr_addr     = data_addr << 2;
    assign data_rd_addr     = data_ptr  << 2; 

    // data ram port--------------------------------------------------
    assign data_EN          = 1; //--- !!! data gate.
    assign data_WE          = {4{data_wr_en}};
    assign data_wr_en       =   (state)          ? 0 :
                                (tap_count == 0) ? ss_tready : 
                                (tap_count == 1) ? 0 :  (tap_ptr == 0);
    assign data_Di          = (tap_count == 0) ? ss_tdata:latch_final; // write latch_final
    assign data_A           = data_addr_sel;

    // tap control ---------------------------------------------------
    assign pe_req           = cal_start; 

//*******************************************************************************************
// - PE-Port  CALCULATION
//*******************************************************************************************
    wire [pDATA_WIDTH-1  : 0] mul_a,mul_b,result;
    wire ss_data_sel;
    wire acc_on,cal_on;
    reg  cal_latch;

    assign mul_a = (ss_tready) ? ss_tdata : data_Do;
    assign mul_b = tap_Do;
    assign cal_on = cal_latch | ss_tready;
    assign acc_on = !ss_tready;

// cal signal maybe can solve the tap_count == 0 special case to reduce gate count  ----JIANG
    always@(posedge axis_clk)
    begin
        if(tap_cal_addr == 0) 
            cal_latch <= 0;
        else if(ss_tready) 
            cal_latch <= 1;
    end

    pe
    #(  .pDATA_WIDTH (pDATA_WIDTH)
    )   pe
    (
        .clk    (axis_clk),
        .rst_n  (axis_rst_n),
        .mul_a  (mul_a),
        .mul_b  (mul_b),
        .acc_on (acc_on),
        .cal    (cal_on),
        .last   (data_wr_en),
        .result (result)
    );

//*******************************************************************************************
// - axi-stream read
//*******************************************************************************************
// - data_en to latch result
    wire sm_full,sm_empty;
    wire[pDATA_WIDTH-1  : 0] sm_fifo_data;
    assign sm_tvalid = !sm_empty;
    assign sm_tlast  = (data_length == 0);
    assign sm_tdata  = sm_fifo_data;

    fifo
    #(  
        .WIDTH      (pDATA_WIDTH),
        .DEPTH      (3)
    )   sm_fifo
    (
        .clk         (axis_clk),
        .rst_n       (axis_rst_n),
        .pre_full    (sm_full),
        .pre_empty   (sm_empty),
        .w_valid     (data_wr_en),
        .r_ready     (sm_tready & sm_tvalid),
        .data_in     (result),
        .data_out    (sm_fifo_data)
    );


endmodule