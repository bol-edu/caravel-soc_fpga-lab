echo "start vitis_hls project"

cd ./vitis_hls_project
if [ -d "./hls_caravel_ps.prj/" ]
then
  make clean
fi
make run CSYNTH=1 EXPORT_IP=1


echo "======================================================================"
echo "                           vitis_hls complete "
echo "======================================================================"
