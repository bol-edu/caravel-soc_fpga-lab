module WB_to_AXI #(
    parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32,
    parameter DELAYS=10,
    parameter DATA_LENGTH=64
)(
    // WB interface
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output reg wbs_ack_o,
    output reg [31:0] wbs_dat_o,

    // AXI-Lite interface
    input  wire                     awready,
    input  wire                     wready,
    output   reg                     awvalid,
    output   reg [(pADDR_WIDTH-1):0] awaddr,
    output   reg                     wvalid,
    output   reg [(pDATA_WIDTH-1):0] wdata,
    input  wire                     arready,
    output   reg                     rready,
    output   reg                     arvalid,
    output   reg [(pADDR_WIDTH-1):0] araddr,
    input  wire                     rvalid,
    input  wire [(pDATA_WIDTH-1):0] rdata, 

    // AXI-Stream interface
    // Data in
    output   reg                     ss_tvalid, 
    output   reg [(pDATA_WIDTH-1):0] ss_tdata, 
    output   reg                     ss_tlast, 
    input  wire                     ss_tready, 
    // Data out
    output   reg                     sm_tready, 
    input  wire                     sm_tvalid, 
    input  wire [(pDATA_WIDTH-1):0] sm_tdata, 
    input  wire                     sm_tlast
);

/*=awready
=wready
awvalid=
awaddr=
wvalid=
wdata=
=arready
rready=
arvalid=
araddr=
=rvalid
=rdata

ss_tvalid=
ss_tdata=
ss_tlast=
=ss_tready

sm_tready=
=sm_tvalid
=sm_tdata
=sm_tlast*/

/*assign =awready;
assign =wready;
assign awvalid=axi_awvalid;
assign awaddr=axi_waddr;
assign wvalid=axi_wvalid;
assign wdata=axi_wdata;
assign =arready;
assign rready=;
assign arvalid=;
assign araddr=axi_raddr;
assign axi_rvalid=rvalid;
assign axi_rdata=rdata;

assign ss_tvalid=ss_tvalid;
assign ss_tdata=ss_tdata;
assign ss_tlast=;
assign =ss_tready;

assign sm_tready=sm_tready;
assign sm_tvalid=sm_tvalid;
assign sm_tdata=sm_tdata;
assign =sm_tlast;*/

reg AXI_Lite_valid;
reg AXI_ss_valid;
reg AXI_sm_valid;

