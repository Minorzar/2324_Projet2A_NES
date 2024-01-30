library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_ALU is
	Port(
		i_a_register: in unsigned (7 downto 0);
		i_b_register: in unsigned (7 downto 0);
		i_clk: in STD_LOGIC;
		i_sum_select: in STD_LOGIC;
		i_and_select: in STD_LOGIC;
		i_eor_select: in STD_LOGIC;
		i_or_select: in STD_LOGIC;
		i_shift_right_select: in STD_LOGIC;
      i_carry: in STD_LOGIC;
		b_result: buffer unsigned (7 downto 0);
      b_carry: buffer STD_LOGIC;
      o_overflow: out STD_LOGIC);
end CPU_ALU;

architecture Behavioral of CPU_ALU is
signal a_temp: unsigned (8 downto 0);
signal b_temp: unsigned (8 downto 0);
signal result_temp: unsigned (8 downto 0);
begin
process(i_clk)
	begin
		if (rising_edge(i_clk)) then
			if i_sum_select = '1' then
				a_temp <= '0' & i_a_register;
				b_temp <= '0' & i_b_register;
				if i_carry = '1' then
					result_temp <= a_temp + b_temp + "00000001";
				else
					result_temp <= a_temp + b_temp;
				end if;
				b_carry <= result_temp(8);
			else
				b_carry <= '0';
			end if;
			if i_and_select = '1' then
				b_result <= i_a_register and i_b_register;
			end if;
			if i_eor_select = '1' then
				b_result <= i_a_register xor i_b_register;
			end if;
			if i_or_select = '1' then
				b_result <= i_a_register or i_b_register;
			end if;
			if i_shift_right_select = '1' then
				b_result <= '0' & (i_a_register(7 downto 1) and i_b_register(7 downto 1));
			end if;
			o_overflow <= b_carry xor ((b_carry and ( b_result(7) or (not i_a_register(7)) or (not i_b_register(7)) ) ) or (b_result(7) and (not i_a_register(7)) and (not i_b_register (7))));
		end if;
	end process;
end Behavioral;