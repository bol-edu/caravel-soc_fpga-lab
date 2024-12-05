counter_la_fir:
	rm -rf xsim.dir/ *.log *.pb *.jou *.wdb
	xvlog -f ./include.rtl.list.xsim counter_la_fir_tb.v
	xelab -top counter_la_fir_tb -snapshot counter_la_fir_tb_elab
	xsim counter_la_fir_tb_elab -R
