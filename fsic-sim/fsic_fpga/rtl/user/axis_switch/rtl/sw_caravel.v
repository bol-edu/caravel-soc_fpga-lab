/*--------------------------------------------------------------------------------*/
/* MIT License                                                                    */
/*                                                                                */
/* Copyright (c) 2023 VIA NEXT Technologies, Inc - <Hurry Lin>                    */
/*                                                                                */
/* Permission is hereby granted, free of charge, to any person obtaining a copy   */
/* of this software and associated documentation files (the "Software"), to deal  */
/* in the Software without restriction, including without limitation the rights   */
/* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell      */
/* copies of the Software, and to permit persons to whom the Software is          */
/* furnished to do so, subject to the following conditions:                       */
/*                                                                                */
/* The above copyright notice and this permission notice shall be included in all */
/* copies or substantial portions of the Software.                                */
/*                                                                                */
/* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR     */
/* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,       */
/* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE    */
/* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER         */
/* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  */
/* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE  */
/* SOFTWARE.                                                                      */
/*--------------------------------------------------------------------------------*/
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/14 10:28:55
// Design Name: 
// Module Name: AXIS_SW
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


module AXIS_SW #(
				parameter pUSER_PROJECT_SIDEBAND_WIDTH   = 5,
				parameter pADDR_WIDTH   = 10,
                parameter pDATA_WIDTH   = 32
                )
