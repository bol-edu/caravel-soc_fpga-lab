#!/usr/bin/env python
# coding: utf-8

# In[14]:


# coding: utf-8

# In[ ]:


from __future__ import print_function

import sys, os
from pynq import allocate

sys.path.append('/home/xilinx')
os.environ['XILINX_XRT'] = '/usr'
from pynq import Overlay

if __name__ == "__main__":
    print("Entry:", sys.argv[0])
    print("System argument(s):", len(sys.argv))

    print("Start of \"" + sys.argv[0] + "\"")

    ol = Overlay("/home/xilinx/jupyter_notebooks/lab1-read_romcode/design.bit")
    regIP = ol.read_romcode_0
    
    status = regIP.read(0x00)
    print(status)
    
    ROM_SIZE = 1024
    
    rom_buffer_original = allocate(shape=(ROM_SIZE,), dtype='uint32')
    rom_buffer_read_back = allocate(shape=(ROM_SIZE,), dtype='uint32')
    
    for i in range(ROM_SIZE):  #initial
        rom_buffer_original[i] = i
        rom_buffer_read_back[i] = 0
    
    rom_buffer_original_PA = rom_buffer_original.device_address
    rom_buffer_read_back_PA = rom_buffer_read_back.device_address
    
    print("rom_buffer_original_PA: ",rom_buffer_original_PA)
    print("rom_buffer_read_back_PA: ",rom_buffer_read_back_PA)
    
    # set AXI master base address
    regIP.write(0x10, rom_buffer_original_PA)
    regIP.write(0x1c, rom_buffer_read_back_PA)
        
    # write ROM to BRAM
    regIP.write(0x28, 0)  # set write to bram cmd
    regIP.write(0x00, 0x01)  # IP satrt
    while (regIP.read(0x00) & 0x4) == 0x0:  # wait for done
        continue
    print("write to bram done")
    
    # read back from BRAM
    regIP.write(0x28, 1)  # set read back
    regIP.write(0x00, 0x01)  # IP satrt
    while (regIP.read(0x00) & 0x4) == 0x0:  # wait for done
        continue
    print("read from bram done")
    
    # check
    for i in range(ROM_SIZE):
        if rom_buffer_original[i] != rom_buffer_read_back[i]:
            print("diff in ",i,"th element, golden:",rom_buffer_original[i],", read back: ",rom_buffer_read_back[i])

    print("============================")
    print("Exit process")


# In[ ]:




