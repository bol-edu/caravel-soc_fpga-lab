//////////////////////////////////////////////////////////////////////////////////
// Author : Tony Ho
//
// Create Date: 11/20/2023
// Design Name:
// Module Name: AXIS_SLAV
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
module AXIS_SLAV #( parameter pUSER_PROJECT_SIDEBAND_WIDTH = 5,
          parameter pADDR_WIDTH   = 12,
                    parameter pDATA_WIDTH   = 32
                  )
(
  output wire                        ss_tvalid_0,
  output wire  [(pDATA_WIDTH-1) : 0] ss_tdata,
  output wire                 [1: 0] ss_tuser,
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
  output  wire                 [pUSER_PROJECT_SIDEBAND_WIDTH-1: 0] ss_tupsb,
`endif
  output wire                 [3: 0] ss_tstrb,
  output wire                 [3: 0] ss_tkeep,
  output wire                        ss_tlast,
  output wire                        ss_tvalid_1,
  output wire                        ss_tvalid_2,
  output wire                        ss_tvalid_3,
  input  wire                        ss_tready_0,
  input  wire                        ss_tready_1,
  input  wire                        ss_tready_2,
  input  wire                        ss_tready_3,
  input  wire                        s_tvalid,
  input  wire  [(pDATA_WIDTH-1) : 0] s_tdata,
  input  wire                 [1: 0] s_tuser,
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
  input  wire                 [pUSER_PROJECT_SIDEBAND_WIDTH-1: 0] s_tupsb,
`endif
  input  wire                 [3: 0] s_tstrb,
  input  wire                 [3: 0] s_tkeep,
  input  wire                        s_tlast,
  output wire                        s_tready,
  input  wire                        axis_clk,
  input  wire                        axi_reset_n,
  input  wire                        axis_rst_n,
  input  wire                 [4: 0] user_prj_sel
);

//common part
assign ss_tdata =  s_tdata;
assign ss_tuser =  2'b00;    //UP always received tuser = 2'b00, the tuser is used by AS, should not send to UP.
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
  assign ss_tupsb =  s_tupsb;
`endif
assign ss_tstrb =  s_tstrb;
assign ss_tkeep =  s_tkeep;
assign ss_tlast =  s_tlast;

wire [3:0] s_tready_bus;
assign  s_tready = |s_tready_bus;

//user project 0 
assign ss_tvalid_0 =  (user_prj_sel == 5'b00000)  ? s_tvalid : 0;
assign s_tready_bus[0] = (user_prj_sel == 5'b00000)  ? ss_tready_0 : 0;

//user project 1 
assign ss_tvalid_1 =  (user_prj_sel == 5'b00001)  ? s_tvalid : 0;
assign s_tready_bus[1] = (user_prj_sel == 5'b00001)  ? ss_tready_1 : 0;

//user project 2 
assign ss_tvalid_2 =  (user_prj_sel == 5'b00010)  ? s_tvalid : 0;
assign s_tready_bus[2] = (user_prj_sel == 5'b00010)  ? ss_tready_2 : 0;

//user project 3 
assign ss_tvalid_3 =  (user_prj_sel == 5'b00011)  ? s_tvalid : 0;
assign s_tready_bus[3] = (user_prj_sel == 5'b00011)  ? ss_tready_3 : 0;




endmodule // AXIS_SLAV

