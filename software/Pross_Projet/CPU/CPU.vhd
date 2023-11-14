library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CPU is
	Port(
		i_clk: in STD_LOGIC;
		i_irq: in STD_LOGIC;
		i_ready: in STD_LOGIC;
		o_address_bus: out unsigned(15 downto 0);
		io_data_bus: inout unsigned(7 downto 0));
end CPU;
architecture Behavioral of CPU is
	signal s_bus: unsigned (7 downto 0);
	signal d_bus: unsigned (7 downto 0);
	signal adl_bus: unsigned (7 downto 0);
	signal adh_bus: unsigned (7 downto 0);