(
    input  wire                             axi_reset_n,    
    input  wire                             axis_clk,
    input  wire                             axis_rst_n,
    //axi_lite slave interface
    //write addr channel
    input wire 	axi_awvalid,
    input wire 	[14:0] axi_awaddr,		
	output wire	axi_awready,
	//write data channel
	input wire 	axi_wvalid,
	input wire 	[pDATA_WIDTH-1:0] axi_wdata,
	input wire 	[(pDATA_WIDTH/8)-1:0] axi_wstrb,
	output wire	axi_wready,
	//read addr channel
	input wire 	axi_arvalid,
	input wire 	[14:0] axi_araddr,
	output wire axi_arready,
	//read data channel
	output wire axi_rvalid,
	output wire [pDATA_WIDTH-1:0] axi_rdata,
	input wire 	axi_rready,
	input wire 	cc_as_enable,		//axi_lite enable        
    //AXI Stream inputs for User Project grant 0
    input  wire [pDATA_WIDTH-1:0]           up_as_tdata,
	`ifdef USER_PROJECT_SIDEBAND_SUPPORT
		input wire 	[pUSER_PROJECT_SIDEBAND_WIDTH-1:0] up_as_tupsb,
	`endif
    input  wire [pDATA_WIDTH/8-1:0]         up_as_tstrb,
    input  wire [pDATA_WIDTH/8-1:0]         up_as_tkeep,  
    input  wire                             up_as_tlast,      
    input  wire                             up_as_tvalid,
    input  wire [1:0]                       up_as_tuser, 
	input  wire                             up_hpri_req,
    output wire                             as_up_tready,
    //AXI Stream inputs for Axis Axilite grant 1
    input  wire [pDATA_WIDTH-1:0]           aa_as_tdata,
    input  wire [pDATA_WIDTH/8-1:0]         aa_as_tstrb,
    input  wire [pDATA_WIDTH/8-1:0]         aa_as_tkeep,   
    input  wire                             aa_as_tlast,       
    input  wire                             aa_as_tvalid,
    input  wire [1:0]                       aa_as_tuser,       
    output wire                             as_aa_tready,
    //AXI Stream inputs for Logic Analyzer grant 2
    input  wire [pDATA_WIDTH-1:0]           la_as_tdata,
    input  wire [pDATA_WIDTH/8-1:0]         la_as_tstrb,
    input  wire [pDATA_WIDTH/8-1:0]         la_as_tkeep, 
    input  wire                             la_as_tlast,          
    input  wire                             la_as_tvalid,
    input  wire [1:0]                       la_as_tuser,      
	input  wire                             la_hpri_req,
    output wire                             as_la_tready,
    //AXI Stream outputs for IO Serdes
    output  wire [pDATA_WIDTH-1:0]          as_is_tdata,
	`ifdef USER_PROJECT_SIDEBAND_SUPPORT
		output wire 	[pUSER_PROJECT_SIDEBAND_WIDTH-1:0] as_is_tupsb,
	`endif
    output  wire [pDATA_WIDTH/8-1:0]        as_is_tstrb,
    output  wire [pDATA_WIDTH/8-1:0]        as_is_tkeep, 
    output  wire                            as_is_tlast,        
    output  wire [1:0]                      as_is_tid, 
    output  wire                            as_is_tvalid,
    output  wire [1:0]                      as_is_tuser,     
    input	wire                            is_as_tready,
    //Demux
    //AXI Input Stream for IO_Serdes
    input  wire [pDATA_WIDTH-1:0]           is_as_tdata,
	`ifdef USER_PROJECT_SIDEBAND_SUPPORT
		input wire 	[pUSER_PROJECT_SIDEBAND_WIDTH-1:0] is_as_tupsb,
	`endif
    input  wire [pDATA_WIDTH/8-1:0]         is_as_tstrb,    
    input  wire [pDATA_WIDTH/8-1:0]         is_as_tkeep,
    input  wire                             is_as_tlast,
    input  wire [1:0]                       is_as_tid,
    input  wire                             is_as_tvalid,
    input  wire [1:0]                       is_as_tuser,
    output wire                             as_is_tready,
    //AXI Output Stream for User Project
    output wire [pDATA_WIDTH-1:0]           as_up_tdata,
	`ifdef USER_PROJECT_SIDEBAND_SUPPORT
		output wire 	[pUSER_PROJECT_SIDEBAND_WIDTH-1:0] as_up_tupsb,
	`endif
    output wire [pDATA_WIDTH/8-1:0]         as_up_tstrb,    
    output wire [pDATA_WIDTH/8-1:0]         as_up_tkeep,
    output wire                             as_up_tlast,
    output wire                             as_up_tvalid,
    output wire [1:0]                       as_up_tuser,    
    input  wire                             up_as_tready,   
    //AXI Output Stream for Axis_Axilite
    output wire [pDATA_WIDTH-1:0]           as_aa_tdata,
    output wire [pDATA_WIDTH/8-1:0]         as_aa_tstrb,    
    output wire [pDATA_WIDTH/8-1:0]         as_aa_tkeep,
    output wire                             as_aa_tlast,    
    output wire                             as_aa_tvalid,
    output wire [1:0]                       as_aa_tuser, 
    input  wire                             aa_as_tready
);
localparam  USER_WIDTH = 2;
localparam  TID_WIDTH = 2;   
//for arbiter
localparam N = 3; //Upstream master Num for Input port
//source 0 support req/hi_req for user project
//source 1 support req for axilite_axis
//source 2 support req/hi_req for Logic Analyzer
localparam req_mask = 3'b111; //normal request mask for Upstream
localparam hi_req_mask = 3'b101; //high request mask for Upstream 
localparam last_support = 3'b000; //last signal support for hi request
//for Demux
// FIFO depth
localparam  FIFO_DEPTH = 16;   
//FIFO address width
localparam ADDR_WIDTH   = $clog2(FIFO_DEPTH);
//field offset for mem unit 
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
	localparam UPSB_OFFSET  = pDATA_WIDTH;
	localparam STRB_OFFSET  = UPSB_OFFSET + pUSER_PROJECT_SIDEBAND_WIDTH;
`else
	localparam STRB_OFFSET  = pDATA_WIDTH;
`endif
localparam KEEP_OFFSET  = STRB_OFFSET + pDATA_WIDTH/8;
localparam LAST_OFFSET  = KEEP_OFFSET + pDATA_WIDTH/8;
localparam TID_OFFSET   = LAST_OFFSET + 1;
localparam USER_OFFSET  = TID_OFFSET  + TID_WIDTH;
localparam WIDTH        = USER_OFFSET + USER_WIDTH;
//axi_lite reg
//FIFO threshold setting
reg [3:0] TH_reg = 4'h6; //offset0, bit3:0
wire axi_awvalid_in;
wire axi_wvalid_in;
wire axi_awready_out;
wire axi_wready_out;
//For Arbiter
wire [N-1:0]                req, hi_req;
reg  [N-1:0]                shift_req, shift_hi_req;
reg  [$clog2(N)-1:0]        base_ptr;   
reg  [N-1:0]                grant_reg = 3'b000, grant_next, shift_grant = 3'b000, shift_hi_grant= 3'b000;
reg                         frame_start_reg = 1'b0, frame_start_next;   
reg [N-1:0]                 hi_req_flag;
reg [pDATA_WIDTH-1:0]       m_axis_tdata_reg;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
	reg [pUSER_PROJECT_SIDEBAND_WIDTH-1:0]     m_axis_tupsb_reg;
