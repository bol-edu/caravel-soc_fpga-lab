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
    // Default
    output wire                     axis_clk,
    output wire                     axis_rst_n,
    // User Project
    input  wire [(pDATA_WIDTH-1):0] usr_dat_o,
    input  wire                     usr_ack_o
);
    // FIR-related flags
    wire        fir_decode; // If MPRJ_addr = 0x3000_0000
    wire        fir_strin;
    wire        fir_strout;
    
    // WB-to-AXI
    wire        axi_w_ack; // axilite WRITE
    wire [(pDATA_WIDTH-1):0] axi_r_dat; // axilite READ data
    wire        axi_r_ack; // axilite READ 
    wire        axi_s_ack; // axis
    wire [(pDATA_WIDTH-1):0] axi_m_dat; // axis data-out
    wire        axi_m_ack; // axis
    
    // wire [(pDATA_WIDTH-1):0] usr_dat_o;
    // wire        usr_ack_o;
    
    reg         tmp_wb_ack;
    reg  [(pDATA_WIDTH-1):0] tmp_wb_dat;
    
    //====================== WB Address Decode =========================
    // User project memory starting:  0x3800_0000
    // User project FIR base address: 0x3000_0000 
    // assign usr_decode = (wbs_adr_i[31:16] == 16'h3800)? 1'b1 : 1'b0; // Send to user project memory
    assign fir_decode = (wbs_adr_i[31:16] == 16'h3000)? 1'b1 : 1'b0; // Send to FIR
    assign fir_strin  = (fir_decode && wbs_adr_i[15:0] == 16'h0080)? 1'b1 : 1'b0;
    assign fir_strout = (fir_decode && wbs_adr_i[15:0] == 16'h0084)? 1'b1 : 1'b0;
    
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
    
    // Input FIR (Stream-in)
    assign ss_tvalid = wbs_cyc_i && wbs_stb_i && fir_strin;
    assign ss_tdata  = wbs_dat_i;
    assign axi_s_ack = ss_tready;
    
    // FIR output (Stream-out)
    assign sm_tready = wbs_cyc_i && wbs_stb_i && fir_strout;
    assign axi_m_dat = sm_tdata;   // Y from FIR
    assign axi_m_ack = sm_tvalid;
    
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
        else begin
            tmp_wb_ack = usr_ack_o;
            tmp_wb_dat = usr_dat_o;
        end
    end

endmodule