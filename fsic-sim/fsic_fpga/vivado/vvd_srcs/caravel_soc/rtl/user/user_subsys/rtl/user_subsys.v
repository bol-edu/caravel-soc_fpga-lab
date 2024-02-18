//////////////////////////////////////////////////////////////////////////////////
// Author : Tony Ho
//
// Create Date: 11/20/2023
// Design Name:
// Module Name: USER_SUBSYS
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
module USER_SUBSYS #( parameter pUSER_PROJECT_SIDEBAND_WIDTH = 5,
                      parameter pADDR_WIDTH   = 12,
                      parameter pDATA_WIDTH   = 32
                    )
(
  input  wire                        axi_awvalid,
  input  wire                [14: 0] axi_awaddr,
  input  wire                        axi_arvalid,
  input  wire                [14: 0] axi_araddr,
  input  wire                        axi_wvalid,
  input  wire                 [3: 0] axi_wstrb,
  input  wire  [(pDATA_WIDTH-1) : 0] axi_wdata,
  input  wire                        axi_rready,
  input  wire                        cc_up_enable,
  input  wire                        s_tvalid,
  input  wire  [(pDATA_WIDTH-1) : 0] s_tdata,
  input  wire                 [1: 0] s_tuser,
  `ifdef USER_PROJECT_SIDEBAND_SUPPORT
   input  wire                 [pUSER_PROJECT_SIDEBAND_WIDTH-1: 0] s_tupsb,
  `endif
  input  wire                 [3: 0] s_tstrb,
  input  wire                 [3: 0] s_tkeep,
  input  wire                        s_tlast,
  input  wire                        m_tready,
  output wire                        axi_awready,
  output wire                        axi_arready,
  output wire                        axi_wready,
  output wire                        axi_rvalid,
  output wire  [(pDATA_WIDTH-1) : 0] axi_rdata,
  output wire                        s_tready,
  output wire                        m_tvalid,
  output wire  [(pDATA_WIDTH-1) : 0] m_tdata,
  output wire                 [1: 0] m_tuser,
  `ifdef USER_PROJECT_SIDEBAND_SUPPORT
   output  wire                 [pUSER_PROJECT_SIDEBAND_WIDTH-1: 0] m_tupsb,
  `endif
  output wire                 [3: 0] m_tstrb,
  output wire                 [3: 0] m_tkeep,
  output wire                        m_tlast,
  output wire                        low__pri_irq,
  output wire                        high_pri_irq,
  output wire                [23: 0] up_la_data,
  input  wire                        axi_clk,
  input  wire                        axis_clk,
  input  wire                        axi_reset_n,
  input  wire                        axis_rst_n,
  input  wire                        user_clock2,
  input  wire                        uck2_rst_n,
  input  wire                 [4: 0] user_prj_sel
);


wire                         awready_0;
wire                         arready_0;
wire                         wready_0;
wire                         rvalid_0;
wire   [(pDATA_WIDTH-1) : 0] rdata_0;
wire                         awready_1;
wire                         arready_1;
wire                         wready_1;
wire                         rvalid_1;
wire   [(pDATA_WIDTH-1) : 0] rdata_1;
wire                         awready_2;
wire                         arready_2;
wire                         wready_2;
wire                         rvalid_2;
wire   [(pDATA_WIDTH-1) : 0] rdata_2;
wire                         awready_3;
wire                         arready_3;
wire                         wready_3;
wire                         rvalid_3;
wire   [(pDATA_WIDTH-1) : 0] rdata_3;
wire                         awvalid_0_awvalid;
wire                 [11: 0] awaddr;
wire                         arvalid_0_arvalid;
wire                 [11: 0] araddr;
wire                         wvalid_0_wvalid;
wire                  [3: 0] wstrb_0_wstrb;
wire   [(pDATA_WIDTH-1) : 0] wdata;
wire                         rready;
wire                         ss_tvalid_0_ss_tvalid;
wire   [(pDATA_WIDTH-1) : 0] ss_tdata;
wire                  [1: 0] ss_tuser;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
  wire                 [pUSER_PROJECT_SIDEBAND_WIDTH-1: 0] ss_tupsb;
