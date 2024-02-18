///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axis_m_interface
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/06/19
///////////////////////////////////////////////////////////////////////////////

interface axis_m_interface();
    logic axi_aclk;
    logic axi_aresetn;
    logic axis_tvalid;
    logic [31:0] axis_tdata;
    logic [3:0] axis_tstrb;
    logic [3:0] axis_tkeep;
    logic axis_tlast;
    logic [1:0] axis_tuser;
    logic axis_tready;

    logic bk_start;
    logic [31:0] bk_data;
    logic [3:0] bk_tstrb;
    logic [3:0] bk_tkeep;
    logic [1:0] bk_user;
    logic bk_nordy;
    logic bk_done;

    modport master(
        input axi_aclk,
        input axi_aresetn,
        output axis_tvalid,
        output axis_tdata,
        output axis_tstrb,
        output axis_tkeep,
        output axis_tlast,
        output axis_tuser,
        input axis_tready
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
        output axis_tready,

        output bk_start,
        output bk_data,
        output bk_tstrb,
        output bk_tkeep,
        output bk_user,
        input bk_nordy,
        input bk_done
    );

endinterface
