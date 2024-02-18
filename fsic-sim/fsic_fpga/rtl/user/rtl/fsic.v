//////////////////////////////////////////////////////////////////////////////////
// Author : Tony Ho
//
// Create Date: 11/17/2023
// Design Name:
// Module Name: FSIC
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module FSIC #( 
    parameter BITS=32,
    parameter pUSER_PROJECT_SIDEBAND_WIDTH   = 5,
    `ifdef USER_PROJECT_SIDEBAND_SUPPORT
      parameter pSERIALIO_WIDTH   = 13,
    `else
      parameter pSERIALIO_WIDTH   = 12,
    `endif    
    parameter pADDR_WIDTH   = 15,
    parameter pDATA_WIDTH   = 32,
    parameter pRxFIFO_DEPTH = 5,
    parameter pCLK_RATIO =4
  ) (
  input  wire          wb_rst,
  input  wire          wb_clk,
  input  wire  [31: 0] wbs_adr,
  input  wire  [31: 0] wbs_wdata,
  input  wire   [3: 0] wbs_sel,
  input  wire          wbs_cyc,
  input  wire          wbs_stb,
  input  wire          wbs_we,
  input  wire  [37: 0] io_in,
`ifdef USE_POWER_PINS
  input  wire          vccd1,
  input  wire          vccd2,
  input  wire          vssd1,
  input  wire          vssd2,
`endif //USE_POWER_PINS  
  output wire          wbs_ack,
  output wire  [31: 0] wbs_rdata,
  output wire   [2: 0] user_irq,
  output wire  [37: 0] io_out,
  output wire  [37: 0] io_oeb,
  input  wire          user_clock2
);


wire           m_awvalid_aa_cfg_awvalid;
wire   [31: 0] m_awaddr_aa_cfg_awaddr;
wire           m_wvalid_aa_cfg_wvalid;
wire   [31: 0] m_wdata_aa_cfg_wdata;
wire    [3: 0] m_wstrb_aa_cfg_wstrb;
wire           m_arvalid_aa_cfg_arvalid;
wire   [31: 0] m_araddr_aa_cfg_araddr;
wire           m_rready_aa_cfg_rready;
wire           s_wready_axi_wready1;
wire           s_awready_axi_awready1;
wire           s_arready_axi_arready1;
wire   [31: 0] s_rdata_axi_rdata1;
wire           s_rvalid_axi_rvalid1;
wire           axi_awready_axi_awready4;
wire           axi_wready_axi_wready4;
wire           axi_arready_axi_arready4;
wire   [31: 0] axi_rdata_axi_rdata4;
wire           axi_rvalid_axi_rvalid4;
wire           axi_awready_axi_awready3;
wire           axi_wready_axi_wready3;
wire           axi_arready_axi_arready3;
wire   [31: 0] axi_rdata_axi_rdata3;
wire           axi_rvalid_axi_rvalid3;
wire           axi_awready_axi_awready0;
wire           axi_wready_axi_wready0;
wire           axi_arready_axi_arready0;
wire   [31: 0] axi_rdata_axi_rdata0;
wire           axi_rvalid_axi_rvalid0;
wire           axi_awready_axi_awready2;
wire           axi_wready_axi_wready2;
wire           axi_arready_axi_arready2;
wire   [31: 0] axi_rdata_axi_rdata2;
wire           axi_rvalid_axi_rvalid2;
wire           axi_awvalid_s_awvalid;
wire   [14: 0] axi_awaddr_s_awaddr;
wire           axi_wvalid_s_wvalid;
wire   [31: 0] axi_wdata_s_wdata;
wire    [3: 0] axi_wstrb_s_wstrb;
wire           axi_arvalid_s_arvalid;
wire   [14: 0] axi_araddr_s_araddr;
wire           axi_rready_s_rready;
wire   [31: 0] aa_cfg_rdata_m_rdata;
wire           aa_cfg_rvalid_m_rvalid;
wire           aa_cfg_awready_m_awready;
wire           aa_cfg_wready_m_wready;
wire           aa_cfg_arready_m_arready;
wire           cc_aa_enable;
wire   [31: 0] as_aa_tdata;
wire    [3: 0] as_aa_tstrb;
wire    [3: 0] as_aa_tkeep;
wire           as_aa_tlast;
wire           as_aa_tvalid;
wire    [1: 0] as_aa_tuser;
wire           as_aa_tready;
//wire           axi_awvalid;
//wire   [14: 0] axi_awaddr;
//wire           axi_wvalid;
//wire   [31: 0] axi_wdata;
//wire    [3: 0] axi_wstrb;
//wire           axi_arvalid;
//wire   [14: 0] axi_araddr;
//wire           axi_rready;
wire           cc_as_enable;
wire   [31: 0] aa_as_tdata;
wire    [3: 0] aa_as_tstrb;
wire    [3: 0] aa_as_tkeep;
wire           aa_as_tlast;
wire           aa_as_tvalid;
wire    [1: 0] aa_as_tuser;
wire           aa_as_tready;
wire   [31: 0] is_as_tdata;
wire    [3: 0] is_as_tstrb;
wire    [3: 0] is_as_tkeep;
wire           is_as_tlast;
wire    [1: 0] is_as_tid;
wire           is_as_tvalid;
wire    [1: 0] is_as_tuser;
wire           is_as_tready;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
  wire   [pUSER_PROJECT_SIDEBAND_WIDTH-1:0] is_as_tupsb;
`endif
wire   [31: 0] m_tdata_la_as_tdata;
wire    [3: 0] m_tstrb_la_as_tstrb;
wire    [3: 0] m_tkeep_la_as_tkeep;
wire           m_tlast_la_as_tlast;
wire           m_tvalid_la_as_tvalid;
wire    [1: 0] m_tuser_la_as_tuser;
wire           la_hpri_req;
wire   [31: 0] m_tdata_up_as_tdata;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
  wire   [pUSER_PROJECT_SIDEBAND_WIDTH-1:0] m_tupsb_up_as_tupsb;