`endif
wire                  [3: 0] ss_tstrb;
wire                  [3: 0] ss_tkeep;
wire                         ss_tlast;
wire                         sm_tready;
wire                         awvalid_1_awvalid;
wire                         arvalid_1_arvalid;
wire                         wvalid_1_wvalid;
wire                  [3: 0] wstrb_1_wstrb;
wire                         ss_tvalid_1_ss_tvalid;
wire                         awvalid_2_awvalid;
wire                         arvalid_2_arvalid;
wire                         wvalid_2_wvalid;
wire                  [3: 0] wstrb_2_wstrb;
wire                         ss_tvalid_2_ss_tvalid;
wire                         awvalid_3_awvalid;
wire                         arvalid_3_arvalid;
wire                         wvalid_3_wvalid;
wire                  [3: 0] wstrb_3_wstrb;
wire                         ss_tvalid_3_ss_tvalid;
wire                         ss_tready_0;
wire                         ss_tready_1;
wire                         ss_tready_2;
wire                         ss_tready_3;
wire                         sm_tvalid_0;
wire   [(pDATA_WIDTH-1) : 0] sm_tdata_0;
wire                  [2: 0] sm_tid_0;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
  wire                 [pUSER_PROJECT_SIDEBAND_WIDTH-1: 0] sm_tupsb_0;
`endif
wire                  [3: 0] sm_tstrb_0;
wire                  [3: 0] sm_tkeep_0;
wire                         sm_tlast_0;
wire                         sm_tvalid_1;
wire   [(pDATA_WIDTH-1) : 0] sm_tdata_1;
wire                  [2: 0] sm_tid_1;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
  wire                 [pUSER_PROJECT_SIDEBAND_WIDTH-1: 0] sm_tupsb_1;
`endif
wire                  [3: 0] sm_tstrb_1;
wire                  [3: 0] sm_tkeep_1;
wire                         sm_tlast_1;
wire                         sm_tvalid_2;
wire   [(pDATA_WIDTH-1) : 0] sm_tdata_2;
wire                  [2: 0] sm_tid_2;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
  wire                 [pUSER_PROJECT_SIDEBAND_WIDTH-1: 0] sm_tupsb_2;
`endif
wire                  [3: 0] sm_tstrb_2;
wire                  [3: 0] sm_tkeep_2;
wire                         sm_tlast_2;
wire                         sm_tvalid_3;
wire   [(pDATA_WIDTH-1) : 0] sm_tdata_3;
wire                  [2: 0] sm_tid_3;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
  wire                 [pUSER_PROJECT_SIDEBAND_WIDTH-1: 0] sm_tupsb_3;
