`timescale 1ns / 1ps
module qs
#(  parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32,
    parameter Tape_Num    = 11
)
(
    // AXI4-Lite 

    output  wire                     ss_tready,  // ss_tready : Fir is ready for accepting input data.
    input   wire                     ss_tvalid,  // ss_tvalid : Data from testbench is valid.
    input   wire [(pDATA_WIDTH-1):0] ss_tdata,   // ss_tdata  : Data input.

    
    // AXI4-Stream

    
    input   wire                     sm_tready,  // sm_tready : Testbench is ready for accepting output data.
    output  wire                     sm_tvalid,  // sm_tvalid : Data from fir is valid.
    output  wire [(pDATA_WIDTH-1):0] sm_tdata,   // sm_tdata  : Data output.



    input   wire                     clk,   // Clock source.
    input   wire                     rst  // Global reset source, active low.
);


reg [1:0]               state, next_state;
wire [(pDATA_WIDTH-1):0] data_in;
assign data_in=ss_tdata;
assign ss_tready=(state==shift) ? 1'b1:1'b0;
assign sm_tvalid=(state==End)? 1'b1:1'b0;
assign sm_tdata=shift_reg [counter_y];
    localparam  RESET = 2'd0, IDLE = 2'd1, shift = 2'd2, End = 2'd3; 

always @(posedge clk or posedge rst) begin
        if(rst) begin
	    state      <= RESET;
	    end
        else begin
            state      <= next_state;
        end
 end
 wire [3:0] n_counter_x,n_counter_y;
 reg [3:0] counter_x, counter_y;
 assign n_counter_x= counter_x+4'd1;
 assign n_counter_y= counter_y+4'd1;
 always @(posedge clk or posedge rst) begin
        if(rst) begin
	    counter_x      <= 4'd0;
	    end
        else begin
           if (state ==shift) begin
            counter_x      <= n_counter_x;
           end
           else begin 
           end
        end
 end
  always @(posedge clk or posedge rst) begin
        if(rst) begin
	    counter_y      <= 4'd0;
	    end
        else begin
           if (sm_tready&(state==End)) begin
            counter_y      <= n_counter_y;
           end
           else begin 
           end
        end
 end
  always @(*) begin
        case(state) 
            RESET: begin
                    next_state = IDLE;
                    end
            IDLE: begin
                if( counter_x == 4'd10) begin
                next_state= End;
                end
                else if(ss_tvalid)begin
                next_state = shift;
                end            
                else begin
                    next_state =IDLE;
                end
            end
            shift: begin
                  next_state =IDLE;
            end
            End: begin
                if (counter_y==4'd10) begin
                    next_state = RESET;
                end
                else begin
                    next_state = End;
                end
            end
        endcase
    end
 // debug use   
 wire[31:0] sort0;
 assign sort0=shift_reg [0];
    
 wire[31:0] sort1;
 assign sort1=shift_reg [1];
 
 wire[31:0] sort2;
 assign sort2=shift_reg [2];
    
 wire[31:0] sort3;
 assign sort3=shift_reg [3];
 
  wire[31:0] sort4;
 assign sort4=shift_reg [4];
    
 wire[31:0] sort5;
 assign sort5=shift_reg [5];
 
 
  wire[31:0] sort6;
 assign sort6=shift_reg [6];
    
 wire[31:0] sort7;
 assign sort7=shift_reg [7];
 
  wire[31:0] sort8;
 assign sort8=shift_reg [8];
    
 wire[31:0] sort9;
 assign sort9=shift_reg [9];
 
 
 
 reg [31:0] shift_reg [9:0], n_shift_reg[9:0];  
 integer i;
 always @(posedge clk or posedge rst) begin
        if(rst) begin
	    for (i=0;i<10;i=i+1)begin
	    shift_reg[i]<=32'hffff_ffff;
	    end
	end
        else begin
            for (i=0;i<10;i=i+1)begin
	    shift_reg[i]<=n_shift_reg[i];
	    end
        end
 end   
 
 
 wire [3:0] index ; // should compared reg to design 
 assign index = ( data_in < shift_reg[0] )? 4'd0 :  ( data_in < shift_reg[1] )? 4'd1 : ( data_in < shift_reg[2] )? 4'd2 :( data_in < shift_reg[3] )? 4'd3 :( data_in < shift_reg[4] )? 4'd4 :( data_in < shift_reg[5] )? 4'd5 :( data_in < shift_reg[6] )? 4'd6 :( data_in < shift_reg[7] )? 4'd7 :( data_in < shift_reg[8] )? 4'd8 :4'd9 ;
 
 always @* begin
 if (state==shift) begin
    case (index)
     4'd0:  begin

      n_shift_reg[0]=data_in;   
      for (i=1;i<10;i=i+1)begin
      n_shift_reg[i]=shift_reg[i-1];
      end  
 
end
     4'd1:  begin 
      for (i=0;i<1;i=i+1)begin
      n_shift_reg[i]=shift_reg[i];
      end   
      n_shift_reg[1]=data_in;   
      for (i=2;i<10;i=i+1)begin
      n_shift_reg[i]=shift_reg[i-1];
      end       
     
end     
     4'd2:  begin
      for (i=0;i<2;i=i+1)begin
      n_shift_reg[i]=shift_reg[i];
      end   
      n_shift_reg[2]=data_in;   
      for (i=3;i<10;i=i+1)begin
      n_shift_reg[i]=shift_reg[i-1];
      end       
     
     
end     
     4'd3:  begin 
      for (i=0;i<3;i=i+1)begin
      n_shift_reg[i]=shift_reg[i];
      end   
      n_shift_reg[3]=data_in;   
      for (i=4;i<10;i=i+1)begin
      n_shift_reg[i]=shift_reg[i-1];
      end  


end
     4'd4:  begin
      for (i=0;i<4;i=i+1)begin
      n_shift_reg[i]=shift_reg[i];
      end   
      n_shift_reg[4]=data_in;   
      for (i=5;i<10;i=i+1)begin
      n_shift_reg[i]=shift_reg[i-1];
      end   
 
end
     4'd5:  begin 
      for (i=0;i<5;i=i+1)begin
      n_shift_reg[i]=shift_reg[i];
      end   
      n_shift_reg[5]=data_in;   
      for (i=6;i<10;i=i+1)begin
      n_shift_reg[i]=shift_reg[i-1];
      end       
     
end     
     4'd6:  begin
      for (i=0;i<6;i=i+1)begin
      n_shift_reg[i]=shift_reg[i];
      end   
      n_shift_reg[6]=data_in;   
      for (i=7;i<10;i=i+1)begin
      n_shift_reg[i]=shift_reg[i-1];
      end       
     
     
end     
     4'd7:  begin 
      for (i=0;i<7;i=i+1)begin
      n_shift_reg[i]=shift_reg[i];
      end   
      n_shift_reg[7]=data_in;   
      for (i=8;i<10;i=i+1)begin
      n_shift_reg[i]=shift_reg[i-1];
      end  


end
     4'd8:  begin
      for (i=0;i<8;i=i+1)begin
      n_shift_reg[i]=shift_reg[i];
      end   
      n_shift_reg[8]=data_in;   
      for (i=9;i<10;i=i+1)begin
      n_shift_reg[i]=shift_reg[i-1];
      end    

end
     4'd9:  begin 
      for (i=0;i<9;i=i+1)begin
      n_shift_reg[i]=shift_reg[i];
      end   
      n_shift_reg[9]=data_in;      

    
end     
    default: begin
       for (i=0;i<10;i=i+1)begin
       n_shift_reg[i]=shift_reg[i];
       end  
    end
    endcase
 end
 
 else begin
         for (i=0;i<10;i=i+1)begin
	  n_shift_reg[i]=shift_reg[i];
	  end   
 
 end
 
 end
    
    
    
endmodule
