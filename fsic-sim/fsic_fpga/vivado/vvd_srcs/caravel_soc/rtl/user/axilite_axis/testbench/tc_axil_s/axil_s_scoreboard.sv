///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axil_s_scoreboard
//       AUTHOR: zack, Willy
// ORGANIZATION: fsic
//      CREATED: 2023/07/01
///////////////////////////////////////////////////////////////////////////////

class axil_s_scoreboard;
    virtual axil_s_interface.master intf;
    axil_s_scenario scnr_scrbd[2];
    mb_axi mb_scrbd[2];
    static int succ_cnt, fail_cnt;
    axil_s_scenario scn_wr_tr_q[$], scn_rd_tr_q[$], mon_wr_tr_q[$], mon_rd_tr_q[$], scn_wr_tr, scn_rd_tr, mon_wr_tr, mon_rd_tr;

    function new(virtual axil_s_interface.master intf, mb_axi mb_gen, mb_mon);
        this.intf = intf;
        this.mb_scrbd[0] = mb_gen;
        this.mb_scrbd[1] = mb_mon;
    endfunction

    virtual task compare_trans();
        fork
            // get trans, put in queue
            while(1)begin
                mb_scrbd[0].get(scnr_scrbd[0]);
                if(scnr_scrbd[0].axi_op == AXI_WR)begin
                    scn_wr_tr_q.push_back(scnr_scrbd[0]);
                end
                else
                    scn_rd_tr_q.push_back(scnr_scrbd[0]);
            end

            while(1)begin
                mb_scrbd[1].get(scnr_scrbd[1]);
                if(scnr_scrbd[1].axi_op == AXI_WR)begin
                    mon_wr_tr_q.push_back(scnr_scrbd[1]);
                end
                else
                    mon_rd_tr_q.push_back(scnr_scrbd[1]);
            end

            while(1)begin
                if((scn_wr_tr_q.size() != 0) && (mon_wr_tr_q.size() != 0))begin
                    scn_wr_tr = scn_wr_tr_q.pop_front();
                    mon_wr_tr = mon_wr_tr_q.pop_front();
                    if(scn_wr_tr.compare(mon_wr_tr))begin
                        $display($sformatf("trans %6d compare ok", scn_wr_tr.trans_id));
                        succ_cnt +=1;
                    end
                    else begin
                        $display($sformatf("[ERROR] %6t trans %6d compare fail", $time(), scn_wr_tr.trans_id));
                        scn_wr_tr.display();
                        mon_wr_tr.display();
                        fail_cnt +=1;
                    end
                end
                else begin
                    @(posedge intf.axi_aclk);
                end
            end

            while(1)begin
                if((scn_rd_tr_q.size() != 0) && (mon_rd_tr_q.size() != 0))begin
                    scn_rd_tr = scn_rd_tr_q.pop_front();
                    mon_rd_tr = mon_rd_tr_q.pop_front();
                    if(scn_rd_tr.compare(mon_rd_tr))begin
                        $display($sformatf("trans %6d compare ok", scn_rd_tr.trans_id));
                        succ_cnt +=1;
                    end
                    else begin
                        $display($sformatf("[ERROR] %6t trans %6d compare fail", $time(), scn_rd_tr.trans_id));
                        scn_rd_tr.display();
                        mon_rd_tr.display();
                        fail_cnt +=1;
                    end
                end
                else begin
                    @(posedge intf.axi_aclk);
                end
            end
         
            while(1)begin
                if((succ_cnt + fail_cnt) >= axil_s_scenario_gen::PKT_NUM) break;
                else begin
                    @(posedge intf.axi_aclk);
                end
            end
        join_any
        disable fork;
    endtask

    virtual function void report();
        $display($sformatf("total trans %6d, success %6d, fail %6d", succ_cnt + fail_cnt, succ_cnt, fail_cnt));
    endfunction

endclass
