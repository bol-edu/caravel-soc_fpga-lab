///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axis_s_scenario
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/06/29
///////////////////////////////////////////////////////////////////////////////

parameter MAX_NO_RDY = 4;

class axis_s_scenario;
    int trans_id;
    static int trans_id_st;
    rand int stream_size;
    rand bit [31:0] data[$];
    rand bit [3:0] tstrb[$];
    rand bit [3:0] tkeep[$];
    rand bit [1:0] user[$];
    rand bit tlast[$];
    //rand bit [7:0] no_rdy_cnt;
    
    constraint length_of_stream{
        stream_size > 0;
        stream_size <= 30;
        //stream_size <= 5;
        stream_size dist {  [1:5]   := 80/*, 
                            [6:24]  := 10, 
                            [25:30] := 10*/};
        data.size == stream_size;
        tstrb.size == stream_size;
        tkeep.size == stream_size;
        user.size == stream_size;
        tlast.size == stream_size;
    }
    
    /*constraint no_rdy{
        no_rdy_cnt >= 0;
        (stream_size >= 5) -> (no_rdy_cnt <= stream_size - 2);
        no_rdy_cnt <= MAX_NO_RDY;
        solve stream_size before no_rdy_cnt;
    }*/
    
    //extern constraint rdy;
    
    function new();
        //this.randomize();
    endfunction

    virtual function void display(string prefix="");
        $display($sformatf("\ntrans_id %6d ========%s", trans_id, prefix));

        $display($sformatf("stream_size = %d", stream_size));
`ifdef DBG_MSG
        $display("data:");
        foreach(data[i])begin
            $write($sformatf("%8h ", data[i]));
            if(i > 0 && i % 5 == 4)
                $write("\n");
        end
        $write("\n");
        //if(stream_size % 5 != 0) display("\n");
        //display("\n");
`endif
        $display($sformatf("data[0]  = %h, data[$]  = %h", data[0], data[$]));
        $display($sformatf("tstrb[0] = %h, tstrb[$] = %h", tstrb[0], tstrb[$]));
        $display($sformatf("tkeep[0] = %h, tkeep[$] = %h", tkeep[0], tkeep[$]));
        $display($sformatf("user[0]  = %h, user[$]  = %h", user[0], user[$]));
        $display($sformatf("tlast[0] = %h, tlast[$] = %h", tlast[0], tlast[$]));
        //$display($sformatf("no_rdy_cnt = %0d", no_rdy_cnt));
        $display($sformatf("========================\n"));

    endfunction

    function void post_randomize();
        trans_id_st += 1;
        trans_id = trans_id_st;
    endfunction

    function bit compare(axis_s_scenario tr_cmp);
        int err_cnt;

        err_cnt = 0;
        if(this.data !== tr_cmp.data) err_cnt += 1;
        if(this.tstrb !== tr_cmp.tstrb) err_cnt += 1;
        if(this.tkeep !== tr_cmp.tkeep) err_cnt += 1;
        if(this.user !== tr_cmp.user) err_cnt += 1;
        if(this.tlast !== tr_cmp.tlast) err_cnt += 1;

        if(err_cnt != 0) return 0;
        else return 1;
    endfunction
endclass

typedef mailbox #(axis_s_scenario) mb_axi;

class axis_s_scenario_gen;
    axis_s_scenario scnr;
    mb_axi mb_scnr[2];
    static int PKT_NUM;

    function new(mb_axi mb_scn2drvr, mb_scn2scrbd);
        this.mb_scnr[0] = mb_scn2drvr;
        this.mb_scnr[1] = mb_scn2scrbd;
    endfunction

   task gen();
        for(int i=0; i < PKT_NUM; i++)begin
            scnr = new();
            scnr.randomize();
            //scnr.display();
            mb_scnr[0].put(scnr);
            mb_scnr[1].put(scnr);
        end
    endtask
endclass
