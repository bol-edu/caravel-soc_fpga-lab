///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axil_m_driver
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/05/17
///////////////////////////////////////////////////////////////////////////////

`define dut top.axi_lite_m
//event evt_wr_addr, evt_wr_data;

parameter BUS_DELAY = 1ns;

class axil_m_driver;
    virtual axil_m_interface.slave intf;
    axil_m_scenario scnr_drvr;
    mb_axi mb_drvr;
    axil_m_scenario wr_q[$], rd_q[$], wr_tr, rd_tr;

    function new(virtual axil_m_interface.slave intf, mb_axi mb_drvr);
        this.intf = intf;
        this.scnr_drvr = scnr_drvr;
        this.mb_drvr = mb_drvr;
    endfunction

    virtual task bus_op();
        bit down;
        static bit [11:0] wr_addr, rd_addr;
        static bit [31:0] wr_data;
        static bit [3:0] wstrb;
        //event evt_wr_addr, evt_wr_data;

        init_bus();

        //while(1)begin
        for(int i=0; i < axil_m_scenario_gen::PKT_NUM; i++)begin
            scnr_drvr = new();
            mb_drvr.get(scnr_drvr);
            scnr_drvr.display();
            //-> top.evt_001;
            if(scnr_drvr.axi_op == AXI_WR)begin
                wr_q.push_back(scnr_drvr);
            end
            else begin
                rd_q.push_back(scnr_drvr);
            end
        end

        fork
            while(1)begin
                if(wr_q.size() != 0)begin
                    wr_tr = wr_q.pop_front();
                
                    fork // write
                        while(1)begin
                            wr_addr = wr_tr.wr_addr;
                            wr_data = wr_tr.wr_data;
                            wstrb = wr_tr.wr_strb;
                            @(posedge intf.axi_aclk);
                            intf.bk_wstart = 1;
                            intf.bk_waddr = wr_addr;
                            intf.bk_wdata = wr_data;
                            intf.bk_wstrb = wstrb;

                            //-> top.evt_002;
                            @(posedge intf.axi_aclk);
                            intf.bk_wstart = 0;
                            intf.bk_waddr = 0;
                            intf.bk_wdata = 0;
                            intf.bk_wstrb = 0;

                            wait(intf.bk_wdone === 1);
                            repeat($urandom_range(5)) @(posedge intf.axi_aclk);
                            break;
                        end

                        while(1)begin
                            //-> top.evt_002;
                            @(posedge intf.axi_aclk);

                            // write addr
                            if(intf.axi_awvalid === 1'b1)begin
                                if(intf.axi_awready === 1'b0)begin
                                    #(BUS_DELAY);
                                    intf.axi_awready = 1'b1;
                                end
                                else begin // both 1
                                    #(BUS_DELAY);
                                    //down = $urandom_range(0, 1);
                                    //if(down)begin
                                    intf.axi_awready = 1'b0;
                                    //end
                                    -> top.evt_wr_addr;
                                    break;
                                end
                            end
                        end

                        while(1)begin
                            @(posedge intf.axi_aclk);

                            // write data
                            if(intf.axi_wvalid === 1'b1)begin
                                if(intf.axi_wready === 1'b0)begin
                                    #(BUS_DELAY);
                                    intf.axi_wready = 1'b1;
                                end
                                else begin // both 1
                                    //down = $urandom_range(0, 1);
                                    //if(down)begin
                                    #(BUS_DELAY);
                                    intf.axi_wready = 1'b0;
                                    //end
                                    -> top.evt_wr_data;
                                    break;
                                end
                            end
                        end
                    join
                end
                else begin
                    @(posedge intf.axi_aclk);
                end
            end
            
            while(1)begin
                if(rd_q.size() != 0)begin
                    rd_tr = rd_q.pop_front();
                    fork // read
                        while(1)begin
                            rd_addr = rd_tr.rd_addr;

                            @(posedge intf.axi_aclk);
                            intf.bk_rstart = 1;
                            intf.bk_raddr  = rd_addr;

                            @(posedge intf.axi_aclk);
                            #(BUS_DELAY);
                            intf.bk_rstart = 0;
                            intf.bk_raddr  = 0;

                            wait(`dut.bk_rdone == 1);
                            repeat($urandom_range(5)) @(posedge intf.axi_aclk);
                            break;
                        end

                        while(1)begin
                            @(posedge intf.axi_aclk);

                            // read addr
                            if(intf.axi_arvalid === 1'b1)begin
                                if(intf.axi_arready === 1'b0)begin
                                    #(BUS_DELAY);
                                    intf.axi_arready = 1'b1;
                                end
                                else begin // both 1
                                    #(BUS_DELAY);
                                    //down = $urandom_range(0, 1);
                                    //if(down)begin
                                    intf.axi_arready = 1'b0;
                                    //end
                                    break;
                                end
                            end
                        end

                        while(1)begin
                            @(posedge intf.axi_aclk);

                            // read data
                            if(intf.axi_rvalid === 1'b1)begin
                                if(intf.axi_rready === 1'b0)begin
                                    // wait ready high
                                end
                                else begin // both 1
                                    #(BUS_DELAY);
                                    intf.axi_rvalid = 1'b0;
                                    intf.axi_rdata = 32'hx;

                                    break;
                                end
                            end
                            else if(intf.axi_rvalid === 1'b0)begin
                                #(BUS_DELAY);
                                intf.axi_rvalid = 1'b1;
                                intf.axi_rdata = rd_tr.rd_data;
                            end
                        end
                    join
                end
                else begin
                    @(posedge intf.axi_aclk);
                end
            end
            
            while(1)begin
                if((wr_q.size() + rd_q.size()) == 0)begin
                    repeat(20)@(posedge intf.axi_aclk);
                    break;
                end
                else begin
                    @(posedge intf.axi_aclk);
                end
            end
        join_any
        disable fork;
    endtask

    virtual task init_bus();
        intf.bk_wstart = 0;
        intf.bk_waddr = 0;
        intf.bk_wdata = 0;
        intf.bk_wstrb = 0;
        intf.bk_rstart = 0;
        intf.bk_raddr = 0;

        intf.axi_rdata = 0;
        intf.axi_awready = 0;
        intf.axi_wready = 0;
        intf.axi_arready = 0;
        intf.axi_rvalid = 0;
        wait(intf.axi_aresetn === 1);
    endtask
endclass
