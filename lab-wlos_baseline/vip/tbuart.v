`default_nettype wire
`timescale 1 ns / 1 ps

/* tbuart --- mimic an external UART display, operating at 9600 baud	*/
/* and accepting ASCII characters for display.				*/
module tbuart (
	input  ser_rx,
	input tx_start,
	output reg ser_tx,
	input [7:0] tx_data,
	output reg tx_busy,
	output reg tx_clear_req
);
	reg [2:0] recv_state;
	reg [2:0] recv_next_state;
	reg [2:0] rx_index;
	reg [31:0]clk_div;
	reg [31:0]clk_cnt;
	reg [7:0] recv_pattern;
	reg [8*10-1:0] recv_buf_data;	// 50 characters.  Increase as needed for tests.

	reg [2:0] tr_state;
	reg [2:0] tr_next_state;
	reg [2:0] tx_index;
	reg [7:0] tx_pattern;

	reg clk;

	parameter R_WAIT 		= 3'b000;
	parameter R_GET_DATA  	= 3'b001;
	parameter R_STOP_BIT	= 3'b010;
	parameter T_WAIT		= 3'b000;
	parameter T_START_BIT   = 3'b001;
	parameter T_SEND_DATA	= 3'b010;
	parameter T_STOP_BIT    = 3'b011;
	parameter T_CLEAR       = 3'b100;
	

	parameter baud_rate = 9600;


	initial begin
		clk = 0;
		recv_state = 0;			// 3bit
		recv_next_state = 0;
		rx_index = 0;			// 3bit
		recv_pattern = 0;			// 8bit
		recv_buf_data = 0;			// 50 words
		tr_state = 0;
		tr_next_state = 0;
		tx_index = 0;
		tx_pattern = 0;
		ser_tx = 1;
		//tx_busy = 0;
		tx_clear_req = 0;
		clk_div = 40000000/baud_rate;
		clk_cnt = 0;
	end

	always #52083 clk <= ~clk;

	always@(posedge clk)begin
		recv_state <= recv_next_state;
	end
	// --------------------Receiver------------------------//
	always@(*)begin
		case(recv_state)
			R_WAIT:begin
				if(!ser_rx)
					recv_next_state = R_GET_DATA;
				else
					recv_next_state = R_WAIT;
			end
			R_GET_DATA:begin
				if(rx_index==3'b111)
					recv_next_state = R_STOP_BIT;
				else
					recv_next_state = R_GET_DATA;
			end
			R_STOP_BIT:begin
				if(ser_rx)
					recv_next_state = R_WAIT;
				else
					recv_next_state = R_STOP_BIT;
			end
			default:begin
				recv_next_state = R_WAIT;
			end
		endcase  
	end

	always@(posedge clk)begin
		case(recv_state)
			R_WAIT, R_STOP_BIT: rx_index <= 0;
			R_GET_DATA: rx_index <= rx_index + 1;
			default: rx_index <= 0;
		endcase
	end

	always@(posedge clk)begin
		case(recv_state)
			R_WAIT: recv_pattern <= 0;
			R_GET_DATA:	begin
				recv_pattern <= {ser_rx, recv_pattern[7:1]};
				$display("rx data bit index %d: %b", rx_index, ser_rx);
			end
			default: recv_pattern <= 0;
		endcase
	end

	always@(posedge clk)begin
		if(recv_state==R_STOP_BIT)begin
			recv_buf_data <= {recv_buf_data, recv_pattern};
			$display("recevied word %d", recv_pattern);
		end
	end
	
	// --------------------Transmitter------------------------//
	always@(posedge clk)begin
		tr_state <= tr_next_state;
	end

	always@(*)begin
		case(tr_state)
			T_WAIT:begin
				if(tx_start)
					tr_next_state = T_START_BIT;
				else
					tr_next_state = T_WAIT;
			end
			T_START_BIT:begin
				tr_next_state = T_SEND_DATA;
			end
			T_SEND_DATA:begin
				if(tx_index==3'b111)
					tr_next_state = T_STOP_BIT;
				else
					tr_next_state = T_SEND_DATA;
			end
			T_STOP_BIT:begin
				tr_next_state = T_CLEAR;
			end
			T_CLEAR:begin
				tr_next_state = T_WAIT;
			end
			default:begin
				tr_next_state = T_WAIT;
			end
		endcase
	end

	always@(posedge clk)begin
		case(tr_state)
			T_WAIT, T_START_BIT, T_STOP_BIT, T_CLEAR: tx_index <= 0;
			T_SEND_DATA: tx_index <= tx_index + 1;
			default: tx_index <= 0;
		endcase
	end

	always@(posedge clk)begin
		if(tr_state==T_WAIT)
			tx_pattern <= (tx_start) ? tx_data : 0;
		else if(tr_state==T_CLEAR)
			tx_pattern <= 0;
	end

	always@(posedge clk)begin
		case(tr_state)
			T_WAIT: ser_tx <= 1;
			T_START_BIT: ser_tx <= 0;
			T_SEND_DATA:begin 
				ser_tx <= tx_pattern[tx_index];
				$display("tx data bit index %d: %b", tx_index, tx_pattern[tx_index]);
			end
			T_STOP_BIT: ser_tx <= 1;
			T_CLEAR: ser_tx <= 1;
			default: ser_tx <= 1;
		endcase
	end

	always@(posedge clk)begin
		if(tr_state==T_CLEAR)
			tx_clear_req <= 1;
		else
			tx_clear_req <= 0;
	end

	always@(*)begin
		if(tr_next_state == T_START_BIT)
			tx_busy = 1;
		else if(tr_state == T_CLEAR)
			tx_busy = 0;
	end

endmodule


/*module tbuart (
	input  ser_rx,
	output  ser_tx
);
	reg [3:0] recv_state;
	reg [2:0] recv_divcnt;
	reg [7:0] recv_pattern;
	reg [8*50-1:0] recv_buf_data;	// 50 characters.  Increase as needed for tests.

	reg clk;

	initial begin
		clk <= 1'b0;
		recv_state <= 0;
		recv_divcnt <= 0;
		recv_pattern <= 0;
		recv_buf_data <= 0;
	end

	// NOTE:  Running at 3.0us clock period @ 5 clocks per bit = 15.0us per
	// bit ~= 64 kbaud. Not tuned to any particular UART.  Most run at
	// 9600 baud default and will bounce up to higher baud rates when
	// passed specific command words.

//	always #1500 clk <= (clk === 1'b0);
//	always #52083 clk <= (clk === 1'b0);  // working for 9600 baud 52075
	always #10417 clk <= ~clk;
//	always #2650 clk <= ~clk;
//	always #125 clk <= (clk === 1'b0);

	always @(posedge clk) begin
		recv_divcnt <= recv_divcnt + 1;
		case (recv_state)
			0: begin
				if (!ser_rx)
					recv_state <= 1;
				recv_divcnt <= 0;
			end
			1: begin
				if (2*recv_divcnt > 3'd3) begin
					recv_state <= 2;
					recv_divcnt <= 0;
				end
			end
			10: begin
				if (recv_divcnt > 3'd3) begin
					// 0x0a = '\n'
					//if (recv_pattern == 8'h0a) begin
						//$display("output: %h", recv_buf_data);
					//end else begin
						$display("output: %h", recv_pattern);
						recv_buf_data <= {recv_buf_data, recv_pattern};
					//end
					recv_state <= 0;
				end
			end
			default: begin // DATA BITS 2-9
				if (recv_divcnt > 3'd3) begin
					recv_pattern <= {ser_rx, recv_pattern[7:1]};
					$display("ser_rx index %2d: %b", recv_state-2, ser_rx);
					recv_state <= recv_state + 1;
					recv_divcnt <= 0;
				end
			end
		endcase
	end

endmodule*/
