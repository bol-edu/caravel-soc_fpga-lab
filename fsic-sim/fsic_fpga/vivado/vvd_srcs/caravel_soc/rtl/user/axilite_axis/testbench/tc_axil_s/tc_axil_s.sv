///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: tc
//       AUTHOR: zack, Willy
// ORGANIZATION: fsic
//      CREATED: 2023/07/01
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ns
`include "axil_s_interface.sv"

module tc(axil_s_interface axi_intf);
    `include "axil_s_scenario.sv"
    `include "axil_s_driver.sv"
    `include "axil_s_monitor.sv"
    `include "axil_s_scoreboard.sv"
    axil_s_scenario_gen gen;
    axil_s_driver drvr;
    axil_s_monitor mon;
    axil_s_scoreboard scrbd;
    mb_axi gen2drvr, gen2scrbd, mon2scrbd;

    //constraint axi_scenario::op_limit{
    //    //axi_op == AXI_WR;
    //}

    function void connect();
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
        axil_s_scenario_gen::PKT_NUM = 1000;

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
