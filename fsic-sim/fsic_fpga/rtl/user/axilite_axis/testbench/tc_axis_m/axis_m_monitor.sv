///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axis_m_monitor
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/06/19
///////////////////////////////////////////////////////////////////////////////

class axis_m_monitor;
    virtual axis_m_interface.slave intf;
    axis_m_scenario scnr_mon;
    mb_axi mb_mon;

    int packet_cnt = 0;
    int stream_size_tmp, stream_size_final, stream_size_q[$], stream_size_item; 
    bit [31:0] data[$];
    bit [3:0] tstrb[$];
    bit [3:0] tkeep[$];
    bit [1:0] user[$];
    int largest_fifo_level, fifo_write_cnt, fifo_read_cnt, tmp_fifo_level;


    function new(virtual axis_m_interface.slave intf, mb_axi mb_mon);
        this.intf = intf;
        this.mb_mon = mb_mon;
    endfunction

    virtual task bus_mon();
        wait_rst_done();
        
        fork
            begin
                while(1)begin // get stream size from backend interface, push to queue
                    stream_size_tmp = 0;
                    wait(intf.bk_start === 1);
                    while(1)begin
                        @(posedge intf.axi_aclk);
                        //-> top.evt_001;
                        if(intf.bk_start === 1)
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
            
            while(1)begin
                fork: get_data
                    while(1)begin // track every valid / ready handshake, push data to queue
                        @(posedge intf.axi_aclk);
                        
                        if(intf.axis_tvalid === 1'b1 && intf.axis_tready === 1'b1)begin
                            //-> top.evt_get_data;
                            data.push_back(intf.axis_tdata);
                            tstrb.push_back(intf.axis_tstrb);
                            tkeep.push_back(intf.axis_tkeep);
                            user.push_back(intf.axis_tuser);
                        end
                    end
                    begin
                        while(1)begin // get stream size from queue
                            @(posedge intf.axi_aclk);
                            if(stream_size_q.size() != 0)begin
                                stream_size_item = stream_size_q.pop_front();
                                break;
                            end
                        end
                            
                        while(1)begin // use stream size to get correct data
                            @(posedge intf.axi_aclk);
                            
                            if(data.size() == stream_size_item)begin
                                //-> top.evt_get_data2;
                                scnr_mon = new();
                                scnr_mon.data = data;
                                scnr_mon.tstrb = tstrb;
                                scnr_mon.tkeep = tkeep;
                                scnr_mon.user = user;
                                scnr_mon.stream_size = stream_size_item;
                                scnr_mon.display("scnr_mon");
                                mb_mon.put(scnr_mon);
                                packet_cnt +=1;
                                
                                data = {}; // clear queue
                                tstrb = {};
                                tkeep = {};
                                user = {};
                                break;
                            end
                        end
                        disable get_data;
                    end
                join
            end
            
            begin
                largest_fifo_level = 0;
                while(1)begin // record largest fifo depth used
                    @(posedge intf.axi_aclk);
                    fifo_write_cnt = `dut.fifo.wr_count[7:0];
                    fifo_read_cnt = `dut.fifo.rd_count[7:0];
                    tmp_fifo_level = fifo_write_cnt - fifo_read_cnt;
                    if(tmp_fifo_level > largest_fifo_level)begin
                        largest_fifo_level = tmp_fifo_level;
                        $display("%0t\tlargest_fifo_level is %0d", $time(), largest_fifo_level);
                    end
                    if(largest_fifo_level >= `dut.AXI_FIFO_DEPTH - 1)begin
                        $display("%0t\t[ERROR] fifo water level in axis_master overflow, designed %0d, now %0d", $time(), `dut.AXI_FIFO_DEPTH, largest_fifo_level);
                    end
                end
            end

            while(1)begin
                @(posedge intf.axi_aclk);
                if(packet_cnt >= axis_m_scenario_gen::PKT_NUM) break;
            end
        join_any
        disable fork;
    endtask
    
    virtual task wait_rst_done();
        wait(intf.axi_aresetn == 1);
    endtask

endclass
