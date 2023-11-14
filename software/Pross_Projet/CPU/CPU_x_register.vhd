library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity CPU_x_register is
	Port(
		i_clk: in STD_LOGIC;
		i_sb_to_x: in STD_LOGIC;
		i_x_to_sb: in STD_LOGIC;
		io_s_bus: inout unsigned (7 downto 0));
end CPU_x_register;

architecture Behavioral of CPU_x_register is
	signal x_reg: unsigned (7 downto 0);
begin
	process(i_clk)
	begin
		if (rising_edge(i_clk)) then
			if i_sb_to_x = '1' then
				x_reg <= io_s_bus;
			end if;
		end if;
	end process;

	s_bus <= x_reg when i_x_to_sb = '1' else
		(others => 'Z');

end Behavioral;