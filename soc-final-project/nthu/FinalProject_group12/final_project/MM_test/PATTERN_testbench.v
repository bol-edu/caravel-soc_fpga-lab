`timescale 1ns/1ps
`define CYCLE_TIME 1.6

module PATTERN_testbench
#(  parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32,
    parameter Tape_Num    = 11
)
//======================================
//          I/O PORTS
//======================================
(
    output reg                      axis_clk,
    output reg                      axis_rst_n,
    output reg                      ss_tvalid,
    output reg [(pDATA_WIDTH-1):0]  ss_tdata,
    output reg                      sm_tready,

    input                           mm_start,
    input                           mm_done,
    input                           mm_idle,
    input                           ss_tready,
    input                           sm_tvalid,
    input      [(pDATA_WIDTH-1):0]  sm_tdata
);

//======================================
//      PARAMETERS & VARIABLES
//======================================
parameter CYCLE      = `CYCLE_TIME;
integer i, j;


//======================================
//              Clock
//======================================
initial axis_clk = 1'b0;
always #(CYCLE/2.0) axis_clk = ~axis_clk;

initial begin
	$dumpfile("PATTERN_testbench.vcd");
	$dumpvars(0, PATTERN_testbench);

	// Repeat cycles of 1000 clock edges as needed to complete testbench
	repeat (100) begin // modified (original:200)
		repeat (1000) @(posedge axis_clk);
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

wire mm_start, mm_done, mm_idle,ss_tready,sm_tvalid;
wire [31:0] sm_tdata;

mm mm_U0 (

        .axis_clk(axis_clk),
        .axis_rst_n(axis_rst_n),

        .mm_start(mm_start),
        .mm_done(mm_done),
        .mm_idle(mm_idle),

        .ss_tvalid(ss_tvalid),
        .ss_tdata(ss_tdata),
        .ss_tready(ss_tready),

        .sm_tready(sm_tready),
        .sm_tvalid(sm_tvalid),
        .sm_tdata(sm_tdata)

    );

//======================================
//              MAIN
//======================================
initial main_task;

//======================================
//              TASKS
//======================================
task main_task; begin
    reset_task;
    sm_tready = 1;
    // for(i = 0; i<16; i = i+1) begin
    //     input_task_A(i % 4);  // A matrix [ 0 1 2 3
    //                         //            0 1 2 3
    //                         //            0 1 2 3
    //                         //            0 1 2 3 ]
    //     input_task_B(4*i + 1);    // B matrix  [ 1  2  3  4
    //                             //             5  6  7  8
    //                             //             9 10 11 12
    //                             //            13 14 15 16 ]
    //     if (i % 4 == 0) begin
    //         ss_tvalid = 0;
    //     end
    // end

    // ***************A ROW 1 (STATE3)*************** //
    input_task_A(1);
    input_task_A(2);
    input_task_A(3);
    // ss_tvalid = 0;
    // repeat(2) @(posedge axis_clk);
    input_task_A(4);
    // ***************A ROW 1 (STATE3)*************** //

    // ***************MATRIX B (STATE4)*************** //
    input_task_B(0);
    input_task_B(4);
    input_task_B(8);
    input_task_B(12);

    input_task_B(1);
    input_task_B(5);
    input_task_B(9);
    input_task_B(13);
    input_task_B(2);
    input_task_B(6);
    input_task_B(10);
    input_task_B(14);
    input_task_B(3);
    input_task_B(7);
    // ss_tvalid = 0;
    // repeat(2) @(posedge axis_clk);
    input_task_B(11);
    input_task_B(15);
    // ***************MATRIX B (STATE4)*************** //

    // ***************A ROW 2 (STATE6)*************** //
    input_task_A(5);
    // ss_tvalid = 0;
    // repeat(2) @(posedge axis_clk);
    input_task_A(6);
    input_task_A(7);
    input_task_A(8);
    // ***************A ROW 2 (STATE6)*************** //

    // ***************A ROW 3 (STATE8)*************** //
    input_task_A(9);
    input_task_A(10);
    // ss_tvalid = 0;
    // repeat(2) @(posedge axis_clk);
    input_task_A(11);
    input_task_A(12);
    // ***************A ROW 3 (STATE8)*************** //

    // ***************A ROW 4 (STATE10)*************** //
    input_task_A(13);
    input_task_A(14);
    input_task_A(15);
    // ss_tvalid = 0;
    // repeat(2) @(posedge axis_clk);
    input_task_A(16);
    // ***************A ROW 4 (STATE10)*************** //
    
    
    
    
/*
    // ***************A ROW 1 (STATE3)*************** //
    input_task_A(0);
    input_task_A(1);
    input_task_A(2);
    // ss_tvalid = 0;
    // repeat(2) @(posedge axis_clk);
    input_task_A(3);
    // ***************A ROW 1 (STATE3)*************** //

    // ***************MATRIX B (STATE4)*************** //
    

    input_task_B(1);
    input_task_B(5);
    input_task_B(9);
    input_task_B(13);
    input_task_B(2);
    input_task_B(6);
    input_task_B(10);
    input_task_B(14);
    input_task_B(3);
    input_task_B(7);
    // ss_tvalid = 0;
    // repeat(2) @(posedge axis_clk);
    input_task_B(11);
    input_task_B(15);
    
    input_task_B(4);
    input_task_B(8);
    input_task_B(12);
    input_task_B(16);
    // ***************MATRIX B (STATE4)*************** //

    // ***************A ROW 2 (STATE6)*************** //
    input_task_A(0);
    // ss_tvalid = 0;
    // repeat(2) @(posedge axis_clk);
    input_task_A(1);
    input_task_A(2);
    input_task_A(3);
    // ***************A ROW 2 (STATE6)*************** //

    // ***************A ROW 3 (STATE8)*************** //
    input_task_A(0);
    input_task_A(1);
    // ss_tvalid = 0;
    // repeat(2) @(posedge axis_clk);
    input_task_A(2);
    input_task_A(3);
    // ***************A ROW 3 (STATE8)*************** //

    // ***************A ROW 4 (STATE10)*************** //
    input_task_A(0);
    input_task_A(1);
    input_task_A(2);
    // ss_tvalid = 0;
    // repeat(2) @(posedge axis_clk);
    input_task_A(3);
    // ***************A ROW 4 (STATE10)*************** //
    
*/

    # 1000;
    $finish;
end endtask

//**************************************
//      Reset Task
//**************************************
task reset_task; begin
    axis_clk <= 0;
    axis_rst_n <= 1;
    ss_tvalid <= 0;
    sm_tready <= 0;
    #(CYCLE/2.0) axis_rst_n = 0;
    #(CYCLE/2.0) axis_rst_n = 1;
end endtask

//**************************************
//      Input Task
//**************************************
task input_task_A; 
    input  signed [31:0] in1;
    begin
        wait(axis_clk);
        ss_tvalid = 1;
        ss_tdata  = in1;
        @(posedge axis_clk);
        while (!ss_tready) begin
            @(posedge axis_clk);
        end
    end
endtask

task input_task_B; 
    input  signed [31:0] in1;
    begin
        ss_tvalid <= 1;
        ss_tdata  <= in1;
        @(posedge axis_clk);
        while (!ss_tready) begin
            @(posedge axis_clk);
        end
    end
endtask

//**************************************
//      Check Task
//**************************************
// task sm;
//     input  signed [31:0] in2; // golden data
//     input         [31:0] pcnt; // pattern count
//     begin
//         sm_tready <= 1;
//         @(posedge axis_clk) 
//         wait(sm_tvalid);
//         while(!sm_tvalid) @(posedge axis_clk);
//         if (sm_tdata != in2) begin
//             $display("[ERROR] [Pattern %d] Golden answer: %d, Your answer: %d", pcnt, in2, sm_tdata);
//             error <= 1;
//         end
//         else begin
//             $display("[PASS] [Pattern %d] Golden answer: %d, Your answer: %d", pcnt, in2, sm_tdata);
//         end
//         @(posedge axis_clk);
//     end
// endtask

//**************************************
//      Error Task
//**************************************
// task error; begin

// end endtask

//**************************************
//      Failed Task
//**************************************
task fail_task; begin
    // $display("\nFAIL!! There were %d errors in all.\n", err_cnt);
    $display("                                                                                ");
    $display("                                                   ./+oo+/.                     ");
    $display("                                                  /s:-----+s`                   ");
    $display("                                                  y/-------:y                   ");
    $display("                                             `.-:/od+/------y`                  ");
    $display("                               `:///+++ooooooo+//::::-----:/y+:`                ");
    $display("                              -m+:::::::---------------------::o+.              ");
    $display("                             `hod-------------------------------:o+             ");
    $display("                       ./++/:s/-o/--------------------------------/s///::.      ");
    $display("                      /s::-://--:--------------------------------:oo/::::o+     ");
    $display("                    -+ho++++//hh:-------------------------------:s:-------+/    ");
    $display("                  -s+shdh+::+hm+--------------------------------+/--------:s    ");
    $display("                 -s:hMMMMNy---+y/-------------------------------:---------//    ");
    $display("                 y:/NMMMMMN:---:s-/o:-------------------------------------+`    ");
    $display("                 h--sdmmdy/-------:hyssoo++:----------------------------:/`     ");
    $display("                 h---::::----------+oo+/::/+o:---------------------:+++s-`      ");
    $display("                 s:----------------/s+///------------------------------o`       ");
    $display("           ``..../s------------------::--------------------------------o        ");
    $display("       -/oyhyyyyyym:----------------://////:--------------------------:/        ");
    $display("      /dyssyyyssssyh:-------------/o+/::::/+o/------------------------+`        ");
    $display("    -+o/---:/oyyssshd/-----------+o:--------:oo---------------------:/.         ");
    $display("  `++--------:/sysssddy+:-------/+------------s/------------------://`          ");
    $display(" .s:---------:+ooyysyyddoo++os-:s-------------/y----------------:++.            ");
    $display(" s:------------/yyhssyshy:---/:o:-------------:dsoo++//:::::-::+syh`            ");
    $display("`h--------------shyssssyyms+oyo:--------------/hyyyyyyyyyyyysyhyyyy`            ");
    $display("`h--------------:yyssssyyhhyy+----------------+dyyyysssssssyyyhs+/.             ");
    $display(" s:--------------/yysssssyhy:-----------------shyyyyyhyyssssyyh.                ");
    $display(" .s---------------+sooosyyo------------------/yssssssyyyyssssyo                 ");
    $display("  /+-------------------:++------------------:ysssssssssssssssy-                 ");
    $display("  `s+--------------------------------------:syssssssssssssssyo                  ");
    $display("`+yhdo--------------------:/--------------:syssssssssssssssyy.                  ");
    $display("+yysyhh:-------------------+o------------/ysyssssssssssssssy/                   ");
    $display(" /hhysyds:------------------y-----------/+yyssssssssssssssyh`                   ");
    $display(" .h-+yysyds:---------------:s----------:--/yssssssssssssssym:                   ");
    $display(" y/---oyyyyhyo:-----------:o:-------------:ysssssssssyyyssyyd-                  ");
    $display("`h------+syyyyhhsoo+///+osh---------------:ysssyysyyyyysssssyd:                 ");
    $display("/s--------:+syyyyyyyyyyyyyyhso/:-------::+oyyyyhyyyysssssssyy+-                 ");
    $display("+s-----------:/osyyysssssssyyyyhyyyyyyyydhyyyyyyssssssssyys/`                   ");
    $display("+s---------------:/osyyyysssssssssssssssyyhyyssssssyyyyso/y`                    ");
    $display("/s--------------------:/+ossyyyyyyssssssssyyyyyyysso+:----:+                    ");
    $display(".h--------------------------:::/++oooooooo+++/:::----------o`                   ");
    // repeat(5) @(negedge axis_clk);
    // $finish;
