///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: tc
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/05/17
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ns
`include "axil_m_interface.sv"

// https://stackoverflow.com/questions/55198865/problem-with-creating-structural-modules-using-interfaces-systemverilog

module tc(axil_m_interface axi_intf);
    `include "axil_m_scenario.sv"
    `include "axil_m_driver.sv"
    `include "axil_m_monitor.sv"
    `include "axil_m_scoreboard.sv"
    axil_m_scenario_gen gen;
    axil_m_driver drvr;
    axil_m_monitor mon;
    axil_m_scoreboard scrbd;
    mb_axi gen2drvr, gen2scrbd, mon2scrbd;

    constraint axil_m_scenario::op_limit{
        //axi_op == AXI_WR;
    }

    function void connect();
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
        axil_m_scenario_gen::PKT_NUM = 500;

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
