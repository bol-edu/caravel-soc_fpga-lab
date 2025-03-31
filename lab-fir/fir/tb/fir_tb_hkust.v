`timescale 1ns / 1ps

// File: fir_tb.v
// Auther: dqrengg
// Reference: https://github.com/bol-edu/caravel-soc_fpga-lab/tree/main/lab-fir
// Date: 2025 Mar 31

`define DATA_PATH "./src/samples_triangular_wave.dat"
`define GOLDEN_PATH "./src/out_gold.dat"
`define WAVEFORM_PATH "./waveform/fir.vcd"

// latency_mode
`define NO_LATENCY    0
`define SHORT_LATENCY 1
`define LONG_LATENCY  2

// cfg_mode
`define RAW    0
`define NO_RAW 1

// TODO: need to be calculated and configured manually base on your design
`define CYCLES_PER_Y 11

module fir_tb
#(  parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32,
    parameter Tape_Num    = 11,
    parameter Data_Num    = 600
)();
    wire                     awready;
    wire                     wready;
    reg                      awvalid;
    reg  [(pADDR_WIDTH-1):0] awaddr;
    reg                      wvalid;
    reg  [(pDATA_WIDTH-1):0] wdata;
    wire                     arready;
    reg                      rready;
    reg                      arvalid;
    reg  [(pADDR_WIDTH-1):0] araddr;
    wire                     rvalid;
    wire [(pDATA_WIDTH-1):0] rdata;
    reg                      ss_tvalid;
    reg  [(pDATA_WIDTH-1):0] ss_tdata;
    reg                      ss_tlast;
    wire                     ss_tready;
    reg                      sm_tready;
    wire                     sm_tvalid;
    wire [(pDATA_WIDTH-1):0] sm_tdata;
    wire                     sm_tlast;
    reg                      axis_clk;
    reg                      axis_rst_n;

    wire [3:0]               tap_WE;
    wire                     tap_EN;
    wire [(pDATA_WIDTH-1):0] tap_Di;
    wire [(pADDR_WIDTH-1):0] tap_A;
    wire [(pDATA_WIDTH-1):0] tap_Do;
    wire [3:0]               data_WE;
    wire                     data_EN;
    wire [(pDATA_WIDTH-1):0] data_Di;
    wire [(pADDR_WIDTH-1):0] data_A;
    wire [(pDATA_WIDTH-1):0] data_Do;

    fir fir_DUT (
        .awready(awready),
        .wready(wready),
        .awvalid(awvalid),
        .awaddr(awaddr),
        .wvalid(wvalid),
        .wdata(wdata),
        .arready(arready),
        .rready(rready),
        .arvalid(arvalid),
        .araddr(araddr),
        .rvalid(rvalid),
        .rdata(rdata),
        .ss_tvalid(ss_tvalid),
        .ss_tdata(ss_tdata),
        .ss_tlast(ss_tlast),
        .ss_tready(ss_tready),
        .sm_tready(sm_tready),
        .sm_tvalid(sm_tvalid),
        .sm_tdata(sm_tdata),
        .sm_tlast(sm_tlast),
        .tap_WE(tap_WE),
        .tap_EN(tap_EN),
        .tap_Di(tap_Di),
        .tap_A(tap_A),
        .tap_Do(tap_Do),
        .data_WE(data_WE),
        .data_EN(data_EN),
        .data_Di(data_Di),
        .data_A(data_A),
        .data_Do(data_Do),
        .axis_clk(axis_clk),
        .axis_rst_n(axis_rst_n)
    );
    
    // RAM for tap
    bram11 tap_RAM (
        .CLK(axis_clk),
        .WE(tap_WE),
        .EN(tap_EN),
        .Di(tap_Di),
        .A(tap_A),
        .Do(tap_Do)
    );

    // RAM for data
    bram11 data_RAM (
        .CLK(axis_clk),
        .WE(data_WE),
        .EN(data_EN),
        .Di(data_Di),
        .A(data_A),
        .Do(data_Do)
    );

    // dump waveform
    initial begin
        $dumpfile(`WAVEFORM_PATH);
        $dumpvars();
    end

    // Clock generation
    initial begin: CLOCK
        axis_clk = 0;
        forever #5 axis_clk = (~axis_clk);
    end

    // Reset generation
    initial begin: RESET
        axis_rst_n = 0;
        @(posedge axis_clk); @(posedge axis_clk);
        axis_rst_n = 1;
    end

    // X Data input
    reg signed [(pDATA_WIDTH-1):0] Din_list[0:(Data_Num-1)];
    reg signed [(pDATA_WIDTH-1):0] golden_list[0:(Data_Num-1)];
    reg [31:0]  data_length;
    integer Din, golden, input_data, golden_data;
    integer n;
    initial begin: DATA_INIT
        data_length = 0;
        Din = $fopen(`DATA_PATH, "r");
        golden = $fopen(`GOLDEN_PATH, "r");
        for (n=0; n<Data_Num; n=n+1) begin
            input_data = $fscanf(Din,"%d", Din_list[n]);
            golden_data = $fscanf(golden,"%d", golden_list[n]);
            data_length = data_length + 1;
        end
    end

    // Tap initialization
    reg signed [31:0] coef[0:10]; // fill in coef 
    initial begin: TAP_INIT
        coef[0]  =  32'd0;
        coef[1]  = -32'd10;
        coef[2]  = -32'd9;
        coef[3]  =  32'd23;
        coef[4]  =  32'd56;
        coef[5]  =  32'd63;
        coef[6]  =  32'd56;
        coef[7]  =  32'd23;
        coef[8]  = -32'd9;
        coef[9]  = -32'd10;
        coef[10] =  32'd0;
    end

    integer calc_cycle, cycle_per_op;

    reg cfg_error, sm_error;

    // Main procedure
    initial begin
        // initialization
        cfg_error <= 0; sm_error <= 0;
        
        arvalid <= 0; rready <= 0;
        awvalid <= 0; wvalid <= 0;
        ss_tvalid <= 0; ss_tlast <= 0;
        sm_tready <= 0;
        // wait for rst_n
        @(posedge axis_clk); @(posedge axis_clk);

        $display("============ Start simualtion ============");
        
        // Test 1
        // + no delay
        // + cycle count
        // + ordered config
        // + read and write config during calculation
        //   * write tap -> 0,                                  expect: ignore
        //   * read tap,                                        expect: return 32'hffff_ffff
        //   * write ap_start -> 1, ap_done -> 1, ap_idle -> 1, expect: ignore
        //   * read ap_*,                                       expect: return 32'hxxxx_xxx0
        //   * write data_length -> 0,                          expect: ignore
        //   * read data_length,                                expect: return original value
        test(1, `RAW, `NO_LATENCY);

        // Test 2
        // + short latency
        // + out of order read and write (read and write at the same time, but write to certain address before reading)
        // + read and write config during calculation
        //   * write tap -> 0,                                  expect: ignore
        //   * read tap,                                        expect: return 32'hffff_ffff
        //   * write ap_start -> 1, ap_done -> 1, ap_idle -> 1, expect: ignore
        //   * read ap_*,                                       expect: return 32'hxxxx_xxx0
        //   * write data_length -> 0,                          expect: ignore
        //   * read data_length,                                expect: return original value
        // - try to de-assert ap_start before X stream in (not implemented)
        test(2, `NO_RAW, `SHORT_LATENCY);

        // Test 3
        // + long latency
        // + out of order read and write (read and write at the same time, but write to certain address before reading)
        // + read and write config during calculation
        //   * write tap -> 0,                                  expect: ignore
        //   * read tap,                                        expect: return 32'hffff_ffff
        //   * write ap_start -> 1, ap_done -> 1, ap_idle -> 1, expect: ignore
        //   * read ap_*,                                       expect: return 32'hxxxx_xxx0
        //   * write data_length -> 0,                          expect: ignore
        //   * read data_length,                                expect: return original value
        test(3, `NO_RAW, `LONG_LATENCY);

        $display("============= End simualtion =============");

        if (cfg_error || sm_error) begin
            $display("Simualtion FAIL!");
        end else begin
            $display("Simualtion PASS!");
        end

        $finish;
    end
    
    // Schedule

    // Test 1
    // | axi write |          | program ap_start | invalid write |
    //             | axi_read |                  | invalid read  |   | read ap_done |
    //                                           | axis slave |
    //                                           | -- axis master -- |
    //                                           | -- cycle count -- |

    // Test 2 & 3
    // | axi write |     | program ap_start | invalid write |
    //    | - axi_read - |                  | invalid read  |   | read ap_done |
    //                                      | axis slave |
    //                                      | -- axis master -- |

    integer delay_mode, cfg_mode; // set as global
    task automatic test;
        input [31:0] test_idx;
        input [31:0] _cfg_mode;
        input [31:0] _delay_mode;
        begin
            $display("============== Start Test %1d ==============", test_idx);
            delay_mode = _delay_mode;
            cfg_mode = _cfg_mode;
            fork
                begin if (delay_mode == `NO_LATENCY) cycle_count(); end
                begin
                    // cfg
                    axi_cfg();
                    // start engine
                    program_ap_start();
                    fork
                        // axis
                        begin axis(); end
                        // check invalid read and write during calculation
                        begin axi_invalid(); end
                        // check ap_done, ap_idle
                        begin check_ap_done(); end
                    join
                end
            join
            $display("=============== End Test %1d ===============", test_idx);
        end
    endtask
    
    // timer for test1
    integer timer;
    task cycle_count;
        begin
            timer <= 0;
            while (!(ss_tvalid && ss_tready)) @(posedge axis_clk);
            while (!(sm_tlast && sm_tvalid && sm_tready)) begin
                @(posedge axis_clk);
                timer <= timer + 1;
            end
            $display("Total: %d cycles", timer);
        end
    endtask

    // for loop counter
    integer i, j, k, m, p, q;

    task axi_cfg;
        begin
            // data_length
            fork
                begin axi_aw(12'h010); end
                begin axi_w(data_length); end
            join
            // Tap: write and read back
            if (cfg_mode == `RAW) begin
                fork
                    begin: aw_proc1
                        for (k=0; k<Tape_Num; k=k+1) begin
                            axi_aw(12'h040+4*k);
                        end
                    end
                    begin: w_proc1
                        for (m=0; m<Tape_Num; m=m+1) begin
                            axi_w(coef[m]);
                        end
                    end
                join
                // read config after all Taps are written
                fork
                    begin: ar_proc1
                        for (k=0; k<Tape_Num; k=k+1) begin
                            axi_ar(12'h040+4*k);
                        end
                    end
                    begin: r_proc1
                        for (m=0; m<Tape_Num; m=m+1) begin
                            axi_r();
                            axi_read_check(coef[m], 32'hffff_ffff);
                        end
                    end
                join
            end else begin
                // read immediately after write
                fork
                    begin: aw_proc2
                        for (k=0; k<Tape_Num; k=k+1) begin
                            axi_aw(12'h040+4*k);
                        end
                    end
                    begin: w_proc2
                        for (m=0; m<Tape_Num; m=m+1) begin
                            axi_w(coef[m]);
                        end
                    end
                    begin: ar_proc2
                        for (p=0; p<Tape_Num; p=p+1) begin
                            while (p > m || p == m && !wready) @(posedge axis_clk);
                            axi_ar(12'h040+4*p);
                        end
                    end
                    begin: r_proc2
                        for (q=0; q<Tape_Num; q=q+1) begin
                            while (q > m || q == m && !wready) @(posedge axis_clk);
                            axi_r();
                            axi_read_check(coef[q], 32'hffff_ffff);
                        end
                    end
                join
            end
        end
    endtask

    task axi_invalid;
        begin
            // wait for ap_start (when X is sampled)
            while (ss_tvalid && ss_tready) @(posedge axis_clk);
            @(posedge axis_clk);
            // write and read tap
            fork
                begin
                    for (k=0; k<Tape_Num; k=k+1) begin
                        axi_aw(12'h040+4*k);
                    end
                end
                begin
                    for (m=0; m<Tape_Num; m=m+1) begin
                        axi_w(32'h0000_0000);
                    end
                end
                begin
                    for (p=0; p<Tape_Num; p=p+1) begin
                        while (p > m || p == m && !wready) @(posedge axis_clk);
                        axi_ar(12'h040+4*p);
                    end
                end
                begin
                    for (q=0; q<Tape_Num; q=q+1) begin
                        while (q > m || q == m && !wready) @(posedge axis_clk);
                        axi_r();
                        axi_read_check(32'hffff_ffff, 32'hffff_ffff);
                    end
                end
            join
            // try to set ap_start = 1, ap_done = 1, ap_idle = 1
            fork
                begin axi_aw(12'h000); end
                begin axi_w(32'h0000_0007); end
                begin
                    while (!wready) @(posedge axis_clk);
                    axi_ar(12'h000);
                end
                begin
                    while (!wready) @(posedge axis_clk);
                    axi_r();
                    axi_read_check(32'h0000_0000, 32'h0000_0007);
                end
            join
            // try to modify data_length -> 0
            fork
                begin axi_aw(12'h010); end
                begin axi_w(32'h0000_0000); end
                begin
                    while (!wready) @(posedge axis_clk);
                    axi_ar(12'h010);
                end
                begin
                    while (!wready) @(posedge axis_clk);
                    axi_r();
                    axi_read_check(data_length, 32'hffff_ffff);
                end
            join
        end
    endtask

    task program_ap_start;
        begin
            fork
                begin axi_aw(12'h000); end
                begin axi_w(32'h0000_0001); end
            join
        end
    endtask

    task check_ap_done;
        begin
            // wait for ap_done
            // TODO: need to modify if you have another ap_done implementation
            while (!(sm_tlast && sm_tvalid && sm_tready)) @(posedge axis_clk);
            // check ap_done = 1 (0x00 [bit 1])
            fork
                begin axi_ar(12'h000); end
                begin
                    axi_r(); 
                    axi_read_check(32'h0000_0002, 32'h0000_0002);
                end
            join
            // check ap_idle = 1 (0x00 [bit 2])
            fork
                begin axi_ar(12'h000); end
                begin
                    axi_r();
                    axi_read_check(32'h0000_0004, 32'h0000_0004);
                end
            join
        end
    endtask

    task axi_aw;
        input [(pADDR_WIDTH-1):0] _awaddr;
        begin
            axi_delay();
            awvalid <= 1; awaddr <= _awaddr;
            @(posedge axis_clk);
            while (!awready) @(posedge axis_clk);
            awvalid <= 0;
        end
    endtask

    task axi_w;
        input [(pDATA_WIDTH-1):0] _wdata;
        begin
            axi_delay();
            wvalid  <= 1; wdata <= _wdata;
            @(posedge axis_clk);
            while (!wready) @(posedge axis_clk);
            wvalid <= 0;
        end
    endtask

    task axi_ar;
        input [(pADDR_WIDTH-1):0] _araddr;
        begin
            axi_delay();
            arvalid <= 1; araddr <= _araddr;
            @(posedge axis_clk);
            while (!arready) @(posedge axis_clk);
            arvalid <= 0;
        end
    endtask

    task axi_r;
        begin
            axi_delay();
            rready <= 1;
            @(posedge axis_clk);
            while (!rvalid) @(posedge axis_clk);
            rready <= 0;
        end
    endtask

    task axi_read_check;
        input [(pDATA_WIDTH-1):0] exp_data;
        input [(pDATA_WIDTH-1):0] mask;
        begin
            if ((rdata & mask) != (exp_data & mask)) begin
                $display("[ERROR] exp = %5d, rdata = %5d, time: %6d", $signed(exp_data), $signed(rdata), $realtime);
                cfg_error <= 1;
                //@(posedge axis_clk); $finish;
            end else begin
                $display("[PASS]  exp = %5d, rdata = %5d, time: %6d", $signed(exp_data), $signed(rdata), $realtime);
            end
        end
    endtask

    task ss;
        input [31:0]              ss_count;  // pattern count
        input [(pDATA_WIDTH-1):0] _ss_tdata; // ss data
        begin
            axis_delay();
            ss_tvalid <= 1; ss_tdata <= _ss_tdata;
            if (ss_count == data_length - 1) ss_tlast <= 1;
            @(posedge axis_clk);
            while (!ss_tready) @(posedge axis_clk);
            ss_tvalid <= 0; ss_tlast <= 0;
        end
    endtask

    task sm;
        begin
            axis_delay();
            sm_tready <= 1;
            @(posedge axis_clk);
            while (!sm_tvalid) @(posedge axis_clk);
            sm_tready <= 0;
        end
    endtask

    task axis;
        begin
            fork
                begin: ss_proc
                    for (i=0; i<data_length; i=i+1) begin
                        ss(i, Din_list[i]);
                    end
                end
                begin: sm_proc
                    for (j=0; j<data_length; j=j+1) begin
                        sm();
                        axis_out_check(j, golden_list[j]);
                    end
                end
            join
        end
    endtask

    task axis_out_check;
        input [31:0] pcnt;   // pattern count
        input [31:0] golden; // golden data
        begin
            if (sm_tdata != golden) begin
                $display("[ERROR] [Pattern %4d] Golden: %6d, Yours: %6d, time: %6d", pcnt, $signed(golden), $signed(sm_tdata), $realtime);
                sm_error <= 1;
                //@(posedge axis_clk); $finish;
            end else begin
                $display("[PASS]  [Pattern %4d] Golden: %6d, Yours: %6d, time: %6d", pcnt, $signed(golden), $signed(sm_tdata), $realtime);
            end
        end
    endtask

    // addr, data out-of-order
    task automatic axi_delay;
        begin
            if (delay_mode != `NO_LATENCY) begin: AXI_LATENCY
                integer delay, z;
                delay = ({$random} % 6);
                for (z=0; z<delay-1; z=z+1) @(posedge axis_clk);
            end
        end
    endtask

    task automatic axis_delay;
        begin
            if (delay_mode == `SHORT_LATENCY) begin: AXIS_SHORT
                integer delay, z;
                delay = ({$random} % 6);
                for (z=0; z<delay-1; z=z+1) @(posedge axis_clk);
            end else if (delay_mode == `LONG_LATENCY) begin: AXIS_LONG
                integer delay, z;
                delay = `CYCLES_PER_Y * ({$random} % 4);
                for (z=0; z<delay-1; z=z+1) @(posedge axis_clk);
            end
        end
    endtask
endmodule
