///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axis_master
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/06/16
///////////////////////////////////////////////////////////////////////////////

module axis_master(
    // backend source to trigger the axis master transaction
    input wire [31:0] bk_data,
    input wire [1:0] bk_user,
    input wire bk_valid,
    output logic bk_ready,

    // frontend - axis master
    input wire axi_aclk,
    input wire axi_aresetn,
    output logic axis_tvalid,
    output logic [31:0] axis_tdata,
    output logic [3:0] axis_tstrb,
    output logic [3:0] axis_tkeep,
    output logic axis_tlast,
    output logic [1:0] axis_tuser,
    input wire axis_tready
);

    // backend interface
    // aclk        _/-\_/-\_/-\_/-\_/-\_
    // bk_data     _____XXXXXXXXXXXXXX__
    // bk_user     _____XXXXXXXXXXXXXX__
    // bk_valid    _____/-------------\_
    // bk_ready    _________________/-\_

    // axis_tready _______________/-\___

    // FSM state
    enum logic [2:0] {AXIS_WAIT_BACKEND, AXIS_SEND_DATA, AXIS_SEND_BK_RDY} axis_state, axis_next_state;

    // FSM state, sequential logic
    always_ff@(posedge axi_aclk or negedge axi_aresetn)begin
        if(~axi_aresetn)begin
            axis_state <= AXIS_WAIT_BACKEND;
        end
        else begin
            axis_state <= axis_next_state;
        end
    end

    // FSM state, combinational logic
    always_comb begin
        axis_next_state = axis_state;

        case(axis_state)
            AXIS_WAIT_BACKEND:
                if(bk_valid)begin
                    axis_next_state = AXIS_SEND_DATA;
                end
            AXIS_SEND_DATA:
                if(axis_tready)begin
                    axis_next_state = AXIS_SEND_BK_RDY;
                end
            AXIS_SEND_BK_RDY:
                axis_next_state = AXIS_WAIT_BACKEND;
            default:
                axis_next_state = AXIS_WAIT_BACKEND;
        endcase
    end

    // FSM state, sequential logic, output control
    always_ff@(posedge axi_aclk or negedge axi_aresetn)begin
        if(~axi_aresetn)begin
            axis_tvalid <= 1'b0;
            axis_tdata <= 32'b0;
            axis_tuser <= 2'b0;
        end
        else begin
            case(axis_next_state)
                //AXIS_WAIT_BACKEND: // do nothing
                AXIS_SEND_DATA: begin
                    axis_tvalid <= 1'b1;
                    axis_tdata <= bk_data;
                    axis_tuser <= bk_user;
                end
                AXIS_SEND_BK_RDY:
                    axis_tvalid <= 1'b0;
            endcase
        end
    end

    assign axis_tstrb = 4'b0;
    assign axis_tkeep = 4'b0;
    assign axis_tlast = 1'b1;

    // FSM state, latch logic, output control
    always_latch begin
        case(axis_state)
            AXIS_WAIT_BACKEND:
                bk_ready = 1'b0;
            //AXIS_SEND_DATA: // do nothing
            AXIS_SEND_BK_RDY:
                bk_ready = 1'b1;
        endcase
    end

endmodule