`endif
wire    [3: 0] m_tstrb_up_as_tstrb;
wire    [3: 0] m_tkeep_up_as_tkeep;
wire           m_tlast_up_as_tlast;
wire           m_tvalid_up_as_tvalid;
wire    [1: 0] m_tuser_up_as_tuser;
wire           s_tready_up_as_tready;
wire           high_pri_irq_up_hpri_req;
wire           cc_is_enable;
wire   [31: 0] as_is_tdata;
wire    [3: 0] as_is_tstrb;
wire    [3: 0] as_is_tkeep;
wire           as_is_tlast;
wire    [1: 0] as_is_tid;
wire           as_is_tvalid;
wire    [1: 0] as_is_tuser;
wire           as_is_tready;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
  wire   [pUSER_PROJECT_SIDEBAND_WIDTH-1:0] as_is_tupsb;
`endif
wire           ioclk;
wire   [pSERIALIO_WIDTH-1: 0] serial_rxd;
wire           serial_rclk;
wire           cc_la_enable;
wire           as_la_tready_m_tready;
wire   [23: 0] up_la_data;
wire           cc_up_enable;
wire    [4: 0] user_prj_sel;
wire   [31: 0] as_up_tdata_s_tdata;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
  wire   [pUSER_PROJECT_SIDEBAND_WIDTH-1:0] as_up_tupsb_s_tupsb;
