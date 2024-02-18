//////////////////////////////////////////////////////////////////////////////////
// Author : Tony Ho
//
// Create Date: 11/20/2023
// Design Name:
// Module Name: IRQ_MUX
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
module IRQ_MUX #( parameter pADDR_WIDTH=10
                )
(
  input  wire         low__pri_irq_0,
  input  wire         High_pri_req_0,
  input  wire         low__pri_irq_1,
  input  wire         High_pri_req_1,
  input  wire         low__pri_irq_2,
  input  wire         High_pri_req_2,
  input  wire         low__pri_irq_3,
  input  wire         High_pri_req_3,
  output wire         low__pri_irq,
  output wire         high_pri_irq,
  input  wire         axi_clk,
  input  wire         axi_reset_n,
  input  wire         axis_rst_n,
  input  wire  [4: 0] user_prj_sel
);


assign low__pri_irq = (user_prj_sel == 5'b00000) ? low__pri_irq_0 :
                      (user_prj_sel == 5'b00001) ? low__pri_irq_1 :
                      (user_prj_sel == 5'b00010) ? low__pri_irq_2 :
                      (user_prj_sel == 5'b00011) ? low__pri_irq_3 :
                      1'b0;
                      
assign high_pri_irq = (user_prj_sel == 5'b00000) ? High_pri_req_0 :
                      (user_prj_sel == 5'b00001) ? High_pri_req_1 :
                      (user_prj_sel == 5'b00010) ? High_pri_req_2 :
                      (user_prj_sel == 5'b00011) ? High_pri_req_3 :
                      1'b0;


endmodule // IRQ_MUX

