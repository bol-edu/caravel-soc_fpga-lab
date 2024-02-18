///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axil_s_driver
//       AUTHOR: zack, Willy
// ORGANIZATION: fsic
//      CREATED: 2023/07/01
///////////////////////////////////////////////////////////////////////////////

`define dut top.axil_s

parameter BUS_DELAY = 1ns;

class axil_s_driver;
    virtual axil_s_interface.master intf;
    axil_s_scenario scnr_drvr;
    mb_axi mb_drvr;
    axil_s_scenario wr_q[$], rd_q[$], wr_tr, rd_tr;

    function new(virtual axil_s_interface.master intf, mb_axi mb_drvr);
        this.intf = intf;
        this.scnr_drvr = scnr_drvr;
        this.mb_drvr = mb_drvr;
    endfunction

    virtual task bus_op();
        bit down;
        bit [14:0] wr_addr, rd_addr;
        bit [31:0] wr_data;
        bit [3:0] wstrb;

        semaphore key = new(1);

        init_bus();

        for(int i=0; i < axil_s_scenario_gen::PKT_NUM; i++)begin
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
                        begin // wr addr
                            @(posedge intf.axi_aclk);
                            key.get(1); //Retrieve key before set cc_aa_enable.
                            intf.cc_aa_enable = 1; //Assert cc_aa_enable before transaction.

                            intf.axi_awaddr = wr_tr.wr_addr;
                            intf.axi_awvalid = 1;

                            while(1)begin
                                @(posedge intf.axi_aclk);
                                if(intf.axi_awready === 1'b1)begin
                                    #(BUS_DELAY);
                                    intf.axi_awaddr = 0;
                                    intf.axi_awvalid = 0;
                                    
                                    intf.cc_aa_enable = 0; //Deassert cc_aa_enable after transaction
                                    //After de-assert cc_aa_enable, release the key for next user
                                    key.put(1);
                                    break;
                                end
                            end
                        end

                        begin // wr data
                            @(posedge intf.axi_aclk);
                            intf.axi_wdata = wr_tr.wr_data;
                            intf.axi_wstrb = wr_tr.wr_strb;
                            intf.axi_wvalid = 1;
                            
                            while(1)begin
                                @(posedge intf.axi_aclk);
                                if(intf.axi_wready === 1'b1)begin
                                    #(BUS_DELAY);
                                    intf.axi_wdata = 0;
                                    intf.axi_wstrb = 0;
                                    intf.axi_wvalid = 0;

                                    break;
                                end
                            end
                        end
                    join

                    repeat($urandom_range(5)) @(posedge intf.axi_aclk);
                end
                else begin
                    @(posedge intf.axi_aclk);
                end
            end
            
            while(1)begin
                if(rd_q.size() != 0)begin
                    rd_tr = rd_q.pop_front();
                    fork // read
                        begin // rd addr
                            @(posedge intf.axi_aclk);
                            key.get(1); //Retrieve key before set cc_aa_enable.
                            intf.cc_aa_enable = 1; //Assert cc_aa_enable before transaction.
                            intf.axi_araddr = rd_tr.rd_addr;
                            intf.axi_arvalid = 1;
                            
                            while(1)begin
                                @(posedge intf.axi_aclk);
                                if(intf.axi_arready === 1'b1)begin
                                    #(BUS_DELAY);
                                    intf.axi_araddr = 0;
                                    intf.axi_arvalid = 0;
                                    
                                    intf.cc_aa_enable = 0; //Deassert cc_aa_enable after transaction
                                    //After de-assert cc_aa_enable, release the key for next user
                                    key.put(1);
                                    break;
                                end
                            end
                        end

                        begin // rd ready
                            @(posedge intf.axi_aclk);
                            if(intf.axi_rready == 0)begin
                                #(BUS_DELAY);
                                //if($urandom_range(1))
                                intf.axi_rready = 1;
                            end
                            while(1)begin
                                 @(posedge intf.axi_aclk);
                                if(intf.axi_rready == 1)begin
                                    if(intf.axi_rvalid === 1)begin
                                        #(BUS_DELAY);
                                        if($urandom_range(1))
                                            intf.axi_rready = 0;
                                        break;
                                    end
                                end
                            end
                        end

                        begin // rd data
                            //@(posedge intf.axi_aclk);
                            //Willy debug - s
                            while(1)begin
                                @(posedge intf.axi_aclk);
                                if(intf.bk_rstart === 1'b1)begin
                                    #(BUS_DELAY);
                                    intf.bk_rdata = rd_tr.rd_data;
                                    intf.bk_rdone = 1;
        
                                    @(posedge intf.axi_aclk);
                                    #(BUS_DELAY);
                                    intf.bk_rdata = 0;
                                    intf.bk_rdone = 0;
                                    
                                    break;
                                end
                            end
                            //Willy debug - e
                        end
                    join

                    repeat($urandom_range(5)) @(posedge intf.axi_aclk);
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
        intf.bk_rdata = 0;
        intf.bk_rdone = 0;

        intf.axi_awvalid = 0;
        intf.axi_awaddr = 0;
        intf.axi_wvalid = 0;
        intf.axi_wdata = 0;
        intf.axi_wstrb = 0;
        intf.axi_arvalid = 0;
        intf.axi_araddr = 0;
        intf.axi_rready = 0;
        intf.cc_aa_enable = 0; // Add cc_aa_enable
        wait(intf.axi_aresetn === 1);
    endtask
endclass
