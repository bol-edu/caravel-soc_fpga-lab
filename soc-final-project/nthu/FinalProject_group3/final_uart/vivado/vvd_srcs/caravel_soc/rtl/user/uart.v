module uart #(
  parameter BAUD_RATE = 160000, 
  parameter MPRJ_IO_PADS = 38
)(
  // Wishbone Slave ports (WB MI A)
  input wire    wb_clk_i,
  input wire    wb_rst_i,
  input wire    wb_valid,
  input wire    wbs_we_i,
  input wire    [3:0] wbs_sel_i,
  input wire    [31:0] wbs_dat_i,
  input wire    [31:0] wbs_adr_i,
  output wire   wbs_ack_o,
  output wire   [31:0] wbs_dat_o,

  // IO ports
  input  [MPRJ_IO_PADS-1:0] io_in, // The io_in[..] signals are from the pad to the user project and are always
									// active unless the pad has been configured with the "input disable" bit set.
  output [MPRJ_IO_PADS-1:0] io_out,// The io_out[..] signals are from the user project to the pad.
  output [MPRJ_IO_PADS-1:0] io_oeb,// The io_oeb[..] signals are from the user project to the pad cell.  This
									// controls the direction of the pad when in bidirectional mode.  When set to
									// value zero, the pad direction is output and the value of io_out[..] appears
									// on the pad.  When set to value one, the pad direction is input and the pad
									// output buffer is disabled.

  // irq
  output [2:0] user_irq
);

  // UART 
  wire  tx;
  wire  rx;

  assign io_oeb[6] = 1'b0; // Set mprj_io_31 to output
  assign io_oeb[5] = 1'b1; // Set mprj_io_30 to input
  assign io_out[6] = tx;	// Connect mprj_io_6 to tx
  assign rx = io_in[5];	// Connect mprj_io_5 to rx

  // irq
  wire irq;
  assign user_irq = {2'b00,irq};	// Use USER_IRQ_0

  // CSR
  wire [7:0] rx_data; 
  wire irq_en;
  wire rx_busy;
  wire [7:0] tx_data;
  wire tx_start_clear;
  wire tx_start;
  wire tx_busy;
  
  wire frame_err;
  wire rx_valid;
  wire rx_full;
  wire rx_empty;
  wire irq_clear;
  
  wire [7:0] rxf_idata;
  wire       rxf_ivalid;
  wire [7:0] rxf_odata;
  
  wire [7:0] txf_idata;
  wire txf_ivalid;
  wire txf_oready;
  wire txf_empty;
  wire txf_full;

  wire [31:0] clk_div;
  assign clk_div = 40000000 / BAUD_RATE;

  uart_receive receive(
    .rst_n      (~wb_rst_i  ),
    .clk        (wb_clk_i   ),
    .clk_div    (clk_div    ),
    .rx         (rx         ),
    .irq        (irq        ),
    .frame_err  (frame_err  ),
    .busy       (rx_busy    ),
    .i_rx_valid (rx_valid   ),
    .i_rx_full  (rx_full    ),
    .i_rx_empty (rx_empty   ),
    .irq_clear  (irq_clear  ),
    .rxf_idata  (rxf_idata  ),
    .rxf_ivalid (rxf_ivalid )
  );
  
    fifo  rx_fifo(
    .clk        (wb_clk_i   ),
    .rst_n      (~wb_rst_i  ),
    .push       (rxf_ivalid ),
    .idata      (rxf_idata  ),
    .pop        (rx_valid   ),
    .odata      (rxf_odata  ),
    .empty      (rx_empty   ),
    .full       (rx_full    )
  );

  uart_transmission transmission(
    .rst_n      (~wb_rst_i  ),
    .clk        (wb_clk_i   ),
    .clk_div    (clk_div    ),
    .tx         (tx         ),
    .tx_data    (tx_data    ),
    .clear_req  (tx_start_clear),
    .tx_start   (tx_start   ),
    .busy       (tx_busy    )
  );
  
  fifo  tx_fifo(
    .clk        (wb_clk_i   ),
    .rst_n      (~wb_rst_i  ),
    .push       (txf_ivalid ),
    .idata      (txf_idata  ),
    .pop        (txf_oready ),
    .odata      (tx_data  ),
    .empty      (txf_empty  ),
    .full       (txf_full   )
);
  
  ctrl ctrl(
	.rst_n         (~wb_rst_i),
	.clk		   (wb_clk_i ),
    .i_wb_valid    (wb_valid ),
	.i_wb_adr	   (wbs_adr_i),
	.i_wb_we	   (wbs_we_i ),
	.i_wb_dat	   (wbs_dat_i),
	.i_wb_sel	   (wbs_sel_i),
	.o_wb_ack	   (wbs_ack_o),
	.o_wb_dat      (wbs_dat_o),
	
	.i_rx		   (rxf_odata),
    .i_irq         (irq      ),
    .i_frame_err   (frame_err),
    .i_rx_busy     (rx_busy  ),
    .o_rx_valid    (rx_valid ),
    .i_rx_full     (rx_full  ),
    .i_rx_empty    (rx_empty ),
    .irq_clear     (irq_clear),
    
	.i_tx_start_clear (tx_start_clear), 
    .i_tx_busy     (tx_busy  ),
	.o_tx_start	   (tx_start ),
	.txf_full      (txf_full),
    .txf_empty     (txf_empty),
    .txf_oready    (txf_oready),
    .txf_ivalid    (txf_ivalid),
    .txf_idata     (txf_idata)
  );

endmodule
