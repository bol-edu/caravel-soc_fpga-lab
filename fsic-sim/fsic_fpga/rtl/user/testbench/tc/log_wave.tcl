# tcl file for xsim

# --------------------------------------------
# Usage
# --------------------------------------------
# log_wave
# Name	           Description
# [-recursive]	   Searches recursively for objects
# [-r]	           Searches recursively for objects
# [-verbose]	   Displays all warnings
# [-v]	           Displays all warnings
# [-quiet]	   Ignore command errors
# <hdl_objects>	   Which hdl_objects to trace

# Example:
# log_wave                 -r         [get_objects /testbench/dut/*]
  log_wave -quiet -verbose -recursive *

  run all
  quit

