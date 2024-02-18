///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axil_axis_scenario
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/07/08
///////////////////////////////////////////////////////////////////////////////

parameter MAX_NO_RDY = 4;
typedef enum bit [3:0] {TRANS_AXIL, TRANS_AXIS} axi_transaction_type;
typedef enum bit [3:0] {PATH_LS_AAREG, PATH_LS_MBREG, PATH_LS_SM, PATH_SS_MBREG, PATH_SS_AAREG, PATH_SS_LM, PATH_SS_LS} axi_path_type;
typedef enum bit [3:0] {AXI_WR, AXI_RD, AXI_RET_DATA} axi_operation;
typedef enum bit [3:0] {SUPP_ADDR_YES, SUPP_ADDR_NO} supported_addr;
typedef enum bit [3:0] {ALIGNED_YES, ALIGNED_NO} aligned_addr;
typedef enum bit [4:0] {TRSF_LS_SM_R_SS_LM_R_SS_LS_DATA, TRSF_LS_SM_W_SS_MB_W, TRSF_LS_SM_W_SS_LM_W, TRSF_LOCAL_RW_MB, TRSF_RW_AA, TRSF_OTHER} transfer_type;
typedef enum bit [3:0] {ORDER_FIX_DONE, ORDER_FIX_NO_DONE, ORDER_DYNAMIC} trans_reorder_type;

