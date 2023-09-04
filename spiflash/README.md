# A Simplified SPIFLSH Device Design
  The design (spiflash.v) is adopted from a behavior model (spiflash-vip.v), and made with synthesiable verilog design. The design is implemented in Caravel FPGA system.
  - spiflash-vip.v : The device behavior model
  - spiflash.v : A handware (synthesiable verilog) implementation of the spiflash model. (Only support sdr read command)
  - spiflash-tb.v : Testbench to test the function
  - bram.v : Xilinx Block RAM behavior model. Implemented based on the understanding of the BRAM behavior. It is not Xilinx official model

