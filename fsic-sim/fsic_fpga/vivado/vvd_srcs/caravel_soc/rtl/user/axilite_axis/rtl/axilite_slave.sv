///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axilite_slave
//       AUTHOR: Willy
// ORGANIZATION: fsic
//      CREATED: 2023/06/20
///////////////////////////////////////////////////////////////////////////////

module axilite_slave(
    // frontend - axilite slave
    input wire axi_aclk,
    input wire axi_aresetn,

    output logic axi_awready,
    output logic axi_wready,
    output logic axi_arready,
    output logic axi_rvalid,
    output logic [31:0] axi_rdata,
    input wire axi_awvalid,
    input wire [14:0] axi_awaddr,
    input wire axi_wvalid,
    input wire [31:0] axi_wdata,
    input wire [3:0] axi_wstrb,
    input wire axi_arvalid,
    input wire [14:0] axi_araddr,
    input wire axi_rready,

    // backend source to receive the axilite slave transaction
    output logic bk_rd_wr,        //WR: bk_rd_wr = 0, RD: bk_rd_wr = 1
    output logic bk_valid,
    output logic [14:0] bk_addr, //for read or write address
    output logic [31:0] bk_wdata,
    output logic [3:0]  bk_wstrb,
    input wire [31:0] bk_rdata,
    input wire bk_ready,

    input wire cc_aa_enable //ConfigControl assert it when the request is forwarding to AA.
);

    logic [14:0] cache_waddr, cache_raddr;
    logic [31:0] cache_wdata, cache_rdata;
    logic [3:0]  cache_strb;
    logic cache_wstart, cache_rstart;
    
    logic cache_rdone, cache_wdone;


    // Arbiter siglas
    logic w_req, r_req;
    logic w_grant, r_grant;

    // FSM state
    // Note: WRESP is not supported, always posted write without response
    enum logic [2:0] {WR_WAIT_ADDR, WR_WRITE_ADDR, WR_WRITE_DATA, WR_WRITE_WAIT_BK} axi_wr_state, axi_wr_next_state;
    enum logic [2:0] {RD_WAIT_ADDR, RD_READ_ADDR, RD_READ_DATA}   axi_rd_state, axi_rd_next_state;

    logic bk_busy;
    assign bk_busy = cache_wstart | cache_rstart;

    // Arbiter, sequential logic
    always_ff @(posedge axi_aclk or negedge axi_aresetn) begin
        if (~axi_aresetn) begin
            w_grant <= 1'b0;
            r_grant <= 1'b0;
        end else begin
            //When write & read request together, select write first, just a easly way without using priority or round-robin mechanism
            if(w_req && r_req) begin
                w_grant <= 1'b1;
                r_grant <= 1'b0; 
            end else if(w_req) begin
                w_grant <= 1'b1;
                r_grant <= 1'b0;
            end else if(r_req) begin
                w_grant <= 1'b0;
                r_grant <= 1'b1;
            end else begin
                w_grant <= 1'b0;
                r_grant <= 1'b0;
            end
        end    
    
    end

    // FSM state, sequential logic
    always_ff @(posedge axi_aclk or negedge axi_aresetn) begin
        if (~axi_aresetn) begin
            axi_wr_state <= WR_WAIT_ADDR;
            axi_rd_state <= RD_WAIT_ADDR;
        end else begin
            axi_wr_state <= axi_wr_next_state;
            axi_rd_state <= axi_rd_next_state;
        end
    end

    // FSM state,  sequential logic, input capture for write cycle
    always_ff @(posedge axi_aclk or negedge axi_aresetn) begin
        if (~axi_aresetn) begin
            cache_waddr <= 15'b0;
            cache_wdata <= 32'b0;
            cache_strb <= 4'b0;
            cache_wstart <= 1'b0;
            w_req <= 1'b0;            
        end else begin
            case (axi_wr_state)
                WR_WAIT_ADDR: begin
                    //Do nothing
                end
                // Cache the awaddr and will put to backend later.
                WR_WRITE_ADDR: begin
                    cache_waddr <= axi_awaddr;
                end
                WR_WRITE_DATA: begin
                    // Cache wdata, strb, will put to backend later.
                    cache_wdata <= axi_wdata;
                    cache_strb <= axi_wstrb;
                    
                    //Request to arbiter
                    w_req <= 1'b1;
                end
                WR_WRITE_WAIT_BK: begin
                    if(w_grant == 1'b1) begin
                        if(bk_busy == 1'b0) begin
                            // Clear request
                            w_req <= 1'b0;
                            // To invoke backend interface
                            cache_wstart <= 1'b1;
                        end
                    end
                    if(cache_wdone) begin
                        cache_wstart <= 1'b0;
                    end
                end
            endcase
        end
    end

   // FSM state, combinational logic for write cycle
    always_comb begin
        axi_wr_next_state = axi_wr_state;

        case(axi_wr_state)
            WR_WAIT_ADDR:
                if(axi_awvalid && cc_aa_enable)begin
                    axi_wr_next_state = WR_WRITE_ADDR;
                end
            WR_WRITE_ADDR:
                if(axi_awvalid && axi_awready)begin
                    axi_wr_next_state = WR_WRITE_DATA;
                end
            WR_WRITE_DATA:
                if(axi_wvalid && axi_wready)begin
                    axi_wr_next_state = WR_WRITE_WAIT_BK;
                end
            WR_WRITE_WAIT_BK:
                if(cache_wdone)begin
                    axi_wr_next_state = WR_WAIT_ADDR;
                end                
            default:
                axi_wr_next_state = WR_WAIT_ADDR;
        endcase
    end

    // FSM state, combinational logic, output control for write cycle
    always_comb begin
        axi_awready = 1'b0;
        axi_wready = 1'b0;
        case(axi_wr_state)
            //WR_WAIT_ADDR: // do nothing
            WR_WRITE_ADDR:begin
                axi_awready = 1'b1;
            end
            WR_WRITE_DATA:begin
                axi_wready = 1'b1;
            end
        endcase
    end

    // FSM state, sequential logic, input capture for read cycle
    always_ff @(posedge axi_aclk  or negedge axi_aresetn) begin
        if (~axi_aresetn) begin
            cache_raddr <= 15'b0;
            cache_rstart <= 1'b0;
            r_req <= 1'b0;
        end else begin
            case (axi_rd_state)
                RD_READ_ADDR: begin
                    cache_raddr <= axi_araddr;
                    //Request to arbiter if not grant
                    r_req <= 1'b1;

                end
                RD_READ_DATA: begin
                    if(r_grant == 1'b1) begin
                        if(bk_busy == 1'b0) begin
                            // Clear request
                            r_req <= 1'b0;
                            // To invoke backend interface
                            cache_rstart <= 1'b1;                        
                        end
                    end
                    
                    if(cache_rdone == 1'b1)
                        cache_rstart <= 1'b0;
                end                
            endcase
        end
    end

    // FSM state, combinational logic for read cycle
    always_comb begin
        axi_rd_next_state = axi_rd_state;

        case(axi_rd_state)
            RD_WAIT_ADDR:
                if(axi_arvalid && cc_aa_enable)begin
                    axi_rd_next_state = RD_READ_ADDR;
                end
            RD_READ_ADDR:
                if(axi_arvalid && axi_arready)begin
                    axi_rd_next_state = RD_READ_DATA;
                end
            RD_READ_DATA:
                if(axi_rvalid && axi_rready)begin
                    axi_rd_next_state = RD_WAIT_ADDR;
                end
            default:
                axi_rd_next_state = RD_WAIT_ADDR;
        endcase
    end

    // FSM state, combinational logic, output control for read cycle
    always_comb begin
        axi_arready = 1'b0;
        axi_rvalid = 1'b0;
        axi_rdata = 32'b0;

        case(axi_rd_state)
            //RD_WAIT_ADDR: // do nothing
            RD_READ_ADDR:begin
                axi_arready = 1'b1;
            end
            RD_READ_DATA:begin
                // Waiting for backend interface return the data, then put to output with axi_rvalid assert
                if(cache_rdone == 1'b1) begin
                    axi_rvalid = 1'b1;
                    axi_rdata = cache_rdata;
                end
            end
            //default:
        endcase
    end

    // backend interface, sequential logic
    always_ff@(posedge axi_aclk or negedge axi_aresetn)begin
        if(~axi_aresetn)begin
            cache_wdone <= 1'b0;
            cache_rdone <= 1'b0;
            cache_rdata <= 32'b0;
        end
        else begin

            //When backend return bk_ready with cache_wstart = 1, assert wrdone.
            //wdone is used to change FSM and bk_valid
            if(bk_ready && cache_wstart) begin
                cache_wdone    <= 1;
            end

            //When axi_wr_next_state change to WR_WAIT_ADDR (FSM detect cache_wdone == 1), then clear cache_wdone
            if((axi_wr_state == WR_WRITE_WAIT_BK) && (axi_wr_next_state == WR_WAIT_ADDR)) begin
                cache_wdone <= 0;
            end

            //When backend return bk_ready with cache_rstart = 1, assert cache_rdone and read data.
            //cache_rdone is used to change FSM and bk_valid
            if(bk_ready && cache_rstart) begin
                cache_rdone <= 1;
                cache_rdata <= bk_rdata;
            end
            
            //When axi_rd_next_state change to WR_WAIT_ADDR (FSM detect cache_rdone == 1 &&, axi_rvalid && axi_rready == 1), then clear cache_rdone
            if((axi_rd_state == RD_READ_DATA) && (axi_rd_next_state == RD_WAIT_ADDR)) begin
                cache_rdone <= 0;
            end
        end
    end

    // backend interface, combinational logic
    always_comb begin
        bk_rd_wr = 1'b0;
        bk_valid = 1'b0;
        bk_addr = 15'b0;
        bk_wstrb = 4'b0;
        bk_wdata = 32'b0;

        //Send valid to backend when cache_wstart = 1, and de-assert valid when cache_wdone = 1.
        if((cache_wstart == 1'b1) && (cache_wdone == 1'b0)) begin
            bk_addr = cache_waddr;
            bk_wdata = cache_wdata;
            bk_wstrb = cache_strb;
            bk_rd_wr = 0; //0: Write request
            bk_valid = 1;
        end
        
        //Send valid to backend when cache_rstart = 1, and de-assert valid when cache_rdone = 1.
        if((cache_rstart == 1'b1) && (cache_rdone == 1'b0)) begin
            bk_addr = cache_raddr;
            bk_rd_wr = 1; //1: Read request
            bk_valid = 1;
        end
    end

endmodule


