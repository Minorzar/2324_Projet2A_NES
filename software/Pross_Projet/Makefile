
all:

	ghdl -a test.vhd
	ghdl -a test_tb.vhd
	ghdl -e test_tb
	ghdl -r test_tb --wave=test_tb.ghw


	ghdl -a Test_multidata.vhd
	ghdl -a Test_multidata_tb.vhd
	ghdl -e Test_multidata_tb
	ghdl -r Test_multidata_tb --wave=Test_multidata_tb.ghw

	rm *.o