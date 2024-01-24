module wb_decode(
    // Wishbone Slave ports
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

    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,
    
    input wire [37:0] io_in,
    output wire [37:0] io_out,
    output wire [37:0] io_oeb,
    
    output wire [2:0] irq
);

wire uart_ack_o, bram_ack_o;
wire [31:0] uart_dat_o, bram_dat_o;
reg [31:0] wbs_dat_o_w;
reg wbs_ack_o_w;

// decode 
reg [1:0] decode; 

always@(*)begin
    if(wbs_cyc_i && wbs_stb_i)begin
        case(wbs_adr_i[31:24])
            8'h30: decode = 2'b10;
            8'h38: decode = 2'b01;
            default:decode = 2'b00;
        endcase
    end else begin
        decode = 2'b00;
    end
end

assign wbs_ack_o = uart_ack_o | bram_ack_o ;
assign wbs_dat_o = wbs_dat_o_w;

always@(*)begin
    case(decode)
        2'b01:wbs_dat_o_w = bram_dat_o;
        2'b10:wbs_dat_o_w = uart_dat_o;
        default:wbs_dat_o_w  = 32'd0;
    endcase
end

exmem exmem(
    .wb_clk_i       (wb_clk_i   ),
    .wb_rst_i       (wb_rst_i   ),
    .wb_valid       (decode[0]  ),             
    .wbs_we_i       (wbs_we_i   ),              
    .wbs_sel_i      (wbs_sel_i  ),              
    .wbs_dat_i      (wbs_dat_i  ),              
    .wbs_adr_i      (wbs_adr_i  ),              
    .wbs_ack_o      (bram_ack_o ),              
    .wbs_dat_o      (bram_dat_o )
);

uart uart(
    .wb_clk_i       (wb_clk_i   ),
    .wb_rst_i       (wb_rst_i   ),
    .wb_valid       (decode[1]  ),              
    .wbs_we_i       (wbs_we_i   ),              
    .wbs_sel_i      (wbs_sel_i  ),              
    .wbs_dat_i      (wbs_dat_i  ),              
    .wbs_adr_i      (wbs_adr_i  ),              
    .wbs_ack_o      (uart_ack_o ),              
    .wbs_dat_o      (uart_dat_o ),
    .io_in          (io_in      ),
    .io_out         (io_out     ),
    .io_oeb         (io_oeb     ),
    .user_irq       (irq        )
);

endmodule
