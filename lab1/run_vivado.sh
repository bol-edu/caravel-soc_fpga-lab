#!/usr/bin/bash
# bash run_composable.sh

if [ -d "./vivado_project/" ]
then
 rm -r ./vivado_project/
 echo "start vivado project"
fi

if [ -d "./design_1.hwh" ]
then
 rm ./design_1.hwh
fi

if [ -d "./design_1.bit" ]
then
 rm ./design_1.bit
fi

vivado -source vivado_project.tcl -mode tcl

cp ./vivado_project/vivado_project.gen/sources_1/bd/design_1/hw_handoff/design_1.hwh ./jupyter_notebooks_project/design.hwh
cp ./vivado_project/vivado_project.runs/impl_1/design_1_wrapper.bit ./jupyter_notebooks_project/design.bit

echo "======================================================================"
echo "                           vivado complete "
echo "======================================================================"

