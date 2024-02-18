///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axis_axil_interface
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/07/08
///////////////////////////////////////////////////////////////////////////////

interface axil_axis_interface();
    logic axi_interrupt;

    ////////////////////////////// LM
    logic axi_lm_aclk;
    logic axi_lm_aresetn;
    logic axi_lm_awvalid;
    logic [31:0] axi_lm_awaddr;
    logic axi_lm_wvalid;
    logic [31:0] axi_lm_wdata;
    logic [3:0] axi_lm_wstrb;
    logic axi_lm_arvalid;
    logic [31:0] axi_lm_araddr;
    logic axi_lm_rready;
    logic [31:0] axi_lm_rdata;
    logic axi_lm_awready;
    logic axi_lm_wready;
    logic axi_lm_arready;
    logic axi_lm_rvalid;

    logic bk_lm_wstart;
    logic [31:0] bk_lm_waddr;
    logic [31:0] bk_lm_wdata;
    logic [3:0]  bk_lm_wstrb;
    logic bk_lm_wdone;
    logic bk_lm_rstart;
    logic [31:0] bk_lm_raddr;
    logic [31:0] bk_lm_rdata;
    logic bk_lm_rdone;

    ////////////////////////////// LS
    logic axi_ls_aclk;
    logic axi_ls_aresetn;
    logic axi_ls_awvalid;
    logic [14:0] axi_ls_awaddr;
    logic axi_ls_wvalid;
    logic [31:0] axi_ls_wdata;
    logic [3:0] axi_ls_wstrb;
    logic axi_ls_arvalid;
    logic [14:0] axi_ls_araddr;
    logic axi_ls_rready;
    logic [31:0] axi_ls_rdata;
    logic axi_ls_awready;
    logic axi_ls_wready;
    logic axi_ls_arready;
    logic axi_ls_rvalid;
    logic cc_aa_enable;

    logic bk_ls_wstart;
    logic [14:0] bk_ls_waddr;
    logic [31:0] bk_ls_wdata;
    logic [3:0]  bk_ls_wstrb;
    logic bk_ls_wdone;
    logic bk_ls_rstart;
    logic [14:0] bk_ls_raddr;
    logic [31:0] bk_ls_rdata;
    logic bk_ls_rdone;

    ////////////////////////////// SM
    logic axi_sm_aclk;
    logic axi_sm_aresetn;
    logic axis_sm_tvalid;
    logic [31:0] axis_sm_tdata;
    logic [3:0] axis_sm_tstrb;
    logic [3:0] axis_sm_tkeep;
    logic axis_sm_tlast;
    logic [1:0] axis_sm_tuser;
    logic axis_sm_tready;

    logic bk_sm_start;
    logic [31:0] bk_sm_data;
    logic [3:0] bk_sm_tstrb;
    logic [3:0] bk_sm_tkeep;
    logic [1:0] bk_sm_user;
    logic bk_sm_nordy;
    logic bk_sm_done;

    ////////////////////////////// SS
    logic axi_ss_aclk;
    logic axi_ss_aresetn;
    logic axis_ss_tvalid;
    logic [31:0] axis_ss_tdata;
    logic [3:0] axis_ss_tstrb;
    logic [3:0] axis_ss_tkeep;
    logic axis_ss_tlast;
    logic [1:0] axis_ss_tuser;
    logic axis_ss_tready;

    logic [31:0] bk_ss_data;
    logic [3:0] bk_ss_tstrb;
    logic [3:0] bk_ss_tkeep;
    logic [1:0] bk_ss_user;
    logic bk_ss_tlast;
    logic bk_ss_ready;
    logic bk_ss_valid;


    modport connect(
        input axi_interrupt,

        ////////////////////////////// LM
        input axi_lm_aclk,
        input axi_lm_aresetn,
        input axi_lm_awvalid,
        input axi_lm_awaddr,
        input axi_lm_wvalid,
        input axi_lm_wdata,
        input axi_lm_wstrb,
        input axi_lm_arvalid,
        input axi_lm_araddr,
        input axi_lm_rready,
        output axi_lm_rdata,
        output axi_lm_awready,
        output axi_lm_wready,
        output axi_lm_arready,
        output axi_lm_rvalid,

        output bk_lm_wstart,
        output bk_lm_waddr,
        output bk_lm_wdata,
        output bk_lm_wstrb,
        input bk_lm_wdone,
        output bk_lm_rstart,
        output bk_lm_raddr,
        input bk_lm_rdata,
        input bk_lm_rdone,

        ////////////////////////////// LS
        input axi_ls_aclk,
        input axi_ls_aresetn,
        input axi_ls_awready,
        input axi_ls_wready,
        input axi_ls_arready,
        input axi_ls_rvalid,
        input axi_ls_rdata,
        output axi_ls_awvalid,
        output axi_ls_awaddr,
        output axi_ls_wvalid,
        output axi_ls_wdata,
        output axi_ls_wstrb,
        output axi_ls_arvalid,
        output axi_ls_araddr,
        output axi_ls_rready,
        output cc_aa_enable,

        input bk_ls_wstart,
        input bk_ls_waddr,
        input bk_ls_wdata,
        input bk_ls_wstrb,
        output bk_ls_wdone,
        input bk_ls_rstart,
        input bk_ls_raddr,
        output bk_ls_rdata,
        output bk_ls_rdone,

        ////////////////////////////// SM
        input axi_sm_aclk,
        input axi_sm_aresetn,
        input axis_sm_tvalid,
        input axis_sm_tdata,
        input axis_sm_tstrb,
        input axis_sm_tkeep,
        input axis_sm_tlast,
        input axis_sm_tuser,
        output axis_sm_tready,

        output bk_sm_start,
        output bk_sm_data,
        output bk_sm_tstrb,
        output bk_sm_tkeep,
        output bk_sm_user,
        input bk_sm_nordy,
        input bk_sm_done,

        ////////////////////////////// SS
        input axi_ss_aclk,
        input axi_ss_aresetn,
        output axis_ss_tvalid,
        output axis_ss_tdata,
        output axis_ss_tstrb,
        output axis_ss_tkeep,
        output axis_ss_tlast,
        output axis_ss_tuser,
        input axis_ss_tready,

        input bk_ss_data,
        input bk_ss_tstrb,
        input bk_ss_tkeep,
        input bk_ss_user,
        input bk_ss_tlast,
        output bk_ss_ready,
        input bk_ss_valid
    );

endinterface
