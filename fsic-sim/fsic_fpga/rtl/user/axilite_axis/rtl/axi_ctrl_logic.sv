///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axi_ctrl_logic
//       AUTHOR: zack, Willy
// ORGANIZATION: fsic
//      CREATED: 2023/07/05
///////////////////////////////////////////////////////////////////////////////

module axi_ctrl_logic(
    input wire axi_aclk,
    input wire axi_aresetn,
    output logic axi_interrupt,

    // backend interface, axilite_master (LM)
    output logic bk_lm_wstart,
    output logic [31:0] bk_lm_waddr,
    output logic [31:0] bk_lm_wdata,
    output logic [3:0]  bk_lm_wstrb,
    input wire bk_lm_wdone,
    output logic bk_lm_rstart,
    output logic [31:0] bk_lm_raddr,
    input wire [31:0] bk_lm_rdata,
    input wire bk_lm_rdone,

    // backend interface, axilite_slave (LS)
    input wire bk_ls_rd_wr,
    input wire [14:0] bk_ls_addr,
    input wire [31:0] bk_ls_wdata,
    input wire [3:0]  bk_ls_wstrb,
    output logic [31:0] bk_ls_rdata,
    input wire bk_ls_valid,
    output logic bk_ls_ready,

    // backend interface, axis_master (SM)
    output logic [31:0] bk_sm_data,
    output logic [1:0] bk_sm_user,
    output logic bk_sm_valid,
    input wire bk_sm_ready,

    // backend interface, axis_slave (SS)
    input wire [31:0] bk_ss_data,
    input wire [1:0] bk_ss_user,
    output logic bk_ss_ready,
    input wire bk_ss_valid
);

    // FSM state
    enum logic [2:0] {AXI_WAIT_DATA, AXI_FETCH_DATA, AXI_DECIDE_DEST, AXI_MOVE_DATA, AXI_SEND_BKEND, AXI_TRIG_INT} axi_state, axi_next_state;
    enum logic {AXI_WR, AXI_RD} trans_typ;
    enum logic {TRANS_LS, TRANS_SS} next_trans, last_trans;
    enum logic [2:0] {REG_IDLE, REG_RST, REG_RD_AA, REG_WR_AA, REG_RD_MB, REG_WR_MB} axi_reg_debug; // for verification purpose, add a monitor point for registers
    enum logic [2:0] {SS_WAIT_GET_SECND, SS_SEND_BKRDY, SS_WAIT_BKVLD, SS_SECND_DATA} ss_secnd_state, ss_secnd_next_state;
    enum logic [2:0] {SM_WAIT_SEND_DATA, SM_SEND_BK_DATA, SM_SEND_DATA_DONE} sm_state, sm_next_state;

    // FSM state, sequential logic
    always_ff@(posedge axi_aclk or negedge axi_aresetn)begin
        if(~axi_aresetn)begin
            axi_state <= AXI_WAIT_DATA;
        end
        else begin
            axi_state <= axi_next_state;
        end
    end

    logic next_ls, next_ss, wr_mb, rd_mb, wr_aa, rd_aa, rd_unsupp, trig_sm_wr, trig_sm_rd, do_nothing, decide_done, trig_int, sync_trig_int, axi_interrupt_done, sync_trig_sm_wr, sync_trig_sm_rd, trig_lm_rd, send_bk_done, trig_lm_wr, sync_trig_lm_rd, rd_ss_complete;
    logic ls_rd_data_bk, ls_wr_data_done, get_next_data_ss, ss_wr_data_done;

    //Willy debug - s
    logic wait_rd_data_back;
    //Willy debug - e

    // FSM state, combinational logic
    always_comb begin
        axi_next_state = axi_state;
        case(axi_state)
            AXI_WAIT_DATA:
                if(bk_ls_valid || bk_ss_valid)begin
                    axi_next_state = AXI_FETCH_DATA;
                end
            AXI_FETCH_DATA: // one clock delay make sure data stable
                axi_next_state = AXI_DECIDE_DEST;
            AXI_DECIDE_DEST:
                if(decide_done)begin
                    axi_next_state = AXI_MOVE_DATA;
                end
                else if(trig_sm_wr || trig_sm_rd || trig_lm_wr || trig_lm_rd)begin
                    axi_next_state = AXI_SEND_BKEND;
                end
                else if(do_nothing)begin
                    axi_next_state = AXI_WAIT_DATA;
                end
            AXI_MOVE_DATA:
                if(ls_rd_data_bk || sync_trig_sm_wr)
                    axi_next_state = AXI_SEND_BKEND;
                else if(ss_wr_data_done && sync_trig_int)
                    axi_next_state = AXI_TRIG_INT;
                else if(ls_wr_data_done || ss_wr_data_done)
                    axi_next_state = AXI_WAIT_DATA;
            AXI_SEND_BKEND:
                if(send_bk_done)
                    axi_next_state = AXI_WAIT_DATA;
            AXI_TRIG_INT:
                if(axi_interrupt_done)
                    axi_next_state = AXI_WAIT_DATA;
            default:
                axi_next_state = AXI_WAIT_DATA;
        endcase
    end

    // assign trans_typ = bk_ls_rd_wr; // xsim do not allow this
    always_comb begin
        if(bk_ls_rd_wr == 1'b0) trans_typ = AXI_WR;
        else trans_typ = AXI_RD;
    end

    logic [31:0] first_ss_tdata;
    logic [1:0] first_ss_tuser;

    // get data from LS
    always_comb begin
   
        //Willy debug if((axi_state != AXI_WAIT_DATA) && (axi_next_state == AXI_WAIT_DATA) && (next_trans == TRANS_LS))begin // can send next data
        if((axi_state != AXI_WAIT_DATA) && (axi_next_state == AXI_WAIT_DATA) && (next_trans == TRANS_LS) && trans_typ == AXI_WR)begin // can send next data
            bk_ls_ready = 1'b1;
        end
        
        //Willy debug - s
        else if((axi_state != AXI_WAIT_DATA) && (axi_next_state == AXI_WAIT_DATA) && (next_trans == TRANS_LS) && (trans_typ == AXI_RD)) begin
            if (sync_trig_sm_rd == 1) begin
                bk_ls_ready = 1'b0;
                wait_rd_data_back = 1;
            end
            else begin
                bk_ls_ready = 1'b1;
            end
        end
        //Willy debug - e
        
        else if((axi_state != AXI_WAIT_DATA) && (axi_next_state == AXI_WAIT_DATA) && (next_trans == TRANS_SS) && first_ss_tuser == 2'b11)begin
            wait_rd_data_back = 0;
            bk_ls_ready = 1'b1;
        end            
        else
            bk_ls_ready = 1'b0;
    end

    // get first data from SS
    always_ff@(posedge axi_aclk or negedge axi_aresetn)begin
        if(~axi_aresetn)begin
            first_ss_tdata <= 32'b0;
            first_ss_tuser <= 2'b0;
        end
        else begin
            if(axi_next_state == AXI_FETCH_DATA)begin
                first_ss_tdata <= bk_ss_data;
                first_ss_tuser <= bk_ss_user;
            end
        end
    end

    // get second data from SS 
    // FSM state, sequential logic
    always_ff@(posedge axi_aclk or negedge axi_aresetn)begin
        if(~axi_aresetn)begin
            ss_secnd_state <= SS_WAIT_GET_SECND;
        end
        else begin
            ss_secnd_state <= ss_secnd_next_state;
        end
    end

    logic get_secnd_data_ss, secnd_data_ss_valid, secnd_data_done;
    logic [6:0] secnd_data_cnt;
    logic [31:0] secnd_data_ss;
    parameter AFTER_3_CLK = 7'h3;

    // FSM state, combinational logic, get second SS data if required
    always_comb begin
        ss_secnd_next_state = ss_secnd_state;

        case(ss_secnd_state)
            SS_WAIT_GET_SECND:
                if(get_secnd_data_ss)begin
                    ss_secnd_next_state = SS_SEND_BKRDY;
                end
            SS_SEND_BKRDY:
                ss_secnd_next_state = SS_WAIT_BKVLD;
            SS_WAIT_BKVLD:
                if(secnd_data_cnt >= AFTER_3_CLK && bk_ss_valid)
                    ss_secnd_next_state = SS_SECND_DATA;
            SS_SECND_DATA:
                if(secnd_data_done)
                    ss_secnd_next_state = SS_WAIT_GET_SECND;
            default:
                ss_secnd_next_state = SS_WAIT_GET_SECND;
        endcase
    end

    always_ff@(posedge axi_aclk or negedge axi_aresetn)begin
        if(~axi_aresetn)begin
            secnd_data_cnt <= 7'h0;
        end
        else begin
            if(ss_secnd_state == SS_WAIT_BKVLD)
                secnd_data_cnt <= secnd_data_cnt + 7'h1;
            else
                secnd_data_cnt <= 7'h0;
        end
    end

    logic set_bk_ss_ready;
    // FSM state, latch logic, output control
    always_latch begin
        case(ss_secnd_state)
            SS_WAIT_GET_SECND:begin
                secnd_data_ss_valid = 1'b0;
                set_bk_ss_ready = 1'b0;
            end
            SS_SEND_BKRDY:
                set_bk_ss_ready = 1'b1;
            SS_WAIT_BKVLD:
                set_bk_ss_ready = 1'b0;
            SS_SECND_DATA: begin
                secnd_data_ss = bk_ss_data;
                secnd_data_ss_valid = 1'b1;
            end
            //default:
        endcase
    end

    always_comb begin
        if((axi_state != AXI_WAIT_DATA) && (axi_next_state == AXI_WAIT_DATA) && (next_trans == TRANS_SS))begin
            bk_ss_ready = 1'b1;
        end
        else if(set_bk_ss_ready)begin // if tuser in SS is 1, AXI_WR need next trans data
            bk_ss_ready = 1'b1;
        end
        else
            bk_ss_ready = 1'b0;
    end

    // send data to SM
    // FSM state, sequential logic
    always_ff@(posedge axi_aclk or negedge axi_aresetn)begin
        if(~axi_aresetn)begin
            sm_state <= SM_WAIT_SEND_DATA;
        end
        else begin
            sm_state <= sm_next_state;
        end
    end

    logic sm_send_data;
    // FSM state, combinational logic, send data to SM
    always_comb begin
        sm_next_state = sm_state;

        case(sm_state)
            SM_WAIT_SEND_DATA:
                if(sm_send_data)
                    sm_next_state = SM_SEND_BK_DATA;
            SM_SEND_BK_DATA:
                if(bk_sm_ready)
                    sm_next_state = SM_SEND_DATA_DONE;
            SM_SEND_DATA_DONE:
                sm_next_state = SM_WAIT_SEND_DATA;
            default:
                sm_next_state = SM_WAIT_SEND_DATA;
        endcase
    end

    // FSM state, latch logic, output control
    always_latch begin
        case(sm_state)
            SM_WAIT_SEND_DATA:
                bk_sm_valid = 1'b0;
            SM_SEND_BK_DATA:
                bk_sm_valid = 1'b1;
            SM_SEND_DATA_DONE:
                bk_sm_valid = 1'b0;
            //default:
        endcase
    end

    logic [3:0] sm_data_cnt;
    always_ff@(posedge axi_aclk or negedge axi_aresetn)begin
        if(~axi_aresetn)begin
            sm_data_cnt <= 4'h0;
        end
        else begin
            if(axi_next_state == AXI_SEND_BKEND && bk_sm_ready)
                sm_data_cnt <= sm_data_cnt + 4'h1;
            else if(axi_next_state == AXI_WAIT_DATA)
                sm_data_cnt <= 4'h0;
        end
    end

    parameter MB_SUPP_LOW = 15'h2000, MB_SUPP_HIGH = 15'h201F;
    parameter AA_SUPP_LOW = 15'h2100, AA_SUPP_HIGH = 15'h2107, AA_UNSUPP_HIGH = 15'h2FFF;
    parameter FPGA_USER_WP_0 = 15'h0000, FPGA_USER_WP_1 = 15'h1FFF, FPGA_USER_WP_2 = 15'h3000, FPGA_USER_WP_3 = 15'h5FFF, CARAVEL_BASE= 32'h30000000;
    //assign decide_done = wr_mb | rd_mb | wr_aa | rd_aa | rd_unsupp | trig_sm_wr | trig_sm_rd;
    assign decide_done = wr_mb | rd_mb | wr_aa | rd_aa | rd_unsupp | rd_ss_complete;
    logic [3:0] wstrb_ss;
    logic [27:0] addr_ss;
    logic [31:0] data_ss;
    logic [1:0] lm_rd_cnt;
    logic lm_rd_bk_sent;
    // note: dw address access
    logic [9:0]aa_index; // for index of aa_regs 
    logic [9:0]mb_index; // for index of mb_regs 

    //assign next_trans = (next_ss) ? TRANS_SS : TRANS_LS; // iverilog issue
    always_comb begin
        if(next_ss == 1'b1)
            next_trans = TRANS_SS;
        else
            next_trans = TRANS_LS;
    end

    // compute control signals according to source (LS / SS) and address range
    // note this is combinational, so the signals can only exist when state is AXI_DECIDE_DEST, 
    // if the signal need to be used in two clock cycles after the state, have to make a register for it
//    always_comb begin
    always_latch begin
        //wr_mb = 1'b0;
        //rd_mb = 1'b0;
        //wr_aa = 1'b0;
        //rd_aa = 1'b0;
        //rd_unsupp = 1'b0;
        //trig_sm_wr = 1'b0;
        //trig_sm_rd = 1'b0;
        //do_nothing = 1'b0;
        //get_next_data_ss = 1'b0;
        //wstrb_ss = 4'b0;
        //addr_ss = 28'b0;
        //data_ss = 32'b0;
        //trig_int = 1'b0;
        //trig_lm_wr = 1'b0;
        //trig_lm_rd = 1'b0;
        //rd_ss_complete = 1'b0;
        //aa_index = 10'b0;
        //mb_index = 10'b0;

        //next_trans = (next_ss) ? TRANS_SS : TRANS_LS;

        if(axi_state == AXI_DECIDE_DEST)begin
            case(next_trans)
                TRANS_LS: begin // request come from left side - axilite_slave
                    case(trans_typ)
                        AXI_WR: begin
                            if( (bk_ls_addr >= MB_SUPP_LOW) &&
                                (bk_ls_addr <= MB_SUPP_HIGH))begin // local access MB_reg
                                wr_mb = 1'b1;
                                trig_sm_wr = 1'b1;
                                // compute related index for dw address
                                mb_index = bk_ls_addr[11:2] - MB_SUPP_LOW[11:2];
                            end
                            else if((bk_ls_addr >= AA_SUPP_LOW) &&
                                    (bk_ls_addr <= AA_SUPP_HIGH))begin // local access AA_reg
                                wr_aa = 1'b1;
                                // compute related index for dw address
                                aa_index = bk_ls_addr[11:2] - AA_SUPP_LOW[11:2];
                            end
                            else if((bk_ls_addr >= MB_SUPP_LOW) &&
                                    (bk_ls_addr <= AA_UNSUPP_HIGH))begin // in MB AA range but is unsupported, ignored
                                do_nothing = 1'b1;
                            end
                            else if(((bk_ls_addr >= FPGA_USER_WP_0) &&
                                     (bk_ls_addr <= FPGA_USER_WP_1)) ||
                                    ((bk_ls_addr >= FPGA_USER_WP_2) &&
                                     (bk_ls_addr <= FPGA_USER_WP_3)))begin // fpga side access caravel usesr project wrapper, this do not fire in caravel side
                                trig_sm_wr = 1'b1;
                            end
                            else
                                do_nothing = 1'b1;
                        end
                        AXI_RD: begin
                            if( (bk_ls_addr >= MB_SUPP_LOW) &&
                                (bk_ls_addr <= MB_SUPP_HIGH))begin // local access MB_reg
                                rd_mb = 1'b1;
                                // compute related index for dw address
                                mb_index = bk_ls_addr[11:2] - MB_SUPP_LOW[11:2];
                            end
                            else if((bk_ls_addr >= AA_SUPP_LOW) &&
                                    (bk_ls_addr <= AA_SUPP_HIGH))begin // local access AA_reg
                                rd_aa = 1'b1;
                                // compute related index for dw address
                                aa_index = bk_ls_addr[11:2] - AA_SUPP_LOW[11:2];
                            end
                            else if((bk_ls_addr >= MB_SUPP_LOW) &&
                                    (bk_ls_addr <= AA_UNSUPP_HIGH))begin // in MB AA range but is unsupported
                                rd_unsupp = 1'b1;
                            end
                            else if(((bk_ls_addr >= FPGA_USER_WP_0) &&
                                     (bk_ls_addr <= FPGA_USER_WP_1)) ||
                                    ((bk_ls_addr >= FPGA_USER_WP_2) &&
                                     (bk_ls_addr <= FPGA_USER_WP_3)))begin // fpga side access caravel usesr project wrapper, this do not fire in caravel side
                                trig_sm_rd = 1'b1;
                            end
                            else
                                //do_nothing = 1'b1;
                                // should not happen, return all 1 for unsupported address request.
                                // ex: AA support local AA + MB + remote caravel MMIO resource = 20K.
                                // but user define AA MMIO resource = 24K, and send 24-1K address to AA.
                                rd_unsupp = 1'b1;
                        end
                    endcase
                end
                TRANS_SS: begin // request come from right side - axis_slave
                    case(first_ss_tuser)
                        2'b01: begin // axis slave two-cycle data with tuser = 2'b01, can be converted to axilite write address / write data
                            get_secnd_data_ss = 1'b1;
                            secnd_data_done = 1'b0;

                            if(secnd_data_ss_valid)begin
                                wstrb_ss = first_ss_tdata[31:28];
                                addr_ss = first_ss_tdata[27:0];
                                data_ss = secnd_data_ss;
                                get_secnd_data_ss = 1'b0;

                                if( (addr_ss >= {13'b0, MB_SUPP_LOW}) &&
                                    (addr_ss <= {13'b0, MB_SUPP_HIGH}))begin // remote access MB_reg, write
                                    wr_mb = 1'b1;
                                    trig_int = 1'b1;
                                    // compute related index for dw address
                                    mb_index = addr_ss[11:2] - MB_SUPP_LOW[11:2];
                                end
                                else if((addr_ss >= {13'b0, FPGA_USER_WP_0}) &&
                                        (addr_ss <= {13'b0, FPGA_USER_WP_3}))begin
                                    trig_lm_wr = 1'b1;
                                end
                                else
                                    do_nothing = 1'b1; // ???????
                                secnd_data_done = 1'b1;
                            end
                        end
                        2'b10: begin // axis slave one-cycle data with tuser = 2'b10, can be converted to axilite read address
                            addr_ss = first_ss_tdata[27:0];
                            if((addr_ss >= {13'b0, FPGA_USER_WP_0}) &&
                               (addr_ss <= {13'b0, FPGA_USER_WP_3}))begin
                                    trig_lm_rd = 1'b1;
                                end
                            else
                                do_nothing = 1'b1;
                        end
                        2'b11: begin // read user project wrapper, data go back from CC through axis
                            data_ss = first_ss_tdata;
                            rd_ss_complete = 1'b1;
                        end
                        // default: do_nothing = 1'b1; // fix go do_nothing when tuser=0
                    endcase
                end
            endcase
        end
        else begin
            wr_mb = 1'b0;
            rd_mb = 1'b0;
            wr_aa = 1'b0;
            rd_aa = 1'b0;
            rd_unsupp = 1'b0;
            trig_sm_wr = 1'b0;
            trig_sm_rd = 1'b0;
            do_nothing = 1'b0;
            get_next_data_ss = 1'b0;
            wstrb_ss = 4'b0;
            addr_ss = 28'b0;
            data_ss = 32'b0;
            trig_int = 1'b0;
            trig_lm_wr = 1'b0;
            trig_lm_rd = 1'b0;
            rd_ss_complete = 1'b0;
            aa_index = 10'b0; // dw address
            mb_index = 10'b0; // dw address
            get_secnd_data_ss = 1'b0;
            secnd_data_done = 1'b0;
        end
    end

    // counter for trig_lm_rd
    always_ff@(posedge axi_aclk or negedge axi_aresetn)begin
        if(~axi_aresetn)begin
            lm_rd_cnt <= 2'b0;
        end
        else begin
            if((axi_next_state == AXI_SEND_BKEND) && (next_trans == TRANS_SS) &&
                (first_ss_tuser == 2'b10))
                lm_rd_cnt <= lm_rd_cnt + 2'b1;
            else
                lm_rd_cnt <= 2'b0;
        end
    end

    // sync signal for latter state
    always_ff@(posedge axi_aclk or negedge axi_aresetn)begin
        if(~axi_aresetn)begin
            //sync_rd_mb <= 1'b0;
            //sync_rd_aa <= 1'b0;
            //sync_rd_unsupp <= 1'b0;
            sync_trig_sm_wr <= 1'b0;
            sync_trig_sm_rd <= 1'b0;
            sync_trig_int <= 1'b0;
            //sync_trig_lm_wr
            sync_trig_lm_rd <= 1'b0;
        end
        else begin
            if(axi_state == AXI_WAIT_DATA)begin
                sync_trig_sm_wr <= 1'b0;
                sync_trig_sm_rd <= 1'b0;
                sync_trig_int <= 1'b0;
                sync_trig_lm_rd <= 1'b0;
            end
            else if(axi_state == AXI_DECIDE_DEST && axi_next_state != AXI_DECIDE_DEST)begin
                sync_trig_sm_wr <= trig_sm_wr;
                sync_trig_sm_rd <= trig_sm_rd;
                sync_trig_int <= trig_int;
                sync_trig_lm_rd <= trig_lm_rd;
            end
        end
    end

    //assign bk_sm_tstrb = 4'b0;
    //assign bk_sm_tkeep = 4'b0;

    logic [31:0] data_return;
    // registerName     offset Address
    // mb_reg_0[31:0]   'h0
    // mb_reg_1[31:0]   'h4
    // mb_reg_2[31:0]   'h8
    // mb_reg_3[31:0]   'hc
    // mb_reg_4[31:0]   'h10
    // mb_reg_5[31:0]   'h14
    // mb_reg_6[31:0]   'h18
    // mb_reg_7[31:0]   'h1c
    logic [31:0] mb_regs [7:0]; // 32bit * 8
    //--------------------------------------------------
    // for AA_REG description
    // offset 0-3 (32bit):
    // bit 0: Enable Interrupt
    // 0 = disable interrupt signal
    // 1 = enable interrupt signal
    // offset 4-7 (32bit):
    // bit 0: Interrupt Status
    // 0: interrupt has occurred
    // 0: no interrupt
    //--------------------------------------------------
    logic [31:0] aa_regs [1:0]; //32bit * 2
    logic mb_int_en;
    assign mb_int_en = aa_regs[0][0];
    logic have_sent_sm;

    // behavior description according to control signals and state
    always_ff@(posedge axi_aclk or negedge axi_aresetn)begin
        if(~axi_aresetn)begin
            //last_trans <= TRANS_LS; // ?????????????????
            last_trans <= TRANS_SS;
            //mb_regs <= '{32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0}; // fail
            //mb_regs <= '0; // fail
            //mb_regs <= '{default: '0}; // fail
            //mb_regs <= {$bits(mb_regs){1'b0}}; // fail
            mb_regs[0] <= 32'b0;
            mb_regs[1] <= 32'b0;
            mb_regs[2] <= 32'b0;
            mb_regs[3] <= 32'b0;
            mb_regs[4] <= 32'b0;
            mb_regs[5] <= 32'b0;
            mb_regs[6] <= 32'b0;
            mb_regs[7] <= 32'b0;
            //aa_regs <= '{32'h0, 32'h0};
            aa_regs[0] <= 32'b0;
            aa_regs[1] <= 32'b0;
            ls_rd_data_bk <= 1'b0;
            ls_wr_data_done <= 1'b0;
            next_ls <= 1'b0;
            next_ss <= 1'b0;
            ss_wr_data_done <= 1'b0;
            axi_interrupt_done <= 1'b0;
            bk_ls_rdata <= 32'b0;
            //bk_ls_rdone <= 1'b0;
            //bk_sm_valid <= 1'b0;
            bk_sm_data <= 32'b0;
            bk_sm_user <= 2'b0;
            send_bk_done <= 1'b0;
            bk_lm_wstart <= 1'b0;
            bk_lm_waddr <= 32'b0;
            bk_lm_wdata <= 32'b0;
            bk_lm_wstrb <= 4'b0;
            bk_lm_rstart <= 1'b0;
            bk_lm_raddr <= 32'b0;
            lm_rd_bk_sent <= 1'b0;
            data_return <= 32'b0;
            have_sent_sm <= 1'b0;
            axi_reg_debug <= REG_RST;
            sm_send_data <= 1'b0;
        end
        else begin
            if(axi_state == AXI_WAIT_DATA && axi_next_state == AXI_FETCH_DATA)begin
                // decide next transaction is LS / SS by round robin
                next_ls <= bk_ls_valid & (~bk_ss_valid | (last_trans == TRANS_SS));
                next_ss <= bk_ss_valid & (~bk_ls_valid | (last_trans == TRANS_LS));
            end

            if(axi_state == AXI_DECIDE_DEST && axi_next_state != AXI_DECIDE_DEST)
                last_trans <= next_trans;

            if(axi_next_state == AXI_WAIT_DATA)begin
                ls_rd_data_bk <= 1'b0;
                ls_wr_data_done <= 1'b0;
                axi_interrupt_done <= 1'b0;
                bk_ls_rdata <= 32'b0;
                //bk_ls_rdone <= 1'b0;
                //bk_sm_valid <= 1'b0;
                bk_sm_data <= 32'b0;
                bk_sm_user <= 2'b0;
                send_bk_done <= 1'b0;
                lm_rd_bk_sent <= 1'b0;
                bk_lm_wstart <= 1'b0;
                bk_lm_waddr <= 32'b0;
                bk_lm_wdata <= 32'b0;
                bk_lm_wstrb <= 4'b0;
                data_return <= 32'b0;
                have_sent_sm <= 1'b0;
                axi_reg_debug <= REG_IDLE;
            end
            else if(axi_next_state == AXI_MOVE_DATA)begin
                if(wr_mb)begin
                    // write MB_reg
                    case(next_trans)
                        TRANS_LS: begin
                            if(bk_ls_wstrb[0]) mb_regs[mb_index][7: 0] <= bk_ls_wdata[7:0];
                            if(bk_ls_wstrb[1]) mb_regs[mb_index][15:8] <= bk_ls_wdata[15:8];
                            if(bk_ls_wstrb[2]) mb_regs[mb_index][23:16] <= bk_ls_wdata[23:16];
                            if(bk_ls_wstrb[3]) mb_regs[mb_index][31:24] <= bk_ls_wdata[31:24];
                            ls_wr_data_done <= 1'b1;
                            axi_reg_debug <= REG_WR_MB;
                        end
                        TRANS_SS: begin
                            if(wstrb_ss[0]) mb_regs[mb_index][7: 0] <= data_ss[7:0];
                            if(wstrb_ss[1]) mb_regs[mb_index][15:8] <= data_ss[15:8];
                            if(wstrb_ss[2]) mb_regs[mb_index][23:16] <= data_ss[23:16];
                            if(wstrb_ss[3]) mb_regs[mb_index][31:24] <= data_ss[31:24];
                            ss_wr_data_done <= 1'b1;
                            axi_reg_debug <= REG_WR_MB;
                        end
                    endcase
                end
                else if(rd_mb)begin
                    // read MB_reg
                    case(next_trans)
                        TRANS_LS: begin
                            data_return <= mb_regs[mb_index];
                            ls_rd_data_bk <= 1'b1;
                            axi_reg_debug <= REG_RD_MB;
                        end
                        TRANS_SS: begin
                            // should not happen. remote MB/AA register read is not supported
                        end
                    endcase
                end
                else if(wr_aa)begin
                    // write AA_reg
                    case(next_trans)
                        TRANS_LS: begin
                            // offset 0
                            if(aa_index == 10'b0)begin
                                // bit 0 RW, other bits RO
                                if(bk_ls_wstrb[0]) aa_regs[aa_index][0] <= bk_ls_wdata[0];
                            end
                            // offset 4
                            else if(aa_index == 10'b1)begin
                                // bit 0 RW1C, other bits RO
                                if(bk_ls_wstrb[0]) aa_regs[aa_index][0] <= aa_regs[aa_index][0] & ~bk_ls_wdata[0];
                            end
                            // other offset registers, should not come here due to we only support aa_regs[1:0]
                            else begin
                                if(bk_ls_wstrb[0]) aa_regs[aa_index][7: 0] <= bk_ls_wdata[7:0];
                                if(bk_ls_wstrb[1]) aa_regs[aa_index][15:8] <= bk_ls_wdata[15:8];
                                if(bk_ls_wstrb[2]) aa_regs[aa_index][23:16] <= bk_ls_wdata[23:16];
                                if(bk_ls_wstrb[3]) aa_regs[aa_index][31:24] <= bk_ls_wdata[31:24];
                            end
                            ls_wr_data_done <= 1'b1;
                            axi_reg_debug <= REG_WR_AA;
                        end
                        TRANS_SS: begin // ?????????????
                            // should not happen. remote MB/AA register write is not supported
                            ss_wr_data_done <= 1'b1;
                        end
                    endcase
                end
                else if(rd_aa)begin
                    // read AA_reg
                    case(next_trans)
                        TRANS_LS: begin
                            data_return <= aa_regs[aa_index];
                            ls_rd_data_bk <= 1'b1;
                            axi_reg_debug <= REG_RD_AA;
                        end
                        TRANS_SS: begin
                            // should not happen. Remote MB/AA register read is not supported
                        end
                    endcase
                end
                else if(rd_unsupp)begin
                    // read MB_reg / AA_reg unsupported range
                    // Return 0xFFFFFFFF when the register is not supported
                    data_return <= 32'hFFFFFFFF;
                    case(next_trans)
                        TRANS_LS:
                            ls_rd_data_bk <= 1'b1;
                        //TRANS_SS:
                            // this path will not fire, because only wr_mb or fpga write caravel side can go through axis
                            //ss_rd_data_bk <= 1'b1;
                    endcase
                end
                else if(rd_ss_complete)begin
                    // read data from user project wrapper come back to fpga
                    case(next_trans)
                        //TRANS_LS: begin
                        //end
                        TRANS_SS: begin
                            data_return <= data_ss;
                            ls_rd_data_bk <= 1'b1;
                        end
                    endcase
                end
            end
            else if(axi_next_state == AXI_SEND_BKEND)begin

                if(sync_trig_sm_rd && ~have_sent_sm)begin
                    //Willy debug - s
                    if(wait_rd_data_back) begin
                        //Do nothing due to wait read data back, no need to trigger dummy sm cycle
                        send_bk_done <= 1;
                    end
                    //Willy debug - e
                    else begin
                        sm_send_data <= 1'b1;
                        bk_sm_data <= {17'b0, bk_ls_addr};
                        bk_sm_user <= 2'b10;                    
                    end
                
                    //send_bk_done <= 1'b1;
                    have_sent_sm <= 1'b1;
                end
                
                else if(ls_rd_data_bk)begin
                    bk_ls_rdata <= data_return;
                    //bk_ls_rdone <= 1'b1;
                    send_bk_done <= 1'b1;
                end
                else if((trig_sm_wr || sync_trig_sm_wr) && ~have_sent_sm)begin                    
                    if(sm_data_cnt == 2'b0)begin
                        sm_send_data <= 1'b1;
                        bk_sm_data <= {bk_ls_wstrb, 13'b0, bk_ls_addr};
                        bk_sm_user <= 2'b01;
                    end
                    else if(sm_data_cnt == 2'b1)begin
                        sm_send_data <= 1'b1;
                        bk_sm_data <= bk_ls_wdata;
                        bk_sm_user <= 2'b01;
                        //send_bk_done <= 1'b1;
                        have_sent_sm <= 1'b1;
                    end
                end
                else if(trig_lm_wr)begin
                    bk_lm_wstart <= 1'b1;
                    bk_lm_waddr <= {4'b0, addr_ss} + CARAVEL_BASE;
                    bk_lm_wdata <= data_ss;
                    bk_lm_wstrb <= wstrb_ss;
                    send_bk_done <= 1'b1;
                end
                else if(trig_lm_rd || sync_trig_lm_rd)begin
                    if(~lm_rd_bk_sent)begin
                        if(lm_rd_cnt == 2'b0)begin
                            bk_lm_rstart <= 1'b1;
                            bk_lm_raddr <= {4'b0, addr_ss} + CARAVEL_BASE;
                        end
                        else if(lm_rd_cnt == 2'b01)begin
                            bk_lm_rstart <= 1'b0;
                            bk_lm_raddr <= 32'b0;
                            lm_rd_bk_sent <= 1'b1;
                        end
                    end

                    if(bk_lm_rdone && ~have_sent_sm)begin // data return from config_ctrl axilite slave
                        // trigger axis master send data to fpga
                        sm_send_data <= 1'b1;
                        bk_sm_data <= bk_lm_rdata;
                        bk_sm_user <= 2'b11; // return data
                        //send_bk_done <= 1'b1;
                        have_sent_sm <= 1'b1;
                    end
                end
                if(have_sent_sm)begin
                    sm_send_data <= 1'b0;
                    if(bk_sm_ready) // wait SM send transaction
                        send_bk_done <= 1'b1;
                end
            end
            else if(axi_next_state == AXI_TRIG_INT)begin
                // set interrupt status even if mb_int_en is disabled
                // update interrupt status, offset 4 bit 0
                aa_regs[1][0] <= 1'b1;
                axi_interrupt_done <= 1'b1;
                axi_reg_debug <= REG_WR_AA;
            end
        end
    end

    // combinational logic for interrupt control
    always_comb begin
        if(aa_regs[0][0] && aa_regs[1][0]) begin
            axi_interrupt = 1'b1;
        end
        else begin
            axi_interrupt = 1'b0;
        end
    end

endmodule
