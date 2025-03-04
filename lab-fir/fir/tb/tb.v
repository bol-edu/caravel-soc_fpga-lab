`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2023 10:38:55 AM
// Design Name: 
// Module Name: fir_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`define Data_Num 400
`define Coef_Num 32

module fir_tb
#(  parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32
)();
    wire                        awready;
    wire                        wready;
    reg                         awvalid;
    reg   [(pADDR_WIDTH-1): 0]  awaddr;
    reg                         wvalid;
    reg signed [(pDATA_WIDTH-1) : 0] wdata;
    wire                        arready;
    reg                         rready;
    reg                         arvalid;
    reg         [(pADDR_WIDTH-1): 0] araddr;
    wire                        rvalid;
    wire signed [(pDATA_WIDTH-1): 0] rdata;
    reg                         ss_tvalid;
    reg signed [(pDATA_WIDTH-1) : 0] ss_tdata;
    reg                         ss_tlast;
    wire                        ss_tready;
    reg                         sm_tready;
    wire                        sm_tvalid;
    wire signed [(pDATA_WIDTH-1) : 0] sm_tdata;
    wire                        sm_tlast;
    reg                         axis_clk;
    reg                         axis_rst_n;

// ram for tap
    wire [3:0]               tap_WE;
    wire                     tap_EN;
    wire [(pDATA_WIDTH-1):0] tap_Di;
    wire [(pADDR_WIDTH-1):0] tap_A;
    wire [(pDATA_WIDTH-1):0] tap_Do;

// ram for data RAM
    wire [3:0]               data_WE;
    wire                     data_EN;
    wire [(pDATA_WIDTH-1):0] data_Di;
    wire [(pADDR_WIDTH-1):0] data_A;
    wire [(pDATA_WIDTH-1):0] data_Do;



    fir fir_DUT(
        .awready(awready),
        .wready(wready),
        .awvalid(awvalid),
        .awaddr(awaddr),
        .wvalid(wvalid),
        .wdata(wdata),
        .arready(arready),
        .rready(rready),
        .arvalid(arvalid),
        .araddr(araddr),
        .rvalid(rvalid),
        .rdata(rdata),
        .ss_tvalid(ss_tvalid),
        .ss_tdata(ss_tdata),
        .ss_tlast(ss_tlast),
        .ss_tready(ss_tready),
        .sm_tready(sm_tready),
        .sm_tvalid(sm_tvalid),
        .sm_tdata(sm_tdata),
        .sm_tlast(sm_tlast),

        // ram for tap
        .tap_WE(tap_WE),
        .tap_EN(tap_EN),
        .tap_Di(tap_Di),
        .tap_A(tap_A),
        .tap_Do(tap_Do),

        // ram for data
        .data_WE(data_WE),
        .data_EN(data_EN),
        .data_Di(data_Di),
        .data_A(data_A),
        .data_Do(data_Do),

        .axis_clk(axis_clk),
        .axis_rst_n(axis_rst_n)

        );
    
    // RAM for tap
    bram32 tap_RAM (
        .CLK(axis_clk),
        .WE(tap_WE),
        .EN(tap_EN),
        .Di(tap_Di),
        .A(tap_A),
        .Do(tap_Do)
    );

    // RAM for data: choose bram11 or bram12
    bram32 data_RAM(
        .CLK(axis_clk),
        .WE(data_WE),
        .EN(data_EN),
        .Di(data_Di),
        .A(data_A),
        .Do(data_Do)
    );
    reg signed [(pDATA_WIDTH-1):0] Din_list[0:(`Data_Num-1)];
    reg signed [(pDATA_WIDTH-1):0] golden_list[0:(`Data_Num-1)];
    reg signed [(pDATA_WIDTH-1):0] coef[0:(`Coef_Num-1)]; // fill in coef 
    `ifdef FSDB
        initial begin
            $fsdbDumpfile("fir.fsdb");
            $fsdbDumpvars("+mda");
        end
    `elsif
        initial begin
            $dumpfile("fir.vcd");
            $dumpvars();
        end
    `endif

    initial begin
        axis_clk = 0;
        forever begin
            #5 axis_clk = (~axis_clk);
        end
    end

    initial begin
        axis_rst_n = 0;
        @(posedge axis_clk); 
        @(posedge axis_clk);
        axis_rst_n = 1;
    end

    reg [31:0]  data_length;
    reg [31:0] coef_length;
    integer Din, golden, coef_in, input_data, golden_data, m, n, coef_data;
    initial begin
        data_length = 0;
        coef_length = 0;
        Din = $fopen("../py/x.dat","r");
        golden = $fopen("../py/y.dat","r");
	    coef_data= $fopen("../py/coef.dat","r");

        for(m=0;m< `Data_Num ;m=m+1) begin
            input_data = $fscanf(Din,"%d", Din_list[m]);
            golden_data = $fscanf(golden,"%d", golden_list[m]);
            data_length = data_length + 1;
        end
        for(n=0;n< `Coef_Num ;n=n+1)  begin 
            coef_in=$fscanf(coef_data,"%d", coef[n]);
            coef_length = coef_length + 1;
        end
    end

    integer i;
    initial begin
        $display("------------Start simulation-----------");
        ss_tvalid = 0;
        $display("----Start the data input(AXI-Stream)----");
        for(i=0;i<(data_length-1);i=i+1) begin
            ss_tlast = 0; axi_stream_master(Din_list[i]);
        end
        config_read_check(12'h00, 32'h00, 32'h0000_0002); // check idle = 0
        ss_tlast = 1; axi_stream_master(Din_list[(`Data_Num - 1)]);
        $display("------End the data input(AXI-Stream)------");
    end
    reg error_coef;
    integer k,l;
     reg error;
    reg status_error;
    initial begin
        wait(axis_rst_n==0);
        wait(axis_rst_n==1);
        error = 0; status_error = 0;
        sm_tready = 0;
        for(l=0;l < data_length;l=l+1) begin
            sm(golden_list[l],l);
        end
        config_read_check(12'h00, 32'h02, 32'h0000_0002); // check ap_done = 1 (0x00 [bit 1])
        config_read_check(12'h00, 32'h04, 32'h0000_0004); // check ap_idle = 1 (0x00 [bit 2])
        if (error == 0 & error_coef == 0) begin
            $display("---------------------------------------------");
            $display("-----------Congratulations! Pass-------------");
        end
        else begin
            $display("--------Simulation Failed---------");
        end
        $finish;
    end

    //Prevent hang
    // integer timeout = (1000000);
    // initial begin
    //     while(timeout > 0) begin
    //         @(posedge axis_clk);
    //         timeout = timeout - 1;
    //     end
    //     $display($time, "Simualtion Hang ....");
    //     $finish;
    // end

    initial begin
        arvalid=0;
        rready=0;
        error_coef = 0;
        $display("----Start the coefficient input(AXI-lite)----");
        config_write(12'h10, data_length);
        config_write(12'h14, coef_length);
        for(k=0; k< `Coef_Num; k=k+1) begin
            config_write(12'h80+4*k, coef[k]);
        end
        awvalid <= 0; wvalid <= 0;
        // read-back and check
        $display(" Check Coefficient ...");
        for(k=0; k < `Coef_Num; k=k+1) begin
            config_read_check(12'h80+4*k, coef[k], 32'hffffffff);
        end
        arvalid <= 0;
        $display(" Tape programming done ...");
        $display(" Start FIR");
        @(posedge axis_clk) config_write(12'h00, 32'h0000_0001);    // ap_start = 1
        $display("----End the coefficient input(AXI-lite)----");
        //$finish;
    end

    task config_write;
        input [11:0]    addr;
        input [31:0]    data;
        begin
            @(posedge axis_clk);
            awvalid <= 1; awaddr <= addr;
            wvalid  <= 1; wdata <= data;
            fork
                begin
                    while (!awready) @(posedge axis_clk);
                    awvalid<=0;
		    awaddr<=0;
                end
                begin
                    while (!wready) @(posedge axis_clk);
                    wvalid<=0;                    
                    wdata<=0;
                end
            join 
		@(posedge axis_clk);
        end
    endtask

    task config_read_check;
        input [11:0]        addr;
        input signed [31:0] exp_data;
        input [31:0]        mask;
        begin
            @(posedge axis_clk);
            arvalid <= 1; araddr <= addr;
            rready <= 1;
            fork 
                begin
                    while (!arready) @(posedge axis_clk);
                    arvalid<=0;
		    araddr<=0;
                end
                begin
                    while (!rvalid) @(posedge axis_clk);
                    if( (rdata & mask) != (exp_data & mask)) begin
                        $display("ERROR: exp = %d, rdata = %d", exp_data, rdata);
                        error_coef <= 1;
                    end else begin
                        $display("OK: exp = %d, rdata = %d", exp_data, rdata);
                    end
                    rready<=0;                
                end
            join 
		@(posedge axis_clk);
        end
    endtask



    task axi_stream_master;
        input  signed [31:0] in1;
        begin
            @(posedge axis_clk)
            ss_tvalid <= 1;
            ss_tdata  <= in1;
            while (!ss_tready) @(posedge axis_clk);
            ss_tvalid <= 0;
        end
    endtask

    task sm;
        input   signed [31:0] in2; // golden data
        input         [31:0] pcnt; // pattern count
        begin
            @(posedge axis_clk) 
            sm_tready <= 1;
            while(!sm_tvalid) @(posedge axis_clk);
            sm_tready <=0;
            if (sm_tdata != in2) begin
                $display("[ERROR] [Pattern %d] Golden answer: %d, Your answer: %d", pcnt, in2, sm_tdata);
                error <= 1;
            end
            else begin
                $display("[PASS] [Pattern %d] Golden answer: %d, Your answer: %d", pcnt, in2, sm_tdata);
            end
        end
    endtask
endmodule

