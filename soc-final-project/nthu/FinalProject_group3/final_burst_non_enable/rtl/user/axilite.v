`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2023 01:42:30 AM
// Design Name: 
// Module Name: axilite
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
module axilite
#(  parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32,
    parameter Tape_Num    = 11
)
(
    output  wire                     awready,
    input   wire                     awvalid,
    input   wire [(pADDR_WIDTH-1):0] awaddr,
    output  wire                     wready,
    input   wire                     wvalid,
    input   wire  [(pDATA_WIDTH-1):0] wdata,

    output  wire                     arready,
    input   wire                     arvalid,
    input   wire [(pADDR_WIDTH-1):0] araddr,
    input   wire                     rready,
    output  wire                     rvalid,
    output  wire  [(pDATA_WIDTH-1):0] rdata,

    output  wire [3:0]               tap_WE,  // signal indicating output data and address are valid
    output  wire                     tap_EN,
    output  wire [(pDATA_WIDTH-1):0] tap_Di,
    output  wire [(pADDR_WIDTH-1):0] tap_A,
    input   wire [(pDATA_WIDTH-1):0] tap_Do,

	output wire                      ap_start,
    input  wire                      ap_idle,
    input  wire                      ap_done,
    output wire  [(pDATA_WIDTH-1):0] data_length,

	input  wire  [3:0]               fir_raddr,

    input   wire                     axis_clk,
    input   wire                     axis_rst_n,
    input   wire     [2:0]           state_o, 
    input   wire     [3:0]           counter,
    input   wire                     sm_tlast
);

	localparam IDLE = 2'b00, TAPE = 2'b01, CALC = 2'b10;
	
	reg [1:0] 				state, next_state;	// FSM
	reg [2:0] 				ap_control;			
	reg [(pDATA_WIDTH-1):0] data_length_reg;
	
	reg 					arready_reg;
	reg 					rvalid_reg;
	reg [(pDATA_WIDTH-1):0] rdata_reg;
	reg [3:0] 				tap_WE_reg;
	reg [(pDATA_WIDTH-1):0] tap_Di_reg;
	reg [(pADDR_WIDTH-1):0] tap_A_reg;

	// handshakes of Write / Read
	wire aw_hs, w_hs, ar_hs, r_hs;

    assign data_length = data_length_reg;

	// handshakes signals
    assign aw_hs = awvalid & awready;
    assign w_hs  = wvalid  & wready;
    assign ar_hs = arvalid & arready;
    assign r_hs  = rvalid  & rready;

	// AXI-Lite Write / Read signal
	
	
    assign awready = 1;
    assign wready  = 1;
    

    
    
    
    
    assign arready = ((state == TAPE| state == CALC) & arvalid);
    assign rvalid  = rvalid_reg;
    assign rdata  = rdata_reg;

	// AXI-Stream Tap RAM signal
    assign tap_EN = 1;
    assign tap_WE = tap_WE_reg;
    assign tap_Di = tap_Di_reg;
    assign tap_A  = tap_A_reg;

	assign ap_start = ap_control[0];

	// sequential state trnsition
	always @(posedge axis_clk or negedge axis_rst_n) begin
		if (!axis_rst_n) begin
			state <= IDLE;
		end
		else begin
			state <= next_state;
		end
	end

	// next state generation
	always@* begin
        case (state)
            IDLE: begin
                next_state = TAPE;
            end
            TAPE: begin
                if (ap_control[0]) begin	// when ap_start = 1, go to calculation state
                    next_state = CALC;
                end
                else begin
                    next_state = TAPE;
                end
            end
            CALC: begin
                if (ap_control[1]) begin
                    next_state = TAPE;		// when ap_start = 0, go back to TAPE state to wait
                end
                else begin
                    next_state = CALC;
                end
            end
            default: begin
                next_state = IDLE;
            end
        endcase
    end

	// ap_control signal & data length
	always@(posedge axis_clk or negedge axis_rst_n) begin
        if (~axis_rst_n) begin
            ap_control <= 3'b0;
            data_length_reg <= 32'b0;
        end
        else begin
            case(state)
                IDLE: begin
                    ap_control <= {ap_idle,ap_done,1'b0};
                    data_length_reg <= 32'b0;
                end
                TAPE: begin
                    ap_control[1] <= ap_done;
                    ap_control[2] <= ap_idle;
                    if (w_hs) begin
                        if (awaddr == 12'h000) begin 	// ap_start will write to this register
                            ap_control[0] <= wdata[0];
                        end
                        else if (awaddr == 12'h010) begin
                            data_length_reg <= wdata;
                        end
                        else begin
                            ap_control[0]  <= ap_control[0];
                            data_length_reg <= data_length_reg;
                        end
                    end
                    else begin
                        ap_control[0]  <= ap_control[0];
                        data_length_reg <= data_length_reg;
                    end
                end
                CALC: begin
                    if (sm_tlast) begin
                        ap_control[0] <= 1;
                    end
                    else begin
                        ap_control[0] <= 0;
                    end
                    ap_control[1] <= ap_done;
                    ap_control[2] <= ap_idle;
                    data_length_reg <= data_length_reg;
                end
            endcase
        end
    end

	// READ valid
	always@(posedge axis_clk) begin
        if (~axis_rst_n) begin
        rvalid_reg <= 0;
         end
	 else if (~rvalid_reg & ar_hs & rready) begin
	 rvalid_reg<=1'b1;
	 end
	 else begin
	 rvalid_reg<=1'b0;
	 end			// when address handshake, send read valid
       end

	// WRITE / READ / CALCULATE Address
	always @(*) begin
		case (state)
			IDLE: begin
				tap_A_reg = 0;
			end

			TAPE: begin
				if (aw_hs) begin
					if ((awaddr >= 12'h20) & (awaddr <= 12'h48)) 
						tap_A_reg = awaddr - 12'h020;	  
					else				
						tap_A_reg = 0;						// when write / read address stay between 0x20 - 0xFF, it will
				end											// send address to Tap RAM, else address (control, data length)
															// will send to other register
				else if (ar_hs) begin
					if ((awaddr >= 12'h20) & (awaddr <= 12'h48)) 
						tap_A_reg = araddr - 12'h020;
					else 
						tap_A_reg = 0;
				end
                else begin 
                    tap_A_reg = 0;
                end
			end

			CALC: begin  									// while calculation, fir poniter will send address to axilite,
				tap_A_reg = {6'b0,fir_raddr[3:0],2'b00};	// and we already program the Tap RAM address, so it will automatically
			end												// get the right tap parameter

			default: begin 
				tap_A_reg = 0;
			end
		endcase
	end

	// WRITE Coefficient
	always @(*) begin
        case(state)
            IDLE: begin
                tap_Di_reg  = 0;
            end

            TAPE: begin
                if (w_hs & (awaddr >= 12'h20 & awaddr <= 12'h48))
                    tap_Di_reg = wdata;
                else
                    tap_Di_reg  = 0;
            end

            CALC: begin
                tap_Di_reg  = 0;
            end

            default: begin
                tap_Di_reg  = 0;
            end
        endcase
    end
    
       wire x_reg,y_reg;
       assign x_reg =(state_o==3'd3)?1:0;
       assign y_reg =(counter==14)?1:0;
	//read change
	reg x_ready_reg, y_ready_reg;
	always @(posedge axis_clk or negedge axis_rst_n) begin
		if (!axis_rst_n) begin
			x_ready_reg <= 0;
		end
		else begin
			x_ready_reg <= x_reg ;
		end
	end
       always @(posedge axis_clk or negedge axis_rst_n) begin
		if (!axis_rst_n) begin
			y_ready_reg <= 0;
		end
		else begin
			y_ready_reg <= y_reg ;
		end
	end
	
	
	always @(*) begin
        if (araddr == 12'h00) begin
            rdata_reg = {27'd0,y_ready_reg,x_ready_reg,1'b0,ap_control};
        end
        else if (araddr == 12'h10) begin
            rdata_reg = data_length_reg;
        end
        else if ((araddr >= 12'h20) & (araddr <= 12'h48)) begin
            rdata_reg = tap_Do;
        end
        else begin
            rdata_reg = 0;
        end
    end

	// WE control
	always @(*) begin
        case (state)
            IDLE: begin
                tap_WE_reg = 4'b0000;
            end
			
            TAPE: begin
                if (w_hs & (awaddr >= 12'h20 & awaddr <= 12'h48)) 
                    tap_WE_reg = 4'b1111; 	// when write address stay between 0x20 - 0xFF, then
                else                        // Tap write enable will function
                    tap_WE_reg = 4'b0000;
            end
            CALC: begin
                tap_WE_reg = 4'b0000;
            end

            default: begin
                tap_WE_reg = 4'b0000;
            end
        endcase
    end

endmodule
