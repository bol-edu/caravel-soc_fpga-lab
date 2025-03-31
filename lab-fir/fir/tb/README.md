The fir_tb_hkust.v is a testbench from the class of hkust.

The tb.v testbench is designed for scenarios where both data_len and coef_len are random. The test patterns (x.dat, coef.dat, y.dat) are generated from Python. You can refer to Fir_intro_testbench.ppt for further details.

The fir_tb.v testbench is specifically configured for data_len = 600 and coef_len = 11, with fixed coefficient values. The test patterns are derived from out_gold.dat and samples_triangular_wave.dat.
