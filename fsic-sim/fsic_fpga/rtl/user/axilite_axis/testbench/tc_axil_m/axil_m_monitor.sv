///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axil_m_monitor
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/05/17
///////////////////////////////////////////////////////////////////////////////

class axil_m_monitor;
    virtual axil_m_interface.slave intf;
    axil_m_scenario scnr_mon[2];
    mb_axi mb_mon;
    bit [11:0] wr_addr, rd_addr;
    bit [31:0] wr_data, rd_data;
    bit [3:0] wr_strb;
    int packet_cnt = 0;

    function new(virtual axil_m_interface.slave intf, mb_axi mb_mon);
        this.intf = intf;
        this.mb_mon = mb_mon;
    endfunction

    virtual task bus_mon();
        //while(1)begin
        //for(int i=0; i< scenario_gen::PKT_NUM; i++)begin
            
            fork
                while(1)begin // wr
                    while(1)begin
                        @(posedge intf.axi_aclk);
                        -> top.evt_001;

                        // write addr
                        if(intf.axi_awvalid === 1'b1 && intf.axi_awready === 1'b1)begin
                            wr_addr = intf.axi_awaddr;
                            break;
                        end
                    end
                    while(1)begin
                        @(posedge intf.axi_aclk);
                        -> top.evt_002;

                        // write data
                        if(intf.axi_wvalid === 1'b1 && intf.axi_wready === 1'b1)begin
                            wr_data = intf.axi_wdata;
                            wr_strb = intf.axi_wstrb;
                            break;
                        end
                    end
                    scnr_mon[0] = new();
                    scnr_mon[0].wr_addr = wr_addr;
                    scnr_mon[0].wr_data = wr_data;
                    scnr_mon[0].wr_strb = wr_strb;
                    scnr_mon[0].axi_op = AXI_WR;
                    scnr_mon[0].display("scnr_mon[0]");
                    mb_mon.put(scnr_mon[0]);
                    packet_cnt +=1;
                end
                
                while(1)begin // rd
                    while(1)begin
                        @(posedge intf.axi_aclk);

                        // read addr
                        if(intf.axi_arvalid === 1'b1 && intf.axi_arready === 1'b1)begin
                            rd_addr = intf.axi_araddr;
                            break;
                        end
                    end
                    while(1)begin
                        @(posedge intf.axi_aclk);

                        // read data
                        if(intf.axi_rvalid === 1'b1 && intf.axi_rready === 1'b1)begin
                            #(BUS_DELAY);
                            rd_data = intf.bk_rdata;
                            break;
                        end
                    end
                    scnr_mon[1] = new();
                    scnr_mon[1].rd_addr = rd_addr;
                    scnr_mon[1].rd_data = rd_data;
                    scnr_mon[1].axi_op = AXI_RD;
                    scnr_mon[1].display("scnr_mon[1]");
                    mb_mon.put(scnr_mon[1]);
                    packet_cnt +=1;
                end
                
                while(1)begin
                    @(posedge intf.axi_aclk);
                    if(packet_cnt >= axil_m_scenario_gen::PKT_NUM) break;
                end
            join_any
            disable fork;
        //end
    endtask

endclass
