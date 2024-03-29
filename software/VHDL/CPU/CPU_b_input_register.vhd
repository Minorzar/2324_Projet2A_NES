library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity CPU_b_input_register is
	Port(
		i_clk: in STD_LOGIC;
      i_adl_to_add: in STD_LOGIC;
		i_db_to_add: in STD_LOGIC;
      i_db_bar_to_add: in STD_LOGIC;
		i_d_bus: in unsigned (7 downto 0);
      i_adl_bus: in unsigned (7 downto 0);
      o_output: out unsigned (7 downto 0));
end CPU_b_input_register;

architecture Behavioral of CPU_b_input_register is
	signal reg_b: unsigned (7 downto 0);
begin
	process(i_clk)
	begin
		if (rising_edge(i_clk)) then
			if i_adl_to_add = '1' then
				reg_b <= i_adl_bus;
			elsif i_db_to_add = '1' then
				reg_b <= i_d_bus;
            elsif i_db_bar_to_add = '1' then
				reg_b <= not i_d_bus;
			end if;
		end if;
	end process;
	o_output<=reg_b;
end Behavioral;