library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_address_bus_register is
	Port(
		i_clk: in STD_LOGIC;
		i_phi1: in STD_LOGIC;
		i_adlh_to_ablh: in STD_LOGIC;
		o_address_bus: out unsigned (7 downto 0);
		i_adlh_bus: in unsigned (7 downto 0));
end CPU_address_bus_register;

architecture Behavioral of CPU_address_bus_register is
	signal reg_ablh: unsigned (7 downto 0);
begin
	process(i_clk)
	begin
		if (rising_edge(i_clk)) then
			if i_adlh_to_ablh = '1' and i_phi1 = '1' then
				reg_ablh <= i_adlh_bus;
			end if;
		end if;
	end process;

	o_address_bus <= reg_ablh;
end Behavioral;