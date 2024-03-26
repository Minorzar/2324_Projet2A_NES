library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_ac_register is
	Port(
		i_clk: in STD_LOGIC;
		i_sb_to_ac: in STD_LOGIC;
		i_ac_to_sb: in STD_LOGIC;
		i_ac_to_db: in STD_LOGIC;
		o_d_bus: out unsigned (7 downto 0);
		io_s_bus: inout unsigned (7 downto 0));
end CPU_ac_register;

architecture Behavioral of CPU_ac_register is
	signal reg_ac: unsigned (7 downto 0):= x"00";
begin
	process(i_clk)
		begin
			if (rising_edge(i_clk)) then
				if i_sb_to_ac = '1' then
					reg_ac <= io_s_bus;
				end if;
			end if;
		end process;

	io_s_bus <= reg_ac when i_ac_to_sb = '1' else
		(others => 'Z');

	o_d_bus <= reg_ac when i_ac_to_db = '1' else
		(others => 'Z');
end Behavioral;