end endtask

//**************************************
//      PASS Task
//**************************************
task pass_task; begin
    //$display("\nPASS!! No errors were found!\n");
	$display("\033[1;33m                `oo+oy+`                            \033[1;35m Congratulation!!! \033[1;0m                                   ");
    $display("\033[1;33m               /h/----+y        `+++++:             \033[1;35m PASS This Lab........Maybe \033[1;0m                          ");
    // $display("\033[1;33m             .y------:m/+ydoo+:y:---:+o             \033[1;35m Total Latency : %-10d\033[1;0m                                ", out_latency);
    $display("\033[1;33m              o+------/y--::::::+oso+:/y                                                                                     ");
    $display("\033[1;33m              s/-----:/:----------:+ooy+-                                                                                    ");
    $display("\033[1;33m             /o----------------/yhyo/::/o+/:-.`                                                                              ");
    $display("\033[1;33m            `ys----------------:::--------:::+yyo+                                                                           ");
    $display("\033[1;33m            .d/:-------------------:--------/--/hos/                                                                         ");
    $display("\033[1;33m            y/-------------------::ds------:s:/-:sy-                                                                         ");
    $display("\033[1;33m           +y--------------------::os:-----:ssm/o+`                                                                          ");
    $display("\033[1;33m          `d:-----------------------:-----/+o++yNNmms                                                                        ");
    $display("\033[1;33m           /y-----------------------------------hMMMMN.                                                                      ");
    $display("\033[1;33m           o+---------------------://:----------:odmdy/+.                                                                    ");
    $display("\033[1;33m           o+---------------------::y:------------::+o-/h                                                                    ");
    $display("\033[1;33m           :y-----------------------+s:------------/h:-:d                                                                    ");
    $display("\033[1;33m           `m/-----------------------+y/---------:oy:--/y                                                                    ");
    $display("\033[1;33m            /h------------------------:os++/:::/+o/:--:h-                                                                    ");
    $display("\033[1;33m         `:+ym--------------------------://++++o/:---:h/                                                                     ");
    $display("\033[1;31m        `hhhhhoooo++oo+/:\033[1;33m--------------------:oo----\033[1;31m+dd+                                                 ");
    $display("\033[1;31m         shyyyhhhhhhhhhhhso/:\033[1;33m---------------:+/---\033[1;31m/ydyyhs:`                                              ");
    $display("\033[1;31m         .mhyyyyyyhhhdddhhhhhs+:\033[1;33m----------------\033[1;31m:sdmhyyyyyyo:                                            ");
    $display("\033[1;31m        `hhdhhyyyyhhhhhddddhyyyyyo++/:\033[1;33m--------\033[1;31m:odmyhmhhyyyyhy                                            ");
    $display("\033[1;31m        -dyyhhyyyyyyhdhyhhddhhyyyyyhhhs+/::\033[1;33m-\033[1;31m:ohdmhdhhhdmdhdmy:                                           ");
    $display("\033[1;31m         hhdhyyyyyyyyyddyyyyhdddhhyyyyyhhhyyhdhdyyhyys+ossyhssy:-`                                                           ");
    $display("\033[1;31m         `Ndyyyyyyyyyyymdyyyyyyyhddddhhhyhhhhhhhhy+/:\033[1;33m-------::/+o++++-`                                            ");
    $display("\033[1;31m          dyyyyyyyyyyyyhNyydyyyyyyyyyyhhhhyyhhy+/\033[1;33m------------------:/ooo:`                                         ");
    $display("\033[1;31m         :myyyyyyyyyyyyyNyhmhhhyyyyyhdhyyyhho/\033[1;33m-------------------------:+o/`                                       ");
    $display("\033[1;31m        /dyyyyyyyyyyyyyyddmmhyyyyyyhhyyyhh+:\033[1;33m-----------------------------:+s-                                      ");
    $display("\033[1;31m      +dyyyyyyyyyyyyyyydmyyyyyyyyyyyyyds:\033[1;33m---------------------------------:s+                                      ");
    $display("\033[1;31m      -ddhhyyyyyyyyyyyyyddyyyyyyyyyyyhd+\033[1;33m------------------------------------:oo              `-++o+:.`             ");
    $display("\033[1;31m       `/dhshdhyyyyyyyyyhdyyyyyyyyyydh:\033[1;33m---------------------------------------s/            -o/://:/+s             ");
    $display("\033[1;31m         os-:/oyhhhhyyyydhyyyyyyyyyds:\033[1;33m----------------------------------------:h:--.`      `y:------+os            ");
    $display("\033[1;33m         h+-----\033[1;31m:/+oosshdyyyyyyyyhds\033[1;33m-------------------------------------------+h//o+s+-.` :o-------s/y  ");
    $display("\033[1;33m         m:------------\033[1;31mdyyyyyyyyymo\033[1;33m--------------------------------------------oh----:://++oo------:s/d  ");
    $display("\033[1;33m        `N/-----------+\033[1;31mmyyyyyyyydo\033[1;33m---------------------------------------------sy---------:/s------+o/d  ");
    $display("\033[1;33m        .m-----------:d\033[1;31mhhyyyyyyd+\033[1;33m----------------------------------------------y+-----------+:-----oo/h  ");
    $display("\033[1;33m        +s-----------+N\033[1;31mhmyyyyhd/\033[1;33m----------------------------------------------:h:-----------::-----+o/m  ");
    $display("\033[1;33m        h/----------:d/\033[1;31mmmhyyhh:\033[1;33m-----------------------------------------------oo-------------------+o/h  ");
    $display("\033[1;33m       `y-----------so /\033[1;31mNhydh:\033[1;33m-----------------------------------------------/h:-------------------:soo  ");
    $display("\033[1;33m    `.:+o:---------+h   \033[1;31mmddhhh/:\033[1;33m---------------:/osssssoo+/::---------------+d+//++///::+++//::::::/y+`  ");
    $display("\033[1;33m   -s+/::/--------+d.   \033[1;31mohso+/+y/:\033[1;33m-----------:yo+/:-----:/oooo/:----------:+s//::-.....--:://////+/:`    ");
    $display("\033[1;33m   s/------------/y`           `/oo:--------:y/-------------:/oo+:------:/s:                                                 ");
    $display("\033[1;33m   o+:--------::++`              `:so/:-----s+-----------------:oy+:--:+s/``````                                             ");
    $display("\033[1;33m    :+o++///+oo/.                   .+o+::--os-------------------:oy+oo:`/o+++++o-                                           ");
    $display("\033[1;33m       .---.`                          -+oo/:yo:-------------------:oy-:h/:---:+oyo                                          ");
    $display("\033[1;33m                                          `:+omy/---------------------+h:----:y+//so                                         ");
    $display("\033[1;33m                                              `-ys:-------------------+s-----+s///om                                         ");
    $display("\033[1;33m                                                 -os+::---------------/y-----ho///om                                         ");
    $display("\033[1;33m                                                    -+oo//:-----------:h-----h+///+d                                         ");
    $display("\033[1;33m                                                       `-oyy+:---------s:----s/////y                                         ");
    $display("\033[1;33m                                                           `-/o+::-----:+----oo///+s                                         ");
    $display("\033[1;33m                                                               ./+o+::-------:y///s:                                         ");
    $display("\033[1;33m                                                                   ./+oo/-----oo/+h                                          ");
    $display("\033[1;33m                                                                       `://++++syo`                                          ");
    $display("\033[1;0m"); 
    // repeat(5) @(negedge axis_clk);
    //     $finish;
end endtask

endmodule
