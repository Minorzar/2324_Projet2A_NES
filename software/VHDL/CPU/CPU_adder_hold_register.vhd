library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_adder_hold_register is
	Port(
		i_clk: in STD_LOGIC;
      i_input: in unsigned (7 downto 0);
		i_add_to_adl: in STD_LOGIC;
		i_add_to_sb_0_6: in STD_LOGIC;
      i_add_to_sb_7: in STD_LOGIC;
      o_adl_bus: out unsigned (7 downto 0);
		o_s_bus: out unsigned (7 downto 0));
end CPU_adder_hold_register;

architecture Behavioral of CPU_adder_hold_register is
	signal reg_add: unsigned (7 downto 0);
begin
	process(i_clk)
	begin
		if(rising_edge(i_clk)) then
			reg_add<=i_input;
		end if;
	end process;
	o_s_bus <= reg_add when (i_add_to_sb_0_6 = '1' and i_add_to_sb_7 = '1') else
		'Z' & reg_add(6 downto 0) when i_add_to_sb_0_6 = '1' else
		reg_add(7) & "ZZZZZZZ" when i_add_to_sb_7 = '1' else
		(others => 'Z');
    
	o_adl_bus <= reg_add when i_add_to_adl = '1' else
		(others => 'Z');

end Behavioral;