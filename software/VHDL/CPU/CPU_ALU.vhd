library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_ALU is
   Port (
      i_a_register         : in  STD_LOGIC_VECTOR(7 downto 0);
      i_b_register         : in  STD_LOGIC_VECTOR(7 downto 0);
      i_sum_select         : in  STD_LOGIC;
      i_and_select         : in  STD_LOGIC;
      i_eor_select         : in  STD_LOGIC;
      i_or_select          : in  STD_LOGIC;
      i_shift_right_select : in  STD_LOGIC;
      i_carry              : in  STD_LOGIC;
      o_result             : out STD_LOGIC_VECTOR(7 downto 0);
      o_carry              : out STD_LOGIC :='0';
      o_overflow           : out STD_LOGIC :='0');
end CPU_ALU;

architecture Behavioral of CPU_ALU is
	signal buf_result: STD_LOGIC_VECTOR(7 downto 0);
	signal buf_carry:STD_LOGIC;
begin
   process(i_sum_select, i_and_select, i_eor_select, i_or_select, i_shift_right_select, i_carry, i_a_register, i_b_register)
      variable result_temp  : STD_LOGIC_VECTOR(8 downto 0);
	begin
      if i_sum_select = '1' then
         if i_carry = '1' then
            result_temp := std_logic_vector(('0' & unsigned(i_a_register)) + ('0' & unsigned(i_b_register)) + 1);
         else
            result_temp := std_logic_vector(('0' & unsigned(i_a_register)) + ('0' & unsigned(i_b_register)));
         end if;
         buf_carry <= result_temp(8);
         buf_result <= result_temp(7 downto 0);
      elsif i_and_select = '1' then
         buf_result <= i_a_register and i_b_register;
			buf_carry <= '0';
      elsif i_eor_select = '1' then
         buf_result <= i_a_register xor i_b_register;
			buf_carry <= '0';
      elsif i_or_select = '1' then
         buf_result <= i_a_register or i_b_register;
			buf_carry <= '0';
      elsif i_shift_right_select = '1' then
         buf_result <= '0' & (i_a_register(7 downto 1) and i_b_register(7 downto 1));
			buf_carry <= '0';
      elsif i_and_select = '1' then
			buf_result <= i_a_register and i_b_register;
			buf_carry <= '0';
		else
			buf_result <= i_a_register and i_b_register;
			buf_carry <= '0';
		end if;
   end process;
	o_carry <= buf_carry;
	o_overflow <= buf_carry xor ((buf_carry and (buf_result(7) or (not i_a_register(7)) or (not i_b_register(7)))) 
										or (buf_result(7) and (not i_a_register(7)) and (not i_b_register(7))));
	o_result <= buf_result;
end Behavioral;
