///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axis_s_monitor
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/06/29
///////////////////////////////////////////////////////////////////////////////

class axis_s_monitor;
    virtual axis_s_interface.master intf;
    axis_s_scenario scnr_mon;
    mb_axi mb_mon;

    int packet_cnt = 0;
    int stream_size_tmp, stream_size_final, stream_size_q[$], stream_size_item; 
    bit [31:0] data[$];
    bit [3:0] tstrb[$];
    bit [3:0] tkeep[$];
    bit [1:0] user[$];
    bit tlast[$];
    int largest_fifo_level, fifo_write_cnt, fifo_read_cnt, tmp_fifo_level;


    function new(virtual axis_s_interface.master intf, mb_axi mb_mon);
        this.intf = intf;
        this.mb_mon = mb_mon;
    endfunction

    virtual task bus_mon();
        wait_rst_done();
        
        fork
            begin
                while(1)begin // get stream size from frontend interface, push to queue
                    stream_size_tmp = 0;
                    wait(intf.axis_tvalid === 1);
                    while(1)begin
                        @(posedge intf.axi_aclk);
                        //-> top.evt_001;
                        if(intf.axis_tvalid === 1 && intf.axis_tready === 1)
                            stream_size_tmp ++;
                        else if(intf.axis_tvalid === 0)begin
                            stream_size_final = stream_size_tmp;
                            stream_size_q.push_back(stream_size_final);
                            //-> top.evt_002;
                            $display("%0t, stream_size_final = %0d", $time(), stream_size_final);
                            break;
                        end
                    end
                end
            end

            while(1)begin
                top.xsim_dbg_01 = 1;
                wait(intf.bk_valid === 1'b1);
                -> top.evt_001;
                top.xsim_dbg_01 = 2;
                while(1)begin
                    @(posedge intf.axi_aclk);
                    -> top.evt_002;
                top.xsim_dbg_01 = 3;
                    if(intf.bk_valid === 1'b1)begin
                        data.push_back(intf.bk_data);
                        tstrb.push_back(intf.bk_tstrb);
                        tkeep.push_back(intf.bk_tkeep);
                        user.push_back(intf.bk_user);
                        tlast.push_back(intf.bk_tlast);
                    end
                    else 
                        break;
                end
            end

            while(1)begin
                while(1)begin // get stream size from queue
                    //@(posedge intf.axi_aclk);
                    wait(stream_size_q.size() != 0);
                    if(stream_size_q.size() != 0)begin
                        stream_size_item = stream_size_q.pop_front();
                    -> top.evt_003;
                top.xsim_dbg_01 = 4;
                        break;
                    end
                end
                    
                while(1)begin // use stream size to get correct data
                    //@(posedge intf.axi_aclk);
                    @(negedge intf.axi_aclk); // avoid race in xsim

                    if(data.size() == stream_size_item)begin
                        scnr_mon = new();
                        scnr_mon.data = data;
                        scnr_mon.tstrb = tstrb;
                        scnr_mon.tkeep = tkeep;
                        scnr_mon.user = user;
                        scnr_mon.tlast = tlast;
                        //$display("tlast %p", tlast);
                        //$display("scnr_mon.tlast %p", scnr_mon.tlast);
                        scnr_mon.stream_size = data.size();
                        scnr_mon.display("scnr_mon");
                        mb_mon.put(scnr_mon);
                        packet_cnt +=1;
                        
                        data = {}; // clear queue
                        tstrb = {};
                        tkeep = {};
                        user = {};
                        tlast = {};
                top.xsim_dbg_01 = 5;
                        break;
                    end
                end
                //disable get_data;
            end

            while(1)begin
                @(posedge intf.axi_aclk);
                if(packet_cnt >= axis_s_scenario_gen::PKT_NUM) break;
            end
        join_any
        disable fork;
    endtask
    
    virtual task wait_rst_done();
        wait(intf.axi_aresetn === 1);
    endtask

endclass
