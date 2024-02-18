`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author : Tony Ho
//
// Create Date: 06/18/2023 10:44:18 PM
// Design Name:
// Module Name: IO_SERDES
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
// 20230720
// 1. change pADDR_WIDTH=15 and use [pADDR_WIDTH-1:0] for *_axi_awaddr and *_axi_araddr
// 20230714
// 1. change [pADDR_WIDTH-1:0] axi_awaddr to [pADDR_WIDTH+1:2] axi_awaddr for DW base address
// 2. add pSERIALIO_WIDTH and pSERIALIO_TDATA_WIDTH
// 3. add is_as_dummy for remove WARNING message
// 4. update typo in pSERIALIO_TDATA_WIDTH
// 5. update tpyo, change cc_ls_enable to cc_is_enable
// 20230712
// 1. axi_awaddr is DW address, pADDR_WIDTH change from 12 to 10
// 2. define USE_FOR_LOOP_Serial_Data_Out_tdata and update coding error in for loop

`define USE_FOR_LOOP_Serial_Data_Out_tdata 1

(* DONT_TOUCH = "yes" *) module IO_SERDES #(
    parameter pUSER_PROJECT_SIDEBAND_WIDTH   = 5,
    parameter pSERIALIO_WIDTH   = 13,
    parameter pADDR_WIDTH   = 15,
    parameter pDATA_WIDTH   = 32,
    parameter pRxFIFO_DEPTH = 5,
    parameter pCLK_RATIO =4      //[TODO]: use pCLK_RATIO for register define
  ) (


    input wire   ioclk,

    input wire   axi_reset_n,
    input wire   axi_clk,

    input wire   axis_rst_n,
    input wire   axis_clk,

    //write addr channel
    input wire   axi_awvalid,
    input wire   [pADDR_WIDTH-1:0] axi_awaddr,    //axi_awaddr is DW address
    output wire  axi_awready,

    //write data channel
    input wire   axi_wvalid,
    input wire   [pDATA_WIDTH-1:0] axi_wdata,
    input wire   [(pDATA_WIDTH/8)-1:0] axi_wstrb,
    output wire  axi_wready,

    //read addr channel
    input wire   axi_arvalid,
    input wire   [pADDR_WIDTH-1:0] axi_araddr,
    output wire   axi_arready,

    //read data channel
    output wire   axi_rvalid,
    output wire   [pDATA_WIDTH-1:0] axi_rdata,
    input wire   axi_rready,

    input wire   cc_is_enable,    //axi_lite enable



    //TX path
    input wire   [pDATA_WIDTH-1:0] as_is_tdata,
    `ifdef USER_PROJECT_SIDEBAND_SUPPORT
      input wire   [pUSER_PROJECT_SIDEBAND_WIDTH-1:0] as_is_tupsb,
    `endif
    input wire   [(pDATA_WIDTH/8)-1:0] as_is_tstrb,
    input wire   [(pDATA_WIDTH/8)-1:0] as_is_tkeep,
    input wire   as_is_tlast,
    input wire   [1:0] as_is_tid,
    input wire   as_is_tvalid,
    input wire   [1:0] as_is_tuser,
    input wire   as_is_tready,    //when local side axis switch Rxfifo size <= threshold then as_is_tready=0, this flow control mechanism is for notify remote side do not provide data with is_as_tvalid=1

    output wire      serial_tclk,
    output wire  [pSERIALIO_WIDTH-1: 0] serial_txd,

    //Rx path
    input  wire      serial_rclk,
    input  wire  [pSERIALIO_WIDTH-1: 0] serial_rxd,

    output wire   [pDATA_WIDTH-1:0] is_as_tdata,
    `ifdef USER_PROJECT_SIDEBAND_SUPPORT
      output wire   [pUSER_PROJECT_SIDEBAND_WIDTH-1:0] is_as_tupsb,
    `endif
    output wire   [(pDATA_WIDTH/8)-1:0] is_as_tstrb,
    output wire   [(pDATA_WIDTH/8)-1:0] is_as_tkeep,
    output wire   is_as_tlast,
    output wire   [1:0] is_as_tid,
    output wire   is_as_tvalid,
    output wire   [1:0] is_as_tuser,
    output wire   is_as_tready    //when remote side axis switch Rxfifo size <= threshold then is_as_tready=0, this flow control mechanism is for notify local side do not provide data with as_is_tvalid=1

  );

  localparam pSERIALIO_TDATA_WIDTH  = pDATA_WIDTH/pCLK_RATIO;
  
  wire coreclk;
  wire txclk;
  wire rxclk;
  wire axi_awvalid_in;
  wire axi_wvalid_in;
  wire txen_out;
  wire is_as_tready_remote;
  
  assign coreclk = axis_clk;
  assign serial_tclk = txclk;
  assign rxclk = serial_rclk;

  `ifdef USER_PROJECT_SIDEBAND_SUPPORT
    wire Serial_Data_Out_tupsb_4_1;
    wire Serial_Data_Out_tupsb_tlast_tvalid_tready;
  `else
    wire Serial_Data_Out_tlast_tvalid_tready;
  `endif
  wire Serial_Data_Out_tid_tuser;
  wire Serial_Data_Out_tkeep;
  wire Serial_Data_Out_tstrb;
  wire [pSERIALIO_TDATA_WIDTH-1:0] Serial_Data_Out_tdata;

  `ifdef USER_PROJECT_SIDEBAND_SUPPORT
    assign   serial_txd[pSERIALIO_WIDTH-1:0] = {Serial_Data_Out_tupsb_4_1, Serial_Data_Out_tupsb_tlast_tvalid_tready, Serial_Data_Out_tid_tuser, Serial_Data_Out_tkeep, Serial_Data_Out_tstrb, Serial_Data_Out_tdata[pSERIALIO_TDATA_WIDTH-1:0]};
  `else
    assign   serial_txd[pSERIALIO_WIDTH-1:0] = {Serial_Data_Out_tlast_tvalid_tready, Serial_Data_Out_tid_tuser, Serial_Data_Out_tkeep, Serial_Data_Out_tstrb, Serial_Data_Out_tdata[pSERIALIO_TDATA_WIDTH-1:0]};
  `endif

  `ifdef USER_PROJECT_SIDEBAND_SUPPORT
    wire Serial_Data_In_tupsb_4_1;
    wire Serial_Data_In_tupsb_tlast_tvalid_tready;
  `else
    wire Serial_Data_In_tlast_tvalid_tready;
  `endif
  wire Serial_Data_In_tid_tuser;
  wire Serial_Data_In_tkeep;
  wire Serial_Data_In_tstrb;
  wire [pSERIALIO_TDATA_WIDTH-1:0] Serial_Data_In_tdata;

  `ifdef USER_PROJECT_SIDEBAND_SUPPORT
    assign {Serial_Data_In_tupsb_4_1, Serial_Data_In_tupsb_tlast_tvalid_tready, Serial_Data_In_tid_tuser, Serial_Data_In_tkeep, Serial_Data_In_tstrb, Serial_Data_In_tdata[pSERIALIO_TDATA_WIDTH-1:0] } = serial_rxd[pSERIALIO_WIDTH-1:0];
  `else
    assign {Serial_Data_In_tlast_tvalid_tready, Serial_Data_In_tid_tuser, Serial_Data_In_tkeep, Serial_Data_In_tstrb, Serial_Data_In_tdata[pSERIALIO_TDATA_WIDTH-1:0] } = serial_rxd[pSERIALIO_WIDTH-1:0];
  `endif


  reg  txen;

  //register offset 0
  reg rxen_ctl;  //bit 0
  reg txen_ctl;  //bit 1

  //write addr channel
  assign   axi_awvalid_in  = axi_awvalid && cc_is_enable;
  wire axi_awready_out;
  assign axi_awready = axi_awready_out;

  //write data channel
  assign   axi_wvalid_in  = axi_wvalid && cc_is_enable;
  wire axi_wready_out;
  assign axi_wready = axi_wready_out;

  // if both axi_awvalid_in=1 and axi_wvalid_in=1 then output axi_awready_out = 1 and axi_wready_out = 1
  assign axi_awready_out = (axi_awvalid_in && axi_wvalid_in) ? 1 : 0;
  assign axi_wready_out = (axi_awvalid_in && axi_wvalid_in) ? 1 : 0;


  //write register
  always @(posedge axi_clk or negedge axi_reset_n)  begin
    if ( !axi_reset_n ) begin
      rxen_ctl <= 0;
      txen_ctl <= 0;
    end
    else begin
      if ( axi_awvalid_in && axi_wvalid_in ) begin    //when axi_awvalid_in=1 and axi_wvalid_in=1 means axi_awready_out=1 and axi_wready_out=1
        if (axi_awaddr[11:2] == 10'h000 && (axi_wstrb[0] == 1) ) begin //offset 0
          rxen_ctl <= axi_wdata[0];
          txen_ctl <= axi_wdata[1];
        end
        else begin
          rxen_ctl <= rxen_ctl;
          txen_ctl <= txen_ctl;
        end
      end
    end
  end


  // io serdes always output axi_arready = 1 and don't care the axi_arvalid & axi_araddr
  // io serdes only support 2 register bits in offset 0. config read other address offset is reserved.
  assign axi_arready = 1;
  // io serdes always output axi_rvalid = 1 and axi_rdata =  { 30'b0, txen_ctl, rxen_ctl }
  assign axi_rvalid = 1;
  assign axi_rdata =  { 30'b0, txen_ctl, rxen_ctl };



  assign txen_out = txen;

  wire [$clog2(pCLK_RATIO)-1:0] phase_cnt;

  fsic_coreclk_phase_cnt  #(
    .pCLK_RATIO(pCLK_RATIO)
  )
  fsic_coreclk_phase_cnt_0(
    .axis_rst_n(axis_rst_n),
    .ioclk(ioclk),
    .coreclk(coreclk),
    .phase_cnt_out(phase_cnt)
  );


// For Tx Path

  wire  rx_received_data;


  always @(negedge ioclk or negedge axis_rst_n)  begin
    if ( !axis_rst_n ) begin
      txen <= 0;
    end
    else begin
      if ( (txen_ctl || rx_received_data) && phase_cnt == 3   )  // set txen=1 when timeout or rx_received_data==1
                                      // if rx_received_data==1 before timeout, it means remote side txen is ealry then local side.
                                      // then we should set local site txen=1 to allow local site provide ready signal to remote side in tx path.
                                      // It is to avoid local site rx fifo full in axis switch.
        txen <= 1;
      else
        txen <= txen;
    end
  end

  reg [$clog2(pCLK_RATIO)-1:0] tx_shift_phase_cnt;


  always @(posedge ioclk or negedge axis_rst_n)  begin
    if ( !axis_rst_n ) begin
      tx_shift_phase_cnt <= 3;
    end
    else begin
      if (txen)
        tx_shift_phase_cnt <= tx_shift_phase_cnt + 1;
      else
        tx_shift_phase_cnt <= tx_shift_phase_cnt;
    end
  end

  reg [pDATA_WIDTH-1:0] pre_as_is_tdata_buf;
  reg [(pDATA_WIDTH/8)-1:0] pre_as_is_tstrb_buf;
  reg [(pDATA_WIDTH/8)-1:0] pre_as_is_tkeep_buf;
  reg [(pDATA_WIDTH/8)-1:0] pre_as_is_tid_tuser_buf;

  `ifdef USER_PROJECT_SIDEBAND_SUPPORT
    reg [3:0] pre_as_is_tupsb_4_1_buf;
    reg [(pDATA_WIDTH/8)-1:0] pre_as_is_tupsb_tlast_tvalid_tready_buf;
  `else
    reg [(pDATA_WIDTH/8)-1:0] pre_as_is_tlast_tvalid_tready_buf;
  `endif

  wire txen_rst_n = axis_rst_n & txen;

  always @(negedge coreclk or negedge txen_rst_n)  begin
    pre_as_is_tdata_buf <= as_is_tdata;
    pre_as_is_tstrb_buf <= as_is_tstrb;
    pre_as_is_tkeep_buf <= as_is_tkeep;
    pre_as_is_tid_tuser_buf[3:2] <= as_is_tid;
    pre_as_is_tid_tuser_buf[1:0] <= as_is_tuser;
    `ifdef USER_PROJECT_SIDEBAND_SUPPORT
      pre_as_is_tupsb_4_1_buf <= as_is_tupsb[pUSER_PROJECT_SIDEBAND_WIDTH-1:1];
      pre_as_is_tupsb_tlast_tvalid_tready_buf[3] <= as_is_tupsb[0];
      pre_as_is_tupsb_tlast_tvalid_tready_buf[2] <= as_is_tlast;
      pre_as_is_tupsb_tlast_tvalid_tready_buf[1] <= as_is_tvalid;
      pre_as_is_tupsb_tlast_tvalid_tready_buf[0] <= as_is_tready;
    `else
      pre_as_is_tlast_tvalid_tready_buf[2] <= as_is_tlast;
      pre_as_is_tlast_tvalid_tready_buf[1] <= as_is_tvalid;
      pre_as_is_tlast_tvalid_tready_buf[0] <= as_is_tready;
    `endif

    if ( !txen_rst_n ) begin
      pre_as_is_tdata_buf <= 0;
      pre_as_is_tstrb_buf <= 0;
      pre_as_is_tkeep_buf <= 0;
      pre_as_is_tid_tuser_buf <= 0;
      `ifdef USER_PROJECT_SIDEBAND_SUPPORT
        pre_as_is_tupsb_4_1_buf <= 0;
        pre_as_is_tupsb_tlast_tvalid_tready_buf <= 0;
      `else
        pre_as_is_tlast_tvalid_tready_buf <= 0;
      `endif
    end 
    else begin
      if (is_as_tready && as_is_tvalid) begin      //data transfer from Axis siwtch to io serdes when is_as_tready=1 and as_is_tvalid=1
        
        `ifdef USER_PROJECT_SIDEBAND_SUPPORT
          pre_as_is_tupsb_tlast_tvalid_tready_buf[1] <= as_is_tvalid;
        `else
          pre_as_is_tlast_tvalid_tready_buf[1] <= as_is_tvalid;
        `endif
      end
      else begin
        `ifdef USER_PROJECT_SIDEBAND_SUPPORT
          pre_as_is_tupsb_tlast_tvalid_tready_buf[1] <= 0;      // set as_is_tvalid =0 to remote side
        `else
          pre_as_is_tlast_tvalid_tready_buf[1] <= 0;      // set as_is_tvalid =0 to remote side
        `endif

      end
    end
  end

  reg [pDATA_WIDTH-1:0] as_is_tdata_buf;
  reg [(pDATA_WIDTH/8)-1:0] as_is_tstrb_buf;
  reg [(pDATA_WIDTH/8)-1:0] as_is_tkeep_buf;
  reg [(pDATA_WIDTH/8)-1:0] as_is_tid_tuser_buf;
  `ifdef USER_PROJECT_SIDEBAND_SUPPORT
    reg [pCLK_RATIO-1:0] as_is_tupsb_4_1_buf;
    reg [pCLK_RATIO-1:0] as_is_tupsb_tlast_tvalid_tready_buf;    
  `else
    reg [pCLK_RATIO-1:0] as_is_tlast_tvalid_tready_buf;    
  `endif

  always @(posedge ioclk or negedge axis_rst_n)  begin
    if ( !axis_rst_n ) begin
      as_is_tdata_buf <= 0;
      as_is_tstrb_buf <= 0;
      as_is_tkeep_buf <= 0;
      as_is_tid_tuser_buf <= 0;
      `ifdef USER_PROJECT_SIDEBAND_SUPPORT
        as_is_tupsb_4_1_buf <= 0;
        as_is_tupsb_tlast_tvalid_tready_buf <= 0;
      `else
        as_is_tlast_tvalid_tready_buf <= 0;
      `endif
    end
    else begin
      if (phase_cnt == 3) begin      //update as_is_*_buf when phase_cnt == 3
        as_is_tdata_buf <= pre_as_is_tdata_buf;
        as_is_tstrb_buf <= pre_as_is_tstrb_buf;
        as_is_tkeep_buf <= pre_as_is_tkeep_buf;
        as_is_tid_tuser_buf <= pre_as_is_tid_tuser_buf;
        `ifdef USER_PROJECT_SIDEBAND_SUPPORT
          as_is_tupsb_4_1_buf <= pre_as_is_tupsb_4_1_buf;
          as_is_tupsb_tlast_tvalid_tready_buf <= pre_as_is_tupsb_tlast_tvalid_tready_buf;
        `else
          as_is_tlast_tvalid_tready_buf <= pre_as_is_tlast_tvalid_tready_buf;
        `endif
      end
    end
  end

  assign txclk = ioclk&txen;    //use negedge to avoid glitch in txclk.


`ifdef USE_FOR_LOOP_Serial_Data_Out_tdata
  genvar j;
  generate
    for (j=0; j<pSERIALIO_TDATA_WIDTH; j=j+1 ) begin
      assign Serial_Data_Out_tdata[j] = as_is_tdata_buf[j*4+tx_shift_phase_cnt] & txen ;
    end
  endgenerate
`else  //USE_FOR_LOOP_Serial_Data_Out_tdata
  wire [(pDATA_WIDTH/8)-1:0] as_is_tdata_0;
  wire [(pDATA_WIDTH/8)-1:0] as_is_tdata_1;
  wire [(pDATA_WIDTH/8)-1:0] as_is_tdata_2;
  wire [(pDATA_WIDTH/8)-1:0] as_is_tdata_3;
  wire [(pDATA_WIDTH/8)-1:0] as_is_tdata_4;
  wire [(pDATA_WIDTH/8)-1:0] as_is_tdata_5;
  wire [(pDATA_WIDTH/8)-1:0] as_is_tdata_6;
  wire [(pDATA_WIDTH/8)-1:0] as_is_tdata_7;

  assign as_is_tdata_0 = as_is_tdata_buf[3:0];
  assign as_is_tdata_1 = as_is_tdata_buf[7:4];
  assign as_is_tdata_2 = as_is_tdata_buf[11:8];
  assign as_is_tdata_3 = as_is_tdata_buf[15:12];
  assign as_is_tdata_4 = as_is_tdata_buf[19:16];
  assign as_is_tdata_5 = as_is_tdata_buf[23:20];
  assign as_is_tdata_6 = as_is_tdata_buf[27:24];
  assign as_is_tdata_7 = as_is_tdata_buf[31:28];

  assign Serial_Data_Out_tdata[0] = as_is_tdata_0[tx_shift_phase_cnt] & txen ;
  assign Serial_Data_Out_tdata[1] = as_is_tdata_1[tx_shift_phase_cnt] & txen ;
  assign Serial_Data_Out_tdata[2] = as_is_tdata_2[tx_shift_phase_cnt] & txen ;
  assign Serial_Data_Out_tdata[3] = as_is_tdata_3[tx_shift_phase_cnt] & txen ;
  assign Serial_Data_Out_tdata[4] = as_is_tdata_4[tx_shift_phase_cnt] & txen ;
  assign Serial_Data_Out_tdata[5] = as_is_tdata_5[tx_shift_phase_cnt] & txen ;
  assign Serial_Data_Out_tdata[6] = as_is_tdata_6[tx_shift_phase_cnt] & txen ;
  assign Serial_Data_Out_tdata[7] = as_is_tdata_7[tx_shift_phase_cnt] & txen ;
`endif  //USE_FOR_LOOP_Serial_Data_Out_tdata


  assign Serial_Data_Out_tstrb = as_is_tstrb_buf[tx_shift_phase_cnt] & txen ;
  assign Serial_Data_Out_tkeep = as_is_tkeep_buf[tx_shift_phase_cnt] & txen ;
  assign Serial_Data_Out_tid_tuser = as_is_tid_tuser_buf[tx_shift_phase_cnt] & txen ;
  `ifdef USER_PROJECT_SIDEBAND_SUPPORT
    assign Serial_Data_Out_tupsb_4_1 = as_is_tupsb_4_1_buf[tx_shift_phase_cnt] & txen ;
    assign Serial_Data_Out_tupsb_tlast_tvalid_tready = as_is_tupsb_tlast_tvalid_tready_buf[tx_shift_phase_cnt] & txen ;
  `else
    assign Serial_Data_Out_tlast_tvalid_tready = as_is_tlast_tvalid_tready_buf[tx_shift_phase_cnt] & txen ;
  `endif



// For Rx Path
  `ifdef USER_PROJECT_SIDEBAND_SUPPORT
    wire rxdata_out_valid[pSERIALIO_TDATA_WIDTH+3:0];    //add dummy connection to avoid WARNING message by xelab
  `else
    wire rxdata_out_valid[pSERIALIO_TDATA_WIDTH+2:0];    //add dummy connection to avoid WARNING message by xelab
  `endif

  reg  rxen;

  always @(negedge ioclk or negedge axis_rst_n)  begin
    if ( !axis_rst_n ) begin
      rxen <= 0;
    end
    else begin
      if (rxen_ctl)
        rxen <= 1;
      else
        rxen <= rxen;
    end
  end


  genvar i;
  generate
    for (i=0; i<pSERIALIO_TDATA_WIDTH; i=i+1 ) begin

      fsic_io_serdes_rx  #(
        .pRxFIFO_DEPTH(pRxFIFO_DEPTH),
        .pCLK_RATIO(pCLK_RATIO)
      )
      fsic_io_serdes_rx_tdata(
        .axis_rst_n(axis_rst_n),
        .rxclk(rxclk),
        .rxen(rxen),
        .ioclk(ioclk),
        .coreclk(coreclk),
        .Serial_Data_in(Serial_Data_In_tdata[i]),
        .rxdata_out(is_as_tdata[i*4+3:i*4]),
        .rxdata_out_valid(rxdata_out_valid[i])
      );

    end
  endgenerate


  fsic_io_serdes_rx  #(
    .pRxFIFO_DEPTH(pRxFIFO_DEPTH),
    .pCLK_RATIO(pCLK_RATIO)
  )
  fsic_io_serdes_rx_tstrb(
    .axis_rst_n(axis_rst_n),
    .rxclk(rxclk),
    .rxen(rxen),
    .ioclk(ioclk),
    .coreclk(coreclk),
    .Serial_Data_in(Serial_Data_In_tstrb),
    .rxdata_out(is_as_tstrb),
    .rxdata_out_valid(rxdata_out_valid[pSERIALIO_TDATA_WIDTH])
  );


  fsic_io_serdes_rx  #(
    .pRxFIFO_DEPTH(pRxFIFO_DEPTH),
    .pCLK_RATIO(pCLK_RATIO)
  )
  fsic_io_serdes_rx_tkeep(
    .axis_rst_n(axis_rst_n),
    .rxclk(rxclk),
    .rxen(rxen),
    .ioclk(ioclk),
    .coreclk(coreclk),
    .Serial_Data_in(Serial_Data_In_tkeep),
    .rxdata_out(is_as_tkeep),
    .rxdata_out_valid(rxdata_out_valid[pSERIALIO_TDATA_WIDTH+1])
  );

  fsic_io_serdes_rx  #(
    .pRxFIFO_DEPTH(pRxFIFO_DEPTH),
    .pCLK_RATIO(pCLK_RATIO)
  )
  fsic_io_serdes_rx_tid_tuser(
    .axis_rst_n(axis_rst_n),
    .rxclk(rxclk),
    .rxen(rxen),
    .ioclk(ioclk),
    .coreclk(coreclk),
    .Serial_Data_in(Serial_Data_In_tid_tuser),
    .rxdata_out( {is_as_tid[1:0], is_as_tuser[1:0]}),
    .rxdata_out_valid(rxdata_out_valid[pSERIALIO_TDATA_WIDTH+2])
  );


  `ifdef USER_PROJECT_SIDEBAND_SUPPORT
    fsic_io_serdes_rx  #(
      .pRxFIFO_DEPTH(pRxFIFO_DEPTH),
      .pCLK_RATIO(pCLK_RATIO)
    )
    fsic_io_serdes_rx_upsb(
      .axis_rst_n(axis_rst_n),
      .rxclk(rxclk),
      .rxen(rxen),
      .ioclk(ioclk),
      .coreclk(coreclk),
      .Serial_Data_in(Serial_Data_In_tupsb_4_1),
      .rxdata_out( is_as_tupsb[4:1]),    
      .rxdata_out_valid(rxdata_out_valid[pSERIALIO_TDATA_WIDTH+3])
    );
  
    fsic_io_serdes_rx  #(
      .pRxFIFO_DEPTH(pRxFIFO_DEPTH),
      .pCLK_RATIO(pCLK_RATIO)
    )
    fsic_io_serdes_rx_fc(
      .axis_rst_n(axis_rst_n),
      .rxclk(rxclk),
      .rxen(rxen),
      .ioclk(ioclk),
      .coreclk(coreclk),
      .Serial_Data_in(Serial_Data_In_tupsb_tlast_tvalid_tready),
      .rxdata_out( {is_as_tupsb[0], is_as_tlast, is_as_tvalid, is_as_tready_remote}),    
      .rxdata_out_valid(rx_received_data)
    );

  `else
    wire is_as_dummy;

    fsic_io_serdes_rx  #(
      .pRxFIFO_DEPTH(pRxFIFO_DEPTH),
      .pCLK_RATIO(pCLK_RATIO)
    )
    fsic_io_serdes_rx_fc(
      .axis_rst_n(axis_rst_n),
      .rxclk(rxclk),
      .rxen(rxen),
      .ioclk(ioclk),
      .coreclk(coreclk),
      .Serial_Data_in(Serial_Data_In_tlast_tvalid_tready),
      .rxdata_out( {is_as_dummy, is_as_tlast, is_as_tvalid, is_as_tready_remote}),    // only connect [2:0]
      .rxdata_out_valid(rx_received_data)
    );
  `endif

  reg is_as_tready_out;
  assign is_as_tready = is_as_tready_out;

  always @(posedge coreclk or negedge txen_rst_n )  begin
    if ( !txen_rst_n ) begin
      is_as_tready_out <= 0;        //set is_as_tready_out=0 when txen == 0
    end
    else begin
      if (rx_received_data == 0) is_as_tready_out <= 1;    // when txen==1 and still not recevies data from remote side then set is_as_tready_out=1 to avoid dead lock issue.
      else  is_as_tready_out <= is_as_tready_remote;        // when txen == 1 and rx_received_data==1 (received data from remote side) then is_as_tready_out come from is_as_tready_remote (remote side)
    end
  end


endmodule



