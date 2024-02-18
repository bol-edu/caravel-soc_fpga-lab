///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: tc
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/06/19
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ns

`include "axis_m_interface.sv"

module tc(axis_m_interface axi_intf);
    `include "axis_m_scenario.sv"
    `include "axis_m_driver.sv"
    `include "axis_m_monitor.sv"
    `include "axis_m_scoreboard.sv"

    axis_m_scenario_gen gen;
    axis_m_driver drvr;
    axis_m_monitor mon;
    axis_m_scoreboard scrbd;
    mb_axi gen2drvr, gen2scrbd, mon2scrbd;

    constraint axis_m_scenario::rdy{ // override constraint
       // no_rdy_cnt == 2; // have ready randomly low
        no_rdy_cnt == 0; // ready always high
    }

    function connect();
        gen2drvr = new();
        gen2scrbd = new();
        mon2scrbd = new();

        gen = new(gen2drvr, gen2scrbd);
        drvr = new(axi_intf.slave, gen2drvr);
        mon = new(axi_intf.slave, mon2scrbd);
        scrbd = new(axi_intf.slave, gen2scrbd, mon2scrbd);
    endfunction

    initial begin
        connect();
        //axis_m_scenario_gen::PKT_NUM = 30;
        axis_m_scenario_gen::PKT_NUM = 500;

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
