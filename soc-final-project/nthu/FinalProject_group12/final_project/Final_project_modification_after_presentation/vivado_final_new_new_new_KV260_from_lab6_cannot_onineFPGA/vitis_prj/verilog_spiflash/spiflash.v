// ==============================================================
// spiflash.v - spiflash device design
// - only support READ command 03
// - External BRAM interface
// Implementation scheme
//   ap_clk runs at FPGA clock
// - spiclk is 1/4 of ap_clk
// - io0 is input and sampled at spiclk rising
// - io1 is output and output at spiclk falling
// 
// ===========================================================

//`timescale 1 ns / 1 ps 

module spiflash (
        ap_clk,
        ap_rst,
// BRAM Interface
        romcode_Addr_A,
        romcode_EN_A,
        romcode_WEN_A,
        romcode_Din_A,
        romcode_Dout_A,
        romcode_Clk_A,
        romcode_Rst_A,
// Spiflash Interface
        csb,
        spiclk,
        io0,
        io1
);

input   ap_clk;
input   ap_rst;
output  [31:0] romcode_Addr_A;
output   romcode_EN_A;
output  [3:0] romcode_WEN_A;
output  [31:0] romcode_Din_A;
input  [31:0] romcode_Dout_A;
output   romcode_Clk_A;
output   romcode_Rst_A;
input   csb;
input   spiclk;
input  [0:0] io0;
output   io1;

	reg [7:0] buffer;
	reg [3:0] bitcount = 0;
	reg [12:0] bytecount = 0;
    reg [7:0] outbuf;   // update at spiclk falling

	reg [7:0] spi_cmd;
	reg [23:0] spi_addr;

// io1 output
    // assign io1 = buffer[7];
    assign io1 = outbuf[7];

// BRAM Interface
   assign romcode_Addr_A = {8'b0, spi_addr};
   assign romcode_Din_A = 32'b0;
   assign romcode_EN_A = (bytecount >= 4);
   assign romcode_WEN_A = 4'b0;
   assign romcode_Clk_A = ap_clk;
   assign romcode_Rst_A = ap_rst;

	// 16 MB (128Mb) Flash
    // 	reg [7:0] memory [0:16*1024*1024-1];
    wire [7:0] memory;
    assign memory = (spi_addr[1:0] == 2'b00) ? romcode_Dout_A[7:0] :
                    (spi_addr[1:0] == 2'b01) ? romcode_Dout_A[15:8] :
                    (spi_addr[1:0] == 2'b10) ? romcode_Dout_A[23:16] :
                                          romcode_Dout_A[31:24] ;

	task spi_action;
		begin

			if (bytecount == 0) begin
				spi_cmd <= buffer;
			end

			if (spi_cmd == 'h 03) begin     // only support READ 03
				if (bytecount == 2)
					spi_addr[23:16] <= buffer;

				if (bytecount == 3)
					spi_addr[15:8] <= buffer;

				if (bytecount == 4)
					spi_addr[7:0] <= buffer;

				if (bytecount >= 4) begin
					buffer <= memory;
					spi_addr <= spi_addr + 1;
				end
			end
		end
	endtask


    // use another shift buffer for output
    // use falling spiclk
    always @(negedge spiclk or posedge csb) begin
        if(csb) begin
            outbuf <= 0;
        end else begin
            outbuf <= {outbuf[6:0],1'b0};
            if(bitcount == 0 && bytecount >= 4) begin
                outbuf <= memory;
             end
        end
    end
    
    wire [7:0] buffer_next = {buffer[6:0], io0};

	always @(posedge spiclk or posedge csb) begin   // csb deassert -> reset internal states
		if (csb) begin
			buffer <= 0;
			bitcount <= 0;
			bytecount <= 0;
        end else begin              // csb active -> count bit, byte
			buffer <= buffer_next;
			bitcount <= bitcount + 1;
			if (bitcount == 7) begin
				bitcount <= 0;
				bytecount <= bytecount + 1;
				// spi_action;
                if(bytecount == 0)  spi_cmd <= buffer_next;      // command
                if(bytecount == 1)  spi_addr[23:16] <= buffer_next;
                if(bytecount == 2)  spi_addr[15:8] <= buffer_next;
                if(bytecount == 3)  spi_addr[7:0] <= buffer_next;

                if(bytecount >= 4 && spi_cmd == 'h03)  begin
                    // buffer <= memory;
                    spi_addr <= spi_addr + 1;
                end
            end
		end
	end

    
endmodule