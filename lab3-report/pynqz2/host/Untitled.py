#!/usr/bin/env python
# coding: utf-8

# In[6]:



# coding: utf-8

# In[ ]:


from __future__ import print_function

import sys, os

sys.path.append('/home/xilinx')
os.environ['XILINX_XRT'] = '/usr'
from pynq import Overlay

if __name__ == "__main__":
    print("Entry:", sys.argv[0])
    print("System argument(s):", len(sys.argv))

    print("Start of \"" + sys.argv[0] + "\"")

    ol = Overlay("/home/xilinx/jupyter_notebooks/axi2gpio/axi2gpio.bit")
    regIP = ol.caravel_ps_0
    
    
    print("Load bitstream success.")


# In[8]:


import random

regIP.write(0x14, 0x10)

lv = regIP.read(0x34)
hv = regIP.read(0x38)

print("output enable: "  +hex( lv) )

for i in range(9):
    print("============================")

    regIP.write(0x10, random.randint(0, 0xffffffff))
    out = regIP.read(0x1c)
    input = regIP.read(0x10)
            
    print("input : " +hex( input) +" output: " + hex(out) )           
    print( "PASS" if(out==input) else"FAIL")


# In[9]:



regIP.write(0x14, 0x30)
lv = regIP.read(0x34)
hv = regIP.read(0x38)

print("output enable: " + hex( lv) )

for i in range(9):
    print("============================")

    regIP.write(0x10, random.randint(0, 0xffffffff))
    out = regIP.read(0x1c)
    input = regIP.read(0x10)
            
    print("input : " +hex( input) +" output: " + hex(out) )           
    print( "PASS" if(out==input) else"FAIL")


# In[10]:


regIP.write(0x14, 0x00)
lv = regIP.read(0x34)
hv = regIP.read(0x38)

print("output enable: " + hex( lv) )


print("============================")

regIP.write(0x10, random.randint(0, 0xffffffff))
out = regIP.read(0x1c)
input = regIP.read(0x10)
            
print("input : " +hex( input) +" output: " + hex(out) )           
print( "PASS" if(out==0x1234) else"FAIL")


# In[ ]:




