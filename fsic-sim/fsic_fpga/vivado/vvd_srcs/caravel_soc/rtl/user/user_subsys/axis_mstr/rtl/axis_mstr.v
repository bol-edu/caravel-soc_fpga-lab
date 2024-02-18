//////////////////////////////////////////////////////////////////////////////////
// Author : Tony Ho
//
// Create Date: 11/20/2023
// Design Name:
// Module Name: AXIS_MSTR
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
module AXIS_MSTR #( parameter pUSER_PROJECT_SIDEBAND_WIDTH = 5,
          parameter pADDR_WIDTH   = 12,
                    parameter pDATA_WIDTH   = 32
                  )
(
  output wire                        sm_tready,
  input  wire                        sm_tvalid_0,
  input  wire  [(pDATA_WIDTH-1) : 0] sm_tdata_0,
  input  wire                 [2: 0] sm_tid_0,
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
  input  wire                 [pUSER_PROJECT_SIDEBAND_WIDTH-1: 0] sm_tupsb_0,
`endif
  input  wire                 [3: 0] sm_tstrb_0,
  input  wire                 [3: 0] sm_tkeep_0,
  input  wire                        sm_tlast_0,
  input  wire                        sm_tvalid_1,
  input  wire  [(pDATA_WIDTH-1) : 0] sm_tdata_1,
  input  wire                 [2: 0] sm_tid_1,
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
  input  wire                 [pUSER_PROJECT_SIDEBAND_WIDTH-1: 0] sm_tupsb_1,
`endif
  input  wire                 [3: 0] sm_tstrb_1,
  input  wire                 [3: 0] sm_tkeep_1,
  input  wire                        sm_tlast_1,
  input  wire                        sm_tvalid_2,
  input  wire  [(pDATA_WIDTH-1) : 0] sm_tdata_2,
  input  wire                 [2: 0] sm_tid_2,
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
  input  wire                 [pUSER_PROJECT_SIDEBAND_WIDTH-1: 0] sm_tupsb_2,
`endif
  input  wire                 [3: 0] sm_tstrb_2,
  input  wire                 [3: 0] sm_tkeep_2,
  input  wire                        sm_tlast_2,
  input  wire                        sm_tvalid_3,
  input  wire  [(pDATA_WIDTH-1) : 0] sm_tdata_3,
  input  wire                 [2: 0] sm_tid_3,
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
  input  wire                 [pUSER_PROJECT_SIDEBAND_WIDTH-1: 0] sm_tupsb_3,
`endif
  input  wire                 [3: 0] sm_tstrb_3,
  input  wire                 [3: 0] sm_tkeep_3,
  input  wire                        sm_tlast_3,
  input  wire                        m_tready,
  output wire                        m_tvalid,
  output wire  [(pDATA_WIDTH-1) : 0] m_tdata,
  output wire                 [1: 0] m_tuser,
  `ifdef USER_PROJECT_SIDEBAND_SUPPORT
   output  wire                 [pUSER_PROJECT_SIDEBAND_WIDTH-1: 0] m_tupsb,
  `endif
  output wire                 [3: 0] m_tstrb,
  output wire                 [3: 0] m_tkeep,
  output wire                        m_tlast,
  input  wire                        axis_clk,
  input  wire                        axi_reset_n,
  input  wire                        axis_rst_n,
  input  wire                 [4: 0] user_prj_sel
);

//common part
assign sm_tready =  m_tready;

//bus
wire [3:0] sm_tvalid_bus;
assign  m_tvalid = |sm_tvalid_bus;

wire [(pDATA_WIDTH-1) : 0] sm_tdata_bus[3:0];
assign  m_tdata = sm_tdata_bus[0] | sm_tdata_bus[1] | sm_tdata_bus[2] | sm_tdata_bus[3];

//wire [2: 0] sm_tid_bus;

`ifdef USER_PROJECT_SIDEBAND_SUPPORT
  wire [pUSER_PROJECT_SIDEBAND_WIDTH-1: 0] sm_tupsb_bus[3:0];
  assign  m_tupsb = sm_tupsb_bus[0] | sm_tupsb_bus[1] | sm_tupsb_bus[2] | sm_tupsb_bus[3];
`endif

wire [3: 0] sm_tstrb_bus[3:0];
assign  m_tstrb = sm_tstrb_bus[0] | sm_tstrb_bus[1] | sm_tstrb_bus[2] | sm_tstrb_bus[3];

wire [3: 0] sm_tkeep_bus[3:0];
assign  m_tkeep = sm_tkeep_bus[0] | sm_tkeep_bus[1] | sm_tkeep_bus[2] | sm_tkeep_bus[3];

wire [3: 0] sm_tlast_bus[3:0];
assign  m_tlast = sm_tlast_bus[0] | sm_tlast_bus[1] | sm_tlast_bus[2] | sm_tlast_bus[3];

//user project 0 
assign sm_tvalid_bus[0] =  (user_prj_sel == 5'b00000)  ? sm_tvalid_0 : 0;
assign sm_tdata_bus[0] = (user_prj_sel == 5'b00000)  ? sm_tdata_0 : 0;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
  assign sm_tupsb_bus[0] = (user_prj_sel == 5'b00000)  ? sm_tupsb_0 : 0;
`endif
assign sm_tstrb_bus[0] = (user_prj_sel == 5'b00000)  ? sm_tstrb_0 : 0;
assign sm_tkeep_bus[0] = (user_prj_sel == 5'b00000)  ? sm_tkeep_0 : 0;
assign sm_tlast_bus[0] = (user_prj_sel == 5'b00000)  ? sm_tlast_0 : 0;

//user project 1 
assign sm_tvalid_bus[1] =  (user_prj_sel == 5'b00001)  ? sm_tvalid_1 : 0;
assign sm_tdata_bus[1] = (user_prj_sel == 5'b00001)  ? sm_tdata_1 : 0;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
  assign sm_tupsb_bus[1] = (user_prj_sel == 5'b00001)  ? sm_tupsb_1 : 0;
`endif
assign sm_tstrb_bus[1] = (user_prj_sel == 5'b00001)  ? sm_tstrb_1 : 0;
assign sm_tkeep_bus[1] = (user_prj_sel == 5'b00001)  ? sm_tkeep_1 : 0;
assign sm_tlast_bus[1] = (user_prj_sel == 5'b00001)  ? sm_tlast_1 : 0;

//user project 2 
assign sm_tvalid_bus[2] =  (user_prj_sel == 5'b00010)  ? sm_tvalid_2 : 0;
assign sm_tdata_bus[2] = (user_prj_sel == 5'b00010)  ? sm_tdata_2 : 0;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
  assign sm_tupsb_bus[2] = (user_prj_sel == 5'b00010)  ? sm_tupsb_2 : 0;
`endif
assign sm_tstrb_bus[2] = (user_prj_sel == 5'b00010)  ? sm_tstrb_2 : 0;
assign sm_tkeep_bus[2] = (user_prj_sel == 5'b00010)  ? sm_tkeep_2 : 0;
assign sm_tlast_bus[2] = (user_prj_sel == 5'b00010)  ? sm_tlast_2 : 0;

//user project 3 
assign sm_tvalid_bus[3] =  (user_prj_sel == 5'b00011)  ? sm_tvalid_3 : 0;
assign sm_tdata_bus[3] = (user_prj_sel == 5'b00011)  ? sm_tdata_3 : 0;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
  assign sm_tupsb_bus[3] = (user_prj_sel == 5'b00011)  ? sm_tupsb_3 : 0;
`endif
assign sm_tstrb_bus[3] = (user_prj_sel == 5'b00011)  ? sm_tstrb_3 : 0;
assign sm_tkeep_bus[3] = (user_prj_sel == 5'b00011)  ? sm_tkeep_3 : 0;
assign sm_tlast_bus[3] = (user_prj_sel == 5'b00011)  ? sm_tlast_3 : 0;

assign m_tuser       = 2'b00;    //MUST be 2'b00 for user project output axis from UP to AS.


endmodule // AXIS_MSTR

