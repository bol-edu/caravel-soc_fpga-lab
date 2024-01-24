module uart_transmission(
  input wire        rst_n,
  input wire        clk,
  input wire [31:0] clk_div,
  input wire        tx_start,
  input wire [7:0]  tx_data,
  output reg        tx,
  output reg        clear_req,
  output reg        busy
);

  parameter WAIT        = 4'b0000;
  parameter START_BIT   = 4'b0001;
  parameter SEND_DATA   = 4'b0010;
  parameter STOP_BIT    = 4'b0011;
  parameter CLEAR_REQ   = 4'b0100;

  reg [3:0] state;

  reg [31:0] clk_cnt;

  reg [2:0] tx_index;

  reg [1:0] detect_posedge_start;

  always @(posedge clk or negedge rst_n)begin
    if(!rst_n) 
      detect_posedge_start <= 2'b00;
    else 
      detect_posedge_start <= {detect_posedge_start[0], tx_start};
  end

  always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      tx        <= 1'b1;	// Drive Line High for Idle
      state     <= WAIT;
      clear_req <= 1'b0;
      tx_index  <= 3'b000;
      clk_cnt   <= 32'h0000_0000;
      //detect_posedge_start <= 2'b00;
      busy      <= 1'b0;
    end else begin
      //detect_posedge_start <= {detect_posedge_start[0], tx_start}; 
      case(state)
        WAIT: begin
          tx <= 1'b1;
          clear_req <= 1'b0;
          if(detect_posedge_start == 2'b01) begin
            state <= START_BIT;
          end
        end
        START_BIT: begin
		      // Send out Start Bit. Start bit = 0
          tx <= 1'b0;
          busy <= 1'b1;
          if(clk_cnt == (clk_div - 1)) begin
            clk_cnt <= 32'h0000_0000;
            state <= SEND_DATA;
          end else begin
            clk_cnt <= clk_cnt + 32'h0000_0001;
          end
        end
        SEND_DATA: begin
          tx <= tx_data[tx_index];
          busy <= 1'b1;
          if(clk_cnt == (clk_div - 1)) begin
            clk_cnt <= 32'h0000_0000;
            if(tx_index == 3'b111) begin
              state <= STOP_BIT;
            end
            tx_index <= tx_index + 3'b001;
          end else begin
            clk_cnt <= clk_cnt + 32'h0000_0001;
          end
        end
        STOP_BIT: begin
          tx <= 1'b1;
          busy <= 1'b1;
          if(clk_cnt == (clk_div - 1)) begin
            clk_cnt <= 32'h0000_0000;
            state <= CLEAR_REQ;
          end else begin
            clk_cnt <= clk_cnt + 32'h0000_0001;
          end
        end
        CLEAR_REQ: begin
          clear_req <= 1'b1;
          busy <= 1'b0;
          state <= WAIT;
        end
        default: begin
          tx        <= 1'b1;
          state     <= WAIT;
          clear_req <= 1'b0;
          tx_index  <= 3'b000;
          clk_cnt   <= 32'h0000_0000;
          //detect_posedge_start <= 2'b00;
          busy      <= 1'b0;
        end
      endcase
    end
  end

endmodule