class aa_base_scenario;
    int trans_id;
    static int trans_id_st;
    static transfer_type transfer_typ;
    rand axi_transaction_type axi_trans_typ;
    rand axi_path_type axi_path_typ;
    rand axi_operation axi_op;
    rand supported_addr supp_addr;
    rand aligned_addr align_addr;
    rand trans_reorder_type trans_reorder_typ;

    // axilite slave (LS)
    rand bit [31:0] wr_addr;
    rand bit [31:0] wr_data;
    rand bit [3:0] wr_strb;
    
    rand bit [31:0] rd_addr;
    rand bit [31:0] rd_data;
    
    // axis slave (SS)
    rand int stream_size;
    rand bit [31:0] data[$];
    rand bit [3:0] tstrb[$];
    rand bit [3:0] tkeep[$];
    rand bit [1:0] user_value; // fix constraint solver fail
    rand bit [1:0] user[$];
    rand bit [7:0] no_rdy_cnt;
    rand bit tlast[$];


    constraint axi_trans{
        (axi_trans_typ == TRANS_AXIL) ->
            axi_path_typ dist {PATH_LS_AAREG:= 1, PATH_LS_MBREG:= 1, PATH_LS_SM:= 1};

        (axi_trans_typ == TRANS_AXIS) ->
            axi_path_typ dist {PATH_SS_MBREG:= 1, PATH_SS_AAREG:= 1, PATH_SS_LM:= 1, PATH_SS_LS:= 1};
        solve axi_trans_typ before axi_path_typ;
    }

    constraint length_of_stream{
        (axi_trans_typ == TRANS_AXIL) -> stream_size == 1;
        (axi_trans_typ == TRANS_AXIS) -> stream_size > 0;

        //user.size <= 10;
        if(axi_trans_typ == TRANS_AXIS){
            (user_value == 2'b01) -> stream_size == 2;
            (user_value == 2'b10 || user_value == 2'b11) -> stream_size == 1;
        }

        data.size == stream_size;
        tstrb.size == stream_size;
        tkeep.size == stream_size;
        user.size == stream_size;
        tlast.size == stream_size;
        solve axi_trans_typ before stream_size;
        solve user_value before stream_size;
    }

    constraint axi_addr{
        if(axi_path_typ == PATH_LS_AAREG){
            if(supp_addr == SUPP_ADDR_YES){
                wr_addr[14:0] inside { [15'h2100:15'h2107] };
                rd_addr[14:0] inside { [15'h2100:15'h2107] };
            }
            if(supp_addr == SUPP_ADDR_NO){
                wr_addr[14:0] inside { [15'h2108:15'h2FFF] };
                rd_addr[14:0] inside { [15'h2108:15'h2FFF] };
            }
        }
        if(axi_path_typ == PATH_LS_MBREG){
            if(supp_addr == SUPP_ADDR_YES){
                wr_addr[14:0] inside { [15'h2000:15'h201F] };
                rd_addr[14:0] inside { [15'h2000:15'h201F] };
            }
            if(supp_addr == SUPP_ADDR_NO){
                wr_addr[14:0] inside { [15'h2020:15'h20FF] };
                rd_addr[14:0] inside { [15'h2020:15'h20FF] };
            }
        }
        if(axi_path_typ == PATH_LS_SM){
            if(supp_addr == SUPP_ADDR_YES){
                wr_addr[14:0] inside { [15'h0000:15'h1FFF], [15'h3000:15'h5FFF] };
                rd_addr[14:0] inside { [15'h0000:15'h1FFF], [15'h3000:15'h5FFF] };
            }
            if(supp_addr == SUPP_ADDR_NO){
                wr_addr[14:0] inside { [15'h6000:15'h7FFF] };
                rd_addr[14:0] inside { [15'h6000:15'h7FFF] };
            }
        }
        solve axi_trans_typ before wr_addr;
        solve axi_trans_typ before rd_addr;
        solve supp_addr before wr_addr;
        solve supp_addr before rd_addr;
    }

    constraint stream_data{
        if(axi_path_typ == PATH_SS_MBREG){
            if(supp_addr == SUPP_ADDR_YES){
                (user_value == 2'b01) -> data[0][27:0] inside { [28'h2000:28'h201F] };
                (user_value == 2'b10) -> data[0][27:0] inside { [28'h2000:28'h201F] };
            }
            if(supp_addr == SUPP_ADDR_NO){
                (user_value == 2'b01) -> data[0][27:0] inside { [28'h2020:28'h20FF] };
                (user_value == 2'b10) -> data[0][27:0] inside { [28'h2020:28'h20FF] };
            }
        }
        if(axi_path_typ == PATH_SS_AAREG){
            if(supp_addr == SUPP_ADDR_YES){
                (user_value == 2'b01) -> data[0][27:0] inside { [28'h2100:28'h2107] };
                (user_value == 2'b10) -> data[0][27:0] inside { [28'h2100:28'h2107] };
            }
            if(supp_addr == SUPP_ADDR_NO){
                (user_value == 2'b01) -> data[0][27:0] inside { [28'h2100:28'h2FFF] };
                (user_value == 2'b10) -> data[0][27:0] inside { [28'h2100:28'h2FFF] };
            }
        }
        if(axi_path_typ == PATH_SS_LM){
            if(supp_addr == SUPP_ADDR_YES){
                (user_value == 2'b01) -> data[0][27:0] inside { [28'h0000:28'h1FFF], [28'h3000:28'h5FFF] };
                (user_value == 2'b10) -> data[0][27:0] inside { [28'h0000:28'h1FFF], [28'h3000:28'h5FFF] };
            }
            if(supp_addr == SUPP_ADDR_NO){
                (user_value == 2'b01) -> data[0][27:0] inside { [28'h5000:28'hFFFFFFF] };
                (user_value == 2'b10) -> data[0][27:0] inside { [28'h5000:28'hFFFFFFF] };
            }
        }
        solve user before data;
    }

    constraint alignment_of_addr{
        align_addr dist {ALIGNED_YES:= 1, ALIGNED_NO:= 1};

        if(axi_trans_typ == TRANS_AXIL){
            if(align_addr == ALIGNED_YES){
                wr_addr % 4 == 0;
                rd_addr % 4 == 0;
            }
            if(align_addr == ALIGNED_NO){
                wr_addr % 4 != 0;
                rd_addr % 4 != 0;
            }
        }
        if(axi_trans_typ == TRANS_AXIS){
            if(align_addr == ALIGNED_YES){
                data[0] % 4 == 0;
            }
            if(align_addr == ALIGNED_NO){
                data[0] % 4 != 0;
            }
        }
        solve align_addr before wr_addr;
        solve align_addr before rd_addr;
        solve align_addr before data[0];
    }

    constraint order{
        soft trans_reorder_typ == ORDER_DYNAMIC; // default reorder is enabled, by using soft constraint
    }

    extern constraint rdy;

    virtual function void display(string prefix="");
        $display($sformatf("\ntrans_id %6d ========%s", trans_id, prefix));

        $display($sformatf("transfer_typ = %s", transfer_typ.name()));
        $display($sformatf("trans_reorder_typ = %s", trans_reorder_typ.name()));
        $display($sformatf("axi_trans_typ = %s", axi_trans_typ.name()));
        $display($sformatf("axi_op       = %s", axi_op.name()));
        //$display($sformatf("axi_path_typ = %p", axi_path_typ));
        $display($sformatf("axi_path_typ = %s", axi_path_typ.name()));
        //$display($sformatf("supp_addr = %p", supp_addr));
        $display($sformatf("supp_addr = %s", supp_addr.name()));
        $display($sformatf("align_addr = %s", align_addr.name()));
        if(axi_trans_typ == TRANS_AXIL)begin
            if(axi_op == AXI_WR)begin
                $display($sformatf("wr_addr = %h", wr_addr));
                $display($sformatf("wr_data = %h", wr_data));
                $display($sformatf("wr_strb = %b", wr_strb));
            end
            else if(axi_op == AXI_RD)begin
                $display($sformatf("rd_addr = %h", rd_addr));
                $display($sformatf("rd_data = %h", rd_data));
            end
        end
        else if(axi_trans_typ == TRANS_AXIS)begin
            $display($sformatf("stream_size = %d", stream_size));
            $display($sformatf("data[0]  = %h, data[$]  = %h", data[0], data[$]));
            $display($sformatf("tstrb[0] = %h, tstrb[$] = %h", tstrb[0], tstrb[$]));
            $display($sformatf("tkeep[0] = %h, tkeep[$] = %h", tkeep[0], tkeep[$]));
            $display($sformatf("user[0]  = %h, user[$]  = %h", user[0], user[$]));
            $display($sformatf("tlast[0] = %h, tlast[$] = %h", tlast[0], tlast[$]));
            $display($sformatf("no_rdy_cnt = %0d", no_rdy_cnt));
`ifdef DBG_MSG
            $display("data:");
            foreach(data[i])begin
                $write($sformatf("%8h ", data[i]));
                if(i > 0 && i % 5 == 4)
                    $write("\n");
            end
            $write("\n");
`endif
            if(axi_op == AXI_WR)begin
                $display($sformatf("wr_addr = %h", wr_addr));
                $display($sformatf("wr_data = %h", wr_data));
                $display($sformatf("wr_strb = %b", wr_strb));
            end
            else if(axi_op == AXI_RD)begin
                $display($sformatf("rd_addr = %h", rd_addr));
                $display($sformatf("rd_data = %h", rd_data));
            end
            else if(axi_op == AXI_RET_DATA)begin
                $display($sformatf("rd_data = %h", rd_data));
            end
        end
        $display($sformatf("========================\n"));
    endfunction

    function void post_randomize();
        trans_id_st += 1;
        trans_id = trans_id_st;
        
        // tlast in axis_m is HIGH only at last transaction
        // however, axis_s can accept tlast is HIGH at any transaction
        // modify the random tlast queue to match axis_m bahavior
        //////////////////////////// 
        foreach(tlast[i]) tlast[i] = 0;
        tlast[$] = 1;

        ////////////////////////////
        foreach(user[i]) user[i] = user_value; // all user queue is same as user_value

        if(axi_trans_typ == TRANS_AXIS)begin
            if(axi_op == AXI_WR)begin
                wr_addr = data[0][27:0];
                wr_data = data[1];
                wr_strb = data[0][31:28];
            end
            else if(axi_op == AXI_RD)begin
                rd_addr = data[0][27:0];
            end
            else if(axi_op == AXI_RET_DATA)begin
                rd_data = data[0];
            end
        end
    endfunction

    function bit compare(aa_base_scenario tr_cmp);
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


typedef mailbox #(aa_base_scenario) mb_axi;


class aa_config_scenario extends aa_base_scenario;
endclass


class aa_normal_scenario extends aa_base_scenario;

    constraint user_value_limit{
        (axi_trans_typ == TRANS_AXIL) -> axi_op inside {AXI_WR, AXI_RD};
        (axi_trans_typ == TRANS_AXIS) -> axi_op inside {AXI_WR, AXI_RD, AXI_RET_DATA};

        if(axi_trans_typ == TRANS_AXIS){
            user_value != 0;
            (axi_op == AXI_WR) -> user_value == 2'b01;
            (axi_op == AXI_RD) -> user_value == 2'b10;
            (axi_op == AXI_RET_DATA) -> user_value == 2'b11;
        }

        if(axi_path_typ == PATH_SS_MBREG){
            axi_op inside {AXI_WR}; // SS read MB is illegal, do not happen in real system
        }
        (axi_path_typ == PATH_SS_AAREG) -> supp_addr == SUPP_ADDR_NO;
        if(axi_path_typ == PATH_SS_AAREG){
            axi_op inside {AXI_WR}; // SS read AA is illegal, do not happen in real system
        }
        if(axi_path_typ == PATH_SS_LM){
            axi_op inside {AXI_WR, AXI_RD};
        }
        if(axi_path_typ == PATH_SS_LS){
            axi_op inside {AXI_RET_DATA};
        }
        solve axi_trans_typ before axi_op;
        solve axi_op before user_value;
    }

endclass


class aa_boundary_scenario extends aa_base_scenario;
endclass


class aa_illegal_scenario extends aa_base_scenario;
endclass


// ref: https://stackoverflow.com/questions/49150633/randomize-a-queue-of-objects-in-systemverilog
class aa_system_base_scenario #(type CLS = aa_normal_scenario);
    rand CLS transa[$];
    rand transfer_type transfer_typ;
    int max_size = 100;

    constraint legal_size {
        transa.size <= max_size;
    }

    function void pre_randomize(); // cannot be virtual, its build in function
        for(int i = 0; i < max_size; i ++)
            transa[i] = new();
    endfunction

    function void post_randomize();
        foreach(transa[i])
            transa[i].transfer_typ = transfer_typ;
    endfunction

    virtual function void display();
        $display("transfer_typ = %s", transfer_typ.name());
        $display("transa.size() = %0d", transa.size());
        foreach(transa[i])
            transa[i].display();
    endfunction

endclass


class aa_system_transfer_scenario #(type CLS = aa_normal_scenario) extends aa_system_base_scenario;

    constraint transfer{
        transfer_typ dist {TRSF_LS_SM_R_SS_LM_R_SS_LS_DATA:= 1, TRSF_LS_SM_W_SS_MB_W:= 1, TRSF_LS_SM_W_SS_LM_W:= 1}; // no TRSF_OTHER

        if(transfer_typ == TRSF_LS_SM_R_SS_LM_R_SS_LS_DATA){ // fpga read caravel user wrapper
            transa.size == 3;
            foreach(transa[i]){
                transa[i].trans_reorder_typ == ORDER_FIX_NO_DONE; // this test pattern need to be sent exactly sequence as setup
            }
            transa[0].axi_trans_typ == TRANS_AXIL;
            transa[0].axi_path_typ == PATH_LS_SM;
            transa[0].axi_op == AXI_RD;
            transa[0].supp_addr == SUPP_ADDR_YES;

            transa[1].axi_trans_typ == TRANS_AXIS;
            transa[1].axi_path_typ == PATH_SS_LM;
            transa[1].axi_op == AXI_RD;
            transa[1].supp_addr == SUPP_ADDR_YES;

            transa[2].axi_trans_typ == TRANS_AXIS;
            transa[2].axi_path_typ == PATH_SS_LS;
            transa[2].axi_op == AXI_RET_DATA;
        }

        if(transfer_typ == TRSF_LS_SM_W_SS_MB_W){ // fpga write caravel MB
            transa.size == 2;
            foreach(transa[i]){
                transa[i].trans_reorder_typ == ORDER_FIX_NO_DONE; // this test pattern need to be sent exactly sequence as setup
            }
            transa[0].axi_trans_typ == TRANS_AXIL;
            transa[0].axi_path_typ == PATH_LS_SM;
            transa[0].axi_op == AXI_WR;
            transa[0].supp_addr == SUPP_ADDR_YES;

            transa[1].axi_trans_typ == TRANS_AXIS;
            transa[1].axi_path_typ == PATH_SS_MBREG;
            transa[1].axi_op == AXI_WR;
            transa[1].supp_addr == SUPP_ADDR_YES;
        }

        if(transfer_typ == TRSF_LS_SM_W_SS_LM_W){ // fpga write caravel user wrapper
            transa.size == 2;
            foreach(transa[i]){
                transa[i].trans_reorder_typ == ORDER_FIX_NO_DONE; // this test pattern need to be sent exactly sequence as setup
            }
            transa[0].axi_trans_typ == TRANS_AXIL;
            transa[0].axi_path_typ == PATH_LS_SM;
            transa[0].axi_op == AXI_WR;
            transa[0].supp_addr == SUPP_ADDR_YES;

            transa[1].axi_trans_typ == TRANS_AXIS;
            transa[1].axi_path_typ == PATH_SS_LM;
            transa[1].axi_op == AXI_WR;
            transa[1].supp_addr == SUPP_ADDR_YES;
        }
    }

endclass


class aa_system_config_rw_mb_scenario #(type CLS = aa_normal_scenario) extends aa_system_base_scenario;

    constraint transfer{
        transfer_typ inside {TRSF_LOCAL_RW_MB};

        if(transfer_typ == TRSF_LOCAL_RW_MB){
            transa.size == 40; // (rd_reset_default, wr_all_ff, rd_all, wr_all_00, rd_all) *8
            foreach(transa[i]){
                transa[i].axi_trans_typ == TRANS_AXIL;
                transa[i].axi_path_typ == PATH_LS_MBREG;
                transa[i].supp_addr == SUPP_ADDR_YES;
                transa[i].trans_reorder_typ == ORDER_FIX_DONE; // this MB read write test pattern need to be sent exactly sequence as setup
                
                if(i inside {[0:7], [16:23], [32:39]}){
                    transa[i].axi_op == AXI_RD;
                }
                if(i inside {[8:15], [24:31]}){
                    transa[i].axi_op == AXI_WR;
                }
            }
        }
    }

    function void post_randomize();
        bit [7:0] cnt[8];

        super.post_randomize();

        cnt = '{0, 1, 2, 3, 4, 5, 6, 7};

        foreach(cnt[j])begin
            transa[0  + cnt[j]].rd_addr[14:0] = 15'h2000 + cnt[j] * 4;
            transa[16 + cnt[j]].rd_addr[14:0] = 15'h2000 + cnt[j] * 4;
            transa[32 + cnt[j]].rd_addr[14:0] = 15'h2000 + cnt[j] * 4;

            transa[8  + cnt[j]].wr_addr[14:0] = 15'h2000 + cnt[j] * 4;
            transa[24 + cnt[j]].wr_addr[14:0] = 15'h2000 + cnt[j] * 4;

            transa[8  + cnt[j]].wr_data = '1;
            transa[24 + cnt[j]].wr_data = '0;

            transa[8  + cnt[j]].wr_strb = '1;
            transa[24 + cnt[j]].wr_strb = '1;
        end
    endfunction

endclass


class aa_system_config_rw_aa_scenario #(type CLS = aa_normal_scenario) extends aa_system_base_scenario;

    constraint transfer{
        transfer_typ inside {TRSF_RW_AA};

        if(transfer_typ == TRSF_RW_AA){
            transa.size == 12; // (rd_reset_default, wr_all_ff, rd_all, wr_all_00, rd_all, wr_all_ff) *2
            foreach(transa[i]){
                transa[i].axi_trans_typ == TRANS_AXIL;
                transa[i].axi_path_typ == PATH_LS_AAREG;
                transa[i].supp_addr == SUPP_ADDR_YES;
                transa[i].trans_reorder_typ == ORDER_FIX_DONE;
                
                if(i inside {[0:1], [4:5], [8:9]}){
                    transa[i].axi_op == AXI_RD;
                }
                if(i inside {[2:3], [6:7], [10:11]}){
                    transa[i].axi_op == AXI_WR;
                }
            }
        }
    }

    function void post_randomize();
        bit [7:0] cnt[2];

        super.post_randomize();

        cnt = '{0, 1};

        foreach(cnt[j])begin
            transa[0  + cnt[j]].rd_addr[14:0] = 15'h2100 + cnt[j] * 4;
            transa[4  + cnt[j]].rd_addr[14:0] = 15'h2100 + cnt[j] * 4;
            transa[8  + cnt[j]].rd_addr[14:0] = 15'h2100 + cnt[j] * 4;

            transa[2  + cnt[j]].wr_addr[14:0] = 15'h2100 + cnt[j] * 4;
            transa[6  + cnt[j]].wr_addr[14:0] = 15'h2100 + cnt[j] * 4;
            transa[10 + cnt[j]].wr_addr[14:0] = 15'h2100 + cnt[j] * 4;

            transa[2  + cnt[j]].wr_data = '1;
            transa[6  + cnt[j]].wr_data = '0;
            transa[10 + cnt[j]].wr_data = '1;

            transa[2  + cnt[j]].wr_strb = '1;
            transa[6  + cnt[j]].wr_strb = '1;
            transa[10 + cnt[j]].wr_strb = '1;
        end
    endfunction

endclass


class aa_system_single_scenario #(type CLS = aa_normal_scenario) extends aa_system_base_scenario;

    constraint transfer{
        transfer_typ inside {TRSF_OTHER};

        if(transfer_typ == TRSF_OTHER){ // normal transaction
            transa.size == 80;
            
            foreach(transa[i]){
                if(transa[i].axi_path_typ == PATH_LS_SM && transa[i].axi_op == AXI_RD){
                    transa[i].supp_addr == SUPP_ADDR_NO; // read will wait for return data, bus lock for a long time
                }

                transa[i].axi_path_typ != PATH_SS_LS; // do not generate single return data
            }
        }
    }

endclass


class aa_scenario_transaction_level_gen #(type CLS = aa_normal_scenario);
    CLS scnr;
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


class aa_scenario_gen #(type CLS = aa_system_base_scenario);
    CLS scnr_set[$]; // push class object to this in testcase
    mb_axi mb_scnr[2];
    static int PKT_NUM;
    int pkt_num_now;

    function new(mb_axi mb_scn2drvr, mb_scn2scrbd);
        this.mb_scnr[0] = mb_scn2drvr;
        this.mb_scnr[1] = mb_scn2scrbd;
    endfunction

    task gen();
        bit break_all;
        break_all = 0;
        pkt_num_now = 0;
        
        for(int i=0; i < PKT_NUM; i++)begin
            foreach(scnr_set[i])begin
                scnr_set[i].randomize();
                scnr_set[i].display();
                foreach(scnr_set[i].transa[j])begin
                    mb_scnr[0].put(scnr_set[i].transa[j]);
                    mb_scnr[1].put(scnr_set[i].transa[j]);
                    pkt_num_now ++;
                    if(pkt_num_now >= PKT_NUM)begin
                        break_all = 1;
                        break;
                    end
                end
                if(break_all)
                    break;
            end
            if(break_all)
                break;
        end
    endtask
endclass