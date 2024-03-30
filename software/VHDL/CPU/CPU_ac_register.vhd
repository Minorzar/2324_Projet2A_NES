library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_ac_register is
	Port(
		i_clk: in STD_LOGIC;
		i_sb_to_ac: in STD_LOGIC;
		i_s_bus: in STD_LOGIC_VECTOR(7 downto 0);
		o_reg_out: out STD_LOGIC_VECTOR (7 downto 0):= x"00");
end CPU_ac_register;

architecture Behavioral of CPU_ac_register is
begin
	process(i_clk)
		begin
			if (rising_edge(i_clk)) then
				if i_sb_to_ac = '1' then
					o_reg_out <= i_s_bus;
				end if;
			end if;
		end process;
end Behavioral;