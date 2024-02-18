
//------> /home/raid7_4/raid1_1/linux/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_in_wait_coupled_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_in_wait_coupled_v1 (idat, rdy, ivld, dat, irdy, vld);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] idat;
  output             rdy;
  output             ivld;
  input  [width-1:0] dat;
  input              irdy;
  input              vld;

  wire   [width-1:0] idat;
  wire               rdy;
  wire               ivld;

  assign idat = dat;
  assign rdy = irdy;
  assign ivld = vld;

endmodule


//------> /home/raid7_4/raid1_1/linux/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_in_wait_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_in_wait_v1 (idat, rdy, ivld, dat, irdy, vld);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] idat;
  output             rdy;
  output             ivld;
  input  [width-1:0] dat;
  input              irdy;
  input              vld;

  wire   [width-1:0] idat;
  wire               rdy;
  wire               ivld;

  localparam stallOff = 0; 
  wire                  stall_ctrl;
  assign stall_ctrl = stallOff;

  assign idat = dat;
  assign rdy = irdy && !stall_ctrl;
  assign ivld = vld && !stall_ctrl;

endmodule


//------> /home/raid7_4/raid1_1/linux/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_out_wait_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_out_wait_v1 (dat, irdy, vld, idat, rdy, ivld);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] dat;
  output             irdy;
  output             vld;
  input  [width-1:0] idat;
  input              rdy;
  input              ivld;

  wire   [width-1:0] dat;
  wire               irdy;
  wire               vld;

  localparam stallOff = 0; 
  wire stall_ctrl;
  assign stall_ctrl = stallOff;

  assign dat = idat;
  assign irdy = rdy && !stall_ctrl;
  assign vld = ivld && !stall_ctrl;

endmodule



//------> /home/raid7_4/raid1_1/linux/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/mgc_io_sync_v2.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module mgc_io_sync_v2 (ld, lz);
    parameter valid = 0;

    input  ld;
    output lz;

    wire   lz;

    assign lz = ld;

endmodule


//------> /home/raid7_4/raid1_1/linux/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_out_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2015 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------

module ccs_out_v1 (dat, idat);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output   [width-1:0] dat;
  input    [width-1:0] idat;

  wire     [width-1:0] dat;

  assign dat = idat;

endmodule




//------> /home/raid7_4/raid1_1/linux/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_genreg_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------

