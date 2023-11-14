library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity CPU_a_input_register is
	Port(
		i_clk: in STD_LOGIC;
		i_sb_to_add: in STD_LOGIC;
		i_0_to_add: in STD_LOGIC;
		i_s_bus: in unsigned (7 downto 0);
		o_output out unsigned (7 downto 0));
end CPU_a_input_register;

architecture Behavioral of CPU_a_input_register is
	signal a_reg: unsigned (7 downto 0);
begin
	process(i_clk)
	begin
		if (rising_edge(i_clk)) then
			if i_0_to_add = '1' then
				a_reg <= (others =>'0');
			elsif i_sb_to_add = '1' then
				a_reg <= io_s_bus;
			end if;
		end if;
	end process;
	o_output<=a_reg;
end Behavioral;