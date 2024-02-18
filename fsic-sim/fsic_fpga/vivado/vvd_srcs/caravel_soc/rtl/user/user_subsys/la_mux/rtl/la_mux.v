//////////////////////////////////////////////////////////////////////////////////
// Author : Tony Ho
//
// Create Date: 11/20/2023
// Design Name:
// Module Name: LA_MUX
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
module LA_MUX #( parameter pADDR_WIDTH   = 12,
                 parameter pDATA_WIDTH   = 32
               )
(
  input  wire  [23: 0] la_data_0,
  input  wire  [23: 0] la_data_1,
  input  wire  [23: 0] la_data_2,
  input  wire  [23: 0] la_data_3,
  output wire  [23: 0] up_la_data,
  input  wire          axi_clk,
  input  wire          axis_clk,
  input  wire          axi_reset_n,
  input  wire          axis_rst_n,
  input  wire   [4: 0] user_prj_sel
);


assign up_la_data = (user_prj_sel == 5'b00000) ? la_data_0 :
                    (user_prj_sel == 5'b00001) ? la_data_1 :
                    (user_prj_sel == 5'b00010) ? la_data_2 :
                    (user_prj_sel == 5'b00011) ? la_data_3 :
                    24'b0;

endmodule // LA_MUX

