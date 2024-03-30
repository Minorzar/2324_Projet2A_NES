library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_input_data_latch is
	Port(
		i_clk: in STD_LOGIC;
		i_phi2: in STD_LOGIC;
		i_data_bus: in STD_LOGIC_VECTOR (7 downto 0);
		o_reg_out: out STD_LOGIC_VECTOR (7 downto 0));
end CPU_input_data_latch;

architecture Behavioral of CPU_input_data_latch is
begin
	process(i_clk)
	begin
		if (rising_edge(i_clk)) then
			if i_phi2 = '1' then
				o_reg_out <= i_data_bus;
			end if;
		end if;
	end process;
	
end Behavioral;