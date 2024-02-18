///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: top
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/07/08
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ns

module top();
    event evt_001, evt_002, evt_003, evt_004, evt_005;
    static int no_rdy_trans, no_rdy_cnt;
    int sm_largest_fifo_level, clls_largest_fifo_level, clss_largest_fifo_level;
    event ls_rd_done, ls_wr_done, ss_done;

    //logic axis_tvalid, axis_tlast, axis_tready;
    //logic [31:0] axis_tdata;
    //logic [3:0] axis_tstrb, axis_tkeep;
    //logic [1:0] axis_tid, axis_tuser;

    axil_axis_interface aa_intf();
    tc testcase(aa_intf);
    AXIL_AXIS axil_axis(
        .m_awvalid(aa_intf.axi_lm_awvalid),
        .m_awaddr(aa_intf.axi_lm_awaddr),
        .m_wvalid(aa_intf.axi_lm_wvalid),
        .m_wdata(aa_intf.axi_lm_wdata),
        .m_wstrb(aa_intf.axi_lm_wstrb),
        .m_arvalid(aa_intf.axi_lm_arvalid),
        .m_araddr(aa_intf.axi_lm_araddr),
        .m_rready(aa_intf.axi_lm_rready),
        .s_rdata(aa_intf.axi_ls_rdata),
        .s_rvalid(aa_intf.axi_ls_rvalid),
        .s_awready(aa_intf.axi_ls_awready),
        .s_wready(aa_intf.axi_ls_wready),
        .s_arready(aa_intf.axi_ls_arready),
        .s_awvalid(aa_intf.axi_ls_awvalid),
        .s_awaddr(aa_intf.axi_ls_awaddr),
        .s_wvalid(aa_intf.axi_ls_wvalid),
        .s_wdata(aa_intf.axi_ls_wdata),
        .s_wstrb(aa_intf.axi_ls_wstrb),
        .s_arvalid(aa_intf.axi_ls_arvalid),
        .s_araddr(aa_intf.axi_ls_araddr),
        .s_rready(aa_intf.axi_ls_rready),
        .m_rdata(aa_intf.axi_lm_rdata),
        .m_rvalid(aa_intf.axi_lm_rvalid),
        .m_awready(aa_intf.axi_lm_awready),
        .m_wready(aa_intf.axi_lm_wready),
        .m_arready(aa_intf.axi_lm_arready),
        .cc_aa_enable(aa_intf.cc_aa_enable), // ????????????????????????
        .as_aa_tdata(aa_intf.axis_ss_tdata),
        .as_aa_tstrb(aa_intf.axis_ss_tstrb),
        .as_aa_tkeep(aa_intf.axis_ss_tkeep),
        .as_aa_tlast(aa_intf.axis_ss_tlast),
        .as_aa_tvalid(aa_intf.axis_ss_tvalid),
        .as_aa_tuser(aa_intf.axis_ss_tuser),
        .aa_as_tready(aa_intf.axis_ss_tready),
        .aa_as_tdata(aa_intf.axis_sm_tdata),
        .aa_as_tstrb(aa_intf.axis_sm_tstrb),
        .aa_as_tkeep(aa_intf.axis_sm_tkeep),
        .aa_as_tlast(aa_intf.axis_sm_tlast),
        .aa_as_tvalid(aa_intf.axis_sm_tvalid),
        .aa_as_tuser(aa_intf.axis_sm_tuser),
        .as_aa_tready(aa_intf.axis_sm_tready),
        .mb_irq(aa_intf.axi_interrupt),// ????????????????????????
        .axi_clk(aa_intf.axi_lm_aclk),
        .axi_reset_n(aa_intf.axi_lm_aresetn),
        .axis_clk(aa_intf.axi_lm_aclk),
        .axis_rst_n(aa_intf.axi_lm_aresetn)
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

    assign aa_intf.axi_lm_aclk = clk;
    assign aa_intf.axi_lm_aresetn = rst;
    assign aa_intf.axi_ls_aclk = clk;
    assign aa_intf.axi_ls_aresetn = rst;
    assign aa_intf.axi_sm_aclk = clk;
    assign aa_intf.axi_sm_aresetn = rst;
    assign aa_intf.axi_ss_aclk = clk;
    assign aa_intf.axi_ss_aresetn = rst;

    // used in driver
    assign aa_intf.bk_ss_valid = top.axil_axis.bk_ss_valid;

    // used in monitor
    assign aa_intf.bk_lm_rdata = top.axil_axis.bk_lm_rdata;
    assign aa_intf.bk_sm_start = top.axil_axis.bk_sm_start;

    initial begin
        $dumpfile("axil_axis.vcd");
        $dumpvars(0, top);
        $dumpvars(0, top.testcase);
    end

    initial begin
        #(200000ns) $finish();
    end
endmodule
