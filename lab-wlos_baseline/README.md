# WorkLoad Optimize SOC (WLOS) Baseline

### exmem_pipeline.v 
In order not to have memory data access become a bottleneck, pipeline memory is needed. exmem_pipeline.v provides a sample design strucure.  (Note: The code is provided for the purpose to express the design structure, there is no syntax check nor simulation verification). Your use it to replace the 10T non-pipeline user memory.

### Simulation for matrix multiplication
```sh
cd ~/caravel-soc_fpga-lab/lab-wlos_baseline/testbench/counter_la_mm
source run_clean
source run_sim
```

### Simulation for FIR
```sh
cd ~/caravel-soc_fpga-lab/lab-wlos_baseline/testbench/counter_la_fir
source run_clean
source run_sim
```

### Simulation for qsort
```sh
cd ~/caravel-soc_fpga-lab/lab-wlos_baseline/testbench/counter_la_qs
source run_clean
source run_sim
```

### Simulation for uart
```sh
cd ~/caravel-soc_fpga-lab/lab-wlos_baseline/testbench/uart
source run_clean
source run_sim
```

## Verification with Vivado
### Synthesis and Generate bitstream
```sh
cd ~/caravel-soc_fpga-lab/lab-wlos_baseline/vivado
source run_vivado
```


