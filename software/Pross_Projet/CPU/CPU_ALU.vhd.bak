library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity CPUALU is
	Port(
		i_a_register: in unsigned (7 downto 0);
        i_b_register: in unsigned (7 downto 0);
        o_output: out unsigned (7 downto 0);
		i_clk: in STD_LOGIC;
		i_sum_select: in STD_LOGIC;
		i_and_select: in STD_LOGIC;
		i_eor_select: in STD_LOGIC;
		i_or_select: in STD_LOGIC;
		i_shift_right_select: in STD_LOGIC;
        i_carry: in STD_LOGIC;
		o_half_carry: out STD_LOGIC;
        o_carry: out STD_LOGIC;
		o_negative: out STD_LOGIC;
        o_overflow: out STD_LOGIC;
		o_zero: out STD_LOGIC);

end CPUALU;

architecture Behavioral of CPUALU is
    signal output_temp: unsigned (8 downto 0);
begin
	process(i_clk)
		begin
			if (rising_edge(i_clk)) then
				if i_sum_select='1' then
                    if i_carry ='1' then
					    output_temp<=i_a_register(7 downto 0)+i_b_register(7 downto 0)+1;
                    else
                        output_temp<=i_a_register(7 downto 0)+i_b_register(7 downto 0);
					end if;
					o_output<=output_temp(7 downto 0);
					o_carry<=output_temp(8);
					o_overflow<= o_carry xor (((i_a_register(7) nand i_b_register(7)) and o_carry) or
					((i_a_register(7) nor i_b_register ) and o_output(7)));
				end if;
				if i_and_select='1' then
					o_output<=i_a_register and i_b_register;
				end if;
				if i_eor_select='1' then
					o_output<=i_a_register xor i_b_register;
				end if;
				if i_or_select='1' then
					o_output<=i_a_register or i_b_register;
				end if;
				o_negative<=o_output(7);
				if i_a_register = (others => '0') then
					o_zero <= '1';
				else
					o_zero <= '0';
			end if;
			end process;
end Behavioral;