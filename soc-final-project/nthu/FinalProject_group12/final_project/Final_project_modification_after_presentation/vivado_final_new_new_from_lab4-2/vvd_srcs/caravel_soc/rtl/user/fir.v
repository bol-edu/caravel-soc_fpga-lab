module fir 
#(  parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32,
    parameter Tape_Num    = 11
)
(
    // Added by me: Coefficient in & ap_start/ap_done/ap_idle (AXI-Lite)
    output  wire                     awready,
    output  wire                     wready,
    input   wire                     awvalid,
    input   wire [(pADDR_WIDTH-1):0] awaddr,
    input   wire                     wvalid,
    input   wire [(pDATA_WIDTH-1):0] wdata,
    output  wire                     arready,
    input   wire                     rready,
    input   wire                     arvalid,
    input   wire [(pADDR_WIDTH-1):0] araddr,
    output  wire                     rvalid,
    output  wire [(pDATA_WIDTH-1):0] rdata, 
    // Added by me: Data in (AXI-Stream)
    input   wire                     ss_tvalid, 
    input   wire [(pDATA_WIDTH-1):0] ss_tdata, 
    input   wire                     ss_tlast, 
    output  wire                     ss_tready, 
    // Added by me: Data out (AXI-Stream)
    input   wire                     sm_tready, 
    output  wire                     sm_tvalid, 
    output  wire [(pDATA_WIDTH-1):0] sm_tdata, 
    output  wire                     sm_tlast, 
    
    // bram for tap RAM
    /////output  wire [3:0]               tap_WE,
    /////output  wire                     tap_EN,
    output  wire                     tap_WE_merge,
    output  wire                     tap_RE,
    output  wire [(pDATA_WIDTH-1):0] tap_Di,
    //output  wire [(pADDR_WIDTH-1):0] tap_A,
    output  wire [(pADDR_WIDTH-1):0] tap_A_shifted,
    input   wire [(pDATA_WIDTH-1):0] tap_Do,

    // bram for data RAM
    /////output  wire [3:0]               data_WE,
    /////output  wire                     data_EN,
    output  wire                     data_WE_merge,
    output  wire                     data_RE,
    output  wire [(pDATA_WIDTH-1):0] data_Di,
    //output  wire [(pADDR_WIDTH-1):0] data_A,
    output  wire [(pADDR_WIDTH-1):0] data_A_shifted,
    input   wire [(pDATA_WIDTH-1):0] data_Do,

    input   wire                     axis_clk,
    input   wire                     axis_rst_n
);
//begin

    // write your code here!
localparam IDLE = 3'd0, BRAM_RESET = 3'd1, AXI_Lite_WAIT = 3'd2, AXI_Lite_WRITE = 3'd3, AXI_Lite_READ = 3'd4, DO_FIR = 3'd5, FIR_WAIT_SM = 3'd6,FIR_LAST_ONE = 3'd7; //, DONE = 3'd7;

/*
reg [7:0] decode_text_before_FF;
reg valid_before_FF;
*/

/////////////// Added in lab4-2 ///////////////
wire [3:0] tap_WE;
wire tap_EN;
wire [3:0] data_WE;
wire data_EN;

assign tap_WE_merge = tap_EN & tap_WE[0];
assign tap_RE = tap_EN & (~tap_WE[0]); // Not allowed read and write at the same time, because in this way it would read out the old value
assign data_WE_merge = data_EN & data_WE[0];
assign data_RE = data_EN & (~data_WE[0]);

wire [(pADDR_WIDTH-1):0] tap_A;
wire [(pADDR_WIDTH-1):0] data_A;

assign tap_A_shifted = tap_A>>2;
assign data_A_shifted = data_A>>2;
///////////////////////////////////////////////


/////awready wready arready rvalid rdata 
/////ss_tready 
/////sm_tvalid sm_tdata sm_tlast
/////tap_WE tap_EN tap_Di tap_A
/////data_WE data_EN data_Di data_A
/////reg XX_reg;
/////reg XX_before_FF;
/////assign XX = XX_reg;

