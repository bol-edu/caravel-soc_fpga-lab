# FIR reference code
⭐ These files are reference codes for those who did not take the course "SoC design" last semester.  
⭐⭐ If you have taken that course, we highly recommend you to use your own FIR code, because you are much more familiar with your code's behavior.

## How to integrate these files into FSIC
1. Copy these files into `/fsic_fpga/rtl/user/user_subsys/user_prj/user_prj1/rtl/`
2. Add these file names into `/fsic_fpga/rtl/user/user_subsys/user_prj/user_prj1/rtl/rtl.f`
3. Add these file names into `/fsic_fpga/rtl/user/testbench/tc/filelist`
4. In `/fsic_fpga/rtl/user/user_subsys/user_prj/user_prj1/rtl/user_prj1.v`, use the following code to connect the interface signals between fir.v and bram11 (tap_RAM & data_RAM):
   ```
   // ram for tap
    wire                     tap_WE_merge;
    wire                     tap_RE;
    wire [(pDATA_WIDTH-1):0] tap_Di;
    wire [(pADDR_WIDTH-1):0] tap_A_shifted;
    wire [(pDATA_WIDTH-1):0] tap_Do;
    
   // ram for data RAM
    wire                     data_WE_merge;
    wire                     data_RE;
    wire [(pDATA_WIDTH-1):0] data_Di;
    wire [(pADDR_WIDTH-1):0] data_A_shifted;
    wire [(pDATA_WIDTH-1):0] data_Do;
   fir fir_U0(
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
        .tap_WE_merge(tap_WE_merge),
        .tap_RE(tap_RE),
        .tap_Di(tap_Di),
        .tap_A_shifted(tap_A_shifted),
        .tap_Do(tap_Do),

        // ram for data
        .data_WE_merge(data_WE_merge),
        .data_RE(data_RE),
        .data_Di(data_Di),
        .data_A_shifted(data_A_shifted),
        .data_Do(data_Do),

        .axis_clk(axis_clk),
        .axis_rst_n(axis_rst_n)

    );
    
    // RAM for tap
    bram11 tap_RAM (
        .clk(axis_clk),
        .we(tap_WE_merge),
        .re(tap_RE),
        .waddr(tap_A_shifted),
        .raddr(tap_A_shifted),
        .wdi(tap_Di),
        .rdo(tap_Do)
    );

    // RAM for data
    bram11 data_RAM(
        .clk(axis_clk),
        .we(data_WE_merge),
        .re(data_RE),
        .waddr(data_A_shifted),
        .raddr(data_A_shifted),
        .wdi(data_Di),
        .rdo(data_Do)
    );
   ```

## What should you do in testbench
<!-- https://glyphy.io/cool-symbols/arrows -->
<!--
In `/fsic_fpga/rtl/user/testbench/tb_fsic.v`, you need to implement the following in order:
1. To reset all: call "task `fsic_system_initial()`"
2. To enable user_project_1: `program [32'h3000_5000] ⇠ 32'h1 `
3. 
-->
In `/fsic_fpga/rtl/user/testbench/tb_fsic.v`, you need to implement the following in order:
| step | todo |
|:--------- |:--------- |
| 1. To reset all | call "task `fsic_system_initial()`" |
| 2. To enable user_project_1 | program address [32'h3000_5000] ⇠ 32'd1 |
| 3. Check whether FIR is idle. If not, wait until FIR is idle | read address [32'h3000_0000], loop until its return value bit 2 = 1 (ap_idle=1)|
| 4. Program data length | write address [32'h3000_0010] ⇠ DATA_LENGTH, with DATA_LENGTH = 32'd64 |
| 5. Program tap parameters | write address [32'h3000_0020] ⇠ 32'd0<br/>write address [32'h3000_0024] ⇠ -32'd10<br/>write address [32'h3000_0028] ⇠ -32'd9<br/>write address [32'h3000_002C] ⇠ 32'd23<br/>write address [32'h3000_0030] ⇠ 32'd56<br/>write address [32'h3000_0034] ⇠ 32'd63<br/>write address [32'h3000_0038] ⇠ 32'd56<br/>write address [32'h3000_003C] ⇠ 32'd23<br/>write address [32'h3000_0040] ⇠ -32'd9<br/>write address [32'h3000_0044] ⇠ -32'd10<br/>write address [32'h3000_0048] ⇠ 32'd0<br/> |
| 6. Read back data length & check | read address [32'h3000_0010], and check whether the return value is "DATA_LENGTH" |
| 7. Read back tap parameters & check | read address [32'h3000_0020], and check whether the return value is 32'd0<br/>read address [32'h3000_0024], and check whether the return value is -32'd10<br/>read address [32'h3000_0028], and check whether the return value is -32'd9<br/>read address [32'h3000_002C], and check whether the return value is 32'd23<br/>read address [32'h3000_0030], and check whether the return value is 32'd56<br/>read address [32'h3000_0034], and check whether the return value is 32'd63<br/>read address [32'h3000_0038], and check whether the return value is 32'd56<br/>read address [32'h3000_003C], and check whether the return value is 32'd23<br/>read address [32'h3000_0040], and check whether the return value is -32'd9<br/>read address [32'h3000_0044], and check whether the return value is -32'd10<br/>read address [32'h3000_0048], and check whether the return value is 32'd0<br/> |
| 8. Program ap_start = 1 | write address [32'h3000_0000] ⇠ 32'd1 |
| **Start FIR data X, Y stream data** | **X[n]: Stream data_in; Y[n]: Stream data_out** |
| 9-1. Feed in data X[n] | Feed in $X[n]=n$ one by one, where $n=0,1,2,...,63$, using AXI-Stream interface. That is, feed in X[0] (=0), then X[1] (=1), then X[2] (=2), ..., then X[63] (=63), where the total number of input data = 64. |
| 9-2. Get output data Y[n]<br/>(You can do 9-2. and 9-1. concurrently because they are NOT using the same AXI-Stream interface.) | Get output data Y[n] one by one, where $n=0,1,2,...,63$, from another AXI-Stream interface. And then compare Y[n] with golden values `Y_golden[n]=0*n+(-10)*(((n-1)<0)? 0:(n-1))+(-9)*(((n-2)<0)? 0:(n-2))+23*(((n-3)<0)? 0:(n-3))+56*(((n-4)<0)? 0:(n-4))+63*(((n-5)<0)? 0:(n-5))+56*(((n-6)<0)? 0:(n-6))+23*(((n-7)<0)? 0:(n-7))+(-9)*(((n-8)<0)? 0:(n-8))+(-10)*(((n-9)<0)? 0:(n-9))+0*(((n-10)<0)? 0:(n-10))`, where $n=0,1,2,...,63$. |
| 10. Check whether FIR is done and idle | read address [32'h3000_0000], and check whether the return value is 32'b110 (ap_done=1 & ap_idle=1 (& ap_start=0)) |
| **Finish!!!** | **(optional) You can print out some information (ex: error count) on screen.** |
