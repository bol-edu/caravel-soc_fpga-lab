`timescale 1ns / 1ps

module fir #(
    parameter pADDR_WIDTH = 32,
    parameter pDATA_WIDTH = 32,
    parameter Tape_Num    = 11,
    parameter Data_Num    = 11
)(
    // AXI-Lite Interface (Read/Write Transaction) 
    output wire                     awready,    // address write ready
    output wire                     wready,     // data    write ready
    input  wire                     awvalid,    // address write valid
    input  wire                     wvalid,     // data    write valid
    input  wire [(pADDR_WIDTH-1):0] awaddr,     // address write data  => Write the Address of Coefficient
    input  wire [(pDATA_WIDTH-1):0] wdata,      // data    write data  => Write the Coefficient
    output wire                     arready,    // address read ready
    input  wire                     rready,     // data    read ready
    input  wire                     arvalid,    // address read valid
    output wire                     rvalid,     // data    read valid
    input  wire [(pADDR_WIDTH-1):0] araddr,     // address read data   => Send the Address of Coefficient to Read
    output wire [(pDATA_WIDTH-1):0] rdata,      // data    read data   => Coefficient of that Address
    // AXI-Stream In X[n] 
    output wire                     ss_tready,
    input  wire                     ss_tvalid,
    input  wire [(pDATA_WIDTH-1):0] ss_tdata,   // data input x[t-i]
    input  wire                     ss_tlast,
    // AXI-Stream Out Y[t] 
    input  wire                     sm_tready,
    output wire                     sm_tvalid,
    output wire [(pDATA_WIDTH-1):0] sm_tdata,   // data after calculation Y[t]
    output wire                     sm_tlast,
    // BRAM for tap RAM 
    output wire [3:0]               tap_WE,
    output wire                     tap_EN,
    output wire [(pDATA_WIDTH-1):0] tap_Di,     // transfer tape from fir to memory
    output wire [(pADDR_WIDTH-1):0] tap_A,     
    input  wire [(pDATA_WIDTH-1):0] tap_Do,     // output from Tape_Ram
    // BRAM for data RAM 
    output wire [3:0]               data_WE,
    output wire                     data_EN,
    output wire [(pDATA_WIDTH-1):0] data_Di,   // data after calculation
    output wire [(pADDR_WIDTH-1):0] data_A,
    input  wire [(pDATA_WIDTH-1):0] data_Do,   // output from Data_Ram
    // Default clk & rst 
    input  wire                     axis_clk,
    input  wire                     axis_rst_n
);
    parameter SM_IDLE = 1'b1;
    parameter SM_DONE = 1'b0;

    parameter AP_PROC = 2'b00;
    parameter AP_IDLE = 2'b01;
    parameter AP_DONE = 2'b10;
    
    reg  [5:0]  ap_ctrl;
    reg  [1:0]  ap_state_r;
    reg  [1:0]  ap_state_w;

    reg is_pending, is_pending_w;

    reg  [31:0] data_length_r;
    wire [31:0] data_length_w;
    reg         write_len;

    wire [5:0] init_addr_w;
    reg  [5:0] init_addr_r;

    reg sm_state_r;
    reg sm_state_w;

    reg _sm_tlast;
 
    reg  [31:0] tlast_cnt_r;    // count to data length 600
    wire [31:0] tlast_cnt_w; 

    reg  [5:0] tap_AR;    // address which will send into tap_RAM
    reg  [4:0] k_r;
    reg  [4:0] k_w;

    reg  [5:0] data_A_w;

    wire [(pDATA_WIDTH-1):0] h_tmp; // coefficient
    reg  [(pDATA_WIDTH-1):0] h;

    wire [(pDATA_WIDTH-1):0] x_tmp; // Data stream-in
    reg  [(pDATA_WIDTH-1):0] x;

    wire [(pDATA_WIDTH-1):0] m_tmp; // after multi
    reg  [(pDATA_WIDTH-1):0] m;

    wire [(pDATA_WIDTH-1):0] y_tmp; // Y[t] = sigma (h[i] * X[t-i])   
    reg  [(pDATA_WIDTH-1):0] y;     // Data Stream-out

    reg  [3:0] x_cnt_r;
    reg  [3:0] x_cnt_w;

    wire  [3:0] x_cnt_last;
    assign x_cnt_last = (x_cnt_r==0)?(4'd10):(x_cnt_r-1);

    reg  [(pDATA_WIDTH-1):0] data_ff;

    wire [(pDATA_WIDTH-1):0] x_sel;
    wire mux_data_sel;

    reg [31:0] data_temp_r, data_temp_w;
    reg [31:0] data_temp2_r, data_temp2_w;
    reg is_loaded_r, is_loaded_w;

    // AXI-Lite 
    reg ARREADY;
    reg AWREADY;
    reg WREADY;
    
    always @(posedge axis_clk) ARREADY <= (arvalid)?           1 : 0;
    always @(posedge axis_clk) AWREADY <= (awvalid && wvalid)? 1 : 0;
    always @(posedge axis_clk) WREADY  <= (awvalid && wvalid)? 1 : 0;
    
    assign awready = (axis_rst_n)? AWREADY : 0;
    assign arready = (axis_rst_n)? ARREADY : 0; 
    assign wready  = (axis_rst_n)? WREADY  : 0;

    reg tmp_rvalid;
    always @(posedge axis_clk) tmp_rvalid <= arvalid;
    
    assign rvalid  = tmp_rvalid;
    
    assign rdata   = (arvalid && araddr[7:0] == 8'd0)? ap_ctrl : tap_Do; // read tap
    
    // Configuration Register control  
    always @* begin
        /*----- ap_idle -----*/
        if (ap_state_r == AP_IDLE)
            ap_ctrl[2] = 1;
        else
            ap_ctrl[2] = 0;
        
        /*----- ap_start ----*/
        if (ap_state_r == AP_IDLE && awaddr == 32'h3000_0000 && wdata == 1)
            ap_ctrl[0] = 1;
        else
            ap_ctrl[0] = 0;
        
        /*----- ap_done -----*/
        if (sm_tvalid && sm_tlast)
            ap_ctrl[1] = 1;
        else if (ap_state_r == AP_DONE)
            ap_ctrl[1] = 1;
        else
            ap_ctrl[1] = 0;
            
        ap_ctrl[3] = 0;         // read zero
        ap_ctrl[4] = ss_tready; // X[n] ready to accept input
        ap_ctrl[5] = sm_tvalid; // Y[y] is ready to read
    end            
        
    always @* begin
        case (ap_state_r)
            AP_IDLE:
            begin  // 0x00: bit 0: ap_start, bit 1: ap_done, bit 2: ap_idle
                if (awvalid && awaddr == 32'h3000_0000 && wdata == 1) begin
                    ap_state_w = AP_PROC; 
                end
                else begin
                    // should clear the dataRAM
                    ap_state_w = AP_IDLE;
                end  
            end
            AP_PROC:
            begin
                if (sm_tvalid && sm_tlast) begin // finish last Y
                    ap_state_w = AP_DONE;
                end
                else begin
                    ap_state_w = AP_PROC;
                end
            end
            AP_DONE:
            begin
                if (arvalid && araddr == 32'h3000_0000) begin
                    ap_state_w = AP_IDLE;
                end
                else begin
                    ap_state_w = AP_DONE;
                end
            end
            default:
            begin
                if (awvalid && awaddr == 32'h3000_0000 && wdata == 1) begin
                    ap_state_w = AP_PROC; 
                end
                else begin
                    ap_state_w = AP_IDLE;
                end 
            end
        endcase
    end
    
    always @(posedge axis_clk or negedge axis_rst_n) begin
        if (!axis_rst_n)
            ap_state_r <= AP_IDLE;  // ap_idle = 1
        else
            ap_state_r <= ap_state_w;
    end

    // Check if IP is pending 
    always @(*) begin
        is_pending_w = is_pending;
        if (!is_pending) begin
            is_pending_w = ((sm_tvalid && !is_loaded_r) || (sm_tvalid && (tlast_cnt_r==(data_length_r-2))))?(1):(0);
        end
        else begin
            is_pending_w = (sm_tready)?(0):(1);
        end
    end
    always @(posedge axis_clk or negedge axis_rst_n) begin
        if (!axis_rst_n)
            is_pending <= 0;
        else
            is_pending <= is_pending_w;
    end

    // 0x10-14: data length 
    always @* begin
        if(awaddr == 32'h3000_0010 && awvalid) 
            write_len = 1'b1;
        else 
            write_len = 1'b0;
    end
    
    assign data_length_w = (write_len)? wdata : data_length_r; // 0x3000_0010
    
    always @(posedge axis_clk or negedge axis_rst_n) begin
        if (!axis_rst_n)
            data_length_r <= 1'b0;
        else
            data_length_r <= data_length_w;
    end
    
    // 0x80-FF: tap parameter 
    assign tap_EN = 1;
    assign tap_WE = ((wvalid == 1) && (awaddr[7:0] != 0))? 4'b1111 : 4'b0000;
    assign tap_A  = (awvalid == 1)? awaddr[5:0] : tap_AR[5:0]; // write prioirty
    assign tap_Di = wdata;
    
    // data_RAM signals 
    assign data_EN = 1;
    assign data_WE = (( ss_tvalid && ss_tready && (awaddr[7:0] == 8'h80)) || (init_addr_r != 6'd44))? 4'b1111 : 4'b0000;
    assign data_A  = (init_addr_r != 6'd44)? init_addr_r : (data_WE)?({x_cnt_last, 2'd0}):(data_A_w);
    assign data_Di = (init_addr_r != 6'd44)? 0 : data_temp2_r;
    
    // data RAM initialize    
    assign init_addr_w = (init_addr_r == 6'd44)? init_addr_r : init_addr_r + 6'd4;
    
    always @(posedge axis_clk or negedge axis_rst_n) begin
        if (!axis_rst_n || ap_ctrl[2])
            init_addr_r <= 0;
        else
            init_addr_r <= init_addr_w;
    end

    
    always @(*) begin
        data_temp_w = data_temp_r;
        data_temp2_w = data_temp2_r;
        is_loaded_w = is_loaded_r;
        if (ss_tready && ss_tvalid) begin
            data_temp_w = ss_tdata;
            data_temp2_w = data_temp_r;
            is_loaded_w = 1;
        end
        if (sm_tready && sm_tvalid) begin
            is_loaded_w = 0;
        end
    end
    always @(posedge axis_clk or negedge axis_rst_n) begin
        if (!axis_rst_n) begin
            data_temp_r <= 0;
            data_temp2_r <= 0;
            is_loaded_r <= 0;
        end
        else begin
            data_temp_r <= data_temp_w;
            data_temp2_r <= data_temp2_w;
            is_loaded_r <= is_loaded_w;
        end
    end

    // Stream-in X 
    // Only input when FIR is processing and k = 0
    assign ss_tready = (ap_ctrl[2] == 0 && init_addr_r == 6'd44 && (awaddr[7:0] == 8'h80) && ss_tvalid)? 1 : 0;
    
    // Stream-out Y 
    assign sm_tvalid = (k_r==12 && ap_ctrl[2] == 0)? 1'b1 : 1'b0;
    assign sm_tdata  = y_tmp; 
    assign sm_tlast  = _sm_tlast; 

    // FSM for AXI-Stream output Y (sm_tlast)    
    always @* begin
        case (sm_state_r)
            SM_IDLE:
            begin
                if (tlast_cnt_w == data_length_r) begin
                    _sm_tlast     = 1'b1;
                    sm_state_w = SM_DONE;
                end
                else begin
                    _sm_tlast     = 1'b0;
                    sm_state_w = SM_IDLE;
                end
            end
            SM_DONE:
            begin
                if (sm_tvalid == 1'b1) begin
                    _sm_tlast     = 1'b0;
                    sm_state_w = SM_IDLE;
                end
                else begin
                    _sm_tlast     = 1'b0;
                    sm_state_w = SM_DONE;
                end
            end
        endcase
    end
    
    always @(posedge axis_clk or negedge axis_rst_n) begin
        if (!axis_rst_n)
            sm_state_r <= SM_DONE;
        else
            sm_state_r <= sm_state_w;
    end
    
    // For sm_tlast. count to data length     
    assign tlast_cnt_w = (sm_tvalid && sm_tready && araddr == 32'h3000_0084)? tlast_cnt_r + 1'b1 : tlast_cnt_r;
    always @(posedge axis_clk or negedge axis_rst_n) begin
        if (!axis_rst_n || ap_ctrl[2]) 
            tlast_cnt_r <= 0;
        else
            tlast_cnt_r <= tlast_cnt_w;
    end
    
    // FIR Operation: One Multiplier and one Adder 
    assign h_tmp = tap_Do;  // h[i]
    assign x_tmp = x_sel;   // x[t-i]
    assign m_tmp = h * x;   // h[i] * x[t-i]
    assign y_tmp = m + y;  
            
    // Operation Pipeline
    always @(posedge axis_clk or negedge axis_rst_n) begin
        if (!axis_rst_n || ap_ctrl[2]) begin
            h <= 32'd0;
            x <= 32'd0;
            m <= 32'd0;
            y <= 32'd0;
        end
        else begin
            h <= h_tmp;
            x <= x_tmp;
            m <= m_tmp;
            if (sm_tready && sm_tvalid)
                y <= 0;
            else
                y <= y_tmp;
        end
    end
    
    always @* begin
        if (is_pending_w) begin
            k_w = (sm_tready)?(13):(k_r);
        end
        else begin
            if (sm_tvalid && sm_tready) begin
                k_w = 0;
            end
            else if (sm_tvalid)
                k_w = k_r;
            else if (init_addr_r != 6'd44) begin
                k_w = 12;
            end
            else begin
                k_w = k_r + 1;
            end
        end
    end
    
    always @(posedge axis_clk or negedge axis_rst_n) begin
        if (!axis_rst_n || ap_ctrl[2])
            k_r <= 12;
        else
            k_r <= k_w;
    end
    
    // use the value of address generator if ap_idle=0
    always @* begin
        if (ap_ctrl[2] == 1'b0) begin
            if (k_r >= 0 && k_r <= 10)
                tap_AR = 12'h040 + 4 * k_r;
            else
                tap_AR = 12'h040;
        end
        else begin
            tap_AR = araddr[5:0];
        end
    end
    
    // count x[t]    
    always @* begin
        if (ap_ctrl[2] == 1'b0) begin // if FIR is executing
            if (k_r == 4'd10)
                if (x_cnt_r != 4'd10)
                    x_cnt_w = x_cnt_r + 1'b1;
                else
                    x_cnt_w = 4'd0;
            else
                x_cnt_w = x_cnt_r;
        end
        else
            x_cnt_w = 4'd0;
    end
    
    always @(posedge axis_clk or negedge axis_rst_n) begin
        if (!axis_rst_n)
            x_cnt_r <= 4'd0;
        else
            x_cnt_r <= x_cnt_w;
    end
    
    // count x[t-i]    
    always @* begin
        if (k_r >= 0 && k_r <= 10) begin
            if (k_r <= x_cnt_r)
                data_A_w = 4 * (x_cnt_r - k_r);
            else
                data_A_w = 4 * (11 + x_cnt_r - k_r);
        end
        else begin
            // data_A_w = 0;
            data_A_w = 32'd40;
        end
    end   
    
    // FF store one value, the first x is from FF.
    always @(posedge axis_clk or negedge axis_rst_n) begin
	if (!axis_rst_n) begin
	    data_ff <= 0;
	end
        if(ss_tvalid) begin
            data_ff <= ss_tdata;
        end
    end
    
    // MUX to select x from FF or Data_RAM
    assign mux_data_sel = (k_r==1 && tlast_cnt_r==(data_length_r-1))?1:&data_WE;

    // output from MUX
    assign x_sel = (mux_data_sel)? data_temp_r : data_Do;
    
endmodule