always @* begin
    if(wbs_cyc_i && wbs_stb_i && (wbs_adr_i[7:0] <= 8'h7F)) begin
        AXI_Lite_valid=1;
    end
    else begin
        AXI_Lite_valid=0;
    end
    if(wbs_cyc_i && wbs_stb_i && (wbs_adr_i[7:0] == 8'h80)) begin
        AXI_ss_valid=1;
    end
    else begin
        AXI_ss_valid=0;
    end
    if(wbs_cyc_i && wbs_stb_i && (wbs_adr_i[7:0] == 8'h84)) begin
        AXI_sm_valid=1;
    end
    else begin
        AXI_sm_valid=0;
    end
end

////////////////////////// For debugging //////////////////////////
wire debug;
//assign debug = wbs_cyc_i && wbs_stb_i && (wbs_adr_i[7:0] == 8'h84);
//assign debug = wbs_cyc_i && wbs_stb_i && (wbs_adr_i[31:20] == 12'h300);
assign debug = wbs_cyc_i && wbs_stb_i && (wbs_adr_i[31:20] == 12'h300) && (wbs_adr_i[7:0] == 8'h00);

wire debug_ss;
wire debug_sm;
assign debug_ss = wbs_cyc_i && wbs_stb_i && (wbs_adr_i[31:20] == 12'h300) && (wbs_adr_i[7:0] == 8'h80);
assign debug_sm = wbs_cyc_i && wbs_stb_i && (wbs_adr_i[31:20] == 12'h300) && (wbs_adr_i[7:0] == 8'h84);

///////////////////////////////////////////////////////////////////

/////wire wbs_ack_o_before_FF;
/////wire [31:0] wbs_dat_o_before_FF;

/////assign wbs_ack_o_before_FF=wbs_ack_Lite_before_FF;
/////assign wbs_dat_o_before_FF=wbs_dat_Lite_before_FF;

//assign wbs_ack_o=wbs_ack_Lite;
//assign wbs_dat_o=wbs_dat_Lite;

always @* begin
    if(wbs_cyc_i && wbs_stb_i && (wbs_adr_i[7:0] <= 8'h7F)) begin
        wbs_ack_o=wbs_ack_Lite;
        wbs_dat_o=wbs_dat_Lite;
    end
    else if(wbs_cyc_i && wbs_stb_i && (wbs_adr_i[7:0] == 8'h80)) begin
        wbs_ack_o=wbs_ack_Stream_ss;
        wbs_dat_o=wbs_dat_Stream_ss;
    end
    else if(wbs_cyc_i && wbs_stb_i && (wbs_adr_i[7:0] == 8'h84)) begin
        wbs_ack_o=wbs_ack_Stream_sm;
        wbs_dat_o=wbs_dat_Stream_sm;
    end
    else begin
        wbs_ack_o=0;
        wbs_dat_o=0;
    end
end

localparam Lite_IDLE = 3'd0, Lite_WRITE = 3'd1, Lite_READ = 3'd2, Lite_WAIT_FOR_COUNTER = 3'd3, Lite_ACK = 3'd4;

reg wbs_ack_Lite;
reg wbs_ack_Lite_before_FF;
reg [31:0] wbs_dat_Lite;
reg [31:0] wbs_dat_Lite_before_FF;
reg awvalid_before_FF;
reg [(pADDR_WIDTH-1):0] awaddr_before_FF;
reg wvalid_before_FF;
reg [(pDATA_WIDTH-1):0] wdata_before_FF;
reg arvalid_before_FF;
reg [(pADDR_WIDTH-1):0] araddr_before_FF;
reg rready_before_FF;

reg [2:0] state_Lite;
reg [2:0] next_state_Lite;
reg [15:0] delay_counter;
reg [15:0] next_delay_counter;

reg [1:0] Yn_valid_Xn_ready; // original name is "Xn_ready_Yn_valid", but it's confusing
reg [1:0] next_Yn_valid_Xn_ready;



always @* begin
    case(state_Lite)
        Lite_IDLE: begin
            wbs_ack_Lite_before_FF=0;
            wbs_dat_Lite_before_FF=0;
            
            awaddr_before_FF=wbs_adr_i[11:0];
            araddr_before_FF=wbs_adr_i[11:0];

            if(AXI_Lite_valid==1) begin
                if(wbs_we_i) begin
                    next_state_Lite=Lite_WRITE;
                    awvalid_before_FF=1;
                    wvalid_before_FF=1;
                    if(wbs_adr_i[11:0]==12'h000) begin
                        wdata_before_FF={29'd0,wbs_dat_i[2:0]};
                        //next_Yn_valid_Xn_ready=wbs_dat_i[5:4]; // read only
                    end
                    else begin
                        wdata_before_FF=wbs_dat_i;
                    end
                    
                    arvalid_before_FF=0;
                    ///araddr_before_FF=0;
                    rready_before_FF=0;
                end
                else begin
                    next_state_Lite=Lite_READ;
                    awvalid_before_FF=0;
                    wvalid_before_FF=0;
                    wdata_before_FF=wbs_dat_i;
                    arvalid_before_FF=1;
                    //araddr_before_FF=1;
                    rready_before_FF=0;
                end

                next_delay_counter=delay_counter+1;
            end
            else begin
                next_state_Lite=Lite_IDLE;
                awvalid_before_FF=0;
                wvalid_before_FF=0;
                wdata_before_FF=wbs_dat_i;
                arvalid_before_FF=0;
                //araddr_before_FF=0;
                rready_before_FF=0;
                next_delay_counter=0;
            end
        end
        Lite_WRITE: begin
            wbs_dat_Lite_before_FF=0;
            awaddr_before_FF=wbs_adr_i[11:0];
            arvalid_before_FF=0;
            araddr_before_FF=wbs_adr_i[11:0];;
            rready_before_FF=0;

            if(awvalid & wvalid & awready & wready) begin    /////// Write coefficient & ap ///////
                if(delay_counter >= DELAYS) begin
                    next_state_Lite=Lite_ACK;
                    wbs_ack_Lite_before_FF=1;
                    next_delay_counter=0;
                end
                else begin
                    next_state_Lite=Lite_WAIT_FOR_COUNTER;
                    wbs_ack_Lite_before_FF=0;
                    next_delay_counter=delay_counter+1;
                end
                awvalid_before_FF=0;
                wvalid_before_FF=0;
                wdata_before_FF=0;
                
            end
            else begin
                next_state_Lite=Lite_WRITE;
                wbs_ack_Lite_before_FF=0;
                awvalid_before_FF=1;
                wvalid_before_FF=1;
                wdata_before_FF=wdata;
                next_delay_counter=delay_counter+1;
            end
        end
        Lite_READ: begin
            awvalid_before_FF=0;
            awaddr_before_FF=wbs_adr_i[11:0];
            wvalid_before_FF=0;
            wdata_before_FF=0;

            if(arvalid & arready) begin     /////// Read coefficient & ap ///////
                next_state_Lite=Lite_READ;
                wbs_ack_Lite_before_FF=0;
                wbs_dat_Lite_before_FF=0;
                arvalid_before_FF=0;
                araddr_before_FF=wbs_adr_i[11:0];
                rready_before_FF=1;
                next_delay_counter=delay_counter+1;
            end
            else if(rvalid & rready) begin
                arvalid_before_FF=0;
                araddr_before_FF=wbs_adr_i[11:0];
                rready_before_FF=0;
                
                if(delay_counter >= DELAYS) begin
                    next_state_Lite=Lite_ACK;
                    wbs_ack_Lite_before_FF=1;
                    next_delay_counter=0;
                end
                else begin
                    next_state_Lite=Lite_WAIT_FOR_COUNTER;
                    wbs_ack_Lite_before_FF=0;
                    next_delay_counter=delay_counter+1;
                end

                if(wbs_adr_i[11:0]==12'h000) begin
                    wbs_dat_Lite_before_FF={26'd0,Yn_valid_Xn_ready,1'b0,rdata[2:0]};
                end
                else begin
                    wbs_dat_Lite_before_FF=rdata;
                end
            end
            else begin
                next_state_Lite=Lite_READ;
                wbs_ack_Lite_before_FF=0;
                wbs_dat_Lite_before_FF=0;
                arvalid_before_FF=arvalid;
                araddr_before_FF=wbs_adr_i[11:0];
                rready_before_FF=rready;
                next_delay_counter=delay_counter+1;
            end
        end
        Lite_WAIT_FOR_COUNTER: begin
            awvalid_before_FF=0;
            awaddr_before_FF=wbs_adr_i[11:0];
            wvalid_before_FF=0;
            wdata_before_FF=0;
            arvalid_before_FF=0;
            araddr_before_FF=wbs_adr_i[11:0];;
            rready_before_FF=0;

            if(delay_counter >= DELAYS) begin
                next_state_Lite=Lite_ACK;
                wbs_ack_Lite_before_FF=1;
                wbs_dat_Lite_before_FF=wbs_dat_Lite;
                next_delay_counter=0;
            end
            else begin
                next_state_Lite=Lite_WAIT_FOR_COUNTER;
                wbs_ack_Lite_before_FF=0;
                wbs_dat_Lite_before_FF=wbs_dat_Lite;
                next_delay_counter=delay_counter+1;
            end
        end
        Lite_ACK: begin
            next_state_Lite=Lite_IDLE;
            wbs_ack_Lite_before_FF=0;
            wbs_dat_Lite_before_FF=wbs_dat_Lite;
            
            awvalid_before_FF=0;
            awaddr_before_FF=wbs_adr_i[11:0];
            wvalid_before_FF=0;
            wdata_before_FF=0;
            arvalid_before_FF=0;
            araddr_before_FF=wbs_adr_i[11:0];;
            rready_before_FF=0;

            next_delay_counter=0;
        end
        default:begin
            /*next_state_Lite=
            wbs_ack_Lite_before_FF=
            wbs_dat_Lite_before_FF=

            awvalid_before_FF=
            awaddr_before_FF=
            wvalid_before_FF=
            wdata_before_FF=
            arvalid_before_FF=
            araddr_before_FF=
            rready_before_FF=

            //next_Yn_valid_Xn_ready=
            next_delay_counter=*/

            next_state_Lite=Lite_IDLE;
            wbs_ack_Lite_before_FF=0;
            wbs_dat_Lite_before_FF=0;

            awvalid_before_FF=0;
            awaddr_before_FF=wbs_adr_i[11:0];
            wvalid_before_FF=0;
            wdata_before_FF=0;
            arvalid_before_FF=0;
            araddr_before_FF=wbs_adr_i[11:0];;
            rready_before_FF=0;

            next_delay_counter=0;

        end
    endcase
end

always@(posedge wb_clk_i) begin
    if(wb_rst_i) begin // positive reset
        state_Lite <= Lite_IDLE;
        wbs_ack_Lite <= 0;
        wbs_dat_Lite <= 0;
        awvalid <= 0;
        awaddr <= 0;
        wvalid <= 0;
        wdata <= 0;
        arvalid <= 0;
        araddr <= 0;
        rready <= 0;
        delay_counter <= 0;
        //Yn_valid_Xn_ready <= 0;
    end
    else begin
        state_Lite <= next_state_Lite;
        wbs_ack_Lite <= wbs_ack_Lite_before_FF;
        wbs_dat_Lite <= wbs_dat_Lite_before_FF;
        awvalid <= awvalid_before_FF;
        awaddr <= awaddr_before_FF;
        wvalid <= wvalid_before_FF;
        wdata <= wdata_before_FF;
        arvalid <= arvalid_before_FF;
        araddr <= araddr_before_FF;
        rready <= rready_before_FF;
        delay_counter <= next_delay_counter;
        //Yn_valid_Xn_ready <= next_Yn_valid_Xn_ready;
    end
end














/////////////////////////////////////// AXI Stream (ss) for x[n] ///////////////////////////////////////
localparam Stream_ss_IDLE = 3'd0, /*Stream_ss_WRITE_BUFFER = 3'd1, */Stream_ss_FEED_FIR = 3'd3, Stream_ss_WAIT_FOR_COUNTER = 3'd1, Stream_ss_ACK = 3'd2;

reg wbs_ack_Stream_ss;
reg wbs_ack_Stream_ss_before_FF;
reg [31:0] wbs_dat_Stream_ss;
reg [31:0] wbs_dat_Stream_ss_before_FF;

reg ss_tvalid_before_FF;
reg [(pDATA_WIDTH-1):0] ss_tdata_before_FF;
reg ss_tlast_before_FF;

reg [2:0] state_Stream_ss;
reg [2:0] next_state_Stream_ss;
reg [15:0] delay_counter_Stream_ss;
reg [15:0] next_delay_counter_Stream_ss;

reg [(pDATA_WIDTH-1):0] input_x_buffer;
reg [(pDATA_WIDTH-1):0] next_input_x_buffer;
reg [31:0] input_number_counter; // same size as data_length
reg [31:0] next_input_number_counter;


always @* begin
    wbs_dat_Stream_ss_before_FF=0;

    case(state_Stream_ss)
        Stream_ss_IDLE: begin // input_x_buffer is out-of-date / has been used
            wbs_ack_Stream_ss_before_FF=0;
            //wbs_dat_Stream_ss_before_FF=0;
            ss_tvalid_before_FF=0;
            ss_tdata_before_FF=0;
            ss_tlast_before_FF=0;
            next_Yn_valid_Xn_ready[0]=1;
            next_input_number_counter=input_number_counter;

            if(AXI_ss_valid==1) begin
                next_state_Stream_ss=Stream_ss_WAIT_FOR_COUNTER;

                //ss_tvalid_before_FF=1;
                //ss_tdata_before_FF=wbs_dat_i;
                //if(input_number_counter==DATA_LENGTH-1) begin
                //    ss_tlast_before_FF=1;
                //end
                //else begin
                //    ss_tlast_before_FF=0;
                //end

                //next_Yn_valid_Xn_ready[0]=0;
                next_input_x_buffer=wbs_dat_i;
                next_delay_counter_Stream_ss=delay_counter_Stream_ss+1;
                //next_input_number_counter=input_number_counter+1;
            end
            else begin
                next_state_Stream_ss=Stream_ss_IDLE;

                //ss_tvalid_before_FF=0;
                //ss_tdata_before_FF=0;
                //ss_tlast_before_FF=0;

                //next_Yn_valid_Xn_ready[0]=1;
                next_input_x_buffer=0;
                next_delay_counter_Stream_ss=0;
                //next_input_number_counter=input_number_counter;
            end
        end
        Stream_ss_WAIT_FOR_COUNTER: begin
            ss_tvalid_before_FF=0;
            ss_tdata_before_FF=0;
            ss_tlast_before_FF=0;
            //next_Yn_valid_Xn_ready[0]=1;
            next_input_x_buffer=input_x_buffer;
            next_delay_counter_Stream_ss=0;
            next_input_number_counter=input_number_counter;
            
            if(delay_counter_Stream_ss == DELAYS) begin
                next_state_Stream_ss=Stream_ss_ACK;
                wbs_ack_Stream_ss_before_FF=1;
                next_delay_counter_Stream_ss=0;
                next_Yn_valid_Xn_ready[0]=0;
            end
            else begin
                next_state_Stream_ss=Stream_ss_WAIT_FOR_COUNTER;
                wbs_ack_Stream_ss_before_FF=0;
                next_delay_counter_Stream_ss=delay_counter_Stream_ss+1;
                next_Yn_valid_Xn_ready[0]=1;
            end
        end
        Stream_ss_ACK: begin
            next_state_Stream_ss=Stream_ss_FEED_FIR;
            wbs_ack_Stream_ss_before_FF=0;
            ss_tvalid_before_FF=1;
            ss_tdata_before_FF=input_x_buffer;

            if(input_number_counter==DATA_LENGTH-1) begin
                ss_tlast_before_FF=1;
                next_input_number_counter=0;
            end
            else begin
                ss_tlast_before_FF=0;
                next_input_number_counter=input_number_counter+1;
            end

            next_Yn_valid_Xn_ready[0]=0;
            next_input_x_buffer=input_x_buffer;
            next_delay_counter_Stream_ss=0;
            //next_input_number_counter=input_number_counter+1;
        end
        Stream_ss_FEED_FIR: begin
            wbs_ack_Stream_ss_before_FF=0;
            next_input_number_counter=input_number_counter;
            next_delay_counter_Stream_ss=0;

            if(ss_tvalid & ss_tready) begin
                next_state_Stream_ss=Stream_ss_IDLE;
                ss_tvalid_before_FF=0;
                ss_tdata_before_FF=0;
                ss_tlast_before_FF=0;
                next_Yn_valid_Xn_ready[0]=1;
                next_input_x_buffer=0;
            end
            else begin
                next_state_Stream_ss=Stream_ss_FEED_FIR;
                ss_tvalid_before_FF=1;
                ss_tdata_before_FF=input_x_buffer;
                ss_tlast_before_FF=ss_tlast;
                next_Yn_valid_Xn_ready[0]=0;
                next_input_x_buffer=input_x_buffer;
            end
        end
       
        default:begin
            next_state_Stream_ss=Stream_ss_IDLE;
            wbs_ack_Stream_ss_before_FF=0;
            //wbs_dat_Stream_ss_before_FF=0;

            ss_tvalid_before_FF=0;
            ss_tdata_before_FF=0;
            ss_tlast_before_FF=0;

            next_Yn_valid_Xn_ready[0]=0;
            next_input_x_buffer=0;
            next_delay_counter_Stream_ss=0;
            next_input_number_counter=0;
        end
    endcase
end

//always @* begin
    /*if(state_Stream_ss==Stream_ss_IDLE) begin
        next_delay_counter_Stream_ss=1;
    end
    else begin
        next_delay_counter_Stream_ss=delay_counter_Stream_ss+1;
    end

    if(delay_counter_Stream_ss == DELAYS) begin
        wbs_ack_Stream_ss_before_FF=1;
    end
    else begin
        wbs_ack_Stream_ss_before_FF=0;
    end*/

//    wbs_dat_Stream_ss_before_FF=0;
//end

always@(posedge wb_clk_i) begin
    if(wb_rst_i) begin // positive reset
        state_Stream_ss <= Stream_ss_IDLE;
        wbs_ack_Stream_ss <= 0;
        wbs_dat_Stream_ss <= 0;
        ss_tvalid <= 0;
        ss_tdata <= 0;
        ss_tlast <= 0;
        delay_counter_Stream_ss <= 0;
        Yn_valid_Xn_ready[0] <= 0;
        input_x_buffer <= 0;
        input_number_counter <= 0;
    end
    else begin
        state_Stream_ss <= next_state_Stream_ss;
        wbs_ack_Stream_ss <= wbs_ack_Stream_ss_before_FF;
        wbs_dat_Stream_ss <= wbs_dat_Stream_ss_before_FF;
        ss_tvalid <= ss_tvalid_before_FF;
        ss_tdata <= ss_tdata_before_FF;
        ss_tlast <= ss_tlast_before_FF;
        delay_counter_Stream_ss <= next_delay_counter_Stream_ss;
        Yn_valid_Xn_ready[0] <= next_Yn_valid_Xn_ready[0];
        input_x_buffer <= next_input_x_buffer;
        input_number_counter <= next_input_number_counter;
    end
end














/////////////////////////////////////// AXI Stream (sm) for y[n] ///////////////////////////////////////
localparam /*Stream_sm_IDLE = 3'd0, */Stream_sm_WRITE_BUFFER = 3'd0, Stream_sm_WB_OUTPUT = 3'd1, Stream_sm_WAIT_FOR_COUNTER = 3'd2, Stream_sm_ACK = 3'd3;

reg wbs_ack_Stream_sm;
reg wbs_ack_Stream_sm_before_FF;
reg [31:0] wbs_dat_Stream_sm;
reg [31:0] wbs_dat_Stream_sm_before_FF;

reg sm_tready_before_FF;

reg [2:0] state_Stream_sm;
reg [2:0] next_state_Stream_sm;
reg [15:0] delay_counter_Stream_sm;
reg [15:0] next_delay_counter_Stream_sm;

reg [(pDATA_WIDTH-1):0] output_y_buffer;
reg [(pDATA_WIDTH-1):0] next_output_y_buffer;


always @* begin
    case(state_Stream_sm)
        Stream_sm_WRITE_BUFFER: begin // output_y_buffer is out-of-date / has been given out
            next_delay_counter_Stream_sm=0;
            wbs_ack_Stream_sm_before_FF=0;

            if(sm_tvalid & sm_tready) begin
                next_state_Stream_sm=Stream_sm_WB_OUTPUT;
                sm_tready_before_FF=0;
                next_Yn_valid_Xn_ready[1]=1;
                next_output_y_buffer=sm_tdata;
            end
            else begin
                next_state_Stream_sm=Stream_sm_WRITE_BUFFER;
                sm_tready_before_FF=1;
                next_Yn_valid_Xn_ready[1]=0;
                next_output_y_buffer=0;
            end
        end
        Stream_sm_WB_OUTPUT: begin
            sm_tready_before_FF=0;
            next_Yn_valid_Xn_ready[1]=1;
            next_output_y_buffer=output_y_buffer;
            wbs_ack_Stream_sm_before_FF=0;

            if(AXI_sm_valid==1) begin
                next_state_Stream_sm=Stream_sm_WAIT_FOR_COUNTER;
                next_delay_counter_Stream_sm=delay_counter_Stream_sm+1;
            end
            else begin
                next_state_Stream_sm=Stream_sm_WB_OUTPUT;
                next_delay_counter_Stream_sm=0;
            end
        end
        Stream_sm_WAIT_FOR_COUNTER: begin
            sm_tready_before_FF=0;
            next_Yn_valid_Xn_ready[1]=1;
            next_output_y_buffer=output_y_buffer;

           if(delay_counter_Stream_sm == DELAYS) begin
                next_state_Stream_sm=Stream_sm_ACK;
                wbs_ack_Stream_sm_before_FF=1;
                next_delay_counter_Stream_sm=0;
            end
            else begin
                next_state_Stream_sm=Stream_sm_WAIT_FOR_COUNTER;
                wbs_ack_Stream_sm_before_FF=0;
                next_delay_counter_Stream_sm=delay_counter_Stream_sm+1;
            end
        end
        Stream_sm_ACK: begin
            next_state_Stream_sm=Stream_sm_WRITE_BUFFER;
            wbs_ack_Stream_sm_before_FF=0;
            sm_tready_before_FF=1;
            next_Yn_valid_Xn_ready[1]=0;
            next_output_y_buffer=0;
            next_delay_counter_Stream_sm=0;
        end
        default:begin
            next_state_Stream_sm=Stream_sm_WRITE_BUFFER;
            wbs_ack_Stream_sm_before_FF=0;

            sm_tready_before_FF=0;

            next_Yn_valid_Xn_ready[1]=0;
            next_output_y_buffer=0;
            next_delay_counter_Stream_sm=0;
        end
    endcase
end

always @* begin
    wbs_dat_Stream_sm_before_FF=output_y_buffer;
end

always@(posedge wb_clk_i) begin
    if(wb_rst_i) begin // positive reset
        state_Stream_sm <= Stream_sm_WRITE_BUFFER;
        wbs_ack_Stream_sm <= 0;
        wbs_dat_Stream_sm <= 0;
        sm_tready <= 0;
        delay_counter_Stream_sm <= 0;
        Yn_valid_Xn_ready[1] <= 0;
        output_y_buffer <= 0;
    end
    else begin
        state_Stream_sm <= next_state_Stream_sm;
        wbs_ack_Stream_sm <= wbs_ack_Stream_sm_before_FF;
        wbs_dat_Stream_sm <= wbs_dat_Stream_sm_before_FF;
        sm_tready <= sm_tready_before_FF;
        delay_counter_Stream_sm <= next_delay_counter_Stream_sm;
        Yn_valid_Xn_ready[1] <= next_Yn_valid_Xn_ready[1];
        output_y_buffer <= next_output_y_buffer;
    end
end

endmodule
