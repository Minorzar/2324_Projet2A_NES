library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

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
	signal add_reg: unsigned (7 downto 0);
begin
    add_reg<=i_input;
	s_bus <= add_reg when (i_add_to_sb_0_6 = '1' and i_add_to_sb_7 = '1') else
        'Z' & add_reg(6 downto 0) when i_add_to_sb_0_6 = '1' else
        add_reg(7) & 'ZZZZZZZ' when i_add_to_sb_7 = '1' else
		(others => 'Z');
    
    adl_bus <= add_reg when i_add_to_adl = '1' else
        (others => 'Z');
        
end Behavioral;