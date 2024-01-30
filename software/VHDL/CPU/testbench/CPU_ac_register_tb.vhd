library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPUACRegister_tb is
end CPUACRegister_tb;

architecture testbench of CPUACRegister_tb is
	component CPUACRegister
		Port(
		SBus: inout unsigned (7 downto 0);
		clk: in STD_LOGIC;
		SBtoAC: in STD_LOGIC;
		ACtoSB: in STD_LOGIC;
		ACtoDB: in STD_LOGIC;
		DBus: out unsigned (7 downto 0));
	end component;
	constant CLK_period : time := 500 ns;
	signal SBus: unsigned (7 downto 0);
	signal clk: STD_LOGIC;
	signal SBtoAC: STD_LOGIC;
	signal ACtoSB: STD_LOGIC;
	signal ACtoDB: STD_LOGIC;
	signal DBus: unsigned (7 downto 0);
begin
    module: CPUACRegister port map(SBus=>SBus,clk=>clk,SBtoAC=>SBtoAC,ACtoSB=>ACtoSB,ACtoDB=>ACtoDB,DBus=>DBus);

	CLK_process :process
	begin
		clk<= '0';
		wait for CLK_period/2;
		clk <= '1';
		wait for CLK_period/2;
	end process;

	process
	begin
		SBtoAC <='0';
		ACtoSB <='0';
		ACtoDB <='0';
		DBus <="10101010";
		SBus <="00000001";
		wait for 1 ms;
		SBtoAC<='1';
		wait for 1 ms;
		SBtoAC<='0';
		wait for 1 ms;
		ACtoDB <='1';

	end process;

end testbench;
