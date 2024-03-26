library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity CPU_xy_register is
	Port(
		i_clk: in STD_LOGIC;
		i_sb_to_xy: in STD_LOGIC;
		i_xy_to_sb: in STD_LOGIC;
		io_s_bus: inout unsigned (7 downto 0));
end CPU_xy_register;

architecture Behavioral of CPU_xy_register is
	signal reg_xy : unsigned (7 downto 0):= x"00";
begin
	process(i_clk)
	begin
		if (rising_edge(i_clk)) then
			if i_sb_to_xy = '1' then
				reg_xy <= io_s_bus;
			end if;
		end if;
	end process;

	io_s_bus <= reg_xy when i_xy_to_sb = '1' else
		(others => 'Z');

end Behavioral;