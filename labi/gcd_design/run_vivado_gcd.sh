
echo "start vivado project"


# ----- remove vivado project if existed -----#

if [ -d "./vvd_caravel_fpga/" ]
then
	rm -r ./vvd_caravel_fpga/
	echo "remove previous project"
fi

# ----- remove vivado project log files -----#
rm -r ./NA
rm -r ./.Xil
rm timingreport.txt
rm vivado*.jou
rm vivado*.log


# ----- Re-build vivado project -----#

vivado -source vvd_caravel_fpga_gcd.tcl -mode tcl

FILE="vivado.log"
STRING="CRITICAL WARNING: [Timing 38-282]"

if [ -f "$FILE" ]
then
	grep -F "$STRING" "$FILE" 
fi


cp ./vvd_caravel_fpga/vvd_caravel_fpga.gen/sources_1/bd/design_1/hw_handoff/design_1.hwh ./jupyter_notebooks_project/caravel_fpga.hwh

cp ./vvd_caravel_fpga/vvd_caravel_fpga.runs/impl_1/design_1_wrapper.bit ./jupyter_notebooks_project/caravel_fpga.bit

echo "======================================================================"
echo "                           vivado complete "
echo "======================================================================"
