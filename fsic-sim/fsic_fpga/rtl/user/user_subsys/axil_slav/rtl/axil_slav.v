//////////////////////////////////////////////////////////////////////////////////
// Author : Tony Ho
//
// Create Date: 11/20/2023
// Design Name:
// Module Name: AXIL_SLAV
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
module AXIL_SLAV #( parameter pADDR_WIDTH   = 12,
                    parameter pDATA_WIDTH   = 32
                  )
(
  input  wire                        awready_0,
  input  wire                        arready_0,
  input  wire                        wready_0,
  input  wire                        rvalid_0,
  input  wire  [(pDATA_WIDTH-1) : 0] rdata_0,
  input  wire                        awready_1,
  input  wire                        arready_1,
  input  wire                        wready_1,
  input  wire                        rvalid_1,
  input  wire  [(pDATA_WIDTH-1) : 0] rdata_1,
  input  wire                        awready_2,
  input  wire                        arready_2,
  input  wire                        wready_2,
  input  wire                        rvalid_2,
  input  wire  [(pDATA_WIDTH-1) : 0] rdata_2,
  input  wire                        awready_3,
  input  wire                        arready_3,
  input  wire                        wready_3,
  input  wire                        rvalid_3,
  input  wire  [(pDATA_WIDTH-1) : 0] rdata_3,
  output wire                        awvalid_0,
  output wire                [11: 0] awaddr,
  output wire                        arvalid_0,
  output wire                [11: 0] araddr,
  output wire                        wvalid_0,
  output wire                 [3: 0] wstrb_0,
  output wire  [(pDATA_WIDTH-1) : 0] wdata,
  output wire                        rready,
  output wire                        awvalid_1,
  output wire                        arvalid_1,
  output wire                        wvalid_1,
  output wire                 [3: 0] wstrb_1,
  output wire                        awvalid_2,
  output wire                        arvalid_2,
  output wire                        wvalid_2,
  output wire                 [3: 0] wstrb_2,
  output wire                        awvalid_3,
  output wire                        arvalid_3,
  output wire                        wvalid_3,
  output wire                 [3: 0] wstrb_3,
  input  wire                        axi_awvalid,
  input  wire                [14: 0] axi_awaddr,
  input  wire                        axi_arvalid,
  input  wire                [14: 0] axi_araddr,
  input  wire                        axi_wvalid,
  input  wire                 [3: 0] axi_wstrb,
  input  wire  [(pDATA_WIDTH-1) : 0] axi_wdata,
  input  wire                        axi_rready,
  input  wire                        cc_up_enable,
  output wire                        axi_awready,
  output wire                        axi_arready,
  output wire                        axi_wready,
  output wire                        axi_rvalid,
  output wire  [(pDATA_WIDTH-1) : 0] axi_rdata,
  input  wire                        axi_clk,
  input  wire                        axi_reset_n,
  input  wire                 [4: 0] user_prj_sel
);

wire  [3:0] axi_awready_bus;
assign axi_awready = |axi_awready_bus;

wire  [3:0] axi_wready_bus;
assign axi_wready = |axi_wready_bus;

wire  [3:0] axi_arready_bus;
assign axi_arready = |axi_arready_bus;

wire  [3:0] axi_rvalid_bus;
assign axi_rvalid = |axi_rvalid_bus;

wire  [(pDATA_WIDTH-1) : 0] axi_rdata_bus[3:0];
assign axi_rdata = axi_rdata_bus[0] | axi_rdata_bus[1] | axi_rdata_bus[2] | axi_rdata_bus[3];

