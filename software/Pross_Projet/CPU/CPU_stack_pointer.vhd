library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity CPU_ac_register is
	Port(
		i_clk: in STD_LOGIC;
		i_sb_to_s: in STD_LOGIC;
		i_s_to_sb: in STD_LOGIC;
		i_s_to_adl: in STD_LOGIC;
        i_s_hold: in STD_LOGIC;
		o_adl_bus: out unsigned (7 downto 0);
		io_s_bus: inout unsigned (7 downto 0));
end CPU_ac_register;

architecture Behavioral of CPU_ac_register is
	signal s_reg: unsigned (7 downto 0);
begin
	process(i_clk)
		begin
			if (rising_edge(i_clk)) then
				if i_sb_to_s = '1' and i_s_hold = '0' then
					s_reg <= io_s_bus;
				end if;
			end if;
		end process;

	io_s_bus <= s_reg when i_s_to_sb = '1' else
		(others => 'Z');

	o_adl_bus <= s_reg when i_s_to_adl = '1' else
		(others => 'Z');
end Behavioral;