reg awready_reg;
reg awready_before_FF;
reg wready_reg;
reg wready_before_FF;
reg arready_reg;
reg arready_before_FF;
reg rvalid_reg;
//reg rvalid_before_FF;
reg [(pDATA_WIDTH-1):0] rdata_reg;
//reg [(pDATA_WIDTH-1):0] rdata_before_FF;
reg [(pDATA_WIDTH-1):0] last_rdata;
reg last_rvalid;
reg last_rready;
reg ss_tready_reg;
reg ss_tready_before_FF;
reg sm_tvalid_reg;
reg sm_tvalid_before_FF;
reg [(pDATA_WIDTH-1):0] sm_tdata_reg;
reg [(pDATA_WIDTH-1):0] sm_tdata_before_FF;
reg sm_tlast_reg;
reg sm_tlast_before_FF;
reg [3:0] tap_WE_reg;
reg [3:0] last_tap_WE;
reg tap_EN_reg;
reg last_tap_EN;
reg [(pDATA_WIDTH-1):0] tap_Di_reg;
reg [(pDATA_WIDTH-1):0] last_tap_Di;
reg [(pADDR_WIDTH-1):0] tap_A_reg;
reg [(pADDR_WIDTH-1):0] last_tap_A;
reg [3:0] data_WE_reg;
/////reg [3:0] data_WE_before_FF;
reg data_EN_reg;
/////reg data_EN_before_FF;
reg [(pDATA_WIDTH-1):0] data_Di_reg;
/////reg [(pDATA_WIDTH-1):0] data_Di_before_FF;
reg [(pADDR_WIDTH-1):0] data_A_reg;
reg [(pADDR_WIDTH-1):0] last_data_A;
/////reg [(pADDR_WIDTH-1):0] data_A_before_FF;
reg [(pDATA_WIDTH-1):0] tap_Do_reg;
reg [(pDATA_WIDTH-1):0] data_Do_reg;
//reg [(pDATA_WIDTH-1):0] sm_tdata_reg;


reg [3:0] ap_idle_done_start;
reg [3:0] next_ap_idle_done_start;
reg [31:0] data_length; // because of "[31:0] data_length" in fir_tb.v
reg [31:0] next_data_length;

reg [2:0] state;
reg [2:0] next_state;
reg [31:0] counter_data_number; // because of "[31:0] data_length" in fir_tb.v
reg [31:0] next_counter_data_number;
reg [5:0] counter_BRAM;
reg [5:0] next_counter_BRAM;



assign awready = awready_reg;
assign wready = wready_reg;
assign arready = arready_reg;
assign rvalid = rvalid_reg;
assign rdata = rdata_reg;
assign ss_tready = ss_tready_reg;
assign sm_tvalid = sm_tvalid_reg;
assign sm_tdata = sm_tdata_reg;
assign sm_tlast = sm_tlast_reg;
assign tap_WE = tap_WE_reg;
assign tap_EN = tap_EN_reg;
assign tap_Di = tap_Di_reg;
assign tap_A = tap_A_reg;
assign data_WE = data_WE_reg;
assign data_EN = data_EN_reg;
assign data_Di = data_Di_reg;
assign data_A = data_A_reg;


always @* begin
    tap_Do_reg=tap_Do;
    data_Do_reg=data_Do;
    /////sm_tdata_reg=sm_tdata;
end


// 1 Multiplier + 1 Adder
wire [(pDATA_WIDTH-1):0] MAC_output;
multiplier_adder U0_MAC (
    .in1(tap_Do_reg),
    .in2(data_Do_reg),
    .sum_in(sm_tdata_reg),
    .sum_out(MAC_output)
);


