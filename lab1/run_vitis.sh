cd ./vitis_hls_project
vitis_hls -f run_hls.tcl
# patch error of Validation failed for parameter 'Write Depth A(Write_Depth_A)' for BD Cell 'read_romcode_0_bram'. Value '1' is out of the range (2,1048576)
cd -
sed -i 's/MEM_SIZE">4/MEM_SIZE">4096/' ./vitis_hls_project/lab1/solution1/impl/ip/component.xml