`endif
wire    [3: 0] as_up_tstrb_s_tstrb;
wire    [3: 0] as_up_tkeep_s_tkeep;
wire           as_up_tlast_s_tlast;
wire           as_up_tvalid_s_tvalid;
wire    [1: 0] as_up_tuser_s_tuser;
wire           as_up_tready_m_tready;
wire           mb_irq;
wire           low__pri_irq;
wire           high_pri_irq;
wire           io_clk;
wire   [pSERIALIO_WIDTH-1: 0] serial_txd;
wire           serial_tclk;
wire           axi_clk;
wire           axi_reset_n;
wire           axis_clk;
wire           uck2_rst_n;
wire           axis_rst_n;


// This code snippet was auto generated by xls2vlog.py from source file: /home/josh/Downloads/Interface-Definition.xlsx
// User: josh
// Date: Sep-22-23



CFG_CTRL #(.pADDR_WIDTH( pADDR_WIDTH ),
           .pDATA_WIDTH( 32 )) U_CFG_CTRL0 (
                                            .aa_cfg_awvalid (m_awvalid_aa_cfg_awvalid),// I  
                                            .aa_cfg_awaddr  (m_awaddr_aa_cfg_awaddr),  // I  32
                                            .aa_cfg_wvalid  (m_wvalid_aa_cfg_wvalid),  // I  
                                            .aa_cfg_wdata   (m_wdata_aa_cfg_wdata),    // I  32
                                            .aa_cfg_wstrb   (m_wstrb_aa_cfg_wstrb),    // I  4
                                            .aa_cfg_arvalid (m_arvalid_aa_cfg_arvalid),// I  
                                            .aa_cfg_araddr  (m_araddr_aa_cfg_araddr),  // I  32
                                            .aa_cfg_rready  (m_rready_aa_cfg_rready),  // I  
                                            .axi_wready1    (s_wready_axi_wready1),    // I  
                                            .axi_awready1   (s_awready_axi_awready1),  // I  
                                            .axi_arready1   (s_arready_axi_arready1),  // I  
                                            .axi_rdata1     (s_rdata_axi_rdata1),      // I  32
                                            .axi_rvalid1    (s_rvalid_axi_rvalid1),    // I  
                                            .axi_awready4   (axi_awready_axi_awready4),// I  
                                            .axi_wready4    (axi_wready_axi_wready4),  // I  
                                            .axi_arready4   (axi_arready_axi_arready4),// I  
                                            .axi_rdata4     (axi_rdata_axi_rdata4),    // I  32
                                            .axi_rvalid4    (axi_rvalid_axi_rvalid4),  // I  
                                            .axi_awready3   (axi_awready_axi_awready3),// I  
                                            .axi_wready3    (axi_wready_axi_wready3),  // I  
                                            .axi_arready3   (axi_arready_axi_arready3),// I  
                                            .axi_rdata3     (axi_rdata_axi_rdata3),    // I  32
                                            .axi_rvalid3    (axi_rvalid_axi_rvalid3),  // I  
                                            .axi_awready0   (axi_awready_axi_awready0),// I  
                                            .axi_wready0    (axi_wready_axi_wready0),  // I  
                                            .axi_arready0   (axi_arready_axi_arready0),// I  
                                            .axi_rdata0     (axi_rdata_axi_rdata0),    // I  32
                                            .axi_rvalid0    (axi_rvalid_axi_rvalid0),  // I  
                                            .axi_awready2   (axi_awready_axi_awready2),// I  
                                            .axi_wready2    (axi_wready_axi_wready2),  // I  
                                            .axi_arready2   (axi_arready_axi_arready2),// I  
                                            .axi_rdata2     (axi_rdata_axi_rdata2),    // I  32
                                            .axi_rvalid2    (axi_rvalid_axi_rvalid2),  // I  
                                            .axi_awvalid    (axi_awvalid_s_awvalid),   // O  
                                            .axi_awaddr     (axi_awaddr_s_awaddr),     // O  15
                                            .axi_wvalid     (axi_wvalid_s_wvalid),     // O  
                                            .axi_wdata      (axi_wdata_s_wdata),       // O  32
                                            .axi_wstrb      (axi_wstrb_s_wstrb),       // O  4
                                            .axi_arvalid    (axi_arvalid_s_arvalid),   // O  
                                            .axi_araddr     (axi_araddr_s_araddr),     // O  15
                                            .axi_rready     (axi_rready_s_rready),     // O  
                                            .aa_cfg_rdata   (aa_cfg_rdata_m_rdata),    // O  32
                                            .aa_cfg_rvalid  (aa_cfg_rvalid_m_rvalid),  // O  
                                            .aa_cfg_awready (aa_cfg_awready_m_awready),// O  
                                            .aa_cfg_wready  (aa_cfg_wready_m_wready),  // O  
                                            .aa_cfg_arready (aa_cfg_arready_m_arready),// O  
                                            .cc_aa_enable   (cc_aa_enable),            // O  
                                            .cc_as_enable   (cc_as_enable),            // O  
                                            .cc_is_enable   (cc_is_enable),            // O  
                                            .cc_la_enable   (cc_la_enable),            // O  
                                            .cc_up_enable   (cc_up_enable),            // O  
                                            .user_prj_sel   (user_prj_sel),            // O  5
                                            .wb_rst         (wb_rst),                  // I  
                                            .wb_clk         (wb_clk),                  // I  
                                            .wbs_adr        (wbs_adr),                 // I  32
                                            .wbs_wdata      (wbs_wdata),               // I  32
                                            .wbs_sel        (wbs_sel),                 // I  4
                                            .wbs_cyc        (wbs_cyc),                 // I  
                                            .wbs_stb        (wbs_stb),                 // I  
                                            .wbs_we         (wbs_we),                  // I  
                                            .wbs_ack        (wbs_ack),                 // O  
                                            .wbs_rdata      (wbs_rdata),               // O  32
                                            .user_clock2    (user_clock2),             // I  
                                            .axi_clk        (axi_clk),                 // I  
                                            .axi_reset_n    (axi_reset_n),             // I  
                                            .uck2_rst_n     (uck2_rst_n)               // I  
                                           );


// This code snippet was auto generated by xls2vlog.py from source file: /home/josh/Downloads/Interface-Definition.xlsx
// User: josh
// Date: Sep-22-23



AXIL_AXIS #(.pADDR_WIDTH( pADDR_WIDTH ),
            .pDATA_WIDTH( 32 )) U_AXIL_AXIS0 (
                                              .m_awvalid    (m_awvalid_aa_cfg_awvalid),// O  
                                              .m_awaddr     (m_awaddr_aa_cfg_awaddr),  // O  32
                                              .m_wvalid     (m_wvalid_aa_cfg_wvalid),  // O  
                                              .m_wdata      (m_wdata_aa_cfg_wdata),    // O  32
                                              .m_wstrb      (m_wstrb_aa_cfg_wstrb),    // O  4
                                              .m_arvalid    (m_arvalid_aa_cfg_arvalid),// O  
                                              .m_araddr     (m_araddr_aa_cfg_araddr),  // O  32
                                              .m_rready     (m_rready_aa_cfg_rready),  // O  
                                              .s_wready     (s_wready_axi_wready1),    // O  
                                              .s_awready    (s_awready_axi_awready1),  // O  
                                              .s_arready    (s_arready_axi_arready1),  // O  
                                              .s_rdata      (s_rdata_axi_rdata1),      // O  32
                                              .s_rvalid     (s_rvalid_axi_rvalid1),    // O  
                                              .s_awvalid    (axi_awvalid_s_awvalid),   // I  
                                              .s_awaddr     (axi_awaddr_s_awaddr),     // I  15
                                              .s_wvalid     (axi_wvalid_s_wvalid),     // I  
                                              .s_wdata      (axi_wdata_s_wdata),       // I  32
                                              .s_wstrb      (axi_wstrb_s_wstrb),       // I  4
                                              .s_arvalid    (axi_arvalid_s_arvalid),   // I  
                                              .s_araddr     (axi_araddr_s_araddr),     // I  15
                                              .s_rready     (axi_rready_s_rready),     // I  
                                              .m_rdata      (aa_cfg_rdata_m_rdata),    // I  32
                                              .m_rvalid     (aa_cfg_rvalid_m_rvalid),  // I  
                                              .m_awready    (aa_cfg_awready_m_awready),// I  
                                              .m_wready     (aa_cfg_wready_m_wready),  // I  
                                              .m_arready    (aa_cfg_arready_m_arready),// I  
                                              .cc_aa_enable (cc_aa_enable),            // I  
                                              .as_aa_tdata  (as_aa_tdata),             // I  32
                                              .as_aa_tstrb  (as_aa_tstrb),             // I  4
                                              .as_aa_tkeep  (as_aa_tkeep),             // I  4
                                              .as_aa_tlast  (as_aa_tlast),             // I  
                                              .as_aa_tvalid (as_aa_tvalid),            // I  
                                              .as_aa_tuser  (as_aa_tuser),             // I  2
                                              .as_aa_tready (as_aa_tready),            // I  
                                              .aa_as_tdata  (aa_as_tdata),             // O  32
                                              .aa_as_tstrb  (aa_as_tstrb),             // O  4
                                              .aa_as_tkeep  (aa_as_tkeep),             // O  4
                                              .aa_as_tlast  (aa_as_tlast),             // O  
                                              .aa_as_tvalid (aa_as_tvalid),            // O  
                                              .aa_as_tuser  (aa_as_tuser),             // O  2
                                              .aa_as_tready (aa_as_tready),            // O  
                                              .mb_irq       (mb_irq),                  // O  
                                              .axi_clk      (axi_clk),                 // I  
                                              .axi_reset_n  (axi_reset_n),             // I  
                                              .axis_clk     (axis_clk),                // I  
                                              .axis_rst_n   (axis_rst_n)               // I  
                                             );


// This code snippet was auto generated by xls2vlog.py from source file: /home/josh/Downloads/Interface-Definition.xlsx
// User: josh
// Date: Sep-22-23



AXIS_SW #(  .pUSER_PROJECT_SIDEBAND_WIDTH( pUSER_PROJECT_SIDEBAND_WIDTH ),
      .pADDR_WIDTH( pADDR_WIDTH ),
      .pDATA_WIDTH( 32 )) AXIS_SW0 (
                                        .axi_awready  (axi_awready_axi_awready4),// O  
                                        .axi_wready   (axi_wready_axi_wready4),  // O  
                                        .axi_arready  (axi_arready_axi_arready4),// O  
                                        .axi_rdata    (axi_rdata_axi_rdata4),    // O  32
                                        .axi_rvalid   (axi_rvalid_axi_rvalid4),  // O  
                                        .as_aa_tdata  (as_aa_tdata),             // O  32
                                        .as_aa_tstrb  (as_aa_tstrb),             // O  4
                                        .as_aa_tkeep  (as_aa_tkeep),             // O  4
                                        .as_aa_tlast  (as_aa_tlast),             // O  
                                        .as_aa_tvalid (as_aa_tvalid),            // O  
                                        .as_aa_tuser  (as_aa_tuser),             // O  2
                                        .as_aa_tready (as_aa_tready),            // O  
                                        .axi_awvalid  (axi_awvalid_s_awvalid),   // I  
                                        .axi_awaddr   (axi_awaddr_s_awaddr),     // I  15
                                        .axi_wvalid   (axi_wvalid_s_wvalid),     // I  
                                        .axi_wdata    (axi_wdata_s_wdata),       // I  32
                                        .axi_wstrb    (axi_wstrb_s_wstrb),       // I  4
                                        .axi_arvalid  (axi_arvalid_s_arvalid),   // I  
                                        .axi_araddr   (axi_araddr_s_araddr),     // I  15
                                        .axi_rready   (axi_rready_s_rready),     // I  
                                        .cc_as_enable (cc_as_enable),            // I  
                                        .aa_as_tdata  (aa_as_tdata),             // I  32
                                        .aa_as_tstrb  (aa_as_tstrb),             // I  4
                                        .aa_as_tkeep  (aa_as_tkeep),             // I  4
                                        .aa_as_tlast  (aa_as_tlast),             // I  
                                        .aa_as_tvalid (aa_as_tvalid),            // I  
                                        .aa_as_tuser  (aa_as_tuser),             // I  2
                                        .aa_as_tready (aa_as_tready),            // I  
                                        .is_as_tdata  (is_as_tdata),             // I  32
                    `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                      .is_as_tupsb  (is_as_tupsb),     // I  5
                    `endif
                                        .is_as_tstrb  (is_as_tstrb),             // I  4
                                        .is_as_tkeep  (is_as_tkeep),             // I  4
                                        .is_as_tlast  (is_as_tlast),             // I  
                                        .is_as_tid    (is_as_tid),               // I  2
                                        .is_as_tvalid (is_as_tvalid),            // I  
                                        .is_as_tuser  (is_as_tuser),             // I  2
                                        .is_as_tready (is_as_tready),            // I  
                                        .la_as_tdata  (m_tdata_la_as_tdata),     // I  32
                                        .la_as_tstrb  (m_tstrb_la_as_tstrb),     // I  4
                                        .la_as_tkeep  (m_tkeep_la_as_tkeep),     // I  4
                                        .la_as_tlast  (m_tlast_la_as_tlast),     // I  
                                        .la_as_tvalid (m_tvalid_la_as_tvalid),   // I  
                                        .la_as_tuser  (m_tuser_la_as_tuser),     // I  2
                                        .la_hpri_req  (la_hpri_req),             // I  
                                        .up_as_tdata  (m_tdata_up_as_tdata),     // I  32
                    `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                      .up_as_tupsb  (m_tupsb_up_as_tupsb),     // I  5
                    `endif
                                        .up_as_tstrb  (m_tstrb_up_as_tstrb),     // I  4
                                        .up_as_tkeep  (m_tkeep_up_as_tkeep),     // I  4
                                        .up_as_tlast  (m_tlast_up_as_tlast),     // I  
                                        .up_as_tvalid (m_tvalid_up_as_tvalid),   // I  
                                        .up_as_tuser  (m_tuser_up_as_tuser),     // I  2
                                        .up_as_tready (s_tready_up_as_tready),   // I  
                                        .up_hpri_req  (high_pri_irq_up_hpri_req),// I  
                                        .as_is_tdata  (as_is_tdata),             // O  32
                    `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                      .as_is_tupsb  (as_is_tupsb),     // O  5
                    `endif
                                        .as_is_tstrb  (as_is_tstrb),             // O  4
                                        .as_is_tkeep  (as_is_tkeep),             // O  4
                                        .as_is_tlast  (as_is_tlast),             // O  
                                        .as_is_tid    (as_is_tid),               // O  2
                                        .as_is_tvalid (as_is_tvalid),            // O  
                                        .as_is_tuser  (as_is_tuser),             // O  2
                                        .as_is_tready (as_is_tready),            // O  
                                        .as_la_tready (as_la_tready_m_tready),   // O  
                                        .as_up_tdata  (as_up_tdata_s_tdata),     // O  32
                    `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                      .as_up_tupsb  (as_up_tupsb_s_tupsb),     // O  5
                    `endif
                                        .as_up_tstrb  (as_up_tstrb_s_tstrb),     // O  4
                                        .as_up_tkeep  (as_up_tkeep_s_tkeep),     // O  4
                                        .as_up_tlast  (as_up_tlast_s_tlast),     // O  
                                        .as_up_tvalid (as_up_tvalid_s_tvalid),   // O  
                                        .as_up_tuser  (as_up_tuser_s_tuser),     // O  2
                                        .as_up_tready (as_up_tready_m_tready),   // O  
                                        .axi_reset_n  (axi_reset_n),             // I  
                                        .axis_clk     (axis_clk),                // I  
                                        .axis_rst_n   (axis_rst_n)               // I  
                                       );


// This code snippet was auto generated by xls2vlog.py from source file: /home/josh/Downloads/Interface-Definition.xlsx
// User: josh
// Date: Sep-22-23



IO_SERDES #(.pUSER_PROJECT_SIDEBAND_WIDTH( pUSER_PROJECT_SIDEBAND_WIDTH ),
      .pSERIALIO_WIDTH( pSERIALIO_WIDTH ),
            .pADDR_WIDTH( pADDR_WIDTH ),
            .pDATA_WIDTH( pDATA_WIDTH ),
            .pRxFIFO_DEPTH( pRxFIFO_DEPTH ),
            .pCLK_RATIO      ( pCLK_RATIO)) U_IO_SERDES0 (
                                                  .axi_awready  (axi_awready_axi_awready3),// O  
                                                  .axi_wready   (axi_wready_axi_wready3),  // O  
                                                  .axi_arready  (axi_arready_axi_arready3),// O  
                                                  .axi_rdata    (axi_rdata_axi_rdata3),    // O  32
                                                  .axi_rvalid   (axi_rvalid_axi_rvalid3),  // O  
                                                  .is_as_tdata  (is_as_tdata),             // O  32
                          `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                           .is_as_tupsb  (is_as_tupsb),     // O  5
                          `endif
                          .is_as_tstrb  (is_as_tstrb),             // O  4
                                                  .is_as_tkeep  (is_as_tkeep),             // O  4
                                                  .is_as_tlast  (is_as_tlast),             // O  
                                                  .is_as_tid    (is_as_tid),               // O  2
                                                  .is_as_tvalid (is_as_tvalid),            // O  
                                                  .is_as_tuser  (is_as_tuser),             // O  2
                                                  .is_as_tready (is_as_tready),            // O  
                                                  .axi_awvalid  (axi_awvalid_s_awvalid),   // I  
                                                  .axi_awaddr   (axi_awaddr_s_awaddr),     // I  15
                                                  .axi_wvalid   (axi_wvalid_s_wvalid),     // I  
                                                  .axi_wdata    (axi_wdata_s_wdata),       // I  32
                                                  .axi_wstrb    (axi_wstrb_s_wstrb),       // I  4
                                                  .axi_arvalid  (axi_arvalid_s_arvalid),   // I  
                                                  .axi_araddr   (axi_araddr_s_araddr),     // I  15
                                                  .axi_rready   (axi_rready_s_rready),     // I  
                                                  .cc_is_enable (cc_is_enable),            // I  
                                                  .as_is_tdata  (as_is_tdata),             // I  32
                          `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                           .as_is_tupsb  (as_is_tupsb),     // I  5
                          `endif
                                                  .as_is_tstrb  (as_is_tstrb),             // I  4
                                                  .as_is_tkeep  (as_is_tkeep),             // I  4
                                                  .as_is_tlast  (as_is_tlast),             // I  
                                                  .as_is_tid    (as_is_tid),               // I  2
                                                  .as_is_tvalid (as_is_tvalid),            // I  
                                                  .as_is_tuser  (as_is_tuser),             // I  2
                                                  .as_is_tready (as_is_tready),            // I  
                                                  .ioclk        (ioclk),                   // I  
                                                  .serial_rxd   (serial_rxd),              // I  12
                                                  .serial_rclk  (serial_rclk),             // I  
                                                  .serial_txd   (serial_txd),              // O  12
                                                  .serial_tclk  (serial_tclk),             // O  
                                                  .axi_clk      (axi_clk),                 // I  
                                                  .axi_reset_n  (axi_reset_n),             // I  
                                                  .axis_clk     (axis_clk),                // I  
                                                  .axis_rst_n   (axis_rst_n)               // I  
                                                 );


// This code snippet was auto generated by xls2vlog.py from source file: /home/josh/Downloads/Interface-Definition.xlsx
// User: josh
// Date: Sep-22-23



LOGIC_ANLZ #(.pADDR_WIDTH( pADDR_WIDTH ),
             .pDATA_WIDTH( 32 )) U_LOGIC_ANLZ0 (
                                                .axi_awready  (axi_awready_axi_awready0),// O  
                                                .axi_wready   (axi_wready_axi_wready0),  // O  
                                                .axi_arready  (axi_arready_axi_arready0),// O  
                                                .axi_rdata    (axi_rdata_axi_rdata0),    // O  32
                                                .axi_rvalid   (axi_rvalid_axi_rvalid0),  // O  
                                                .m_tdata      (m_tdata_la_as_tdata),     // O  32
                                                .m_tstrb      (m_tstrb_la_as_tstrb),     // O  4
                                                .m_tkeep      (m_tkeep_la_as_tkeep),     // O  4
                                                .m_tlast      (m_tlast_la_as_tlast),     // O  
                                                .m_tvalid     (m_tvalid_la_as_tvalid),   // O  
                                                .m_tuser      (m_tuser_la_as_tuser),     // O  2
                                                .la_hpri_req  (la_hpri_req),             // O  
                                                .axi_awvalid  (axi_awvalid_s_awvalid),   // I  
                                                .axi_awaddr   (axi_awaddr_s_awaddr),     // I  15
                                                .axi_wvalid   (axi_wvalid_s_wvalid),     // I  
                                                .axi_wdata    (axi_wdata_s_wdata),       // I  32
                                                .axi_wstrb    (axi_wstrb_s_wstrb),       // I  4
                                                .axi_arvalid  (axi_arvalid_s_arvalid),   // I  
                                                .axi_araddr   (axi_araddr_s_araddr),     // I  15
                                                .axi_rready   (axi_rready_s_rready),     // I  
                                                .cc_la_enable (cc_la_enable),            // I  
                                                .m_tready     (as_la_tready_m_tready),   // I  
                                                .up_la_data   (up_la_data),              // I  24
                                                .user_clock2  (user_clock2),             // I  
                                                .axi_clk      (axi_clk),                 // I  
                                                .axi_reset_n  (axi_reset_n),             // I  
                                                .axis_clk     (axis_clk),                // I  
                                                .uck2_rst_n   (uck2_rst_n),              // I  
                                                .axis_rst_n   (axis_rst_n)               // I  
                                               );


// This code snippet was auto generated by xls2vlog.py from source file: /home/josh/Downloads/Interface-Definition.xlsx
// User: josh
// Date: Sep-22-23



USER_SUBSYS #(  .pUSER_PROJECT_SIDEBAND_WIDTH( pUSER_PROJECT_SIDEBAND_WIDTH ),
        .pADDR_WIDTH( pADDR_WIDTH ),
        .pDATA_WIDTH( 32 )) U_USER_SUBSYS0 (
                                                  .axi_awready  (axi_awready_axi_awready2),// O  
                                                  .axi_wready   (axi_wready_axi_wready2),  // O  
                                                  .axi_arready  (axi_arready_axi_arready2),// O  
                                                  .axi_rdata    (axi_rdata_axi_rdata2),    // O  32
                                                  .axi_rvalid   (axi_rvalid_axi_rvalid2),  // O  
                                                  .m_tdata      (m_tdata_up_as_tdata),     // O  32
                          `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                            .m_tupsb    (m_tupsb_up_as_tupsb),     // O  5
                          `endif
                                                  .m_tstrb      (m_tstrb_up_as_tstrb),     // O  4
                                                  .m_tkeep      (m_tkeep_up_as_tkeep),     // O  4
                                                  .m_tlast      (m_tlast_up_as_tlast),     // O  
                                                  .m_tvalid     (m_tvalid_up_as_tvalid),   // O  
                                                  .m_tuser      (m_tuser_up_as_tuser),     // O  2
                                                  .s_tready     (s_tready_up_as_tready),   // O  
                                                  .high_pri_irq (high_pri_irq_up_hpri_req),// O  
                                                  .up_la_data   (up_la_data),              // O  24
                                                  .axi_awvalid  (axi_awvalid_s_awvalid),   // I  
                                                  .axi_awaddr   (axi_awaddr_s_awaddr),     // I  15
                                                  .axi_wvalid   (axi_wvalid_s_wvalid),     // I  
                                                  .axi_wdata    (axi_wdata_s_wdata),       // I  32
                                                  .axi_wstrb    (axi_wstrb_s_wstrb),       // I  4
                                                  .axi_arvalid  (axi_arvalid_s_arvalid),   // I  
                                                  .axi_araddr   (axi_araddr_s_araddr),     // I  15
                                                  .axi_rready   (axi_rready_s_rready),     // I  
                                                  .cc_up_enable (cc_up_enable),            // I  
                                                  .user_prj_sel (user_prj_sel),            // I  5
                                                  .s_tdata      (as_up_tdata_s_tdata),     // I  32
                          `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                            .s_tupsb   (as_up_tupsb_s_tupsb),     // I  5
                          `endif
                                                  .s_tstrb      (as_up_tstrb_s_tstrb),     // I  4
                                                  .s_tkeep      (as_up_tkeep_s_tkeep),     // I  4
                                                  .s_tlast      (as_up_tlast_s_tlast),     // I  
                                                  .s_tvalid     (as_up_tvalid_s_tvalid),   // I  
                                                  .s_tuser      (as_up_tuser_s_tuser),     // I  2
                                                  .m_tready     (as_up_tready_m_tready),   // I  
                                                  .low__pri_irq (low__pri_irq),            // O  
                                                  .user_clock2  (user_clock2),             // I  
                                                  .axi_clk      (axi_clk),                 // I  
                                                  .axi_reset_n  (axi_reset_n),             // I  
                                                  .axis_clk     (axis_clk),                // I  
                                                  .uck2_rst_n   (uck2_rst_n),              // I  
                                                  .axis_rst_n   (axis_rst_n)               // I  
                                                 );


// This code snippet was auto generated by xls2vlog.py from source file: /home/josh/Downloads/Interface-Definition.xlsx
// User: josh
// Date: Sep-22-23



FSIC_CLKRST  U_FSIC_CLKRST0 (
                             .ioclk        (ioclk),                   // O  
                             .user_prj_sel (user_prj_sel),            // I  5
                             .mb_irq       (mb_irq),                  // I  
                             .low__pri_irq (low__pri_irq),            // I  
                             .high_pri_irq (high_pri_irq_up_hpri_req),// I  
                             .io_clk       (io_clk),                  // I  
                             .wb_rst       (wb_rst),                  // I  
                             .wb_clk       (wb_clk),                  // I  
                             .user_irq     (user_irq),                // O  3
                             .user_clock2  (user_clock2),             // I  
                             .axi_clk      (axi_clk),                 // O  
                             .axi_reset_n  (axi_reset_n),             // O  
                             .axis_clk     (axis_clk),                // O  
                             .uck2_rst_n   (uck2_rst_n),              // O  
                             .axis_rst_n   (axis_rst_n)               // O  
                            );


// This code snippet was auto generated by xls2vlog.py from source file: /home/josh/Downloads/Interface-Definition.xlsx
// User: josh
// Date: Sep-22-23


MPRJ_IO #(
      .pUSER_PROJECT_SIDEBAND_WIDTH( pUSER_PROJECT_SIDEBAND_WIDTH ),
      .pSERIALIO_WIDTH ( pSERIALIO_WIDTH ),
      .pADDR_WIDTH( pADDR_WIDTH ),
      .pDATA_WIDTH( 32 )) U_MPRJ_IO0 (
                                          .serial_rxd   (serial_rxd),              // O  12
                                          .serial_rclk  (serial_rclk),             // O  
                                          .io_clk       (io_clk),                  // O  
                                          .user_prj_sel (user_prj_sel),            // I  5
                                          .serial_txd   (serial_txd),              // I  12
                                          .serial_tclk  (serial_tclk),             // I  
                                          .io_in        (io_in),                   // I  38
`ifdef USE_POWER_PINS
                                          .vccd1        (vccd1),                   // I  
                                          .vccd2        (vccd2),                   // I  
                                          .vssd1        (vssd1),                   // I  
                                          .vssd2        (vssd2),                   // I  
`endif //USE_POWER_PINS  
                                          .io_out       (io_out),                  // O  38
                                          .io_oeb       (io_oeb),                  // O  38
                                          .user_clock2  (user_clock2),             // I  
                                          .axi_clk      (axi_clk),                 // I  
                                          .axi_reset_n  (axi_reset_n),             // I  
                                          .axis_clk     (axis_clk),                // I  
                                          .uck2_rst_n   (uck2_rst_n),              // I  
                                          .axis_rst_n   (axis_rst_n)               // I  
                                         );




endmodule // FSIC
