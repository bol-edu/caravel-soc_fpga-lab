echo "start vitis_hls project"
pushd ./
cd ./vitis_hls_project/hls_output_pin
if [ -d "./hls_output_pin.prj/" ]
then
  make clean
fi
make run CSYNTH=1 EXPORT_IP=1


cd ../hls_read_romcode
if [ -d "./hls_read_romcode.prj/" ]
then
  make clean
fi
make run CSYNTH=1 EXPORT_IP=1

# Hack xml file for MEM_SIZE value for IP: hls_read_romcode
sed -i 's/MEM_SIZE">4</MEM_SIZE">8192</' ./hls_read_romcode.prj/solution1/impl/ip/component.xml


cd ../hls_caravel_ps
if [ -d "./hls_caravel_ps.prj/" ]
then
  make clean
fi
make run CSYNTH=1 EXPORT_IP=1


echo "======================================================================"
echo "                           vitis_hls complete "
echo "======================================================================"
popd