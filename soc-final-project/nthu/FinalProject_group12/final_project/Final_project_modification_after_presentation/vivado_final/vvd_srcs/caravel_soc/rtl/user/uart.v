///////////////////////////////// Added /////////////////////////////////
///// This module is from "user_proj_example.counter.v" in lab4-2, and modified a little bit. /////
module WB_decoder #(
    parameter BITS = 32,
    parameter DELAYS=10,
    parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wire wb_clk_i,
    input wire wb_rst_i,
    input wire wbs_stb_i,
    input wire wbs_cyc_i,
    input wire wbs_we_i,
    input wire [3:0] wbs_sel_i,
    input wire [31:0] wbs_dat_i,
    input wire [31:0] wbs_adr_i,
    output wire wbs_ack_o,
    output wire [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    /////input  [127:0] la_data_in,
    /////output [127:0] la_data_out,
    /////input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    output [2:0] user_irq
);
    wire clk;
    wire rst;

    wire [`MPRJ_IO_PADS-1:0] io_in;
    wire [`MPRJ_IO_PADS-1:0] io_out;
    wire [`MPRJ_IO_PADS-1:0] io_oeb;

    ///////////////////////////////// Added /////////////////////////////////
    reg wbs_stb_BRAM;
    reg wbs_cyc_BRAM;
    reg wbs_stb_UART;
    reg wbs_cyc_UART;

    always @* begin
        if(decoded==2'b10) begin
            wbs_stb_BRAM=wbs_stb_i;
            wbs_cyc_BRAM=wbs_cyc_i;
            wbs_stb_UART=0;
            wbs_cyc_UART=0;
        end
        else if(decoded==2'b11) begin
            wbs_stb_BRAM=0;
            wbs_cyc_BRAM=0;
            wbs_stb_UART=wbs_stb_i;
            wbs_cyc_UART=wbs_cyc_i;
        end
        else begin
            wbs_stb_BRAM=0;
            wbs_cyc_BRAM=0;
            wbs_stb_UART=0;
            wbs_cyc_UART=0;
        end
    end
    /*wire wbs_stb_BRAM;
    wire wbs_cyc_BRAM;
    wire wbs_stb_UART;
    wire wbs_cyc_UART;

    assign wbs_stb_BRAM=wbs_stb_i;
    assign wbs_stb_UART=wbs_stb_i;
    assign wbs_cyc_BRAM=wbs_cyc_i;
    assign wbs_cyc_UART=wbs_cyc_i;*/

    wire wbs_we_BRAM;
    wire wbs_we_UART;

    assign wbs_we_BRAM=wbs_we_i;
    assign wbs_we_UART=wbs_we_i;

    wire [3:0] wbs_sel_BRAM;
    wire [3:0] wbs_sel_UART;

    assign wbs_sel_BRAM=wbs_sel_i;
    assign wbs_sel_UART=wbs_sel_i;

    wire [31:0] input_address_BRAM;
    wire [31:0] input_address_UART; // to be more specific, it's "[(pADDR_WIDTH-1):0]"

    assign input_address_BRAM=wbs_adr_i;
    assign input_address_UART=wbs_adr_i;

    wire [31:0] input_data_BRAM;
    wire [31:0] input_data_UART;

    assign input_data_BRAM=wbs_dat_i;
    assign input_data_UART=wbs_dat_i;
    
    reg merged_output_ACK;
    wire wbs_ack_BRAM;
    wire wbs_ack_UART;
    reg [31:0] merged_output_data;
    wire [31:0] output_data_BRAM;
    wire [31:0] output_data_UART;

    always @* begin
        if(decoded==2'b10) begin
            merged_output_data=output_data_BRAM;
            merged_output_ACK=wbs_ack_BRAM;
        end
        else if(decoded==2'b11) begin
            merged_output_data=output_data_UART;
            merged_output_ACK=wbs_ack_UART;
        end
        else begin
            merged_output_data=0;
            merged_output_ACK=0;
        end
    end

    /*wire [`MPRJ_IO_PADS-1:0] io_in_BRAM;
    wire [`MPRJ_IO_PADS-1:0] io_in_UART;

    assign io_in_BRAM=io_in;
    assign io_in_UART=io_in;

    reg [`MPRJ_IO_PADS-1:0] merged_io_out;
    wire [`MPRJ_IO_PADS-1:0] io_out_BRAM;
    wire [`MPRJ_IO_PADS-1:0] io_out_UART;
    reg [`MPRJ_IO_PADS-1:0] merged_io_oeb;
    wire [`MPRJ_IO_PADS-1:0] io_oeb_BRAM;
    wire [`MPRJ_IO_PADS-1:0] io_oeb_UART;
    reg [2:0] merged_user_irq;
    wire [2:0] user_irq_BRAM;
    wire [2:0] user_irq_UART;

    assign io_out_BRAM=merged_output_data;
    assign io_oeb_BRAM={(`MPRJ_IO_PADS-1){rst}};
    assign user_irq_BRAM=3'b000;
    always @* begin
        if(decoded==2'b10) begin
            merged_io_out=io_out_BRAM;
            merged_io_oeb=io_oeb_BRAM;
            merged_user_irq=user_irq_BRAM;
        end
        else if(decoded==2'b11) begin
            merged_io_out=io_out_UART;
            merged_io_oeb=io_oeb_UART;
            merged_user_irq=user_irq_UART;
        end
        else begin
            merged_io_out=io_out_BRAM;
            merged_io_oeb=io_oeb_BRAM;
            merged_user_irq=user_irq_BRAM;
        end
    end*/


    ////////////////////////// global signal //////////////////////////
    reg [1:0] decoded;

    // Assuming LA probes [65:64] are for controlling the BRAM clk & reset  
    /////assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
    /////assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;
    assign clk = wb_clk_i;
    assign rst = wb_rst_i;

    //assign decoded = wbs_adr_i[31:20] == 12'h380 ? 1'b1 : 1'b0;
    always @* begin
        if(wbs_adr_i[31:20] == 12'h380) begin
            decoded=2'b10;
        end
        else if(wbs_adr_i[31:20] == 12'h300) begin
            decoded=2'b11;
        end
        else begin
            decoded=2'b00;
        end
    end


    ////////////////////////// interface output //////////////////////////
    assign wbs_dat_o = merged_output_data;
    //assign wdata = wbs_dat_i;
    assign wbs_ack_o = merged_output_ACK;

    // IO
    /////assign io_out = merged_io_out;
    /////assign io_oeb = merged_io_oeb;

    // IRQ
    /////assign user_irq = merged_user_irq;

    // LA
    /////assign la_data_out = {{(127-BITS){1'b0}}, merged_output_data};



    ////////////////////////// exmem_FIR part //////////////////////////
    //wire [31:0] wdata;
    //wire [BITS-1:0] count;

    wire valid;
    wire [3:0] BRAM_WE; // which is "wstrb" in lab4-1
    //wire [31:0] la_write;

    reg ready;
    reg [BITS-17:0] delayed_count;

    // WB MI A
    assign valid = wbs_cyc_BRAM && wbs_stb_BRAM && (decoded==2'b10); 
    assign BRAM_WE = wbs_sel_BRAM & {4{wbs_we_BRAM}};
    assign wbs_ack_BRAM = ready;

    always @(posedge clk) begin
        if (rst) begin
            ready <= 1'b0;
            delayed_count <= 16'b0;
        end else begin
            ready <= 1'b0;
            if ( valid && !ready ) begin
                if ( delayed_count == DELAYS ) begin
                    delayed_count <= 16'b0;
                    ready <= 1'b1;
                end else begin
                    delayed_count <= delayed_count + 1;
                end
            end
        end
    end

    bram user_bram (
        .CLK(clk),
        .WE0(BRAM_WE),
        .EN0(valid),
        .Di0(input_data_BRAM),
        .Do0(output_data_BRAM),
        .A0(input_address_BRAM)
    );



    ////////////////////////// UART part //////////////////////////
    uart uart(
        // WB interface
        .wb_clk_i(clk),
        .wb_rst_i(rst),
        .wbs_stb_i(wbs_stb_UART),
        .wbs_cyc_i(wbs_cyc_UART),
        .wbs_we_i(wbs_we_UART),
        .wbs_sel_i(wbs_sel_UART),
        .wbs_dat_i(input_data_UART),
        .wbs_adr_i(input_address_UART),
        .wbs_ack_o(wbs_ack_UART),
        .wbs_dat_o(output_data_UART),

        // IO ports
        /////.io_in(io_in_UART),
        /////.io_out(io_out_UART),
        /////.io_oeb(io_oeb_UART),
        .io_in(io_in),
        .io_out(io_out),
        .io_oeb(io_oeb),

        // IRQ
        /////.user_irq(user_irq_UART)
        .user_irq(user_irq)

    );

endmodule

/////////////////////////////////////////////////////////////////////////






module uart #(
  parameter BAUD_RATE = 9600 
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif
  // Wishbone Slave ports (WB MI A)
  input wire    wb_clk_i,
  input wire    wb_rst_i,
  input wire    wbs_stb_i,
  input wire    wbs_cyc_i,
  input wire    wbs_we_i,
  input wire    [3:0] wbs_sel_i,
  input wire    [31:0] wbs_dat_i,
  input wire    [31:0] wbs_adr_i,
  output wire   wbs_ack_o,
  output wire   [31:0] wbs_dat_o,

  // IO ports
  input  [`MPRJ_IO_PADS-1:0] io_in, // The io_in[..] signals are from the pad to the user project and are always
									// active unless the pad has been configured with the "input disable" bit set.
  output [`MPRJ_IO_PADS-1:0] io_out,// The io_out[..] signals are from the user project to the pad.
  output [`MPRJ_IO_PADS-1:0] io_oeb,// The io_oeb[..] signals are from the user project to the pad cell.  This
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
  wire rx_finish;
  wire rx_busy;
  wire [7:0] tx_data;
  wire tx_start_clear;
  wire tx_start;
  wire tx_busy;
  wire wb_valid;
  wire frame_err;
  
  // 32'h3000_0000 memory regions of user project  
  assign wb_valid = (wbs_adr_i[31:8] == 32'h3000_00) ? wbs_cyc_i && wbs_stb_i : 1'b0;

  wire [31:0] clk_div;
  assign clk_div = 40000000 / BAUD_RATE;

  uart_receive receive(
    .rst_n      (~wb_rst_i  ),
    .clk        (wb_clk_i   ),
    .clk_div    (clk_div    ),
    .rx         (rx         ),
    .rx_data    (rx_data    ),
    .rx_finish  (rx_finish  ),	// data receive finish
    .irq        (irq        ),
    .frame_err  (frame_err  ),
    .busy       (rx_busy    )
  );

  uart_transmission transmission(
    .rst_n      (~wb_rst_i  ),
    .clk        (wb_clk_i   ),
    .clk_div    (clk_div    ),
    .tx         (tx         ),
    .tx_data    (tx_data    ),
    .clear_req  (tx_start_clear), // clear transmission request
    .tx_start   (tx_start   ),
    .busy       (tx_busy    )
  );
  
  ctrl ctrl(
	.rst_n		(~wb_rst_i),
	.clk		  (wb_clk_i	),
  .i_wb_valid(wb_valid),
	.i_wb_adr	(wbs_adr_i),
	.i_wb_we	(wbs_we_i	),
	.i_wb_dat	(wbs_dat_i),
	.i_wb_sel	(wbs_sel_i),
	.o_wb_ack	(wbs_ack_o),
	.o_wb_dat (wbs_dat_o),
	.i_rx		  (rx_data	),
  .i_irq    (irq      ),
  .i_frame_err  (frame_err),
  .i_rx_busy    (rx_busy  ),
	.o_rx_finish  (rx_finish),
	.o_tx		      (tx_data	),
	.i_tx_start_clear(tx_start_clear), 
  .i_tx_busy    (tx_busy  ),
	.o_tx_start	  (tx_start )
  );

endmodule
