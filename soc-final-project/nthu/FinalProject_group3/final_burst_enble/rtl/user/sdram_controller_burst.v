// Refer to the source code from NTU TA (Group 6) 
// and remap the user address inside.

module sdram_controller_example (
        input   clk,
        input   rst,

        // these signals go directly to the IO pins
        // output  sdram_clk,
        output  sdram_cle,
        output  sdram_cs,
        output  sdram_cas,
        output  sdram_ras,
        output  sdram_we,
        output  sdram_dqm,
        output  [1:0]  sdram_ba,
        output  [12:0] sdram_a,
        // Jiin: split dq into dqi (input) dqo (output)
        // inout [7:0] sdram_dq,
        input   [31:0] sdram_dqi,
        output  [31:0] sdram_dqo,

        // User interface
        // Note: we want to remap addr (see below)
        // input [22:0] addr,       // address to read/write
        input   [22:0] user_addr,   // the address will be remap to addr later
        
        input   rw,                 // 1 = write, 0 = read
        input   [31:0] data_in,     // data from a read
        output  [31:0] data_out,    // data for a write
        output  busy,               // controller is busy when high
        input   in_valid,           // pulse high to initiate a read/write
        output  out_valid           // pulses high when data from read is valid
    );

    // Jiin: SDRAM Timing  3-3-3, i.e. CASL=3, PRE=3, ACT=3
    localparam tCASL            = 13'd2;       // 3T actually
    localparam tPRE             = 13'd2;       // 3T
    localparam tACT             = 13'd2;       // 3T
    localparam tREF             = 13'd6;       // 7T
    localparam tRef_Counter     = 10'd750;     // 

    // MA Map
    // BA (Bank Address) - 9:8
    // RA (Row Address)  - 22:10
    // CA (Col Address)  - 2'b0, 1'b0, <7:0>, 2'b0
    `define BA      13:12
    `define RA      22:14
    `define CA      11:0

    // Address Remap
    //   - remap user address to addr to create more offpage/onpage cases
    // 
    wire [22:0] addr;
    wire [7:0] Mapped_RA;
    wire [1:0]  Mapped_BA;
    wire [11:0]  Mapped_CA;
    assign Mapped_RA = user_addr[22:14];
    assign Mapped_BA = user_addr[`BA];
    assign Mapped_CA = user_addr[`CA];
    assign addr = {Mapped_RA, Mapped_BA, Mapped_CA};

    // Commands for the SDRAM
    localparam CMD_UNSELECTED    = 4'b1000;
    localparam CMD_NOP           = 4'b0111;
    localparam CMD_ACTIVE        = 4'b0011;
    localparam CMD_READ          = 4'b0101;
    localparam CMD_WRITE         = 4'b0100;
    localparam CMD_TERMINATE     = 4'b0110;
    localparam CMD_PRECHARGE     = 4'b0010;
    localparam CMD_REFRESH       = 4'b0001;
    localparam CMD_LOAD_MODE_REG = 4'b0000;
    
    localparam STATE_SIZE = 4;
    localparam INIT = 4'd0,
               WAIT = 4'd1,
               PRECHARGE_INIT = 4'd2,
               REFRESH_INIT_1 = 4'd3,
               REFRESH_INIT_2 = 4'd4,
               LOAD_MODE_REG = 4'd5,
               IDLE = 4'd6,
               REFRESH = 4'd7,
               ACTIVATE = 4'd8,
               READ = 4'd9,
               READ_RES = 4'd10,
               WRITE = 4'd11,
               PRECHARGE = 4'd12;
    
    // registers for SDRAM signals
    reg cle_d, cle_q;
    reg dqm_q, dqm_d;
    reg [3:0] cmd_d, cmd_q;
    reg [1:0] ba_d, ba_q;
    reg [13:0] a_d, a_q;
    reg [31:0] dq_d, dq_q;
    reg [31:0] dqi_d, dqi_q;
    reg dq_en_d, dq_en_q;

    // Output assignments
    assign sdram_cle = cle_q;
    assign sdram_cs = cmd_q[3];
    assign sdram_ras = cmd_q[2];
    assign sdram_cas = cmd_q[1];
    assign sdram_we = cmd_q[0];
    assign sdram_dqm = dqm_q;
    assign sdram_ba = ba_q;
    assign sdram_a = a_q;
    // assign sdram_dqi = dq_en_q ? dq_q : 8'hZZ; // only drive when dq_en_q is 1
    assign sdram_dqo = dq_en_q ? dq_q : 32'hZZZZZZZZ;

    reg [STATE_SIZE-1:0] state_d, state_q;
    reg [STATE_SIZE-1:0] next_state_d, next_state_q;

    reg [22:0] addr_d, addr_q;
    reg [31:0] data_d, data_q;
    reg out_valid_d, out_valid_q;
    
    reg [13:0] delay_ctr_d, delay_ctr_q;

    reg [9:0] refresh_ctr_d, refresh_ctr_q;
    reg refresh_flag_d, refresh_flag_q;

    reg ready_d, ready_q;
    reg saved_rw_d, saved_rw_q;
    reg [22:0] saved_addr_d, saved_addr_q;
    reg [31:0] saved_data_d, saved_data_q;

    reg rw_op_d, rw_op_q;
//////////////////////////////////////////////////////////////////////////////////////////////////////	
    wire ack_o;
    reg ack_t_d, ack_t_q, ack_d;
    reg [4:0] ack_cnt_d, ack_cnt_q;
    reg [22:0] addr_tab_d0, addr_tab_q0;
    reg [22:0] addr_tab_d1, addr_tab_q1;
    reg [22:0] addr_tab_d2, addr_tab_q2;
    reg [22:0] addr_tab_d3, addr_tab_q3;
    reg [22:0] addr_tab_d4, addr_tab_q4;
    reg [22:0] addr_tab_d5, addr_tab_q5;
    reg [22:0] addr_tab_d6, addr_tab_q6;
    reg [22:0] addr_tab_d7, addr_tab_q7;
    reg [31:0] data_tab_d0, data_tab_q0;
    reg [31:0] data_tab_d1, data_tab_q1;
    reg [31:0] data_tab_d2, data_tab_q2;
    reg [31:0] data_tab_d3, data_tab_q3;
    reg [31:0] data_tab_d4, data_tab_q4;
    reg [31:0] data_tab_d5, data_tab_q5;
    reg [31:0] data_tab_d6, data_tab_q6;
    reg [31:0] data_tab_d7, data_tab_q7;
    reg [31:0] data_burst_d;
    reg [7:0]  hit_map_d, hit_map_q;
    reg        burst_on_d, burst_on_q;
    reg        v_d, v_q;
    reg [3:0] row_open_d, row_open_q, row_open_q1, row_open_q2, row_open_q3, row_open_q4, row_open_qr;
    reg [12:0] row_addr_d[3:0], row_addr_q[3:0];

    reg [2:0] precharge_bank_d, precharge_bank_q;
    integer i;




    wire [12:0] row_addr_q0, row_addr_q1, row_addr_q2, row_addr_q3;
    assign row_addr_q0 = row_addr_q[0];
    assign row_addr_q1 = row_addr_q[1];
    assign row_addr_q2 = row_addr_q[2];
    assign row_addr_q3 = row_addr_q[3];
    
    
    `define s_bit 5'd8



    assign data_out = data_burst_d;//data_q
    assign busy = !ready_q;
    assign out_valid = out_valid_q | ack_o | v_q;////out_valid_q;
    assign ack_o = ack_d;//ack_cnt_q[0];
    
    always@(*)begin
      	addr_tab_d0 = addr_tab_q0;
      	addr_tab_d1 = addr_tab_q1;
      	addr_tab_d2 = addr_tab_q2;
      	addr_tab_d3 = addr_tab_q3;
      	addr_tab_d4 = addr_tab_q4;
      	addr_tab_d5 = addr_tab_q5;
      	addr_tab_d6 = addr_tab_q6;
      	addr_tab_d7 = addr_tab_q7;
     	data_tab_d0 = data_tab_q0;
      	data_tab_d1 = data_tab_q1;
      	data_tab_d2 = data_tab_q2;
      	data_tab_d3 = data_tab_q3;
      	data_tab_d4 = data_tab_q4;
      	data_tab_d5 = data_tab_q5;
      	data_tab_d6 = data_tab_q6;
      	data_tab_d7 = data_tab_q7;
        hit_map_d   = hit_map_q;
        
      	if(ack_cnt_q==`s_bit)begin
            addr_tab_d0 = user_addr;
            addr_tab_d1 = user_addr + 4;
            addr_tab_d2 = user_addr + 8;
            addr_tab_d3 = user_addr + 12;
            addr_tab_d4 = user_addr + 16;
            addr_tab_d5 = user_addr + 20;
            addr_tab_d6 = user_addr + 24;
            addr_tab_d7 = user_addr + 28;
      	end
      
      	if(ack_cnt_d>5'd0)begin
            data_tab_d0 = dqi_q;
            data_tab_d1 = data_tab_q0;
            data_tab_d2 = data_tab_q1;
            data_tab_d3 = data_tab_q2;
            data_tab_d4 = data_tab_q3;
            data_tab_d5 = data_tab_q4;
            data_tab_d6 = data_tab_q5;
            data_tab_d7 = data_tab_q6;
      	end
        
        hit_map_d[0] = (ack_cnt_q==`s_bit&&addr_tab_d0==user_addr)?1'b1:(ack_cnt_q==5'd0)?1'b0:hit_map_q[0];
        hit_map_d[1] = (ack_cnt_q==5'd7&&addr_tab_d1==user_addr)?1'b1:(ack_cnt_q==5'd0)?1'b0:hit_map_q[1];
        hit_map_d[2] = (ack_cnt_q==5'd6&&addr_tab_d2==user_addr)?1'b1:(ack_cnt_q==5'd0)?1'b0:hit_map_q[2];
        hit_map_d[3] = (ack_cnt_q==5'd5&&addr_tab_d3==user_addr)?1'b1:(ack_cnt_q==5'd0)?1'b0:hit_map_q[3];
        hit_map_d[4] = (ack_cnt_q==5'd4&&addr_tab_d4==user_addr)?1'b1:(ack_cnt_q==5'd0)?1'b0:hit_map_q[4];
        hit_map_d[5] = (ack_cnt_q==5'd3&&addr_tab_d5==user_addr)?1'b1:(ack_cnt_q==5'd0)?1'b0:hit_map_q[5];
        hit_map_d[6] = (ack_cnt_q==5'd2&&addr_tab_d6==user_addr)?1'b1:(ack_cnt_q==5'd0)?1'b0:hit_map_q[6];
        hit_map_d[7] = (ack_cnt_q==5'd1&&addr_tab_d7==user_addr)?1'b1:(ack_cnt_q==5'd0)?1'b0:hit_map_q[7];
        
        v_d = (ack_cnt_q==5'd1)?1'b1:1'b0;
        case(ack_cnt_q)
            `s_bit :ack_d = hit_map_d[0];
            5'd7 :ack_d = hit_map_d[1];
            5'd6 :ack_d = hit_map_d[2];
            5'd5 :ack_d = hit_map_d[3];
            5'd4 :ack_d = hit_map_d[4];
            5'd3 :ack_d = hit_map_d[5];
            5'd2 :ack_d = hit_map_d[6];
            5'd1 :ack_d = hit_map_d[7];
            default:ack_d = 1'b0;
        endcase
        
        case(ack_cnt_q)
            `s_bit :data_burst_d = data_tab_q0;
            5'd7 :data_burst_d = data_tab_q0;
            5'd6 :data_burst_d = data_tab_q0;
            5'd5 :data_burst_d = data_tab_q0;
            5'd4 :data_burst_d = data_tab_q0;
            5'd3 :data_burst_d = data_tab_q0;
            5'd2 :data_burst_d = data_tab_q0;
            5'd1 :data_burst_d = data_tab_q0;
            5'd0 :data_burst_d = 32'd0;
            default:data_burst_d = data_burst_d;
        endcase
        
        burst_on_d = burst_on_q;
        if(state_q==READ_RES) burst_on_d = 1'b1;
        else if(state_q==IDLE) burst_on_d = 1'b0;
    end
    
    always@(posedge clk)begin
    	if(rst)begin
        	addr_tab_q0 <= 23'd0;
        	addr_tab_q1 <= 23'd0;
        	addr_tab_q2 <= 23'd0;
        	addr_tab_q3 <= 23'd0;
        	addr_tab_q4 <= 23'd0;
        	addr_tab_q5 <= 23'd0;
        	addr_tab_q6 <= 23'd0;
        	addr_tab_q7 <= 23'd0;
        	data_tab_q0 <= 32'd0;
        	data_tab_q1 <= 32'd0;
        	data_tab_q2 <= 32'd0;
        	data_tab_q3 <= 32'd0;
        	data_tab_q4 <= 32'd0;
        	data_tab_q5 <= 32'd0;
        	data_tab_q6 <= 32'd0;
        	data_tab_q7 <= 32'd0;
          	burst_on_q  <= 1'b0;
          	hit_map_q   <= 8'd0;
    	end else begin
          addr_tab_q0 <= addr_tab_d0;
        	addr_tab_q1 <= addr_tab_d1;
        	addr_tab_q2 <= addr_tab_d2;
        	addr_tab_q3 <= addr_tab_d3;
        	addr_tab_q4 <= addr_tab_d4;
        	addr_tab_q5 <= addr_tab_d5;
        	addr_tab_q6 <= addr_tab_d6;
        	addr_tab_q7 <= addr_tab_d7;
        	data_tab_q0 <= data_tab_d0;
        	data_tab_q1 <= data_tab_d1;
        	data_tab_q2 <= data_tab_d2;
        	data_tab_q3 <= data_tab_d3;
        	data_tab_q4 <= data_tab_d4;
        	data_tab_q5 <= data_tab_d5;
        	data_tab_q6 <= data_tab_d6;
        	data_tab_q7 <= data_tab_d7;
          	burst_on_q  <= burst_on_d;
          	hit_map_q   <= hit_map_d;
    	end
    end
    
    always@(*)begin
    	ack_t_d = out_valid_d;
    	if(out_valid_d) ack_cnt_d = `s_bit;
    	else if(ack_cnt_q>0) ack_cnt_d = ack_cnt_q - 1'b1;
    	else ack_cnt_d = ack_cnt_q;
    end
    
    always@(posedge clk)begin
    	if(rst)begin
    		ack_t_q   <= 1'b0;
    		ack_cnt_q <= 5'd0;
    	end else begin
    		ack_t_q <= ack_t_d;
    		ack_cnt_q <= ack_cnt_d;
    	end
    end
//////////////////////////////////////////////////////////////////////////////////////////////
    
    always @* begin
        // Default values
        dq_d = dq_q;
        dqi_d = sdram_dqi;
        dq_en_d = 1'b0; // normally keep the bus in high-Z
        cle_d = cle_q;
        cmd_d = CMD_NOP; // default to NOP
        dqm_d = 1'b0;
        ba_d = 2'd0;
        a_d = 16'd0;
        state_d = state_q;
        next_state_d = next_state_q;
        delay_ctr_d = delay_ctr_q;
        addr_d = addr_q;
        data_d = data_q;
        out_valid_d = 1'b0;
        precharge_bank_d = precharge_bank_q;
        rw_op_d = rw_op_q;

        row_open_d = row_open_q;

        // row_addr is a 2d array and must be coppied this way
        for (i = 0; i < 4; i = i + 1)
            row_addr_d[i] = row_addr_q[i];

        // The data in the SDRAM must be refreshed periodically.
        // This conter ensures that the data remains intact.
        refresh_flag_d = refresh_flag_q;
        refresh_ctr_d = refresh_ctr_q + 1'b1;
        // Jiin : refresh_counter tRef_Counter
        // if (refresh_ctr_q > 10'd750) begin
        if (refresh_ctr_q > tRef_Counter) begin
            refresh_ctr_d = 10'd0;
            refresh_flag_d = 1'b1;
        end


        // This is a queue of 1 for read/write operations.
        // When the queue is empty we aren't busy and can
        // accept another request.
        saved_rw_d = saved_rw_q;
        saved_data_d = saved_data_q;
        saved_addr_d = saved_addr_q;
        ready_d = ready_q;
        if (ready_q && in_valid && !(|hit_map_q)) begin
            ready_d = 1'b0;
        end 
        
	if ((ready_q && in_valid && !out_valid_q) || ack_o) begin
            saved_rw_d = rw;
            saved_data_d = data_in;
            saved_addr_d = addr;
        end 
        
        case (state_q)
            ///// INITALIZATION /////
            INIT: begin
                // ready_d = 1'b0;
                row_open_d = 4'b0;
                out_valid_d = 1'b0;
                // a_d = 13'b0;
                // Reserved, Burst Access, Standard Op, CAS = 2, Sequential, Burst = 4
                a_d = {3'd0, 3'b000, 1'b0, 2'b00, 3'b010, 1'b0, 3'b010}; //010
                ba_d = 2'b0;
                cle_d = 1'b1;
                state_d = WAIT;
                // Note: Jiin - We can skip the power-up sequence & LMR
                // directly jump to IDLE state
                // Power-up Sequence
                // 1. wait for power-up sequence, cmd - NOP or INHIBIT
                // 2. precharge all
                // 3. 2 x Auto-refresh

                // delay_ctr_d = 16'd10100; // wait for 101us
                // next_state_d = PRECHARGE_INIT;

                delay_ctr_d = 16'd0;
                // delay_ctr_d = 16'd1;
                next_state_d = IDLE;
                refresh_flag_d = 1'b0;
                refresh_ctr_d = 10'b1;
                ready_d = 1'b1;

                dq_en_d = 1'b0;
            end
            WAIT: begin
                delay_ctr_d = delay_ctr_q - 1'b1;
                if (delay_ctr_q == 13'd0) begin
                    state_d = next_state_q;
                    // if (next_state_q == WRITE) begin
                    //     dq_en_d = 1'b1; // enable the bus early
                    //     dq_d = data_q[7:0];
                    // end
                end
                if(next_state_q==READ_RES) ready_d = 1'b1;
            end

            ///// IDLE STATE /////
            IDLE: begin
                if (refresh_flag_q) begin // we need to do a refresh
                    state_d = PRECHARGE;
                    next_state_d = REFRESH;
                    precharge_bank_d = 3'b100; // all banks
                    refresh_flag_d = 1'b0; // clear the refresh flag
                end else if (!ready_q) begin // operation waiting
                    ready_d = 1'b1; // clear the queue
                    rw_op_d = saved_rw_q; // save the values we'll need later
                    addr_d = saved_addr_q;

                    if (saved_rw_q) // Write
                        data_d = saved_data_q;

                    // if the row is open we don't have to activate it
                    if (row_open_q[saved_addr_q[`BA]]) begin
                        if (row_addr_q[saved_addr_q[`BA]] == saved_addr_q[`RA]) begin
                            // Row is already open
                            if (saved_rw_q)
                                state_d = WRITE;
                            else
                                state_d = READ;
                        end else begin
                            // A different row in the bank is open
                            state_d = PRECHARGE; // precharge open row
                            precharge_bank_d = {1'b0, saved_addr_q[`BA]};
                            next_state_d = ACTIVATE; // open current row
                        end
                    end else begin
                        // no rows open
                        state_d = ACTIVATE; // open the row
                    end
                end
            end

            ///// REFRESH /////
            REFRESH: begin
                cmd_d = CMD_REFRESH;
                state_d = WAIT;

                // Jiin
                // delay_ctr_d = 13'd6; // gotta wait 7 clocks (66ns)
                delay_ctr_d = tREF;

                next_state_d = IDLE;
            end

            ///// ACTIVATE /////
            ACTIVATE: begin
                cmd_d = CMD_ACTIVE;
                a_d = addr_q[`RA];
                ba_d = addr_q[`BA];

                // Jiin:
                //      delay_ctr_d = 13'd0;
                delay_ctr_d = tACT;

                state_d = WAIT;

                if (rw_op_q)
                    next_state_d = WRITE;
                else
                    next_state_d = READ;

                row_open_d[addr_q[`BA]] = 1'b1; // row is now open
                row_addr_d[addr_q[`BA]] = addr_q[`RA];
            end

            ///// READ /////
            READ: begin
                cmd_d = CMD_READ;
                a_d = {addr_q[11:10], 1'b0, addr_q[9:0]};
                ba_d = addr_q[`BA];
                state_d = WAIT;

                // Jiin
                // delay_ctr_d = 13'd2; // wait for the data to show up
                delay_ctr_d = tCASL; 

                next_state_d = READ_RES;

            end
            READ_RES: begin
                data_d = dqi_q; // data_d by pass
                out_valid_d = 1'b1;
                
                //if(ack_o) row_addr_d[addr_q[9:8]] = addr_q[22:10];
                //if(ack_o&&!ready_q)ready_d = 1'b1;
                //else if(ready_q)ready_d = 1'b0;
                delay_ctr_d = 5*tCASL;//CAS lentcy + 8T data delay 
                state_d = WAIT;
                next_state_d = IDLE;
            end

            ///// WRITE /////
            WRITE: begin
                cmd_d = CMD_WRITE;

                dq_d = data_q;
                // data_d = data_q;
                dq_en_d = 1'b1; // enable out bus
                a_d = {addr_q[11:10], 1'b0, addr_q[9:0]};
                ba_d = addr_q[`BA];

                state_d = IDLE;
            end

            ///// PRECHARGE /////
            PRECHARGE: begin
                cmd_d = CMD_PRECHARGE;
                a_d[13] = precharge_bank_q[2]; // all banks
                ba_d = precharge_bank_q[1:0];
                state_d = WAIT;

                // Jiin
                // delay_ctr_d = 13'd0;
                delay_ctr_d = tPRE;

                if (precharge_bank_q[2]) begin
                    row_open_d = 4'b0000; // closed all rows
                end else begin
                    row_open_d[precharge_bank_q[1:0]] = 1'b0; // closed one row
                end
            end

            default: state_d = INIT;
        endcase
    end

    always @(posedge clk) begin
        if(rst) begin
            cle_q <= 1'b0;
            dq_en_q <= 1'b0;
            state_q <= INIT;
            ready_q <= 1'b0;
        end else begin
            cle_q <= cle_d;
            dq_en_q <= dq_en_d;
            state_q <= state_d;
            ready_q <= ready_d;
        end
	
        saved_rw_q <= saved_rw_d;
        saved_data_q <= saved_data_d;
        saved_addr_q <= saved_addr_d;

        cmd_q <= cmd_d;
        dqm_q <= dqm_d;
        ba_q <= ba_d;
        a_q <= a_d;
        dq_q <= dq_d;
        dqi_q <= dqi_d;
	v_q <= v_d;
	
        next_state_q <= next_state_d;
        refresh_flag_q <= refresh_flag_d;
        refresh_ctr_q <= refresh_ctr_d;
        data_q <= data_d;
        addr_q <= addr_d;
        out_valid_q <= out_valid_d;
        row_open_q <= row_open_d;
        row_open_q1 <= row_open_q;
        row_open_q2 <= row_open_q1;
        row_open_q3 <= row_open_q2;
        row_open_q4 <= row_open_q3;
        row_open_qr <= row_open_q4;
        for (i = 0; i < 4; i = i + 1)
            row_addr_q[i] <= row_addr_d[i];
        precharge_bank_q <= precharge_bank_d;
        rw_op_q <= rw_op_d;
        delay_ctr_q <= delay_ctr_d;
    end

endmodule
