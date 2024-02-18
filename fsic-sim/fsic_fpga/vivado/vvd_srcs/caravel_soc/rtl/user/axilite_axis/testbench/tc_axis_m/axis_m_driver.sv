///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axis_m_driver
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/06/19
///////////////////////////////////////////////////////////////////////////////

`define dut top.axi_stream_m
//event evt_wr_addr, evt_wr_data;

parameter BUS_DELAY = 1ns;

class axis_m_driver;
    virtual axis_m_interface.slave intf;
    axis_m_scenario scnr_drvr;
    mb_axi mb_drvr;
    //axis_m_scenario wr_q[$], rd_q[$], wr_tr, rd_tr;
    bit down, up;
    //static int no_rdy_trans, no_rdy_cnt;

    function new(virtual axis_m_interface.slave intf, mb_axi mb_drvr);
        this.intf = intf;
        this.scnr_drvr = scnr_drvr;
        this.mb_drvr = mb_drvr;
    endfunction

    virtual task bus_op();
        static bit [31:0] data;
        static bit [3:0] tstrb;
        static bit [3:0] tkeep;
        static bit [1:0] user;
        //event evt_wr_addr, evt_wr_data;

        init_bus();

        for(int i=0; i < axis_m_scenario_gen::PKT_NUM; i++)begin
            scnr_drvr = new();
            mb_drvr.get(scnr_drvr);
            scnr_drvr.display();
            top.no_rdy_trans = scnr_drvr.no_rdy_cnt;
            $display("no_rdy_trans = %0d", top.no_rdy_trans);

            fork: drive_packet
                begin
                    for(int i=0; i<scnr_drvr.stream_size; i++)begin
                        data = scnr_drvr.data[i];
                        tstrb = scnr_drvr.tstrb[i];
                        tkeep = scnr_drvr.tkeep[i];
                        user = scnr_drvr.user[i];

                        @(posedge intf.axi_aclk);
                        #(BUS_DELAY);
                        intf.bk_start = 1;
                        intf.bk_data = data;
                        intf.bk_tstrb = tstrb;
                        intf.bk_tkeep = tkeep;
                        intf.bk_user = user;
                    end
                    
                    @(posedge intf.axi_aclk);
                    #(BUS_DELAY);
                    intf.bk_start = 0;
                    intf.bk_data = 0;
                    intf.bk_tstrb = 0;
                    intf.bk_tkeep = 0;
                    intf.bk_user = 0;

                    wait(intf.bk_done === 1);
                    repeat($urandom_range(5)) @(posedge intf.axi_aclk);
                    disable drive_packet;
                end
                
                begin
                    top.no_rdy_cnt = 0;
                    
                    while(1)begin
                        @(posedge intf.axi_aclk);
                        -> top.evt_001;
                        //#(top.CLK_PERIOD / 4);

                        // output axis_tready
                        if(intf.axis_tvalid === 1'b1)begin
                            if(intf.axis_tready === 1'b0)begin
                                #(BUS_DELAY);
                                -> top.evt_002;
                                up = $urandom_range(0, 1);
                                top.no_rdy_cnt ++;
                                if(top.no_rdy_cnt < top.no_rdy_trans)begin
                                    if(up)
                                        intf.axis_tready = 1'b1;
                                end
                                else
                                    intf.axis_tready = 1'b1;
                            end
                            else begin // both 1
                                #(BUS_DELAY);
                                -> top.evt_003;
                                down = $urandom_range(0, 1);
                                if(top.no_rdy_cnt < top.no_rdy_trans)begin
                                    if(down)
                                        intf.axis_tready = 1'b0;
                                end
                                //end
                                //-> top.evt_wr_addr;
                                //intf.wr_addr_go = 0;
                                //break;
                            end
                        end
                    end
                end
            join
        end
            
        //    while(1)begin
        //        if((wr_q.size() + rd_q.size()) == 0)begin
        //            repeat(20)@(posedge intf.axi_aclk);
        //            break;
        //        end
        //        else begin
        //            @(posedge intf.axi_aclk);
        //        end
        //    end
        //join_any
        //disable fork;
    endtask

    virtual task init_bus();
        intf.bk_start = 0;
        intf.bk_data = 0;
        intf.bk_tstrb = 0;
        intf.bk_tkeep = 0;
        intf.bk_user = 0;

        intf.axis_tready = 0;

        wait(intf.axi_aresetn == 1);
    endtask
endclass
