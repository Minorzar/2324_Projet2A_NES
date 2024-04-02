library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_a_input_register is
	Port(
		i_clk: in STD_LOGIC;
		i_sb_to_add: in STD_LOGIC;
		i_O_to_add: in STD_LOGIC;
		i_s_bus: in STD_LOGIC_VECTOR (7 downto 0);
		o_output: out STD_LOGIC_VECTOR (7 downto 0));
end CPU_a_input_register;

architecture Behavioral of CPU_a_input_register is
	signal reg_a: STD_LOGIC_VECTOR (7 downto 0) :=(others => '1');
begin
	process(i_clk)
	begin
		if (rising_edge(i_clk)) then
			if i_O_to_add = '1' then
				reg_a <= (others =>'0');
			elsif i_sb_to_add = '1' then
				reg_a <= i_s_bus;
			end if;
		end if;
	end process;
	o_output<=reg_a;
end Behavioral;