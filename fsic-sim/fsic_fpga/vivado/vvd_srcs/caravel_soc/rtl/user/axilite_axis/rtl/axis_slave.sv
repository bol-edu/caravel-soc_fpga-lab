///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axis_slave
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/06/29
///////////////////////////////////////////////////////////////////////////////

module axis_slave(
    // backend source to receive the axis slave transaction
    output logic [31:0] bk_data,
    output logic [1:0] bk_user,
    input wire bk_ready,
    output logic bk_valid,

    // frontend - axis slave
    input wire axi_aclk,
    input wire axi_aresetn,
    input wire axis_tvalid,
    input wire [31:0] axis_tdata,
    input wire [3:0] axis_tstrb,
    input wire [3:0] axis_tkeep,
    input wire axis_tlast,
    input wire [1:0] axis_tuser,
    output logic axis_tready
);

    // backend interface
    // aclk       _/-\_/-\_/-\_/-\_/-\_/-\_/-\_
    // bk_data    _____XXXXXXXXXXXX____XXXXXXXX
    // bk_user    _____XXXXXXXXXXXX____XXXXXXXX
    // bk_valid   _____/----------\____/-------
    // bk_ready   _____________/--\____________

    // FSM state
    enum logic [2:0] {AXIS_WAIT_FRONTEND, AXIS_WAIT_BACKEND, AXIS_SEND_TREADY} axis_state, axis_next_state;
    //logic sync_tvalid;

    // FSM state, sequential logic, axis
    always_ff@(posedge axi_aclk or negedge axi_aresetn)begin
        if(~axi_aresetn)begin
            axis_state <= AXIS_WAIT_FRONTEND;
        end
        else begin
            axis_state <= axis_next_state;
        end
    end

    // FSM state, combinational logic, axis
    always_comb begin
        axis_next_state = axis_state;

        case(axis_state)
            AXIS_WAIT_FRONTEND:
                //if(~bk_valid && sync_tvalid)begin
                if(~bk_valid && axis_tvalid)begin
                    axis_next_state = AXIS_WAIT_BACKEND;
                end
            AXIS_WAIT_BACKEND:
                if(bk_ready)begin
                    axis_next_state = AXIS_SEND_TREADY;
                end
            AXIS_SEND_TREADY:
                axis_next_state = AXIS_WAIT_FRONTEND;
            default:
                axis_next_state = AXIS_WAIT_BACKEND;
        endcase
    end

    // FSM state, sequential logic, output control
    always_ff@(posedge axi_aclk or negedge axi_aresetn)begin
        if(~axi_aresetn)begin
            bk_valid <= 1'b0;
            bk_data <= 32'b0;
            bk_user <= 2'b0;
        end
        else begin
            case(axis_next_state)
                //AXIS_WAIT_FRONTEND: // do nothing
                AXIS_WAIT_BACKEND:begin
                    bk_valid <= 1'b1;
                    bk_data <= axis_tdata;
                    bk_user <= axis_tuser;
                end
                AXIS_SEND_TREADY:begin
                    bk_valid <= 1'b0;
                end
            endcase
        end
    end

    // FSM state, latch logic, output control
    always_latch begin // experiment, test if not assigned signal keep the value before
        case(axis_state)
            AXIS_WAIT_FRONTEND: 
                axis_tready = 1'b0;
            //AXIS_WAIT_BACKEND:  // do nothing
            AXIS_SEND_TREADY:
                axis_tready = 1'b1;
            //default:
            //    axis_tready = 1'b0;
        endcase
    end

endmodule