module ccs_genreg_v1 (clk, en, arst, srst, d, z);
    parameter integer width   = 1;
    parameter integer ph_clk  = 1;
    parameter integer ph_en   = 1;
    parameter integer ph_arst = 0;
    parameter integer ph_srst = 1;
    parameter         has_en  = 1'b1;

    input clk;
    input en;
    input arst;
    input srst;
    input      [width-1:0] d;
    output reg [width-1:0] z;

    //  Generate parameters
    //  ph_clk | ph_arst | has_en     Label:
    //    1        1          1       GEN_CLK1_ARST1_EN1
    //    1        1          0       GEN_CLK1_ARST1_EN0
    //    1        0          1       GEN_CLK1_ARST0_EN1
    //    1        0          0       GEN_CLK1_ARST0_EN0
    //    0        1          1       GEN_CLK0_ARST1_EN1
    //    0        1          0       GEN_CLK0_ARST1_EN0
    //    0        0          1       GEN_CLK0_ARST0_EN1
    //    0        0          0       GEN_CLK0_ARST0_EN0
    
    generate 
      // Pos edge clock, pos edge async reset, has enable
      if (ph_clk == 1 & ph_arst == 1 & has_en == 1)
      begin: GEN_CLK1_ARST1_EN1
        always @(posedge clk or posedge arst)
          if (arst == 1'b1)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else if (en == $unsigned(ph_en))
            z <= d;
      end  //GEN_CLK1_ARST1_EN1

      // Pos edge clock, pos edge async reset, no enable
      else if (ph_clk == 1 & ph_arst == 1 & has_en == 0)
      begin: GEN_CLK1_ARST1_EN0
        always @(posedge clk or posedge arst)
          if (arst == 1'b1)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else
            z <= d;
      end  //GEN_CLK1_ARST1_EN0

      // Pos edge clock, neg edge async reset, has enable
      else if (ph_clk == 1 & ph_arst == 0 & has_en == 1)
      begin: GEN_CLK1_ARST0_EN1
        always @(posedge clk or negedge arst)
          if (arst == 1'b0)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else if (en == $unsigned(ph_en))
            z <= d;
      end  //GEN_CLK1_ARST0_EN1

      // Pos edge clock, neg edge async reset, no enable
      else if (ph_clk == 1 & ph_arst == 0 & has_en == 0)
      begin: GEN_CLK1_ARST0_EN0
        always @(posedge clk or negedge arst)
          if (arst == 1'b0)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else
            z <= d;
      end  //GEN_CLK1_ARST0_EN0


      // Neg edge clock, pos edge async reset, has enable
      if (ph_clk == 0 & ph_arst == 1 & has_en == 1)
      begin: GEN_CLK0_ARST1_EN1
        always @(negedge clk or posedge arst)
          if (arst == 1'b1)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else if (en == $unsigned(ph_en))
            z <= d;
      end  //GEN_CLK0_ARST1_EN1

      // Neg edge clock, pos edge async reset, no enable
      else if (ph_clk == 0 & ph_arst == 1 & has_en == 0)
      begin: GEN_CLK0_ARST1_EN0
        always @(negedge clk or posedge arst)
          if (arst == 1'b1)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else
            z <= d;
      end  //GEN_CLK0_ARST1_EN0

      // Neg edge clock, neg edge async reset, has enable
      else if (ph_clk == 0 & ph_arst == 0 & has_en == 1)
      begin: GEN_CLK0_ARST0_EN1
        always @(negedge clk or negedge arst)
          if (arst == 1'b0)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else if (en == $unsigned(ph_en))
            z <= d;
      end  //GEN_CLK0_ARST0_EN1

      // Neg edge clock, neg edge async reset, no enable
      else if (ph_clk == 0 & ph_arst == 0 & has_en == 0)
      begin: GEN_CLK0_ARST0_EN0
        always @(negedge clk or negedge arst)
          if (arst == 1'b0)
            z <= {width{1'b0}};
          else if (srst == $unsigned(ph_srst))
            z <= {width{1'b0}};
          else
            z <= d;
      end  //GEN_CLK0_ARST0_EN0
    endgenerate
endmodule


//------> /home/raid7_4/raid1_1/linux/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_fifo_wait_core_v5.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------

/*
 *            _________________________________________________
 * WRITER    |                                                 |   READER
 *           |               ccs_fifo_wait_core                |
 *           |             _____________________               |
 *        --<|  din_rdy --<|  ---------------- <|--- dout_rdy <|---
 *           |             |       FIFO         |              |
 *        ---|> din_vld ---|> ----------------  |>-- dout_vld  |>--
 *        ---|>     din ---|> ----------------  |>-- dout      |>--
 *           |             |____________________|              |
 *           |_________________________________________________|
 *
 *    rdy    - can be considered as a notFULL signal
 *    vld    - can be considered as a notEMPTY signal
 *    is_idle - clk can be safely gated
 *
 * Change History:
 *    2019-01-24 - Add assertion to verify rdy signal behavior under reset.
 *                 Fix bug in that behavior.
 */

module ccs_fifo_wait_core_v5 (clk, en, arst, srst, din_vld, din_rdy, din, dout_vld, dout_rdy, dout, sd, is_idle);

    parameter integer rscid    = 0;     // resource ID
    parameter integer width    = 8;     // fifo width
    parameter integer sz_width = 8;     // size of port for elements in fifo
    parameter integer fifo_sz  = 8;     // fifo depth
    parameter integer ph_clk   = 1;     // clock polarity 1=rising edge, 0=falling edge
    parameter integer ph_en    = 1;     // clock enable polarity
    parameter integer ph_arst  = 1;     // async reset polarity
    parameter integer ph_srst  = 1;     // sync reset polarity
    parameter integer ph_log2  = 3;     // log2(fifo_sz)

    input                 clk;
    input                 en;
    input                 arst;
    input                 srst;
    input                 din_vld;    // writer has valid data
    output                din_rdy;    // fifo ready for data (not full)
    input  [width-1:0]    din;
    output                dout_vld;   // fifo has valid data (not empty)
    input                 dout_rdy;   // reader ready for data
    output [width-1:0]    dout;
    output [sz_width-1:0] sd;
    output                is_idle;

    localparam integer fifo_b  = width * fifo_sz;
    localparam integer fifo_mx = (fifo_sz > 0) ? (fifo_sz-1) : 0 ;
    localparam integer fifo_mx_over_8 = fifo_mx / 8 ;

    reg      [fifo_mx:0] stat_pre;
    wire     [fifo_mx:0] stat;
    reg      [( (fifo_b > 0) ? fifo_b : 1)-1:0] buff_pre;
    wire     [( (fifo_b > 0) ? fifo_b : 1)-1:0] buff;
    reg      [fifo_mx:0] en_l;
    reg      [fifo_mx_over_8:0] en_l_s;

    reg      [width-1:0] buff_nxt;

    reg                  stat_nxt;
    reg                  stat_behind;
    reg                  stat_ahead;
    reg                  stat_tail;
    reg                  en_l_var;

    integer              i;
    genvar               eni;

    wire [32:0]          size_t;
    reg  [31:0]          count;
    reg  [31:0]          count_t;
    reg  [32:0]          n_elem;
    wire                 din_rdy_drv;
    wire                 dout_vld_drv;
    wire                 din_vld_int;
    wire                 hs_init;
    wire                 active;
    wire                 is_idle_drv;

    // synopsys translate_off
    reg  [31:0]          peak;
    initial
    begin
      peak  = 32'b0;
    end
    // synopsys translate_on

    assign din_rdy = din_rdy_drv;
    assign dout_vld = dout_vld_drv;
    assign is_idle = is_idle_drv;

    generate
    if ( fifo_sz > 0 )
    begin: FIFO_REG
      assign din_vld_int = din_vld & hs_init;
      assign din_rdy_drv = (dout_rdy | (~stat[0])) & hs_init;
      assign dout_vld_drv = din_vld_int | stat[fifo_sz-1];

      assign active = (din_vld_int & din_rdy_drv) | (dout_rdy & dout_vld_drv);
      assign is_idle_drv = (~active) & hs_init;

      assign size_t = (count - {31'b0, (dout_rdy & stat[fifo_sz-1])}) + {31'b0, din_vld_int};
      assign sd = size_t[sz_width-1:0];

      assign dout = (stat[fifo_sz-1]) ? buff[fifo_b-1:width*(fifo_sz-1)] : din;

      always @(*)
      begin: FIFOPROC
        n_elem = 33'b0;
        for (i = fifo_sz-1; i >= 0; i = i - 1)
        begin
          stat_behind = (i != 0) ? stat[i-1] : 1'b0;
          stat_ahead  = (i != (fifo_sz-1)) ? stat[i+1] : 1'b1;

          // Determine if this buffer element will have data
          stat_nxt = stat_ahead &                       // valid element ahead of this one (or head)
                       (stat_behind                     // valid element behind this one
                         | (stat[i] & (~dout_rdy))      // valid element and output not ready (in use and not shifted)
                         | (stat[i] & din_vld_int)      // valid element and input has data
                         | (din_vld_int & (~dout_rdy))  // input has data and output not ready
                       );
          stat_pre[i] = stat_nxt;

          // First empty elem when not shifting or last valid elem after shifting (assumes stat_behind == 0)
          stat_tail = stat_ahead & (((~stat[i]) & (~dout_rdy)) | (stat[i] & dout_rdy));

          if (dout_rdy & stat_behind)
          begin
            // shift valid element
            buff_nxt[0+:width] = buff[width*(i-1)+:width];
            en_l_var = 1'b1;
          end
          else if (din_vld_int & stat_tail)
          begin
            // update tail with input data
            buff_nxt = din;
            en_l_var = 1'b1;
          end
          else
          begin
            // no-op, disable register
            buff_nxt = din; // Don't care input to disabled flop
            en_l_var = 1'b0;
          end
          buff_pre[width*i+:width] = buff_nxt[0+:width];

          if (ph_en != 0)
            en_l[i] = en & en_l_var;
          else
            en_l[i] = en | ~en_l_var;

          if ((stat_ahead == 1'b1) & (stat[i] == 1'b0))
            //found tail, update the number of elements for count
            n_elem = ($unsigned(fifo_sz) - 1) - $unsigned(i);
        end //for loop

        // Enable for stat registers (partitioned into banks of eight)
        // Take care of the head first
        if (ph_en != 0)
          en_l_s[(((fifo_sz > 0) ? fifo_sz : 1)-1)/8] = en & active;
        else
          en_l_s[(((fifo_sz > 0) ? fifo_sz : 1)-1)/8] = en | ~active;

        // Now every eight
        for (i = fifo_sz-1; i >= 7; i = i - 1)
        begin
          if (($unsigned(i) % 32'd8) == 0)
          begin
            if (ph_en != 0)
              en_l_s[(i/8)-1] = en & (stat[i]) & (active);
            else
              en_l_s[(i/8)-1] = (en) | (~stat[i]) | (~active);
          end
        end

        // Update count and peak
        if ( stat[fifo_sz-1] == 1'b0 )
          count_t = 32'b0;
        else if ( stat[0] == 1'b1 )
          count_t = fifo_sz;
        else
          count_t = n_elem[31:0];
        count = count_t;
        // synopsys translate_off
        peak = (peak < count) ? count : peak;
        // synopsys translate_on
      end //FIFOPROC

      // Handshake valid after reset
      ccs_genreg_v1
      #(
        .width   (1),
        .ph_clk  (ph_clk),
        .ph_en   (1),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst),
        .has_en  (1'b0)
      )
      HS_INIT_REG
      (
        .clk     (clk),
        .en      (1'b1),
        .arst    (arst),
        .srst    (srst),
        .d       (1'b1),
        .z       (hs_init)
      );

      // Buffer and status registers
      for (eni = fifo_sz-1; eni >= 0; eni = eni - 1)
      begin: GEN_REGS
        ccs_genreg_v1
        #(
          .width   (1),
          .ph_clk  (ph_clk),
          .ph_en   (ph_en),
          .ph_arst (ph_arst),
          .ph_srst (ph_srst),
          .has_en  (1'b1)
        )
        STATREG
        (
          .clk     (clk),
          .en      (en_l_s[eni/8]),
          .arst    (arst),
          .srst    (srst),
          .d       (stat_pre[eni]),
          .z       (stat[eni])
        );

        ccs_genreg_v1
        #(
          .width   (width),
          .ph_clk  (ph_clk),
          .ph_en   (ph_en),
          .ph_arst (ph_arst),
          .ph_srst (ph_srst),
          .has_en  (1'b1)
        )
        BUFREG
        (
          .clk     (clk),
          .en      (en_l[eni]),
          .arst    (arst),
          .srst    (srst),
          .d       (buff_pre[width*eni+:width]),
          .z       (buff[width*eni+:width])
        );
      end

    end
    else
    begin: FEED_THRU
      assign din_rdy_drv  = dout_rdy;
      assign dout_vld_drv = din_vld;
      assign dout     = din;
      // non-blocking is not II=1 when fifo_sz=0
      assign sd = {{(sz_width-1){1'b0}}, (din_vld & ~dout_rdy)};
      assign is_idle_drv = ~(din_vld & dout_rdy);
    end
    endgenerate

`ifdef RDY_ASRT
    generate
    if (ph_clk==1)
    begin: POS_CLK_ASSERT

       property rdyAsrt ;
         @(posedge clk) (srst==ph_srst) |=> (din_rdy==0);
       endproperty
       a1Pos: assert property(rdyAsrt);

       property rdyAsrtASync ;
         @(posedge clk) (arst==ph_arst) |-> (din_rdy==0);
       endproperty
       a2Pos: assert property(rdyAsrtASync);

    end else if (ph_clk==0)
    begin: NEG_CLK_ASSERT

       property rdyAsrt ;
         @(negedge clk) ((srst==ph_srst) || (arst==ph_arst)) |=> (din_rdy==0);
       endproperty
       a1Neg: assert property(rdyAsrt);

       property rdyAsrtASync ;
         @(negedge clk) (arst==ph_arst) |-> (din_rdy==0);
       endproperty
       a2Neg: assert property(rdyAsrtASync);

    end
    endgenerate
`endif

endmodule

//------> /home/raid7_4/raid1_1/linux/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_pipe_v6.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------
/*
 *
 *            _______________________________________________
 * WRITER    |                                              |          READER
 *           |                 ccs_pipe                     |
 *           |            ______________________            |
 *        --<| din_rdy --<|  ---------------- <|---dout_rdy<|---
 *           |            |       FIFO         |            |
 *        ---|>din_vld ---|> ----------------  |>--dout_vld |>--
 *        ---|>din -------|> ----------------  |> -----dout |>--
 *           |            |____________________|            |
 *           |______________________________________________|
 *
 *    din_rdy     - can be considered as a notFULL signal
 *    dout_vld    - can be considered as a notEMPTY signal
 *    write_stall - an internal debug signal formed from din_vld & !din_rdy
 *    read_stall  - an internal debug signal formed from dout_rdy & !dout_vld
 *    is_idle     - indicates the clock can be safely gated
 *    stall_ctrl  - Stall the pipe(fifo).  Used by STALL_FLAG_SV directive
 */

module ccs_pipe_v6 (clk, en, arst, srst, din_rdy, din_vld, din, dout_rdy, dout_vld, dout, 
                    sz, sz_req, is_idle);

    parameter integer rscid    = 0; // resource ID
    parameter integer width    = 8; // fifo width
    parameter integer sz_width = 8; // width of size of elements in fifo
    parameter integer fifo_sz  = 8; // fifo depth
    parameter integer log2_sz  = 3; // log2(fifo_sz)
    parameter integer ph_clk   = 1; // clock polarity 1=rising edge, 0=falling edge
    parameter integer ph_en    = 1; // clock enable polarity
    parameter integer ph_arst  = 1; // async reset polarity
    parameter integer ph_srst  = 1; // sync reset polarity

    // clock 
    input              clk;
    input              en;
    input              arst;
    input              srst;

    // writer
    output             din_rdy;
    input              din_vld;
    input  [width-1:0] din;

    // reader
    input              dout_rdy;
    output             dout_vld;
    output [width-1:0] dout;

    // size
    output [sz_width-1:0] sz;
    input                 sz_req;
    output                is_idle;

    localparam stallOff = 0; 
    wire                  stall_ctrl;
    assign stall_ctrl = stallOff;
   
    // synopsys translate_off
    wire   write_stall;
    wire   read_stall;
    assign write_stall = (din_vld & !din_rdy) | stall_ctrl;
    assign read_stall  = (dout_rdy & !dout_vld) | stall_ctrl;
    // synopsys translate_on

    wire    tmp_din_rdy;
    assign  din_rdy = tmp_din_rdy & !stall_ctrl;
    wire    tmp_dout_vld;
    assign  dout_vld = tmp_dout_vld & !stall_ctrl;
   
    ccs_fifo_wait_core_v5
    #(
        .rscid    (rscid),
        .width    (width),
        .sz_width (sz_width),
        .fifo_sz  (fifo_sz),
        .ph_clk   (ph_clk),
        .ph_en    (ph_en),
        .ph_arst  (ph_arst),
        .ph_srst  (ph_srst),
        .ph_log2  (log2_sz)
    )
    FIFO
    (
        .clk      (clk),
        .en       (en),
        .arst     (arst),
        .srst     (srst),
        .din_vld  (din_vld & !stall_ctrl),
        .din_rdy  (tmp_din_rdy),
        .din      (din),
        .dout_vld (tmp_dout_vld),
        .dout_rdy (dout_rdy & !stall_ctrl),
        .dout     (dout),
        .sd       (sz),
        .is_idle  (is_idle)
    );

endmodule


//------> ./EdgeDetect_Top.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2023.2/1059873 Production Release
//  HLS Date:       Mon Aug  7 10:54:31 PDT 2023
// 
//  Generated by:   b0126168@cad27
//  Generated date: Thu Sep 28 15:59:38 2023
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_VerDer_ccs_sample_mem_ccs_ram_sync_singleport_rwport_en_7_64_7_80_80_64_5_gen
// ------------------------------------------------------------------


module EdgeDetect_VerDer_ccs_sample_mem_ccs_ram_sync_singleport_rwport_en_7_64_7_80_80_64_5_gen
    (
  en, q, we, d, adr, adr_d, d_d, en_d, we_d, q_d, port_0_rw_ram_ir_internal_RMASK_B_d,
      port_0_rw_ram_ir_internal_WMASK_B_d
);
  output en;
  input [63:0] q;
  output we;
  output [63:0] d;
  output [6:0] adr;
  input [6:0] adr_d;
  input [63:0] d_d;
  input en_d;
  input we_d;
  output [63:0] q_d;
  input port_0_rw_ram_ir_internal_RMASK_B_d;
  input port_0_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign en = (en_d);
  assign q_d = q;
  assign we = (port_0_rw_ram_ir_internal_WMASK_B_d);
  assign d = (d_d);
  assign adr = (adr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_VerDer_ccs_sample_mem_ccs_ram_sync_singleport_rwport_en_6_64_7_80_80_64_5_gen
// ------------------------------------------------------------------


module EdgeDetect_VerDer_ccs_sample_mem_ccs_ram_sync_singleport_rwport_en_6_64_7_80_80_64_5_gen
    (
  en, q, we, d, adr, adr_d, d_d, en_d, we_d, q_d, port_0_rw_ram_ir_internal_RMASK_B_d,
      port_0_rw_ram_ir_internal_WMASK_B_d
);
  output en;
  input [63:0] q;
  output we;
  output [63:0] d;
  output [6:0] adr;
  input [6:0] adr_d;
  input [63:0] d_d;
  input en_d;
  input we_d;
  output [63:0] q_d;
  input port_0_rw_ram_ir_internal_RMASK_B_d;
  input port_0_rw_ram_ir_internal_WMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign en = (en_d);
  assign q_d = q;
  assign we = (port_0_rw_ram_ir_internal_WMASK_B_d);
  assign d = (d_d);
  assign adr = (adr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_VerDer_run_run_fsm
//  FSM Module
// ------------------------------------------------------------------


module EdgeDetect_VerDer_run_run_fsm (
  clk, rst, arst_n, run_wen, fsm_output, VROW_C_0_tr0
);
  input clk;
  input rst;
  input arst_n;
  input run_wen;
  output [2:0] fsm_output;
  reg [2:0] fsm_output;
  input VROW_C_0_tr0;


  // FSM State Type Declaration for EdgeDetect_VerDer_run_run_fsm_1
  parameter
    main_C_0 = 2'd0,
    VROW_C_0 = 2'd1,
    main_C_1 = 2'd2;

  reg [1:0] state_var;
  reg [1:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : EdgeDetect_VerDer_run_run_fsm_1
    case (state_var)
      VROW_C_0 : begin
        fsm_output = 3'b010;
        if ( VROW_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = VROW_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 3'b100;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 3'b001;
        state_var_NS = VROW_C_0;
      end
    endcase
  end

  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      state_var <= main_C_0;
    end
    else if ( rst ) begin
      state_var <= main_C_0;
    end
    else if ( run_wen ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_VerDer_run_staller
// ------------------------------------------------------------------


module EdgeDetect_VerDer_run_staller (
  run_wen, dat_in_rsci_wen_comp, pix_out_rsci_wen_comp, dy_rsci_wen_comp
);
  output run_wen;
  input dat_in_rsci_wen_comp;
  input pix_out_rsci_wen_comp;
  input dy_rsci_wen_comp;



  // Interconnect Declarations for Component Instantiations 
  assign run_wen = dat_in_rsci_wen_comp & pix_out_rsci_wen_comp & dy_rsci_wen_comp;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_VerDer_run_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_VerDer_run_wait_dp (
  line_buf0_rsci_en_d, run_wen, line_buf0_rsci_cgo, line_buf0_rsci_cgo_ir_unreg
);
  output line_buf0_rsci_en_d;
  input run_wen;
  input line_buf0_rsci_cgo;
  input line_buf0_rsci_cgo_ir_unreg;



  // Interconnect Declarations for Component Instantiations 
  assign line_buf0_rsci_en_d = run_wen & (line_buf0_rsci_cgo | line_buf0_rsci_cgo_ir_unreg);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_VerDer_run_dy_rsci_dy_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_VerDer_run_dy_rsci_dy_wait_dp (
  clk, rst, arst_n, dy_rsci_oswt, dy_rsci_wen_comp, dy_rsci_biwt, dy_rsci_bdwt, dy_rsci_bcwt
);
  input clk;
  input rst;
  input arst_n;
  input dy_rsci_oswt;
  output dy_rsci_wen_comp;
  input dy_rsci_biwt;
  input dy_rsci_bdwt;
  output dy_rsci_bcwt;
  reg dy_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign dy_rsci_wen_comp = (~ dy_rsci_oswt) | dy_rsci_biwt | dy_rsci_bcwt;
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dy_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      dy_rsci_bcwt <= 1'b0;
    end
    else begin
      dy_rsci_bcwt <= ~((~(dy_rsci_bcwt | dy_rsci_biwt)) | dy_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_VerDer_run_dy_rsci_dy_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_VerDer_run_dy_rsci_dy_wait_ctrl (
  run_wen, dy_rsci_oswt, dy_rsci_biwt, dy_rsci_bdwt, dy_rsci_bcwt, dy_rsci_irdy,
      dy_rsci_ivld_run_sct
);
  input run_wen;
  input dy_rsci_oswt;
  output dy_rsci_biwt;
  output dy_rsci_bdwt;
  input dy_rsci_bcwt;
  input dy_rsci_irdy;
  output dy_rsci_ivld_run_sct;


  // Interconnect Declarations
  wire dy_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign dy_rsci_bdwt = dy_rsci_oswt & run_wen;
  assign dy_rsci_biwt = dy_rsci_ogwt & dy_rsci_irdy;
  assign dy_rsci_ogwt = dy_rsci_oswt & (~ dy_rsci_bcwt);
  assign dy_rsci_ivld_run_sct = dy_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_VerDer_run_pix_out_rsci_pix_out_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_VerDer_run_pix_out_rsci_pix_out_wait_dp (
  clk, rst, arst_n, pix_out_rsci_oswt, pix_out_rsci_wen_comp, pix_out_rsci_biwt,
      pix_out_rsci_bdwt, pix_out_rsci_bcwt
);
  input clk;
  input rst;
  input arst_n;
  input pix_out_rsci_oswt;
  output pix_out_rsci_wen_comp;
  input pix_out_rsci_biwt;
  input pix_out_rsci_bdwt;
  output pix_out_rsci_bcwt;
  reg pix_out_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign pix_out_rsci_wen_comp = (~ pix_out_rsci_oswt) | pix_out_rsci_biwt | pix_out_rsci_bcwt;
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      pix_out_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      pix_out_rsci_bcwt <= 1'b0;
    end
    else begin
      pix_out_rsci_bcwt <= ~((~(pix_out_rsci_bcwt | pix_out_rsci_biwt)) | pix_out_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_VerDer_run_pix_out_rsci_pix_out_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_VerDer_run_pix_out_rsci_pix_out_wait_ctrl (
  run_wen, pix_out_rsci_oswt, pix_out_rsci_biwt, pix_out_rsci_bdwt, pix_out_rsci_bcwt,
      pix_out_rsci_irdy, pix_out_rsci_ivld_run_sct
);
  input run_wen;
  input pix_out_rsci_oswt;
  output pix_out_rsci_biwt;
  output pix_out_rsci_bdwt;
  input pix_out_rsci_bcwt;
  input pix_out_rsci_irdy;
  output pix_out_rsci_ivld_run_sct;


  // Interconnect Declarations
  wire pix_out_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign pix_out_rsci_bdwt = pix_out_rsci_oswt & run_wen;
  assign pix_out_rsci_biwt = pix_out_rsci_ogwt & pix_out_rsci_irdy;
  assign pix_out_rsci_ogwt = pix_out_rsci_oswt & (~ pix_out_rsci_bcwt);
  assign pix_out_rsci_ivld_run_sct = pix_out_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_VerDer_run_dat_in_rsci_dat_in_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_VerDer_run_dat_in_rsci_dat_in_wait_dp (
  clk, rst, arst_n, dat_in_rsci_oswt, dat_in_rsci_wen_comp, dat_in_rsci_idat_mxwt,
      dat_in_rsci_biwt, dat_in_rsci_bdwt, dat_in_rsci_bcwt, dat_in_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  input dat_in_rsci_oswt;
  output dat_in_rsci_wen_comp;
  output [31:0] dat_in_rsci_idat_mxwt;
  input dat_in_rsci_biwt;
  input dat_in_rsci_bdwt;
  output dat_in_rsci_bcwt;
  reg dat_in_rsci_bcwt;
  input [33:0] dat_in_rsci_idat;


  // Interconnect Declarations
  reg [31:0] dat_in_rsci_idat_bfwt_31_0;


  // Interconnect Declarations for Component Instantiations 
  assign dat_in_rsci_wen_comp = (~ dat_in_rsci_oswt) | dat_in_rsci_biwt | dat_in_rsci_bcwt;
  assign dat_in_rsci_idat_mxwt = MUX_v_32_2_2((dat_in_rsci_idat[31:0]), dat_in_rsci_idat_bfwt_31_0,
      dat_in_rsci_bcwt);
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dat_in_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      dat_in_rsci_bcwt <= 1'b0;
    end
    else begin
      dat_in_rsci_bcwt <= ~((~(dat_in_rsci_bcwt | dat_in_rsci_biwt)) | dat_in_rsci_bdwt);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dat_in_rsci_idat_bfwt_31_0 <= 32'b00000000000000000000000000000000;
    end
    else if ( rst ) begin
      dat_in_rsci_idat_bfwt_31_0 <= 32'b00000000000000000000000000000000;
    end
    else if ( dat_in_rsci_biwt ) begin
      dat_in_rsci_idat_bfwt_31_0 <= dat_in_rsci_idat[31:0];
    end
  end

  function automatic [31:0] MUX_v_32_2_2;
    input [31:0] input_0;
    input [31:0] input_1;
    input  sel;
    reg [31:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_32_2_2 = result;
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_VerDer_run_dat_in_rsci_dat_in_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_VerDer_run_dat_in_rsci_dat_in_wait_ctrl (
  run_wen, dat_in_rsci_oswt, dat_in_rsci_biwt, dat_in_rsci_bdwt, dat_in_rsci_bcwt,
      dat_in_rsci_irdy_run_sct, dat_in_rsci_ivld
);
  input run_wen;
  input dat_in_rsci_oswt;
  output dat_in_rsci_biwt;
  output dat_in_rsci_bdwt;
  input dat_in_rsci_bcwt;
  output dat_in_rsci_irdy_run_sct;
  input dat_in_rsci_ivld;


  // Interconnect Declarations
  wire dat_in_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign dat_in_rsci_bdwt = dat_in_rsci_oswt & run_wen;
  assign dat_in_rsci_biwt = dat_in_rsci_ogwt & dat_in_rsci_ivld;
  assign dat_in_rsci_ogwt = dat_in_rsci_oswt & (~ dat_in_rsci_bcwt);
  assign dat_in_rsci_irdy_run_sct = dat_in_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_HorDer_run_run_fsm
//  FSM Module
// ------------------------------------------------------------------


module EdgeDetect_HorDer_run_run_fsm (
  clk, rst, arst_n, run_wen, fsm_output, HROW_C_0_tr0
);
  input clk;
  input rst;
  input arst_n;
  input run_wen;
  output [2:0] fsm_output;
  reg [2:0] fsm_output;
  input HROW_C_0_tr0;


  // FSM State Type Declaration for EdgeDetect_HorDer_run_run_fsm_1
  parameter
    main_C_0 = 2'd0,
    HROW_C_0 = 2'd1,
    main_C_1 = 2'd2;

  reg [1:0] state_var;
  reg [1:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : EdgeDetect_HorDer_run_run_fsm_1
    case (state_var)
      HROW_C_0 : begin
        fsm_output = 3'b010;
        if ( HROW_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = HROW_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 3'b100;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 3'b001;
        state_var_NS = HROW_C_0;
      end
    endcase
  end

  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      state_var <= main_C_0;
    end
    else if ( rst ) begin
      state_var <= main_C_0;
    end
    else if ( run_wen ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_HorDer_run_staller
// ------------------------------------------------------------------


module EdgeDetect_HorDer_run_staller (
  run_wen, pix_in_rsci_wen_comp, pix_out_rsci_wen_comp, dx_rsci_wen_comp
);
  output run_wen;
  input pix_in_rsci_wen_comp;
  input pix_out_rsci_wen_comp;
  input dx_rsci_wen_comp;



  // Interconnect Declarations for Component Instantiations 
  assign run_wen = pix_in_rsci_wen_comp & pix_out_rsci_wen_comp & dx_rsci_wen_comp;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_HorDer_run_dx_rsci_dx_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_HorDer_run_dx_rsci_dx_wait_dp (
  clk, rst, arst_n, dx_rsci_oswt, dx_rsci_wen_comp, dx_rsci_biwt, dx_rsci_bdwt, dx_rsci_bcwt
);
  input clk;
  input rst;
  input arst_n;
  input dx_rsci_oswt;
  output dx_rsci_wen_comp;
  input dx_rsci_biwt;
  input dx_rsci_bdwt;
  output dx_rsci_bcwt;
  reg dx_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign dx_rsci_wen_comp = (~ dx_rsci_oswt) | dx_rsci_biwt | dx_rsci_bcwt;
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dx_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      dx_rsci_bcwt <= 1'b0;
    end
    else begin
      dx_rsci_bcwt <= ~((~(dx_rsci_bcwt | dx_rsci_biwt)) | dx_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_HorDer_run_dx_rsci_dx_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_HorDer_run_dx_rsci_dx_wait_ctrl (
  run_wen, dx_rsci_oswt, dx_rsci_biwt, dx_rsci_bdwt, dx_rsci_bcwt, dx_rsci_irdy,
      dx_rsci_ivld_run_sct
);
  input run_wen;
  input dx_rsci_oswt;
  output dx_rsci_biwt;
  output dx_rsci_bdwt;
  input dx_rsci_bcwt;
  input dx_rsci_irdy;
  output dx_rsci_ivld_run_sct;


  // Interconnect Declarations
  wire dx_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign dx_rsci_bdwt = dx_rsci_oswt & run_wen;
  assign dx_rsci_biwt = dx_rsci_ogwt & dx_rsci_irdy;
  assign dx_rsci_ogwt = dx_rsci_oswt & (~ dx_rsci_bcwt);
  assign dx_rsci_ivld_run_sct = dx_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_HorDer_run_pix_out_rsci_pix_out_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_HorDer_run_pix_out_rsci_pix_out_wait_dp (
  clk, rst, arst_n, pix_out_rsci_oswt, pix_out_rsci_wen_comp, pix_out_rsci_biwt,
      pix_out_rsci_bdwt, pix_out_rsci_bcwt
);
  input clk;
  input rst;
  input arst_n;
  input pix_out_rsci_oswt;
  output pix_out_rsci_wen_comp;
  input pix_out_rsci_biwt;
  input pix_out_rsci_bdwt;
  output pix_out_rsci_bcwt;
  reg pix_out_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign pix_out_rsci_wen_comp = (~ pix_out_rsci_oswt) | pix_out_rsci_biwt | pix_out_rsci_bcwt;
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      pix_out_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      pix_out_rsci_bcwt <= 1'b0;
    end
    else begin
      pix_out_rsci_bcwt <= ~((~(pix_out_rsci_bcwt | pix_out_rsci_biwt)) | pix_out_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_HorDer_run_pix_out_rsci_pix_out_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_HorDer_run_pix_out_rsci_pix_out_wait_ctrl (
  run_wen, pix_out_rsci_oswt, pix_out_rsci_biwt, pix_out_rsci_bdwt, pix_out_rsci_bcwt,
      pix_out_rsci_irdy, pix_out_rsci_ivld_run_sct
);
  input run_wen;
  input pix_out_rsci_oswt;
  output pix_out_rsci_biwt;
  output pix_out_rsci_bdwt;
  input pix_out_rsci_bcwt;
  input pix_out_rsci_irdy;
  output pix_out_rsci_ivld_run_sct;


  // Interconnect Declarations
  wire pix_out_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign pix_out_rsci_bdwt = pix_out_rsci_oswt & run_wen;
  assign pix_out_rsci_biwt = pix_out_rsci_ogwt & pix_out_rsci_irdy;
  assign pix_out_rsci_ogwt = pix_out_rsci_oswt & (~ pix_out_rsci_bcwt);
  assign pix_out_rsci_ivld_run_sct = pix_out_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_HorDer_run_pix_in_rsci_pix_in_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_HorDer_run_pix_in_rsci_pix_in_wait_ctrl (
  run_wen, pix_in_rsci_iswt0, pix_in_rsci_irdy_run_sct
);
  input run_wen;
  input pix_in_rsci_iswt0;
  output pix_in_rsci_irdy_run_sct;



  // Interconnect Declarations for Component Instantiations 
  assign pix_in_rsci_irdy_run_sct = pix_in_rsci_iswt0 & run_wen;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_MagAng_run_run_fsm
//  FSM Module
// ------------------------------------------------------------------


module EdgeDetect_MagAng_run_run_fsm (
  clk, rst, arst_n, run_wen, fsm_output, MROW_C_0_tr0
);
  input clk;
  input rst;
  input arst_n;
  input run_wen;
  output [2:0] fsm_output;
  reg [2:0] fsm_output;
  input MROW_C_0_tr0;


  // FSM State Type Declaration for EdgeDetect_MagAng_run_run_fsm_1
  parameter
    main_C_0 = 2'd0,
    MROW_C_0 = 2'd1,
    main_C_1 = 2'd2;

  reg [1:0] state_var;
  reg [1:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : EdgeDetect_MagAng_run_run_fsm_1
    case (state_var)
      MROW_C_0 : begin
        fsm_output = 3'b010;
        if ( MROW_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = MROW_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 3'b100;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 3'b001;
        state_var_NS = MROW_C_0;
      end
    endcase
  end

  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      state_var <= main_C_0;
    end
    else if ( rst ) begin
      state_var <= main_C_0;
    end
    else if ( run_wen ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_MagAng_run_staller
// ------------------------------------------------------------------


module EdgeDetect_MagAng_run_staller (
  clk, rst, arst_n, run_wen, run_wten, dx_in_rsci_wen_comp, dy_in_rsci_wen_comp,
      pix_in_rsci_wen_comp, dat_out_rsci_wen_comp
);
  input clk;
  input rst;
  input arst_n;
  output run_wen;
  output run_wten;
  reg run_wten;
  input dx_in_rsci_wen_comp;
  input dy_in_rsci_wen_comp;
  input pix_in_rsci_wen_comp;
  input dat_out_rsci_wen_comp;



  // Interconnect Declarations for Component Instantiations 
  assign run_wen = dx_in_rsci_wen_comp & dy_in_rsci_wen_comp & pix_in_rsci_wen_comp
      & dat_out_rsci_wen_comp;
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      run_wten <= 1'b0;
    end
    else if ( rst ) begin
      run_wten <= 1'b0;
    end
    else begin
      run_wten <= ~ run_wen;
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj_crc32_dat_out_triosy_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj_crc32_dat_out_triosy_wait_ctrl
    (
  run_wten, crc32_dat_out_triosy_obj_iswt0, crc32_dat_out_triosy_obj_biwt
);
  input run_wten;
  input crc32_dat_out_triosy_obj_iswt0;
  output crc32_dat_out_triosy_obj_biwt;



  // Interconnect Declarations for Component Instantiations 
  assign crc32_dat_out_triosy_obj_biwt = (~ run_wten) & crc32_dat_out_triosy_obj_iswt0;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj_crc32_pix_in_triosy_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj_crc32_pix_in_triosy_wait_ctrl
    (
  run_wten, crc32_pix_in_triosy_obj_iswt0, crc32_pix_in_triosy_obj_biwt
);
  input run_wten;
  input crc32_pix_in_triosy_obj_iswt0;
  output crc32_pix_in_triosy_obj_biwt;



  // Interconnect Declarations for Component Instantiations 
  assign crc32_pix_in_triosy_obj_biwt = (~ run_wten) & crc32_pix_in_triosy_obj_iswt0;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_dp (
  clk, rst, arst_n, dat_out_rsci_oswt, dat_out_rsci_wen_comp, dat_out_rsci_biwt,
      dat_out_rsci_bdwt, dat_out_rsci_bcwt
);
  input clk;
  input rst;
  input arst_n;
  input dat_out_rsci_oswt;
  output dat_out_rsci_wen_comp;
  input dat_out_rsci_biwt;
  input dat_out_rsci_bdwt;
  output dat_out_rsci_bcwt;
  reg dat_out_rsci_bcwt;



  // Interconnect Declarations for Component Instantiations 
  assign dat_out_rsci_wen_comp = (~ dat_out_rsci_oswt) | dat_out_rsci_biwt | dat_out_rsci_bcwt;
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dat_out_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      dat_out_rsci_bcwt <= 1'b0;
    end
    else begin
      dat_out_rsci_bcwt <= ~((~(dat_out_rsci_bcwt | dat_out_rsci_biwt)) | dat_out_rsci_bdwt);
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_ctrl (
  run_wen, dat_out_rsci_oswt, dat_out_rsci_biwt, dat_out_rsci_bdwt, dat_out_rsci_bcwt,
      dat_out_rsci_irdy, dat_out_rsci_ivld_run_sct
);
  input run_wen;
  input dat_out_rsci_oswt;
  output dat_out_rsci_biwt;
  output dat_out_rsci_bdwt;
  input dat_out_rsci_bcwt;
  input dat_out_rsci_irdy;
  output dat_out_rsci_ivld_run_sct;


  // Interconnect Declarations
  wire dat_out_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign dat_out_rsci_bdwt = dat_out_rsci_oswt & run_wen;
  assign dat_out_rsci_biwt = dat_out_rsci_ogwt & dat_out_rsci_irdy;
  assign dat_out_rsci_ogwt = dat_out_rsci_oswt & (~ dat_out_rsci_bcwt);
  assign dat_out_rsci_ivld_run_sct = dat_out_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_MagAng_run_pix_in_rsci_pix_in_wait_dp
// ------------------------------------------------------------------


module EdgeDetect_MagAng_run_pix_in_rsci_pix_in_wait_dp (
  clk, rst, arst_n, pix_in_rsci_oswt, pix_in_rsci_wen_comp, pix_in_rsci_idat_mxwt,
      pix_in_rsci_biwt, pix_in_rsci_bdwt, pix_in_rsci_bcwt, pix_in_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  input pix_in_rsci_oswt;
  output pix_in_rsci_wen_comp;
  output [31:0] pix_in_rsci_idat_mxwt;
  input pix_in_rsci_biwt;
  input pix_in_rsci_bdwt;
  output pix_in_rsci_bcwt;
  reg pix_in_rsci_bcwt;
  input [31:0] pix_in_rsci_idat;


  // Interconnect Declarations
  reg [31:0] pix_in_rsci_idat_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign pix_in_rsci_wen_comp = (~ pix_in_rsci_oswt) | pix_in_rsci_biwt | pix_in_rsci_bcwt;
  assign pix_in_rsci_idat_mxwt = MUX_v_32_2_2(pix_in_rsci_idat, pix_in_rsci_idat_bfwt,
      pix_in_rsci_bcwt);
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      pix_in_rsci_bcwt <= 1'b0;
    end
    else if ( rst ) begin
      pix_in_rsci_bcwt <= 1'b0;
    end
    else begin
      pix_in_rsci_bcwt <= ~((~(pix_in_rsci_bcwt | pix_in_rsci_biwt)) | pix_in_rsci_bdwt);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      pix_in_rsci_idat_bfwt <= 32'b00000000000000000000000000000000;
    end
    else if ( rst ) begin
      pix_in_rsci_idat_bfwt <= 32'b00000000000000000000000000000000;
    end
    else if ( pix_in_rsci_biwt ) begin
      pix_in_rsci_idat_bfwt <= pix_in_rsci_idat;
    end
  end

  function automatic [31:0] MUX_v_32_2_2;
    input [31:0] input_0;
    input [31:0] input_1;
    input  sel;
    reg [31:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_32_2_2 = result;
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_MagAng_run_pix_in_rsci_pix_in_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_MagAng_run_pix_in_rsci_pix_in_wait_ctrl (
  run_wen, pix_in_rsci_oswt, pix_in_rsci_biwt, pix_in_rsci_bdwt, pix_in_rsci_bcwt,
      pix_in_rsci_irdy_run_sct, pix_in_rsci_ivld
);
  input run_wen;
  input pix_in_rsci_oswt;
  output pix_in_rsci_biwt;
  output pix_in_rsci_bdwt;
  input pix_in_rsci_bcwt;
  output pix_in_rsci_irdy_run_sct;
  input pix_in_rsci_ivld;


  // Interconnect Declarations
  wire pix_in_rsci_ogwt;


  // Interconnect Declarations for Component Instantiations 
  assign pix_in_rsci_bdwt = pix_in_rsci_oswt & run_wen;
  assign pix_in_rsci_biwt = pix_in_rsci_ogwt & pix_in_rsci_ivld;
  assign pix_in_rsci_ogwt = pix_in_rsci_oswt & (~ pix_in_rsci_bcwt);
  assign pix_in_rsci_irdy_run_sct = pix_in_rsci_ogwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_MagAng_run_dy_in_rsci_dy_in_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_MagAng_run_dy_in_rsci_dy_in_wait_ctrl (
  run_wen, dy_in_rsci_iswt0, dy_in_rsci_irdy_run_sct
);
  input run_wen;
  input dy_in_rsci_iswt0;
  output dy_in_rsci_irdy_run_sct;



  // Interconnect Declarations for Component Instantiations 
  assign dy_in_rsci_irdy_run_sct = dy_in_rsci_iswt0 & run_wen;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_MagAng_run_dx_in_rsci_dx_in_wait_ctrl
// ------------------------------------------------------------------


module EdgeDetect_MagAng_run_dx_in_rsci_dx_in_wait_ctrl (
  run_wen, dx_in_rsci_iswt0, dx_in_rsci_irdy_run_sct
);
  input run_wen;
  input dx_in_rsci_iswt0;
  output dx_in_rsci_irdy_run_sct;



  // Interconnect Declarations for Component Instantiations 
  assign dx_in_rsci_irdy_run_sct = dx_in_rsci_iswt0 & run_wen;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_VerDer_run_dy_rsci
// ------------------------------------------------------------------


module EdgeDetect_VerDer_run_dy_rsci (
  clk, rst, arst_n, dy_rsc_dat, dy_rsc_vld, dy_rsc_rdy, run_wen, dy_rsci_oswt, dy_rsci_wen_comp,
      dy_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  output [35:0] dy_rsc_dat;
  output dy_rsc_vld;
  input dy_rsc_rdy;
  input run_wen;
  input dy_rsci_oswt;
  output dy_rsci_wen_comp;
  input [35:0] dy_rsci_idat;


  // Interconnect Declarations
  wire dy_rsci_biwt;
  wire dy_rsci_bdwt;
  wire dy_rsci_bcwt;
  wire dy_rsci_irdy;
  wire dy_rsci_ivld_run_sct;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd5),
  .width(32'sd36)) dy_rsci (
      .irdy(dy_rsci_irdy),
      .ivld(dy_rsci_ivld_run_sct),
      .idat(dy_rsci_idat),
      .rdy(dy_rsc_rdy),
      .vld(dy_rsc_vld),
      .dat(dy_rsc_dat)
    );
  EdgeDetect_VerDer_run_dy_rsci_dy_wait_ctrl EdgeDetect_VerDer_run_dy_rsci_dy_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dy_rsci_oswt(dy_rsci_oswt),
      .dy_rsci_biwt(dy_rsci_biwt),
      .dy_rsci_bdwt(dy_rsci_bdwt),
      .dy_rsci_bcwt(dy_rsci_bcwt),
      .dy_rsci_irdy(dy_rsci_irdy),
      .dy_rsci_ivld_run_sct(dy_rsci_ivld_run_sct)
    );
  EdgeDetect_VerDer_run_dy_rsci_dy_wait_dp EdgeDetect_VerDer_run_dy_rsci_dy_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dy_rsci_oswt(dy_rsci_oswt),
      .dy_rsci_wen_comp(dy_rsci_wen_comp),
      .dy_rsci_biwt(dy_rsci_biwt),
      .dy_rsci_bdwt(dy_rsci_bdwt),
      .dy_rsci_bcwt(dy_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_VerDer_run_pix_out_rsci
// ------------------------------------------------------------------


module EdgeDetect_VerDer_run_pix_out_rsci (
  clk, rst, arst_n, pix_out_rsc_dat, pix_out_rsc_vld, pix_out_rsc_rdy, run_wen, pix_out_rsci_oswt,
      pix_out_rsci_wen_comp, pix_out_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  output [31:0] pix_out_rsc_dat;
  output pix_out_rsc_vld;
  input pix_out_rsc_rdy;
  input run_wen;
  input pix_out_rsci_oswt;
  output pix_out_rsci_wen_comp;
  input [31:0] pix_out_rsci_idat;


  // Interconnect Declarations
  wire pix_out_rsci_biwt;
  wire pix_out_rsci_bdwt;
  wire pix_out_rsci_bcwt;
  wire pix_out_rsci_irdy;
  wire pix_out_rsci_ivld_run_sct;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd4),
  .width(32'sd32)) pix_out_rsci (
      .irdy(pix_out_rsci_irdy),
      .ivld(pix_out_rsci_ivld_run_sct),
      .idat(pix_out_rsci_idat),
      .rdy(pix_out_rsc_rdy),
      .vld(pix_out_rsc_vld),
      .dat(pix_out_rsc_dat)
    );
  EdgeDetect_VerDer_run_pix_out_rsci_pix_out_wait_ctrl EdgeDetect_VerDer_run_pix_out_rsci_pix_out_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .pix_out_rsci_oswt(pix_out_rsci_oswt),
      .pix_out_rsci_biwt(pix_out_rsci_biwt),
      .pix_out_rsci_bdwt(pix_out_rsci_bdwt),
      .pix_out_rsci_bcwt(pix_out_rsci_bcwt),
      .pix_out_rsci_irdy(pix_out_rsci_irdy),
      .pix_out_rsci_ivld_run_sct(pix_out_rsci_ivld_run_sct)
    );
  EdgeDetect_VerDer_run_pix_out_rsci_pix_out_wait_dp EdgeDetect_VerDer_run_pix_out_rsci_pix_out_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .pix_out_rsci_oswt(pix_out_rsci_oswt),
      .pix_out_rsci_wen_comp(pix_out_rsci_wen_comp),
      .pix_out_rsci_biwt(pix_out_rsci_biwt),
      .pix_out_rsci_bdwt(pix_out_rsci_bdwt),
      .pix_out_rsci_bcwt(pix_out_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_VerDer_run_dat_in_rsci
// ------------------------------------------------------------------


module EdgeDetect_VerDer_run_dat_in_rsci (
  clk, rst, arst_n, dat_in_rsc_dat, dat_in_rsc_vld, dat_in_rsc_rdy, run_wen, dat_in_rsci_oswt,
      dat_in_rsci_wen_comp, dat_in_rsci_idat_mxwt
);
  input clk;
  input rst;
  input arst_n;
  input [33:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input run_wen;
  input dat_in_rsci_oswt;
  output dat_in_rsci_wen_comp;
  output [31:0] dat_in_rsci_idat_mxwt;


  // Interconnect Declarations
  wire dat_in_rsci_biwt;
  wire dat_in_rsci_bdwt;
  wire dat_in_rsci_bcwt;
  wire dat_in_rsci_irdy_run_sct;
  wire dat_in_rsci_ivld;
  wire [33:0] dat_in_rsci_idat;
  wire [31:0] dat_in_rsci_idat_mxwt_pconst;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_v1 #(.rscid(32'sd1),
  .width(32'sd34)) dat_in_rsci (
      .rdy(dat_in_rsc_rdy),
      .vld(dat_in_rsc_vld),
      .dat(dat_in_rsc_dat),
      .irdy(dat_in_rsci_irdy_run_sct),
      .ivld(dat_in_rsci_ivld),
      .idat(dat_in_rsci_idat)
    );
  EdgeDetect_VerDer_run_dat_in_rsci_dat_in_wait_ctrl EdgeDetect_VerDer_run_dat_in_rsci_dat_in_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dat_in_rsci_oswt(dat_in_rsci_oswt),
      .dat_in_rsci_biwt(dat_in_rsci_biwt),
      .dat_in_rsci_bdwt(dat_in_rsci_bdwt),
      .dat_in_rsci_bcwt(dat_in_rsci_bcwt),
      .dat_in_rsci_irdy_run_sct(dat_in_rsci_irdy_run_sct),
      .dat_in_rsci_ivld(dat_in_rsci_ivld)
    );
  EdgeDetect_VerDer_run_dat_in_rsci_dat_in_wait_dp EdgeDetect_VerDer_run_dat_in_rsci_dat_in_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_in_rsci_oswt(dat_in_rsci_oswt),
      .dat_in_rsci_wen_comp(dat_in_rsci_wen_comp),
      .dat_in_rsci_idat_mxwt(dat_in_rsci_idat_mxwt_pconst),
      .dat_in_rsci_biwt(dat_in_rsci_biwt),
      .dat_in_rsci_bdwt(dat_in_rsci_bdwt),
      .dat_in_rsci_bcwt(dat_in_rsci_bcwt),
      .dat_in_rsci_idat(dat_in_rsci_idat)
    );
  assign dat_in_rsci_idat_mxwt = dat_in_rsci_idat_mxwt_pconst;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_HorDer_run_dx_rsci
// ------------------------------------------------------------------


module EdgeDetect_HorDer_run_dx_rsci (
  clk, rst, arst_n, dx_rsc_dat, dx_rsc_vld, dx_rsc_rdy, run_wen, dx_rsci_oswt, dx_rsci_wen_comp,
      dx_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  output [35:0] dx_rsc_dat;
  output dx_rsc_vld;
  input dx_rsc_rdy;
  input run_wen;
  input dx_rsci_oswt;
  output dx_rsci_wen_comp;
  input [35:0] dx_rsci_idat;


  // Interconnect Declarations
  wire dx_rsci_biwt;
  wire dx_rsci_bdwt;
  wire dx_rsci_bcwt;
  wire dx_rsci_irdy;
  wire dx_rsci_ivld_run_sct;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd12),
  .width(32'sd36)) dx_rsci (
      .irdy(dx_rsci_irdy),
      .ivld(dx_rsci_ivld_run_sct),
      .idat(dx_rsci_idat),
      .rdy(dx_rsc_rdy),
      .vld(dx_rsc_vld),
      .dat(dx_rsc_dat)
    );
  EdgeDetect_HorDer_run_dx_rsci_dx_wait_ctrl EdgeDetect_HorDer_run_dx_rsci_dx_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dx_rsci_oswt(dx_rsci_oswt),
      .dx_rsci_biwt(dx_rsci_biwt),
      .dx_rsci_bdwt(dx_rsci_bdwt),
      .dx_rsci_bcwt(dx_rsci_bcwt),
      .dx_rsci_irdy(dx_rsci_irdy),
      .dx_rsci_ivld_run_sct(dx_rsci_ivld_run_sct)
    );
  EdgeDetect_HorDer_run_dx_rsci_dx_wait_dp EdgeDetect_HorDer_run_dx_rsci_dx_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dx_rsci_oswt(dx_rsci_oswt),
      .dx_rsci_wen_comp(dx_rsci_wen_comp),
      .dx_rsci_biwt(dx_rsci_biwt),
      .dx_rsci_bdwt(dx_rsci_bdwt),
      .dx_rsci_bcwt(dx_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_HorDer_run_pix_out_rsci
// ------------------------------------------------------------------


module EdgeDetect_HorDer_run_pix_out_rsci (
  clk, rst, arst_n, pix_out_rsc_dat, pix_out_rsc_vld, pix_out_rsc_rdy, run_wen, pix_out_rsci_oswt,
      pix_out_rsci_wen_comp, pix_out_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  output [31:0] pix_out_rsc_dat;
  output pix_out_rsc_vld;
  input pix_out_rsc_rdy;
  input run_wen;
  input pix_out_rsci_oswt;
  output pix_out_rsci_wen_comp;
  input [31:0] pix_out_rsci_idat;


  // Interconnect Declarations
  wire pix_out_rsci_biwt;
  wire pix_out_rsci_bdwt;
  wire pix_out_rsci_bcwt;
  wire pix_out_rsci_irdy;
  wire pix_out_rsci_ivld_run_sct;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd11),
  .width(32'sd32)) pix_out_rsci (
      .irdy(pix_out_rsci_irdy),
      .ivld(pix_out_rsci_ivld_run_sct),
      .idat(pix_out_rsci_idat),
      .rdy(pix_out_rsc_rdy),
      .vld(pix_out_rsc_vld),
      .dat(pix_out_rsc_dat)
    );
  EdgeDetect_HorDer_run_pix_out_rsci_pix_out_wait_ctrl EdgeDetect_HorDer_run_pix_out_rsci_pix_out_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .pix_out_rsci_oswt(pix_out_rsci_oswt),
      .pix_out_rsci_biwt(pix_out_rsci_biwt),
      .pix_out_rsci_bdwt(pix_out_rsci_bdwt),
      .pix_out_rsci_bcwt(pix_out_rsci_bcwt),
      .pix_out_rsci_irdy(pix_out_rsci_irdy),
      .pix_out_rsci_ivld_run_sct(pix_out_rsci_ivld_run_sct)
    );
  EdgeDetect_HorDer_run_pix_out_rsci_pix_out_wait_dp EdgeDetect_HorDer_run_pix_out_rsci_pix_out_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .pix_out_rsci_oswt(pix_out_rsci_oswt),
      .pix_out_rsci_wen_comp(pix_out_rsci_wen_comp),
      .pix_out_rsci_biwt(pix_out_rsci_biwt),
      .pix_out_rsci_bdwt(pix_out_rsci_bdwt),
      .pix_out_rsci_bcwt(pix_out_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_HorDer_run_pix_in_rsci
// ------------------------------------------------------------------


module EdgeDetect_HorDer_run_pix_in_rsci (
  pix_in_rsc_dat, pix_in_rsc_vld, pix_in_rsc_rdy, run_wen, pix_in_rsci_oswt, pix_in_rsci_wen_comp,
      pix_in_rsci_idat_mxwt
);
  input [31:0] pix_in_rsc_dat;
  input pix_in_rsc_vld;
  output pix_in_rsc_rdy;
  input run_wen;
  input pix_in_rsci_oswt;
  output pix_in_rsci_wen_comp;
  output [31:0] pix_in_rsci_idat_mxwt;


  // Interconnect Declarations
  wire pix_in_rsci_irdy_run_sct;
  wire pix_in_rsci_ivld;
  wire [31:0] pix_in_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_coupled_v1 #(.rscid(32'sd8),
  .width(32'sd32)) pix_in_rsci (
      .rdy(pix_in_rsc_rdy),
      .vld(pix_in_rsc_vld),
      .dat(pix_in_rsc_dat),
      .irdy(pix_in_rsci_irdy_run_sct),
      .ivld(pix_in_rsci_ivld),
      .idat(pix_in_rsci_idat)
    );
  EdgeDetect_HorDer_run_pix_in_rsci_pix_in_wait_ctrl EdgeDetect_HorDer_run_pix_in_rsci_pix_in_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .pix_in_rsci_iswt0(pix_in_rsci_oswt),
      .pix_in_rsci_irdy_run_sct(pix_in_rsci_irdy_run_sct)
    );
  assign pix_in_rsci_idat_mxwt = pix_in_rsci_idat;
  assign pix_in_rsci_wen_comp = (~ pix_in_rsci_oswt) | pix_in_rsci_ivld;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj
// ------------------------------------------------------------------


module EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj (
  crc32_dat_out_triosy_lz, run_wten, crc32_dat_out_triosy_obj_iswt0
);
  output crc32_dat_out_triosy_lz;
  input run_wten;
  input crc32_dat_out_triosy_obj_iswt0;


  // Interconnect Declarations
  wire crc32_dat_out_triosy_obj_biwt;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) crc32_dat_out_triosy_obj (
      .ld(crc32_dat_out_triosy_obj_biwt),
      .lz(crc32_dat_out_triosy_lz)
    );
  EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj_crc32_dat_out_triosy_wait_ctrl EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj_crc32_dat_out_triosy_wait_ctrl_inst
      (
      .run_wten(run_wten),
      .crc32_dat_out_triosy_obj_iswt0(crc32_dat_out_triosy_obj_iswt0),
      .crc32_dat_out_triosy_obj_biwt(crc32_dat_out_triosy_obj_biwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj
// ------------------------------------------------------------------


module EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj (
  crc32_pix_in_triosy_lz, run_wten, crc32_pix_in_triosy_obj_iswt0
);
  output crc32_pix_in_triosy_lz;
  input run_wten;
  input crc32_pix_in_triosy_obj_iswt0;


  // Interconnect Declarations
  wire crc32_pix_in_triosy_obj_biwt;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) crc32_pix_in_triosy_obj (
      .ld(crc32_pix_in_triosy_obj_biwt),
      .lz(crc32_pix_in_triosy_lz)
    );
  EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj_crc32_pix_in_triosy_wait_ctrl EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj_crc32_pix_in_triosy_wait_ctrl_inst
      (
      .run_wten(run_wten),
      .crc32_pix_in_triosy_obj_iswt0(crc32_pix_in_triosy_obj_iswt0),
      .crc32_pix_in_triosy_obj_biwt(crc32_pix_in_triosy_obj_biwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_MagAng_run_dat_out_rsci
// ------------------------------------------------------------------


module EdgeDetect_MagAng_run_dat_out_rsci (
  clk, rst, arst_n, dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy, run_wen, dat_out_rsci_oswt,
      dat_out_rsci_wen_comp, dat_out_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  output [33:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  input run_wen;
  input dat_out_rsci_oswt;
  output dat_out_rsci_wen_comp;
  input [33:0] dat_out_rsci_idat;


  // Interconnect Declarations
  wire dat_out_rsci_biwt;
  wire dat_out_rsci_bdwt;
  wire dat_out_rsci_bcwt;
  wire dat_out_rsci_irdy;
  wire dat_out_rsci_ivld_run_sct;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd22),
  .width(32'sd34)) dat_out_rsci (
      .irdy(dat_out_rsci_irdy),
      .ivld(dat_out_rsci_ivld_run_sct),
      .idat(dat_out_rsci_idat),
      .rdy(dat_out_rsc_rdy),
      .vld(dat_out_rsc_vld),
      .dat(dat_out_rsc_dat)
    );
  EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_ctrl EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dat_out_rsci_oswt(dat_out_rsci_oswt),
      .dat_out_rsci_biwt(dat_out_rsci_biwt),
      .dat_out_rsci_bdwt(dat_out_rsci_bdwt),
      .dat_out_rsci_bcwt(dat_out_rsci_bcwt),
      .dat_out_rsci_irdy(dat_out_rsci_irdy),
      .dat_out_rsci_ivld_run_sct(dat_out_rsci_ivld_run_sct)
    );
  EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_dp EdgeDetect_MagAng_run_dat_out_rsci_dat_out_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_out_rsci_oswt(dat_out_rsci_oswt),
      .dat_out_rsci_wen_comp(dat_out_rsci_wen_comp),
      .dat_out_rsci_biwt(dat_out_rsci_biwt),
      .dat_out_rsci_bdwt(dat_out_rsci_bdwt),
      .dat_out_rsci_bcwt(dat_out_rsci_bcwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_MagAng_run_pix_in_rsci
// ------------------------------------------------------------------


module EdgeDetect_MagAng_run_pix_in_rsci (
  clk, rst, arst_n, pix_in_rsc_dat, pix_in_rsc_vld, pix_in_rsc_rdy, run_wen, pix_in_rsci_oswt,
      pix_in_rsci_wen_comp, pix_in_rsci_idat_mxwt
);
  input clk;
  input rst;
  input arst_n;
  input [31:0] pix_in_rsc_dat;
  input pix_in_rsc_vld;
  output pix_in_rsc_rdy;
  input run_wen;
  input pix_in_rsci_oswt;
  output pix_in_rsci_wen_comp;
  output [31:0] pix_in_rsci_idat_mxwt;


  // Interconnect Declarations
  wire pix_in_rsci_biwt;
  wire pix_in_rsci_bdwt;
  wire pix_in_rsci_bcwt;
  wire pix_in_rsci_irdy_run_sct;
  wire pix_in_rsci_ivld;
  wire [31:0] pix_in_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_v1 #(.rscid(32'sd16),
  .width(32'sd32)) pix_in_rsci (
      .rdy(pix_in_rsc_rdy),
      .vld(pix_in_rsc_vld),
      .dat(pix_in_rsc_dat),
      .irdy(pix_in_rsci_irdy_run_sct),
      .ivld(pix_in_rsci_ivld),
      .idat(pix_in_rsci_idat)
    );
  EdgeDetect_MagAng_run_pix_in_rsci_pix_in_wait_ctrl EdgeDetect_MagAng_run_pix_in_rsci_pix_in_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .pix_in_rsci_oswt(pix_in_rsci_oswt),
      .pix_in_rsci_biwt(pix_in_rsci_biwt),
      .pix_in_rsci_bdwt(pix_in_rsci_bdwt),
      .pix_in_rsci_bcwt(pix_in_rsci_bcwt),
      .pix_in_rsci_irdy_run_sct(pix_in_rsci_irdy_run_sct),
      .pix_in_rsci_ivld(pix_in_rsci_ivld)
    );
  EdgeDetect_MagAng_run_pix_in_rsci_pix_in_wait_dp EdgeDetect_MagAng_run_pix_in_rsci_pix_in_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .pix_in_rsci_oswt(pix_in_rsci_oswt),
      .pix_in_rsci_wen_comp(pix_in_rsci_wen_comp),
      .pix_in_rsci_idat_mxwt(pix_in_rsci_idat_mxwt),
      .pix_in_rsci_biwt(pix_in_rsci_biwt),
      .pix_in_rsci_bdwt(pix_in_rsci_bdwt),
      .pix_in_rsci_bcwt(pix_in_rsci_bcwt),
      .pix_in_rsci_idat(pix_in_rsci_idat)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_MagAng_run_dy_in_rsci
// ------------------------------------------------------------------


module EdgeDetect_MagAng_run_dy_in_rsci (
  dy_in_rsc_dat, dy_in_rsc_vld, dy_in_rsc_rdy, run_wen, dy_in_rsci_oswt, dy_in_rsci_wen_comp,
      dy_in_rsci_idat_mxwt
);
  input [35:0] dy_in_rsc_dat;
  input dy_in_rsc_vld;
  output dy_in_rsc_rdy;
  input run_wen;
  input dy_in_rsci_oswt;
  output dy_in_rsci_wen_comp;
  output [35:0] dy_in_rsci_idat_mxwt;


  // Interconnect Declarations
  wire dy_in_rsci_irdy_run_sct;
  wire dy_in_rsci_ivld;
  wire [35:0] dy_in_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_coupled_v1 #(.rscid(32'sd15),
  .width(32'sd36)) dy_in_rsci (
      .rdy(dy_in_rsc_rdy),
      .vld(dy_in_rsc_vld),
      .dat(dy_in_rsc_dat),
      .irdy(dy_in_rsci_irdy_run_sct),
      .ivld(dy_in_rsci_ivld),
      .idat(dy_in_rsci_idat)
    );
  EdgeDetect_MagAng_run_dy_in_rsci_dy_in_wait_ctrl EdgeDetect_MagAng_run_dy_in_rsci_dy_in_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dy_in_rsci_iswt0(dy_in_rsci_oswt),
      .dy_in_rsci_irdy_run_sct(dy_in_rsci_irdy_run_sct)
    );
  assign dy_in_rsci_idat_mxwt = dy_in_rsci_idat;
  assign dy_in_rsci_wen_comp = (~ dy_in_rsci_oswt) | dy_in_rsci_ivld;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_MagAng_run_dx_in_rsci
// ------------------------------------------------------------------


module EdgeDetect_MagAng_run_dx_in_rsci (
  dx_in_rsc_dat, dx_in_rsc_vld, dx_in_rsc_rdy, run_wen, dx_in_rsci_oswt, dx_in_rsci_wen_comp,
      dx_in_rsci_idat_mxwt
);
  input [35:0] dx_in_rsc_dat;
  input dx_in_rsc_vld;
  output dx_in_rsc_rdy;
  input run_wen;
  input dx_in_rsci_oswt;
  output dx_in_rsci_wen_comp;
  output [35:0] dx_in_rsci_idat_mxwt;


  // Interconnect Declarations
  wire dx_in_rsci_irdy_run_sct;
  wire dx_in_rsci_ivld;
  wire [35:0] dx_in_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_coupled_v1 #(.rscid(32'sd14),
  .width(32'sd36)) dx_in_rsci (
      .rdy(dx_in_rsc_rdy),
      .vld(dx_in_rsc_vld),
      .dat(dx_in_rsc_dat),
      .irdy(dx_in_rsci_irdy_run_sct),
      .ivld(dx_in_rsci_ivld),
      .idat(dx_in_rsci_idat)
    );
  EdgeDetect_MagAng_run_dx_in_rsci_dx_in_wait_ctrl EdgeDetect_MagAng_run_dx_in_rsci_dx_in_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .dx_in_rsci_iswt0(dx_in_rsci_oswt),
      .dx_in_rsci_irdy_run_sct(dx_in_rsci_irdy_run_sct)
    );
  assign dx_in_rsci_idat_mxwt = dx_in_rsci_idat;
  assign dx_in_rsci_wen_comp = (~ dx_in_rsci_oswt) | dx_in_rsci_ivld;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_VerDer_run
// ------------------------------------------------------------------


module EdgeDetect_VerDer_run (
  clk, rst, arst_n, dat_in_rsc_dat, dat_in_rsc_vld, dat_in_rsc_rdy, widthIn, heightIn,
      pix_out_rsc_dat, pix_out_rsc_vld, pix_out_rsc_rdy, dy_rsc_dat, dy_rsc_vld,
      dy_rsc_rdy, line_buf0_rsci_d_d, line_buf0_rsci_en_d, line_buf0_rsci_q_d, line_buf1_rsci_d_d,
      line_buf1_rsci_q_d, line_buf0_rsci_adr_d_pff, line_buf0_rsci_we_d_pff, line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_pff
);
  input clk;
  input rst;
  input arst_n;
  input [33:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input [9:0] widthIn;
  input [8:0] heightIn;
  output [31:0] pix_out_rsc_dat;
  output pix_out_rsc_vld;
  input pix_out_rsc_rdy;
  output [35:0] dy_rsc_dat;
  output dy_rsc_vld;
  input dy_rsc_rdy;
  output [63:0] line_buf0_rsci_d_d;
  output line_buf0_rsci_en_d;
  input [63:0] line_buf0_rsci_q_d;
  output [63:0] line_buf1_rsci_d_d;
  input [63:0] line_buf1_rsci_q_d;
  output [6:0] line_buf0_rsci_adr_d_pff;
  output line_buf0_rsci_we_d_pff;
  output line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_pff;


  // Interconnect Declarations
  wire run_wen;
  wire dat_in_rsci_wen_comp;
  wire [31:0] dat_in_rsci_idat_mxwt;
  wire pix_out_rsci_wen_comp;
  reg [31:0] pix_out_rsci_idat;
  wire dy_rsci_wen_comp;
  reg [8:0] dy_rsci_idat_35_27;
  wire [9:0] nl_dy_rsci_idat_35_27;
  reg [8:0] dy_rsci_idat_26_18;
  wire [9:0] nl_dy_rsci_idat_26_18;
  reg [8:0] dy_rsci_idat_17_9;
  wire [9:0] nl_dy_rsci_idat_17_9;
  reg [8:0] dy_rsci_idat_8_0;
  wire [9:0] nl_dy_rsci_idat_8_0;
  wire [2:0] fsm_output;
  wire [8:0] VCOL_if_6_mux_tmp;
  wire VCOL_VCOL_if_6_VCOL_if_6_nor_tmp;
  wire [7:0] operator_10_false_acc_tmp;
  wire [8:0] nl_operator_10_false_acc_tmp;
  wire or_dcpl_3;
  wire or_dcpl_4;
  wire or_dcpl_5;
  wire or_dcpl_7;
  wire or_dcpl_21;
  wire or_dcpl_39;
  wire or_dcpl_41;
  wire or_dcpl_43;
  reg VCOL_equal_cse_sva_1;
  wire [8:0] VROW_y_sva_mx1;
  reg [8:0] VROW_y_sva;
  reg VCOL_nor_1_itm_1;
  reg VROW_stage_0_2;
  reg [7:0] VCOL_x_9_2_sva;
  reg VROW_stage_0_1;
  reg VCOL_x_slc_VCOL_x_9_2_0_2_itm_1;
  reg VROW_stage_0_3;
  reg [8:0] VCOL_asn_itm_2;
  reg VCOL_if_slc_operator_9_false_acc_9_svs_1;
  reg VCOL_equal_cse_sva_2;
  wire VCOL_if_5_and_cse;
  reg reg_line_buf1_rsci_cgo_ir_cse;
  reg reg_dy_rsci_iswt0_cse;
  reg reg_dat_in_rsci_iswt0_cse;
  reg reg_VCOL_x_slc_VCOL_x_9_2_0_5_itm_1_cse;
  wire [31:0] VCOL_mux_4_cse;
  wire or_50_cse;
  wire and_59_rmff;
  reg [31:0] wrbuf0_pix_31_0_sva_1;
  wire [63:0] rdbuf0_pix_mux_itm;
  reg [63:0] rdbuf0_pix_sva;
  reg [31:0] pix0_sva;
  reg [31:0] pix0_sva_dfm_1;
  reg VCOL_VCOL_nand_tmp_1;
  reg VROW_asn_1_itm_1;
  reg [31:0] rdbuf1_pix_sva_63_32;
  wire pix_out_rsci_idat_mx0c1;
  wire VROW_stage_0_1_mx0w1;
  wire [7:0] VCOL_x_9_2_sva_mx1;
  wire [31:0] pix0_sva_mx0;
  wire [31:0] pix2_lpi_2_dfm_1;
  wire [31:0] pix0_sva_dfm_2_mx0;
  wire [31:0] VCOL_qr_1_lpi_2_dfm_mx0;
  wire [63:0] rdbuf0_pix_sva_dfm_mx0;
  wire [8:0] VROW_y_sva_2;
  wire [9:0] nl_VROW_y_sva_2;
  wire [8:0] operator_11_true_acc_psp_sva_1;
  wire [9:0] nl_operator_11_true_acc_psp_sva_1;
  wire VROW_and_cse;
  wire VCOL_if_4_and_cse;
  wire VCOL_if_6_unequal_tmp;
  wire operator_9_false_acc_itm_9;

  wire mux_1_nl;
  wire mux_nl;
  wire or_68_nl;
  wire nand_2_nl;
  wire mux_5_nl;
  wire and_70_nl;
  wire VROW_y_and_nl;
  wire[7:0] VCOL_VCOL_and_nl;
  wire VCOL_if_6_VCOL_if_6_or_nl;
  wire[9:0] operator_9_false_acc_nl;
  wire[10:0] nl_operator_9_false_acc_nl;
  wire VCOL_and_nl;
  wire VCOL_and_1_nl;
  wire VCOL_if_6_and_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [35:0] nl_EdgeDetect_VerDer_run_dy_rsci_inst_dy_rsci_idat;
  assign nl_EdgeDetect_VerDer_run_dy_rsci_inst_dy_rsci_idat = {dy_rsci_idat_35_27
      , dy_rsci_idat_26_18 , dy_rsci_idat_17_9 , dy_rsci_idat_8_0};
  wire  nl_EdgeDetect_VerDer_run_run_fsm_inst_VROW_C_0_tr0;
  assign nl_EdgeDetect_VerDer_run_run_fsm_inst_VROW_C_0_tr0 = ~(VROW_stage_0_1 |
      VROW_stage_0_2 | VROW_stage_0_3);
  EdgeDetect_VerDer_run_dat_in_rsci EdgeDetect_VerDer_run_dat_in_rsci_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_in_rsc_dat(dat_in_rsc_dat),
      .dat_in_rsc_vld(dat_in_rsc_vld),
      .dat_in_rsc_rdy(dat_in_rsc_rdy),
      .run_wen(run_wen),
      .dat_in_rsci_oswt(reg_dat_in_rsci_iswt0_cse),
      .dat_in_rsci_wen_comp(dat_in_rsci_wen_comp),
      .dat_in_rsci_idat_mxwt(dat_in_rsci_idat_mxwt)
    );
  EdgeDetect_VerDer_run_pix_out_rsci EdgeDetect_VerDer_run_pix_out_rsci_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .pix_out_rsc_dat(pix_out_rsc_dat),
      .pix_out_rsc_vld(pix_out_rsc_vld),
      .pix_out_rsc_rdy(pix_out_rsc_rdy),
      .run_wen(run_wen),
      .pix_out_rsci_oswt(reg_dy_rsci_iswt0_cse),
      .pix_out_rsci_wen_comp(pix_out_rsci_wen_comp),
      .pix_out_rsci_idat(pix_out_rsci_idat)
    );
  EdgeDetect_VerDer_run_dy_rsci EdgeDetect_VerDer_run_dy_rsci_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dy_rsc_dat(dy_rsc_dat),
      .dy_rsc_vld(dy_rsc_vld),
      .dy_rsc_rdy(dy_rsc_rdy),
      .run_wen(run_wen),
      .dy_rsci_oswt(reg_dy_rsci_iswt0_cse),
      .dy_rsci_wen_comp(dy_rsci_wen_comp),
      .dy_rsci_idat(nl_EdgeDetect_VerDer_run_dy_rsci_inst_dy_rsci_idat[35:0])
    );
  EdgeDetect_VerDer_run_wait_dp EdgeDetect_VerDer_run_wait_dp_inst (
      .line_buf0_rsci_en_d(line_buf0_rsci_en_d),
      .run_wen(run_wen),
      .line_buf0_rsci_cgo(reg_line_buf1_rsci_cgo_ir_cse),
      .line_buf0_rsci_cgo_ir_unreg(and_59_rmff)
    );
  EdgeDetect_VerDer_run_staller EdgeDetect_VerDer_run_staller_inst (
      .run_wen(run_wen),
      .dat_in_rsci_wen_comp(dat_in_rsci_wen_comp),
      .pix_out_rsci_wen_comp(pix_out_rsci_wen_comp),
      .dy_rsci_wen_comp(dy_rsci_wen_comp)
    );
  EdgeDetect_VerDer_run_run_fsm EdgeDetect_VerDer_run_run_fsm_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .run_wen(run_wen),
      .fsm_output(fsm_output),
      .VROW_C_0_tr0(nl_EdgeDetect_VerDer_run_run_fsm_inst_VROW_C_0_tr0)
    );
  assign VCOL_if_5_and_cse = run_wen & (~((VCOL_asn_itm_2==9'b000000000))) & VROW_stage_0_3
      & (fsm_output[1]);
  assign VROW_and_cse = run_wen & VROW_stage_0_2;
  assign VCOL_if_4_and_cse = run_wen & (or_dcpl_21 | (~ VROW_stage_0_2)) & VROW_stage_0_1;
  assign and_59_rmff = (VROW_stage_0_2 | VROW_stage_0_3) & (fsm_output[1]);
  assign or_50_cse = or_dcpl_43 | reg_VCOL_x_slc_VCOL_x_9_2_0_5_itm_1_cse;
  assign VCOL_mux_4_cse = MUX_v_32_2_2(dat_in_rsci_idat_mxwt, pix0_sva_mx0, VCOL_if_slc_operator_9_false_acc_9_svs_1);
  assign VROW_y_and_nl = VCOL_VCOL_if_6_VCOL_if_6_nor_tmp & VROW_stage_0_2;
  assign VROW_y_sva_mx1 = MUX_v_9_2_2(VROW_y_sva, VROW_y_sva_2, VROW_y_and_nl);
  assign VROW_stage_0_1_mx0w1 = VROW_stage_0_1 & or_dcpl_41;
  assign VCOL_if_6_VCOL_if_6_or_nl = VCOL_equal_cse_sva_1 | (~ VCOL_VCOL_if_6_VCOL_if_6_nor_tmp);
  assign VCOL_VCOL_and_nl = MUX_v_8_2_2(8'b00000000, operator_10_false_acc_tmp, VCOL_if_6_VCOL_if_6_or_nl);
  assign VCOL_x_9_2_sva_mx1 = MUX_v_8_2_2(VCOL_x_9_2_sva, VCOL_VCOL_and_nl, VROW_stage_0_2);
  assign rdbuf0_pix_mux_itm = MUX_v_64_2_2(line_buf0_rsci_q_d, rdbuf0_pix_sva, or_50_cse);
  assign pix0_sva_mx0 = MUX_v_32_2_2(pix0_sva_dfm_2_mx0, pix0_sva, or_dcpl_43);
  assign nl_operator_9_false_acc_nl = ({1'b1 , heightIn}) + conv_u2s_9_10(~ VROW_y_sva_mx1);
  assign operator_9_false_acc_nl = nl_operator_9_false_acc_nl[9:0];
  assign operator_9_false_acc_itm_9 = readslicef_10_1_9(operator_9_false_acc_nl);
  assign VCOL_and_nl = (~ reg_VCOL_x_slc_VCOL_x_9_2_0_5_itm_1_cse) & VCOL_VCOL_nand_tmp_1;
  assign VCOL_and_1_nl = reg_VCOL_x_slc_VCOL_x_9_2_0_5_itm_1_cse & VCOL_VCOL_nand_tmp_1;
  assign pix2_lpi_2_dfm_1 = MUX1HOT_v_32_3_2(VCOL_qr_1_lpi_2_dfm_mx0, (line_buf1_rsci_q_d[31:0]),
      rdbuf1_pix_sva_63_32, {(~ VCOL_VCOL_nand_tmp_1) , VCOL_and_nl , VCOL_and_1_nl});
  assign pix0_sva_dfm_2_mx0 = MUX_v_32_2_2(pix0_sva_dfm_1, VCOL_qr_1_lpi_2_dfm_mx0,
      VCOL_equal_cse_sva_2);
  assign VCOL_qr_1_lpi_2_dfm_mx0 = MUX_v_32_2_2((line_buf0_rsci_q_d[31:0]), (rdbuf0_pix_sva[63:32]),
      reg_VCOL_x_slc_VCOL_x_9_2_0_5_itm_1_cse);
  assign rdbuf0_pix_sva_dfm_mx0 = MUX_v_64_2_2(line_buf0_rsci_q_d, rdbuf0_pix_sva,
      reg_VCOL_x_slc_VCOL_x_9_2_0_5_itm_1_cse);
  assign nl_VROW_y_sva_2 = VROW_y_sva + 9'b000000001;
  assign VROW_y_sva_2 = nl_VROW_y_sva_2[8:0];
  assign VCOL_if_6_unequal_tmp = VCOL_x_9_2_sva != (operator_11_true_acc_psp_sva_1[7:0]);
  assign VCOL_VCOL_if_6_VCOL_if_6_nor_tmp = ~(VCOL_if_6_unequal_tmp | (operator_11_true_acc_psp_sva_1[8]));
  assign nl_operator_11_true_acc_psp_sva_1 = conv_u2s_8_9(widthIn[9:2]) + 9'b111111111;
  assign operator_11_true_acc_psp_sva_1 = nl_operator_11_true_acc_psp_sva_1[8:0];
  assign nl_operator_10_false_acc_tmp = VCOL_x_9_2_sva + 8'b00000001;
  assign operator_10_false_acc_tmp = nl_operator_10_false_acc_tmp[7:0];
  assign VCOL_if_6_and_nl = (~ VCOL_equal_cse_sva_1) & VCOL_VCOL_if_6_VCOL_if_6_nor_tmp;
  assign VCOL_if_6_mux_tmp = MUX_v_9_2_2(VROW_y_sva, VROW_y_sva_2, VCOL_if_6_and_nl);
  assign or_dcpl_3 = (VROW_y_sva[5:4]!=2'b00);
  assign or_dcpl_4 = (VROW_y_sva[8:7]!=2'b00);
  assign or_dcpl_5 = or_dcpl_4 | (VROW_y_sva[6]);
  assign or_dcpl_7 = or_dcpl_5 | or_dcpl_3 | (VROW_y_sva[3:0]!=4'b0000);
  assign or_dcpl_21 = ~(VCOL_VCOL_if_6_VCOL_if_6_nor_tmp & VCOL_equal_cse_sva_1);
  assign or_dcpl_39 = (VCOL_asn_itm_2!=9'b000000000);
  assign or_dcpl_41 = ~(VCOL_VCOL_if_6_VCOL_if_6_nor_tmp & VCOL_equal_cse_sva_1 &
      VROW_stage_0_2);
  assign or_dcpl_43 = (~ VROW_stage_0_3) | VROW_asn_1_itm_1;
  assign pix_out_rsci_idat_mx0c1 = or_dcpl_39 & VROW_stage_0_3 & (~ reg_VCOL_x_slc_VCOL_x_9_2_0_5_itm_1_cse)
      & (fsm_output[1]);
  assign line_buf0_rsci_adr_d_pff = VCOL_x_9_2_sva[7:1];
  assign line_buf0_rsci_d_d = {VCOL_mux_4_cse , wrbuf0_pix_31_0_sva_1};
  assign line_buf0_rsci_we_d_pff = VROW_stage_0_2 & VCOL_x_slc_VCOL_x_9_2_0_2_itm_1
      & (fsm_output[1]);
  assign line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_pff = VROW_stage_0_2
      & (~ VCOL_x_slc_VCOL_x_9_2_0_2_itm_1) & (fsm_output[1]);
  assign line_buf1_rsci_d_d = rdbuf0_pix_mux_itm;
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dy_rsci_idat_35_27 <= 9'b000000000;
      dy_rsci_idat_8_0 <= 9'b000000000;
      dy_rsci_idat_26_18 <= 9'b000000000;
      dy_rsci_idat_17_9 <= 9'b000000000;
    end
    else if ( rst ) begin
      dy_rsci_idat_35_27 <= 9'b000000000;
      dy_rsci_idat_8_0 <= 9'b000000000;
      dy_rsci_idat_26_18 <= 9'b000000000;
      dy_rsci_idat_17_9 <= 9'b000000000;
    end
    else if ( VCOL_if_5_and_cse ) begin
      dy_rsci_idat_35_27 <= nl_dy_rsci_idat_35_27[8:0];
      dy_rsci_idat_8_0 <= nl_dy_rsci_idat_8_0[8:0];
      dy_rsci_idat_26_18 <= nl_dy_rsci_idat_26_18[8:0];
      dy_rsci_idat_17_9 <= nl_dy_rsci_idat_17_9[8:0];
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      pix_out_rsci_idat <= 32'b00000000000000000000000000000000;
    end
    else if ( rst ) begin
      pix_out_rsci_idat <= 32'b00000000000000000000000000000000;
    end
    else if ( run_wen & ((or_dcpl_39 & VROW_stage_0_3 & reg_VCOL_x_slc_VCOL_x_9_2_0_5_itm_1_cse
        & (fsm_output[1])) | pix_out_rsci_idat_mx0c1) ) begin
      pix_out_rsci_idat <= MUX_v_32_2_2((rdbuf0_pix_sva_dfm_mx0[63:32]), (rdbuf0_pix_sva_dfm_mx0[31:0]),
          pix_out_rsci_idat_mx0c1);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VROW_asn_1_itm_1 <= 1'b0;
      VCOL_asn_itm_2 <= 9'b000000000;
    end
    else if ( rst ) begin
      VROW_asn_1_itm_1 <= 1'b0;
      VCOL_asn_itm_2 <= 9'b000000000;
    end
    else if ( VROW_and_cse ) begin
      VROW_asn_1_itm_1 <= VCOL_equal_cse_sva_1 & VCOL_VCOL_if_6_VCOL_if_6_nor_tmp;
      VCOL_asn_itm_2 <= VROW_y_sva;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VROW_y_sva <= 9'b000000000;
    end
    else if ( rst ) begin
      VROW_y_sva <= 9'b000000000;
    end
    else if ( (~((~(VROW_stage_0_2 & (~ (operator_11_true_acc_psp_sva_1[8])) & (~
        VCOL_if_6_unequal_tmp))) & (fsm_output[1]))) & run_wen ) begin
      VROW_y_sva <= MUX_v_9_2_2(9'b000000000, VROW_y_sva_mx1, (fsm_output[1]));
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VROW_stage_0_1 <= 1'b0;
      VROW_stage_0_2 <= 1'b0;
      VROW_stage_0_3 <= 1'b0;
      reg_line_buf1_rsci_cgo_ir_cse <= 1'b0;
      reg_dy_rsci_iswt0_cse <= 1'b0;
      reg_dat_in_rsci_iswt0_cse <= 1'b0;
    end
    else if ( rst ) begin
      VROW_stage_0_1 <= 1'b0;
      VROW_stage_0_2 <= 1'b0;
      VROW_stage_0_3 <= 1'b0;
      reg_line_buf1_rsci_cgo_ir_cse <= 1'b0;
      reg_dy_rsci_iswt0_cse <= 1'b0;
      reg_dat_in_rsci_iswt0_cse <= 1'b0;
    end
    else if ( run_wen ) begin
      VROW_stage_0_1 <= VROW_stage_0_1_mx0w1 | (~ (fsm_output[1]));
      VROW_stage_0_2 <= VROW_stage_0_1_mx0w1 & (fsm_output[1]);
      VROW_stage_0_3 <= VROW_stage_0_2 & (fsm_output[1]);
      reg_line_buf1_rsci_cgo_ir_cse <= and_59_rmff;
      reg_dy_rsci_iswt0_cse <= or_dcpl_39 & VROW_stage_0_3 & (fsm_output[1]);
      reg_dat_in_rsci_iswt0_cse <= or_dcpl_41 & VROW_stage_0_1 & (~ operator_9_false_acc_itm_9)
          & (fsm_output[1]);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VCOL_x_9_2_sva <= 8'b00000000;
    end
    else if ( rst ) begin
      VCOL_x_9_2_sva <= 8'b00000000;
    end
    else if ( (VROW_stage_0_2 | (~ (fsm_output[1]))) & run_wen ) begin
      VCOL_x_9_2_sva <= MUX_v_8_2_2(8'b00000000, VCOL_x_9_2_sva_mx1, (fsm_output[1]));
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VCOL_equal_cse_sva_1 <= 1'b0;
      VCOL_x_slc_VCOL_x_9_2_0_2_itm_1 <= 1'b0;
      VCOL_if_slc_operator_9_false_acc_9_svs_1 <= 1'b0;
    end
    else if ( rst ) begin
      VCOL_equal_cse_sva_1 <= 1'b0;
      VCOL_x_slc_VCOL_x_9_2_0_2_itm_1 <= 1'b0;
      VCOL_if_slc_operator_9_false_acc_9_svs_1 <= 1'b0;
    end
    else if ( VCOL_if_4_and_cse ) begin
      VCOL_equal_cse_sva_1 <= VROW_y_sva_mx1 == heightIn;
      VCOL_x_slc_VCOL_x_9_2_0_2_itm_1 <= VCOL_x_9_2_sva_mx1[0];
      VCOL_if_slc_operator_9_false_acc_9_svs_1 <= operator_9_false_acc_itm_9;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      pix0_sva <= 32'b00000000000000000000000000000000;
    end
    else if ( rst ) begin
      pix0_sva <= 32'b00000000000000000000000000000000;
    end
    else if ( VROW_stage_0_3 & (~ VROW_asn_1_itm_1) & (~ VROW_stage_0_2) & operator_9_false_acc_itm_9
        & run_wen & VROW_stage_0_1 ) begin
      pix0_sva <= pix0_sva_mx0;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      rdbuf0_pix_sva <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( rst ) begin
      rdbuf0_pix_sva <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    else if ( (~ VROW_asn_1_itm_1) & VROW_stage_0_3 & (~ reg_VCOL_x_slc_VCOL_x_9_2_0_5_itm_1_cse)
        & run_wen ) begin
      rdbuf0_pix_sva <= rdbuf0_pix_mux_itm;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VCOL_VCOL_nand_tmp_1 <= 1'b0;
    end
    else if ( rst ) begin
      VCOL_VCOL_nand_tmp_1 <= 1'b0;
    end
    else if ( run_wen & or_dcpl_7 & VROW_stage_0_2 ) begin
      VCOL_VCOL_nand_tmp_1 <= ~((VROW_y_sva[0]) & VCOL_nor_1_itm_1);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      rdbuf1_pix_sva_63_32 <= 32'b00000000000000000000000000000000;
    end
    else if ( rst ) begin
      rdbuf1_pix_sva_63_32 <= 32'b00000000000000000000000000000000;
    end
    else if ( run_wen & mux_1_nl & (VCOL_x_9_2_sva[0]) & (~ or_50_cse) ) begin
      rdbuf1_pix_sva_63_32 <= line_buf1_rsci_q_d[63:32];
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      reg_VCOL_x_slc_VCOL_x_9_2_0_5_itm_1_cse <= 1'b0;
    end
    else if ( rst ) begin
      reg_VCOL_x_slc_VCOL_x_9_2_0_5_itm_1_cse <= 1'b0;
    end
    else if ( run_wen & (or_dcpl_4 | (VROW_y_sva[6:2]!=5'b00000) | (VROW_stage_0_1
        & (~ VCOL_VCOL_if_6_VCOL_if_6_nor_tmp) & (operator_10_false_acc_tmp[0]))
        | (VROW_y_sva[1]) | VCOL_equal_cse_sva_1 | (VROW_y_sva[0])) & VROW_stage_0_2
        ) begin
      reg_VCOL_x_slc_VCOL_x_9_2_0_5_itm_1_cse <= VCOL_x_9_2_sva[0];
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      pix0_sva_dfm_1 <= 32'b00000000000000000000000000000000;
    end
    else if ( rst ) begin
      pix0_sva_dfm_1 <= 32'b00000000000000000000000000000000;
    end
    else if ( (VCOL_equal_cse_sva_2 | VROW_asn_1_itm_1 | (~(VCOL_if_slc_operator_9_false_acc_9_svs_1
        & VROW_stage_0_3))) & run_wen ) begin
      pix0_sva_dfm_1 <= VCOL_mux_4_cse;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VCOL_equal_cse_sva_2 <= 1'b0;
    end
    else if ( rst ) begin
      VCOL_equal_cse_sva_2 <= 1'b0;
    end
    else if ( run_wen & ((VROW_stage_0_1 & operator_9_false_acc_itm_9 & or_dcpl_21)
        | or_dcpl_5 | or_dcpl_3 | (VROW_y_sva[3:0]!=4'b0000)) & VROW_stage_0_2 )
        begin
      VCOL_equal_cse_sva_2 <= VCOL_equal_cse_sva_1;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      wrbuf0_pix_31_0_sva_1 <= 32'b00000000000000000000000000000000;
    end
    else if ( rst ) begin
      wrbuf0_pix_31_0_sva_1 <= 32'b00000000000000000000000000000000;
    end
    else if ( run_wen & (~((~ (operator_10_false_acc_tmp[0])) | VCOL_VCOL_if_6_VCOL_if_6_nor_tmp))
        & VROW_stage_0_2 & VROW_stage_0_1 & (~ (VCOL_x_9_2_sva[0])) ) begin
      wrbuf0_pix_31_0_sva_1 <= VCOL_mux_4_cse;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      VCOL_nor_1_itm_1 <= 1'b0;
    end
    else if ( rst ) begin
      VCOL_nor_1_itm_1 <= 1'b0;
    end
    else if ( run_wen & mux_5_nl & VROW_stage_0_1 ) begin
      VCOL_nor_1_itm_1 <= ~((VROW_y_sva_mx1[8:1]!=8'b00000000));
    end
  end
  assign nl_dy_rsci_idat_35_27  = ({1'b1 , (pix2_lpi_2_dfm_1[31:24])}) + conv_u2s_8_9(~
      (pix0_sva_dfm_2_mx0[31:24])) + 9'b000000001;
  assign nl_dy_rsci_idat_8_0  = ({1'b1 , (pix2_lpi_2_dfm_1[7:0])}) + conv_u2s_8_9(~
      (pix0_sva_dfm_2_mx0[7:0])) + 9'b000000001;
  assign nl_dy_rsci_idat_26_18  = ({1'b1 , (pix2_lpi_2_dfm_1[23:16])}) + conv_u2s_8_9(~
      (pix0_sva_dfm_2_mx0[23:16])) + 9'b000000001;
  assign nl_dy_rsci_idat_17_9  = ({1'b1 , (pix2_lpi_2_dfm_1[15:8])}) + conv_u2s_8_9(~
      (pix0_sva_dfm_2_mx0[15:8])) + 9'b000000001;
  assign or_68_nl = (~((~ (operator_10_false_acc_tmp[0])) | VCOL_VCOL_if_6_VCOL_if_6_nor_tmp
      | (~ VROW_stage_0_1))) | (VROW_y_sva[8:1]!=8'b00000000);
  assign nand_2_nl = ~(VCOL_nor_1_itm_1 & ((~ (operator_10_false_acc_tmp[0])) | VCOL_VCOL_if_6_VCOL_if_6_nor_tmp
      | (~ VROW_stage_0_1)));
  assign mux_nl = MUX_s_1_2_2(or_68_nl, nand_2_nl, VROW_y_sva[0]);
  assign mux_1_nl = MUX_s_1_2_2(VROW_stage_0_1, mux_nl, VROW_stage_0_2);
  assign and_70_nl = ((VCOL_if_6_mux_tmp!=9'b000000000)) & or_dcpl_21;
  assign mux_5_nl = MUX_s_1_2_2(or_dcpl_7, and_70_nl, VROW_stage_0_2);

  function automatic [31:0] MUX1HOT_v_32_3_2;
    input [31:0] input_2;
    input [31:0] input_1;
    input [31:0] input_0;
    input [2:0] sel;
    reg [31:0] result;
  begin
    result = input_0 & {32{sel[0]}};
    result = result | (input_1 & {32{sel[1]}});
    result = result | (input_2 & {32{sel[2]}});
    MUX1HOT_v_32_3_2 = result;
  end
  endfunction


  function automatic  MUX_s_1_2_2;
    input  input_0;
    input  input_1;
    input  sel;
    reg  result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_s_1_2_2 = result;
  end
  endfunction


  function automatic [31:0] MUX_v_32_2_2;
    input [31:0] input_0;
    input [31:0] input_1;
    input  sel;
    reg [31:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_32_2_2 = result;
  end
  endfunction


  function automatic [63:0] MUX_v_64_2_2;
    input [63:0] input_0;
    input [63:0] input_1;
    input  sel;
    reg [63:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_64_2_2 = result;
  end
  endfunction


  function automatic [7:0] MUX_v_8_2_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input  sel;
    reg [7:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_8_2_2 = result;
  end
  endfunction


  function automatic [8:0] MUX_v_9_2_2;
    input [8:0] input_0;
    input [8:0] input_1;
    input  sel;
    reg [8:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_9_2_2 = result;
  end
  endfunction


  function automatic [0:0] readslicef_10_1_9;
    input [9:0] vector;
    reg [9:0] tmp;
  begin
    tmp = vector >> 9;
    readslicef_10_1_9 = tmp[0:0];
  end
  endfunction


  function automatic [8:0] conv_u2s_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2s_8_9 =  {1'b0, vector};
  end
  endfunction


  function automatic [9:0] conv_u2s_9_10 ;
    input [8:0]  vector ;
  begin
    conv_u2s_9_10 =  {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_HorDer_run
// ------------------------------------------------------------------


module EdgeDetect_HorDer_run (
  clk, rst, arst_n, pix_in_rsc_dat, pix_in_rsc_vld, pix_in_rsc_rdy, widthIn, heightIn,
      pix_out_rsc_dat, pix_out_rsc_vld, pix_out_rsc_rdy, dx_rsc_dat, dx_rsc_vld,
      dx_rsc_rdy
);
  input clk;
  input rst;
  input arst_n;
  input [31:0] pix_in_rsc_dat;
  input pix_in_rsc_vld;
  output pix_in_rsc_rdy;
  input [9:0] widthIn;
  input [8:0] heightIn;
  output [31:0] pix_out_rsc_dat;
  output pix_out_rsc_vld;
  input pix_out_rsc_rdy;
  output [35:0] dx_rsc_dat;
  output dx_rsc_vld;
  input dx_rsc_rdy;


  // Interconnect Declarations
  wire run_wen;
  wire pix_in_rsci_wen_comp;
  wire [31:0] pix_in_rsci_idat_mxwt;
  wire pix_out_rsci_wen_comp;
  wire dx_rsci_wen_comp;
  reg [7:0] pix_out_rsci_idat_31_24;
  reg [7:0] pix_out_rsci_idat_23_16;
  reg [7:0] pix_out_rsci_idat_15_8;
  reg [7:0] pix_out_rsci_idat_7_0;
  reg [8:0] dx_rsci_idat_35_27;
  wire [9:0] nl_dx_rsci_idat_35_27;
  reg [8:0] dx_rsci_idat_26_18;
  reg [8:0] dx_rsci_idat_17_9;
  reg [8:0] dx_rsci_idat_8_0;
  wire [2:0] fsm_output;
  wire HROW_equal_tmp;
  wire [7:0] operator_10_false_acc_tmp;
  wire [8:0] nl_operator_10_false_acc_tmp;
  wire HCOL_else_1_HCOL_else_1_if_HCOL_else_1_if_equal_tmp;
  wire or_dcpl_1;
  wire and_dcpl;
  wire and_dcpl_9;
  wire or_dcpl_5;
  wire or_dcpl_10;
  wire mux_tmp_1;
  wire or_dcpl_14;
  wire [7:0] HCOL_x_9_2_sva_mx1;
  reg HROW_stage_0_2;
  reg HROW_stage_0_1;
  reg [7:0] HCOL_x_9_2_sva;
  reg HCOL_unequal_tmp_1;
  reg HCOL_if_slc_operator_11_true_acc_8_svs_1;
  wire HCOL_if_2_and_cse;
  reg reg_dx_rsci_iswt0_cse;
  reg reg_pix_in_rsci_iswt0_cse;
  wire [7:0] HCOL_if_1_for_1_mux_8_cse;
  wire or_29_tmp;
  wire [31:0] pix_sva_dfm_mx0;
  reg [31:0] pix_sva;
  reg [7:0] win_5_sva;
  reg [7:0] win_6_sva;
  reg [7:0] win_7_sva;
  reg [7:0] win_8_sva;
  reg [8:0] HROW_y_sva;
  reg [8:0] operator_8_false_2_acc_1_itm_1;
  wire [9:0] nl_operator_8_false_2_acc_1_itm_1;
  reg [8:0] operator_8_false_2_acc_2_itm_1;
  wire [9:0] nl_operator_8_false_2_acc_2_itm_1;
  reg [8:0] operator_8_false_2_acc_3_itm_1;
  wire [9:0] nl_operator_8_false_2_acc_3_itm_1;
  wire HROW_stage_0_1_mx0w1;
  wire [7:0] win_5_sva_mx0;
  wire HCOL_unequal_tmp_1_1;
  wire operator_8_false_2_and_cse;
  wire HCOL_and_5_cse;
  wire win_and_2_cse;
  wire nand_12_cse;
  wire operator_11_true_acc_itm_8_1;

  wire[7:0] win_mux_6_nl;
  wire nand_9_nl;
  wire[8:0] HROW_acc_nl;
  wire[9:0] nl_HROW_acc_nl;
  wire mux_2_nl;
  wire mux_nl;
  wire or_nl;
  wire nor_nl;
  wire[7:0] HCOL_HCOL_mux1h_nl;
  wire HCOL_and_nl;
  wire HCOL_and_4_nl;
  wire[7:0] HCOL_if_1_for_1_mux_6_nl;
  wire[7:0] HCOL_if_1_for_1_mux_4_nl;
  wire[7:0] HCOL_HCOL_and_nl;
  wire HCOL_if_3_HCOL_if_3_or_nl;
  wire win_and_nl;
  wire win_and_1_nl;
  wire[8:0] operator_11_true_acc_nl;
  wire[9:0] nl_operator_11_true_acc_nl;
  wire[8:0] operator_9_false_acc_nl;
  wire[9:0] nl_operator_9_false_acc_nl;
  wire nor_3_nl;
  wire or_16_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [31:0] nl_EdgeDetect_HorDer_run_pix_out_rsci_inst_pix_out_rsci_idat;
  assign nl_EdgeDetect_HorDer_run_pix_out_rsci_inst_pix_out_rsci_idat = {pix_out_rsci_idat_31_24
      , pix_out_rsci_idat_23_16 , pix_out_rsci_idat_15_8 , pix_out_rsci_idat_7_0};
  wire [35:0] nl_EdgeDetect_HorDer_run_dx_rsci_inst_dx_rsci_idat;
  assign nl_EdgeDetect_HorDer_run_dx_rsci_inst_dx_rsci_idat = {dx_rsci_idat_35_27
      , dx_rsci_idat_26_18 , dx_rsci_idat_17_9 , dx_rsci_idat_8_0};
  wire  nl_EdgeDetect_HorDer_run_run_fsm_inst_HROW_C_0_tr0;
  assign nl_EdgeDetect_HorDer_run_run_fsm_inst_HROW_C_0_tr0 = ~(HROW_stage_0_2 |
      HROW_stage_0_1);
  EdgeDetect_HorDer_run_pix_in_rsci EdgeDetect_HorDer_run_pix_in_rsci_inst (
      .pix_in_rsc_dat(pix_in_rsc_dat),
      .pix_in_rsc_vld(pix_in_rsc_vld),
      .pix_in_rsc_rdy(pix_in_rsc_rdy),
      .run_wen(run_wen),
      .pix_in_rsci_oswt(reg_pix_in_rsci_iswt0_cse),
      .pix_in_rsci_wen_comp(pix_in_rsci_wen_comp),
      .pix_in_rsci_idat_mxwt(pix_in_rsci_idat_mxwt)
    );
  EdgeDetect_HorDer_run_pix_out_rsci EdgeDetect_HorDer_run_pix_out_rsci_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .pix_out_rsc_dat(pix_out_rsc_dat),
      .pix_out_rsc_vld(pix_out_rsc_vld),
      .pix_out_rsc_rdy(pix_out_rsc_rdy),
      .run_wen(run_wen),
      .pix_out_rsci_oswt(reg_dx_rsci_iswt0_cse),
      .pix_out_rsci_wen_comp(pix_out_rsci_wen_comp),
      .pix_out_rsci_idat(nl_EdgeDetect_HorDer_run_pix_out_rsci_inst_pix_out_rsci_idat[31:0])
    );
  EdgeDetect_HorDer_run_dx_rsci EdgeDetect_HorDer_run_dx_rsci_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dx_rsc_dat(dx_rsc_dat),
      .dx_rsc_vld(dx_rsc_vld),
      .dx_rsc_rdy(dx_rsc_rdy),
      .run_wen(run_wen),
      .dx_rsci_oswt(reg_dx_rsci_iswt0_cse),
      .dx_rsci_wen_comp(dx_rsci_wen_comp),
      .dx_rsci_idat(nl_EdgeDetect_HorDer_run_dx_rsci_inst_dx_rsci_idat[35:0])
    );
  EdgeDetect_HorDer_run_staller EdgeDetect_HorDer_run_staller_inst (
      .run_wen(run_wen),
      .pix_in_rsci_wen_comp(pix_in_rsci_wen_comp),
      .pix_out_rsci_wen_comp(pix_out_rsci_wen_comp),
      .dx_rsci_wen_comp(dx_rsci_wen_comp)
    );
  EdgeDetect_HorDer_run_run_fsm EdgeDetect_HorDer_run_run_fsm_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .run_wen(run_wen),
      .fsm_output(fsm_output),
      .HROW_C_0_tr0(nl_EdgeDetect_HorDer_run_run_fsm_inst_HROW_C_0_tr0)
    );
  assign HCOL_if_2_and_cse = run_wen & (~(and_dcpl_9 & (HCOL_x_9_2_sva[5:0]==6'b000000)))
      & HROW_stage_0_2 & (fsm_output[1]);
  assign nand_12_cse = ~(HCOL_else_1_HCOL_else_1_if_HCOL_else_1_if_equal_tmp & HROW_stage_0_2);
  assign mux_2_nl = MUX_s_1_2_2(HCOL_else_1_HCOL_else_1_if_HCOL_else_1_if_equal_tmp,
      mux_tmp_1, HCOL_x_9_2_sva[0]);
  assign win_and_2_cse = run_wen & and_dcpl & (~(mux_2_nl & HCOL_unequal_tmp_1))
      & HROW_stage_0_2;
  assign HCOL_if_1_for_1_mux_8_cse = MUX_v_8_2_2((pix_sva_dfm_mx0[15:8]), win_6_sva,
      or_dcpl_14);
  assign or_nl = (HCOL_x_9_2_sva!=8'b00000000);
  assign nor_nl = ~((~((operator_10_false_acc_tmp!=8'b00000000))) | HCOL_else_1_HCOL_else_1_if_HCOL_else_1_if_equal_tmp);
  assign mux_nl = MUX_s_1_2_2(or_nl, nor_nl, HROW_stage_0_2);
  assign operator_8_false_2_and_cse = run_wen & mux_nl & HROW_stage_0_1;
  assign HCOL_and_5_cse = run_wen & and_dcpl;
  assign HCOL_if_3_HCOL_if_3_or_nl = HROW_equal_tmp | (~ HCOL_else_1_HCOL_else_1_if_HCOL_else_1_if_equal_tmp);
  assign HCOL_HCOL_and_nl = MUX_v_8_2_2(8'b00000000, operator_10_false_acc_tmp, HCOL_if_3_HCOL_if_3_or_nl);
  assign HCOL_x_9_2_sva_mx1 = MUX_v_8_2_2(HCOL_x_9_2_sva, HCOL_HCOL_and_nl, HROW_stage_0_2);
  assign HROW_stage_0_1_mx0w1 = HROW_stage_0_1 & or_dcpl_5;
  assign or_29_tmp = or_dcpl_10 | (HCOL_x_9_2_sva[5:1]!=5'b00000) | (~((HCOL_x_9_2_sva[0])
      & HCOL_unequal_tmp_1));
  assign win_and_nl = (~ or_29_tmp) & HROW_stage_0_2;
  assign win_and_1_nl = or_29_tmp & HROW_stage_0_2;
  assign win_5_sva_mx0 = MUX1HOT_v_8_3_2(win_5_sva, win_7_sva, (pix_sva_dfm_mx0[7:0]),
      {(~ HROW_stage_0_2) , win_and_nl , win_and_1_nl});
  assign HCOL_unequal_tmp_1_1 = ~((HCOL_x_9_2_sva_mx1==8'b00000001));
  assign nl_operator_11_true_acc_nl = ({1'b1 , (widthIn[9:2])}) + conv_u2s_8_9(~
      HCOL_x_9_2_sva_mx1);
  assign operator_11_true_acc_nl = nl_operator_11_true_acc_nl[8:0];
  assign operator_11_true_acc_itm_8_1 = readslicef_9_1_8(operator_11_true_acc_nl);
  assign pix_sva_dfm_mx0 = MUX_v_32_2_2(pix_in_rsci_idat_mxwt, pix_sva, HCOL_if_slc_operator_11_true_acc_8_svs_1);
  assign nl_operator_10_false_acc_tmp = HCOL_x_9_2_sva + 8'b00000001;
  assign operator_10_false_acc_tmp = nl_operator_10_false_acc_tmp[7:0];
  assign nl_operator_9_false_acc_nl = heightIn + 9'b111111111;
  assign operator_9_false_acc_nl = nl_operator_9_false_acc_nl[8:0];
  assign HROW_equal_tmp = HROW_y_sva == operator_9_false_acc_nl;
  assign HCOL_else_1_HCOL_else_1_if_HCOL_else_1_if_equal_tmp = HCOL_x_9_2_sva ==
      (widthIn[9:2]);
  assign or_dcpl_1 = ~(HCOL_else_1_HCOL_else_1_if_HCOL_else_1_if_equal_tmp & HROW_stage_0_2
      & HROW_equal_tmp);
  assign and_dcpl = or_dcpl_1 & HROW_stage_0_1;
  assign and_dcpl_9 = ~((HCOL_x_9_2_sva[7:6]!=2'b00));
  assign or_dcpl_5 = nand_12_cse | (~ HROW_equal_tmp);
  assign or_dcpl_10 = (HCOL_x_9_2_sva[7:6]!=2'b00);
  assign nor_3_nl = ~((HCOL_x_9_2_sva[7:1]!=7'b0000000));
  assign or_16_nl = (HCOL_x_9_2_sva[7:1]!=7'b0000000);
  assign mux_tmp_1 = MUX_s_1_2_2(nor_3_nl, or_16_nl, HCOL_else_1_HCOL_else_1_if_HCOL_else_1_if_equal_tmp);
  assign or_dcpl_14 = ~((~(and_dcpl_9 & (HCOL_x_9_2_sva[5:0]==6'b000001) & HCOL_unequal_tmp_1))
      & HROW_stage_0_2);
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      HCOL_x_9_2_sva <= 8'b00000000;
    end
    else if ( rst ) begin
      HCOL_x_9_2_sva <= 8'b00000000;
    end
    else if ( (HROW_stage_0_2 | (~ (fsm_output[1]))) & run_wen ) begin
      HCOL_x_9_2_sva <= MUX_v_8_2_2(8'b00000000, HCOL_x_9_2_sva_mx1, (fsm_output[1]));
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dx_rsci_idat_35_27 <= 9'b000000000;
      dx_rsci_idat_8_0 <= 9'b000000000;
      dx_rsci_idat_26_18 <= 9'b000000000;
      dx_rsci_idat_17_9 <= 9'b000000000;
      pix_out_rsci_idat_31_24 <= 8'b00000000;
      pix_out_rsci_idat_7_0 <= 8'b00000000;
      pix_out_rsci_idat_23_16 <= 8'b00000000;
      pix_out_rsci_idat_15_8 <= 8'b00000000;
    end
    else if ( rst ) begin
      dx_rsci_idat_35_27 <= 9'b000000000;
      dx_rsci_idat_8_0 <= 9'b000000000;
      dx_rsci_idat_26_18 <= 9'b000000000;
      dx_rsci_idat_17_9 <= 9'b000000000;
      pix_out_rsci_idat_31_24 <= 8'b00000000;
      pix_out_rsci_idat_7_0 <= 8'b00000000;
      pix_out_rsci_idat_23_16 <= 8'b00000000;
      pix_out_rsci_idat_15_8 <= 8'b00000000;
    end
    else if ( HCOL_if_2_and_cse ) begin
      dx_rsci_idat_35_27 <= nl_dx_rsci_idat_35_27[8:0];
      dx_rsci_idat_8_0 <= operator_8_false_2_acc_3_itm_1;
      dx_rsci_idat_26_18 <= operator_8_false_2_acc_1_itm_1;
      dx_rsci_idat_17_9 <= operator_8_false_2_acc_2_itm_1;
      pix_out_rsci_idat_31_24 <= win_8_sva;
      pix_out_rsci_idat_7_0 <= win_5_sva;
      pix_out_rsci_idat_23_16 <= win_7_sva;
      pix_out_rsci_idat_15_8 <= win_6_sva;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      HROW_stage_0_1 <= 1'b0;
      HROW_stage_0_2 <= 1'b0;
      reg_dx_rsci_iswt0_cse <= 1'b0;
      reg_pix_in_rsci_iswt0_cse <= 1'b0;
    end
    else if ( rst ) begin
      HROW_stage_0_1 <= 1'b0;
      HROW_stage_0_2 <= 1'b0;
      reg_dx_rsci_iswt0_cse <= 1'b0;
      reg_pix_in_rsci_iswt0_cse <= 1'b0;
    end
    else if ( run_wen ) begin
      HROW_stage_0_1 <= HROW_stage_0_1_mx0w1 | (~ (fsm_output[1]));
      HROW_stage_0_2 <= HROW_stage_0_1_mx0w1 & (fsm_output[1]);
      reg_dx_rsci_iswt0_cse <= (or_dcpl_10 | (HCOL_x_9_2_sva[5:0]!=6'b000000)) &
          HROW_stage_0_2 & (fsm_output[1]);
      reg_pix_in_rsci_iswt0_cse <= or_dcpl_5 & HROW_stage_0_1 & (~ operator_11_true_acc_itm_8_1)
          & (fsm_output[1]);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      HROW_y_sva <= 9'b000000000;
    end
    else if ( rst ) begin
      HROW_y_sva <= 9'b000000000;
    end
    else if ( (~(nand_12_cse & (fsm_output[1]))) & run_wen ) begin
      HROW_y_sva <= MUX_v_9_2_2(9'b000000000, HROW_acc_nl, (fsm_output[1]));
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      win_7_sva <= 8'b00000000;
      win_8_sva <= 8'b00000000;
      win_6_sva <= 8'b00000000;
    end
    else if ( rst ) begin
      win_7_sva <= 8'b00000000;
      win_8_sva <= 8'b00000000;
      win_6_sva <= 8'b00000000;
    end
    else if ( win_and_2_cse ) begin
      win_7_sva <= pix_sva_dfm_mx0[23:16];
      win_8_sva <= pix_sva_dfm_mx0[31:24];
      win_6_sva <= pix_sva_dfm_mx0[15:8];
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      operator_8_false_2_acc_3_itm_1 <= 9'b000000000;
      operator_8_false_2_acc_1_itm_1 <= 9'b000000000;
      operator_8_false_2_acc_2_itm_1 <= 9'b000000000;
    end
    else if ( rst ) begin
      operator_8_false_2_acc_3_itm_1 <= 9'b000000000;
      operator_8_false_2_acc_1_itm_1 <= 9'b000000000;
      operator_8_false_2_acc_2_itm_1 <= 9'b000000000;
    end
    else if ( operator_8_false_2_and_cse ) begin
      operator_8_false_2_acc_3_itm_1 <= nl_operator_8_false_2_acc_3_itm_1[8:0];
      operator_8_false_2_acc_1_itm_1 <= nl_operator_8_false_2_acc_1_itm_1[8:0];
      operator_8_false_2_acc_2_itm_1 <= nl_operator_8_false_2_acc_2_itm_1[8:0];
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      win_5_sva <= 8'b00000000;
    end
    else if ( rst ) begin
      win_5_sva <= 8'b00000000;
    end
    else if ( ((operator_10_false_acc_tmp!=8'b00000000)) & (~ HCOL_else_1_HCOL_else_1_if_HCOL_else_1_if_equal_tmp)
        & run_wen & HROW_stage_0_1 & HROW_stage_0_2 ) begin
      win_5_sva <= win_5_sva_mx0;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      HCOL_unequal_tmp_1 <= 1'b0;
      HCOL_if_slc_operator_11_true_acc_8_svs_1 <= 1'b0;
    end
    else if ( rst ) begin
      HCOL_unequal_tmp_1 <= 1'b0;
      HCOL_if_slc_operator_11_true_acc_8_svs_1 <= 1'b0;
    end
    else if ( HCOL_and_5_cse ) begin
      HCOL_unequal_tmp_1 <= HCOL_unequal_tmp_1_1;
      HCOL_if_slc_operator_11_true_acc_8_svs_1 <= operator_11_true_acc_itm_8_1;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      pix_sva <= 32'b00000000000000000000000000000000;
    end
    else if ( rst ) begin
      pix_sva <= 32'b00000000000000000000000000000000;
    end
    else if ( run_wen & or_dcpl_1 & HROW_stage_0_1 & operator_11_true_acc_itm_8_1
        & (~(HCOL_if_slc_operator_11_true_acc_8_svs_1 | (~ HROW_stage_0_2))) ) begin
      pix_sva <= pix_in_rsci_idat_mxwt;
    end
  end
  assign nand_9_nl = ~(mux_tmp_1 & HCOL_unequal_tmp_1);
  assign win_mux_6_nl = MUX_v_8_2_2(win_7_sva, (pix_sva_dfm_mx0[7:0]), nand_9_nl);
  assign nl_dx_rsci_idat_35_27  = ({1'b1 , win_7_sva}) + conv_u2s_8_9(~ win_mux_6_nl)
      + 9'b000000001;
  assign nl_HROW_acc_nl = HROW_y_sva + 9'b000000001;
  assign HROW_acc_nl = nl_HROW_acc_nl[8:0];
  assign HCOL_and_nl = (~ HROW_stage_0_2) & HCOL_unequal_tmp_1_1;
  assign HCOL_and_4_nl = HROW_stage_0_2 & HCOL_unequal_tmp_1_1;
  assign HCOL_HCOL_mux1h_nl = MUX1HOT_v_8_3_2(HCOL_if_1_for_1_mux_8_cse, pix_out_rsci_idat_31_24,
      win_8_sva, {(~ HCOL_unequal_tmp_1_1) , HCOL_and_nl , HCOL_and_4_nl});
  assign nl_operator_8_false_2_acc_3_itm_1  = ({1'b1 , HCOL_HCOL_mux1h_nl}) + conv_u2s_8_9(~
      HCOL_if_1_for_1_mux_8_cse) + 9'b000000001;
  assign HCOL_if_1_for_1_mux_6_nl = MUX_v_8_2_2((pix_sva_dfm_mx0[31:24]), win_8_sva,
      or_dcpl_14);
  assign nl_operator_8_false_2_acc_1_itm_1  = ({1'b1 , HCOL_if_1_for_1_mux_8_cse})
      + conv_u2s_8_9(~ HCOL_if_1_for_1_mux_6_nl) + 9'b000000001;
  assign HCOL_if_1_for_1_mux_4_nl = MUX_v_8_2_2((pix_sva_dfm_mx0[23:16]), win_7_sva,
      or_dcpl_14);
  assign nl_operator_8_false_2_acc_2_itm_1  = ({1'b1 , win_5_sva_mx0}) + conv_u2s_8_9(~
      HCOL_if_1_for_1_mux_4_nl) + 9'b000000001;

  function automatic [7:0] MUX1HOT_v_8_3_2;
    input [7:0] input_2;
    input [7:0] input_1;
    input [7:0] input_0;
    input [2:0] sel;
    reg [7:0] result;
  begin
    result = input_0 & {8{sel[0]}};
    result = result | (input_1 & {8{sel[1]}});
    result = result | (input_2 & {8{sel[2]}});
    MUX1HOT_v_8_3_2 = result;
  end
  endfunction


  function automatic  MUX_s_1_2_2;
    input  input_0;
    input  input_1;
    input  sel;
    reg  result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_s_1_2_2 = result;
  end
  endfunction


  function automatic [31:0] MUX_v_32_2_2;
    input [31:0] input_0;
    input [31:0] input_1;
    input  sel;
    reg [31:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_32_2_2 = result;
  end
  endfunction


  function automatic [7:0] MUX_v_8_2_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input  sel;
    reg [7:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_8_2_2 = result;
  end
  endfunction


  function automatic [8:0] MUX_v_9_2_2;
    input [8:0] input_0;
    input [8:0] input_1;
    input  sel;
    reg [8:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_9_2_2 = result;
  end
  endfunction


  function automatic [0:0] readslicef_9_1_8;
    input [8:0] vector;
    reg [8:0] tmp;
  begin
    tmp = vector >> 8;
    readslicef_9_1_8 = tmp[0:0];
  end
  endfunction


  function automatic [8:0] conv_u2s_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2s_8_9 =  {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_MagAng_run
// ------------------------------------------------------------------


module EdgeDetect_MagAng_run (
  clk, rst, arst_n, dx_in_rsc_dat, dx_in_rsc_vld, dx_in_rsc_rdy, dy_in_rsc_dat, dy_in_rsc_vld,
      dy_in_rsc_rdy, pix_in_rsc_dat, pix_in_rsc_vld, pix_in_rsc_rdy, widthIn, heightIn,
      sw_in, crc32_pix_in_triosy_lz, crc32_dat_out_triosy_lz, dat_out_rsc_dat, dat_out_rsc_vld,
      dat_out_rsc_rdy, crc32_pix_in_rsci_idat, crc32_dat_out_rsci_idat
);
  input clk;
  input rst;
  input arst_n;
  input [35:0] dx_in_rsc_dat;
  input dx_in_rsc_vld;
  output dx_in_rsc_rdy;
  input [35:0] dy_in_rsc_dat;
  input dy_in_rsc_vld;
  output dy_in_rsc_rdy;
  input [31:0] pix_in_rsc_dat;
  input pix_in_rsc_vld;
  output pix_in_rsc_rdy;
  input [9:0] widthIn;
  input [8:0] heightIn;
  input sw_in;
  output crc32_pix_in_triosy_lz;
  output crc32_dat_out_triosy_lz;
  output [33:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  output [31:0] crc32_pix_in_rsci_idat;
  output [31:0] crc32_dat_out_rsci_idat;


  // Interconnect Declarations
  wire run_wen;
  wire run_wten;
  wire dx_in_rsci_wen_comp;
  wire [35:0] dx_in_rsci_idat_mxwt;
  wire dy_in_rsci_wen_comp;
  wire [35:0] dy_in_rsci_idat_mxwt;
  wire pix_in_rsci_wen_comp;
  wire [31:0] pix_in_rsci_idat_mxwt;
  wire dat_out_rsci_wen_comp;
  reg dat_out_rsci_idat_33;
  reg dat_out_rsci_idat_32;
  reg [7:0] dat_out_rsci_idat_31_24;
  reg [7:0] dat_out_rsci_idat_23_16;
  reg [7:0] dat_out_rsci_idat_15_8;
  reg [7:0] dat_out_rsci_idat_7_0;
  reg not_64;
  reg not_65;
  reg not_66;
  reg not_67;
  reg not_68;
  reg not_69;
  reg not_70;
  reg not_71;
  reg not_72;
  reg not_73;
  reg not_74;
  reg not_75;
  reg not_76;
  reg not_77;
  reg not_78;
  reg not_79;
  reg not_80;
  reg not_81;
  reg not_82;
  reg not_83;
  reg not_84;
  reg not_85;
  reg not_86;
  reg not_87;
  reg not_88;
  reg not_89;
  reg not_90;
  reg not_91;
  reg not_92;
  reg not_93;
  reg not_94;
  reg not_95;
  reg not_96;
  reg not_97;
  reg not_98;
  reg not_99;
  reg not_100;
  reg not_101;
  reg not_102;
  reg not_103;
  reg not_104;
  reg not_105;
  reg not_106;
  reg not_107;
  reg not_108;
  reg not_109;
  reg not_110;
  reg not_111;
  reg not_112;
  reg not_113;
  reg not_114;
  reg not_115;
  reg not_116;
  reg not_117;
  reg not_118;
  reg not_119;
  reg not_120;
  reg not_121;
  reg not_122;
  reg not_123;
  reg not_124;
  reg not_125;
  reg not_126;
  reg not_127;
  wire [2:0] fsm_output;
  wire MROW_equal_tmp;
  wire and_dcpl_7;
  wire and_dcpl_9;
  wire or_tmp_2;
  wire [8:0] MCOL_for_abs_sum_clip_asn_sat_1_sva_1;
  wire [9:0] nl_MCOL_for_abs_sum_clip_asn_sat_1_sva_1;
  wire [8:0] MCOL_for_abs_sum_clip_asn_sat_2_sva_1;
  wire [9:0] nl_MCOL_for_abs_sum_clip_asn_sat_2_sva_1;
  wire [8:0] MCOL_for_abs_sum_clip_asn_sat_3_sva_1;
  wire [9:0] nl_MCOL_for_abs_sum_clip_asn_sat_3_sva_1;
  wire [8:0] MCOL_for_abs_sum_clip_asn_sat_sva_1;
  wire [9:0] nl_MCOL_for_abs_sum_clip_asn_sat_sva_1;
  reg MROW_stage_0;
  reg reg_pix_in_rsci_oswt_cse;
  wire MCOL_and_cse;
  wire MCOL_and_4_cse;
  reg reg_crc32_dat_out_triosy_obj_iswt0_cse;
  reg reg_dat_out_rsci_iswt0_cse;
  wire and_307_cse;
  wire MCOL_unequal_itm;
  wire [8:0] z_out;
  wire [9:0] nl_z_out;
  reg [8:0] MROW_y_sva;
  reg [7:0] MCOL_x_9_2_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_31_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_9_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_21_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_24_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_27_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_31_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_9_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_21_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_24_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_27_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva;
  reg EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva;
  wire [7:0] magn_out_7_0_lpi_2_dfm_mx0w1;
  wire [7:0] magn_out_15_8_lpi_2_dfm_mx0w1;
  wire [7:0] magn_out_23_16_lpi_2_dfm_mx0w1;
  wire [7:0] magn_out_31_24_lpi_2_dfm_mx0w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva_1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_9_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva_mx1w0;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_27_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva_mx1w0;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva_mx1w0;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_24_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_21_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_31_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva_mx1w0;
  wire EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva_1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_9_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva_mx1w0;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_27_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva_mx1w0;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva_mx1w0;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_24_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_21_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_31_sva_mx1w1;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva_mx1w0;
  wire [7:0] magn_out_7_0_lpi_2_dfm_mx0;
  wire [7:0] magn_out_15_8_lpi_2_dfm_mx0;
  wire [7:0] magn_out_23_16_lpi_2_dfm_mx0;
  wire [7:0] magn_out_31_24_lpi_2_dfm_mx0;
  wire [8:0] operator_11_true_acc_psp_sva_1;
  wire [9:0] nl_operator_11_true_acc_psp_sva_1;
  wire xor_cse;
  wire xor_cse_3;
  wire xor_cse_6;
  wire xor_cse_9;
  wire xor_cse_12;
  wire xor_cse_15;
  wire xor_cse_18;
  wire xor_cse_20;
  wire xor_cse_22;
  wire xor_cse_24;
  wire xor_cse_28;
  wire xor_cse_31;
  wire xor_cse_35;
  wire xor_cse_37;
  wire xor_cse_42;
  wire xor_cse_43;
  wire xor_cse_45;
  wire xor_cse_48;
  wire xor_cse_50;
  wire xor_cse_52;
  wire xor_cse_58;
  wire xor_cse_60;
  wire xor_cse_62;
  wire xor_cse_65;
  wire xor_cse_66;
  wire xor_cse_69;
  wire xor_cse_71;
  wire xor_cse_73;
  wire xor_cse_74;
  wire xor_cse_76;
  wire xor_cse_79;
  wire xor_cse_84;
  wire xor_cse_85;
  wire xor_cse_86;
  wire xor_cse_87;
  wire xor_cse_88;
  wire xor_cse_91;
  wire xor_cse_92;
  wire xor_cse_93;
  wire xor_cse_95;
  wire xor_cse_98;
  wire xor_cse_99;
  wire xor_cse_100;
  wire xor_cse_102;
  wire xor_cse_110;
  wire xor_cse_118;
  wire xor_cse_119;
  wire xor_cse_123;
  wire xor_cse_125;
  wire xor_cse_128;
  wire xor_cse_146;
  wire xor_cse_149;
  wire xor_cse_152;
  wire xor_cse_155;
  wire xor_cse_158;
  wire xor_cse_161;
  wire xor_cse_164;
  wire xor_cse_166;
  wire xor_cse_168;
  wire xor_cse_170;
  wire xor_cse_174;
  wire xor_cse_177;
  wire xor_cse_181;
  wire xor_cse_183;
  wire xor_cse_188;
  wire xor_cse_189;
  wire xor_cse_191;
  wire xor_cse_194;
  wire xor_cse_196;
  wire xor_cse_198;
  wire xor_cse_204;
  wire xor_cse_206;
  wire xor_cse_208;
  wire xor_cse_211;
  wire xor_cse_212;
  wire xor_cse_215;
  wire xor_cse_217;
  wire xor_cse_219;
  wire xor_cse_220;
  wire xor_cse_222;
  wire xor_cse_225;
  wire xor_cse_230;
  wire xor_cse_231;
  wire xor_cse_232;
  wire xor_cse_233;
  wire xor_cse_234;
  wire xor_cse_237;
  wire xor_cse_238;
  wire xor_cse_239;
  wire xor_cse_241;
  wire xor_cse_244;
  wire xor_cse_245;
  wire xor_cse_246;
  wire xor_cse_248;
  wire xor_cse_256;
  wire xor_cse_264;
  wire xor_cse_265;
  wire xor_cse_269;
  wire xor_cse_271;
  wire xor_cse_274;
  wire nand_6_cse;
  wire nor_cse;
  wire nand_5_cse;
  wire and_373_itm;

  wire EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_mux1h_1_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_1_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_3_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_5_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_7_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_9_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_11_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_13_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_15_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_17_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_19_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_21_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_23_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_25_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_27_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_29_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_31_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_33_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_35_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_37_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_39_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_41_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_43_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_45_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_47_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_49_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_51_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_53_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_55_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_57_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_59_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_61_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_mux1h_1_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_1_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_3_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_5_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_7_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_9_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_11_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_13_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_15_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_17_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_19_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_21_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_23_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_25_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_27_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_29_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_31_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_33_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_35_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_37_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_39_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_41_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_43_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_45_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_47_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_49_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_51_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_53_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_55_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_57_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_59_nl;
  wire EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_61_nl;
  wire MCOL_if_1_MCOL_if_1_or_nl;
  wire[7:0] MCOL_for_1_ac_math_ac_abs_9_8_xabs_acc_nl;
  wire[8:0] nl_MCOL_for_1_ac_math_ac_abs_9_8_xabs_acc_nl;
  wire[7:0] MCOL_for_1_ac_math_ac_abs_9_8_xabs_xor_nl;
  wire[7:0] MCOL_for_1_ac_math_ac_abs_9_8_1_xabs_acc_nl;
  wire[8:0] nl_MCOL_for_1_ac_math_ac_abs_9_8_1_xabs_acc_nl;
  wire[7:0] MCOL_for_1_ac_math_ac_abs_9_8_1_xabs_xor_nl;
  wire[7:0] MCOL_for_2_ac_math_ac_abs_9_8_xabs_acc_nl;
  wire[8:0] nl_MCOL_for_2_ac_math_ac_abs_9_8_xabs_acc_nl;
  wire[7:0] MCOL_for_2_ac_math_ac_abs_9_8_xabs_xor_nl;
  wire[7:0] MCOL_for_2_ac_math_ac_abs_9_8_1_xabs_acc_nl;
  wire[8:0] nl_MCOL_for_2_ac_math_ac_abs_9_8_1_xabs_acc_nl;
  wire[7:0] MCOL_for_2_ac_math_ac_abs_9_8_1_xabs_xor_nl;
  wire[7:0] MCOL_for_3_ac_math_ac_abs_9_8_xabs_acc_nl;
  wire[8:0] nl_MCOL_for_3_ac_math_ac_abs_9_8_xabs_acc_nl;
  wire[7:0] MCOL_for_3_ac_math_ac_abs_9_8_xabs_xor_nl;
  wire[7:0] MCOL_for_3_ac_math_ac_abs_9_8_1_xabs_acc_nl;
  wire[8:0] nl_MCOL_for_3_ac_math_ac_abs_9_8_1_xabs_acc_nl;
  wire[7:0] MCOL_for_3_ac_math_ac_abs_9_8_1_xabs_xor_nl;
  wire[7:0] MCOL_for_4_ac_math_ac_abs_9_8_xabs_acc_nl;
  wire[8:0] nl_MCOL_for_4_ac_math_ac_abs_9_8_xabs_acc_nl;
  wire[7:0] MCOL_for_4_ac_math_ac_abs_9_8_xabs_xor_nl;
  wire[7:0] MCOL_for_4_ac_math_ac_abs_9_8_1_xabs_acc_nl;
  wire[8:0] nl_MCOL_for_4_ac_math_ac_abs_9_8_1_xabs_acc_nl;
  wire[7:0] MCOL_for_4_ac_math_ac_abs_9_8_1_xabs_xor_nl;
  wire[8:0] operator_9_false_acc_nl;
  wire[9:0] nl_operator_9_false_acc_nl;
  wire MROW_MROW_and_1_nl;
  wire[7:0] MROW_mux_2_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [33:0] nl_EdgeDetect_MagAng_run_dat_out_rsci_inst_dat_out_rsci_idat;
  assign nl_EdgeDetect_MagAng_run_dat_out_rsci_inst_dat_out_rsci_idat = {dat_out_rsci_idat_33
      , dat_out_rsci_idat_32 , dat_out_rsci_idat_31_24 , dat_out_rsci_idat_23_16
      , dat_out_rsci_idat_15_8 , dat_out_rsci_idat_7_0};
  wire  nl_EdgeDetect_MagAng_run_run_fsm_inst_MROW_C_0_tr0;
  assign nl_EdgeDetect_MagAng_run_run_fsm_inst_MROW_C_0_tr0 = ~ MROW_stage_0;
  EdgeDetect_MagAng_run_dx_in_rsci EdgeDetect_MagAng_run_dx_in_rsci_inst (
      .dx_in_rsc_dat(dx_in_rsc_dat),
      .dx_in_rsc_vld(dx_in_rsc_vld),
      .dx_in_rsc_rdy(dx_in_rsc_rdy),
      .run_wen(run_wen),
      .dx_in_rsci_oswt(reg_pix_in_rsci_oswt_cse),
      .dx_in_rsci_wen_comp(dx_in_rsci_wen_comp),
      .dx_in_rsci_idat_mxwt(dx_in_rsci_idat_mxwt)
    );
  EdgeDetect_MagAng_run_dy_in_rsci EdgeDetect_MagAng_run_dy_in_rsci_inst (
      .dy_in_rsc_dat(dy_in_rsc_dat),
      .dy_in_rsc_vld(dy_in_rsc_vld),
      .dy_in_rsc_rdy(dy_in_rsc_rdy),
      .run_wen(run_wen),
      .dy_in_rsci_oswt(reg_pix_in_rsci_oswt_cse),
      .dy_in_rsci_wen_comp(dy_in_rsci_wen_comp),
      .dy_in_rsci_idat_mxwt(dy_in_rsci_idat_mxwt)
    );
  EdgeDetect_MagAng_run_pix_in_rsci EdgeDetect_MagAng_run_pix_in_rsci_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .pix_in_rsc_dat(pix_in_rsc_dat),
      .pix_in_rsc_vld(pix_in_rsc_vld),
      .pix_in_rsc_rdy(pix_in_rsc_rdy),
      .run_wen(run_wen),
      .pix_in_rsci_oswt(reg_pix_in_rsci_oswt_cse),
      .pix_in_rsci_wen_comp(pix_in_rsci_wen_comp),
      .pix_in_rsci_idat_mxwt(pix_in_rsci_idat_mxwt)
    );
  EdgeDetect_MagAng_run_dat_out_rsci EdgeDetect_MagAng_run_dat_out_rsci_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_out_rsc_dat(dat_out_rsc_dat),
      .dat_out_rsc_vld(dat_out_rsc_vld),
      .dat_out_rsc_rdy(dat_out_rsc_rdy),
      .run_wen(run_wen),
      .dat_out_rsci_oswt(reg_dat_out_rsci_iswt0_cse),
      .dat_out_rsci_wen_comp(dat_out_rsci_wen_comp),
      .dat_out_rsci_idat(nl_EdgeDetect_MagAng_run_dat_out_rsci_inst_dat_out_rsci_idat[33:0])
    );
  EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj EdgeDetect_MagAng_run_crc32_pix_in_triosy_obj_inst
      (
      .crc32_pix_in_triosy_lz(crc32_pix_in_triosy_lz),
      .run_wten(run_wten),
      .crc32_pix_in_triosy_obj_iswt0(reg_crc32_dat_out_triosy_obj_iswt0_cse)
    );
  EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj EdgeDetect_MagAng_run_crc32_dat_out_triosy_obj_inst
      (
      .crc32_dat_out_triosy_lz(crc32_dat_out_triosy_lz),
      .run_wten(run_wten),
      .crc32_dat_out_triosy_obj_iswt0(reg_crc32_dat_out_triosy_obj_iswt0_cse)
    );
  EdgeDetect_MagAng_run_staller EdgeDetect_MagAng_run_staller_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .run_wen(run_wen),
      .run_wten(run_wten),
      .dx_in_rsci_wen_comp(dx_in_rsci_wen_comp),
      .dy_in_rsci_wen_comp(dy_in_rsci_wen_comp),
      .pix_in_rsci_wen_comp(pix_in_rsci_wen_comp),
      .dat_out_rsci_wen_comp(dat_out_rsci_wen_comp)
    );
  EdgeDetect_MagAng_run_run_fsm EdgeDetect_MagAng_run_run_fsm_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .run_wen(run_wen),
      .fsm_output(fsm_output),
      .MROW_C_0_tr0(nl_EdgeDetect_MagAng_run_run_fsm_inst_MROW_C_0_tr0)
    );
  assign crc32_dat_out_rsci_idat = {not_64 , not_65 , not_66 , not_67 , not_68 ,
      not_69 , not_70 , not_71 , not_72 , not_73 , not_74 , not_75 , not_76 , not_77
      , not_78 , not_79 , not_80 , not_81 , not_82 , not_83 , not_84 , not_85 , not_86
      , not_87 , not_88 , not_89 , not_90 , not_91 , not_92 , not_93 , not_94 , not_95};
  assign crc32_pix_in_rsci_idat = {not_96 , not_97 , not_98 , not_99 , not_100 ,
      not_101 , not_102 , not_103 , not_104 , not_105 , not_106 , not_107 , not_108
      , not_109 , not_110 , not_111 , not_112 , not_113 , not_114 , not_115 , not_116
      , not_117 , not_118 , not_119 , not_120 , not_121 , not_122 , not_123 , not_124
      , not_125 , not_126 , not_127};
  assign nand_6_cse = ~(nor_cse & MROW_equal_tmp);
  assign nand_5_cse = ~(nand_6_cse & MROW_stage_0);
  assign MCOL_and_cse = run_wen & ((MROW_stage_0 & (~ sw_in) & (fsm_output[1])) |
      or_tmp_2);
  assign MCOL_and_4_cse = run_wen & MROW_stage_0 & (fsm_output[1]);
  assign nor_cse = ~(MCOL_unequal_itm | (operator_11_true_acc_psp_sva_1[8]));
  assign and_307_cse = run_wen & (~(MROW_stage_0 | (~ (fsm_output[1]))));
  assign magn_out_7_0_lpi_2_dfm_mx0w1 = MUX_v_8_2_2((MCOL_for_abs_sum_clip_asn_sat_1_sva_1[7:0]),
      8'b11111111, (MCOL_for_abs_sum_clip_asn_sat_1_sva_1[8]));
  assign magn_out_15_8_lpi_2_dfm_mx0w1 = MUX_v_8_2_2((MCOL_for_abs_sum_clip_asn_sat_2_sva_1[7:0]),
      8'b11111111, (MCOL_for_abs_sum_clip_asn_sat_2_sva_1[8]));
  assign magn_out_23_16_lpi_2_dfm_mx0w1 = MUX_v_8_2_2((MCOL_for_abs_sum_clip_asn_sat_3_sva_1[7:0]),
      8'b11111111, (MCOL_for_abs_sum_clip_asn_sat_3_sva_1[8]));
  assign magn_out_31_24_lpi_2_dfm_mx0w1 = MUX_v_8_2_2((MCOL_for_abs_sum_clip_asn_sat_sva_1[7:0]),
      8'b11111111, (MCOL_for_abs_sum_clip_asn_sat_sva_1[8]));
  assign MCOL_unequal_itm = MCOL_x_9_2_sva != (operator_11_true_acc_psp_sva_1[7:0]);
  assign magn_out_7_0_lpi_2_dfm_mx0 = MUX_v_8_2_2((pix_in_rsci_idat_mxwt[7:0]), magn_out_7_0_lpi_2_dfm_mx0w1,
      sw_in);
  assign magn_out_15_8_lpi_2_dfm_mx0 = MUX_v_8_2_2((pix_in_rsci_idat_mxwt[15:8]),
      magn_out_15_8_lpi_2_dfm_mx0w1, sw_in);
  assign magn_out_23_16_lpi_2_dfm_mx0 = MUX_v_8_2_2((pix_in_rsci_idat_mxwt[23:16]),
      magn_out_23_16_lpi_2_dfm_mx0w1, sw_in);
  assign magn_out_31_24_lpi_2_dfm_mx0 = MUX_v_8_2_2((pix_in_rsci_idat_mxwt[31:24]),
      magn_out_31_24_lpi_2_dfm_mx0w1, sw_in);
  assign MCOL_for_1_ac_math_ac_abs_9_8_xabs_xor_nl = (signext_8_1(dx_in_rsci_idat_mxwt[8]))
      ^ (dx_in_rsci_idat_mxwt[7:0]);
  assign nl_MCOL_for_1_ac_math_ac_abs_9_8_xabs_acc_nl = MCOL_for_1_ac_math_ac_abs_9_8_xabs_xor_nl
      + conv_u2u_1_8(dx_in_rsci_idat_mxwt[8]);
  assign MCOL_for_1_ac_math_ac_abs_9_8_xabs_acc_nl = nl_MCOL_for_1_ac_math_ac_abs_9_8_xabs_acc_nl[7:0];
  assign MCOL_for_1_ac_math_ac_abs_9_8_1_xabs_xor_nl = (signext_8_1(dy_in_rsci_idat_mxwt[8]))
      ^ (dy_in_rsci_idat_mxwt[7:0]);
  assign nl_MCOL_for_1_ac_math_ac_abs_9_8_1_xabs_acc_nl = MCOL_for_1_ac_math_ac_abs_9_8_1_xabs_xor_nl
      + conv_u2u_1_8(dy_in_rsci_idat_mxwt[8]);
  assign MCOL_for_1_ac_math_ac_abs_9_8_1_xabs_acc_nl = nl_MCOL_for_1_ac_math_ac_abs_9_8_1_xabs_acc_nl[7:0];
  assign nl_MCOL_for_abs_sum_clip_asn_sat_1_sva_1 = conv_u2u_8_9(MCOL_for_1_ac_math_ac_abs_9_8_xabs_acc_nl)
      + conv_u2u_8_9(MCOL_for_1_ac_math_ac_abs_9_8_1_xabs_acc_nl);
  assign MCOL_for_abs_sum_clip_asn_sat_1_sva_1 = nl_MCOL_for_abs_sum_clip_asn_sat_1_sva_1[8:0];
  assign MCOL_for_2_ac_math_ac_abs_9_8_xabs_xor_nl = (signext_8_1(dx_in_rsci_idat_mxwt[17]))
      ^ (dx_in_rsci_idat_mxwt[16:9]);
  assign nl_MCOL_for_2_ac_math_ac_abs_9_8_xabs_acc_nl = MCOL_for_2_ac_math_ac_abs_9_8_xabs_xor_nl
      + conv_u2u_1_8(dx_in_rsci_idat_mxwt[17]);
  assign MCOL_for_2_ac_math_ac_abs_9_8_xabs_acc_nl = nl_MCOL_for_2_ac_math_ac_abs_9_8_xabs_acc_nl[7:0];
  assign MCOL_for_2_ac_math_ac_abs_9_8_1_xabs_xor_nl = (signext_8_1(dy_in_rsci_idat_mxwt[17]))
      ^ (dy_in_rsci_idat_mxwt[16:9]);
  assign nl_MCOL_for_2_ac_math_ac_abs_9_8_1_xabs_acc_nl = MCOL_for_2_ac_math_ac_abs_9_8_1_xabs_xor_nl
      + conv_u2u_1_8(dy_in_rsci_idat_mxwt[17]);
  assign MCOL_for_2_ac_math_ac_abs_9_8_1_xabs_acc_nl = nl_MCOL_for_2_ac_math_ac_abs_9_8_1_xabs_acc_nl[7:0];
  assign nl_MCOL_for_abs_sum_clip_asn_sat_2_sva_1 = conv_u2u_8_9(MCOL_for_2_ac_math_ac_abs_9_8_xabs_acc_nl)
      + conv_u2u_8_9(MCOL_for_2_ac_math_ac_abs_9_8_1_xabs_acc_nl);
  assign MCOL_for_abs_sum_clip_asn_sat_2_sva_1 = nl_MCOL_for_abs_sum_clip_asn_sat_2_sva_1[8:0];
  assign MCOL_for_3_ac_math_ac_abs_9_8_xabs_xor_nl = (signext_8_1(dx_in_rsci_idat_mxwt[26]))
      ^ (dx_in_rsci_idat_mxwt[25:18]);
  assign nl_MCOL_for_3_ac_math_ac_abs_9_8_xabs_acc_nl = MCOL_for_3_ac_math_ac_abs_9_8_xabs_xor_nl
      + conv_u2u_1_8(dx_in_rsci_idat_mxwt[26]);
  assign MCOL_for_3_ac_math_ac_abs_9_8_xabs_acc_nl = nl_MCOL_for_3_ac_math_ac_abs_9_8_xabs_acc_nl[7:0];
  assign MCOL_for_3_ac_math_ac_abs_9_8_1_xabs_xor_nl = (signext_8_1(dy_in_rsci_idat_mxwt[26]))
      ^ (dy_in_rsci_idat_mxwt[25:18]);
  assign nl_MCOL_for_3_ac_math_ac_abs_9_8_1_xabs_acc_nl = MCOL_for_3_ac_math_ac_abs_9_8_1_xabs_xor_nl
      + conv_u2u_1_8(dy_in_rsci_idat_mxwt[26]);
  assign MCOL_for_3_ac_math_ac_abs_9_8_1_xabs_acc_nl = nl_MCOL_for_3_ac_math_ac_abs_9_8_1_xabs_acc_nl[7:0];
  assign nl_MCOL_for_abs_sum_clip_asn_sat_3_sva_1 = conv_u2u_8_9(MCOL_for_3_ac_math_ac_abs_9_8_xabs_acc_nl)
      + conv_u2u_8_9(MCOL_for_3_ac_math_ac_abs_9_8_1_xabs_acc_nl);
  assign MCOL_for_abs_sum_clip_asn_sat_3_sva_1 = nl_MCOL_for_abs_sum_clip_asn_sat_3_sva_1[8:0];
  assign MCOL_for_4_ac_math_ac_abs_9_8_xabs_xor_nl = (signext_8_1(dx_in_rsci_idat_mxwt[35]))
      ^ (dx_in_rsci_idat_mxwt[34:27]);
  assign nl_MCOL_for_4_ac_math_ac_abs_9_8_xabs_acc_nl = MCOL_for_4_ac_math_ac_abs_9_8_xabs_xor_nl
      + conv_u2u_1_8(dx_in_rsci_idat_mxwt[35]);
  assign MCOL_for_4_ac_math_ac_abs_9_8_xabs_acc_nl = nl_MCOL_for_4_ac_math_ac_abs_9_8_xabs_acc_nl[7:0];
  assign MCOL_for_4_ac_math_ac_abs_9_8_1_xabs_xor_nl = (signext_8_1(dy_in_rsci_idat_mxwt[35]))
      ^ (dy_in_rsci_idat_mxwt[34:27]);
  assign nl_MCOL_for_4_ac_math_ac_abs_9_8_1_xabs_acc_nl = MCOL_for_4_ac_math_ac_abs_9_8_1_xabs_xor_nl
      + conv_u2u_1_8(dy_in_rsci_idat_mxwt[35]);
  assign MCOL_for_4_ac_math_ac_abs_9_8_1_xabs_acc_nl = nl_MCOL_for_4_ac_math_ac_abs_9_8_1_xabs_acc_nl[7:0];
  assign nl_MCOL_for_abs_sum_clip_asn_sat_sva_1 = conv_u2u_8_9(MCOL_for_4_ac_math_ac_abs_9_8_xabs_acc_nl)
      + conv_u2u_8_9(MCOL_for_4_ac_math_ac_abs_9_8_1_xabs_acc_nl);
  assign MCOL_for_abs_sum_clip_asn_sat_sva_1 = nl_MCOL_for_abs_sum_clip_asn_sat_sva_1[8:0];
  assign nl_operator_9_false_acc_nl = heightIn + 9'b111111111;
  assign operator_9_false_acc_nl = nl_operator_9_false_acc_nl[8:0];
  assign MROW_equal_tmp = MROW_y_sva == operator_9_false_acc_nl;
  assign nl_operator_11_true_acc_psp_sva_1 = conv_u2s_8_9(widthIn[9:2]) + 9'b111111111;
  assign operator_11_true_acc_psp_sva_1 = nl_operator_11_true_acc_psp_sva_1[8:0];
  assign and_dcpl_7 = (~ nand_6_cse) & MROW_stage_0;
  assign and_dcpl_9 = nand_6_cse & MROW_stage_0;
  assign or_tmp_2 = MROW_stage_0 & sw_in & (fsm_output[1]);
  assign xor_cse = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[7])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_31_sva ^ (magn_out_31_24_lpi_2_dfm_mx0[7]);
  assign xor_cse_3 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[0])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva ^ (magn_out_23_16_lpi_2_dfm_mx0[6]);
  assign xor_cse_6 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[3])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[6]);
  assign xor_cse_9 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva ^ (magn_out_15_8_lpi_2_dfm_mx0[7])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[1]);
  assign xor_cse_12 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva ^ (magn_out_31_24_lpi_2_dfm_mx0[1])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[2]);
  assign xor_cse_15 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[5])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_21_sva ^ (magn_out_23_16_lpi_2_dfm_mx0[3]);
  assign xor_cse_18 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_24_sva ^ (magn_out_23_16_lpi_2_dfm_mx0[5]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva_1 = xor_cse ^ xor_cse_3
      ^ xor_cse_6 ^ xor_cse_9 ^ xor_cse_12 ^ xor_cse_15 ^ xor_cse_18;
  assign xor_cse_20 = xor_cse ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva
      ^ (magn_out_15_8_lpi_2_dfm_mx0[7]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_21_sva;
  assign xor_cse_22 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[5])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_9_sva ^ (magn_out_15_8_lpi_2_dfm_mx0[0]);
  assign xor_cse_24 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva ^ (magn_out_15_8_lpi_2_dfm_mx0[5])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_sva ^ (magn_out_23_16_lpi_2_dfm_mx0[1]);
  assign xor_cse_28 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[4])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva ^ (magn_out_23_16_lpi_2_dfm_mx0[4]);
  assign xor_cse_31 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva ^ (magn_out_15_8_lpi_2_dfm_mx0[4])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[2]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_9_sva_mx1w1 = xor_cse_20 ^ (magn_out_23_16_lpi_2_dfm_mx0[3])
      ^ xor_cse_3 ^ xor_cse_22 ^ xor_cse_24 ^ xor_cse_28 ^ xor_cse_31;
  assign xor_cse_35 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva ^ (magn_out_31_24_lpi_2_dfm_mx0[6])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva ^ (magn_out_31_24_lpi_2_dfm_mx0[1]);
  assign xor_cse_37 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva ^ (magn_out_15_8_lpi_2_dfm_mx0[6])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva ^ (magn_out_23_16_lpi_2_dfm_mx0[2]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva_mx1w0 = xor_cse_20 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva
      ^ (magn_out_23_16_lpi_2_dfm_mx0[6]) ^ (magn_out_23_16_lpi_2_dfm_mx0[3]) ^ xor_cse_35
      ^ xor_cse_37 ^ xor_cse_28 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_27_sva
      ^ (magn_out_31_24_lpi_2_dfm_mx0[0]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva
      ^ (magn_out_7_0_lpi_2_dfm_mx0[3]);
  assign xor_cse_43 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva ^ (magn_out_31_24_lpi_2_dfm_mx0[4])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva ^ (magn_out_15_8_lpi_2_dfm_mx0[4]);
  assign xor_cse_45 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[2])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva ^ (magn_out_23_16_lpi_2_dfm_mx0[7]);
  assign xor_cse_42 = xor_cse_43 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva
      ^ (magn_out_31_24_lpi_2_dfm_mx0[1]) ^ xor_cse_45;
  assign xor_cse_48 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva ^ (magn_out_31_24_lpi_2_dfm_mx0[3])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_21_sva ^ (magn_out_23_16_lpi_2_dfm_mx0[3]);
  assign xor_cse_50 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva ^ (magn_out_23_16_lpi_2_dfm_mx0[0])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva ^ (magn_out_23_16_lpi_2_dfm_mx0[4]);
  assign xor_cse_52 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva ^ (magn_out_15_8_lpi_2_dfm_mx0[5])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[0]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_27_sva_mx1w1 = xor_cse_42 ^ xor_cse
      ^ xor_cse_48 ^ xor_cse_50 ^ xor_cse_52 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_sva
      ^ (magn_out_15_8_lpi_2_dfm_mx0[3]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_sva
      ^ (magn_out_7_0_lpi_2_dfm_mx0[1]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva
      ^ (magn_out_31_24_lpi_2_dfm_mx0[5]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva
      ^ (magn_out_7_0_lpi_2_dfm_mx0[6]);
  assign xor_cse_58 = xor_cse ^ xor_cse_37 ^ xor_cse_35 ^ xor_cse_3;
  assign xor_cse_60 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_27_sva ^ (magn_out_31_24_lpi_2_dfm_mx0[0])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva ^ (magn_out_31_24_lpi_2_dfm_mx0[5]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva_mx1w0 = xor_cse_58 ^ xor_cse_60
      ^ xor_cse_24 ^ xor_cse_9 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva
      ^ (magn_out_23_16_lpi_2_dfm_mx0[7]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva
      ^ (magn_out_7_0_lpi_2_dfm_mx0[5]);
  assign xor_cse_62 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva ^ (magn_out_31_24_lpi_2_dfm_mx0[2])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva ^ (magn_out_15_8_lpi_2_dfm_mx0[2]);
  assign xor_cse_65 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva ^ (magn_out_31_24_lpi_2_dfm_mx0[3])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_sva ^ (magn_out_15_8_lpi_2_dfm_mx0[3]);
  assign xor_cse_66 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva ^ (magn_out_23_16_lpi_2_dfm_mx0[2])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_27_sva ^ (magn_out_31_24_lpi_2_dfm_mx0[0]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva_mx1w1 = xor_cse ^ xor_cse_35
      ^ xor_cse_62 ^ xor_cse_43 ^ xor_cse_65 ^ xor_cse_66 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva
      ^ (magn_out_7_0_lpi_2_dfm_mx0[2]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva
      ^ (magn_out_7_0_lpi_2_dfm_mx0[3]) ^ xor_cse_18;
  assign xor_cse_69 = xor_cse_3 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva
      ^ (magn_out_7_0_lpi_2_dfm_mx0[4]);
  assign xor_cse_71 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva ^ (magn_out_23_16_lpi_2_dfm_mx0[0])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva;
  assign xor_cse_73 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[6])
      ^ (magn_out_31_24_lpi_2_dfm_mx0[6]);
  assign xor_cse_74 = (magn_out_15_8_lpi_2_dfm_mx0[6]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva
      ^ (magn_out_23_16_lpi_2_dfm_mx0[7]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva_mx1w0 = xor_cse_69 ^
      xor_cse_60 ^ xor_cse_43 ^ xor_cse_24 ^ xor_cse_71 ^ xor_cse_73 ^ xor_cse_74
      ^ xor_cse_18;
  assign xor_cse_76 = xor_cse_62 ^ xor_cse_45 ^ xor_cse_60;
  assign xor_cse_79 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[1])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva ^ (magn_out_15_8_lpi_2_dfm_mx0[1]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva_mx1w1 = xor_cse_76 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva
      ^ (magn_out_23_16_lpi_2_dfm_mx0[4]) ^ xor_cse_35 ^ xor_cse_79 ^ xor_cse_65
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_sva ^ (magn_out_23_16_lpi_2_dfm_mx0[1])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[6]);
  assign xor_cse_84 = EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva ^ (magn_out_15_8_lpi_2_dfm_mx0[1])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_24_sva ^ (magn_out_23_16_lpi_2_dfm_mx0[5]);
  assign xor_cse_85 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva ^ (magn_out_15_8_lpi_2_dfm_mx0[7])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva ^ (magn_out_31_24_lpi_2_dfm_mx0[4]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_24_sva_mx1w1 = xor_cse_76 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_9_sva
      ^ (magn_out_15_8_lpi_2_dfm_mx0[0]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva
      ^ (magn_out_23_16_lpi_2_dfm_mx0[0]) ^ xor_cse ^ xor_cse_6 ^ xor_cse_84 ^ xor_cse_85;
  assign xor_cse_86 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[3])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva ^ (magn_out_15_8_lpi_2_dfm_mx0[6]);
  assign xor_cse_87 = (magn_out_31_24_lpi_2_dfm_mx0[6]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_9_sva;
  assign xor_cse_88 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva ^ (magn_out_31_24_lpi_2_dfm_mx0[4])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva ^ (magn_out_23_16_lpi_2_dfm_mx0[7]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva_mx1w1 = xor_cse_48 ^ xor_cse_84
      ^ xor_cse_86 ^ xor_cse_87 ^ xor_cse_88 ^ (magn_out_15_8_lpi_2_dfm_mx0[0]) ^
      (magn_out_23_16_lpi_2_dfm_mx0[4]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_31_sva
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[0])
      ^ (magn_out_31_24_lpi_2_dfm_mx0[7]);
  assign xor_cse_91 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[2])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva ^ (magn_out_31_24_lpi_2_dfm_mx0[2]);
  assign xor_cse_92 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[7])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva ^ (magn_out_31_24_lpi_2_dfm_mx0[5]);
  assign xor_cse_93 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva ^ (magn_out_15_8_lpi_2_dfm_mx0[5])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva ^ (magn_out_23_16_lpi_2_dfm_mx0[6]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva_mx1w1 = xor_cse_48 ^
      xor_cse_91 ^ xor_cse_87 ^ xor_cse_92 ^ xor_cse_93 ^ (magn_out_15_8_lpi_2_dfm_mx0[0])
      ^ (magn_out_23_16_lpi_2_dfm_mx0[4]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva
      ^ (magn_out_23_16_lpi_2_dfm_mx0[2]);
  assign xor_cse_95 = xor_cse_43 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva
      ^ (magn_out_23_16_lpi_2_dfm_mx0[2]);
  assign xor_cse_98 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva ^ (magn_out_15_8_lpi_2_dfm_mx0[7])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[5]);
  assign xor_cse_99 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[3])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_sva ^ (magn_out_23_16_lpi_2_dfm_mx0[1]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_21_sva_mx1w1 = xor_cse_95 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva
      ^ (magn_out_31_24_lpi_2_dfm_mx0[5]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_31_sva
      ^ (magn_out_31_24_lpi_2_dfm_mx0[7]) ^ xor_cse_3 ^ xor_cse_91 ^ xor_cse_98 ^
      xor_cse_99;
  assign xor_cse_100 = xor_cse_3 ^ xor_cse_6 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva
      ^ (magn_out_31_24_lpi_2_dfm_mx0[4]);
  assign xor_cse_102 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[4])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_sva ^ (magn_out_15_8_lpi_2_dfm_mx0[3]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva_mx1w1 = xor_cse_100 ^ xor_cse
      ^ xor_cse_102 ^ xor_cse_48 ^ xor_cse_98 ^ xor_cse_71 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_sva
      ^ (magn_out_23_16_lpi_2_dfm_mx0[1]) ^ (magn_out_15_8_lpi_2_dfm_mx0[6]) ^ (magn_out_31_24_lpi_2_dfm_mx0[6]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva_mx1w1 = xor_cse_100 ^
      EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva ^ (magn_out_15_8_lpi_2_dfm_mx0[1])
      ^ xor_cse_22 ^ xor_cse_12 ^ xor_cse_66 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva
      ^ (magn_out_7_0_lpi_2_dfm_mx0[4]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva
      ^ (magn_out_15_8_lpi_2_dfm_mx0[2]);
  assign xor_cse_110 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[4])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[1]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_sva_mx1w1 = xor_cse_58 ^ (magn_out_15_8_lpi_2_dfm_mx0[5])
      ^ (magn_out_31_24_lpi_2_dfm_mx0[5]) ^ xor_cse_62 ^ xor_cse_48 ^ xor_cse_110
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva ^ (magn_out_23_16_lpi_2_dfm_mx0[0])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva;
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva_mx1w1 = xor_cse_95 ^
      xor_cse_6 ^ xor_cse_60 ^ xor_cse_35 ^ xor_cse_24 ^ xor_cse_84 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva
      ^ (magn_out_31_24_lpi_2_dfm_mx0[2]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva
      ^ (magn_out_15_8_lpi_2_dfm_mx0[7]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva
      ^ (magn_out_7_0_lpi_2_dfm_mx0[0]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva_mx1w1 = xor_cse_42 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva
      ^ (magn_out_15_8_lpi_2_dfm_mx0[6]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_sva
      ^ (magn_out_23_16_lpi_2_dfm_mx0[1]) ^ xor_cse_60 ^ xor_cse_22 ^ xor_cse_50
      ^ xor_cse_65;
  assign xor_cse_119 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_27_sva ^ (magn_out_31_24_lpi_2_dfm_mx0[0])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[7]);
  assign xor_cse_118 = xor_cse_102 ^ xor_cse_62 ^ xor_cse_119;
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva_mx1w1 = xor_cse_118
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva ^ (magn_out_23_16_lpi_2_dfm_mx0[0])
      ^ xor_cse_48 ^ xor_cse_9 ^ xor_cse_88 ^ xor_cse_93;
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva_mx1w1 = xor_cse ^ xor_cse_45
      ^ xor_cse_62 ^ xor_cse_48 ^ xor_cse_37 ^ xor_cse_79 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva
      ^ (magn_out_15_8_lpi_2_dfm_mx0[4]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva
      ^ (magn_out_7_0_lpi_2_dfm_mx0[5]);
  assign xor_cse_123 = (magn_out_15_8_lpi_2_dfm_mx0[0]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_9_sva
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva ^ (magn_out_31_24_lpi_2_dfm_mx0[2]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva_mx1w1 = xor_cse_3 ^
      xor_cse_35 ^ xor_cse_102 ^ xor_cse_24 ^ xor_cse_79 ^ xor_cse_123 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva
      ^ (magn_out_7_0_lpi_2_dfm_mx0[6]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva
      ^ (magn_out_23_16_lpi_2_dfm_mx0[2]);
  assign xor_cse_125 = xor_cse_22 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva
      ^ (magn_out_31_24_lpi_2_dfm_mx0[1]);
  assign xor_cse_128 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva ^ (magn_out_15_8_lpi_2_dfm_mx0[2])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_24_sva ^ (magn_out_23_16_lpi_2_dfm_mx0[5]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_sva_mx1w1 = xor_cse_125 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva
      ^ (magn_out_23_16_lpi_2_dfm_mx0[0]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva
      ^ (magn_out_7_0_lpi_2_dfm_mx0[0]) ^ xor_cse_60 ^ xor_cse_99 ^ xor_cse_128 ^
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva ^ (magn_out_7_0_lpi_2_dfm_mx0[7])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva ^ (magn_out_15_8_lpi_2_dfm_mx0[4]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva_mx1w1 = xor_cse_45 ^
      xor_cse_102 ^ xor_cse_50 ^ xor_cse_119 ^ xor_cse_85 ^ EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva
      ^ (magn_out_15_8_lpi_2_dfm_mx0[1]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva
      ^ (magn_out_7_0_lpi_2_dfm_mx0[6]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_sva_mx1w1 = EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva
      ^ xor_cse_6 ^ xor_cse_22 ^ xor_cse_48 ^ xor_cse_9 ^ xor_cse_74 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva ^ (magn_out_15_8_lpi_2_dfm_mx0[2])
      ^ (magn_out_23_16_lpi_2_dfm_mx0[6]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva_mx1w1 = xor_cse_69 ^
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva ^ (magn_out_15_8_lpi_2_dfm_mx0[5])
      ^ xor_cse_37 ^ xor_cse_84 ^ xor_cse_91 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva
      ^ (magn_out_7_0_lpi_2_dfm_mx0[7]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva
      ^ (magn_out_7_0_lpi_2_dfm_mx0[5]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva_mx1w1 = xor_cse_45 ^
      xor_cse_22 ^ xor_cse_84 ^ xor_cse_119 ^ xor_cse_99 ^ xor_cse_110 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva
      ^ (magn_out_31_24_lpi_2_dfm_mx0[3]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva_mx1w1 = xor_cse_3 ^ xor_cse_45
      ^ xor_cse_6 ^ xor_cse_50 ^ xor_cse_110 ^ xor_cse_123 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva
      ^ (magn_out_7_0_lpi_2_dfm_mx0[7]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva_mx1w1 = xor_cse_3 ^ xor_cse_35
      ^ xor_cse_102 ^ xor_cse_37 ^ xor_cse_98 ^ xor_cse_31 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva
      ^ (magn_out_23_16_lpi_2_dfm_mx0[0]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_31_sva
      ^ (magn_out_31_24_lpi_2_dfm_mx0[7]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva_mx1w1 = xor_cse_60 ^
      xor_cse_102 ^ xor_cse_24 ^ xor_cse_9 ^ xor_cse_86 ^ xor_cse_128 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva
      ^ (magn_out_31_24_lpi_2_dfm_mx0[6]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva_mx1w1 = xor_cse_45 ^
      xor_cse_43 ^ xor_cse_50 ^ xor_cse_86 ^ xor_cse_52 ^ EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva
      ^ (magn_out_15_8_lpi_2_dfm_mx0[1]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva
      ^ (magn_out_15_8_lpi_2_dfm_mx0[2]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva
      ^ (magn_out_31_24_lpi_2_dfm_mx0[5]);
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva_mx1w1 = xor_cse_125 ^ xor_cse
      ^ xor_cse_6 ^ xor_cse_43 ^ xor_cse_84 ^ xor_cse_52 ^ xor_cse_65;
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_31_sva_mx1w1 = xor_cse_118 ^
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva ^ (magn_out_31_24_lpi_2_dfm_mx0[3])
      ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva
      ^ (magn_out_23_16_lpi_2_dfm_mx0[4]) ^ xor_cse_22 ^ xor_cse_31 ^ xor_cse_73;
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva_mx1w0 = xor_cse_6 ^ xor_cse_102
      ^ xor_cse_62 ^ xor_cse_79 ^ xor_cse_92 ^ xor_cse_15 ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva
      ^ (magn_out_31_24_lpi_2_dfm_mx0[1]) ^ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva
      ^ (magn_out_23_16_lpi_2_dfm_mx0[7]);
  assign xor_cse_146 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva ^ (pix_in_rsci_idat_mxwt[7])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_31_sva ^ (pix_in_rsci_idat_mxwt[31]);
  assign xor_cse_149 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva ^ (pix_in_rsci_idat_mxwt[0])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva ^ (pix_in_rsci_idat_mxwt[22]);
  assign xor_cse_152 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva ^ (pix_in_rsci_idat_mxwt[3])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva ^ (pix_in_rsci_idat_mxwt[6]);
  assign xor_cse_155 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva ^ (pix_in_rsci_idat_mxwt[15])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_sva ^ (pix_in_rsci_idat_mxwt[1]);
  assign xor_cse_158 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva ^ (pix_in_rsci_idat_mxwt[25])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva ^ (pix_in_rsci_idat_mxwt[2]);
  assign xor_cse_161 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva ^ (pix_in_rsci_idat_mxwt[5])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_21_sva ^ (pix_in_rsci_idat_mxwt[19]);
  assign xor_cse_164 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_24_sva ^ (pix_in_rsci_idat_mxwt[21]);
  assign EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva_1 = xor_cse_146 ^ xor_cse_149
      ^ xor_cse_152 ^ xor_cse_155 ^ xor_cse_158 ^ xor_cse_161 ^ xor_cse_164;
  assign xor_cse_166 = xor_cse_146 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva
      ^ (pix_in_rsci_idat_mxwt[15]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_21_sva;
  assign xor_cse_168 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva ^ (pix_in_rsci_idat_mxwt[5])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_9_sva ^ (pix_in_rsci_idat_mxwt[8]);
  assign xor_cse_170 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva ^ (pix_in_rsci_idat_mxwt[13])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_sva ^ (pix_in_rsci_idat_mxwt[17]);
  assign xor_cse_174 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva ^ (pix_in_rsci_idat_mxwt[4])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva ^ (pix_in_rsci_idat_mxwt[20]);
  assign xor_cse_177 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva ^ (pix_in_rsci_idat_mxwt[12])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva ^ (pix_in_rsci_idat_mxwt[2]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_9_sva_mx1w1 = xor_cse_166 ^ (pix_in_rsci_idat_mxwt[19])
      ^ xor_cse_149 ^ xor_cse_168 ^ xor_cse_170 ^ xor_cse_174 ^ xor_cse_177;
  assign xor_cse_181 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva ^ (pix_in_rsci_idat_mxwt[30])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva ^ (pix_in_rsci_idat_mxwt[25]);
  assign xor_cse_183 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva ^ (pix_in_rsci_idat_mxwt[14])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva ^ (pix_in_rsci_idat_mxwt[18]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva_mx1w0 = xor_cse_166 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva
      ^ (pix_in_rsci_idat_mxwt[22]) ^ (pix_in_rsci_idat_mxwt[19]) ^ xor_cse_181 ^
      xor_cse_183 ^ xor_cse_174 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_27_sva
      ^ (pix_in_rsci_idat_mxwt[24]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva
      ^ (pix_in_rsci_idat_mxwt[3]);
  assign xor_cse_189 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva ^ (pix_in_rsci_idat_mxwt[28])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva ^ (pix_in_rsci_idat_mxwt[12]);
  assign xor_cse_191 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva ^ (pix_in_rsci_idat_mxwt[2])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva ^ (pix_in_rsci_idat_mxwt[23]);
  assign xor_cse_188 = xor_cse_189 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva
      ^ (pix_in_rsci_idat_mxwt[25]) ^ xor_cse_191;
  assign xor_cse_194 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva ^ (pix_in_rsci_idat_mxwt[27])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_21_sva ^ (pix_in_rsci_idat_mxwt[19]);
  assign xor_cse_196 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva ^ (pix_in_rsci_idat_mxwt[16])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva ^ (pix_in_rsci_idat_mxwt[20]);
  assign xor_cse_198 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva ^ (pix_in_rsci_idat_mxwt[13])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva ^ (pix_in_rsci_idat_mxwt[0]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_27_sva_mx1w1 = xor_cse_188 ^ xor_cse_146
      ^ xor_cse_194 ^ xor_cse_196 ^ xor_cse_198 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_sva
      ^ (pix_in_rsci_idat_mxwt[11]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_sva
      ^ (pix_in_rsci_idat_mxwt[1]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva
      ^ (pix_in_rsci_idat_mxwt[29]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva
      ^ (pix_in_rsci_idat_mxwt[6]);
  assign xor_cse_204 = xor_cse_146 ^ xor_cse_183 ^ xor_cse_181 ^ xor_cse_149;
  assign xor_cse_206 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_27_sva ^ (pix_in_rsci_idat_mxwt[24])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva ^ (pix_in_rsci_idat_mxwt[29]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva_mx1w0 = xor_cse_204 ^ xor_cse_206
      ^ xor_cse_170 ^ xor_cse_155 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva
      ^ (pix_in_rsci_idat_mxwt[23]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva
      ^ (pix_in_rsci_idat_mxwt[5]);
  assign xor_cse_208 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva ^ (pix_in_rsci_idat_mxwt[26])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva ^ (pix_in_rsci_idat_mxwt[10]);
  assign xor_cse_211 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva ^ (pix_in_rsci_idat_mxwt[27])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_sva ^ (pix_in_rsci_idat_mxwt[11]);
  assign xor_cse_212 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva ^ (pix_in_rsci_idat_mxwt[18])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_27_sva ^ (pix_in_rsci_idat_mxwt[24]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva_mx1w1 = xor_cse_146 ^ xor_cse_181
      ^ xor_cse_208 ^ xor_cse_189 ^ xor_cse_211 ^ xor_cse_212 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva
      ^ (pix_in_rsci_idat_mxwt[2]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva
      ^ (pix_in_rsci_idat_mxwt[3]) ^ xor_cse_164;
  assign xor_cse_215 = xor_cse_149 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva
      ^ (pix_in_rsci_idat_mxwt[4]);
  assign xor_cse_217 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva ^ (pix_in_rsci_idat_mxwt[16])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva;
  assign xor_cse_219 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva ^ (pix_in_rsci_idat_mxwt[6])
      ^ (pix_in_rsci_idat_mxwt[30]);
  assign xor_cse_220 = (pix_in_rsci_idat_mxwt[14]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva
      ^ (pix_in_rsci_idat_mxwt[23]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva_mx1w0 = xor_cse_215 ^
      xor_cse_206 ^ xor_cse_189 ^ xor_cse_170 ^ xor_cse_217 ^ xor_cse_219 ^ xor_cse_220
      ^ xor_cse_164;
  assign xor_cse_222 = xor_cse_208 ^ xor_cse_191 ^ xor_cse_206;
  assign xor_cse_225 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_sva ^ (pix_in_rsci_idat_mxwt[1])
      ^ EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva ^ (pix_in_rsci_idat_mxwt[9]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva_mx1w1 = xor_cse_222 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva
      ^ (pix_in_rsci_idat_mxwt[20]) ^ xor_cse_181 ^ xor_cse_225 ^ xor_cse_211 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_sva
      ^ (pix_in_rsci_idat_mxwt[17]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva
      ^ (pix_in_rsci_idat_mxwt[6]);
  assign xor_cse_230 = EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva ^ (pix_in_rsci_idat_mxwt[9])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_24_sva ^ (pix_in_rsci_idat_mxwt[21]);
  assign xor_cse_231 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva ^ (pix_in_rsci_idat_mxwt[15])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva ^ (pix_in_rsci_idat_mxwt[28]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_24_sva_mx1w1 = xor_cse_222 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_9_sva
      ^ (pix_in_rsci_idat_mxwt[8]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva
      ^ (pix_in_rsci_idat_mxwt[16]) ^ xor_cse_146 ^ xor_cse_152 ^ xor_cse_230 ^ xor_cse_231;
  assign xor_cse_232 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva ^ (pix_in_rsci_idat_mxwt[3])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva ^ (pix_in_rsci_idat_mxwt[14]);
  assign xor_cse_233 = (pix_in_rsci_idat_mxwt[30]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_9_sva;
  assign xor_cse_234 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva ^ (pix_in_rsci_idat_mxwt[28])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva ^ (pix_in_rsci_idat_mxwt[23]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva_mx1w1 = xor_cse_194 ^ xor_cse_230
      ^ xor_cse_232 ^ xor_cse_233 ^ xor_cse_234 ^ (pix_in_rsci_idat_mxwt[8]) ^ (pix_in_rsci_idat_mxwt[20])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_31_sva ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva
      ^ (pix_in_rsci_idat_mxwt[0]) ^ (pix_in_rsci_idat_mxwt[31]);
  assign xor_cse_237 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva ^ (pix_in_rsci_idat_mxwt[2])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva ^ (pix_in_rsci_idat_mxwt[26]);
  assign xor_cse_238 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva ^ (pix_in_rsci_idat_mxwt[7])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva ^ (pix_in_rsci_idat_mxwt[29]);
  assign xor_cse_239 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva ^ (pix_in_rsci_idat_mxwt[13])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva ^ (pix_in_rsci_idat_mxwt[22]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva_mx1w1 = xor_cse_194 ^
      xor_cse_237 ^ xor_cse_233 ^ xor_cse_238 ^ xor_cse_239 ^ (pix_in_rsci_idat_mxwt[8])
      ^ (pix_in_rsci_idat_mxwt[20]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva
      ^ (pix_in_rsci_idat_mxwt[18]);
  assign xor_cse_241 = xor_cse_189 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva
      ^ (pix_in_rsci_idat_mxwt[18]);
  assign xor_cse_244 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva ^ (pix_in_rsci_idat_mxwt[15])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva ^ (pix_in_rsci_idat_mxwt[5]);
  assign xor_cse_245 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva ^ (pix_in_rsci_idat_mxwt[3])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_sva ^ (pix_in_rsci_idat_mxwt[17]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_21_sva_mx1w1 = xor_cse_241 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva
      ^ (pix_in_rsci_idat_mxwt[29]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_31_sva
      ^ (pix_in_rsci_idat_mxwt[31]) ^ xor_cse_149 ^ xor_cse_237 ^ xor_cse_244 ^ xor_cse_245;
  assign xor_cse_246 = xor_cse_149 ^ xor_cse_152 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva
      ^ (pix_in_rsci_idat_mxwt[28]);
  assign xor_cse_248 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva ^ (pix_in_rsci_idat_mxwt[4])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_sva ^ (pix_in_rsci_idat_mxwt[11]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva_mx1w1 = xor_cse_246 ^ xor_cse_146
      ^ xor_cse_248 ^ xor_cse_194 ^ xor_cse_244 ^ xor_cse_217 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_sva
      ^ (pix_in_rsci_idat_mxwt[17]) ^ (pix_in_rsci_idat_mxwt[14]) ^ (pix_in_rsci_idat_mxwt[30]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva_mx1w1 = xor_cse_246 ^ EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva
      ^ (pix_in_rsci_idat_mxwt[9]) ^ xor_cse_168 ^ xor_cse_158 ^ xor_cse_212 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva
      ^ (pix_in_rsci_idat_mxwt[4]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva
      ^ (pix_in_rsci_idat_mxwt[10]);
  assign xor_cse_256 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva ^ (pix_in_rsci_idat_mxwt[4])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_sva ^ (pix_in_rsci_idat_mxwt[1]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_sva_mx1w1 = xor_cse_204 ^ (pix_in_rsci_idat_mxwt[13])
      ^ (pix_in_rsci_idat_mxwt[29]) ^ xor_cse_208 ^ xor_cse_194 ^ xor_cse_256 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva
      ^ (pix_in_rsci_idat_mxwt[16]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva;
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva_mx1w1 = xor_cse_241 ^
      xor_cse_152 ^ xor_cse_206 ^ xor_cse_181 ^ xor_cse_170 ^ xor_cse_230 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva
      ^ (pix_in_rsci_idat_mxwt[26]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva
      ^ (pix_in_rsci_idat_mxwt[15]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva
      ^ (pix_in_rsci_idat_mxwt[0]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva_mx1w1 = xor_cse_188 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva
      ^ (pix_in_rsci_idat_mxwt[14]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_sva
      ^ (pix_in_rsci_idat_mxwt[17]) ^ xor_cse_206 ^ xor_cse_168 ^ xor_cse_196 ^ xor_cse_211;
  assign xor_cse_265 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_27_sva ^ (pix_in_rsci_idat_mxwt[24])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva ^ (pix_in_rsci_idat_mxwt[7]);
  assign xor_cse_264 = xor_cse_248 ^ xor_cse_208 ^ xor_cse_265;
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva_mx1w1 = xor_cse_264 ^
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva ^ (pix_in_rsci_idat_mxwt[16])
      ^ xor_cse_194 ^ xor_cse_155 ^ xor_cse_234 ^ xor_cse_239;
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva_mx1w1 = xor_cse_146 ^ xor_cse_191
      ^ xor_cse_208 ^ xor_cse_194 ^ xor_cse_183 ^ xor_cse_225 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva
      ^ (pix_in_rsci_idat_mxwt[12]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva
      ^ (pix_in_rsci_idat_mxwt[5]);
  assign xor_cse_269 = (pix_in_rsci_idat_mxwt[8]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_9_sva
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva ^ (pix_in_rsci_idat_mxwt[26]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva_mx1w1 = xor_cse_149 ^
      xor_cse_181 ^ xor_cse_248 ^ xor_cse_170 ^ xor_cse_225 ^ xor_cse_269 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva
      ^ (pix_in_rsci_idat_mxwt[6]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva
      ^ (pix_in_rsci_idat_mxwt[18]);
  assign xor_cse_271 = xor_cse_168 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva
      ^ (pix_in_rsci_idat_mxwt[25]);
  assign xor_cse_274 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva ^ (pix_in_rsci_idat_mxwt[10])
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_24_sva ^ (pix_in_rsci_idat_mxwt[21]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_sva_mx1w1 = xor_cse_271 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva
      ^ (pix_in_rsci_idat_mxwt[16]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva
      ^ (pix_in_rsci_idat_mxwt[0]) ^ xor_cse_206 ^ xor_cse_245 ^ xor_cse_274 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva
      ^ (pix_in_rsci_idat_mxwt[7]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva
      ^ (pix_in_rsci_idat_mxwt[12]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva_mx1w1 = xor_cse_191 ^
      xor_cse_248 ^ xor_cse_196 ^ xor_cse_265 ^ xor_cse_231 ^ EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva
      ^ (pix_in_rsci_idat_mxwt[9]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva
      ^ (pix_in_rsci_idat_mxwt[6]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_sva_mx1w1 = EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva
      ^ xor_cse_152 ^ xor_cse_168 ^ xor_cse_194 ^ xor_cse_155 ^ xor_cse_220 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva ^ (pix_in_rsci_idat_mxwt[10])
      ^ (pix_in_rsci_idat_mxwt[22]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva_mx1w1 = xor_cse_215 ^
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva ^ (pix_in_rsci_idat_mxwt[13])
      ^ xor_cse_183 ^ xor_cse_230 ^ xor_cse_237 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva
      ^ (pix_in_rsci_idat_mxwt[7]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva
      ^ (pix_in_rsci_idat_mxwt[5]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva_mx1w1 = xor_cse_191 ^ xor_cse_168
      ^ xor_cse_230 ^ xor_cse_265 ^ xor_cse_245 ^ xor_cse_256 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva
      ^ (pix_in_rsci_idat_mxwt[27]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva_mx1w1 = xor_cse_149 ^ xor_cse_191
      ^ xor_cse_152 ^ xor_cse_196 ^ xor_cse_256 ^ xor_cse_269 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva
      ^ (pix_in_rsci_idat_mxwt[7]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva_mx1w1 = xor_cse_149 ^ xor_cse_181
      ^ xor_cse_248 ^ xor_cse_183 ^ xor_cse_244 ^ xor_cse_177 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva
      ^ (pix_in_rsci_idat_mxwt[16]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_31_sva
      ^ (pix_in_rsci_idat_mxwt[31]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva_mx1w1 = xor_cse_206 ^ xor_cse_248
      ^ xor_cse_170 ^ xor_cse_155 ^ xor_cse_232 ^ xor_cse_274 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva
      ^ (pix_in_rsci_idat_mxwt[30]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva_mx1w1 = xor_cse_191 ^ xor_cse_189
      ^ xor_cse_196 ^ xor_cse_232 ^ xor_cse_198 ^ EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva
      ^ (pix_in_rsci_idat_mxwt[9]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva
      ^ (pix_in_rsci_idat_mxwt[10]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva
      ^ (pix_in_rsci_idat_mxwt[29]);
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva_mx1w1 = xor_cse_271 ^ xor_cse_146
      ^ xor_cse_152 ^ xor_cse_189 ^ xor_cse_230 ^ xor_cse_198 ^ xor_cse_211;
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_31_sva_mx1w1 = xor_cse_264 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva
      ^ (pix_in_rsci_idat_mxwt[27]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva
      ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva ^ (pix_in_rsci_idat_mxwt[20])
      ^ xor_cse_168 ^ xor_cse_177 ^ xor_cse_219;
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva_mx1w0 = xor_cse_152 ^ xor_cse_248
      ^ xor_cse_208 ^ xor_cse_225 ^ xor_cse_238 ^ xor_cse_161 ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva
      ^ (pix_in_rsci_idat_mxwt[25]) ^ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva
      ^ (pix_in_rsci_idat_mxwt[23]);
  assign and_373_itm = ((operator_11_true_acc_psp_sva_1[8]) | MCOL_unequal_itm) &
      (fsm_output[1]);
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      reg_pix_in_rsci_oswt_cse <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_27_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_24_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_21_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_9_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_27_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_24_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_21_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_9_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva <= 1'b0;
      MROW_stage_0 <= 1'b0;
      reg_crc32_dat_out_triosy_obj_iswt0_cse <= 1'b0;
      reg_dat_out_rsci_iswt0_cse <= 1'b0;
    end
    else if ( rst ) begin
      reg_pix_in_rsci_oswt_cse <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_27_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_24_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_21_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_9_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_27_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_24_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_21_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_9_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_31_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva <= 1'b0;
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva <= 1'b0;
      MROW_stage_0 <= 1'b0;
      reg_crc32_dat_out_triosy_obj_iswt0_cse <= 1'b0;
      reg_dat_out_rsci_iswt0_cse <= 1'b0;
    end
    else if ( run_wen ) begin
      reg_pix_in_rsci_oswt_cse <= ~((nand_5_cse & (fsm_output[1])) | (fsm_output[2]));
      EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva <= EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_mux1h_1_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_1_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_3_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_5_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_27_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_7_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_9_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_11_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_24_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_13_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_15_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_17_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_21_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_19_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_21_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_23_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_25_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_27_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_29_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_31_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_33_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_35_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_37_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_39_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_41_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_9_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_43_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_45_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_47_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_49_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_51_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_31_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_53_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_55_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_57_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_59_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva <= EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_61_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva <= EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_mux1h_1_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_1_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_3_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_5_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_27_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_7_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_9_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_11_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_24_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_13_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_15_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_17_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_21_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_19_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_21_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_23_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_25_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_27_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_29_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_31_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_33_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_35_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_37_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_39_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_41_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_9_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_43_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_45_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_47_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_49_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_51_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_31_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_53_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_55_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_57_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_59_nl
          | (~ (fsm_output[1]));
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva <= EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_61_nl
          | (~ (fsm_output[1]));
      MROW_stage_0 <= ~(nand_5_cse & (fsm_output[1]));
      reg_crc32_dat_out_triosy_obj_iswt0_cse <= (~ MROW_stage_0) & (fsm_output[1]);
      reg_dat_out_rsci_iswt0_cse <= MROW_stage_0 & (fsm_output[1]);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dat_out_rsci_idat_7_0 <= 8'b00000000;
      dat_out_rsci_idat_15_8 <= 8'b00000000;
      dat_out_rsci_idat_23_16 <= 8'b00000000;
      dat_out_rsci_idat_31_24 <= 8'b00000000;
    end
    else if ( rst ) begin
      dat_out_rsci_idat_7_0 <= 8'b00000000;
      dat_out_rsci_idat_15_8 <= 8'b00000000;
      dat_out_rsci_idat_23_16 <= 8'b00000000;
      dat_out_rsci_idat_31_24 <= 8'b00000000;
    end
    else if ( MCOL_and_cse ) begin
      dat_out_rsci_idat_7_0 <= MUX_v_8_2_2((pix_in_rsci_idat_mxwt[7:0]), magn_out_7_0_lpi_2_dfm_mx0w1,
          or_tmp_2);
      dat_out_rsci_idat_15_8 <= MUX_v_8_2_2((pix_in_rsci_idat_mxwt[15:8]), magn_out_15_8_lpi_2_dfm_mx0w1,
          or_tmp_2);
      dat_out_rsci_idat_23_16 <= MUX_v_8_2_2((pix_in_rsci_idat_mxwt[23:16]), magn_out_23_16_lpi_2_dfm_mx0w1,
          or_tmp_2);
      dat_out_rsci_idat_31_24 <= MUX_v_8_2_2((pix_in_rsci_idat_mxwt[31:24]), magn_out_31_24_lpi_2_dfm_mx0w1,
          or_tmp_2);
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      dat_out_rsci_idat_32 <= 1'b0;
      dat_out_rsci_idat_33 <= 1'b0;
    end
    else if ( rst ) begin
      dat_out_rsci_idat_32 <= 1'b0;
      dat_out_rsci_idat_33 <= 1'b0;
    end
    else if ( MCOL_and_4_cse ) begin
      dat_out_rsci_idat_32 <= ~((MROW_y_sva!=9'b000000000) | (MCOL_x_9_2_sva!=8'b00000000));
      dat_out_rsci_idat_33 <= nor_cse;
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      MROW_y_sva <= 9'b000000000;
    end
    else if ( rst ) begin
      MROW_y_sva <= 9'b000000000;
    end
    else if ( (~((~(nor_cse & MROW_stage_0)) & (fsm_output[1]))) & run_wen ) begin
      MROW_y_sva <= MUX_v_9_2_2(9'b000000000, z_out, (fsm_output[1]));
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      MCOL_x_9_2_sva <= 8'b00000000;
    end
    else if ( rst ) begin
      MCOL_x_9_2_sva <= 8'b00000000;
    end
    else if ( (MROW_stage_0 | (~ (fsm_output[1]))) & run_wen ) begin
      MCOL_x_9_2_sva <= (z_out[7:0]) & (signext_8_1(MCOL_if_1_MCOL_if_1_or_nl)) &
          (signext_8_1(fsm_output[1]));
    end
  end
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      not_95 <= 1'b0;
      not_94 <= 1'b0;
      not_93 <= 1'b0;
      not_92 <= 1'b0;
      not_91 <= 1'b0;
      not_90 <= 1'b0;
      not_89 <= 1'b0;
      not_88 <= 1'b0;
      not_87 <= 1'b0;
      not_86 <= 1'b0;
      not_85 <= 1'b0;
      not_84 <= 1'b0;
      not_83 <= 1'b0;
      not_82 <= 1'b0;
      not_81 <= 1'b0;
      not_80 <= 1'b0;
      not_79 <= 1'b0;
      not_78 <= 1'b0;
      not_77 <= 1'b0;
      not_76 <= 1'b0;
      not_75 <= 1'b0;
      not_74 <= 1'b0;
      not_73 <= 1'b0;
      not_72 <= 1'b0;
      not_71 <= 1'b0;
      not_70 <= 1'b0;
      not_69 <= 1'b0;
      not_68 <= 1'b0;
      not_67 <= 1'b0;
      not_66 <= 1'b0;
      not_65 <= 1'b0;
      not_64 <= 1'b0;
      not_127 <= 1'b0;
      not_126 <= 1'b0;
      not_125 <= 1'b0;
      not_124 <= 1'b0;
      not_123 <= 1'b0;
      not_122 <= 1'b0;
      not_121 <= 1'b0;
      not_120 <= 1'b0;
      not_119 <= 1'b0;
      not_118 <= 1'b0;
      not_117 <= 1'b0;
      not_116 <= 1'b0;
      not_115 <= 1'b0;
      not_114 <= 1'b0;
      not_113 <= 1'b0;
      not_112 <= 1'b0;
      not_111 <= 1'b0;
      not_110 <= 1'b0;
      not_109 <= 1'b0;
      not_108 <= 1'b0;
      not_107 <= 1'b0;
      not_106 <= 1'b0;
      not_105 <= 1'b0;
      not_104 <= 1'b0;
      not_103 <= 1'b0;
      not_102 <= 1'b0;
      not_101 <= 1'b0;
      not_100 <= 1'b0;
      not_99 <= 1'b0;
      not_98 <= 1'b0;
      not_97 <= 1'b0;
      not_96 <= 1'b0;
    end
    else if ( rst ) begin
      not_95 <= 1'b0;
      not_94 <= 1'b0;
      not_93 <= 1'b0;
      not_92 <= 1'b0;
      not_91 <= 1'b0;
      not_90 <= 1'b0;
      not_89 <= 1'b0;
      not_88 <= 1'b0;
      not_87 <= 1'b0;
      not_86 <= 1'b0;
      not_85 <= 1'b0;
      not_84 <= 1'b0;
      not_83 <= 1'b0;
      not_82 <= 1'b0;
      not_81 <= 1'b0;
      not_80 <= 1'b0;
      not_79 <= 1'b0;
      not_78 <= 1'b0;
      not_77 <= 1'b0;
      not_76 <= 1'b0;
      not_75 <= 1'b0;
      not_74 <= 1'b0;
      not_73 <= 1'b0;
      not_72 <= 1'b0;
      not_71 <= 1'b0;
      not_70 <= 1'b0;
      not_69 <= 1'b0;
      not_68 <= 1'b0;
      not_67 <= 1'b0;
      not_66 <= 1'b0;
      not_65 <= 1'b0;
      not_64 <= 1'b0;
      not_127 <= 1'b0;
      not_126 <= 1'b0;
      not_125 <= 1'b0;
      not_124 <= 1'b0;
      not_123 <= 1'b0;
      not_122 <= 1'b0;
      not_121 <= 1'b0;
      not_120 <= 1'b0;
      not_119 <= 1'b0;
      not_118 <= 1'b0;
      not_117 <= 1'b0;
      not_116 <= 1'b0;
      not_115 <= 1'b0;
      not_114 <= 1'b0;
      not_113 <= 1'b0;
      not_112 <= 1'b0;
      not_111 <= 1'b0;
      not_110 <= 1'b0;
      not_109 <= 1'b0;
      not_108 <= 1'b0;
      not_107 <= 1'b0;
      not_106 <= 1'b0;
      not_105 <= 1'b0;
      not_104 <= 1'b0;
      not_103 <= 1'b0;
      not_102 <= 1'b0;
      not_101 <= 1'b0;
      not_100 <= 1'b0;
      not_99 <= 1'b0;
      not_98 <= 1'b0;
      not_97 <= 1'b0;
      not_96 <= 1'b0;
    end
    else if ( and_307_cse ) begin
      not_95 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva;
      not_94 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva;
      not_93 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva;
      not_92 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva;
      not_91 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_31_sva;
      not_90 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva;
      not_89 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva;
      not_88 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva;
      not_87 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva;
      not_86 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_9_sva;
      not_85 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva;
      not_84 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_sva;
      not_83 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva;
      not_82 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_sva;
      not_81 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva;
      not_80 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva;
      not_79 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva;
      not_78 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva;
      not_77 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva;
      not_76 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_sva;
      not_75 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva;
      not_74 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_21_sva;
      not_73 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva;
      not_72 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva;
      not_71 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_24_sva;
      not_70 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva;
      not_69 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva;
      not_68 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_27_sva;
      not_67 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva;
      not_66 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva;
      not_65 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva;
      not_64 <= ~ EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva;
      not_127 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva;
      not_126 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva;
      not_125 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva;
      not_124 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva;
      not_123 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_31_sva;
      not_122 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva;
      not_121 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva;
      not_120 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva;
      not_119 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva;
      not_118 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_9_sva;
      not_117 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva;
      not_116 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_sva;
      not_115 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva;
      not_114 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_sva;
      not_113 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva;
      not_112 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva;
      not_111 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva;
      not_110 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva;
      not_109 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva;
      not_108 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_sva;
      not_107 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva;
      not_106 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_21_sva;
      not_105 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva;
      not_104 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva;
      not_103 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_24_sva;
      not_102 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva;
      not_101 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva;
      not_100 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_27_sva;
      not_99 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva;
      not_98 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva;
      not_97 <= ~ EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva;
      not_96 <= ~ EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva;
    end
  end
  assign EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_mux1h_1_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva_1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_9_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_1_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva_mx1w0,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_27_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_3_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva_mx1w0,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_5_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva_mx1w0,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_7_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_27_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_24_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_27_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_9_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_26_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_11_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_25_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_13_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_24_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_21_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_24_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_15_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_17_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_23_31_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_19_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_21_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_21_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_21_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_20_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_23_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_25_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_19_31_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_27_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_29_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_17_31_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_31_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_33_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_15_31_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_35_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_37_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_14_30_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_39_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_41_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_12_30_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_43_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_9_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_9_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_45_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_47_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_31_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_49_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_8_30_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_51_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_31_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_53_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_31_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_for_tmp_bit_sva_1, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_5_31_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_55_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva_mx1w0,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_30_sva_mx1w0, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_57_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_sva_mx1w0, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_30_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_59_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_sva_mx1w0, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_29_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_mux1h_61_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_29_31_sva_mx1w0, EdgeDetect_MagAng_calc_crc32_32_1_crc_tmp_4_28_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_mux1h_1_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva_1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_9_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_1_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva_mx1w0,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_27_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_3_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva_mx1w0,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_5_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva_mx1w0,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_7_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_27_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_24_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_27_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_9_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_26_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_11_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_25_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_13_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_24_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_21_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_24_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_15_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_17_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_23_31_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_19_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_21_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_21_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_21_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_20_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_23_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_25_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_19_31_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_27_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_29_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_17_31_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_31_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_33_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_15_31_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_35_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_37_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_14_30_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_39_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_41_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_12_30_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_43_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_9_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_9_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_45_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_47_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_31_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_49_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_8_30_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_51_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_31_sva_mx1w1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_53_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_31_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_for_tmp_bit_sva_1, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_5_31_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_55_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva_mx1w0,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_30_sva_mx1w0, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_57_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_sva_mx1w0, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_30_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_59_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_sva_mx1w0, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_29_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign EdgeDetect_MagAng_calc_crc32_32_crc_tmp_mux1h_61_nl = MUX1HOT_s_1_3_2(EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva_mx1w1,
      EdgeDetect_MagAng_calc_crc32_32_crc_tmp_29_31_sva_mx1w0, EdgeDetect_MagAng_calc_crc32_32_crc_tmp_4_28_sva,
      {and_dcpl_7 , and_dcpl_9 , (~ MROW_stage_0)});
  assign MCOL_if_1_MCOL_if_1_or_nl = MROW_equal_tmp | (~ nor_cse);
  assign MROW_MROW_and_1_nl = (MROW_y_sva[8]) & (~ and_373_itm);
  assign MROW_mux_2_nl = MUX_v_8_2_2((MROW_y_sva[7:0]), MCOL_x_9_2_sva, and_373_itm);
  assign nl_z_out = ({MROW_MROW_and_1_nl , MROW_mux_2_nl}) + 9'b000000001;
  assign z_out = nl_z_out[8:0];

  function automatic  MUX1HOT_s_1_3_2;
    input  input_2;
    input  input_1;
    input  input_0;
    input [2:0] sel;
    reg  result;
  begin
    result = input_0 & sel[0];
    result = result | (input_1 & sel[1]);
    result = result | (input_2 & sel[2]);
    MUX1HOT_s_1_3_2 = result;
  end
  endfunction


  function automatic [7:0] MUX_v_8_2_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input  sel;
    reg [7:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_8_2_2 = result;
  end
  endfunction


  function automatic [8:0] MUX_v_9_2_2;
    input [8:0] input_0;
    input [8:0] input_1;
    input  sel;
    reg [8:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_9_2_2 = result;
  end
  endfunction


  function automatic [7:0] signext_8_1;
    input  vector;
  begin
    signext_8_1= {{7{vector}}, vector};
  end
  endfunction


  function automatic [8:0] conv_u2s_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2s_8_9 =  {1'b0, vector};
  end
  endfunction


  function automatic [7:0] conv_u2u_1_8 ;
    input [0:0]  vector ;
  begin
    conv_u2u_1_8 = {{7{1'b0}}, vector};
  end
  endfunction


  function automatic [8:0] conv_u2u_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2u_8_9 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_VerDer
// ------------------------------------------------------------------


module EdgeDetect_VerDer (
  clk, rst, arst_n, dat_in_rsc_dat, dat_in_rsc_vld, dat_in_rsc_rdy, widthIn, heightIn,
      pix_out_rsc_dat, pix_out_rsc_vld, pix_out_rsc_rdy, dy_rsc_dat, dy_rsc_vld,
      dy_rsc_rdy, line_buf0_rsc_en, line_buf0_rsc_q, line_buf0_rsc_we, line_buf0_rsc_d,
      line_buf0_rsc_adr, line_buf1_rsc_en, line_buf1_rsc_q, line_buf1_rsc_we, line_buf1_rsc_d,
      line_buf1_rsc_adr
);
  input clk;
  input rst;
  input arst_n;
  input [33:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  input [9:0] widthIn;
  input [8:0] heightIn;
  output [31:0] pix_out_rsc_dat;
  output pix_out_rsc_vld;
  input pix_out_rsc_rdy;
  output [35:0] dy_rsc_dat;
  output dy_rsc_vld;
  input dy_rsc_rdy;
  output line_buf0_rsc_en;
  input [63:0] line_buf0_rsc_q;
  output line_buf0_rsc_we;
  output [63:0] line_buf0_rsc_d;
  output [6:0] line_buf0_rsc_adr;
  output line_buf1_rsc_en;
  input [63:0] line_buf1_rsc_q;
  output line_buf1_rsc_we;
  output [63:0] line_buf1_rsc_d;
  output [6:0] line_buf1_rsc_adr;


  // Interconnect Declarations
  wire [63:0] line_buf0_rsci_d_d;
  wire line_buf0_rsci_en_d;
  wire [63:0] line_buf0_rsci_q_d;
  wire [63:0] line_buf1_rsci_d_d;
  wire [63:0] line_buf1_rsci_q_d;
  wire [6:0] line_buf0_rsci_adr_d_iff;
  wire line_buf0_rsci_we_d_iff;
  wire line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_iff;


  // Interconnect Declarations for Component Instantiations 
  EdgeDetect_VerDer_ccs_sample_mem_ccs_ram_sync_singleport_rwport_en_6_64_7_80_80_64_5_gen
      line_buf0_rsci (
      .en(line_buf0_rsc_en),
      .q(line_buf0_rsc_q),
      .we(line_buf0_rsc_we),
      .d(line_buf0_rsc_d),
      .adr(line_buf0_rsc_adr),
      .adr_d(line_buf0_rsci_adr_d_iff),
      .d_d(line_buf0_rsci_d_d),
      .en_d(line_buf0_rsci_en_d),
      .we_d(line_buf0_rsci_we_d_iff),
      .q_d(line_buf0_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_iff),
      .port_0_rw_ram_ir_internal_WMASK_B_d(line_buf0_rsci_we_d_iff)
    );
  EdgeDetect_VerDer_ccs_sample_mem_ccs_ram_sync_singleport_rwport_en_7_64_7_80_80_64_5_gen
      line_buf1_rsci (
      .en(line_buf1_rsc_en),
      .q(line_buf1_rsc_q),
      .we(line_buf1_rsc_we),
      .d(line_buf1_rsc_d),
      .adr(line_buf1_rsc_adr),
      .adr_d(line_buf0_rsci_adr_d_iff),
      .d_d(line_buf1_rsci_d_d),
      .en_d(line_buf0_rsci_en_d),
      .we_d(line_buf0_rsci_we_d_iff),
      .q_d(line_buf1_rsci_q_d),
      .port_0_rw_ram_ir_internal_RMASK_B_d(line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_iff),
      .port_0_rw_ram_ir_internal_WMASK_B_d(line_buf0_rsci_we_d_iff)
    );
  EdgeDetect_VerDer_run EdgeDetect_VerDer_run_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_in_rsc_dat(dat_in_rsc_dat),
      .dat_in_rsc_vld(dat_in_rsc_vld),
      .dat_in_rsc_rdy(dat_in_rsc_rdy),
      .widthIn(widthIn),
      .heightIn(heightIn),
      .pix_out_rsc_dat(pix_out_rsc_dat),
      .pix_out_rsc_vld(pix_out_rsc_vld),
      .pix_out_rsc_rdy(pix_out_rsc_rdy),
      .dy_rsc_dat(dy_rsc_dat),
      .dy_rsc_vld(dy_rsc_vld),
      .dy_rsc_rdy(dy_rsc_rdy),
      .line_buf0_rsci_d_d(line_buf0_rsci_d_d),
      .line_buf0_rsci_en_d(line_buf0_rsci_en_d),
      .line_buf0_rsci_q_d(line_buf0_rsci_q_d),
      .line_buf1_rsci_d_d(line_buf1_rsci_d_d),
      .line_buf1_rsci_q_d(line_buf1_rsci_q_d),
      .line_buf0_rsci_adr_d_pff(line_buf0_rsci_adr_d_iff),
      .line_buf0_rsci_we_d_pff(line_buf0_rsci_we_d_iff),
      .line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_pff(line_buf0_rsci_port_0_rw_ram_ir_internal_RMASK_B_d_iff)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_HorDer
// ------------------------------------------------------------------


module EdgeDetect_HorDer (
  clk, rst, arst_n, pix_in_rsc_dat, pix_in_rsc_vld, pix_in_rsc_rdy, widthIn, heightIn,
      pix_out_rsc_dat, pix_out_rsc_vld, pix_out_rsc_rdy, dx_rsc_dat, dx_rsc_vld,
      dx_rsc_rdy
);
  input clk;
  input rst;
  input arst_n;
  input [31:0] pix_in_rsc_dat;
  input pix_in_rsc_vld;
  output pix_in_rsc_rdy;
  input [9:0] widthIn;
  input [8:0] heightIn;
  output [31:0] pix_out_rsc_dat;
  output pix_out_rsc_vld;
  input pix_out_rsc_rdy;
  output [35:0] dx_rsc_dat;
  output dx_rsc_vld;
  input dx_rsc_rdy;



  // Interconnect Declarations for Component Instantiations 
  EdgeDetect_HorDer_run EdgeDetect_HorDer_run_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .pix_in_rsc_dat(pix_in_rsc_dat),
      .pix_in_rsc_vld(pix_in_rsc_vld),
      .pix_in_rsc_rdy(pix_in_rsc_rdy),
      .widthIn(widthIn),
      .heightIn(heightIn),
      .pix_out_rsc_dat(pix_out_rsc_dat),
      .pix_out_rsc_vld(pix_out_rsc_vld),
      .pix_out_rsc_rdy(pix_out_rsc_rdy),
      .dx_rsc_dat(dx_rsc_dat),
      .dx_rsc_vld(dx_rsc_vld),
      .dx_rsc_rdy(dx_rsc_rdy)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_MagAng
// ------------------------------------------------------------------


module EdgeDetect_MagAng (
  clk, rst, arst_n, dx_in_rsc_dat, dx_in_rsc_vld, dx_in_rsc_rdy, dy_in_rsc_dat, dy_in_rsc_vld,
      dy_in_rsc_rdy, pix_in_rsc_dat, pix_in_rsc_vld, pix_in_rsc_rdy, widthIn, heightIn,
      sw_in, crc32_pix_in_rsc_dat, crc32_pix_in_triosy_lz, crc32_dat_out_rsc_dat,
      crc32_dat_out_triosy_lz, dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy
);
  input clk;
  input rst;
  input arst_n;
  input [35:0] dx_in_rsc_dat;
  input dx_in_rsc_vld;
  output dx_in_rsc_rdy;
  input [35:0] dy_in_rsc_dat;
  input dy_in_rsc_vld;
  output dy_in_rsc_rdy;
  input [31:0] pix_in_rsc_dat;
  input pix_in_rsc_vld;
  output pix_in_rsc_rdy;
  input [9:0] widthIn;
  input [8:0] heightIn;
  input sw_in;
  output [31:0] crc32_pix_in_rsc_dat;
  output crc32_pix_in_triosy_lz;
  output [31:0] crc32_dat_out_rsc_dat;
  output crc32_dat_out_triosy_lz;
  output [33:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;


  // Interconnect Declarations
  wire [31:0] crc32_pix_in_rsci_idat;
  wire [31:0] crc32_dat_out_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_v1 #(.rscid(32'sd20),
  .width(32'sd32)) crc32_pix_in_rsci (
      .idat(crc32_pix_in_rsci_idat),
      .dat(crc32_pix_in_rsc_dat)
    );
  ccs_out_v1 #(.rscid(32'sd21),
  .width(32'sd32)) crc32_dat_out_rsci (
      .idat(crc32_dat_out_rsci_idat),
      .dat(crc32_dat_out_rsc_dat)
    );
  EdgeDetect_MagAng_run EdgeDetect_MagAng_run_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dx_in_rsc_dat(dx_in_rsc_dat),
      .dx_in_rsc_vld(dx_in_rsc_vld),
      .dx_in_rsc_rdy(dx_in_rsc_rdy),
      .dy_in_rsc_dat(dy_in_rsc_dat),
      .dy_in_rsc_vld(dy_in_rsc_vld),
      .dy_in_rsc_rdy(dy_in_rsc_rdy),
      .pix_in_rsc_dat(pix_in_rsc_dat),
      .pix_in_rsc_vld(pix_in_rsc_vld),
      .pix_in_rsc_rdy(pix_in_rsc_rdy),
      .widthIn(widthIn),
      .heightIn(heightIn),
      .sw_in(sw_in),
      .crc32_pix_in_triosy_lz(crc32_pix_in_triosy_lz),
      .crc32_dat_out_triosy_lz(crc32_dat_out_triosy_lz),
      .dat_out_rsc_dat(dat_out_rsc_dat),
      .dat_out_rsc_vld(dat_out_rsc_vld),
      .dat_out_rsc_rdy(dat_out_rsc_rdy),
      .crc32_pix_in_rsci_idat(crc32_pix_in_rsci_idat),
      .crc32_dat_out_rsci_idat(crc32_dat_out_rsci_idat)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_Top_struct
// ------------------------------------------------------------------


module EdgeDetect_Top_struct (
  clk, rst, arst_n, widthIn, heightIn, sw_in, crc32_pix_in_rsc_dat, crc32_pix_in_triosy_lz,
      crc32_dat_out_rsc_dat, crc32_dat_out_triosy_lz, dat_in_rsc_dat_eol, dat_in_rsc_dat_sof,
      dat_in_rsc_dat_pix, dat_in_rsc_vld, dat_in_rsc_rdy, dat_out_rsc_dat_eol, dat_out_rsc_dat_sof,
      dat_out_rsc_dat_pix, dat_out_rsc_vld, dat_out_rsc_rdy, line_buf0_rsc_en, line_buf0_rsc_q,
      line_buf0_rsc_we, line_buf0_rsc_d, line_buf0_rsc_adr, line_buf1_rsc_en, line_buf1_rsc_q,
      line_buf1_rsc_we, line_buf1_rsc_d, line_buf1_rsc_adr
);
  input clk;
  input rst;
  input arst_n;
  input [9:0] widthIn;
  input [8:0] heightIn;
  input sw_in;
  output [31:0] crc32_pix_in_rsc_dat;
  output crc32_pix_in_triosy_lz;
  output [31:0] crc32_dat_out_rsc_dat;
  output crc32_dat_out_triosy_lz;
  input dat_in_rsc_dat_eol;
  input dat_in_rsc_dat_sof;
  input [31:0] dat_in_rsc_dat_pix;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  output dat_out_rsc_dat_eol;
  output dat_out_rsc_dat_sof;
  output [31:0] dat_out_rsc_dat_pix;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  output line_buf0_rsc_en;
  input [63:0] line_buf0_rsc_q;
  output line_buf0_rsc_we;
  output [63:0] line_buf0_rsc_d;
  output [6:0] line_buf0_rsc_adr;
  output line_buf1_rsc_en;
  input [63:0] line_buf1_rsc_q;
  output line_buf1_rsc_we;
  output [63:0] line_buf1_rsc_d;
  output [6:0] line_buf1_rsc_adr;


  // Interconnect Declarations
  wire [31:0] pix_out_rsc_dat_n_VerDer_inst;
  wire [35:0] dy_rsc_dat_n_VerDer_inst;
  wire dy_rsc_rdy_n_VerDer_inst;
  wire line_buf0_rsc_en_n_VerDer_inst;
  wire [63:0] line_buf0_rsc_d_n_VerDer_inst;
  wire [6:0] line_buf0_rsc_adr_n_VerDer_inst;
  wire line_buf1_rsc_en_n_VerDer_inst;
  wire [63:0] line_buf1_rsc_d_n_VerDer_inst;
  wire [6:0] line_buf1_rsc_adr_n_VerDer_inst;
  wire [31:0] pix_out_rsc_dat_n_HorDer_inst;
  wire [35:0] dx_rsc_dat_n_HorDer_inst;
  wire [35:0] dy_in_rsc_dat_n_MagAng_inst;
  wire dy_in_rsc_vld_n_MagAng_inst;
  wire [31:0] crc32_pix_in_rsc_dat_n_MagAng_inst;
  wire [31:0] crc32_dat_out_rsc_dat_n_MagAng_inst;
  wire [33:0] dat_out_rsc_dat_n_MagAng_inst;
  wire dat_in_rsc_rdy_n_VerDer_inst_bud;
  wire pix_out_rsc_vld_n_VerDer_inst_bud;
  wire pix_in_rsc_rdy_n_HorDer_inst_bud;
  wire dy_rsc_vld_n_VerDer_inst_bud;
  wire dy_in_rsc_rdy_n_MagAng_inst_bud;
  wire line_buf0_rsc_we_n_VerDer_inst_bud;
  wire line_buf1_rsc_we_n_VerDer_inst_bud;
  wire pix_out_rsc_vld_n_HorDer_inst_bud;
  wire pix_in_rsc_rdy_n_MagAng_inst_bud;
  wire dx_rsc_vld_n_HorDer_inst_bud;
  wire dx_in_rsc_rdy_n_MagAng_inst_bud;
  wire crc32_pix_in_triosy_lz_n_MagAng_inst_bud;
  wire crc32_dat_out_triosy_lz_n_MagAng_inst_bud;
  wire dat_out_rsc_vld_n_MagAng_inst_bud;
  wire dy_chan_unc_1;
  wire dy_chan_idle;


  // Interconnect Declarations for Component Instantiations 
  wire [33:0] nl_VerDer_inst_dat_in_rsc_dat;
  assign nl_VerDer_inst_dat_in_rsc_dat = {dat_in_rsc_dat_eol , dat_in_rsc_dat_sof
      , dat_in_rsc_dat_pix};
  ccs_pipe_v6 #(.rscid(32'sd35),
  .width(32'sd36),
  .sz_width(32'sd1),
  .fifo_sz(32'sd2),
  .log2_sz(32'sd1),
  .ph_clk(32'sd1),
  .ph_en(32'sd0),
  .ph_arst(32'sd0),
  .ph_srst(32'sd1)) dy_chan_cns_pipe (
      .clk(clk),
      .en(1'b0),
      .arst(arst_n),
      .srst(rst),
      .din_rdy(dy_rsc_rdy_n_VerDer_inst),
      .din_vld(dy_rsc_vld_n_VerDer_inst_bud),
      .din(dy_rsc_dat_n_VerDer_inst),
      .dout_rdy(dy_in_rsc_rdy_n_MagAng_inst_bud),
      .dout_vld(dy_in_rsc_vld_n_MagAng_inst),
      .dout(dy_in_rsc_dat_n_MagAng_inst),
      .sz(dy_chan_unc_1),
      .sz_req(1'b0),
      .is_idle(dy_chan_idle)
    );
  EdgeDetect_VerDer VerDer_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dat_in_rsc_dat(nl_VerDer_inst_dat_in_rsc_dat[33:0]),
      .dat_in_rsc_vld(dat_in_rsc_vld),
      .dat_in_rsc_rdy(dat_in_rsc_rdy_n_VerDer_inst_bud),
      .widthIn(widthIn),
      .heightIn(heightIn),
      .pix_out_rsc_dat(pix_out_rsc_dat_n_VerDer_inst),
      .pix_out_rsc_vld(pix_out_rsc_vld_n_VerDer_inst_bud),
      .pix_out_rsc_rdy(pix_in_rsc_rdy_n_HorDer_inst_bud),
      .dy_rsc_dat(dy_rsc_dat_n_VerDer_inst),
      .dy_rsc_vld(dy_rsc_vld_n_VerDer_inst_bud),
      .dy_rsc_rdy(dy_rsc_rdy_n_VerDer_inst),
      .line_buf0_rsc_en(line_buf0_rsc_en_n_VerDer_inst),
      .line_buf0_rsc_q(line_buf0_rsc_q),
      .line_buf0_rsc_we(line_buf0_rsc_we_n_VerDer_inst_bud),
      .line_buf0_rsc_d(line_buf0_rsc_d_n_VerDer_inst),
      .line_buf0_rsc_adr(line_buf0_rsc_adr_n_VerDer_inst),
      .line_buf1_rsc_en(line_buf1_rsc_en_n_VerDer_inst),
      .line_buf1_rsc_q(line_buf1_rsc_q),
      .line_buf1_rsc_we(line_buf1_rsc_we_n_VerDer_inst_bud),
      .line_buf1_rsc_d(line_buf1_rsc_d_n_VerDer_inst),
      .line_buf1_rsc_adr(line_buf1_rsc_adr_n_VerDer_inst)
    );
  EdgeDetect_HorDer HorDer_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .pix_in_rsc_dat(pix_out_rsc_dat_n_VerDer_inst),
      .pix_in_rsc_vld(pix_out_rsc_vld_n_VerDer_inst_bud),
      .pix_in_rsc_rdy(pix_in_rsc_rdy_n_HorDer_inst_bud),
      .widthIn(widthIn),
      .heightIn(heightIn),
      .pix_out_rsc_dat(pix_out_rsc_dat_n_HorDer_inst),
      .pix_out_rsc_vld(pix_out_rsc_vld_n_HorDer_inst_bud),
      .pix_out_rsc_rdy(pix_in_rsc_rdy_n_MagAng_inst_bud),
      .dx_rsc_dat(dx_rsc_dat_n_HorDer_inst),
      .dx_rsc_vld(dx_rsc_vld_n_HorDer_inst_bud),
      .dx_rsc_rdy(dx_in_rsc_rdy_n_MagAng_inst_bud)
    );
  EdgeDetect_MagAng MagAng_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .dx_in_rsc_dat(dx_rsc_dat_n_HorDer_inst),
      .dx_in_rsc_vld(dx_rsc_vld_n_HorDer_inst_bud),
      .dx_in_rsc_rdy(dx_in_rsc_rdy_n_MagAng_inst_bud),
      .dy_in_rsc_dat(dy_in_rsc_dat_n_MagAng_inst),
      .dy_in_rsc_vld(dy_in_rsc_vld_n_MagAng_inst),
      .dy_in_rsc_rdy(dy_in_rsc_rdy_n_MagAng_inst_bud),
      .pix_in_rsc_dat(pix_out_rsc_dat_n_HorDer_inst),
      .pix_in_rsc_vld(pix_out_rsc_vld_n_HorDer_inst_bud),
      .pix_in_rsc_rdy(pix_in_rsc_rdy_n_MagAng_inst_bud),
      .widthIn(widthIn),
      .heightIn(heightIn),
      .sw_in(sw_in),
      .crc32_pix_in_rsc_dat(crc32_pix_in_rsc_dat_n_MagAng_inst),
      .crc32_pix_in_triosy_lz(crc32_pix_in_triosy_lz_n_MagAng_inst_bud),
      .crc32_dat_out_rsc_dat(crc32_dat_out_rsc_dat_n_MagAng_inst),
      .crc32_dat_out_triosy_lz(crc32_dat_out_triosy_lz_n_MagAng_inst_bud),
      .dat_out_rsc_dat(dat_out_rsc_dat_n_MagAng_inst),
      .dat_out_rsc_vld(dat_out_rsc_vld_n_MagAng_inst_bud),
      .dat_out_rsc_rdy(dat_out_rsc_rdy)
    );
  assign dat_out_rsc_dat_pix = dat_out_rsc_dat_n_MagAng_inst[31:0];
  assign dat_out_rsc_dat_sof = dat_out_rsc_dat_n_MagAng_inst[32];
  assign dat_out_rsc_dat_eol = dat_out_rsc_dat_n_MagAng_inst[33];
  assign dat_in_rsc_rdy = dat_in_rsc_rdy_n_VerDer_inst_bud;
  assign line_buf0_rsc_en = line_buf0_rsc_en_n_VerDer_inst;
  assign line_buf0_rsc_we = line_buf0_rsc_we_n_VerDer_inst_bud;
  assign line_buf0_rsc_d = line_buf0_rsc_d_n_VerDer_inst;
  assign line_buf0_rsc_adr = line_buf0_rsc_adr_n_VerDer_inst;
  assign line_buf1_rsc_en = line_buf1_rsc_en_n_VerDer_inst;
  assign line_buf1_rsc_we = line_buf1_rsc_we_n_VerDer_inst_bud;
  assign line_buf1_rsc_d = line_buf1_rsc_d_n_VerDer_inst;
  assign line_buf1_rsc_adr = line_buf1_rsc_adr_n_VerDer_inst;
  assign crc32_pix_in_rsc_dat = crc32_pix_in_rsc_dat_n_MagAng_inst;
  assign crc32_pix_in_triosy_lz = crc32_pix_in_triosy_lz_n_MagAng_inst_bud;
  assign crc32_dat_out_rsc_dat = crc32_dat_out_rsc_dat_n_MagAng_inst;
  assign crc32_dat_out_triosy_lz = crc32_dat_out_triosy_lz_n_MagAng_inst_bud;
  assign dat_out_rsc_vld = dat_out_rsc_vld_n_MagAng_inst_bud;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    EdgeDetect_Top
// ------------------------------------------------------------------


module EdgeDetect_Top (
  clk, rst, arst_n, widthIn, heightIn, sw_in, crc32_pix_in_rsc_dat, crc32_pix_in_triosy_lz,
      crc32_dat_out_rsc_dat, crc32_dat_out_triosy_lz, dat_in_rsc_dat, dat_in_rsc_vld,
      dat_in_rsc_rdy, dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy, line_buf0_rsc_en,
      line_buf0_rsc_q, line_buf0_rsc_we, line_buf0_rsc_d, line_buf0_rsc_adr, line_buf1_rsc_en,
      line_buf1_rsc_q, line_buf1_rsc_we, line_buf1_rsc_d, line_buf1_rsc_adr
);
  input clk;
  input rst;
  input arst_n;
  input [9:0] widthIn;
  input [8:0] heightIn;
  input sw_in;
  output [31:0] crc32_pix_in_rsc_dat;
  output crc32_pix_in_triosy_lz;
  output [31:0] crc32_dat_out_rsc_dat;
  output crc32_dat_out_triosy_lz;
  input [33:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;
  output [33:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;
  output line_buf0_rsc_en;
  input [63:0] line_buf0_rsc_q;
  output line_buf0_rsc_we;
  output [63:0] line_buf0_rsc_d;
  output [6:0] line_buf0_rsc_adr;
  output line_buf1_rsc_en;
  input [63:0] line_buf1_rsc_q;
  output line_buf1_rsc_we;
  output [63:0] line_buf1_rsc_d;
  output [6:0] line_buf1_rsc_adr;


  // Interconnect Declarations
  wire dat_out_rsc_dat_eol;
  wire dat_out_rsc_dat_sof;
  wire [31:0] dat_out_rsc_dat_pix;


  // Interconnect Declarations for Component Instantiations 
  wire  nl_EdgeDetect_Top_struct_inst_dat_in_rsc_dat_eol;
  assign nl_EdgeDetect_Top_struct_inst_dat_in_rsc_dat_eol = dat_in_rsc_dat[33];
  wire  nl_EdgeDetect_Top_struct_inst_dat_in_rsc_dat_sof;
  assign nl_EdgeDetect_Top_struct_inst_dat_in_rsc_dat_sof = dat_in_rsc_dat[32];
  wire [31:0] nl_EdgeDetect_Top_struct_inst_dat_in_rsc_dat_pix;
  assign nl_EdgeDetect_Top_struct_inst_dat_in_rsc_dat_pix = dat_in_rsc_dat[31:0];
  EdgeDetect_Top_struct EdgeDetect_Top_struct_inst (
      .clk(clk),
      .rst(rst),
      .arst_n(arst_n),
      .widthIn(widthIn),
      .heightIn(heightIn),
      .sw_in(sw_in),
      .crc32_pix_in_rsc_dat(crc32_pix_in_rsc_dat),
      .crc32_pix_in_triosy_lz(crc32_pix_in_triosy_lz),
      .crc32_dat_out_rsc_dat(crc32_dat_out_rsc_dat),
      .crc32_dat_out_triosy_lz(crc32_dat_out_triosy_lz),
      .dat_in_rsc_dat_eol(nl_EdgeDetect_Top_struct_inst_dat_in_rsc_dat_eol),
      .dat_in_rsc_dat_sof(nl_EdgeDetect_Top_struct_inst_dat_in_rsc_dat_sof),
      .dat_in_rsc_dat_pix(nl_EdgeDetect_Top_struct_inst_dat_in_rsc_dat_pix[31:0]),
      .dat_in_rsc_vld(dat_in_rsc_vld),
      .dat_in_rsc_rdy(dat_in_rsc_rdy),
      .dat_out_rsc_dat_eol(dat_out_rsc_dat_eol),
      .dat_out_rsc_dat_sof(dat_out_rsc_dat_sof),
      .dat_out_rsc_dat_pix(dat_out_rsc_dat_pix),
      .dat_out_rsc_vld(dat_out_rsc_vld),
      .dat_out_rsc_rdy(dat_out_rsc_rdy),
      .line_buf0_rsc_en(line_buf0_rsc_en),
      .line_buf0_rsc_q(line_buf0_rsc_q),
      .line_buf0_rsc_we(line_buf0_rsc_we),
      .line_buf0_rsc_d(line_buf0_rsc_d),
      .line_buf0_rsc_adr(line_buf0_rsc_adr),
      .line_buf1_rsc_en(line_buf1_rsc_en),
      .line_buf1_rsc_q(line_buf1_rsc_q),
      .line_buf1_rsc_we(line_buf1_rsc_we),
      .line_buf1_rsc_d(line_buf1_rsc_d),
      .line_buf1_rsc_adr(line_buf1_rsc_adr)
    );
  assign dat_out_rsc_dat = {dat_out_rsc_dat_eol , dat_out_rsc_dat_sof , dat_out_rsc_dat_pix};
endmodule


/*
module USER_PRJ0 #( parameter pUSER_PROJECT_SIDEBAND_WIDTH   = 5,
					parameter pADDR_WIDTH   = 12,
                   parameter pDATA_WIDTH   = 32
                 )
(
  output wire                        awready,
  output wire                        arready,
  output wire                        wready,
  output wire                        rvalid,
  output wire  [(pDATA_WIDTH-1) : 0] rdata,
  input  wire                        awvalid,
  input  wire                [11: 0] awaddr,
  input  wire                        arvalid,
  input  wire                [11: 0] araddr,
  input  wire                        wvalid,
  input  wire                 [3: 0] wstrb,
  input  wire  [(pDATA_WIDTH-1) : 0] wdata,
  input  wire                        rready,
  input  wire                        ss_tvalid,
  input  wire  [(pDATA_WIDTH-1) : 0] ss_tdata,
  input  wire                 [1: 0] ss_tuser,
  `ifdef USER_PROJECT_SIDEBAND_SUPPORT
	input  wire                 [pUSER_PROJECT_SIDEBAND_WIDTH-1: 0] ss_tupsb,
  `endif
  input  wire                 [3: 0] ss_tstrb,
  input  wire                 [3: 0] ss_tkeep,
  input  wire                        ss_tlast,
  input  wire                        sm_tready,
  output wire                        ss_tready,
  output wire                        sm_tvalid,
  output wire  [(pDATA_WIDTH-1) : 0] sm_tdata,
  output wire                 [2: 0] sm_tid,
  `ifdef USER_PROJECT_SIDEBAND_SUPPORT
	output  wire                 [pUSER_PROJECT_SIDEBAND_WIDTH-1: 0] sm_tupsb,
  `endif
  output wire                 [3: 0] sm_tstrb,
  output wire                 [3: 0] sm_tkeep,
  output wire                        sm_tlast,
  output wire                        low__pri_irq,
  output wire                        High_pri_req,
  output wire                [23: 0] la_data_o,
  input  wire                        axi_clk,
  input  wire                        axis_clk,
  input  wire                        axi_reset_n,
  input  wire                        axis_rst_n,
  input  wire                        user_clock2,
  input  wire                        uck2_rst_n
);


EdgeDetect_Top DUT(
  clk, rst, arst_n, widthIn, heightIn, sw_in, crc32_pix_in_rsc_dat, crc32_pix_in_triosy_lz,
      crc32_dat_out_rsc_dat, crc32_dat_out_triosy_lz, dat_in_rsc_dat, dat_in_rsc_vld,
      dat_in_rsc_rdy, dat_out_rsc_dat, dat_out_rsc_vld, dat_out_rsc_rdy, line_buf0_rsc_en,
      line_buf0_rsc_q, line_buf0_rsc_we, line_buf0_rsc_d, line_buf0_rsc_adr, line_buf1_rsc_en,
      line_buf1_rsc_q, line_buf1_rsc_we, line_buf1_rsc_d, line_buf1_rsc_adr
);
  input clk;
  input rst;
  input arst_n;


  input [9:0] widthIn;
  input [8:0] heightIn;
  input sw_in;
  output [31:0] crc32_pix_in_rsc_dat;
  output crc32_pix_in_triosy_lz;
  output [31:0] crc32_dat_out_rsc_dat;
  output crc32_dat_out_triosy_lz;
  input [33:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;

  output [33:0] dat_out_rsc_dat;
  output dat_out_rsc_vld;
  input dat_out_rsc_rdy;

  output line_buf0_rsc_en;
  input [63:0] line_buf0_rsc_q;
  output line_buf0_rsc_we;
  output [63:0] line_buf0_rsc_d;
  output [6:0] line_buf0_rsc_adr;

  output line_buf1_rsc_en;
  input [63:0] line_buf1_rsc_q;
  output line_buf1_rsc_we;
  output [63:0] line_buf1_rsc_d;
  output [6:0] line_buf1_rsc_adr;

  
// Axilite Interface Generate
// define register map for widthIn, heightIn, sw_in, cfg_rst
input [9:0] widthIn;        
  input [8:0] heightIn;
  input sw_in;
  input cfg_rst;    // new added for CPU to reset the IP only for Edge_Detect IP, others use axi_reset_n
                    // cfg_rst is reset to 1, after widthIN, heightIn, sw_in programmed, cfg_rst set to 0
                    // cfg_rst need to sync with axis_clk to provide synchronous reset
                    // after cfg_rst=0, stream-in data starts

// Axilite status read
  output [31:0] crc32_pix_in_rsc_dat;   // axilite read
  output [31:0] crc32_dat_out_rsc_dat;  // axilite read

// axis-slave  tor receive data
input [33:0] dat_in_rsc_dat;
  input dat_in_rsc_vld;
  output dat_in_rsc_rdy;

// axis-master to send data
output [33:0] dat_out_rsc_dat;
output dat_out_rsc_vld;
  input dat_out_rsc_rdy;

*/

// 2x external line buffer
// data-width : 64bit
// depth : 128   - widthIn/8  ~640x480  640/8 -> 80
//  pixel data: 8-bit gray level - 
//  kernel : 3x3 


