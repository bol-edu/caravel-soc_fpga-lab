// This is a DMA module.

module dma #(
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
    output reg [31:0] wbs_dat_o, 
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
    input  wire                     ss_tready_fir,
    output wire                     ss_tvalid_fir,
    output wire [(pDATA_WIDTH-1):0] ss_tdata_fir,   // data input x[t-i]
    output wire                     ss_tlast_fir,
    //----------------- AXI-Stream Out Y[t] ----------------------
    output wire                     sm_tready_fir,
    input  wire                     sm_tvalid_fir,
    input  wire [(pDATA_WIDTH-1):0] sm_tdata_fir,   // data after calculation Y[t]
    input  wire                     sm_tlast_fir, 
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

    // CPU interface signals
    wire        dma_stb_i_cpu;
    wire        dma_cyc_i_cpu;
    wire        dma_we_i_cpu;
    wire        dma_ack_o_cpu;
    wire [3:0]  dma_sel_i_cpu;
    wire [31:0] dma_dat_i_cpu;
    wire [31:0] dma_adr_i_cpu;
    wire [31:0] dma_dat_o_cpu;

    // Reference ports for FIR DMA
    wire        wbs_ack_o_fir;
    wire [31:0] wbs_dat_o_fir;
    wire        dma_ack_o_fir;
    wire        dma_stb_i_fir;
    wire        dma_cyc_i_fir;
    wire        dma_we_i_fir;
    wire [ 3:0] dma_sel_i_fir;
    wire [31:0] dma_dat_i_fir;
    wire [31:0] dma_adr_i_fir;
    wire [31:0] dma_dat_o_fir;

    // Reference ports for MM DMA
    wire        wbs_ack_o_mm;
    wire [31:0] wbs_dat_o_mm;
    wire        dma_ack_o_mm;
    wire        dma_stb_i_mm;
    wire        dma_cyc_i_mm;
    wire        dma_we_i_mm;
    wire [ 3:0] dma_sel_i_mm;
    wire [31:0] dma_dat_i_mm;
    wire [31:0] dma_adr_i_mm;
    wire [31:0] dma_dat_o_mm;

    // Reference ports for Qsort DMA
    wire        wbs_ack_o_qs;
    wire [31:0] wbs_dat_o_qs;
    wire        dma_ack_o_qs;
    wire        dma_stb_i_qs;
    wire        dma_cyc_i_qs;
    wire        dma_we_i_qs;
    wire [ 3:0] dma_sel_i_qs;
    wire [31:0] dma_dat_i_qs;
    wire [31:0] dma_adr_i_qs;
    wire [31:0] dma_dat_o_qs;

    // others
    wire        axi_w_ack;  // AXI write acknowledge
    wire [31:0] axi_r_dat;  // AXI read data
    wire        axi_r_ack;  // AXI read acknowledge
    wire        fir_strin;  // FIR stream input control
    wire        fir_strout; // FIR stream output control


    // engine's wb address is different from cpu's wb address => should be seperate
    wire eng_cyc_i, eng_stb_i, eng_we_i, cpu_cyc_i, cpu_stb_i, cpu_we_i;
    wire [3:0] eng_sel_i, cpu_sel_i;
    assign eng_stb_i = wbs_stb_i & (wbs_adr_i[31:24]==8'h30);
    assign eng_cyc_i = wbs_cyc_i & (wbs_adr_i[31:24]==8'h30);
    assign eng_we_i  = wbs_we_i  & (wbs_adr_i[31:24]==8'h30);
    assign eng_sel_i = wbs_sel_i & {4{(wbs_adr_i[31:24]==8'h30)}};

    assign cpu_stb_i = wbs_stb_i & (wbs_adr_i[31:24]==8'h38);
    assign cpu_cyc_i = wbs_cyc_i & (wbs_adr_i[31:24]==8'h38);
    assign cpu_we_i  = wbs_we_i  & (wbs_adr_i[31:24]==8'h38);
    assign cpu_sel_i = wbs_sel_i & {4{(wbs_adr_i[31:24]==8'h38)}};


    // references definitation
    // Qsort
    qs_DMA qs_dma(
        .wb_clk_i  (wb_clk_i),
        .wb_rst_i  (wb_rst_i),
        .wbs_stb_i (eng_stb_i),
        .wbs_cyc_i (eng_cyc_i),
        .wbs_we_i  (eng_we_i),
        .wbs_sel_i (eng_sel_i),
        .wbs_dat_i (wbs_dat_i),
        .wbs_adr_i (wbs_adr_i),
        .wbs_ack_o (wbs_ack_o_qs),
        .wbs_dat_o (wbs_dat_o_qs),
        .dma_stb_i (dma_stb_i_qs),
        .dma_cyc_i (dma_cyc_i_qs),
        .dma_we_i  (dma_we_i_qs),
        .dma_sel_i (dma_sel_i_qs),
        .dma_dat_i (dma_dat_i_qs),
        .dma_adr_i (dma_adr_i_qs),
        .dma_ack_o (dma_ack_o_qs),
        .dma_dat_o (dma_dat_o_qs),
        
        // stream
        .sm_tvalid (sm_tvalid_qsort),
        .sm_tdata  (sm_tdata_qsort),
        .ss_tready (ss_tready_qsort),
        .ss_tvalid (ss_tvalid_qsort),
        .ss_tdata  (ss_tdata_qsort),
        .sm_tready (sm_tready_qsort)
    );

    // MM DMA instance
    mm_DMA mm_dma(
        .wb_clk_i (wb_clk_i),
        .wb_rst_i (wb_rst_i),
        .wbs_stb_i(eng_stb_i),
        .wbs_cyc_i(eng_cyc_i), 
        .wbs_we_i (eng_we_i),
        .wbs_sel_i(eng_sel_i),
        .wbs_dat_i(wbs_dat_i),
        .wbs_adr_i(wbs_adr_i),
        .wbs_ack_o(wbs_ack_o_mm),
        .wbs_dat_o(wbs_dat_o_mm),
        .dma_stb_i(dma_stb_i_mm),
        .dma_cyc_i(dma_cyc_i_mm),
        .dma_we_i (dma_we_i_mm),
        .dma_sel_i(dma_sel_i_mm),
        .dma_dat_i(dma_dat_i_mm),
        .dma_adr_i(dma_adr_i_mm),
        .dma_ack_o(dma_ack_o_mm),
        .dma_dat_o(dma_dat_o_mm),
        
        // stream
        .sm_tvalid (sm_tvalid_mm),
        .sm_tdata  (sm_tdata_mm),
        .ss_tready (ss_tready_mm),
        .ss_tvalid (ss_tvalid_mm),
        .ss_tdata  (ss_tdata_mm),
        .sm_tready (sm_tready_mm)
    );

    // FIR DMA instance
    fir_DMA fir_dma(
        .wb_clk_i  (wb_clk_i),
        .wb_rst_i  (wb_rst_i),
        .wbs_stb_i (eng_stb_i),
        .wbs_cyc_i (eng_cyc_i),
        .wbs_we_i  (eng_we_i),
        .wbs_sel_i (eng_sel_i),
        .wbs_dat_i (wbs_dat_i),
        .wbs_adr_i (wbs_adr_i),
        .wbs_ack_o (wbs_ack_o_fir),
        .wbs_dat_o (wbs_dat_o_fir),
        .dma_stb_i (dma_stb_i_fir),
        .dma_cyc_i (dma_cyc_i_fir),
        .dma_we_i  (dma_we_i_fir),
        .dma_sel_i (dma_sel_i_fir),
        .dma_dat_i (dma_dat_i_fir),
        .dma_adr_i (dma_adr_i_fir),
        .dma_ack_o (dma_ack_o_fir),
        .dma_dat_o (dma_dat_o_fir),
    
        // stream
        .sm_tvalid (sm_tvalid_fir),
        .sm_tdata  (sm_tdata_fir),
        .ss_tready (ss_tready_fir),
        .ss_tvalid (ss_tvalid_fir),
        .ss_tdata  (ss_tdata_fir),
        .sm_tready (sm_tready_fir)
    );

    cpu_DMA cpu_dma(
        .wbs_clk_i (wb_clk_i),
        .wbs_rst_i (wb_rst_i),
        .wbs_stb_i (cpu_stb_i),
        .wbs_cyc_i (cpu_cyc_i),
        .wbs_we_i  (cpu_we_i),
        .wbs_sel_i (cpu_sel_i),
        .wbs_dat_i (wbs_dat_i),
        .wbs_adr_i (wbs_adr_i),
        .dma_stb_cpu (dma_stb_i_cpu),
        .dma_cyc_cpu (dma_cyc_i_cpu),
        .dma_we_cpu  (dma_we_i_cpu),
        .dma_sel_cpu (dma_sel_i_cpu),
        .dma_adr_cpu (dma_adr_i_cpu),
        .dma_dat_cpu (dma_dat_o_cpu)
    );

    arbiter arbiter(
        .clk         (wb_clk_i),
        .rst         (wb_rst_i),

        // Decoder 30000
        .wbs_stb_i   (wbs_stb_i),
        .wbs_cyc_i   (wbs_cyc_i),
        .wbs_we_i    (wbs_we_i),
        .wbs_sel_i   (wbs_sel_i),
        .wbs_dat_i   (wbs_dat_i),
        .wbs_adr_i   (wbs_adr_i),
            
        // Decoder 3800
        .dma_stb_i_cpu   (dma_stb_i_cpu),
        .dma_cyc_i_cpu   (dma_cyc_i_cpu),
        .dma_we_i_cpu    (dma_we_i_cpu ),
        .dma_sel_i_cpu   (dma_sel_i_cpu),
        .dma_dat_i_cpu   (dma_dat_i_cpu),
        .dma_adr_i_cpu   (dma_adr_i_cpu),
        .dma_ack_o_cpu   (dma_ack_o_cpu),
        .dma_dat_o_cpu   (dma_dat_o_cpu),

        // FIR
        .dma_stb_i_fir   (dma_stb_i_fir),
        .dma_cyc_i_fir   (dma_cyc_i_fir),
        .dma_we_i_fir    (dma_we_i_fir ),
        .dma_sel_i_fir   (dma_sel_i_fir),
        .dma_dat_i_fir   (dma_dat_i_fir),
        .dma_adr_i_fir   (dma_adr_i_fir),
        .dma_ack_o_fir   (dma_ack_o_fir),
        .dma_dat_o_fir   (dma_dat_o_fir),

        // Qsort
        .dma_stb_i_qsort (dma_stb_i_qs),
        .dma_cyc_i_qsort (dma_cyc_i_qs),
        .dma_we_i_qsort  (dma_we_i_qs ),
        .dma_sel_i_qsort (dma_sel_i_qs),
        .dma_dat_i_qsort (dma_dat_i_qs),
        .dma_adr_i_qsort (dma_adr_i_qs),
        .dma_ack_o_qsort (dma_ack_o_qs),
        .dma_dat_o_qsort (dma_dat_o_qs),
        
        // MM
        .dma_stb_i_mm    (dma_stb_i_mm),
        .dma_cyc_i_mm    (dma_cyc_i_mm),
        .dma_we_i_mm     (dma_we_i_mm ),
        .dma_sel_i_mm    (dma_sel_i_mm),
        .dma_dat_i_mm    (dma_dat_i_mm),
        .dma_adr_i_mm    (dma_adr_i_mm),
        .dma_ack_o_mm    (dma_ack_o_mm),
        .dma_dat_o_mm    (dma_dat_o_mm)
    );

    // combinational
    assign axis_clk = wb_clk_i;
    assign axis_rst_n = ~wb_rst_i;
    assign wbs_ack_o = wbs_ack_o_qs || wbs_ack_o_mm || wbs_ack_o_fir || dma_ack_o_cpu;


    // unused
    assign ss_tlast_fir   = 0;
    assign ss_tlast_mm    = 0;
    assign ss_tlast_qsort = 0;
    
    reg fir_decode, mm_decode, qsort_decode, uart_decode, usr_decode;
    always @(*) begin
        fir_decode   = (wbs_adr_i[31:16] == 16'h3100);
        mm_decode    = (wbs_adr_i[31:16] == 16'h3200);
        qsort_decode = (wbs_adr_i[31:16] == 16'h3300);
        uart_decode  = (wbs_adr_i[31:16] == 16'h3000);
        usr_decode   = (wbs_adr_i[31:16] == 16'h3800);
        
        if (fir_decode) begin
            if (!wbs_we_i && wbs_adr_i[7:0] == 8'h84)
                wbs_dat_o = sm_tdata_fir;
            else if (!wbs_we_i)
                wbs_dat_o = rdata;
            else
                wbs_dat_o = 32'bx;
        end
        else if (mm_decode) begin
            if (!wbs_we_i && wbs_adr_i[7:0] == 8'h10) begin
                wbs_dat_o = sm_tdata_mm;
            end else begin
                wbs_dat_o = 32'bx;
            end
        end
        else if (qsort_decode) begin
            if (!wbs_we_i && wbs_adr_i[7:0] == 8'h10)
                wbs_dat_o = sm_tdata_qsort;
            else
                wbs_dat_o = 32'bx;
        end
        else if (uart_decode)
            wbs_dat_o = uart_dat_o;
        else 
            wbs_dat_o = usr_dat_o;
    end
    // wbs_dat_o_qs ?

    // AXILITE READ WRITE
    // assign fir_decode = wbs_adr_i[31:16] == 16'h3100;
    assign fir_strin  = (fir_decode && wbs_adr_i[15:0] == 16'h0080);
    assign fir_strout = (fir_decode && wbs_adr_i[15:0] == 16'h0084);
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



endmodule