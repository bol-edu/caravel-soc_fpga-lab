///////////////////////////////////////////////////////////////////////////////
//
//       MODULE: axilite_master
//       AUTHOR: zack
// ORGANIZATION: fsic
//      CREATED: 2023/05/16
///////////////////////////////////////////////////////////////////////////////

module axilite_master(
    // backend source to trigger the axilite master transaction
    input wire bk_wstart,
    input wire [31:0] bk_waddr,
    input wire [31:0] bk_wdata,
    input wire [3:0]  bk_wstrb,
    output logic bk_wdone,
    input wire bk_rstart,
    input wire [31:0] bk_raddr,
    output logic [31:0] bk_rdata,
    output logic bk_rdone,

    // frontend - axilite master
    input wire axi_aclk,
    input wire axi_aresetn,
    output logic axi_awvalid,
    output logic [31:0] axi_awaddr,
    output logic axi_wvalid,
    output logic [31:0] axi_wdata,
    output logic [3:0] axi_wstrb,
    output logic axi_arvalid,
    output logic [31:0] axi_araddr,
    output logic axi_rready,
    input wire [31:0] axi_rdata,
    input wire axi_awready,
    input wire axi_wready,
    input wire axi_arready,
    input wire axi_rvalid
);

    // backend interface
    // aclk      _/-\_/-\_/-\_/-\_/-\_/-\
    // bk_wstart _____/-\________________
    // bk_waddr  _____/x\________________
    // bk_wdata  _____XX_________________
    // bk_wstrb  _____XX_________________
    // bk_wdone  _____________/-\________
    // bk_rstart _________/-\____________
    // bk_raddr  _________/x\____________
    // bk_rdata  _________________XX_____
    // bk_rdone  _________________/-\____

    logic wr_addr_go, rd_addr_go;
    logic [31:0] cache_waddr, cache_raddr;
    logic [31:0] cache_wdata;
    logic [3:0]  cache_strb;
    logic cache_wstart, cache_rstart;

    // FSM state
    enum logic [2:0] {WR_WAIT_ADDR, WR_WRITE_ADDR, WR_WRITE_DATA} axi_wr_state, axi_wr_next_state;
    enum logic [2:0] {RD_WAIT_ADDR, RD_READ_ADDR, RD_DRIVE_RDY, RD_READ_DATA}   axi_rd_state, axi_rd_next_state;

    // FSM state, sequential logic
    always_ff@(posedge axi_aclk or negedge axi_aresetn)begin
        if(~axi_aresetn)begin
            axi_wr_state <= WR_WAIT_ADDR;
            axi_rd_state <= RD_WAIT_ADDR;
        end
        else begin
            axi_wr_state <= axi_wr_next_state;
            axi_rd_state <= axi_rd_next_state;
        end
    end

    // FSM state, combinational logic
    always_comb begin
        axi_wr_next_state = axi_wr_state;

        case(axi_wr_state)
            WR_WAIT_ADDR:
                if(wr_addr_go)begin
                    axi_wr_next_state = WR_WRITE_ADDR;
                end
            WR_WRITE_ADDR:
                if(axi_awvalid && axi_awready)begin
                    axi_wr_next_state = WR_WRITE_DATA;
                end
            WR_WRITE_DATA:
                if(axi_wvalid && axi_wready)begin
                    axi_wr_next_state = WR_WAIT_ADDR;
                end
            default:
                axi_wr_next_state = WR_WAIT_ADDR;
        endcase
    end

    // FSM state, combinational logic, output control
    always_comb begin
        //axi_awvalid = 1'b0;
        //axi_awaddr = 32'b0;
        //axi_wvalid = 1'b0;
        //axi_wdata = 32'b0;
        //axi_wstrb = 4'b0;

        case(axi_wr_state)
            //WR_WAIT_ADDR: // do nothing
            WR_WRITE_ADDR:begin
                axi_awvalid = 1'b1;
                axi_awaddr = cache_waddr;
                axi_wvalid = 1'b0;
                axi_wdata = 32'b0;
                axi_wstrb = 4'b0;
            end
            WR_WRITE_DATA:begin
                axi_wvalid = 1'b1;
                axi_wdata = cache_wdata;
                axi_wstrb = cache_strb;
                axi_awvalid = 1'b0;
                axi_awaddr = 32'b0;
            end
            default: begin
                axi_awvalid = 1'b0;
                axi_awaddr = 32'b0;
                axi_wvalid = 1'b0;
                axi_wdata = 32'b0;
                axi_wstrb = 4'b0;
            end
        endcase
    end

    // FSM state, combinational logic
    always_comb begin
        axi_rd_next_state = axi_rd_state;

        case(axi_rd_state)
            RD_WAIT_ADDR:
                if(rd_addr_go)begin
                    axi_rd_next_state = RD_READ_ADDR;
                end
            RD_READ_ADDR:
                if(axi_arvalid && axi_arready)begin
                    axi_rd_next_state = RD_DRIVE_RDY;
                end
            RD_DRIVE_RDY:
                if(axi_rvalid && axi_rready)begin
                    axi_rd_next_state = RD_READ_DATA;
                end
            RD_READ_DATA: axi_rd_next_state = RD_WAIT_ADDR;
            default:
                axi_rd_next_state = RD_WAIT_ADDR;
        endcase
    end

    // FSM state, combinational logic, output control
    always_comb begin
        //axi_arvalid = 1'b0;
        //axi_araddr = 32'b0;
        //axi_rready = 1'b0;

        case(axi_rd_state)
            //RD_WAIT_ADDR: // do nothing
            RD_READ_ADDR:begin
                axi_arvalid = 1'b1;
                axi_araddr = cache_raddr;
                axi_rready = 1'b0;
            end
            RD_DRIVE_RDY:begin
                axi_rready = 1'b1;
                axi_arvalid = 1'b0;
                axi_araddr = 32'b0;
            end
            RD_READ_DATA:begin
                axi_rready = 1'b0;
                axi_arvalid = 1'b0;
                axi_araddr = 32'b0;
            end
            default: begin
                axi_arvalid = 1'b0;
                axi_araddr = 32'b0;
                axi_rready = 1'b0;
            end
        endcase
    end

    // FSM state, sequential logic, input capture
    always_ff@(posedge axi_aclk or negedge axi_aresetn)begin
        if(~axi_aresetn)begin
            bk_rdata <= 32'h0;
        end
        else if(axi_rd_next_state == RD_READ_DATA)begin
            bk_rdata <= axi_rdata;
        end
    end

    // backend interface, sequential logic
    always_ff@(posedge axi_aclk or negedge axi_aresetn)begin
        if(~axi_aresetn)begin
            cache_waddr <= 32'h0;
            cache_wdata <= 32'h0;
            cache_strb <= 4'h0;
            cache_wstart <= 1'b0;
            cache_raddr <= 32'h0;
            cache_rstart <= 1'b0;
        end
        else begin
            if(bk_wstart == 1'b1)begin
                cache_waddr <= bk_waddr;
                cache_wdata <= bk_wdata;
                cache_strb <= bk_wstrb;
                cache_wstart <= 1'b1;
            end
            if((axi_wr_state == WR_WRITE_DATA) && (axi_wr_next_state == WR_WAIT_ADDR))begin
                cache_wstart <= 1'b0;
            end
            if(bk_rstart == 1'b1)begin
                cache_raddr <= bk_raddr;
                cache_rstart <= 1'b1;
            end
            if(axi_rd_next_state == RD_READ_DATA)begin
                cache_rstart <= 1'b0;
            end
        end
    end
    
    // backend interface, combinational logic
    always_comb begin
        //wr_addr_go = 1'b0;
        //bk_wdone = 1'b0;
        //rd_addr_go = 1'b0;
        //bk_rdone = 1'b0;

        if((cache_wstart == 1'b1) && (axi_wr_state == WR_WAIT_ADDR))begin
            wr_addr_go = 1'b1;
        end
        else
            wr_addr_go = 1'b0;
        if((axi_wr_state == WR_WRITE_DATA) && (axi_wr_next_state == WR_WAIT_ADDR))begin
            bk_wdone = 1'b1;
        end
        else
            bk_wdone = 1'b0;
        if((cache_rstart == 1'b1) && (axi_rd_state == RD_WAIT_ADDR))begin
            rd_addr_go = 1'b1;
        end
        else
            rd_addr_go = 1'b0;
        if((axi_rd_state == RD_READ_DATA) && (axi_rd_next_state == RD_WAIT_ADDR))begin
            bk_rdone = 1'b1;
        end
        else
            bk_rdone = 1'b0;
    end

endmodule
