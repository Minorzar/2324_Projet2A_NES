library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity testverilog_tb is
end testverilog_tb;

architecture testbench of testverilog_tb is
	component testverilog
	Port(
		in1: in STD_LOGIC;
		vect: in STD_LOGIC_VECTOR(1 downto 0);
		out1: out STD_LOGIC);
	end component;
	
	signal in1: STD_LOGIC;
	signal vect: STD_LOGIC_VECTOR(1 downto 0);
	signal out1: STD_LOGIC;

begin
	module: test1.v port map(in1 => in1, vect => vect, out1 => out1);
	
	process
	begin
		in1 <= '0';
		vect <="00";
		wait for 1 ms;
		vect <="01";
		wait for 1 ms;
		vect <="10";
		wait for 1 ms;
		vect <="11";
		wait for 1 ms;
		in1 <= '1';
		vect <="00";
		wait for 1 ms;
		vect <="01";
		wait for 1 ms;
		vect <="10";
		wait for 1 ms;
		vect <="11";
		wait for 1 ms;
	end process;
	
end testbench;