library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_stack_pointer is
	Port(
		i_clk: in STD_LOGIC;
		i_sb_to_s: in STD_LOGIC;
      i_s_hold: in STD_LOGIC;
		i_s_bus: in STD_LOGIC_VECTOR (7 downto 0);
		o_reg_out: out STD_LOGIC_VECTOR (7 downto 0):= x"FD");
end CPU_stack_pointer;

architecture Behavioral of CPU_stack_pointer is
begin
	process(i_clk)
	begin
		if (rising_edge(i_clk)) then
			if i_sb_to_s = '1' and i_s_hold = '0' then
				o_reg_out <= i_s_bus;
			end if;
		end if;
	end process;
end Behavioral;