// FSM
/*
always @* begin
  case(state) // synopsys parallel_case
    IDLE: begin
      if(start) begin
        next_state=START_7;
      end
      else begin
        next_state=IDLE;
      end
    end
    default:begin
      next_state=IDLE;
    end
  endcase
end
*/
always @* begin
    //if(~axis_rst_n) begin
    //    ss_tready_reg = 0;
    //end
    //else begin
    //    ss_tready_reg = 1;
    //end
    if(~axis_rst_n) begin
        next_state=IDLE;

        tap_EN_reg = 0;
        tap_WE_reg = 4'd0;
        tap_Di_reg = 0;
        tap_A_reg = 0;
        awready_before_FF=0;
        wready_before_FF=0;
        arready_before_FF=0;
        ss_tready_before_FF=0;
        sm_tvalid_before_FF=0;
        sm_tdata_before_FF=0;
        sm_tlast_before_FF=0;
        data_WE_reg=4'd0;
        data_EN_reg=0;
        data_Di_reg=0;
        data_A_reg=0;

        rdata_reg=0;
        rvalid_reg=0;

        next_counter_data_number=0;
        next_counter_BRAM=0;
        next_ap_idle_done_start=4'b0100;
        next_data_length=0;
    end
    else begin
        case(state)
            IDLE: begin
                next_state=BRAM_RESET;

                tap_EN_reg = 0;
                tap_WE_reg = 4'd0;
                tap_Di_reg = 0;
                tap_A_reg = 0;
                awready_before_FF=0;
                wready_before_FF=0;
                arready_before_FF=0;
                ss_tready_before_FF=0;
                sm_tvalid_before_FF=0;
                sm_tdata_before_FF=0;
                sm_tlast_before_FF=0;
                data_WE_reg=4'd0;
                data_EN_reg=0;
                data_Di_reg=0;
                data_A_reg=0;

                next_ap_idle_done_start=ap_idle_done_start;
                next_data_length=data_length;
                rdata_reg=0;
                rvalid_reg=0;
                next_counter_data_number=0;
                next_counter_BRAM=0;
            end
            BRAM_RESET: begin
                tap_EN_reg = 0;
                tap_WE_reg = 4'd0;
                tap_Di_reg = 0;
                tap_A_reg = 0;
                ss_tready_before_FF=0;
                sm_tvalid_before_FF=0;
                sm_tdata_before_FF=0;
                sm_tlast_before_FF=0;
                data_WE_reg=4'b1111;
                data_EN_reg=1;
                data_Di_reg=32'd0;
                data_A_reg=counter_BRAM;

                if(counter_BRAM==6'd40) begin
                    next_state=AXI_Lite_WAIT;
                    awready_before_FF=0; //1;
                    wready_before_FF=0; //1;
                    arready_before_FF=1;
                    next_counter_BRAM=0;
                end
                else begin
                    next_state=BRAM_RESET;
                    awready_before_FF=0;
                    wready_before_FF=0;
                    arready_before_FF=0;
                    next_counter_BRAM=counter_BRAM+4;
                end

                next_ap_idle_done_start=ap_idle_done_start;
                next_data_length=data_length;
                rdata_reg=0;
                rvalid_reg=0;
                next_counter_data_number=0;
            end
            AXI_Lite_WAIT: begin
                //if(counter==32'd0) begin
                //    next_state=state;
                //
                //    tap_EN_reg = 1;
                //    tap_WE_reg = 1;
                //    tap_Di_reg = 32'h0000_0000;
                //    tap_A_reg = 12'h00;
                //
                //    next_counter=counter+1;
                //end
                //else if(counter==32'd1) begin
                //    next_state=state;
                //
                //    tap_EN_reg = 1;
                //    tap_WE_reg = 1;
                //    tap_Di_reg = 32'h0000_0000;
                //    tap_A_reg = 12'h00;
                //
                //    next_counter=counter+1;
                //end

                if(awvalid & wvalid & awready & wready) begin    /////// Write coefficient & ap ///////

                    awready_before_FF=0;
                    wready_before_FF=0;
                    arready_before_FF=0;
                    ss_tready_before_FF=0;
                    sm_tvalid_before_FF=0;
                    sm_tdata_before_FF=0;
                    sm_tlast_before_FF=0;
                    data_WE_reg=4'd0;
                    data_EN_reg=0;
                    data_Di_reg=0;
                    data_A_reg=0;

                    next_counter_data_number=0;
                    next_counter_BRAM=0;

                    if(awaddr==12'h00) begin
                        next_state=AXI_Lite_WAIT;
                        tap_EN_reg = 0;
                        tap_WE_reg = 4'd0;
                        tap_Di_reg = 0;
                        tap_A_reg = 0;

                        next_ap_idle_done_start=wdata[3:0];
                        next_data_length=data_length;
                    end
                    else if(awaddr==12'h10) begin
                        next_state=AXI_Lite_WAIT;
                        tap_EN_reg = 0;
                        tap_WE_reg = 4'd0;
                        tap_Di_reg = 0;
                        tap_A_reg = 0;

                        next_ap_idle_done_start=ap_idle_done_start;
                        next_data_length=wdata;
                    end
                    else begin
                        next_state=AXI_Lite_WRITE;
                        tap_EN_reg = 0;
                        tap_WE_reg = 4'b1111;
                        tap_Di_reg = wdata;
                        tap_A_reg = awaddr-12'h20;

                        next_ap_idle_done_start=ap_idle_done_start;
                        next_data_length=data_length;
                    end

                    rdata_reg=last_rdata;
                    rvalid_reg=last_rvalid;
                end
                else if(awvalid & wvalid) begin    /////// Write setup: to make sure protocol requirement ///////

                    awready_before_FF=1;
                    wready_before_FF=1;
                    arready_before_FF=0;
                    ss_tready_before_FF=0;
                    sm_tvalid_before_FF=0;
                    sm_tdata_before_FF=0;
                    sm_tlast_before_FF=0;
                    data_WE_reg=4'd0;
                    data_EN_reg=0;
                    data_Di_reg=0;
                    data_A_reg=0;

                    next_counter_data_number=0;
                    next_counter_BRAM=0;

                    next_state=AXI_Lite_WAIT;
                    tap_EN_reg = 0;
                    tap_WE_reg = 4'd0;
                    tap_Di_reg = 0;
                    tap_A_reg = 0;

                    next_ap_idle_done_start=ap_idle_done_start;
                    next_data_length=data_length;

                    rdata_reg=last_rdata;
                    rvalid_reg=last_rvalid;
                end
                else if(last_rvalid & last_rready) begin     /////// Read data finished ///////
                    if(ap_idle_done_start[1]==1) begin
                        next_state=IDLE;
                        next_ap_idle_done_start={ap_idle_done_start[3:2],1'b0,ap_idle_done_start[0]};  // When address 0 is read, reset ap_done (workbook p.15)
                    end
                    else begin
                        next_state=AXI_Lite_WAIT;
                        next_ap_idle_done_start=ap_idle_done_start;
                    end


                    awready_before_FF=1;
                    wready_before_FF=1;
                    arready_before_FF=1;
                    ss_tready_before_FF=0;
                    sm_tvalid_before_FF=0;
                    sm_tdata_before_FF=0;
                    sm_tlast_before_FF=0;
                    data_WE_reg=4'd0;
                    data_EN_reg=0;
                    data_Di_reg=0;
                    data_A_reg=0;

                    next_counter_data_number=0;
                    next_counter_BRAM=0;

                    next_data_length=data_length;

                    tap_EN_reg = 0;
                    tap_WE_reg = 4'd0;
                    tap_Di_reg = 0;
                    tap_A_reg = 0;

                    //next_ap_idle_done_start=ap_idle_done_start;

                    rdata_reg=0;
                    rvalid_reg=0;
                end
                else if(arvalid & arready) begin     /////// Read coefficient & ap ///////
                    awready_before_FF=0;
                    wready_before_FF=0;
                    arready_before_FF=0;
                    ss_tready_before_FF=0;
                    sm_tvalid_before_FF=0;
                    sm_tdata_before_FF=0;
                    sm_tlast_before_FF=0;
                    data_WE_reg=4'd0;
                    data_EN_reg=0;
                    data_Di_reg=0;
                    data_A_reg=0;

                    next_counter_data_number=0;
                    next_counter_BRAM=0;

                    next_data_length=data_length;
                    //if((awaddr==12'h00) || (awaddr==12'h10)) begin
                    if(araddr==12'h00) begin
                        /*if(ap_idle_done_start[1]==1) begin // added in lab4-2
                            next_state=IDLE; // added in lab4-2
                        end // added in lab4-2
                        else begin // added in lab4-2
                            next_state=AXI_Lite_WAIT;
                        end // added in lab4-2
                        */
                        
                        tap_EN_reg = 0;
                        tap_WE_reg = 4'd0;
                        tap_Di_reg = 0;
                        tap_A_reg = 0;

                        //next_ap_idle_done_start={ap_idle_done_start[3:2],1'b0,ap_idle_done_start[0]};  // When address 0 is read, reset ap_done (workbook p.15)
                        next_ap_idle_done_start=ap_idle_done_start;

                        rdata_reg={28'd0,ap_idle_done_start};
                        rvalid_reg=1;
                    end
                    else if(araddr==12'h10) begin
                        next_state=AXI_Lite_WAIT;
                        
                        tap_EN_reg = 0;
                        tap_WE_reg = 4'd0;
                        tap_Di_reg = 0;
                        tap_A_reg = 0;

                        next_ap_idle_done_start=ap_idle_done_start;

                        rdata_reg=data_length; //{28'd0,ap_idle_done_start};
                        rvalid_reg=1;
                    end
                    else begin
                        next_state=AXI_Lite_READ;

                        tap_EN_reg = 1; // modified in lab4-2 because of a new bram11.v
                        tap_WE_reg = 4'b0000;
                        tap_Di_reg = 0;
                        tap_A_reg = araddr-12'h20;

                        next_ap_idle_done_start=ap_idle_done_start;
                        
                        rdata_reg=last_rdata;
                        rvalid_reg=last_rvalid;
                    end
                end
                else if(ap_idle_done_start[0]==1) begin     /////// Start FIR engine ///////
                    next_state=DO_FIR;

                    // Because ap_start could not be written 1 during FIR engine is working (that is, not idle), and because BRAM would be read by FIR engine (thus could not be written, because only one of R/W operation can be conducted at the same time), as well as ap_idle and ap_done are read-only,
                    // thus, the write_ready is set to 0 because no write operation should be done during this phase !
                    awready_before_FF=0;
                    wready_before_FF=0;

                    // We can only read configuration address "0" (including ap_start, ap_idle, ap_done) when FIR engine is still working
                    arready_before_FF=1;

                    ss_tready_before_FF=1;
                    sm_tvalid_before_FF=0;
                    sm_tdata_before_FF=0;
                    sm_tlast_before_FF=0;
                    data_WE_reg=4'd0;
                    data_EN_reg=0;
                    data_Di_reg=0;
                    data_A_reg=0;

                    next_counter_data_number=0;
                    next_counter_BRAM=0;

                    tap_EN_reg = 1;
                    tap_WE_reg = 4'd0;
                    tap_Di_reg = 0;
                    tap_A_reg = 12'd0;

                    next_ap_idle_done_start={ap_idle_done_start[3],1'b0,ap_idle_done_start[1:0]};  // When ap_start is sampled, set ap_idle to 0 (workbook p.16)
                    next_data_length=data_length;
                    rdata_reg=last_rdata;
                    rvalid_reg=last_rvalid;
                end
                else begin
                    next_state=AXI_Lite_WAIT;

                    awready_before_FF=0; //1;
                    wready_before_FF=0; //1;
                    arready_before_FF=1;
                    ss_tready_before_FF=0;
                    sm_tvalid_before_FF=0;
                    sm_tdata_before_FF=0;
                    sm_tlast_before_FF=0;
                    data_WE_reg=4'd0;
                    data_EN_reg=0;
                    data_Di_reg=0;
                    data_A_reg=0;

                    next_counter_data_number=0;
                    next_counter_BRAM=0;

                    tap_EN_reg = 0;
                    tap_WE_reg = 4'd0;
                    tap_Di_reg = 0;
                    tap_A_reg = 0;

                    next_ap_idle_done_start=ap_idle_done_start;
                    next_data_length=data_length;
                    rdata_reg=last_rdata;
                    rvalid_reg=last_rvalid;
                end
            end
            AXI_Lite_WRITE: begin
                next_state=AXI_Lite_WAIT;

                awready_before_FF=0; //1;
                wready_before_FF=0; //1;
                arready_before_FF=1;
                ss_tready_before_FF=0;
                sm_tvalid_before_FF=0;
                sm_tdata_before_FF=0;
                sm_tlast_before_FF=0;
                data_WE_reg=4'd0;
                data_EN_reg=0;
                data_Di_reg=0;
                data_A_reg=0;

                tap_EN_reg = 1;       // Caution !!
                tap_WE_reg = last_tap_WE;
                tap_Di_reg = last_tap_Di;
                tap_A_reg = last_tap_A;

                next_ap_idle_done_start=ap_idle_done_start;
                next_data_length=data_length;
                rdata_reg=last_rdata;
                rvalid_reg=last_rvalid;
                next_counter_data_number=0;
                next_counter_BRAM=0;
            end
            AXI_Lite_READ: begin // state=4

                awready_before_FF=0; //1;
                wready_before_FF=0; //1;
                
                ss_tready_before_FF=0;
                sm_tvalid_before_FF=0;
                sm_tdata_before_FF=0;
                sm_tlast_before_FF=0;
                data_WE_reg=4'd0;
                data_EN_reg=0;
                data_Di_reg=0;
                data_A_reg=0;

                tap_EN_reg = 0;       // Caution !!  // modified in lab4-2 because of a new bram11.v
                tap_WE_reg = last_tap_WE;
                tap_Di_reg = last_tap_Di;
                tap_A_reg = last_tap_A;

                next_ap_idle_done_start=ap_idle_done_start;
                next_data_length=data_length;
                rdata_reg=tap_Do;
                rvalid_reg=1;
                next_counter_data_number=0;
                next_counter_BRAM=0;
                if(rvalid & rready) begin //////////// Maybe cannot be synthsized here, because we use "rvalid" which was just changed value
                    next_state=AXI_Lite_WAIT;
                    arready_before_FF=1;
                end
                else begin
                    next_state=AXI_Lite_READ;
                    arready_before_FF=0;
                end
            end
            DO_FIR: begin
                awready_before_FF=0;
                wready_before_FF=0;
                arready_before_FF=1;

                if((arvalid & arready) && (araddr==12'h00)) begin
                    rdata_reg={28'd0,ap_idle_done_start};
                    rvalid_reg=1;
                end
                else if(last_rvalid & last_rready) begin
                    rdata_reg=0;
                    rvalid_reg=0;
                end
                else begin
                    rdata_reg=last_rdata;
                    rvalid_reg=last_rvalid;
                end


                if(counter_BRAM==0) begin
                    next_state=DO_FIR;

                    //awready_before_FF=0;
                    //wready_before_FF=0;
                    //arready_before_FF=0;

                    sm_tvalid_before_FF=0;
                    sm_tdata_before_FF=0;
                    sm_tlast_before_FF=0;
                    /*if(sm_tvalid & sm_tready) begin
                        sm_tvalid_before_FF=0;
                        sm_tdata_before_FF=0;
                        sm_tlast_before_FF=0;
                    end
                    else begin
                        sm_tvalid_before_FF=sm_tvalid;
                        sm_tdata_before_FF=sm_tdata;
                        sm_tlast_before_FF=sm_tlast;
                    end*/

                    tap_EN_reg=0;
                    tap_WE_reg=4'd0;
                    tap_Di_reg=0;
                    tap_A_reg=0;
                    data_WE_reg=4'b1111;
                    data_EN_reg=1;
                    data_Di_reg=ss_tdata;
                    data_A_reg=last_data_A;

                    next_data_length=data_length;
                    //rdata_reg=0;
                    //rvalid_reg=0;
                    next_counter_data_number=counter_data_number;

                    if(ss_tvalid & ss_tready) begin
                        ss_tready_before_FF=0;
                        next_ap_idle_done_start={ap_idle_done_start[3:1],1'b0}; // When the first AXI-Stream data comes in, reset ap_start (workbook p.13)
                        next_counter_BRAM=1;
                    end
                    else begin
                        ss_tready_before_FF=1;
                        next_ap_idle_done_start=ap_idle_done_start;
                        next_counter_BRAM=0;
                    end
                end
                else if(counter_BRAM==12) begin // modified in lab4-2 because of a new bram11.v
                    if(counter_data_number==data_length-1) begin
                        next_state=FIR_LAST_ONE;
                        ss_tready_before_FF=0;
                        sm_tlast_before_FF=1;
                    end
                    else begin
                        next_state=FIR_WAIT_SM;
                        ss_tready_before_FF=0; // modified in lab4-2 because of a new bram11.v
                        sm_tlast_before_FF=0;
                    end

                    //awready_before_FF=0;
                    //wready_before_FF=0;
                    //arready_before_FF=0;

                    sm_tvalid_before_FF=1;
                    sm_tdata_before_FF=MAC_output;

                    tap_EN_reg=1;
                    tap_WE_reg=4'd0;
                    tap_Di_reg=0;
                    tap_A_reg=0;
                    data_WE_reg=4'd0;
                    data_EN_reg=1;
                    data_Di_reg=0;
                    data_A_reg=last_data_A;

                    next_ap_idle_done_start=ap_idle_done_start;
                    next_data_length=data_length;
                    //rdata_reg=0;
                    //rvalid_reg=0;
                    next_counter_data_number=counter_data_number+1;
                    next_counter_BRAM=0;
                end
                else begin
                    next_state=DO_FIR;

                    //awready_before_FF=0;
                    //wready_before_FF=0;
                    //arready_before_FF=0;

                    ss_tready_before_FF=0;
                    /*if(sm_tvalid & sm_tready) begin
                        sm_tvalid_before_FF=0;
                        sm_tdata_before_FF=0;
                        sm_tlast_before_FF=0;
                    end
                    else begin
                        sm_tvalid_before_FF=sm_tvalid;
                        sm_tdata_before_FF=sm_tdata;
                        sm_tlast_before_FF=sm_tlast;
                    end*/

                    sm_tvalid_before_FF=0;
                    if(counter_BRAM==1) begin // modified in lab4-2 because of a new bram11.v
                        sm_tdata_before_FF=0; // modified in lab4-2 because of a new bram11.v
                    end // modified in lab4-2 because of a new bram11.v
                    else begin // modified in lab4-2 because of a new bram11.v
                        sm_tdata_before_FF=MAC_output;
                    end // modified in lab4-2 because of a new bram11.v
                    sm_tlast_before_FF=0;

                    tap_EN_reg=1;
                    tap_WE_reg=4'd0;
                    tap_Di_reg=0;
                    if(counter_BRAM==1) begin // modified in lab4-2 because of a new bram11.v
                        tap_A_reg=last_tap_A; // modified in lab4-2 because of a new bram11.v
                    end // modified in lab4-2 because of a new bram11.v
                    else begin // modified in lab4-2 because of a new bram11.v
                        tap_A_reg=last_tap_A+4;
                    end // modified in lab4-2 because of a new bram11.v
                    data_WE_reg=4'd0;
                    data_EN_reg=1;
                    data_Di_reg=0;
                    if(counter_BRAM==1) begin // modified in lab4-2 because of a new bram11.v
                        data_A_reg=last_data_A; // modified in lab4-2 because of a new bram11.v
                    end // modified in lab4-2 because of a new bram11.v
                    else if(last_data_A==40) begin
                        data_A_reg=0;
                    end
                    else begin
                        data_A_reg=last_data_A+4;
                    end
                    
                    next_ap_idle_done_start=ap_idle_done_start;
                    next_data_length=data_length;
                    //rdata_reg=0;
                    //rvalid_reg=0;
                    next_counter_data_number=counter_data_number;
                    next_counter_BRAM=counter_BRAM+1;
                end

                /*next_state=DO_FIR;

                awready_before_FF=0;
                wready_before_FF=0;
                arready_before_FF=0;
                    
                ss_tready_before_FF=
                sm_tvalid_before_FF=
                sm_tdata_before_FF=
                sm_tlast_before_FF=

                tap_EN_reg=
                tap_WE_reg=4'd
                tap_Di_reg=
                tap_A_reg=
                data_WE_reg=4'd
                data_EN_reg=
                data_Di_reg=
                data_A_reg=

                next_ap_idle_done_start=
                next_data_length=
                rdata_reg=
                rvalid_reg=
                next_counter_data_number=
                next_counter_BRAM=*/
            end
            FIR_WAIT_SM: begin // added in lab4-2 because of a new bram11.v

                if(sm_tvalid & sm_tready) begin
                    next_state=DO_FIR;
                    sm_tvalid_before_FF=0;
                    sm_tdata_before_FF=0;
                    sm_tlast_before_FF=0;
                    ss_tready_before_FF=1;
                end
                else begin
                    next_state=FIR_WAIT_SM;
                    sm_tvalid_before_FF=sm_tvalid;
                    sm_tdata_before_FF=sm_tdata;
                    sm_tlast_before_FF=sm_tlast;
                    ss_tready_before_FF=0;
                end
                

                awready_before_FF=0;
                wready_before_FF=0;
                arready_before_FF=1;

                /*if((arvalid & arready) && (araddr==12'h00)) begin
                    rdata_reg={28'd0,ap_idle_done_start};
                    rvalid_reg=1;
                end
                else begin
                    rdata_reg=0;
                    rvalid_reg=0;
                end*/
                if((arvalid & arready) && (araddr==12'h00)) begin
                    rdata_reg={28'd0,ap_idle_done_start};
                    rvalid_reg=1;
                end
                else if(last_rvalid & last_rready) begin
                    rdata_reg=0;
                    rvalid_reg=0;
                end
                else begin
                    rdata_reg=last_rdata;
                    rvalid_reg=last_rvalid;
                end

                tap_EN_reg=1;
                tap_WE_reg=4'd0;
                tap_Di_reg=0;
                tap_A_reg=0;
                data_WE_reg=4'd0;
                data_EN_reg=1;
                data_Di_reg=0;
                data_A_reg=last_data_A;

                next_ap_idle_done_start=ap_idle_done_start;
                next_data_length=data_length;
                next_counter_data_number=counter_data_number;
                next_counter_BRAM=0;
            end
            FIR_LAST_ONE: begin
                /////awready_before_FF=0;
                /////wready_before_FF=0;
                /////arready_before_FF=0;
                ss_tready_before_FF=0;
                tap_EN_reg=0;
                tap_WE_reg=4'd0;
                tap_Di_reg=0;
                tap_A_reg=0;
                data_WE_reg=4'd0;
                data_EN_reg=0;
                data_Di_reg=0;
                data_A_reg=0;

                next_data_length=data_length;

                //rdata_reg=0;
                //rvalid_reg=0;
                if((arvalid & arready) && (araddr==12'h00)) begin
                    rdata_reg={28'd0,ap_idle_done_start};
                    rvalid_reg=1;
                end
                else if(last_rvalid & last_rready) begin
                    rdata_reg=0;
                    rvalid_reg=0;
                end
                else begin
                    rdata_reg=last_rdata;
                    rvalid_reg=last_rvalid;
                end

                next_counter_BRAM=0;

                if(sm_tvalid & sm_tready) begin
                    /////next_state=DONE;
                    next_state=AXI_Lite_WAIT;
                    awready_before_FF=0; //1;
                    wready_before_FF=0; //1;
                    arready_before_FF=1;
                    sm_tvalid_before_FF=0;
                    sm_tdata_before_FF=0;
                    sm_tlast_before_FF=0;
                    next_ap_idle_done_start={ap_idle_done_start[3],2'b11,ap_idle_done_start[0]};
                    next_counter_data_number=0;
                end
                else begin
                    next_state=FIR_LAST_ONE;
                    awready_before_FF=0;
                    wready_before_FF=0;
                    arready_before_FF=0;
                    sm_tvalid_before_FF=sm_tvalid;
                    sm_tdata_before_FF=sm_tdata;
                    sm_tlast_before_FF=sm_tlast;
                    next_ap_idle_done_start=ap_idle_done_start;
                    next_counter_data_number=counter_data_number;
                end
            end
            /*DONE: begin
                next_state=AXI_Lite_WAIT;

                awready_before_FF=1;
                wready_before_FF=1;
                arready_before_FF=1;
                    
                ss_tready_before_FF=0;
                sm_tvalid_before_FF=0;
                sm_tdata_before_FF=0;
                sm_tlast_before_FF=0;

                tap_EN_reg=0;
                tap_WE_reg=4'd0;
                tap_Di_reg=0;
                tap_A_reg=0;
                data_WE_reg=4'd0;
                data_EN_reg=0;
                data_Di_reg=0;
                data_A_reg=0;

                next_ap_idle_done_start=ap_idle_done_start;
                next_data_length=data_length;
                rdata_reg=0;
                rvalid_reg=0;
                next_counter_data_number=0;
                next_counter_BRAM=0;
            end*/
            default:begin
                next_state=IDLE;
                awready_before_FF=0;
                wready_before_FF=0;
                arready_before_FF=0;
                    
                ss_tready_before_FF=0;
                sm_tvalid_before_FF=0;
                sm_tdata_before_FF=0;
                sm_tlast_before_FF=0;

                tap_EN_reg=0;
                tap_WE_reg=4'd0;
                tap_Di_reg=0;
                tap_A_reg=0;
                data_WE_reg=4'd0;
                data_EN_reg=0;
                data_Di_reg=0;
                data_A_reg=0;

                next_ap_idle_done_start=4'b0100;
                next_data_length=0;
                rdata_reg=0;
                rvalid_reg=0;
                next_counter_data_number=0;
                next_counter_BRAM=0;
            end
        endcase

    end
end 

/*
always@(posedge clk) begin
  if(~rst_n) begin
    state <= IDLE;
  end
  else begin
    state <= next_state;
  end
end
*/

always@(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) begin
        state <= IDLE;
        awready_reg <= 0;
        wready_reg <= 0;
        arready_reg <= 0;
        /////rvalid_reg <= 0;
        /////rdata_reg <= 0;
        last_rdata <= 0;
        last_rvalid <= 0;
        last_rready <= 0;
        ss_tready_reg <= 0;
        sm_tvalid_reg <= 0;
        sm_tdata_reg <= 0;
        sm_tlast_reg <= 0;
        /////tap_WE_reg <= 4'd0;
        /////tap_EN_reg <= 0;
        /////tap_Di_reg <= 0;
        /////tap_A_reg <= 0;
        /////data_WE_reg <= 0;
        /////data_EN_reg <= 0;
        /////data_Di_reg <= 0;
        /////data_A_reg <= 0;
        last_tap_WE <= 0;
        last_tap_EN <= 0;
        last_tap_Di <= 0;
        last_tap_A <= 0;

        last_data_A <= 0;

        counter_data_number <= 0;
        counter_BRAM <= 0;
        ap_idle_done_start <= 4'b0100;
        data_length <= 0;
        
    end
    else begin
        state <= next_state;
        awready_reg <= awready_before_FF;
        wready_reg <= wready_before_FF;
        arready_reg <= arready_before_FF;
        /////rvalid_reg <= rvalid_before_FF;
        /////rdata_reg <= rdata_before_FF;
        last_rdata <= rdata;
        last_rvalid <= rvalid;
        last_rready <= rready;
        ss_tready_reg <= ss_tready_before_FF;
        sm_tvalid_reg <= sm_tvalid_before_FF;
        sm_tdata_reg <= sm_tdata_before_FF;
        sm_tlast_reg <= sm_tlast_before_FF;
        /////tap_WE_reg <= tap_WE_before_FF; //4'b1111;
        /////tap_EN_reg <= tap_EN_before_FF; //1;
        /////tap_Di_reg <= tap_Di_before_FF; //32'h12346789;
        /////tap_A_reg <= tap_A_before_FF; //12'd4;
        /////data_WE_reg <= data_WE_before_FF;
        /////data_EN_reg <= data_EN_before_FF;
        /////data_Di_reg <= data_Di_before_FF;
        /////data_A_reg <= data_A_before_FF;
        last_tap_WE <= tap_WE_reg;
        last_tap_EN <= tap_EN_reg;
        last_tap_Di <= tap_Di_reg;
        last_tap_A <= tap_A_reg;

        last_data_A <= data_A_reg;

        counter_data_number <= next_counter_data_number;
        counter_BRAM <= next_counter_BRAM;
        ap_idle_done_start <= next_ap_idle_done_start;
        data_length <= next_data_length;
    end
end

//end
endmodule