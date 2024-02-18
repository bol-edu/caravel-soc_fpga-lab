import re
import json

ch_data = []
times = []
clk_len = 0
xis_clk = []
bin_ch_data = []
ch_namex = []
ch_count = []
ch_names = []
ch_cnt = []
data_len = 0
time_len = 0
clk_name = "axiclk"
ch_name = "chx"

ch_def_name = "chname.json"
input_filename = "simulate.log" 
output_filename = "output_new.vcd"

sum = 0    
# Get Channel define data
with open(ch_def_name) as f:
    ch_def = json.load(f) # Read all data to lines from the file 

j = 0
for i in ch_def:
    if(j == 0):
        j = 1    
        clk_name = (i) 
    else:
        ch_names.append((i))
        ch_cnt.append(int(ch_def[i]))  

# read data from file
# Open the file in read mode
with open(input_filename, 'r') as file:
    lines = file.readlines() # Read all data to lines from the file


#Parse time & data
# Now, 'lines' is a list where each element is a line from the file
for line in lines:
    if(((int(line[2:],16)) or (int(line[:2],16))) != 0 ):
        ch_data.append(int(line[2:],16)) #for channel data
        sum = sum + (int(line[:2],16))
        times.append(sum)  #for time 

data_len = len(lines) #Check how many change data
time_len = 2*sum # high + low is a clock 


#AXI clock generator
#clk_name = ch_def[0] #clock name
clk_rate = 1*1000*1000/(2*int(ch_def["CLK"])) #unit is MHz
for i in range(time_len):        
    clk = i* clk_rate # clock is 100ns = 10Mhz (unit：1ps)
    xis_clk.append(clk)


clk_len = len(xis_clk)
with open(output_filename, 'w') as vcd_file:
    vcd_file.write("$date today $end\n")
    vcd_file.write("$version Python VCD Converter $end\n")
    vcd_file.write("$timescale 1 ns $end\n")
    vcd_file.write("$scope module top $end\n")
    vcd_file.write(f"$var wire 1  {clk_name} {clk_name} $end\n")         

    # Write define signals
    for i in range(len(ch_cnt)): 
        vcd_file.write(f"$var wire {ch_cnt[i]} {ch_names[i]} {ch_names[i]} $end\n")        
        
    vcd_file.write("$upscope $end\n")
    vcd_file.write("$enddefinitions $end\n")
    vcd_file.write("$dumpvars\n")

    # Initial values
    vcd_file.write(f"b0 {clk_name}\n")
    for i in range(len(ch_names)):
        vcd_file.write(f"b0")          
        for j in range(ch_cnt[i]-1): 
            vcd_file.write(f"0")
        vcd_file.write(f" {ch_names[i]}\n")        

    vcd_file.write("$end\n")
    vcd_file.write("#0\n")

    # Time steps and signal values
    rev_data = 0  
    j = 0
    bit_change = 0
    bit_orig = 0
    width = 0
    position = 0  
    mask = 0
    for i in range(time_len):
        if(rev_data == 0):
            rev_data = 1
        else:
            rev_data = 0

        vcd_file.write(f"b{rev_data} {clk_name}\n")
        if(i == (times[j]*2)):
            position = 0
            for ch_n in range(len(ch_cnt)):
                bit_cur = ch_data[j]
                mask = (2**ch_cnt[ch_n]) - 1                
                chg  = bit_cur ^ bit_orig  
                chg_tmp = chg & mask             
                if(chg_tmp):
                    value = ((bit_cur >> position) & mask)
                    vcd_file.write(f"b{value:b} {ch_names[ch_n]}\n")                    
                position = position + ch_cnt[ch_n]    
 
            j = j + 1
            bit_orig = bit_cur
        vcd_file.write(f"#{xis_clk[i]}\n")



