///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axil_m_interface
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/05/17
///////////////////////////////////////////////////////////////////////////////

interface axil_m_interface();
    logic axi_aclk;
    logic axi_aresetn;
    logic axi_awvalid;
    logic [11:0] axi_awaddr;
    logic axi_wvalid;
    logic [31:0] axi_wdata;
    logic [3:0] axi_wstrb;
    logic axi_arvalid;
    logic [11:0] axi_araddr;
    logic axi_rready;
    logic [31:0] axi_rdata;
    logic axi_awready;
    logic axi_wready;
    logic axi_arready;
    logic axi_rvalid;
    
    logic bk_wstart;
    logic [11:0] bk_waddr;
    logic [31:0] bk_wdata;
    logic [3:0]  bk_wstrb;
    logic bk_wdone;
    logic bk_rstart;
    logic [11:0] bk_raddr;
    logic [31:0] bk_rdata;
    logic bk_rdone;

    modport master(
        input axi_aclk,
        input axi_aresetn,
        output axi_awvalid,
        output axi_awaddr,
        output axi_wvalid,
        output axi_wdata,
        output axi_wstrb,
        output axi_arvalid,
        output axi_araddr,
        output axi_rready,
        input axi_rdata,
        input axi_awready,
        input axi_wready,
        input axi_arready,
        input axi_rvalid
    );

    modport slave(
        input axi_aclk,
        input axi_aresetn,
        input axi_awvalid,
        input axi_awaddr,
        input axi_wvalid,
        input axi_wdata,
        input axi_wstrb,
        input axi_arvalid,
        input axi_araddr,
        input axi_rready,
        output axi_rdata,
        output axi_awready,
        output axi_wready,
        output axi_arready,
        output axi_rvalid,

        output bk_wstart,
        output bk_waddr,
        output bk_wdata,
        output bk_wstrb,
        input bk_wdone,
        output bk_rstart,
        output bk_raddr,
        input bk_rdata,
        input bk_rdone
    );

endinterface
