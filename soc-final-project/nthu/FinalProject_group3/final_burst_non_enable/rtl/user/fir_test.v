`timescale 1ns / 1ps
module fir_test 
#(  parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32,
    parameter Tape_Num    = 11
)
(   
    //--------------------------------------------------
    // Global
    input   wire                     axis_clk,
    input   wire                     axis_rst_n,
    //--------------------------------------------------
    // AXI-lite slave write
    // address write
    output  wire                     awready,
    input   wire                     awvalid,
    input   wire [(pADDR_WIDTH-1):0] awaddr,
    // data write
    output  wire                     wready,
    input   wire                     wvalid,    
    input   wire [(pDATA_WIDTH-1):0] wdata,
    //--------------------------------------------------
    // AXI-lite slave read
    // address read
    output  wire                     arready,
    input   wire                     arvalid,
    input   wire [(pADDR_WIDTH-1):0] araddr,
    // data read
    input   wire                     rready,
    output  wire                     rvalid,
    output  reg  [(pDATA_WIDTH-1):0] rdata,
    //--------------------------------------------------
    // AXI-ST slave - X
    output  wire                     ss_tready,
    input   wire                     ss_tvalid, 
    //input   wire                     ss_tlast,
    input   wire [(pDATA_WIDTH-1):0] ss_tdata,
    //--------------------------------------------------
    // AXI-ST master - Y
    input   wire                     sm_tready, 
    output  wire                     sm_tvalid,  
    output  wire                     sm_tlast, 
    output  wire [(pDATA_WIDTH-1):0] sm_tdata,
    //--------------------------------------------------
    // bram for TAP RAM
    output  wire   [3:0]             tap_WE,
    output  wire                     tap_EN,
    output  wire [(pDATA_WIDTH-1):0] tap_Di,
    output  wire [(pADDR_WIDTH-1):0] tap_A,
    input   wire [(pDATA_WIDTH-1):0] tap_Do,
    //--------------------------------------------------
    // bram for X RAM
    output  wire  [3:0]              data_WE,
    output  wire                     data_EN,
    output  wire [(pDATA_WIDTH-1):0] data_Di,
    output  wire [(pADDR_WIDTH-1):0] data_A,
    input   wire [(pDATA_WIDTH-1):0] data_Do
);
    //==================================================
    // PARAMETERS
    //==================================================
    // AXI-lite FSM
    localparam  S_IDLE = 2'd0,     // wait for adddr valid
                S_ADDR = 2'd1,     // address in
                S_DATA = 2'd2;     // data in/out 
    // FIR FSM
    localparam  FIR_WAIT = 2'd0,  // wait for ap start
                FIR_IDLE = 2'd1,  // wait X in
                FIR_PROC = 2'd2,
                FIR_DONE = 2'd3;  // Y valid
    //==================================================


    //==================================================
    // INTERNAL REG & WIRES
    //==================================================
    // FSM
    reg  [1:0] cs_w, ns_w;
    reg  [1:0] cs_r, ns_r;
    reg  [1:0] fir_cs, fir_ns;
    // AP
    reg [pADDR_WIDTH-1:0]   addr_reg;
    reg                     ap_start;
    reg                     ap_done;
    reg                     ap_idle;
    // X valid, Y ready reg
    reg                     x_ready_reg;
    reg                     y_valid_reg;
    // Data length
    reg [pDATA_WIDTH-1:0]   data_len;
    // Last input flag
    reg                     tlast_flag;
    // Tap A mux
    reg [pADDR_WIDTH-1:0]   tap_A_mux;
    // Buffer
    reg [pDATA_WIDTH-1:0]   TAP0_buf;
    reg [pDATA_WIDTH-1:0]   xt_buf;
    // RAM addr control
    reg [pADDR_WIDTH-1:0]   fir_tap_addr;
    reg [7:0]               x_addr_init;
    reg [pADDR_WIDTH-1:0]   x_addr;
    // Counter
    reg [3:0]               data_count;
    reg [3:0]               proc_count;
    // ALU
    reg [2*pDATA_WIDTH-1:0] fir_multi;
    reg [pDATA_WIDTH:0]     fir_sum;
    wire [pDATA_WIDTH-1:0]  fir_o;
    //==================================================


    //==================================================
    // AXI-lite slave write channel
    //==================================================
    // FSM
    //--------------------------------------------------
    always @(posedge axis_clk) begin
        if (!axis_rst_n)
            cs_w <= S_IDLE;
        else
            cs_w <= ns_w;
    end
    always @(*) begin
        ns_w = cs_w;
        case (cs_w)
            S_IDLE: ns_w = S_ADDR;
            S_ADDR: ns_w = (awvalid)? S_DATA : S_ADDR;
            S_DATA: ns_w = ( wvalid)? S_IDLE : S_DATA;
        endcase
    end
    //--------------------------------------------------
    assign awready = (cs_w == S_ADDR);

    assign wready = (cs_w == S_DATA);
    //==================================================


    //==================================================
    // AXI-lite slave read channel
    //==================================================
    // FSM
    //--------------------------------------------------
    always @(posedge axis_clk) begin
        if (!axis_rst_n)
            cs_r <= S_IDLE;
        else
            cs_r <= ns_r;
    end
    always @(*) begin
        ns_r = cs_r;
        case (cs_r)
            S_IDLE: ns_r = S_ADDR;
            S_ADDR: ns_r = (arvalid)? S_DATA : S_ADDR;
            S_DATA: ns_r = ( rvalid)? S_IDLE : S_DATA;
        endcase
    end
    //--------------------------------------------------
    assign arready = (cs_r == S_ADDR);

    assign rvalid = (cs_r == S_DATA);
    //--------------------------------------------------
    // Read data
    always @(*) begin
        rdata = 32'd0;
        case (addr_reg[7:4])
            4'd0:   rdata = { 27'd0, y_valid_reg, x_ready_reg, 1'b0, ap_idle, ap_done, ap_start };  // 0x00 - ap 
            4'd1:   rdata = data_len;                               // 0x10 - data_len 0x10
            4'd2:   rdata = tap_Do;                                 // 0x20 - TAP RAM 
            4'd3:   rdata = tap_Do;                                 // 0x30 - TAP RAM
            4'd4:   rdata = tap_Do;                                 // 0x40 - TAP RAM
            default: rdata = tap_Do;
        endcase
    end
    //==================================================


    //==================================================
    // TAP RAM & AP & data_len
    //==================================================

    // Note of address map:
    // 1.
    // coef address to tap bram start from 0x20 = 0010_0000 = 8'd32
    // start address >> 2 = 0000_1000 = 8'd8
    // address: 0x20 ~ 0x48 = 32 ~ 72 = 0010_0000 ~  0100_1000
    // So, we need to make the start address -8 to match the bram [0]
    // 2.
    // we need to judge whether read & write access tap bram or registers
    // 3.
    // write channel在s_data時同時取addr&data，但read channel在s_addr吃addr並在下個cycle s_data取data

    // addr register only for lite read/write
    //--------------------------------------------------
    always @(posedge axis_clk) begin
        if (!axis_rst_n)
            addr_reg <= 11'd0;
        else begin
            if (ns_w == S_DATA)   // lite read/write時紀錄addr，寫入優先
                addr_reg <= awaddr;
            else  if (ns_r == S_DATA)
                addr_reg <= araddr;
            else
                addr_reg <= addr_reg;
        end
    end

    // AP REGISTERS
    //--------------------------------------------------
    // 0x00
    // ap_reg[0]: ap_start(RW), ap_reg[1]: ap_done(RO), ap_reg[2]: ap_idle(RO)
    always @(posedge axis_clk) begin
        if (!axis_rst_n | ((fir_cs == FIR_WAIT) & (fir_ns == FIR_IDLE)))  // ap_start reset after FIR start
            ap_start <= 1'b0;
        else begin
            if ((cs_w == S_DATA) & (addr_reg[7:4] == 4'd0))               // lite write
                ap_start <=  wdata[0];
            else
                ap_start <= ap_start;
        end
    end

    always @(posedge axis_clk) begin
        if (!axis_rst_n | ((ns_r == S_IDLE) & (ap_done == 1'b1)))    // reset ap_done when ap_done == 1 is read
            ap_done <= 1'b0;
        else begin
            if ((fir_cs == FIR_DONE) & (fir_ns == FIR_WAIT))         // pull up while FIR finish all data
                ap_done <= 1'b1;
            else
                ap_done <= ap_done;
        end
    end

    always @(posedge axis_clk) begin
        if (!axis_rst_n | ((fir_cs == FIR_DONE) & (fir_ns == FIR_WAIT)))  // reset ap_idle when FIR finish
            ap_idle <= 1'b1;
        else begin
            if ((fir_cs == FIR_WAIT) & (fir_ns == FIR_IDLE))              // ap_idle reset after FIR start
                ap_idle <= 1'b0;
            else
                ap_idle <= ap_idle;
        end
    end
    // X ready reg, Y valid reg (RO)
    //--------------------------------------------------
    // reg                     x_ready_reg;
    always @(posedge axis_clk) begin
        if (!axis_rst_n)
            x_ready_reg <= 0;
        else
            x_ready_reg <= ss_tready;
    end
    // reg                     y_valid_reg;
    always @(posedge axis_clk) begin
        if (!axis_rst_n)
            y_valid_reg <= 0;
        else
            y_valid_reg <= sm_tvalid;
    end

    //--------------------------------------------------

    // DATA LENGTH
    //--------------------------------------------------
    // 0x10
    always @(posedge axis_clk) begin
        if (!axis_rst_n)
            data_len <= 32'd0;
        else begin
            if ((cs_w == S_DATA) & (addr_reg[7:4] == 4'd1))
                data_len <= wdata;
            else
                data_len <= data_len;
        end
    end
    //--------------------------------------------------
    
    // Tap RAM
    //--------------------------------------------------
    assign tap_WE = { 4{ (cs_w == S_DATA) & (addr_reg[7:4] >= 4'd2) } };

    assign tap_EN = axis_rst_n;     // reset外皆enable

    // 0x20
    // ACCESS: 1.FIR read 2.lite write 3. lite read (共用RAM ADDR port但不會同時access)
    assign tap_A = tap_A_mux;
    
    always @(*) begin
        tap_A_mux = 12'd0;
        if (fir_ns == FIR_PROC)
            tap_A_mux = fir_tap_addr >> 2;
        else if (cs_w == S_DATA)
            tap_A_mux = (addr_reg - 8'h20) >> 2;
        else
            tap_A_mux = (araddr - 8'h20) >> 2;
    end

    // Tap RAM data input
    assign tap_Di = wdata;
    //==================================================
    

    //==================================================
    // FIR & X RAM
    //==================================================
    // FSM
    //--------------------------------------------------
    always @(posedge axis_clk) begin
        if (!axis_rst_n)
            fir_cs <= FIR_WAIT;
        else
            fir_cs <= fir_ns;
    end
    always @(*) begin
        fir_ns = fir_cs;
        case (fir_cs)
        FIR_WAIT: fir_ns = (ap_start)? FIR_IDLE : FIR_WAIT; 
        FIR_IDLE: fir_ns = (ss_tvalid)? FIR_PROC : FIR_IDLE;
        FIR_PROC: fir_ns = (proc_count == (data_count - 1'b1))? FIR_DONE : FIR_PROC;
        FIR_DONE: fir_ns = (sm_tready)? ((last_count==data_len)? FIR_WAIT: FIR_IDLE) : FIR_DONE;
        endcase
    end
    //--------------------------------------------------

    // AXI-streaming slave - X
    //--------------------------------------------------
    assign ss_tready = (~axis_rst_n)? 1'b0 : (fir_cs == FIR_IDLE);
    //--------------------------------------------------

    // AXI-streaming master - Y
    //--------------------------------------------------
    assign sm_tvalid = (fir_cs == FIR_DONE);

    assign sm_tlast  = (fir_cs == FIR_DONE) & (fir_ns == FIR_WAIT);

    assign sm_tdata  = fir_o;
    //--------------------------------------------------

     reg  [pDATA_WIDTH-1:0] last_count;
    always @(posedge axis_clk) begin
        if (!axis_rst_n | (fir_cs == FIR_WAIT))  begin   // reset while FIR wait
            last_count <= 1'b0;
        end
        else begin
            if ((fir_cs == FIR_IDLE) & (fir_ns == FIR_PROC)) begin
                last_count <= last_count+32'h1;
            end
            else begin
                last_count <= last_count;
            end
        end
    end






    // Last data flag
    /*always @(posedge axis_clk) begin
        if (!axis_rst_n | (fir_cs == FIR_WAIT))     // reset while FIR wait
            tlast_flag <= 1'b0;
        else begin
            if ((fir_cs == FIR_IDLE) & (fir_ns == FIR_PROC) & ss_tlast)
                tlast_flag <= 1'b1;
            else
                tlast_flag <= tlast_flag;
        end
    end*/

    // TAP0 buffer
    // Xt * h0 while S_IDLE -> S_PROC
    always @(posedge axis_clk) begin
        if (!axis_rst_n)
            TAP0_buf <= 32'd0;
        else begin
            if ((cs_w == S_DATA) & (addr_reg[7:0] == 8'h20))
                TAP0_buf <= wdata;
            else
                TAP0_buf <= TAP0_buf;
        end
    end

    // Xt buffer
    // Save Xt & Write into X RAM while last S_PROC
    always @(posedge axis_clk) begin
        if (!axis_rst_n)
            xt_buf <= 32'd0;
        else begin
            if (fir_cs == FIR_IDLE)
                xt_buf <= ss_tdata;
            else
                xt_buf <= xt_buf;
        end
    end
    
    // FIR RAM addr control
    //--------------------------------------------------

    // Tap RAM addr control
    // repeat 0x24 - 0x48 every process iteration
    always @(posedge axis_clk) begin
        if (!axis_rst_n)
            fir_tap_addr <= 12'h004;                // reset to TAP RAM[1]
        else if (fir_ns == FIR_PROC)
            fir_tap_addr <= fir_tap_addr + 4'h4;    // TAP RAM index + 1
        else
            fir_tap_addr <= 12'h004;                // reset to TAP RAM[1]
    end

    // X initial address indicator
    always @(posedge axis_clk) begin
        if (!axis_rst_n | (fir_cs == FIR_WAIT))     // reset while X RAM[10] & FIR_WAIT
            x_addr_init <= 8'h00;                   // reset to X RAM[0]
        else if (fir_ns == FIR_DONE && fir_cs == FIR_PROC) begin
            if (x_addr_init == 8'h28)
                x_addr_init <= 8'h00;
            else
                x_addr_init <= x_addr_init + 4'h4;  // init X RAM index +1 while last FIR_PROC
        end
        else
            x_addr_init <= x_addr_init; 
    end

    // X RAM addr control
    always @(posedge axis_clk) begin
        if (!axis_rst_n | (fir_cs == FIR_WAIT))
            x_addr <= 12'h000;
        else if (fir_cs == FIR_DONE) begin   // get new initial address while FIR DONE
            if (x_addr_init == 8'h00)
                x_addr <= 12'h028;          // 
            else
                x_addr <= x_addr_init - 4'h4;          
        end
        else if (fir_ns == FIR_PROC) begin
            if (x_addr == 12'h000)
                x_addr <= 12'h028;          // X RAM[0] -> X RAM[10]
            else
                x_addr <= x_addr - 4'h4;    // X RAM index - 1
        end
        else
            x_addr <= x_addr;
    end
    //--------------------------------------------------

    // X RAM
    //--------------------------------------------------
    assign data_WE = { 4{fir_ns == FIR_DONE & fir_cs == FIR_PROC}};                                  // Write Xt into X RAM while last FIR_PROC
    
    assign data_EN = axis_rst_n;

    assign data_A = (fir_ns == FIR_DONE)?  { 4'd0, (x_addr_init >> 2) } : (x_addr >> 2);      // Write Xt into X RAM while last FIR_PROC
    
    assign data_Di = xt_buf;
    //--------------------------------------------------

    // Data input count
    always @(posedge axis_clk) begin
        if (!axis_rst_n | (fir_cs == FIR_WAIT))
            data_count <= 4'd0;
        else if ((fir_cs == FIR_IDLE) & (fir_ns == FIR_PROC)) begin     // X handshake then +1, until count == 11
            if (data_count < 11)
                data_count <= data_count + 1'b1;
            else
                data_count <= data_count;
            end
        else
            data_count <= data_count;
    end

    // Proc count 0~11
    always @(posedge axis_clk) begin
        if (!axis_rst_n | (fir_cs == FIR_WAIT))
            proc_count <= 4'd0;
        else begin
            if (fir_cs == FIR_PROC)
                proc_count <= proc_count + 1'b1;
            else
                proc_count <= 4'd0;
        end        
    end
    //==================================================


    //==================================================
    // FIR ALU
    //==================================================
    // Multi (width: 64)
    always @(posedge axis_clk) begin
        if (!axis_rst_n)
            fir_multi <= 64'd0;
        else begin
            if (fir_cs == FIR_IDLE)
                fir_multi <= ss_tdata * TAP0_buf;   // Xt*h0
            else
                fir_multi <= data_Do * tap_Do;      //Xt-1*h1 ~
        end
    end
    // Sum (width: 33)
    always @(posedge axis_clk) begin
        if (!axis_rst_n)
            fir_sum <= 33'd0;
        else begin
            case(fir_cs)
                FIR_PROC: fir_sum <= fir_multi[31:0] + fir_sum[31:0];   // Only receive data while FIR processing
                FIR_DONE: fir_sum <= fir_sum;
                default: fir_sum <= 33'd0;                              // Other states: sum = 0
            endcase
        end
    end

    // FIR output
    assign fir_o = fir_sum[31:0];
    //==================================================


endmodule
