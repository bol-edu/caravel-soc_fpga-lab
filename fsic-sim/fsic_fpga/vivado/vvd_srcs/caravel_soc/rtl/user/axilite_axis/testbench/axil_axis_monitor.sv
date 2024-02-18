///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axil_axis_monitor
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/07/08
///////////////////////////////////////////////////////////////////////////////

class axil_axis_monitor;
    virtual axil_axis_interface.connect intf;
    aa_base_scenario scnr_mon[3];
    mb_axi mb_mon;

    int packet_cnt = 0;

    function new(virtual axil_axis_interface.connect intf, mb_axi mb_mon);
        this.intf = intf;
        this.mb_mon = mb_mon;
    endfunction

    virtual task bus_mon();
        bit [31:0] wr_addr, rd_addr;
        bit [31:0] wr_data, rd_data;
        bit [3:0] wr_strb;
        int stream_size_tmp, stream_size_final, stream_size_q[$], stream_size_item; 
        bit [31:0] data[$];
        bit [3:0] tstrb[$];
        bit [3:0] tkeep[$];
        bit [1:0] tid[$];
        bit [1:0] user[$];
        int sm_largest_fifo_level, sm_fifo_write_cnt, sm_fifo_read_cnt, sm_tmp_fifo_level;
        int clls_largest_fifo_level, clls_fifo_write_cnt, clls_fifo_read_cnt, clls_tmp_fifo_level;
        int clss_largest_fifo_level, clss_fifo_write_cnt, clss_fifo_read_cnt, clss_tmp_fifo_level;
        logic [31:0] mb_regs_before [7:0];
        logic [31:0] mb_regs_after [7:0];
        logic [31:0] aa_regs_before [1:0];
        logic [31:0] aa_regs_after [1:0];
        typedef enum logic [2:0] {REG_IDLE, REG_RST, REG_RD_AA, REG_WR_AA, REG_RD_MB, REG_WR_MB} reg_dbg;
        reg_dbg mbreg_debug_old, mbreg_debug_new, aareg_debug_old, aareg_debug_new;

        wait_rst_done();

        fork
            while(1)begin // m1: LS rd data
                fork
                    while(1)begin
                        @(posedge intf.axi_ls_aclk);
                        //-> top.evt_002;

                        // rd addr
                        if(intf.axi_ls_arvalid === 1)begin
                            if(intf.axi_ls_arready === 1)begin
                                rd_addr = intf.axi_ls_araddr;
                                break;
                            end
                        end
                    end
                    while(1)begin
                        @(posedge intf.axi_ls_aclk);

                        // read data
                        if(intf.axi_ls_rvalid === 1'b1 && intf.axi_ls_rready === 1'b1)begin
                            //#(BUS_DELAY);
                            rd_data = intf.axi_ls_rdata;
                            break;
                        end
                    end
                join
                scnr_mon[1] = new();
                scnr_mon[1].rd_addr = rd_addr;
                scnr_mon[1].rd_data = rd_data;
                scnr_mon[1].axi_op = AXI_RD;
                scnr_mon[1].display("m1");
                mb_mon.put(scnr_mon[1]);
                packet_cnt +=1;
            end

            while(1)begin // m2: mb_reg ?????????
                @(posedge intf.axi_ls_aclk);
                case(`ctrl_logic.axi_reg_debug)
                    REG_IDLE, REG_RST, REG_RD_MB, REG_WR_MB: begin
                        mbreg_debug_new = reg_dbg'(`ctrl_logic.axi_reg_debug);
                        mb_regs_after = `ctrl_logic.mb_regs;
                    end
                endcase
                
                if(mbreg_debug_new != mbreg_debug_old)begin
                    foreach(mb_regs_before[i])begin
                        if(mb_regs_before[i] != mb_regs_after[i])begin
                            $display("%0t mb_regs[%0d] changed, before %8h, after %8h", $time(), i, mb_regs_before[i], mb_regs_after[i]);
                        end
                    end
                end
                mbreg_debug_old = mbreg_debug_new;
                mb_regs_before = mb_regs_after;

                //scnr_mon[1] = new();
                //scnr_mon[1].rd_addr = rd_addr;
                //scnr_mon[1].rd_data = rd_data;
                //scnr_mon[1].axi_op = AXI_RD;
                //scnr_mon[1].display("m2");
                //mb_mon.put(scnr_mon[1]);
                //packet_cnt +=1;
            end

            while(1)begin // m3: aa_reg ?????????
                @(posedge intf.axi_ls_aclk);
                case(`ctrl_logic.axi_reg_debug)
                    REG_IDLE, REG_RST, REG_RD_AA, REG_WR_AA: begin
                        aareg_debug_new = reg_dbg'(`ctrl_logic.axi_reg_debug);
                        aa_regs_after = `ctrl_logic.aa_regs;
                    end
                endcase
                
                if(aareg_debug_new != aareg_debug_old)begin
                    foreach(aa_regs_before[i])begin
                        if(aa_regs_before[i] != aa_regs_after[i])begin
                            $display("%0t aa_regs[%0d] changed, before %8h, after %8h", $time(), i, aa_regs_before[i], aa_regs_after[i]);
                        end
                    end
                end
                aareg_debug_old = aareg_debug_new;
                aa_regs_before = aa_regs_after;

                //scnr_mon[1] = new();
                //scnr_mon[1].rd_addr = rd_addr;
                //scnr_mon[1].rd_data = rd_data;
                //scnr_mon[1].axi_op = AXI_RD;
                //scnr_mon[1].display("m2");
                //aa_mon.put(scnr_mon[1]);
                //packet_cnt +=1;
            end

            begin // m4: SM get stream size
                while(1)begin // get stream size from backend interface, push to queue
                    stream_size_tmp = 0;
                    wait(intf.bk_sm_start === 1);
                    while(1)begin
                        @(posedge intf.axi_sm_aclk);
                        //-> top.evt_001;
                        if(intf.bk_sm_start === 1)
                            stream_size_tmp ++;
                        else begin
                            stream_size_final = stream_size_tmp;
                            stream_size_q.push_back(stream_size_final);
                            //-> top.evt_002;
                            $display("%0t, stream_size_final = %0d", $time(), stream_size_final);
                            break;
                        end
                    end
                end
            end

            while(1)begin // m4: SM get data from frontend interface
                fork: get_data
                    while(1)begin // track every valid / ready handshake, push data to queue
                        @(posedge intf.axi_sm_aclk);
                        
                        if(intf.axis_sm_tvalid === 1'b1 && intf.axis_sm_tready === 1'b1)begin
                            //-> top.evt_get_data;
                            data.push_back(intf.axis_sm_tdata);
                            tstrb.push_back(intf.axis_sm_tstrb);
                            tkeep.push_back(intf.axis_sm_tkeep);
                            user.push_back(intf.axis_sm_tuser);
                        end
                    end
                    begin
                        while(1)begin // get stream size from queue
                            @(posedge intf.axi_sm_aclk);
                            if(stream_size_q.size() != 0)begin
                                stream_size_item = stream_size_q.pop_front();
                                break;
                            end
                        end
                            
                        while(1)begin // use stream size to get correct data
                            @(posedge intf.axi_sm_aclk);
                            
                            if(data.size() == stream_size_item)begin
                                //-> top.evt_get_data2;
                                scnr_mon[2] = new();
                                //scnr_mon[2].axi_trans_typ = TRANS_AXIL;
                                scnr_mon[2].axi_trans_typ = TRANS_AXIS;
                                case(user[0])
                                    2'b01: begin 
                                        scnr_mon[2].axi_op = AXI_WR;
                                    end
                                    2'b10: scnr_mon[2].axi_op = AXI_RD;
                                    2'b11: scnr_mon[2].axi_op = AXI_RET_DATA;
                                endcase
                                scnr_mon[2].axi_path_typ = PATH_LS_SM;
                                scnr_mon[2].data = data;
                                scnr_mon[2].tstrb = tstrb;
                                scnr_mon[2].tkeep = tkeep;
                                scnr_mon[2].user = user;
                                scnr_mon[2].stream_size = stream_size_item;
                                scnr_mon[2].display("m4");
                                mb_mon.put(scnr_mon[2]);
                                packet_cnt +=1;
                                
                                data = {}; // clear queue
                                tstrb = {};
                                tkeep = {};
                                tid = {};
                                user = {};
                                break;
                            end
                        end
                        disable get_data;
                    end
                join
            end

            begin // m4: SM track fifo
                sm_largest_fifo_level = 0;
                while(1)begin // record largest fifo depth used
                    @(posedge intf.axi_sm_aclk);
                    sm_fifo_write_cnt = `dut.sm.fifo.wr_count[7:0];
                    sm_fifo_read_cnt = `dut.sm.fifo.rd_count[7:0];
                    sm_tmp_fifo_level = sm_fifo_write_cnt - sm_fifo_read_cnt;
                    if(sm_tmp_fifo_level > sm_largest_fifo_level)begin
                        sm_largest_fifo_level = sm_tmp_fifo_level;
                        $display("%0t\tsm_largest_fifo_level is %0d", $time(), sm_largest_fifo_level);
                    end
                    if(sm_largest_fifo_level >= `dut.sm.AXI_FIFO_DEPTH - 1)begin
                        ////////////$display("%0t\t[ERROR] fifo water level in axis_master overflow, designed %0d, now %0d", $time(), `dut.sm.AXI_FIFO_DEPTH, sm_largest_fifo_level);
                    end
                    top.sm_largest_fifo_level = sm_largest_fifo_level;
                end
            end

            while(1)begin // m5: LM write
                while(1)begin
                    @(posedge intf.axi_lm_aclk);

                    // write addr
                    if(intf.axi_lm_awvalid === 1'b1 && intf.axi_lm_awready === 1'b1)begin
                        wr_addr = intf.axi_lm_awaddr;
                        break;
                    end
                end
                while(1)begin
                    @(posedge intf.axi_lm_aclk);
                    //-> top.evt_002;

                    // write data
                    if(intf.axi_lm_wvalid === 1'b1 && intf.axi_lm_wready === 1'b1)begin
                        wr_data = intf.axi_lm_wdata;
                        wr_strb = intf.axi_lm_wstrb;
                        break;
                    end
                end
                scnr_mon[0] = new();
                scnr_mon[0].axi_trans_typ = TRANS_AXIS;
                scnr_mon[0].axi_op = AXI_WR;
                scnr_mon[0].axi_path_typ = PATH_SS_LM;
                scnr_mon[0].wr_addr = wr_addr;
                scnr_mon[0].wr_data = wr_data;
                scnr_mon[0].wr_strb = wr_strb;
                scnr_mon[0].display("m5 wr");
                mb_mon.put(scnr_mon[0]);
                packet_cnt +=1;
            end

            while(1)begin // m5: LM read
                while(1)begin
                    @(posedge intf.axi_lm_aclk);

                    // read addr
                    if(intf.axi_lm_arvalid === 1'b1 && intf.axi_lm_arready === 1'b1)begin
                        rd_addr = intf.axi_lm_araddr;
                        break;
                    end
                end
                while(1)begin
                    @(posedge intf.axi_lm_aclk);

                    // read data
                    if(intf.axi_lm_rvalid === 1'b1 && intf.axi_lm_rready === 1'b1)begin
                        #(BUS_DELAY);
                        rd_data = intf.bk_lm_rdata;
                        break;
                    end
                end
                scnr_mon[1] = new();
                scnr_mon[1].axi_trans_typ = TRANS_AXIS;
                scnr_mon[1].axi_op = AXI_RD;
                scnr_mon[1].axi_path_typ = PATH_SS_LM;
                scnr_mon[1].rd_addr = rd_addr;
                scnr_mon[1].rd_data = rd_data;
                scnr_mon[1].display("m5 rd");
                mb_mon.put(scnr_mon[1]);
                packet_cnt +=1;
            end

            begin // m6: control_logic track fifo
                clls_largest_fifo_level = 0;
                clss_largest_fifo_level = 0;
                fork
                    while(1)begin // LS record largest fifo depth used
                        @(posedge intf.axi_ls_aclk);
                        clls_fifo_write_cnt = `ctrl_logic.fifo_ls.wr_count[7:0];
                        clls_fifo_read_cnt = `ctrl_logic.fifo_ls.rd_count[7:0];
                        clls_tmp_fifo_level = clls_fifo_write_cnt - clls_fifo_read_cnt;
                        if(clls_tmp_fifo_level > clls_largest_fifo_level)begin
                            clls_largest_fifo_level = clls_tmp_fifo_level;
                            $display("%0t\tclls_largest_fifo_level is %0d", $time(), clls_largest_fifo_level);
                        end
                        if(clls_largest_fifo_level >= `ctrl_logic.FIFO_LS_DEPTH - 1)begin
                            ////////////$display("%0t\t[ERROR] fifo_ls water level in control_logic overflow, designed %0d, now %0d", $time(), `ctrl_logic.FIFO_LS_DEPTH, clls_largest_fifo_level);
                        end
                        top.clls_largest_fifo_level = clls_largest_fifo_level;
                    end

                    while(1)begin // SS record largest fifo depth used
                        @(posedge intf.axi_ss_aclk);
                        clss_fifo_write_cnt = `ctrl_logic.fifo_ss.wr_count[7:0];
                        clss_fifo_read_cnt = `ctrl_logic.fifo_ss.rd_count[7:0];
                        clss_tmp_fifo_level = clss_fifo_write_cnt - clss_fifo_read_cnt;
                        if(clss_tmp_fifo_level > clss_largest_fifo_level)begin
                            clss_largest_fifo_level = clss_tmp_fifo_level;
                            $display("%0t\tclss_largest_fifo_level is %0d", $time(), clss_largest_fifo_level);
                        end
                        if(clss_largest_fifo_level >= `ctrl_logic.FIFO_SS_DEPTH - 1)begin
                            ////////////$display("%0t\t[ERROR] fifo_ss water level in control_logic overflow, designed %0d, now %0d", $time(), `ctrl_logic.FIFO_SS_DEPTH, clss_largest_fifo_level);
                        end
                        top.clss_largest_fifo_level = clss_largest_fifo_level;
                    end
                join
            end


            // to do interrupt ?????????

            while(1)begin
                @(posedge intf.axi_lm_aclk);
                if(packet_cnt >= aa_scenario_gen::PKT_NUM) break;
            end
        join_any
        disable fork;
    endtask
    
    virtual task wait_rst_done();
        wait(intf.axi_ls_aresetn == 1);
    endtask

endclass
