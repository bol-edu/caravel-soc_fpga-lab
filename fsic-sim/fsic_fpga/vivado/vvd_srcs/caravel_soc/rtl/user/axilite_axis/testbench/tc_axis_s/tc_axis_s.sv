///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: tc
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/06/29
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ns

`include "axis_s_interface.sv"

module tc(axis_s_interface axi_intf);
    `include "axis_s_scenario.sv"
    `include "axis_s_driver.sv"
    `include "axis_s_monitor.sv"
    `include "axis_s_scoreboard.sv"

    axis_s_scenario_gen gen;
    axis_s_driver drvr;
    axis_s_monitor mon;
    axis_s_scoreboard scrbd;
    mb_axi gen2drvr, gen2scrbd, mon2scrbd;

    //constraint axis_s_scenario::rdy{ // override constraint
    //    no_rdy_cnt == 0;
    //}

    function connect();
        gen2drvr = new();
        gen2scrbd = new();
        mon2scrbd = new();

        gen = new(gen2drvr, gen2scrbd);
        drvr = new(axi_intf.master, gen2drvr);
        mon = new(axi_intf.master, mon2scrbd);
        scrbd = new(axi_intf.master, gen2scrbd, mon2scrbd);
    endfunction

    initial begin
        connect();
        //axis_s_scenario_gen::PKT_NUM = 30;
        axis_s_scenario_gen::PKT_NUM = 500;

        fork
            gen.gen();
            drvr.bus_op();
            mon.bus_mon();
            scrbd.compare_trans();
        join

        scrbd.report();
        $finish();
    end
endmodule