`endif
wire                  [3: 0] sm_tstrb_3;
wire                  [3: 0] sm_tkeep_3;
wire                         sm_tlast_3;
wire                         low__pri_irq_0;
wire                         High_pri_req_0;
wire                         low__pri_irq_1;
wire                         High_pri_req_1;
wire                         low__pri_irq_2;
wire                         High_pri_req_2;
wire                         low__pri_irq_3;
wire                         High_pri_req_3;
wire                 [23: 0] la_data_o_la_data_0_0;
wire                 [23: 0] la_data_o_la_data_1_1;
wire                 [23: 0] la_data_o_la_data_2_2;
wire                 [23: 0] la_data_o_la_data_3_3;


// This code snippet was auto generated by xls2vlog.py from source file: ./user_project_wrapper.xlsx
// User: josh
// Date: Sep-22-23



AXIL_SLAV #(.pADDR_WIDTH( 12 ),
            .pDATA_WIDTH( 32 )) U_AXIL_SLAV0 (
                                              .awready_0    (awready_0),               // I  
                                              .arready_0    (arready_0),               // I  
                                              .wready_0     (wready_0),                // I  
                                              .rvalid_0     (rvalid_0),                // I  
                                              .rdata_0      (rdata_0),                 // I  pDATA_WIDTH
                                              .awready_1    (awready_1),               // I  
                                              .arready_1    (arready_1),               // I  
                                              .wready_1     (wready_1),                // I  
                                              .rvalid_1     (rvalid_1),                // I  
                                              .rdata_1      (rdata_1),                 // I  pDATA_WIDTH
                                              .awready_2    (awready_2),               // I  
                                              .arready_2    (arready_2),               // I  
                                              .wready_2     (wready_2),                // I  
                                              .rvalid_2     (rvalid_2),                // I  
                                              .rdata_2      (rdata_2),                 // I  pDATA_WIDTH
                                              .awready_3    (awready_3),               // I  
                                              .arready_3    (arready_3),               // I  
                                              .wready_3     (wready_3),                // I  
                                              .rvalid_3     (rvalid_3),                // I  
                                              .rdata_3      (rdata_3),                 // I  pDATA_WIDTH
                                              .awvalid_0    (awvalid_0_awvalid),       // O  
                                              .awaddr       (awaddr),                  // O  12
                                              .arvalid_0    (arvalid_0_arvalid),       // O  
                                              .araddr       (araddr),                  // O  12
                                              .wvalid_0     (wvalid_0_wvalid),         // O  
                                              .wstrb_0      (wstrb_0_wstrb),           // O  4
                                              .wdata        (wdata),                   // O  pDATA_WIDTH
                                              .rready       (rready),                  // O  
                                              .awvalid_1    (awvalid_1_awvalid),       // O  
                                              .arvalid_1    (arvalid_1_arvalid),       // O  
                                              .wvalid_1     (wvalid_1_wvalid),         // O  
                                              .wstrb_1      (wstrb_1_wstrb),           // O  4
                                              .awvalid_2    (awvalid_2_awvalid),       // O  
                                              .arvalid_2    (arvalid_2_arvalid),       // O  
                                              .wvalid_2     (wvalid_2_wvalid),         // O  
                                              .wstrb_2      (wstrb_2_wstrb),           // O  4
                                              .awvalid_3    (awvalid_3_awvalid),       // O  
                                              .arvalid_3    (arvalid_3_arvalid),       // O  
                                              .wvalid_3     (wvalid_3_wvalid),         // O  
                                              .wstrb_3      (wstrb_3_wstrb),           // O  4
                                              .axi_awvalid  (axi_awvalid),             // I  
                                              .axi_awaddr   (axi_awaddr),              // I  15
                                              .axi_arvalid  (axi_arvalid),             // I  
                                              .axi_araddr   (axi_araddr),              // I  15
                                              .axi_wvalid   (axi_wvalid),              // I  
                                              .axi_wstrb    (axi_wstrb),               // I  4
                                              .axi_wdata    (axi_wdata),               // I  pDATA_WIDTH
                                              .axi_rready   (axi_rready),              // I  
                                              .cc_up_enable (cc_up_enable),            // I  
                                              .axi_awready  (axi_awready),             // O  
                                              .axi_arready  (axi_arready),             // O  
                                              .axi_wready   (axi_wready),              // O  
                                              .axi_rvalid   (axi_rvalid),              // O  
                                              .axi_rdata    (axi_rdata),               // O  pDATA_WIDTH
                                              .axi_clk      (axi_clk),                 // I  
                                              .axi_reset_n  (axi_reset_n),             // I  
                                              .user_prj_sel (user_prj_sel)             // I  5
                                             );


// This code snippet was auto generated by xls2vlog.py from source file: ./user_project_wrapper.xlsx
// User: josh
// Date: Sep-22-23



USER_PRJ0 #(  .pUSER_PROJECT_SIDEBAND_WIDTH ( pUSER_PROJECT_SIDEBAND_WIDTH ), 
        .pADDR_WIDTH( 12 ),
        .pDATA_WIDTH( 32 )) U_USRPRJ0 (
                                          .awready      (awready_0),               // O  
                                          .arready      (arready_0),               // O  
                                          .wready       (wready_0),                // O  
                                          .rvalid       (rvalid_0),                // O  
                                          .rdata        (rdata_0),                 // O  pDATA_WIDTH
                                          .awvalid      (awvalid_0_awvalid),       // I  
                                          .awaddr       (awaddr),                  // I  12
                                          .arvalid      (arvalid_0_arvalid),       // I  
                                          .araddr       (araddr),                  // I  12
                                          .wvalid       (wvalid_0_wvalid),         // I  
                                          .wstrb        (wstrb_0_wstrb),           // I  4
                                          .wdata        (wdata),                   // I  pDATA_WIDTH
                                          .rready       (rready),                  // I  
                                          .ss_tvalid    (ss_tvalid_0_ss_tvalid),   // I  
                                          .ss_tdata     (ss_tdata),                // I  pDATA_WIDTH
                                          .ss_tuser     (ss_tuser),                // I  2
                      `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                       .ss_tupsb     (ss_tupsb),                // I  5    
                      `endif
                                          .ss_tstrb     (ss_tstrb),                // I  4
                                          .ss_tkeep     (ss_tkeep),                // I  4
                                          .ss_tlast     (ss_tlast),                // I  
                                          .sm_tready    (sm_tready),               // I  
                                          .ss_tready    (ss_tready_0),             // O  
                                          .sm_tvalid    (sm_tvalid_0),             // O  
                                          .sm_tdata     (sm_tdata_0),              // O  pDATA_WIDTH
                                          .sm_tid       (sm_tid_0),                // O  3
                      `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                       .sm_tupsb     (sm_tupsb_0),                // I  5    
                      `endif
                                          .sm_tstrb     (sm_tstrb_0),              // O  4
                                          .sm_tkeep     (sm_tkeep_0),              // O  4 
                                          .sm_tlast     (sm_tlast_0),              // O  
                                          .low__pri_irq (low__pri_irq_0),          // O  
                                          .High_pri_req (High_pri_req_0),          // O  
                                          .la_data_o    (la_data_o_la_data_0_0),   // O  24
                                          .axi_clk      (axi_clk),                 // I  
                                          .axis_clk     (axis_clk),                // I  
                                          .axi_reset_n  (axi_reset_n),             // I  
                                          .axis_rst_n   (axis_rst_n),              // I  
                                          .user_clock2  (user_clock2),             // I  
                                          .uck2_rst_n   (uck2_rst_n)               // I  
                                         );


// This code snippet was auto generated by xls2vlog.py from source file: ./user_project_wrapper.xlsx
// User: josh
// Date: Sep-22-23


USER_PRJ1 #(  .pUSER_PROJECT_SIDEBAND_WIDTH ( pUSER_PROJECT_SIDEBAND_WIDTH ), 
        .pADDR_WIDTH( 12 ),
        .pDATA_WIDTH( 32 )) U_USRPRJ1 (
                                          .awready      (awready_1),               // O  
                                          .arready      (arready_1),               // O  
                                          .wready       (wready_1),                // O  
                                          .rvalid       (rvalid_1),                // O  
                                          .rdata        (rdata_1),                 // O  pDATA_WIDTH
                                          .awvalid      (awvalid_1_awvalid),       // I  
                                          .awaddr       (awaddr),                  // I  12
                                          .arvalid      (arvalid_1_arvalid),       // I  
                                          .araddr       (araddr),                  // I  12
                                          .wvalid       (wvalid_1_wvalid),         // I  
                                          .wstrb        (wstrb_1_wstrb),           // I  4
                                          .wdata        (wdata),                   // I  pDATA_WIDTH
                                          .rready       (rready),                  // I  
                                          .ss_tvalid    (ss_tvalid_1_ss_tvalid),   // I  
                                          .ss_tdata     (ss_tdata),                // I  pDATA_WIDTH
                                          .ss_tuser     (ss_tuser),                // I  2
                      `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                       .ss_tupsb     (ss_tupsb),                // I  5    
                      `endif
                                          .ss_tstrb     (ss_tstrb),                // I  4
                                          .ss_tkeep     (ss_tkeep),                // I  4
                                          .ss_tlast     (ss_tlast),                // I  
                                          .sm_tready    (sm_tready),               // I  
                                          .ss_tready    (ss_tready_1),             // O  
                                          .sm_tvalid    (sm_tvalid_1),             // O  
                                          .sm_tdata     (sm_tdata_1),              // O  pDATA_WIDTH
                                          .sm_tid       (sm_tid_1),                // O  3
                      `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                       .sm_tupsb     (sm_tupsb_1),                // I  5    
                      `endif
                                          .sm_tstrb     (sm_tstrb_1),              // O  4
                                          .sm_tkeep     (sm_tkeep_1),              // O  4
                                          .sm_tlast     (sm_tlast_1),              // O  
                                          .low__pri_irq (low__pri_irq_1),          // O  
                                          .High_pri_req (High_pri_req_1),          // O  
                                          .la_data_o    (la_data_o_la_data_1_1),   // O  24
                                          .axi_clk      (axi_clk),                 // I  
                                          .axis_clk     (axis_clk),                // I  
                                          .axi_reset_n  (axi_reset_n),             // I  
                                          .axis_rst_n   (axis_rst_n),              // I  
                                          .user_clock2  (user_clock2),             // I  
                                          .uck2_rst_n   (uck2_rst_n)               // I  
                                         );


// This code snippet was auto generated by xls2vlog.py from source file: ./user_project_wrapper.xlsx
// User: josh
// Date: Sep-22-23



USER_PRJ2 #(  .pUSER_PROJECT_SIDEBAND_WIDTH ( pUSER_PROJECT_SIDEBAND_WIDTH ), 
        .pADDR_WIDTH( 12 ),
        .pDATA_WIDTH( 32 )) U_USRPRJ2 (
                                          .awready      (awready_2),               // O  
                                          .arready      (arready_2),               // O  
                                          .wready       (wready_2),                // O  
                                          .rvalid       (rvalid_2),                // O  
                                          .rdata        (rdata_2),                 // O  pDATA_WIDTH
                                          .awvalid      (awvalid_2_awvalid),       // I  
                                          .awaddr       (awaddr),                  // I  12
                                          .arvalid      (arvalid_2_arvalid),       // I  
                                          .araddr       (araddr),                  // I  12
                                          .wvalid       (wvalid_2_wvalid),         // I  
                                          .wstrb        (wstrb_2_wstrb),           // I  4
                                          .wdata        (wdata),                   // I  pDATA_WIDTH
                                          .rready       (rready),                  // I  
                                          .ss_tvalid    (ss_tvalid_2_ss_tvalid),   // I  
                                          .ss_tdata     (ss_tdata),                // I  pDATA_WIDTH
                                          .ss_tuser     (ss_tuser),                // I  2
                      `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                       .ss_tupsb     (ss_tupsb),                // I  5    
                      `endif
                                          .ss_tstrb     (ss_tstrb),                // I  4
                                          .ss_tkeep     (ss_tkeep),                // I  4
                                          .ss_tlast     (ss_tlast),                // I  
                                          .sm_tready    (sm_tready),               // I  
                                          .ss_tready    (ss_tready_2),             // O  
                                          .sm_tvalid    (sm_tvalid_2),             // O  
                                          .sm_tdata     (sm_tdata_2),              // O  pDATA_WIDTH
                                          .sm_tid       (sm_tid_2),                // O  3
                      `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                       .sm_tupsb     (sm_tupsb_2),                // I  5    
                      `endif
                                          .sm_tstrb     (sm_tstrb_2),              // O  4
                                          .sm_tkeep     (sm_tkeep_2),              // O  4
                                          .sm_tlast     (sm_tlast_2),              // O  
                                          .low__pri_irq (low__pri_irq_2),          // O  
                                          .High_pri_req (High_pri_req_2),          // O  
                                          .la_data_o    (la_data_o_la_data_2_2),   // O  24
                                          .axi_clk      (axi_clk),                 // I  
                                          .axis_clk     (axis_clk),                // I  
                                          .axi_reset_n  (axi_reset_n),             // I  
                                          .axis_rst_n   (axis_rst_n),              // I  
                                          .user_clock2  (user_clock2),             // I  
                                          .uck2_rst_n   (uck2_rst_n)               // I  
                                         );


// This code snippet was auto generated by xls2vlog.py from source file: ./user_project_wrapper.xlsx
// User: josh
// Date: Sep-22-23



USER_PRJ3 #(  .pUSER_PROJECT_SIDEBAND_WIDTH ( pUSER_PROJECT_SIDEBAND_WIDTH ), 
        .pADDR_WIDTH( 12 ),
        .pDATA_WIDTH( 32 )) U_USRPRJ3 (
                                          .awready      (awready_3),               // O  
                                          .arready      (arready_3),               // O  
                                          .wready       (wready_3),                // O  
                                          .rvalid       (rvalid_3),                // O  
                                          .rdata        (rdata_3),                 // O  pDATA_WIDTH
                                          .awvalid      (awvalid_3_awvalid),       // I  
                                          .awaddr       (awaddr),                  // I  12
                                          .arvalid      (arvalid_3_arvalid),       // I  
                                          .araddr       (araddr),                  // I  12
                                          .wvalid       (wvalid_3_wvalid),         // I  
                                          .wstrb        (wstrb_3_wstrb),           // I  4
                                          .wdata        (wdata),                   // I  pDATA_WIDTH
                                          .rready       (rready),                  // I  
                                          .ss_tvalid    (ss_tvalid_3_ss_tvalid),   // I  
                                          .ss_tdata     (ss_tdata),                // I  pDATA_WIDTH
                                          .ss_tuser     (ss_tuser),                // I  2
                      `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                       .ss_tupsb     (ss_tupsb),                // I  5    
                      `endif
                                          .ss_tstrb     (ss_tstrb),                // I  4
                                          .ss_tkeep     (ss_tkeep),                // I  4
                                          .ss_tlast     (ss_tlast),                // I  
                                          .sm_tready    (sm_tready),               // I  
                                          .ss_tready    (ss_tready_3),             // O  
                                          .sm_tvalid    (sm_tvalid_3),             // O  
                                          .sm_tdata     (sm_tdata_3),              // O  pDATA_WIDTH
                                          .sm_tid       (sm_tid_3),                // O  3
                      `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                       .sm_tupsb     (sm_tupsb_3),                // I  5    
                      `endif
                                          .sm_tstrb     (sm_tstrb_3),              // O  4
                                          .sm_tkeep     (sm_tkeep_3),              // O  4
                                          .sm_tlast     (sm_tlast_3),              // O  
                                          .low__pri_irq (low__pri_irq_3),          // O  
                                          .High_pri_req (High_pri_req_3),          // O  
                                          .la_data_o    (la_data_o_la_data_3_3),   // O  24
                                          .axi_clk      (axi_clk),                 // I  
                                          .axis_clk     (axis_clk),                // I  
                                          .axi_reset_n  (axi_reset_n),             // I  
                                          .axis_rst_n   (axis_rst_n),              // I  
                                          .user_clock2  (user_clock2),             // I  
                                          .uck2_rst_n   (uck2_rst_n)               // I  
                                         );


// This code snippet was auto generated by xls2vlog.py from source file: ./user_project_wrapper.xlsx
// User: josh
// Date: Sep-22-23



AXIS_SLAV #(.pUSER_PROJECT_SIDEBAND_WIDTH ( pUSER_PROJECT_SIDEBAND_WIDTH ), 
      .pADDR_WIDTH( 12 ),
            .pDATA_WIDTH( 32 )) U_AXIS_SLAV0 (
                                              .ss_tvalid_0  (ss_tvalid_0_ss_tvalid),   // O  
                                              .ss_tdata     (ss_tdata),                // O  pDATA_WIDTH
                                              .ss_tuser     (ss_tuser),                // O  2
                        `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                          .ss_tupsb     (ss_tupsb),                // O  5    
                        `endif
                                              .ss_tstrb     (ss_tstrb),                // O  4
                                              .ss_tkeep     (ss_tkeep),                // O  4
                                              .ss_tlast     (ss_tlast),                // O  
                                              .ss_tvalid_1  (ss_tvalid_1_ss_tvalid),   // O  
                                              .ss_tvalid_2  (ss_tvalid_2_ss_tvalid),   // O  
                                              .ss_tvalid_3  (ss_tvalid_3_ss_tvalid),   // O  
                                              .ss_tready_0  (ss_tready_0),             // I  
                                              .ss_tready_1  (ss_tready_1),             // I  
                                              .ss_tready_2  (ss_tready_2),             // I  
                                              .ss_tready_3  (ss_tready_3),             // I  
                                              .s_tvalid     (s_tvalid),                // I  
                                              .s_tdata      (s_tdata),                 // I  pDATA_WIDTH
                                              .s_tuser      (s_tuser),                 // I  2
                        `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                        .s_tupsb      (s_tupsb),                 // I  4
                        `endif
                                              .s_tstrb      (s_tstrb),                 // I  4
                                              .s_tkeep      (s_tkeep),                 // I  4
                                              .s_tlast      (s_tlast),                 // I  
                                              .s_tready     (s_tready),                // O  
                                              .axis_clk     (axis_clk),                // I  
                                              .axi_reset_n  (axi_reset_n),             // I  
                                              .axis_rst_n   (axis_rst_n),              // I  
                                              .user_prj_sel (user_prj_sel)             // I  5
                                             );


// This code snippet was auto generated by xls2vlog.py from source file: ./user_project_wrapper.xlsx
// User: josh
// Date: Sep-22-23



AXIS_MSTR #(.pUSER_PROJECT_SIDEBAND_WIDTH ( pUSER_PROJECT_SIDEBAND_WIDTH ), 
      .pADDR_WIDTH( 12 ),
            .pDATA_WIDTH( 32 )) U_AXIS_MSTR0 (
                                              .sm_tready    (sm_tready),               // O  
                                              .sm_tvalid_0  (sm_tvalid_0),             // I  
                                              .sm_tdata_0   (sm_tdata_0),              // I  pDATA_WIDTH
                                              .sm_tid_0     (sm_tid_0),                // I  3
                        `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                          .sm_tupsb_0     (sm_tupsb_0),                // I  5    
                        `endif
                                              .sm_tstrb_0   (sm_tstrb_0),              // I  4
                                              .sm_tkeep_0   (sm_tkeep_0),              // I  4
                                              .sm_tlast_0   (sm_tlast_0),              // I  
                                              .sm_tvalid_1  (sm_tvalid_1),             // I  
                                              .sm_tdata_1   (sm_tdata_1),              // I  pDATA_WIDTH
                                              .sm_tid_1     (sm_tid_1),                // I  3
                        `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                          .sm_tupsb_1     (sm_tupsb_1),                // I  5    
                        `endif
                                              .sm_tstrb_1   (sm_tstrb_1),              // I  4
                                              .sm_tkeep_1   (sm_tkeep_1),              // I  4
                                              .sm_tlast_1   (sm_tlast_1),              // I  
                                              .sm_tvalid_2  (sm_tvalid_2),             // I  
                                              .sm_tdata_2   (sm_tdata_2),              // I  pDATA_WIDTH
                                              .sm_tid_2     (sm_tid_2),                // I  3
                        `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                          .sm_tupsb_2     (sm_tupsb_2),                // I  5    
                        `endif
                                              .sm_tstrb_2   (sm_tstrb_2),              // I  4
                                              .sm_tkeep_2   (sm_tkeep_2),              // I  4
                                              .sm_tlast_2   (sm_tlast_2),              // I  
                                              .sm_tvalid_3  (sm_tvalid_3),             // I  
                                              .sm_tdata_3   (sm_tdata_3),              // I  pDATA_WIDTH
                                              .sm_tid_3     (sm_tid_3),                // I  3
                        `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                          .sm_tupsb_3     (sm_tupsb_3),                // I  5    
                        `endif
                                              .sm_tstrb_3   (sm_tstrb_3),              // I  4
                                              .sm_tkeep_3   (sm_tkeep_3),              // I  4
                                              .sm_tlast_3   (sm_tlast_3),              // I  
                                              .m_tready     (m_tready),                // I  
                                              .m_tvalid     (m_tvalid),                // O  
                                              .m_tdata      (m_tdata),                 // O  pDATA_WIDTH
                                              .m_tuser      (m_tuser),                 // O  2
                        `ifdef USER_PROJECT_SIDEBAND_SUPPORT
                        .m_tupsb      (m_tupsb),                 // O  5
                        `endif
                                              .m_tstrb      (m_tstrb),                 // O  4
                                              .m_tkeep      (m_tkeep),                 // O  4
                                              .m_tlast      (m_tlast),                 // O  
                                              .axis_clk     (axis_clk),                // I  
                                              .axi_reset_n  (axi_reset_n),             // I  
                                              .axis_rst_n   (axis_rst_n),              // I  
                                              .user_prj_sel (user_prj_sel)             // I  5
                                             );


// This code snippet was auto generated by xls2vlog.py from source file: ./user_project_wrapper.xlsx
// User: josh
// Date: Sep-22-23



IRQ_MUX #(.pADDR_WIDTH( 10 )) U_IRQ_MUX0 (
                                          .low__pri_irq_0 (low__pri_irq_0),          // I  
                                          .High_pri_req_0 (High_pri_req_0),          // I  
                                          .low__pri_irq_1 (low__pri_irq_1),          // I  
                                          .High_pri_req_1 (High_pri_req_1),          // I  
                                          .low__pri_irq_2 (low__pri_irq_2),          // I  
                                          .High_pri_req_2 (High_pri_req_2),          // I  
                                          .low__pri_irq_3 (low__pri_irq_3),          // I  
                                          .High_pri_req_3 (High_pri_req_3),          // I  
                                          .low__pri_irq   (low__pri_irq),            // O  
                                          .high_pri_irq   (high_pri_irq),            // O  
                                          .axi_clk        (axi_clk),                 // I  
                                          .axi_reset_n    (axi_reset_n),             // I  
                                          .axis_rst_n     (axis_rst_n),              // I  
                                          .user_prj_sel   (user_prj_sel)             // I  5
                                         );


// This code snippet was auto generated by xls2vlog.py from source file: ./user_project_wrapper.xlsx
// User: josh
// Date: Sep-22-23



LA_MUX #(.pADDR_WIDTH( 12 ),
         .pDATA_WIDTH( 32 )) U_LA_MUX0 (
                                        .la_data_0    (la_data_o_la_data_0_0),   // I  24
                                        .la_data_1    (la_data_o_la_data_1_1),   // I  24
                                        .la_data_2    (la_data_o_la_data_2_2),   // I  24
                                        .la_data_3    (la_data_o_la_data_3_3),   // I  24
                                        .up_la_data   (up_la_data),              // O  24
                                        .axi_clk      (axi_clk),                 // I  
                                        .axis_clk     (axis_clk),                // I  
                                        .axi_reset_n  (axi_reset_n),             // I  
                                        .axis_rst_n   (axis_rst_n),              // I  
                                        .user_prj_sel (user_prj_sel)             // I  5
                                       );




endmodule // USER_SUBSYS


