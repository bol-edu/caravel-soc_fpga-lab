///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axil_axis_driver
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/07/08
///////////////////////////////////////////////////////////////////////////////

`define dut top.axil_axis
`define ctrl_logic top.axil_axis.axi_ctrl_logic
//event evt_wr_addr, evt_wr_data;

parameter BUS_DELAY = 1ns;

class axil_axis_driver;
    virtual axil_axis_interface.connect intf;
    aa_base_scenario scnr_drvr;
    mb_axi mb_drvr;
    aa_base_scenario axil_wr_q[$], axil_rd_q[$], axis_q[$], wr_tr, rd_tr, axis_tr;
    bit down, up;
    int empty_q_cnt;
    //static int no_rdy_trans, no_rdy_cnt;

    function new(virtual axil_axis_interface.connect intf, mb_axi mb_drvr);
        this.intf = intf;
        this.scnr_drvr = scnr_drvr;
        this.mb_drvr = mb_drvr;
    endfunction

    // https://stackoverflow.com/questions/75178240/systemverilog-dynamic-types-in-non-procedural-context-error
    // do not allow event to be waited if not static method
    virtual task static bus_op();
        bit [31:0] data;
        bit [3:0] tstrb;
        bit [3:0] tkeep;
        bit [1:0] user;
        bit tlast;
        int test_num;
        bit first;
        int nth_pkt;
        bit down, up;
        //event evt_wr_addr, evt_wr_data;
        semaphore key = new(1);
        empty_q_cnt = 0;

        init_bus();

        fork
            for(int i=0; i < aa_scenario_gen::PKT_NUM; i++)begin
                scnr_drvr = new();
                mb_drvr.get(scnr_drvr);
                scnr_drvr.display("drvr");
                if(scnr_drvr.axi_trans_typ == TRANS_AXIL)begin
                    if(scnr_drvr.axi_op == AXI_WR)begin
                        axil_wr_q.push_back(scnr_drvr);
                    end
                    else begin
                        axil_rd_q.push_back(scnr_drvr);
                    end
                end
                else if(scnr_drvr.axi_trans_typ == TRANS_AXIS)begin
                    axis_q.push_back(scnr_drvr);
                end
                if(scnr_drvr.trans_reorder_typ == ORDER_FIX_DONE)begin
                    $display("%0t, axil_wr_q.size()", $time(), axil_wr_q.size());
                    $display("%0t, axil_rd_q.size()", $time(), axil_rd_q.size());
                    $display("%0t, axis_q.size()", $time(), axis_q.size());
                    while(1)begin
                        @(posedge intf.axi_ls_aclk);
                        if(axil_wr_q.size() + axil_rd_q.size() + axis_q.size() <= 3)
                            break;
                    end
                    -> top.evt_002;
                    $display("%0t, axil_wr_q.size()", $time(), axil_wr_q.size());
                    $display("%0t, axil_rd_q.size()", $time(), axil_rd_q.size());
                    $display("%0t, axis_q.size()", $time(), axis_q.size());
                    $display("%0t, top.evt_002", $time());
                    if(scnr_drvr.axi_trans_typ == TRANS_AXIL)
                        if(scnr_drvr.axi_op == AXI_WR)
                            @(top.ls_wr_done);
                        else
                            @(top.ls_rd_done);
                    else
                        @(top.ss_done);
                    -> top.evt_003;
                end
                else if(scnr_drvr.trans_reorder_typ == ORDER_FIX_NO_DONE)begin
                    $display("%0t, axil_wr_q.size()", $time(), axil_wr_q.size());
                    $display("%0t, axil_rd_q.size()", $time(), axil_rd_q.size());
                    $display("%0t, axis_q.size()", $time(), axis_q.size());
                    while(1)begin
                        @(posedge intf.axi_ls_aclk);
                        if(axil_wr_q.size() + axil_rd_q.size() + axis_q.size() <= 3)
                            break;
                    end
                    -> top.evt_002;
                    $display("%0t, axil_wr_q.size()", $time(), axil_wr_q.size());
                    $display("%0t, axil_rd_q.size()", $time(), axil_rd_q.size());
                    $display("%0t, axis_q.size()", $time(), axis_q.size());
                    $display("%0t, top.evt_002", $time());
                    if(scnr_drvr.axi_trans_typ == TRANS_AXIL)
                        if(scnr_drvr.axi_op == AXI_WR)
                            @(top.ls_wr_done);
                        else begin
                            //@(top.ls_rd_done);
                        end
                    else
                        @(top.ss_done);
                    -> top.evt_003;
                end
            end
        join_none // put this to background

        fork
            // LS write
            while(1)begin
                if(axil_wr_q.size() != 0)begin
                    wr_tr = axil_wr_q.pop_front();
                    fork // write
                        begin // wr addr
                            @(posedge intf.axi_ls_aclk);
                            key.get(1);
                            intf.cc_aa_enable = 1;
                            intf.axi_ls_awaddr = wr_tr.wr_addr;
                            intf.axi_ls_awvalid = 1;
                            
                            while(1)begin
                                @(posedge intf.axi_ls_aclk);
                                if(intf.axi_ls_awready === 1'b1)begin
                                    #(BUS_DELAY);
                                    intf.axi_ls_awaddr = 0;
                                    intf.axi_ls_awvalid = 0;
                                    intf.cc_aa_enable = 0;
                                    key.put(1); // ????????????
                                    break;
                                end
                            end
                        end

                        begin // wr data
                            @(posedge intf.axi_ls_aclk);
                            intf.axi_ls_wdata = wr_tr.wr_data;
                            intf.axi_ls_wstrb = wr_tr.wr_strb;
                            intf.axi_ls_wvalid = 1;
                            
                            while(1)begin
                                @(posedge intf.axi_ls_aclk);
                                if(intf.axi_ls_wready === 1'b1)begin
                                    #(BUS_DELAY);
                                    intf.axi_ls_wdata = 0;
                                    intf.axi_ls_wstrb = 0;
                                    intf.axi_ls_wvalid = 0;
                                    break;
                                end
                            end
                        end
                    join

                    repeat($urandom_range(5)) @(posedge intf.axi_ls_aclk);
                    -> top.ls_wr_done;
                end
                else begin
                    @(posedge intf.axi_ls_aclk);
                end
            end

            // LS read
            while(1)begin
                if(axil_rd_q.size() != 0)begin
                    rd_tr = axil_rd_q.pop_front();
                    fork // read
                        begin // rd addr
                            //-> top.evt_001;
                            @(posedge intf.axi_ls_aclk);
                            key.get(1);
                            $display("%0t LS read get key", $time());
                            intf.cc_aa_enable = 1;
                            intf.axi_ls_araddr = rd_tr.rd_addr;
                            intf.axi_ls_arvalid = 1;
                            
                            while(1)begin
                                -> top.evt_001;
                                @(posedge intf.axi_ls_aclk);
                                if(intf.axi_ls_arready === 1'b1)begin
                                    #(BUS_DELAY);
                                    intf.axi_ls_araddr = 0;
                                    intf.axi_ls_arvalid = 0;
                                    intf.cc_aa_enable = 0;
                                    key.put(1); // ????????????
                            $display("%0t LS read put key", $time());
                                    break;
                                end
                            end
                        end

                        begin // rd ready
                            while(1)begin
                                -> top.evt_004;
                                @(posedge intf.axi_ls_aclk);
                                if(intf.axi_ls_rready == 0)begin
                                    #(BUS_DELAY);
                                    if($urandom_range(100) > 85)
                                        intf.axi_ls_rready = 1;
                                end
                                else if(intf.axi_ls_rready == 1)begin
                                    if(intf.axi_ls_rvalid === 1)begin
                                        #(BUS_DELAY);
                                        if($urandom_range(100) > 10)
                                            intf.axi_ls_rready = 0;
                                        break;
                                    end
                                end
                            end
                        end
                    join

                    repeat($urandom_range(5)) @(posedge intf.axi_ls_aclk);
                    -> top.ls_rd_done;
                end
                else begin
                    @(posedge intf.axi_ls_aclk);
                end
            end

            // SS
            while(1)begin
                if(axis_q.size() != 0)begin
                    axis_tr = axis_q.pop_front();
                    first = 1;
                    nth_pkt = 0;
                    fork: drive_packet
                        begin
                            while(1)begin
                                data = axis_tr.data[nth_pkt];
                                tstrb = axis_tr.tstrb[nth_pkt];
                                tkeep = axis_tr.tkeep[nth_pkt];
                                user = axis_tr.user[nth_pkt];
                                tlast = axis_tr.tlast[nth_pkt];

                                if(first)begin
                                    @(posedge intf.axi_ss_aclk);
                                    first = 0;
                                end

                                #(BUS_DELAY);
                                intf.axis_ss_tvalid = 1;
                                intf.axis_ss_tdata = data;
                                intf.axis_ss_tstrb = tstrb;
                                intf.axis_ss_tkeep = tkeep;
                                intf.axis_ss_tuser = user;
                                intf.axis_ss_tlast = tlast;

                                if(~first)begin
                                    @(posedge intf.axi_ss_aclk);
                                    if(intf.axis_ss_tready === 1)
                                        nth_pkt ++;
                                    if(nth_pkt == axis_tr.stream_size)
                                        break;
                                end
                            end

                            #(BUS_DELAY);
                            intf.axis_ss_tvalid = 0;
                            intf.axis_ss_tdata = 0;
                            intf.axis_ss_tstrb = 0;
                            intf.axis_ss_tkeep = 0;
                            intf.axis_ss_tuser = 0;
                            intf.axis_ss_tlast = 0;

                            wait(intf.bk_ss_valid === 0);
                            repeat($urandom_range(5)) @(posedge intf.axi_ss_aclk);
                            //disable drive_packet;
                        end

                        if( axis_tr.axi_path_typ == PATH_SS_LM &&
                            axis_tr.axi_op == AXI_RD &&
                            axis_tr.supp_addr == SUPP_ADDR_YES)begin // expect data come back from CC, in TB env driver should implement this
                            //-> top.evt_001;
                            wait(intf.axi_lm_arvalid === 1);
                            while(1)begin
                                @(posedge intf.axi_lm_aclk);

                                // read data
                                if(intf.axi_lm_rvalid === 1'b1)begin
                                    if(intf.axi_lm_rready === 1'b0)begin
                                        // wait ready high
                                    end
                                    else begin // both 1
                                        #(BUS_DELAY);
                                        intf.axi_lm_rvalid = 1'b0;
                                        intf.axi_lm_rdata = 32'hx;
                                        break;
                                    end
                                end
                                else if(intf.axi_lm_rvalid === 1'b0)begin
                                    #(BUS_DELAY);
                                    intf.axi_lm_rvalid = 1'b1;
                                    intf.axi_lm_rdata = axis_tr.rd_data;
                                end
                            end
                        end
                    join
                    -> top.ss_done;
                end
                else begin
                    @(posedge intf.axi_ls_aclk);
                end
            end

            // LM write addr
            while(1)begin
                @(posedge intf.axi_lm_aclk);

                if(intf.axi_lm_awvalid === 1'b1)begin
                    if(intf.axi_lm_awready === 1'b0)begin
                        #(BUS_DELAY);
                        intf.axi_lm_awready = 1'b1;
                    end
                    else begin // both 1
                        #(BUS_DELAY);
                        intf.axi_lm_awready = 1'b0;
                    end
                end
            end

            // LM write data
            while(1)begin
                @(posedge intf.axi_lm_aclk);

                if(intf.axi_lm_wvalid === 1'b1)begin
                    if(intf.axi_lm_wready === 1'b0)begin
                        #(BUS_DELAY);
                        intf.axi_lm_wready = 1'b1;
                    end
                    else begin // both 1
                        #(BUS_DELAY);
                        intf.axi_lm_wready = 1'b0;
                    end
                end
            end

            // LM read addr
            while(1)begin
                @(posedge intf.axi_lm_aclk);

                if(intf.axi_lm_arvalid === 1'b1)begin
                    if(intf.axi_lm_arready === 1'b0)begin
                        #(BUS_DELAY);
                        intf.axi_lm_arready = 1'b1;
                    end
                    else begin // both 1
                        #(BUS_DELAY);
                        intf.axi_lm_arready = 1'b0;
                    end
                end
            end

            // SM
            while(1)begin
                top.no_rdy_trans = 1;
                top.no_rdy_cnt = 0;

                fork: drive_sm_ready
                    while(1)begin
                        @(posedge intf.axi_sm_aclk);

                        // output axis_sm_tready
                        if(intf.axis_sm_tvalid === 1'b1)begin
                            if(intf.axis_sm_tready === 1'b0)begin
                                #(BUS_DELAY);
                                up = $urandom_range(1);
                                top.no_rdy_cnt ++;
                                if(top.no_rdy_cnt < top.no_rdy_trans)begin
                                    if(up)
                                        intf.axis_sm_tready = 1'b1;
                                end
                                else
                                    intf.axis_sm_tready = 1'b1;
                            end
                            else begin // both 1
                                //-> top.evt_005;
                                #(BUS_DELAY);
                                down = $urandom_range(1);
                                if(top.no_rdy_cnt < top.no_rdy_trans)begin
                                    if(down)
                                        intf.axis_sm_tready = 1'b0;
                                end
                            end
                        end
                    end

                    while(1)begin
                        @(posedge intf.axi_sm_aclk);
                        if(`dut.sm.bk_done === 1)begin
                            wait(`dut.sm.bk_done === 0);
                            disable drive_sm_ready;
                        end
                        //break;
                    end
                join
            end

            while(1)begin
                @(posedge intf.axi_ls_aclk);
                if((axil_wr_q.size() + axil_rd_q.size() + axis_q.size()) == 0)begin
                    empty_q_cnt ++;
                    if(empty_q_cnt > 80)begin
                        -> top.evt_005;
                        break;
                    end
                end
                else begin
                    empty_q_cnt = 0;
                end
            end
        join_any
        disable fork;
    endtask

    virtual task init_bus();
        // LM
        intf.axi_lm_rdata = 0;
        intf.axi_lm_awready = 0;
        intf.axi_lm_wready = 0;
        intf.axi_lm_arready = 0;
        intf.axi_lm_rvalid = 0;

        // LS
        intf.axi_ls_awvalid = 0;
        intf.axi_ls_awaddr = 0;
        intf.axi_ls_wvalid = 0;
        intf.axi_ls_wdata = 0;
        intf.axi_ls_wstrb = 0;
        intf.axi_ls_arvalid = 0;
        intf.axi_ls_araddr = 0;
        intf.axi_ls_rready = 0;
        intf.cc_aa_enable = 0;

        // SM
        intf.axis_sm_tready = 0;

        // SS
        intf.axis_ss_tvalid = 0;
        intf.axis_ss_tdata = 0;
        intf.axis_ss_tstrb = 0;
        intf.axis_ss_tkeep = 0;
        intf.axis_ss_tlast = 0;
        intf.axis_ss_tuser = 0;

        wait(intf.axi_ls_aresetn == 1);
    endtask
endclass
