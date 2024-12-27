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
    input  wire [(pDATA_WIDTH-1):0] mem_dat_o, 
    input  wire                     mem_ack_o, // same as sdram_ack_o
    // UART Project
    input  wire [(pDATA_WIDTH-1):0] uart_dat_o,
    input  wire                     uart_ack_o
);

// CPU interface signals
    // wire        dma_stb_i_cpu;
    // wire        dma_cyc_i_cpu;
    // wire        dma_we_i_cpu;
    // wire        dma_ack_o_cpu;
    // wire [3:0]  dma_sel_i_cpu;
    // wire [31:0] dma_dat_i_cpu;
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
    // wire        axi_w_ack;  // AXI write acknowledge
    // wire [31:0] axi_r_dat;  // AXI read data
    // wire        axi_r_ack;  // AXI read acknowledge
    // wire        fir_strin;  // FIR stream input control
    // wire        fir_strout; // FIR stream output control


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
        .sm_tready (sm_tready_fir),

        // axilite
        .rvalid(rvalid), // input
        .awvalid(awvalid), // output
        .wvalid(wvalid), // output
        .arvalid(arvalid), // output
        .rready(rready) // output
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
        .dma_stb_i_cpu   (cpu_stb_i),
        .dma_cyc_i_cpu   (cpu_cyc_i),
        .dma_we_i_cpu    (cpu_we_i),
        .dma_sel_i_cpu   (cpu_sel_i),
        .dma_dat_i_cpu   (wbs_dat_i),
        .dma_adr_i_cpu   (wbs_adr_i),
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
        .dma_dat_o_mm    (dma_dat_o_mm),

        .mem_dat_o (mem_dat_o),
        .mem_ack_o (mem_ack_o)
    );

    // combinational
    wire [31:0] fir_data;
    
    assign axis_clk = wb_clk_i;
    assign axis_rst_n = ~wb_rst_i;
    assign wbs_ack_o = wbs_ack_o_qs || wbs_ack_o_mm || wbs_ack_o_fir || dma_ack_o_cpu;
    assign wbs_dat_o = (wbs_adr_i[31:24] == 8'h38) ? dma_dat_o_cpu : 0; // read axilite data
    assign fir_data  = (wbs_adr_i[11: 0] == 12'h0) ? {27'd0, sm_tvalid_fir, ss_tready_fir, 1'b0, rdata[2:0]} : rdata;

    // unused
    assign ss_tlast_fir   = 0;
    assign ss_tlast_mm    = 0;
    assign ss_tlast_qsort = 0;
    
    // reg fir_decode;
    // always @(*) begin
    //     fir_decode   = (wbs_adr_i[31:16] == 16'h3100);
        // wbs_dat_o = (wbs_adr_i[31:24]==8'h38) ? dma_ack_o_cpu: rdata; // read axilite data
         // read axilite data
    // end

    // AXILITE READ WRITE
    assign awaddr    = wbs_adr_i; 
    assign araddr    = wbs_adr_i;
    assign wdata     = wbs_dat_i;
    // assign axi_w_ack = wready && wvalid;
    
    // AXI READ
    // assign axi_r_dat = rdata;
    // assign axi_r_ack = rvalid && rready;



endmodule