`endif
reg [pDATA_WIDTH/8-1:0]     m_axis_tstrb_reg;
reg [pDATA_WIDTH/8-1:0]     m_axis_tkeep_reg; 
reg                         m_axis_tlast_reg;        
reg                         m_axis_tvalid_reg = 1'b0;
reg [USER_WIDTH-1:0]        m_axis_tuser_reg;     
reg [TID_WIDTH-1:0]         m_axis_tid_reg;
//for Demux
//FIFO control pointer
reg [ADDR_WIDTH:0] wr_ptr_reg = {ADDR_WIDTH+1{1'b0}};
reg [ADDR_WIDTH:0] rd_ptr_reg = {ADDR_WIDTH+1{1'b0}};
(* ramstyle = "no_rw_check" *)
reg [WIDTH-1:0] mem[(2**ADDR_WIDTH)-1:0];
wire above_th = ((wr_ptr_reg - rd_ptr_reg) > TH_reg);
reg as_is_tready_reg;   
wire [WIDTH-1:0] s_axis;
generate
    assign s_axis[pDATA_WIDTH-1:0]                  = is_as_tdata;
	`ifdef USER_PROJECT_SIDEBAND_SUPPORT
		assign s_axis[UPSB_OFFSET +: pUSER_PROJECT_SIDEBAND_WIDTH]     = is_as_tupsb;
	`endif
    assign s_axis[STRB_OFFSET +: pDATA_WIDTH/8]     = is_as_tstrb;
    assign s_axis[KEEP_OFFSET +: pDATA_WIDTH/8]     = is_as_tkeep;
    assign s_axis[LAST_OFFSET]                      = is_as_tlast;
    assign s_axis[TID_OFFSET   +: TID_WIDTH]        = is_as_tid;
    assign s_axis[USER_OFFSET +: USER_WIDTH]        = is_as_tuser;
endgenerate
wire [WIDTH-1:0] m_axis = mem[rd_ptr_reg[ADDR_WIDTH-1:0]];    
assign as_is_tready = as_is_tready_reg;     
//for axi_lite
//write addr channel
assign axi_awvalid_in = axi_awvalid && cc_as_enable;
assign axi_awready = axi_awready_out;
//write data channel
assign axi_wvalid_in = axi_wvalid && cc_as_enable;
assign axi_wready = axi_wready_out;
// if both axi_awvalid_in=1 and axi_wvalid_in=1 then output axi_awready_out = 1 and axi_wready_out = 1
assign axi_awready_out = (axi_awvalid_in && axi_wvalid_in) ? 1 : 0;
assign axi_wready_out = (axi_awvalid_in && axi_wvalid_in) ? 1 : 0;
//write register
always @(posedge axis_clk or negedge axi_reset_n)  begin
	if ( !axi_reset_n ) begin
		TH_reg <= 4'h6;
	end
	else begin
		if ( axi_awvalid_in && axi_wvalid_in ) begin		//when axi_awvalid_in=1 and axi_wvalid_in=1 means axi_awready_out=1 and axi_wready_out=1
			if (axi_awaddr[11:2] == 10'h000 && (axi_wstrb[0] == 1) ) begin //offset 0 //axi_awaddr is DW address
				TH_reg <= axi_wdata[3:0];
			end
			else begin
				TH_reg <= TH_reg;
			end
		end
	end
end
//axis_switch always output axi_arready = 1 and don't care the axi_arvalid & axi_araddr
//axis_switch only support 1 register bits in offset 0. config read other address offset is reserved.
assign axi_arready = 1;
// axis_switch  always output axi_rvalid = 1 and axi_rdata =  { 28'b0, TH_reg}
assign axi_rvalid = 1;
assign axi_rdata =  { 28'b0, TH_reg };
//for Abiter
assign  req[0] = up_as_tvalid & req_mask[0];
assign  req[1] = aa_as_tvalid & req_mask[1];
assign  req[2] = la_as_tvalid & req_mask[2];
assign  hi_req[0] = up_hpri_req & hi_req_mask[0];
assign  hi_req[1] = hi_req_mask[1];
assign  hi_req[2] = la_hpri_req & hi_req_mask[2];
assign  as_is_tdata     = m_axis_tdata_reg;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
	assign  as_is_tupsb     = m_axis_tupsb_reg;
`endif
assign  as_is_tstrb     = m_axis_tstrb_reg;
assign  as_is_tkeep     = m_axis_tkeep_reg; 
assign  as_is_tlast     = m_axis_tlast_reg;        
assign  as_is_tvalid    = m_axis_tvalid_reg;
assign  as_is_tuser     = m_axis_tuser_reg;   
assign  as_is_tid       = m_axis_tid_reg;
assign as_up_tready = grant_reg[0] && is_as_tready;    
assign as_aa_tready = grant_reg[1] && is_as_tready;
assign as_la_tready = grant_reg[2] && is_as_tready;    
always @* begin
    shift_req = 0;
    shift_hi_req = 0;
    if(frame_start_reg == 1'b0) begin 
        if(hi_req) begin
            case (base_ptr)
                2'b00: shift_hi_req = hi_req;
                2'b01: shift_hi_req = {hi_req[0], hi_req[2:1]};
                2'b10: shift_hi_req = {hi_req[1:0], hi_req[2]};
                2'b11: shift_hi_req = hi_req;
            endcase 
        end else begin          
            case (base_ptr) 
                2'b00: shift_req = req;
                2'b01: shift_req = {req[0], req[2:1]};
                2'b10: shift_req = {req[1:0], req[2]};
                2'b11: shift_req = req;
            endcase                 
        end
    end       
end
always @* begin
    shift_grant[2:0] = 3'b000;
    shift_hi_grant[2:0] = 3'b000;    
    if(frame_start_reg == 1'b0) begin 
        if(hi_req) begin
            if (shift_hi_req[0])       shift_hi_grant[0] = 1'b1;
            else if (shift_hi_req[1])  shift_hi_grant[1] = 1'b1; 
            else if (shift_hi_req[2])  shift_hi_grant[2] = 1'b1;           
        end else begin
            if (shift_req[0])       shift_grant[0] = 1'b1;
            else if (shift_req[1])  shift_grant[1] = 1'b1; 
            else if (shift_req[2])  shift_grant[2] = 1'b1; 
        end
    end    
end            
always @* begin
    if(frame_start_reg == 1'b0) begin
        if(hi_req) begin
            case (base_ptr)
                2'b00: grant_next = shift_hi_grant;
                2'b01: grant_next = {shift_hi_grant[1:0], shift_hi_grant[2]};
                2'b10: grant_next = {shift_hi_grant[0], shift_hi_grant[2:1]};
                2'b11: grant_next = shift_hi_grant;
            endcase  
        end else begin
            case (base_ptr) 
                2'b00: grant_next = shift_grant;
                2'b01: grant_next = {shift_grant[1:0], shift_grant[2]};
                2'b10: grant_next = {shift_grant[0], shift_grant[2:1]};
                2'b11: grant_next = shift_grant;
            endcase
        end
        if(grant_next != 0) frame_start_next = 1'b1;
        else frame_start_next = 1'b0; 
    end else begin
        grant_next = grant_reg; 
        if ((grant_reg == 3'b001)||(grant_reg == 3'b010)||(grant_reg == 3'b100)) begin
            if (m_axis_tlast_reg == 1'b1)  //meet end condition                            
                frame_start_next = 1'b0;
            else
                frame_start_next = 1'b1;                 
        end else begin
            frame_start_next = 1'b0;
        end
        if(frame_start_next == 1'b0) grant_next = 1'b0;              
    end
end
always @(posedge axis_clk or negedge axi_reset_n) begin
    if (!axi_reset_n) begin
        base_ptr <= {($clog2(N)){1'b0}};
        hi_req_flag <= {(N){1'b0}}; 
        grant_reg <= 0;
        frame_start_reg <= 0;   
        m_axis_tdata_reg <= 0;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
		m_axis_tupsb_reg <= 0;
`endif
        m_axis_tstrb_reg <= 0;
        m_axis_tkeep_reg <= 0;
        m_axis_tlast_reg <= 0;
        m_axis_tvalid_reg <= 0;
        m_axis_tuser_reg <= 0;
        m_axis_tid_reg <= 2'b00;             
    end else begin
        grant_reg <= grant_next;
        frame_start_reg <= frame_start_next;
        if((grant_reg != 0)) begin          
            if(grant_reg[0]) begin
                base_ptr <= 2'd1;
            end else if(grant_reg[1]) begin
                base_ptr <= 2'd2;
            end else if(grant_reg[2]) begin
                base_ptr <= 2'd0;
            end
        end else begin
            base_ptr <= base_ptr;
        end
       case (grant_reg)
            3'b001: begin
                m_axis_tdata_reg <= up_as_tdata;
				`ifdef USER_PROJECT_SIDEBAND_SUPPORT
					m_axis_tupsb_reg <= up_as_tupsb;
				`endif
                m_axis_tstrb_reg <= up_as_tstrb;
                m_axis_tkeep_reg <= up_as_tkeep;
                if((up_hpri_req || hi_req_flag[0]) && (!last_support[0])) begin 
                    if(up_hpri_req && !hi_req_flag[0]) begin
                        hi_req_flag[0] <= 1;
                    end
                    if(!up_hpri_req && hi_req_flag[0]) begin
                        m_axis_tlast_reg <= 1;
                    end     
                    if(as_is_tvalid && is_as_tready && m_axis_tlast_reg) begin
                        hi_req_flag[0] <= 0;
                        m_axis_tlast_reg <= 0;
                    end
                end else begin
                //for  normal req
                    m_axis_tlast_reg <= up_as_tlast;
                end 
                m_axis_tvalid_reg <= up_as_tvalid; 
                m_axis_tuser_reg <= up_as_tuser;
                m_axis_tid_reg <= 2'b00;        
            end
            3'b010: begin
                m_axis_tdata_reg <= aa_as_tdata;
                m_axis_tstrb_reg <= aa_as_tstrb;
                m_axis_tkeep_reg <= aa_as_tkeep;
                m_axis_tlast_reg <= aa_as_tlast;
                m_axis_tvalid_reg <= aa_as_tvalid;   
                m_axis_tuser_reg <= aa_as_tuser;
                m_axis_tid_reg <= 2'b01;               
            end
            3'b100: begin
                m_axis_tdata_reg <= la_as_tdata;
                m_axis_tstrb_reg <= la_as_tstrb;
                m_axis_tkeep_reg <= la_as_tkeep;
                if((la_hpri_req || hi_req_flag[2]) && (!last_support[2])) begin            
                    if(la_hpri_req && !hi_req_flag[2]) begin    
                        hi_req_flag[2] <= 1;
                    end
                    if(!la_hpri_req && hi_req_flag[2]) begin                
                        m_axis_tlast_reg <= 1;
                    end     
                    if(as_is_tvalid && is_as_tready && as_is_tlast) begin
                        hi_req_flag[2] <= 0;
                        m_axis_tlast_reg <= 0;
                    end
                end else begin
                //for  normal req
                    m_axis_tlast_reg <= la_as_tlast;
                end                
                m_axis_tvalid_reg <= la_as_tvalid; 
                m_axis_tuser_reg <= la_as_tuser;
                m_axis_tid_reg <= 2'b10;                
            end
            default: begin
                m_axis_tdata_reg <= 0;
				`ifdef USER_PROJECT_SIDEBAND_SUPPORT
					m_axis_tupsb_reg <= 0;
				`endif
                m_axis_tstrb_reg <= 0;
                m_axis_tkeep_reg <= 0;
                m_axis_tlast_reg <= 0;
                m_axis_tvalid_reg <= 0;
                m_axis_tuser_reg <= 0;
                m_axis_tid_reg <= 2'b00;            
            end
        endcase     
    end
end
//for Dexmux
// Write logic
always @(posedge axis_clk or negedge axi_reset_n) begin
    if (!axi_reset_n) begin
        wr_ptr_reg <= {ADDR_WIDTH+1{1'b0}};
    end else begin
	    if (is_as_tvalid) begin // for the current Io_serdes design
	        mem[wr_ptr_reg[ADDR_WIDTH-1:0]] <= s_axis;
	        wr_ptr_reg <= wr_ptr_reg + 1;
	    end
    end	    
end
// Read logic
wire empty = (wr_ptr_reg == rd_ptr_reg);    
wire as_up_tvalid_out = (m_axis[TID_OFFSET +: TID_WIDTH]==2'b00) && !empty; 
wire as_aa_tvalid_out = (m_axis[TID_OFFSET +: TID_WIDTH]==2'b01) && !empty;
wire as_up_data_transfer = (as_up_tvalid_out && up_as_tready);    
wire as_aa_data_transfer = (as_aa_tvalid_out && aa_as_tready);
always @(posedge axis_clk or negedge axi_reset_n) begin
    if (!axi_reset_n) begin
        as_is_tready_reg <= 0;
        rd_ptr_reg <= {ADDR_WIDTH+1{1'b0}};
    end else begin
	    as_is_tready_reg <= !above_th;  
	    if (!empty) begin  
	        if(m_axis[TID_OFFSET +: TID_WIDTH]==2'b00) begin
	            if(as_up_data_transfer) begin
	                rd_ptr_reg <= rd_ptr_reg + 1;
				end	
	        end else if(m_axis[TID_OFFSET +: TID_WIDTH]==2'b01) begin  
	            if(as_aa_data_transfer) begin
					rd_ptr_reg <= rd_ptr_reg + 1;
				end			   
	        end
	    end       
    end
end
assign as_up_tvalid = (m_axis[TID_OFFSET +: TID_WIDTH]==2'b00) ? as_up_tvalid_out: 0;  
assign as_up_tdata = (m_axis[TID_OFFSET +: TID_WIDTH]==2'b00) ? m_axis[pDATA_WIDTH - 1:0]: 0;
`ifdef USER_PROJECT_SIDEBAND_SUPPORT
assign as_up_tupsb = (m_axis[TID_OFFSET +: TID_WIDTH]==2'b00) ? m_axis[UPSB_OFFSET +: pUSER_PROJECT_SIDEBAND_WIDTH]: 0;
`endif
assign as_up_tstrb = (m_axis[TID_OFFSET +: TID_WIDTH]==2'b00) ? m_axis[STRB_OFFSET +: pDATA_WIDTH/8]: 0;
assign as_up_tkeep = (m_axis[TID_OFFSET +: TID_WIDTH]==2'b00) ? m_axis[KEEP_OFFSET +: pDATA_WIDTH/8]: 0;
assign as_up_tlast = (m_axis[TID_OFFSET +: TID_WIDTH]==2'b00) ? m_axis[LAST_OFFSET]: 0;
assign as_up_tuser = (m_axis[TID_OFFSET +: TID_WIDTH]==2'b00) ? m_axis[USER_OFFSET +: USER_WIDTH]: 0;
assign as_aa_tvalid =  (m_axis[TID_OFFSET +: TID_WIDTH]==2'b01) ? as_aa_tvalid_out: 0; 
assign as_aa_tdata = (m_axis[TID_OFFSET +: TID_WIDTH]==2'b01) ? m_axis[pDATA_WIDTH-1:0]: 0;
assign as_aa_tstrb = (m_axis[TID_OFFSET +: TID_WIDTH]==2'b01) ? m_axis[STRB_OFFSET +: pDATA_WIDTH/8]: 0;
assign as_aa_tkeep = (m_axis[TID_OFFSET +: TID_WIDTH]==2'b01) ? m_axis[KEEP_OFFSET +: pDATA_WIDTH/8]: 0;
assign as_aa_tlast = (m_axis[TID_OFFSET +: TID_WIDTH]==2'b01) ? m_axis[LAST_OFFSET]: 0;
assign as_aa_tuser = (m_axis[TID_OFFSET +: TID_WIDTH]==2'b01) ? m_axis[USER_OFFSET +: USER_WIDTH]: 0;
endmodule
