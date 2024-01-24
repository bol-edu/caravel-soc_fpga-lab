`default_nettype wire

// some like this
module wishbone_arbiter(
    input         clk,
    input         rst,
    // arb1state 30000
    input         wb_stb_i,
    input         wb_cyc_i,
    input         wb_we_i,
    input  [3:0]  wb_sel_i,
    input  [31:0] wb_dat_i,
    input  [31:0] wb_adr_i,
        
        
        
     
    // Wishbone Interface 1  arb1state 3800
    input         wb1_stb_i,
    input         wb1_cyc_i,
    input         wb1_we_i,
    input  [3:0]  wb1_sel_i,
    input  [31:0] wb1_dat_i,
    input  [31:0] wb1_adr_i,
    output       wb1_ack_o,
    output  [31:0] wb1_dat_o,

    // Wishbone Interface 2  fir
    input         wb2_stb_i,
    input         wb2_cyc_i,
    input         wb2_we_i,
    input  [3:0]  wb2_sel_i,
    input  [31:0] wb2_dat_i,
    input  [31:0] wb2_adr_i,
    output     wb2_ack_o,
    output  [31:0] wb2_dat_o,

    // Wishbone Interface 3 qsort
    input         wb3_stb_i,
    input         wb3_cyc_i,
    input         wb3_we_i,
    input  [3:0]  wb3_sel_i,
    input  [31:0] wb3_dat_i,
    input  [31:0] wb3_adr_i,
    output         wb3_ack_o,
    output  [31:0] wb3_dat_o,
    
    // Wishbone Interface 4 mm
    input         wb4_stb_i,
    input         wb4_cyc_i,
    input         wb4_we_i,
    input  [3:0]  wb4_sel_i,
    input  [31:0] wb4_dat_i,
    input  [31:0] wb4_adr_i,
    output         wb4_ack_o,
    output  [31:0] wb4_dat_o

    // Shared Wishbone Bus
);
    reg[2:0] arbstate,n_arbstate;
    reg [31:0] x_addr,a_addr,q_addr;
    reg[2:0] init_readyq;
    wire wb_hs;
    assign wb_hs = wb_stb_i & wb_cyc_i & wb_we_i;
    wire                    x_addr_signal;
    wire                    a_addr_signal;
    wire                    q_addr_signal;
    
    wire         wbj_stb_i;
    wire         wbj_cyc_i;
    wire         wbj_we_i;
    wire  [3:0]  wbj_sel_i;
    wire  [31:0] wbj_dat_i;
    wire  [31:0] wbj_adr_i;
    wire         wbj_ack_o;
    wire  [31:0] wbj_dat_o;
    
    wire         pre_stb_i;
    wire         pre_cyc_i;
    wire         pre_we_i;
    wire  [3:0]  pre_sel_i;
    wire  [31:0] pre_dat_i;
    wire  [31:0] pre_adr_i;
    wire         pre_ack_o;
    wire  [31:0] pre_dat_o;
    
    
    wire         buffer_stb_i;
    wire         buffer_cyc_i;
    wire         buffer_we_i;
    wire  [3:0]  buffer_sel_i;
    wire  [31:0] buffer_dat_i;
    wire  [31:0] buffer_adr_i;
    wire         buffer_ack_o;
    wire  [31:0] buffer_dat_o;
    wire   to_sdram;
    wire   to_buffer;
    wire   start;

    assign x_addr_signal = (wb_adr_i==32'h3000_0004) ? 1 : 0;
    assign a_addr_signal = (wb_adr_i==32'h3000_0084) ? 1 : 0;
    assign q_addr_signal = (wb_adr_i==32'h3000_0080) ? 1 : 0;
    // x-address
    always @(posedge clk or posedge rst)begin
	    if(rst) begin
	        x_addr <= 0;
	        init_readyq[2]<=1'b0;
    	end
    	else if (wb_hs & (x_addr_signal)) begin //defined // changed : replace with x_addr_signal & wb_hs
    		x_addr <= wb_dat_i;
    		init_readyq[2]<=1'b1;
    	end
    	else begin
    	end
    end
    
   always @(posedge clk or posedge rst)begin
	    if(rst) begin
	        a_addr <= 0;
	        init_readyq[0]<=1'b0;
    	end
    	else if (wb_hs & (a_addr_signal)) begin //defined // changed : replace with x_addr_signal & wb_hs
    		a_addr <= wb_dat_i;
    		init_readyq[0]<=1'b1;
    	end
    	else begin
    	end
    end

    always @(posedge clk or posedge rst)begin
	    if(rst) begin
	        q_addr <= 0;
	        init_readyq[1]<=1'b0;
    	end
    	else if (wb_hs & (q_addr_signal)) begin //defined // changed : replace with x_addr_signal & wb_hs
    		q_addr <= wb_dat_i;
    		init_readyq[1]<=1'b1;
    	end
    	else begin
    	end
    end



  wire [2:0]init_readyo;
assign init_readyo= init_readyq;

  wire[31:0] addrx;
  assign addrx=x_addr;

  wire[31:0] addra;
  assign addra=a_addr;

  wire[31:0] addrq;
  assign addrq=q_addr;













    wire             bus_ack_o;
    wire  [31:0]     bus_dat_o;







// because burst len 8, so ack should counter 8 ;
reg [3:0]cpu_counter;
reg [4:0]force_counter;
   always @(posedge clk or posedge rst)begin
	    if(rst) begin
             cpu_counter<=0;
    	    end
    	   else begin
    	     if (arb1state==cpu_read & wbs_ack_o ) begin
    	     cpu_counter<=cpu_counter+1;
    	     end
    	     else begin
    	     cpu_counter<=0;
    	     end
           end
    end
    always @(posedge clk or posedge rst)begin
	    if(rst) begin
             force_counter<=0;
    	    end
    	   else begin
    	     if (arb1state==cpu_read) begin
    	     force_counter<=force_counter+1;
    	     end
    	     else begin
    	     force_counter<=0;
    	     end
          end
    end

wire x_buffer_state;
wire a_buffer_state;
wire q_buffer_state;
wire [4:0]buffer_decode;
assign buffer_decode=arb1state;
reg [4:0] arb1state,n_decoder;

localparam  INIT = 5'd0,Wait = 5'd1, cpu_read = 5'd2, cpu_write= 5'd3, fir_read = 5'd4 , fir_write=5'd5, qsort_read = 5'd6, qsort_write = 5'd7 , mm_read = 5'd8, mm_write = 5'd9;

wire [5:0]prefetch_state;

    always @(*) begin 
        case (arb1state)
        
            INIT: begin 
            /* if(wb4_cyc_i& (~wb4_we_i) & (~pref_state_reg[0]))
             n_decoder=mm_read;
             else if(wb4_cyc_i)
             n_decoder=mm_write;
             else if(wb3_cyc_i & (~wb3_we_i) & (~pref_state_reg[2]))
             n_decoder=qsort_read;
             else if(wb3_cyc_i & wb3_we_i)
             n_decoder=qsort_write;
             else if(wb2_cyc_i & (~wb2_we_i) & (~pref_state_reg[4]))
             n_decoder=fir_read;
             else if(wb2_cyc_i & wb2_we_i)
             n_decoder=fir_write;*/
             if(wb2_cyc_i & (~wb2_we_i)&x_buffer_state) //& (~pref_state_reg[4])& can_start)
             n_decoder=fir_read;
             
             else if(wb2_cyc_i & wb2_we_i& ~pre_cyc_i) //& can_start)
             n_decoder=fir_write;
             else if(wb3_cyc_i & (~wb3_we_i)&q_buffer_state) //& (~pref_state_reg[4])& can_start)
             n_decoder=qsort_read;
             
             else if(wb3_cyc_i & wb3_we_i&~pre_cyc_i) //& can_start)
             n_decoder=qsort_write;
             
             
             else if(wb4_cyc_i & (~wb4_we_i)&a_buffer_state) //& (~pref_state_reg[4])& can_start)
             n_decoder=mm_read;
             
             else if(wb4_cyc_i & wb4_we_i&~pre_cyc_i) //& can_start)
             n_decoder=mm_write;
             
             
             else if(wb1_cyc_i & (~wb1_we_i))
             n_decoder=cpu_read;
             else if(wb1_cyc_i & wb1_we_i)
             n_decoder=cpu_write;
             else begin
             n_decoder =arb1state;
            
             
             end
             
            end

            cpu_read: begin
               if(cpu_counter==4'd8|force_counter==20) begin
               n_decoder= INIT;
               end
               else begin
               n_decoder= arb1state;
               end
            
            end
            
            cpu_write: begin
               if(wbs_ack_o) begin
               n_decoder= INIT;
               end
               else begin
               n_decoder= arb1state;
               end
            
            
            end
            
            
            fir_read: begin 
               if(wbs_ack_o) begin
               n_decoder= INIT;
               end
               else begin
               n_decoder= arb1state;
               end
               
            end
            
            
            fir_write: begin
              if(wbs_ack_o) begin
               n_decoder= INIT;
               end
               else begin
               n_decoder= arb1state;
               end
            
            end
            
            
            
            qsort_write: begin 
              if(wbs_ack_o) begin
              n_decoder= INIT;
              end
              else begin
              n_decoder= arb1state;
              end
            end
            qsort_read: begin 
              if(wbs_ack_o) begin
              n_decoder= INIT;
              end
              else begin
              n_decoder= arb1state;
              end
            end
            
            
            mm_write: begin 
            if(wbs_ack_o) begin
            n_decoder= INIT;
            end
            else begin
            n_decoder= arb1state;
            end
            
            end
        
            mm_read:  begin
            
            if(wbs_ack_o) begin
            n_decoder= INIT;
            end
            else begin
            n_decoder= arb1state;
            end
            
            end   
            
            
            default: begin 
                n_decoder = INIT;
            end
        endcase
    end
    
    always @(posedge clk) begin
        if (rst) begin
            arb1state <= 5'd0;
        end
        else begin
            arb1state<=n_decoder;
        end
    end 





assign wb1_ack_o=wbs_ack_o&(arb1state==cpu_write | arb1state==cpu_read);
assign wb2_ack_o=wbs_ack_o&(arb1state==fir_write | arb1state==fir_read);
assign wb3_ack_o=wbs_ack_o&(arb1state==qsort_write | arb1state==qsort_read);
assign wb4_ack_o=wbs_ack_o&(arb1state==mm_write | arb1state==mm_read);
assign wb1_dat_o=wbs_dat_o;
assign wb2_dat_o=wbs_dat_o;
assign wb3_dat_o=wbs_dat_o;
assign wb4_dat_o=wbs_dat_o;


    
    wire         wbs_stb_i;
    wire         wbs_cyc_i;
    wire         wbs_we_i;
    wire  [3:0]  wbs_sel_i;
    wire  [31:0] wbs_dat_i;
    wire  [31:0] wbs_adr_i;
    wire         wbs_ack_o;
    wire  [31:0] wbs_dat_o;
    
    
    
    //would be change to bus
    assign wbs_we_i = (wb1_we_i&(arb1state==cpu_write))|(wb2_we_i&(arb1state==fir_write))|(wb3_we_i&(arb1state==qsort_write))|(wb4_we_i&(arb1state==mm_write));
    assign wbs_sel_i= (wb1_sel_i&{4{(arb1state==cpu_write|arb1state==cpu_read)}})|(wb2_sel_i&{4{(arb1state==fir_write|arb1state==fir_read)}})|(wb3_sel_i&{4{(arb1state==qsort_write|arb1state==qsort_read)}})|(wb4_sel_i&{4{(arb1state==mm_write|arb1state==mm_read)}});
    assign wbs_dat_i= (wb1_dat_i&{32{(arb1state==cpu_write)}})|(wb2_dat_i&{32{(arb1state==fir_write)}})|(wb3_dat_i&{32{(arb1state==qsort_write)}})|(wb4_dat_i&{32{(arb1state==mm_write)}});
    assign wbs_adr_i= (wb1_adr_i&{32{(arb1state==cpu_write|arb1state==cpu_read)}})|(wb2_adr_i&{32{(arb1state==fir_write|arb1state==fir_read)}})|(wb3_adr_i&{32{(arb1state==qsort_write|arb1state==qsort_read)}})|(wb4_adr_i&{32{(arb1state==mm_write|arb1state==mm_read)}});	
    assign wbs_cyc_i =(wb1_cyc_i&(arb1state==cpu_write|arb1state==cpu_read))|(wb2_cyc_i&(arb1state==fir_write|arb1state==fir_read))|(wb3_cyc_i&(arb1state==qsort_write|arb1state==qsort_read))|(wb4_cyc_i&(arb1state==mm_write|arb1state==mm_read));
    assign wbs_stb_i =(wb1_stb_i&(arb1state==cpu_write|arb1state==cpu_read))|(wb2_stb_i&(arb1state==fir_write|arb1state==fir_read))|(wb3_stb_i&(arb1state==qsort_write|arb1state==qsort_read))|(wb4_stb_i&(arb1state==mm_write|arb1state==mm_read));












    
    assign to_sdram= (arb1state==cpu_read|arb1state==cpu_write|arb1state==fir_write|arb1state==qsort_write|arb1state==mm_write);
    assign to_buffer= (arb1state==fir_read|arb1state==qsort_read|arb1state==mm_read);
        
    assign wbj_we_i = (wbs_we_i & to_sdram);
    assign wbj_sel_i= (wbs_sel_i&{4{to_sdram}});
    assign wbj_dat_i= (wbs_dat_i&{32{to_sdram}});
    assign wbj_adr_i= (wbs_adr_i&{32{to_sdram}});	
    assign wbj_cyc_i =(wbs_cyc_i& to_sdram);
    assign wbj_stb_i =(wbs_stb_i& to_sdram);
    
   
    assign buffer_we_i = 0;
    assign buffer_sel_i= (wbs_sel_i&{4{to_buffer}});
    assign buffer_dat_i= 0;
    assign buffer_adr_i= (wbs_adr_i&{32{to_buffer}});	
    assign buffer_cyc_i =(wbs_cyc_i& to_buffer);
    assign buffer_stb_i =(wbs_stb_i& to_buffer);
    
    
    
    assign wbs_ack_o= ( (wbj_ack_o&to_sdram)|(buffer_ack_o &to_buffer))  ;
    assign wbs_dat_o= ( (wbj_dat_o&{32{to_sdram}}) |(buffer_dat_o&{32{to_buffer}}));
    

   
   reg[3:0] prefetch_counter,wb_counter;
   
   
      always @(posedge clk or posedge rst)begin
	    if(rst) begin
             prefetch_counter<=0;
    	    end
    	   else begin
    	     if (arbstate==prefetch & sdram_ack_o ) begin
    	     prefetch_counter<=prefetch_counter+1;
    	     end
    	     else begin
    	     prefetch_counter<=0;
    	     end

    	   end

    end

   localparam  instruction=0, prefetch = 1,WAIT1 =2,WAIT2=3,WAIT3=4,WAIT4=5;
   
   always @(*) begin 
        case (arbstate)
        
             instruction: begin 

             if(pre_cyc_i & ~wbj_cyc_i) n_arbstate = WAIT1;
             else n_arbstate = instruction; 
             
            end
            
            WAIT1:begin
            n_arbstate=WAIT3;
            end
            WAIT3: begin
            n_arbstate=prefetch;
            end
            WAIT2:begin
            n_arbstate=instruction;
            end
            
            prefetch: begin
               if(prefetch_counter==4'd8) begin
                  n_arbstate= WAIT2;
                  end
                  else begin
                  n_arbstate= prefetch;
                  end   
            end
            
            
            default: begin 
             n_arbstate  = arbstate;
            end
        endcase
    end
    
    always @(posedge clk) begin
        if (rst) begin
            arbstate <= 1'd0;
        end
        else begin
            arbstate<=n_arbstate;
        end
    end 
   


    buffer BUFFER (
        .clk           (clk),
        .rst           (rst),
        .init_ready     (init_readyo),
        .xaddr(addrx),
        .aaddr(addra),
        .qaddr(addrq),
        .start(start),
        // wbs to buffer
        
        .buffer_cyc_i(buffer_cyc_i),
        .buffer_stb_i(buffer_stb_i),
        .buffer_we_i(buffer_we_i),
        .buffer_sel_i(buffer_sel_i),
        .buffer_adr_i(buffer_adr_i),
        .buffer_dat_i(buffer_dat_i),
        .buffer_ack_o(buffer_ack_o),
        .buffer_dat_o(buffer_dat_o),
        
        
        
        // buffer to topsdram
        
        .pre_cyc_i(pre_cyc_i),
        .pre_stb_i(pre_stb_i),
        .pre_we_i(pre_we_i),
        .pre_sel_i(pre_sel_i),
        .pre_adr_i(pre_adr_i),
        .pre_dat_i(pre_dat_i),
        .pre_ack_o(pre_ack_o),
        .pre_dat_o(pre_dat_o),
        
        .xbuffer_state(x_buffer_state),
        .abuffer_state(a_buffer_state),
        .qbuffer_state(q_buffer_state),
        .decode(buffer_decode),

     .wb_dat_i(wb_dat_i),
     .wb_adr_i(wb_adr_i)
        );
    wire         sdram_stb_i;
    wire         sdram_cyc_i;
    wire         sdram_we_i;
    wire  [3:0]  sdram_sel_i;
    wire  [31:0] sdram_dat_i;
    wire  [31:0] sdram_adr_i;
    wire         sdram_ack_o;
    wire  [31:0] sdram_dat_o;    
        

     /*assign sdram_we_i  = (arbstate==instruction)? wbj_we_i : 0;
     assign sdram_sel_i = (arbstate==instruction)? wbj_sel_i:(pre_sel_i);
     assign sdram_dat_i = (arbstate==instruction)? wbj_dat_i:(pre_dat_i);
     assign sdram_adr_i = (arbstate==instruction)? wbj_adr_i:(pre_adr_i);	
     assign sdram_cyc_i = (arbstate==instruction)? wbj_cyc_i:(pre_cyc_i);
     assign sdram_stb_i = (arbstate==instruction)? wbj_stb_i:(pre_stb_i);*/
    assign sdram_we_i = (wbj_we_i &(arbstate==instruction));
    assign sdram_sel_i= (wbj_sel_i&{4{(arbstate==instruction)}})|(pre_sel_i&{4{(arbstate==prefetch)}});
    assign sdram_dat_i= (wbj_dat_i&{32{(arbstate==instruction)}})|(pre_dat_i&{32{(arbstate==prefetch)}});
    assign sdram_adr_i= (wbj_adr_i&{32{(arbstate==instruction)}})|(pre_adr_i&{32{(arbstate==prefetch)}});	
    assign sdram_cyc_i =(wbj_cyc_i&(arbstate==instruction))|(pre_cyc_i&(arbstate==prefetch));
    assign sdram_stb_i =(wbj_stb_i&(arbstate==instruction))|(pre_stb_i&(arbstate==prefetch));
        
        
assign wbj_ack_o=sdram_ack_o&(arbstate==instruction);
assign wbj_dat_o=sdram_dat_o&{32{(arbstate==instruction)}};
assign pre_ack_o=sdram_ack_o&(arbstate==prefetch);
assign pre_dat_o=sdram_dat_o&{32{(arbstate==prefetch)}};  
        
     sdram_top SDRAM (
    `ifdef USE_POWER_PINS
	   .vccd1(vccd1),	// User area 1 1.8V power
	   .vssd1(vssd1),	// User area 1 digital ground
    `endif

        .wb_clk_i(clk),
        .wb_rst_i(rst),
    
        .wbs_cyc_i(sdram_cyc_i),
        .wbs_stb_i(sdram_stb_i),
        .wbs_we_i(sdram_we_i),
        .wbs_sel_i(sdram_sel_i),
        .wbs_adr_i(sdram_adr_i),
        .wbs_dat_i(sdram_dat_i),
        .wbs_ack_o(sdram_ack_o),
        .wbs_dat_o(sdram_dat_o)


        );



endmodule


module buffer   (
    input         clk,
    input         rst,
    // arb1state 30000

    input   [2:0] init_ready,
    input   [31:0] xaddr,
    input   [31:0] aaddr,
    input   [31:0] qaddr,
    // Wishbone Interface 4 mm
    
    input         buffer_stb_i,
    input         buffer_cyc_i,
    input         buffer_we_i,
    input  [3:0]  buffer_sel_i,
    input  [31:0] buffer_dat_i,
    input  [31:0] buffer_adr_i,
    output         buffer_ack_o,
    output  [31:0] buffer_dat_o,
    
    output         pre_stb_i,
    output         pre_cyc_i,
    output         pre_we_i,
    output  [3:0]  pre_sel_i,
    output  [31:0] pre_dat_i,
    output  [31:0] pre_adr_i,
    input         pre_ack_o,
    input  [31:0] pre_dat_o,
    input start,

    // state output
    output wire xbuffer_state,
    output wire qbuffer_state,
    output wire abuffer_state,
    input  wire [4:0]decode,
    input  [31:0] wb_dat_i,
    input  [31:0] wb_adr_i
);


 localparam  RESET = 3'd0,IDLE = 3'd1, get_x= 3'd2, get_a = 3'd3,get_q=3'd4,xOUT=3'd2,aOUT=3'd3,qOUT=3'd4;
 localparam  cpu_read = 5'd2, cpu_write= 5'd3, fir_read = 5'd4 , fir_write=5'd5, qsort_read = 5'd6, qsort_write = 5'd7 , mm_read = 5'd8, mm_write = 5'd9;
assign buffer_ack_o = (ostate==xOUT)|(ostate==aOUT)|(ostate==qOUT);
assign buffer_dat_o = ({32{ostate==xOUT}}&xram[x_out_counter])|({32{ostate==aOUT}}&aram[a_out_counter])|({32{ostate==qOUT}}&qram[q_out_counter]);
reg [31:0] addrx_counter,addra_counter,addrq_counter;
assign pre_cyc_i = (state == get_x|state == get_q|state == get_a);
assign pre_stb_i = (state == get_x|state == get_q|state == get_a);
assign pre_we_i = 0;
assign pre_sel_i = {4{state == get_x}}|{4{state == get_q}}|{4{state == get_a}};
assign pre_adr_i = ({32{state == get_x}}&(xaddr+addrx_counter))|({32{state == get_a}}&(aaddr+addra_counter))|({32{state == get_q}}&(qaddr+addrq_counter));
assign pre_dat_i = 0;
assign xbuffer_state=(x_empty!=0)&state!=get_x;
assign qbuffer_state=(q_empty!=0)&state!=get_q;
assign abuffer_state=(a_empty!=0)&state!=get_a;
reg [2:0]x_out_counter,a_out_counter,q_out_counter;
reg [2:0]state,n_state,ostate,n_ostate;
reg addr_x,addr_a;
reg [31:0] xram[8:0],aram[7:0],qram[7:0];
reg [3:0]q_empty,a_empty,x_empty;
reg [31:0] q_counter,a_counter,x_counter;
   always @(*) begin 
        case (state)
        
             RESET: begin 
             if(init_ready==3'b111)begin
             n_state =IDLE;
             end
             else begin
             n_state =RESET;
             end
             
             end
             IDLE: begin
             if(x_empty==0) n_state =get_x;
             else if (q_empty==0) n_state = get_q;
             else if (a_empty==0) n_state = get_a;
             else n_state = IDLE;
             
             end
                          
             get_x: begin 
             if(x_empty==7) n_state =IDLE;
             else  n_state = get_x;
             
             end             
             get_q:begin 
             if(q_empty==7) n_state =IDLE;
             else  n_state = get_q;
             
             end                 
             get_a:begin 
             if(a_empty==7) n_state = IDLE;
             else  n_state = get_a;
             
             end    
               
            default: begin 
             n_state  = state;
            end
        endcase
    end
    
       always @(*) begin 
        case (ostate)
        
             RESET: begin 
             if(init_ready==3'b111)begin
             n_ostate =IDLE;
             end
             else begin
             n_ostate =RESET;
             end
             
             end
             IDLE: begin
             if (buffer_cyc_i& (x_empty!=0)&(decode==fir_read)) begin
             n_ostate=xOUT;
             end
             else if (buffer_cyc_i& (q_empty!=0)&(decode==qsort_read)) begin
             n_ostate=qOUT;
             end
             else if (buffer_cyc_i& (a_empty!=0)&(decode==mm_read)) begin
             n_ostate=aOUT;
             end 
             else n_ostate = IDLE;
             
             end             
             xOUT: begin
             
             n_ostate=IDLE;
             end     
             aOUT: begin
             
             n_ostate=IDLE;
             end  
             qOUT: begin
             
             n_ostate=IDLE;
             end    
            default: begin 
             n_ostate  = ostate;
            end
        endcase
    end
    
    
   always @(posedge clk or posedge rst)begin
	    if(rst) begin
            ostate<=RESET;
    	    end
    	   else begin
            ostate<=n_ostate;
    	   end
    end
    
    
      always @(posedge clk or posedge rst)begin
	    if(rst) begin
            state<=RESET;
    	    end
    	   else begin
            state<=n_state;
    	   end
    end
    
    wire [31:0]n_addrx;
    assign n_addrx= addrx_counter+4;
    wire [3:0] n_xempty;
    assign n_xempty= x_empty+1;
     always @(posedge clk or posedge rst)begin
	    if(rst) begin
             x_empty<=0;
             addrx_counter<=0;
    	    end
    	   else begin
    	   if (pre_ack_o & state==get_x) begin
             x_empty<=n_xempty;
             addrx_counter<=n_addrx;
             xram[x_empty]<=pre_dat_o;
    	   end    
    	   else if (ostate==xOUT) begin
    	      x_empty<=x_empty-1;
    	   end	      
    	   else begin
    	      x_empty<=x_empty;
    	   end
    	   end
    end
    
     wire [31:0]n_addra;
    assign n_addra= addra_counter+4;
    wire [3:0] n_aempty;
    assign n_aempty= a_empty+1;

    
    
    
     always @(posedge clk or posedge rst)begin
	    if(rst) begin
             a_empty<=0;
             addra_counter<=0;
    	    end
    	   else begin
    	   if (pre_ack_o & state==get_a) begin
             a_empty<=n_aempty;             
             addra_counter<=n_addra;             
             aram[a_empty]<=pre_dat_o;
    	   end    
    	   else if (ostate==aOUT) begin
    	      a_empty<=a_empty-1;
    	   end	      
    	   else begin
    	      a_empty<=a_empty;
    	   end
    	   end
    end
    always @(posedge clk or posedge rst)begin
	    if(rst) begin
             q_empty<=0;
             addrq_counter<=0;
    	    end
    	   else begin
    	   if (pre_ack_o & state==get_q) begin
             q_empty<=q_empty+1;
             addrq_counter<=addrq_counter+4;
             qram[q_empty]<=pre_dat_o;
    	   end    
    	   else if (ostate==qOUT) begin
    	      q_empty<=q_empty-1;
    	   end	      
    	   else begin
    	      q_empty<=q_empty;
    	   end
    	   end
    end


    
         always @(posedge clk or posedge rst)begin
	    if(rst) begin
             a_out_counter<=0;
    	    end
    	   else begin
    	   if (ostate==aOUT) begin
    	     if(a_out_counter!=8)
             a_out_counter<=a_out_counter+1;
             else
             a_out_counter<=0;    
    	   end    	      
    	   else begin
    	      a_out_counter<=a_out_counter;
    	   end
    	   end
    end
    
    always @(posedge clk or posedge rst)begin
	    if(rst) begin
             q_out_counter<=0;
    	    end
    	   else begin
    	   if (ostate==qOUT) begin
    	     if(q_out_counter!=8)
             q_out_counter<=q_out_counter+1;
             else
             q_out_counter<=0;    
    	   end    	      
    	   else begin
    	      q_out_counter<=q_out_counter;
    	   end
    	   end
    end
    
    always @(posedge clk or posedge rst)begin
	    if(rst) begin
             x_out_counter<=0;
    	    end
    	   else begin
    	   if (ostate==xOUT) begin
    	     if(x_out_counter!=8)
             x_out_counter<=x_out_counter+1;
             else
             x_out_counter<=0;    
    	   end    	      
    	   else begin
    	      x_out_counter<=x_out_counter;
    	   end
    	   end
    end
    
    
/////test part //////////
wire [31:0]x0,x1,x2,x3,x4,x5,x6,x7;



assign x0 =xram[0];
assign x1 =xram[1];
assign x2 =xram[2];
assign x3 =xram[3];
assign x4 =xram[4];
assign x5 =xram[5];
assign x6 =xram[6];
assign x7 =xram[7];
assign x8 =xram[8];
wire [31:0]a0,a1,a2,a3,a4,a5,a6,a7;



assign a0 =aram[0];
assign a1 =aram[1];
assign a2 =aram[2];
assign a3 =aram[3];
assign a4 =aram[4];
assign a5 =aram[5];
assign a6 =aram[6];
assign a7 =aram[7];

wire [31:0]q0,q1,q2,q3,q4,q5,q6,q7;



assign q0 =qram[0];
assign q1 =qram[1];
assign q2 =qram[2];
assign q3 =qram[3];
assign q4 =qram[4];
assign q5 =qram[5];
assign q6 =qram[6];
assign q7 =qram[7];


endmodule

