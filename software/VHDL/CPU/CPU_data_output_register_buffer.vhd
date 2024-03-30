library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_data_output_register_buffer is
	Port(
		i_clk: in STD_LOGIC;
		i_phi1: in STD_LOGIC;
		i_d_bus: in STD_LOGIC_VECTOR (7 downto 0);
		o_reg_out: out STD_LOGIC_VECTOR (7 downto 0));
end CPU_data_output_register_buffer;

architecture Behavioral of CPU_data_output_register_buffer is
begin
	process(i_clk)
	begin
		if (rising_edge(i_clk)) then
			if i_phi1 = '1' then
				o_reg_out <= i_d_bus;
			end if;
		end if;
	end process;
end Behavioral;