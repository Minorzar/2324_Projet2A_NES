library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_adder_hold_register is
	Port(
		i_clk: in STD_LOGIC;
      i_input: in STD_LOGIC_VECTOR (7 downto 0);
		o_reg_out: out STD_LOGIC_VECTOR (7 downto 0));
end CPU_adder_hold_register;

architecture Behavioral of CPU_adder_hold_register is
begin
	process(i_clk)
	begin
		if(rising_edge(i_clk)) then
			o_reg_out<=i_input;
		end if;
	end process;

end Behavioral;