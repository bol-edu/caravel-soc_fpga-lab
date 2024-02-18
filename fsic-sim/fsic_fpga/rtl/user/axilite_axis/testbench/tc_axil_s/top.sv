`timescale 1ns/1ns

module top();
    event evt_wr_addr, evt_wr_data, evt_001, evt_002;

    axil_s_interface axi_intf();
    tc testcase(axi_intf);
    axilite_slave axil_s(
        .axi_aclk(axi_intf.axi_aclk),
        .axi_aresetn(axi_intf.axi_aresetn),
        .axi_awvalid(axi_intf.axi_awvalid),
        .axi_awaddr(axi_intf.axi_awaddr),
        .axi_wvalid(axi_intf.axi_wvalid),
        .axi_wdata(axi_intf.axi_wdata),
        .axi_wstrb(axi_intf.axi_wstrb),
        .axi_arvalid(axi_intf.axi_arvalid),
        .axi_araddr(axi_intf.axi_araddr),
        .axi_rready(axi_intf.axi_rready),
        .axi_rdata(axi_intf.axi_rdata),
        .axi_awready(axi_intf.axi_awready),
        .axi_wready(axi_intf.axi_wready),
        .axi_arready(axi_intf.axi_arready),
        .axi_rvalid(axi_intf.axi_rvalid),

        .bk_wstart(axi_intf.bk_wstart),
        .bk_waddr(axi_intf.bk_waddr),
        .bk_wdata(axi_intf.bk_wdata),
        .bk_wstrb(axi_intf.bk_wstrb),
//        .bk_wdone(axi_intf.bk_wdone),
        .bk_rstart(axi_intf.bk_rstart),
        .bk_raddr(axi_intf.bk_raddr),
        .bk_rdata(axi_intf.bk_rdata),
        .bk_rdone(axi_intf.bk_rdone),

        .cc_aa_enable(axi_intf.cc_aa_enable) //Add cc_aa_enable
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

    assign axi_intf.axi_aclk = clk;
    assign axi_intf.axi_aresetn = rst;

    initial begin
        $dumpfile("axil_s.vcd");
        $dumpvars(0, top);
        $dumpvars(0, top.testcase);
    end

    initial begin
        #(200000ns) $finish();
    end
endmodule
