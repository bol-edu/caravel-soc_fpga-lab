# Executing Function in User Project Memory

## Design Presentation
[Introduce UART, Interrupt, User BRAM by Willy, Josh](https://www.youtube.com/watch?v=o_KWWsHzoB4)  
[報告投影片](https://github.com/bol-edu/caravel-soc_fpga-lab/files/12158985/Executing.the.function.in.place.Caravel.SoC.User.Project.memory.pdf)

## Run User Project Memory Enabled counter_la Testbench
Run [iverilog](https://github.com/bol-edu/caravel-soc#toolchain-prerequisites) simulation
```sh
cd ~/caravel-soc_fpga-lab/lab-exmem/testbench/counter_la
source run_sim
```

Validate the `Call function adder() in User Project BRAM (mprjram, 0x38000000) return value passed, 0x2233` is printed
```
Reading counter_la.hex
counter_la.hex loaded into memory
Memory 5 bytes = 0x6f 0x00 0x00 0x0b 0x13
VCD info: dumpfile counter_la.vcd opened for output.
LA Test 1 started
Call function adder() in User Project BRAM (mprjram, 0x38000000) return value passed, 0x2233
LA Test 2 passed
```
