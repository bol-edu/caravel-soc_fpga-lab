///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axil_axis_scoreboard
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/07/08
///////////////////////////////////////////////////////////////////////////////

class axil_axis_scoreboard;
    virtual axil_axis_interface.connect intf;
    aa_base_scenario scnr_scrbd[2];
    mb_axi mb_scrbd[2];
    static int succ_cnt, fail_cnt;

    function new(virtual axil_axis_interface.connect intf, mb_axi mb_gen, mb_mon);
        this.intf = intf;
        this.mb_scrbd[0] = mb_gen;
        this.mb_scrbd[1] = mb_mon;
    endfunction

    virtual task compare_trans();
        fork
            // get trans, put in queue
            while(1)begin
                mb_scrbd[0].get(scnr_scrbd[0]);
                mb_scrbd[1].get(scnr_scrbd[1]);
                if(scnr_scrbd[0].compare(scnr_scrbd[1]))begin
                    $display($sformatf("%0t, trans %6d compare ok", $time(), scnr_scrbd[0].trans_id));
                    succ_cnt +=1;
                end
                else begin
                    $display($sformatf("[ERROR] %0t, trans %6d compare fail", $time(), scnr_scrbd[0].trans_id));
                    scnr_scrbd[0].display();
                    scnr_scrbd[1].display();
                    fail_cnt +=1;
                end
            end

            while(1)begin
                if((succ_cnt + fail_cnt) >= (aa_scenario_gen::PKT_NUM)) break;
                else begin
                    @(posedge intf.axi_ls_aclk);
                end
            end
        join_any
        disable fork;

    endtask

    virtual function void report();
        $display($sformatf("total trans %6d, success %6d, fail %6d", succ_cnt + fail_cnt, succ_cnt, fail_cnt));
    endfunction

endclass
