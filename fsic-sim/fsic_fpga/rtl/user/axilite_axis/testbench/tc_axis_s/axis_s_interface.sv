///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axis_s_interface
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/06/29
///////////////////////////////////////////////////////////////////////////////

interface axis_s_interface();
    logic axi_aclk;
    logic axi_aresetn;
    logic axis_tvalid;
    logic [31:0] axis_tdata;
    logic [3:0] axis_tstrb;
    logic [3:0] axis_tkeep;
    logic axis_tlast;
    logic [1:0] axis_tuser;
    logic axis_tready;

    logic [31:0] bk_data;
    logic [3:0] bk_tstrb;
    logic [3:0] bk_tkeep;
    logic [1:0] bk_user;
    logic bk_tlast;
    logic bk_ready;
    logic bk_valid;

    modport master(
        input axi_aclk,
        input axi_aresetn,
        output axis_tvalid,
        output axis_tdata,
        output axis_tstrb,
        output axis_tkeep,
        output axis_tlast,
        output axis_tuser,
        input axis_tready,

        input bk_data,
        input bk_tstrb,
        input bk_tkeep,
        input bk_user,
        input bk_tlast,
        output bk_ready,
        input bk_valid
    );

    modport slave(
        input axi_aclk,
        input axi_aresetn,
        input axis_tvalid,
        input axis_tdata,
        input axis_tstrb,
        input axis_tkeep,
        input axis_tlast,
        input axis_tuser,
        output axis_tready
    );

endinterface