//user project 0 
assign awvalid_0 = ( (user_prj_sel == 5'b00000) && cc_up_enable) ? axi_awvalid : 0;
assign axi_awready_bus[0] = ( (user_prj_sel == 5'b00000) && cc_up_enable) ? awready_0 : 0;
assign awaddr = axi_awaddr[11:0];
assign wstrb_0 = axi_wstrb;    //[TODO] share wstrb for all user projects.

assign wvalid_0 = ( (user_prj_sel == 5'b00000) && cc_up_enable) ? axi_wvalid : 0;
assign axi_wready_bus[0] = ( (user_prj_sel == 5'b00000) && cc_up_enable) ? wready_0 : 0;
assign wdata = axi_wdata;

assign arvalid_0 = ( (user_prj_sel == 5'b00000) && cc_up_enable) ? axi_arvalid : 0;
assign axi_arready_bus[0] = ( (user_prj_sel == 5'b00000) && cc_up_enable) ? arready_0 : 0;
assign araddr = axi_araddr;

assign axi_rvalid_bus[0] = ( (user_prj_sel == 5'b00000) && cc_up_enable) ? rvalid_0 : 0;
assign rready = axi_rready;
assign axi_rdata_bus[0] = ( (user_prj_sel == 5'b00000) && cc_up_enable) ? rdata_0 : 0;

//user project 1 
assign awvalid_1 = ( (user_prj_sel == 5'b00001) && cc_up_enable) ? axi_awvalid : 0;
assign axi_awready_bus[1] = ( (user_prj_sel == 5'b00001) && cc_up_enable) ? awready_1 : 0; //awready_0 : 0; // Modified
assign awaddr = axi_awaddr[11:0];
assign wstrb_1 = axi_wstrb;    //[TODO] share wstrb for all user projects.

assign wvalid_1 = ( (user_prj_sel == 5'b00001) && cc_up_enable) ? axi_wvalid : 0;
assign axi_wready_bus[1] = ( (user_prj_sel == 5'b00001) && cc_up_enable) ? wready_1 : 0; //wready_0 : 0; // Modified
assign wdata = axi_wdata;

assign arvalid_1 = ( (user_prj_sel == 5'b00001) && cc_up_enable) ? axi_arvalid : 0;
assign axi_arready_bus[1] = ( (user_prj_sel == 5'b00001) && cc_up_enable) ? arready_1 : 0;//arready_0 : 0; // Modified
assign araddr = axi_araddr;

assign axi_rvalid_bus[1] = ( (user_prj_sel == 5'b00001) && cc_up_enable) ? rvalid_1 : 0; //rvalid_0 : 0; // Modified
assign rready = axi_rready;
assign axi_rdata_bus[1] = ( (user_prj_sel == 5'b00001) && cc_up_enable) ? rdata_1 : 0; //rdata_0 : 0; // Modified

//user project 2 
assign awvalid_2 = ( (user_prj_sel == 5'b00010) && cc_up_enable) ? axi_awvalid : 0;
assign axi_awready_bus[2] = ( (user_prj_sel == 5'b00010) && cc_up_enable) ? awready_2 : 0; //awready_0 : 0; // Modified
assign awaddr = axi_awaddr[11:0];
assign wstrb_2 = axi_wstrb;    //[TODO] share wstrb for all user projects.

assign wvalid_2 = ( (user_prj_sel == 5'b00010) && cc_up_enable) ? axi_wvalid : 0;
assign axi_wready_bus[2] = ( (user_prj_sel == 5'b00010) && cc_up_enable) ? wready_2 : 0; //wready_0 : 0; // Modified
assign wdata = axi_wdata;

assign arvalid_2 = ( (user_prj_sel == 5'b00010) && cc_up_enable) ? axi_arvalid : 0;
assign axi_arready_bus[2] = ( (user_prj_sel == 5'b00010) && cc_up_enable) ? arready_2 : 0; //arready_0 : 0; // Modified
assign araddr = axi_araddr;

assign axi_rvalid_bus[2] = ( (user_prj_sel == 5'b00010) && cc_up_enable) ? rvalid_2 : 0; //rvalid_0 : 0; // Modified
assign rready = axi_rready;
assign axi_rdata_bus[2] = ( (user_prj_sel == 5'b00010) && cc_up_enable) ? rdata_2 : 0; //rdata_0 : 0; // Modified

//user project 3 
assign awvalid_3 = ( (user_prj_sel == 5'b00011) && cc_up_enable) ? axi_awvalid : 0;
assign axi_awready_bus[3] = ( (user_prj_sel == 5'b00011) && cc_up_enable) ? awready_3 : 0; //awready_0 : 0; // Modified
assign awaddr = axi_awaddr[11:0];
assign wstrb_3 = axi_wstrb;    //[TODO] share wstrb for all user projects.

assign wvalid_3 = ( (user_prj_sel == 5'b00011) && cc_up_enable) ? axi_wvalid : 0;
assign axi_wready_bus[3] = ( (user_prj_sel == 5'b00011) && cc_up_enable) ? wready_3 : 0; //wready_0 : 0; // Modified
assign wdata = axi_wdata;

assign arvalid_3 = ( (user_prj_sel == 5'b00011) && cc_up_enable) ? axi_arvalid : 0;
assign axi_arready_bus[3] = ( (user_prj_sel == 5'b00011) && cc_up_enable) ? arready_3 : 0; //arready_0 : 0; // Modified
assign araddr = axi_araddr;

assign axi_rvalid_bus[3] = ( (user_prj_sel == 5'b00011) && cc_up_enable) ? rvalid_3 : 0; //rvalid_0 : 0; // Modified
assign rready = axi_rready;
assign axi_rdata_bus[3] = ( (user_prj_sel == 5'b00011) && cc_up_enable) ? rdata_3 : 0; //rdata_0 : 0; // Modified


endmodule // AXIL_SLAV

