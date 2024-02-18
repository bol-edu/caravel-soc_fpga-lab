///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: top
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/06/29
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ns

module top();
    event evt_get_data, evt_get_data2, evt_001, evt_002, evt_003;
    int xsim_dbg_01;
    //static int no_rdy_trans, no_rdy_cnt;

    axis_s_interface axis_intf();
    tc testcase(axis_intf);
    axis_slave axis_s(
        .axi_aclk(axis_intf.axi_aclk),
        .axi_aresetn(axis_intf.axi_aresetn),
        .axis_tvalid(axis_intf.axis_tvalid),
        .axis_tdata(axis_intf.axis_tdata),
        .axis_tstrb(axis_intf.axis_tstrb),
        .axis_tkeep(axis_intf.axis_tkeep),
        .axis_tlast(axis_intf.axis_tlast),
        .axis_tuser(axis_intf.axis_tuser),
        .axis_tready(axis_intf.axis_tready),

        .bk_data(axis_intf.bk_data),
        .bk_tstrb(axis_intf.bk_tstrb),
        .bk_tkeep(axis_intf.bk_tkeep),
        .bk_user(axis_intf.bk_user),
        .bk_tlast(axis_intf.bk_tlast),
        .bk_ready(axis_intf.bk_ready),
        .bk_valid(axis_intf.bk_valid)
    );

    bit clk = 0, rst = 0;
    parameter CLK_PERIOD = 20ns, RESET_PERIOD = 80ns;
    initial begin
        while(1)begin
            #(CLK_PERIOD / 2) clk = ~clk;
        end
    end

    initial begin
        #(RESET_PERIOD);
        rst = 1;
    end

    assign axis_intf.axi_aclk = clk;
    assign axis_intf.axi_aresetn = rst;

    initial begin
        $dumpfile("axis_s.vcd");
        $dumpvars(0, top);
        $dumpvars(0, top.testcase);
    end

    initial begin
        #(200000ns) $finish();
    end
endmodule
