// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype wire

`timescale 1 ns / 1 ps

module counter_la_final_tb;
	reg clock;
    reg RSTB;
	reg CSB;

	reg power1, power2;

	wire gpio;
	wire [37:0] mprj_io;
	wire [15:0] checkbits;
	wire uart_tx;
	wire uart_rx;
	reg tx_start;
	reg [7:0] tx_data;
	wire tx_busy;
	wire tx_clear_req;

	assign checkbits  = mprj_io[31:16];
	assign uart_tx = mprj_io[6];
	assign mprj_io[5] = uart_rx;

	always #12.5 clock <= (clock === 1'b0);

	initial begin
		clock = 0;
	end

	`ifdef ENABLE_SDF
		initial begin
			$sdf_annotate("../../../sdf/user_proj_example.sdf", uut.mprj) ;
			$sdf_annotate("../../../sdf/user_project_wrapper.sdf", uut.mprj.mprj) ;
			$sdf_annotate("../../../mgmt_core_wrapper/sdf/DFFRAM.sdf", uut.soc.DFFRAM_0) ;
			$sdf_annotate("../../../mgmt_core_wrapper/sdf/mgmt_core.sdf", uut.soc.core) ;
			$sdf_annotate("../../../caravel/sdf/housekeeping.sdf", uut.housekeeping) ;
			$sdf_annotate("../../../caravel/sdf/chip_io.sdf", uut.padframe) ;
			$sdf_annotate("../../../caravel/sdf/mprj_logic_high.sdf", uut.mgmt_buffers.mprj_logic_high_inst) ;
			$sdf_annotate("../../../caravel/sdf/mprj2_logic_high.sdf", uut.mgmt_buffers.mprj2_logic_high_inst) ;
			$sdf_annotate("../../../caravel/sdf/mgmt_protect_hv.sdf", uut.mgmt_buffers.powergood_check) ;
			$sdf_annotate("../../../caravel/sdf/mgmt_protect.sdf", uut.mgmt_buffers) ;
			$sdf_annotate("../../../caravel/sdf/caravel_clocking.sdf", uut.clocking) ;
			$sdf_annotate("../../../caravel/sdf/digital_pll.sdf", uut.pll) ;
			$sdf_annotate("../../../caravel/sdf/xres_buf.sdf", uut.rstb_level) ;
			$sdf_annotate("../../../caravel/sdf/user_id_programming.sdf", uut.user_id_value) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_bidir_1[0] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_bidir_1[1] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_bidir_2[0] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_bidir_2[1] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_bidir_2[2] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[0] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[1] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[2] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[3] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[4] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[5] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[6] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[7] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[8] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[9] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[10] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[0] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[1] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[2] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[3] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[4] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[5] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[0] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[1] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[2] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[3] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[4] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[5] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[6] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[7] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[8] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[9] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[10] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[11] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[12] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[13] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[14] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[15] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.\gpio_defaults_block_0[0] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.\gpio_defaults_block_0[1] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.\gpio_defaults_block_2[0] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.\gpio_defaults_block_2[1] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.\gpio_defaults_block_2[2] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_5) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_6) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_7) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_8) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_9) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_10) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_11) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_12) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_13) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_14) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_15) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_16) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_17) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_18) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_19) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_20) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_21) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_22) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_23) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_24) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_25) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_26) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_27) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_28) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_29) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_30) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_31) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_32) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_33) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_34) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_35) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_36) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_37) ;
		end
	`endif 

	initial begin
		$dumpfile("counter_la_final.vcd");
		$dumpvars(0, counter_la_final_tb);

		// Repeat cycles of 1000 clock edges as needed to complete testbench
		repeat (100) begin // modified (original:200)
			repeat (1000) @(posedge clock);
			// $display("+1000 cycles");
		end
		$display("%c[1;31m",27);
		`ifdef GL
			$display ("Monitor: Timeout, Test LA (GL) Failed");
		`else
			$display ("Monitor: Timeout, Test LA (RTL) Failed");
		`endif
		$display("%c[0m",27);
		$finish;
	end

	///////////////////////////////// Added /////////////////////////////////
	reg pass_MatMul_QS_FIR;
	reg pass_UART;

	initial begin
		pass_MatMul_QS_FIR=0;
		wait(checkbits == 16'hAB40);
		#0.1;
	/*	$display("Info: Start matrix multiplication test...");
		
		wait(checkbits == 16'h003E);
		$display("Call function matmul() in User Project BRAM (mprjram, 0x38000000) return value passed, 0x%x, which is %d in decimal", checkbits, checkbits);
		wait(checkbits == 16'h0044);
		$display("Call function matmul() in User Project BRAM (mprjram, 0x38000000) return value passed, 0x%x, which is %d in decimal", checkbits, checkbits);
		wait(checkbits == 16'h004A);
		$display("Call function matmul() in User Project BRAM (mprjram, 0x38000000) return value passed, 0x%x, which is %d in decimal", checkbits, checkbits);
		wait(checkbits == 16'h0050);
		$display("Call function matmul() in User Project BRAM (mprjram, 0x38000000) return value passed, 0x%x, which is %d in decimal", checkbits, checkbits);

		wait(checkbits == 16'hAB51);
		$display("Success: Matrix multiplication test passed ♪");*/
	/*end

	initial begin
		wait(checkbits == 16'hAB51);
		#0.1;*/
		$display("Info: Detect check bits (16'hAB40) on reg_mprj_datal[31:16], start testing!");
		$display("\n++++++++++ Step 1: FIR & MM hardware accelerator initialization ++++++++++");
		wait(checkbits == 16'hAB50);
		$display("Info: Detect check bits (16'hAB50) on reg_mprj_datal[31:16], hardware initialization finished!");

		/////$display("Info: Start Q sort test...");
		$display("\n++++++++++ Step 2: Start Q sort test (firmware) ++++++++++");
		
		wait(checkbits == 16'd40);
		$display("Call function qsort() in User Project BRAM (mprjram, 0x38000000) return value passed, 0x%x, which is %d in decimal", checkbits, checkbits);
		wait(checkbits == 16'd893);
		$display("Call function qsort() in User Project BRAM (mprjram, 0x38000000) return value passed, 0x%x, which is %d in decimal", checkbits, checkbits);
		wait(checkbits == 16'd2541);
		$display("Call function qsort() in User Project BRAM (mprjram, 0x38000000) return value passed, 0x%x, which is %d in decimal", checkbits, checkbits);
		wait(checkbits == 16'd2669);
		$display("Call function qsort() in User Project BRAM (mprjram, 0x38000000) return value passed, 0x%x, which is %d in decimal", checkbits, checkbits);

		wait(checkbits == 16'hAB52);
		$display("Success: Detect check bits (16'hAB52) on reg_mprj_datal[31:16], Q sort test passed ♪");

		$display("\n++++++++++ Step 3: Check FIR & MM hardware accelerator results ++++++++++");
		wait(checkbits == 16'd10614);
		$display("FIR return value passed, 0x%x, which is %d in decimal", checkbits, checkbits);

		wait(checkbits == 16'd80);
		$display("Matrix Multiplication return value passed, 0x%x, which is %d in decimal", checkbits, checkbits);

		wait(checkbits == 16'hAB60);
		$display("Success: Detect check bits (16'hAB60) on reg_mprj_datal[31:16], FIR & MM hardware accelerator test passed ♪");

		$display("---------------------------------------------");
        $display("-----------Congratulations! Pass-------------");
		#100;
		$finish;
	/*end

	initial begin
		wait(checkbits == 16'hAB52);
		#0.1;*/
		/*$display("Info: Start FIR test...");
		
		wait(checkbits == 16'd1098);
		$display("Call function fir() in User Project BRAM (mprjram, 0x38000000) return value passed, 0x%x, which is %d in decimal", checkbits, checkbits);
		
		wait(checkbits == 16'hAB60);
		$display("Success: FIR test passed ♪");
		pass_MatMul_QS_FIR=1;*/
	end
	/*initial begin
		integer FIR_latency_timer;
		integer MM_latency_timer;
		
		/////wait(uut.mprj.WB_decoder_U0.DMA_FIR_U0.fir_U0.ap_idle_done_start[0] == 1);
		$display("Latency calculation: Start FIR_latency_timer");
		FIR_latency_timer=0;

	end*/
	/////////////////////////////////////////////////////////////////////////

	/* /////// (We do not improve UART part, so ignore here.) ///////
	initial begin
		pass_UART=0;
		wait(checkbits == 16'hAB40);
		$display("LA Test 1 started");
		$display("Info: Start UART test 1...");

		////////// Case 1: For interrupt to happen at matrix multiplication test //////////
		//#0;
		////////// Case 2: For interrupt to happen at Q sort test //////////
		//#1600000;
		////////// Case 3: For interrupt to happen at Q sort test //////////
		/////#2600000;

		send_data_1;
		//wait(checkbits == 61);
		//send_data_1;
		//wait(checkbits == 15);
		//#10000;
		//$display("LA Test 1 passed");

		/////wait(checkbits == 16'hAB61); // Modified
		/////$display("LA Test 1 passed");
		/////$finish;
	end

	///////////////////////////////// Added /////////////////////////////////
	initial begin
		wait(checkbits == 16'hAB40);

		////////// Case 2: For interrupt to happen at Q sort test //////////
		/////#2600000; // "Rx" & "the next Tx" would overlap, but still works
		#3600000;
		$display("Info: Start UART test 2...");

		send_data_2;
	end

	initial begin
		wait(checkbits == 16'hAB40);

		////////// Case 3: For interrupt to happen at Q sort test //////////
		/////#4600000; // "Rx" & "the next Tx" would overlap, but still works
		#6600000;
		$display("Info: Start the last UART test ('\\n')...");

		send_data_last;

		wait(checkbits == 16'hAB61); // which means isr.c received the last one
		$display("Success: UART test passed ♪");
		pass_UART=1;
	end

	initial begin
		wait((pass_MatMul_QS_FIR == 1) && (pass_UART==1));
		$display("LA Test 1 passed");
		$display("-----------------------------------------------------");
        $display("----------Congratulations! Pass all tests------------");
		#50;
		$finish;
	end
	/////////////////////////////////////////////////////////////////////////

	task send_data_1;begin
		@(posedge clock);
		tx_start = 1;
		tx_data = 15;
		
		#50;
		wait(!tx_busy);
		tx_start = 0;
		$display("tx complete 1");
		
	end endtask

	task send_data_2;begin
		@(posedge clock);
		tx_start = 1;
		tx_data = 61;
		
		#50;
		wait(!tx_busy);
		tx_start = 0;
		$display("tx complete 2");
		
	end endtask

	///////////////////////////////// Added /////////////////////////////////
	task send_data_last;begin
		@(posedge clock);
		tx_start = 1;
		tx_data = 10;
		
		#50;
		wait(!tx_busy);
		tx_start = 0;
		$display("tx (last) complete");
		
	end endtask
	/////////////////////////////////////////////////////////////////////////
	*/

	initial begin
		RSTB <= 1'b0;
		CSB  <= 1'b1;		// Force CSB high
		#2000;
		RSTB <= 1'b1;	    	// Release reset
		#170000;
		CSB = 1'b0;		// CSB can be released		
	end 

	initial begin		// Power-up sequence
		power1 <= 1'b0;
		power2 <= 1'b0;
		#200;
		power1 <= 1'b1;
		#200;
		power2 <= 1'b1;
	end

	wire flash_csb;
	wire flash_clk;
	wire flash_io0;
	wire flash_io1;

	wire VDD1V8;
	wire VDD3V3;
	wire VSS;

	assign VDD3V3 = power1;
	assign VDD1V8 = power2;
	assign VSS = 1'b0;

	assign mprj_io[3] = 1;  // Force CSB high.
	assign mprj_io[0] = 0;  // Disable debug mode

	caravel uut (
/*
		.vddio	  (VDD3V3),
		.vddio_2  (VDD3V3),
		.vssio	  (VSS),
		.vssio_2  (VSS),
		.vdda	  (VDD3V3),
		.vssa	  (VSS),
		.vccd	  (VDD1V8),
		.vssd	  (VSS),
		.vdda1    (VDD3V3),
		.vdda1_2  (VDD3V3),
		.vdda2    (VDD3V3),
		.vssa1	  (VSS),
		.vssa1_2  (VSS),
		.vssa2	  (VSS),
		.vccd1	  (VDD1V8),
		.vccd2	  (VDD1V8),
		.vssd1	  (VSS),
		.vssd2	  (VSS),
*/
		.clock    (clock),
		.gpio     (gpio),
		.mprj_io  (mprj_io),
		.flash_csb(flash_csb),
		.flash_clk(flash_clk),
		.flash_io0(flash_io0),
		.flash_io1(flash_io1),
		.resetb	  (RSTB)
	);

	spiflash #(
		.FILENAME("counter_la_final.hex")
	) spiflash (
		.csb(flash_csb),
		.clk(flash_clk),
		.io0(flash_io0),
		.io1(flash_io1),
		.io2(),			// not used
		.io3()			// not used
	);

	/* /////// (We do not improve UART part, so ignore here.) ///////
	// Testbench UART
	tbuart tbuart (
		.ser_rx(uart_tx),
		.tx_start(tx_start),
		.ser_tx(uart_rx),
		.tx_data(tx_data),
		.tx_busy(tx_busy),
		.tx_clear_req(tx_clear_req)
	);
	*/

endmodule
`default_nettype wire


