module wb2axi #(
    parameter pADDR_WIDTH = 32,
    parameter pDATA_WIDTH = 32
)(
    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o, 
    // AXI-Stream/Lite
    //----------- AXI-Lite Interface (Read/Write Transaction) ------
    input  wire                     awready,    // address write ready
    input  wire                     wready,     // data    write ready
    output wire                     awvalid,    // address write valid
    output wire                     wvalid,     // data    write valid
    output wire [(pADDR_WIDTH-1):0] awaddr,     // address write data  => Write the Address of Coefficient
    output wire [(pDATA_WIDTH-1):0] wdata,      // data    write data  => Write the Coefficient
    input  wire                     arready,    // address read ready
    output wire                     rready,     // data    read ready
    output wire                     arvalid,    // address read valid
    input  wire                     rvalid,     // data    read valid
    output wire [(pADDR_WIDTH-1):0] araddr,     // address read data   => Send the Address of Coefficient to Read
    input  wire [(pDATA_WIDTH-1):0] rdata,      // data    read data   => Coefficient of that Address
    //------------------ AXI-Stream In X[n] ----------------------
    input  wire                     ss_tready,
    output wire                     ss_tvalid,
    output wire [(pDATA_WIDTH-1):0] ss_tdata,   // data input x[t-i]
    output wire                     ss_tlast,
    //----------------- AXI-Stream Out Y[t] ----------------------
    output wire                     sm_tready,
    input  wire                     sm_tvalid,
    input  wire [(pDATA_WIDTH-1):0] sm_tdata,   // data after calculation Y[t]
    input  wire                     sm_tlast, 
    // AXI-Stream/Lite (MM)
    //------------------ AXI-Stream In A[n*n]/B[n*n] ----------------------
    input  wire                     ss_tready_mm,
    output wire                     ss_tvalid_mm,
    output wire [(pDATA_WIDTH-1):0] ss_tdata_mm,   // data input x[t-i]
    output wire                     ss_tlast_mm,
    //----------------- AXI-Stream Out C[n*n] ----------------------
    output wire                     sm_tready_mm,
    input  wire                     sm_tvalid_mm,
    input  wire [(pDATA_WIDTH-1):0] sm_tdata_mm,   // data after calculation Y[t]
    input  wire                     sm_tlast_mm, 
    // AXI-Stream/Lite (Qsort)
    //------------------ AXI-Stream In A[n] ----------------------
    input  wire                     ss_tready_qsort,
    output wire                     ss_tvalid_qsort,
    output wire [(pDATA_WIDTH-1):0] ss_tdata_qsort,   // data input x[t-i]
    output wire                     ss_tlast_qsort,
    //----------------- AXI-Stream Out B[n] ----------------------
    output wire                     sm_tready_qsort,
    input  wire                     sm_tvalid_qsort,
    input  wire [(pDATA_WIDTH-1):0] sm_tdata_qsort,   // data after calculation Y[t]
    input  wire                     sm_tlast_qsort, 
    // Default
    output wire                     axis_clk,
    output wire                     axis_rst_n,
    // EXMEM Project
    input  wire [(pDATA_WIDTH-1):0] usr_dat_o,
    input  wire                     usr_ack_o,
    // UART Project
    input  wire [(pDATA_WIDTH-1):0] uart_dat_o,
    input  wire                     uart_ack_o
);
    wire        uart_decode;
    wire        usr_decode;
    // FIR-related flags
    wire        fir_decode; // If MPRJ_addr = 0x3000_0000
    wire        fir_strin;
    wire        fir_strout;
    // MM-related flags
    wire        mm_decode;
    wire        mm_strin;
    wire        mm_strout;
    // MM-related flags
    wire        qsort_decode;
    wire        qsort_strin;
    wire        qsort_strout;

    // AXI-Lite (FIR)
    wire        axi_w_ack; // axilite WRITE
    wire [(pDATA_WIDTH-1):0] axi_r_dat; // axilite READ data
    wire        axi_r_ack; // axilite READ 
    // AXI-Stream(FIR)
    wire        axi_s_ack; // axis
    wire [(pDATA_WIDTH-1):0] axi_m_dat; // axis data-out
    wire        axi_m_ack; // axis

    // AXI-Stream(MM)
    wire        axi_s_ack_mm; // axis
    wire [(pDATA_WIDTH-1):0] axi_m_dat_mm; // axis data-out
    wire        axi_m_ack_mm; // axis

    // AXI-Stream(Qsort)
    wire        axi_s_ack_qsort; // axis
    wire [(pDATA_WIDTH-1):0] axi_m_dat_qsort; // axis data-out
    wire        axi_m_ack_qsort; // axis
    
    // wire [(pDATA_WIDTH-1):0] usr_dat_o;
    // wire        usr_ack_o;
    
    reg         tmp_wb_ack;
    reg  [(pDATA_WIDTH-1):0] tmp_wb_dat;
    
    //====================== WB Address Decode =========================
    // User project memory starting:  0x3800_0000
    // User project FIR base address: 0x3000_0000 
    assign uart_decode = (wbs_adr_i[31:16] == 16'h3000)? 1'b1 : 1'b0;   // Send to user project memory
    assign usr_decode = (wbs_adr_i[31:16] == 16'h3800)? 1'b1 : 1'b0;    // Send to user project memory
    assign fir_decode = (wbs_adr_i[31:16] == 16'h3100)? 1'b1 : 1'b0;    // TODO: Send to FIR
    assign fir_strin  = (fir_decode && wbs_adr_i[15:0] == 16'h0080)? 1'b1 : 1'b0;
    assign fir_strout = (fir_decode && wbs_adr_i[15:0] == 16'h0084)? 1'b1 : 1'b0;
    assign mm_decode = (wbs_adr_i[31:16] == 16'h3200)? 1'b1 : 1'b0;     // TODO: Send to MM
    assign mm_strin  = (mm_decode && wbs_adr_i[15:0] == 16'h0000)? 1'b1 : 1'b0;
    assign mm_strout = (mm_decode && wbs_adr_i[15:0] == 16'h0010)? 1'b1 : 1'b0;
    assign qsort_decode = (wbs_adr_i[31:16] == 16'h3300)? 1'b1 : 1'b0;     // TODO: Send to MM
    assign qsort_strin  = (qsort_decode && wbs_adr_i[15:0] == 16'h0000)? 1'b1 : 1'b0;
    assign qsort_strout = (qsort_decode && wbs_adr_i[15:0] == 16'h0010)? 1'b1 : 1'b0;

    assign wbs_ack_o = tmp_wb_ack; // ready
    assign wbs_dat_o = tmp_wb_dat;
    
    //------------------------- WB-to-AXI ------------------------------
    // AXI WRITE 
    assign awvalid   = fir_decode && (!fir_strin) && (!fir_strout) && wbs_cyc_i && wbs_stb_i && wbs_we_i; // address valid when processing(CYC)
    assign wvalid    = fir_decode && (!fir_strin) && (!fir_strout) && wbs_cyc_i && wbs_stb_i && wbs_we_i; // data valid when strobe
    assign awaddr    = wbs_adr_i; 
    assign wdata     = wbs_dat_i;
    assign axi_w_ack = wready && wvalid;
    
    // AXI READ
    assign arvalid   = fir_decode && wbs_cyc_i && wbs_stb_i && (!wbs_we_i);
    assign rready    = fir_decode && wbs_cyc_i && wbs_stb_i && (!wbs_we_i);
    assign araddr    = wbs_adr_i;
    assign axi_r_dat = rdata;
    assign axi_r_ack = rvalid && rready;
    
    // FIR input (Stream-in)
    assign ss_tvalid = wbs_cyc_i && wbs_stb_i && fir_strin;
    assign ss_tdata  = wbs_dat_i;
    assign axi_s_ack = ss_tready;
    // FIR output (Stream-out)
    assign sm_tready = wbs_cyc_i && wbs_stb_i && fir_strout;
    assign axi_m_dat = sm_tdata;   // Y from FIR
    assign axi_m_ack = sm_tvalid;

    // MM input (Stream-in)
    assign ss_tvalid_mm = wbs_cyc_i && wbs_stb_i && mm_strin;
    assign ss_tdata_mm  = wbs_dat_i;
    assign axi_s_ack_mm = ss_tready_mm;
    // MM output (Stream-out)
    assign sm_tready_mm = wbs_cyc_i && wbs_stb_i && mm_strout;
    assign axi_m_dat_mm = sm_tdata_mm;   // Y from FIR
    assign axi_m_ack_mm = sm_tvalid_mm;

    // Qsort input (Stream-in)
    assign ss_tvalid_qsort = wbs_cyc_i && wbs_stb_i && qsort_strin;
    assign ss_tdata_qsort  = wbs_dat_i;
    assign axi_s_ack_qsort = ss_tready_qsort;
    // Qsort output (Stream-out)
    assign sm_tready_qsort = wbs_cyc_i && wbs_stb_i && qsort_strout;
    assign axi_m_dat_qsort = sm_tdata_qsort;   // Y from FIR
    assign axi_m_ack_qsort = sm_tvalid_qsort;
    
    assign axis_clk   = wb_clk_i; 
    assign axis_rst_n = ~wb_rst_i; // WB: active high AXI: active low
    
    always @* begin
        if (fir_decode) begin
            if (wbs_we_i) begin // WRITE
                if (wbs_adr_i[7:0] == 8'h80) begin // WRITE X (stream)
                    tmp_wb_ack = axi_s_ack; // ss
                    tmp_wb_dat = 32'dx;
                end
                else begin    // 0x40:TAP 0x10:data_length 0x00:ap_ctrl
                    tmp_wb_ack = axi_w_ack; // AXI 
                    tmp_wb_dat = 32'dx;
                end
            end
            else begin          // READ
                if (wbs_adr_i[7:0] == 8'h84) begin // READ Y (stream)
                    tmp_wb_ack = axi_m_ack; // sm_tvalid
                    tmp_wb_dat = axi_m_dat; // sm_tdata
                end
                else begin    // 0x40:TAP 0x00:ap_ctrl both using AXI
                    tmp_wb_ack = axi_r_ack; 
                    tmp_wb_dat = axi_r_dat;
                end
            end
        end
        else if (mm_decode) begin
            tmp_wb_ack = 1'd0;
            tmp_wb_dat = 32'dx;
            if (wbs_we_i) begin // WRITE
                if (wbs_adr_i[7:0] == 8'h00) begin // WRITE X (stream)
                    tmp_wb_ack = axi_s_ack_mm; // ss
                    tmp_wb_dat = 32'dx;
                end
                // else begin    // 0x40:TAP 0x10:data_length 0x00:ap_ctrl
                //     tmp_wb_ack = axi_w_ack; // AXI 
                //     tmp_wb_dat = 32'dx;
                // end
            end
            else begin          // READ
                if (wbs_adr_i[7:0] == 8'h10) begin // READ Y (stream)
                    tmp_wb_ack = axi_m_ack_mm; // sm_tvalid
                    tmp_wb_dat = axi_m_dat_mm; // sm_tdata
                end
                // else begin    // 0x40:TAP 0x00:ap_ctrl both using AXI
                //     tmp_wb_ack = axi_r_ack; 
                //     tmp_wb_dat = axi_r_dat;
                // end
            end
        end
        else if (qsort_decode) begin
            tmp_wb_ack = 1'd0;
            tmp_wb_dat = 32'dx;
            if (wbs_we_i) begin // WRITE
                if (wbs_adr_i[7:0] == 8'h00) begin // WRITE X (stream)
                    tmp_wb_ack = axi_s_ack_qsort; // ss
                    tmp_wb_dat = 32'dx;
                end
            end
            else begin          // READ
                if (wbs_adr_i[7:0] == 8'h10) begin // READ Y (stream)
                    tmp_wb_ack = axi_m_ack_qsort; // sm_tvalid
                    tmp_wb_dat = axi_m_dat_qsort; // sm_tdata
                end
            end
        end
        else if (uart_decode) begin
            tmp_wb_ack = uart_ack_o;
            tmp_wb_dat = uart_dat_o;
        end
        else begin
            tmp_wb_ack = usr_ack_o;
            tmp_wb_dat = usr_dat_o;
        end
    end

endmodule