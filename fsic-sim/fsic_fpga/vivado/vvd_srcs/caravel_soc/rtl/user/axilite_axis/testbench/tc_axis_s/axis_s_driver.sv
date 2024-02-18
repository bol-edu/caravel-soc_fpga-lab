///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axis_s_driver
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/06/29
///////////////////////////////////////////////////////////////////////////////

`define dut top.axis_s
//event evt_wr_addr, evt_wr_data;

parameter BUS_DELAY = 1ns;

class axis_s_driver;
    virtual axis_s_interface.master intf;
    axis_s_scenario scnr_drvr;
    mb_axi mb_drvr;
    //axis_s_scenario wr_q[$], rd_q[$], wr_tr, rd_tr;
    bit down, up;
    //static int no_rdy_trans, no_rdy_cnt;

    function new(virtual axis_s_interface.master intf, mb_axi mb_drvr);
        this.intf = intf;
        this.scnr_drvr = scnr_drvr;
        this.mb_drvr = mb_drvr;
    endfunction

    virtual task bus_op();
        bit [31:0] data;
        bit [3:0] tstrb;
        bit [3:0] tkeep;
        bit [1:0] user;
        bit tlast;
        bit first;
        int nth_pkt;

        init_bus();

        for(int i=0; i < axis_s_scenario_gen::PKT_NUM; i++)begin
            scnr_drvr = new();
            mb_drvr.get(scnr_drvr);
            scnr_drvr.display();
            //top.no_rdy_trans = scnr_drvr.no_rdy_cnt;
            //$display("no_rdy_trans = %0d", top.no_rdy_trans);
            first = 1;
            nth_pkt = 0;
            
            fork: drive_packet
                begin
                    while(1)begin
                        data = scnr_drvr.data[nth_pkt];
                        tstrb = scnr_drvr.tstrb[nth_pkt];
                        tkeep = scnr_drvr.tkeep[nth_pkt];
                        user = scnr_drvr.user[nth_pkt];
                        tlast = scnr_drvr.tlast[nth_pkt];
                        
                        if(first)begin
                            @(posedge intf.axi_aclk);
                            first = 0;
                        end

                        #(BUS_DELAY);
                        intf.axis_tvalid = 1;
                        intf.axis_tdata = data;
                        intf.axis_tstrb = tstrb;
                        intf.axis_tkeep = tkeep;
                        intf.axis_tuser = user;
                        intf.axis_tlast = tlast;

                        if(~first)begin
                            @(posedge intf.axi_aclk);
                            if(intf.axis_tready === 1)
                                nth_pkt ++;
                            if(nth_pkt == scnr_drvr.stream_size)
                                break;
                        end
                    end

                    //for(int i=0; i<scnr_drvr.stream_size; i++)begin
                    //    data = scnr_drvr.data[i];
                    //    tstrb = scnr_drvr.tstrb[i];
                    //    tkeep = scnr_drvr.tkeep[i];
                    //    user = scnr_drvr.user[i];
                    //    tlast = scnr_drvr.tlast[i];
                    //
                    //    @(posedge intf.axi_aclk);
                    //    #(BUS_DELAY);
                    //    intf.axis_tvalid = 1;
                    //    intf.axis_tdata = data;
                    //    intf.axis_tstrb = tstrb;
                    //    intf.axis_tkeep = tkeep;
                    //    intf.axis_tuser = user;
                    //    intf.axis_tlast = tlast;
                    //    -> top.evt_001;
                    //    wait(intf.axis_tready === 1);
                    //    -> top.evt_002;
                    //end

                    //@(posedge intf.axi_aclk);
                    #(BUS_DELAY);
                    intf.axis_tvalid = 0;
                    intf.axis_tdata = 0;
                    intf.axis_tstrb = 0;
                    intf.axis_tkeep = 0;
                    intf.axis_tuser = 0;
                    intf.axis_tlast = 0;

                    wait(intf.bk_valid === 0);
                    repeat($urandom_range(5)) @(posedge intf.axi_aclk);
                    disable drive_packet;
                end
                
                begin
                    while(1)begin
                        @(posedge intf.axi_aclk);
                        //-> top.evt_001;

                        if(intf.axis_tvalid == 1'b1)begin
                            #(BUS_DELAY);
                            up = $urandom_range(0, 1);
                            if(up)
                                intf.bk_ready = 1;
                        end
                        else begin
                            #(BUS_DELAY);
                            //-> top.evt_003;
                            down = $urandom_range(0, 1);
                            if(down)
                                intf.bk_ready = 0;
                        end
                    end
                end
            join
        end

    endtask

    virtual task init_bus();
        intf.axis_tvalid = 0;
        intf.axis_tdata = 0;
        intf.axis_tstrb = 0;
        intf.axis_tkeep = 0;
        intf.axis_tlast = 0;
        intf.axis_tuser = 0;

        intf.bk_ready = 0;

        wait(intf.axi_aresetn == 1);
    endtask
endclass
