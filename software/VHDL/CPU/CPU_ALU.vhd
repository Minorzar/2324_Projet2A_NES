library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_ALU is
   Port (
      i_a_register         : in  unsigned(7 downto 0);
      i_b_register         : in  unsigned(7 downto 0);
      i_clk                : in  STD_LOGIC;
      i_sum_select         : in  STD_LOGIC;
      i_and_select         : in  STD_LOGIC;
      i_eor_select         : in  STD_LOGIC;
      i_or_select          : in  STD_LOGIC;
      i_shift_right_select : in  STD_LOGIC;
      i_carry              : in  STD_LOGIC;
      o_result             : out unsigned(7 downto 0);
      o_carry              : out STD_LOGIC;
      o_overflow           : out STD_LOGIC);
end CPU_ALU;

architecture Behavioral of CPU_ALU is
   signal result_temp  : unsigned(8 downto 0);
	signal buf_result: unsigned(7 downto 0);
	signal buf_carry:STD_LOGIC;
begin
   process(i_clk)
   begin
      if rising_edge(i_clk) then
         if i_sum_select = '1' then
            if i_carry = '1' then
               result_temp <= ('0' & i_a_register) + ('0' & i_b_register) + "00000001";
            else
               result_temp <= ('0' & i_a_register) + ('0' & i_b_register);
            end if;
            buf_carry <= result_temp(8);
            buf_result <= result_temp(7 downto 0);
         elsif i_and_select = '1' then
            buf_result <= i_a_register and i_b_register;
         elsif i_eor_select = '1' then
            buf_result <= i_a_register xor i_b_register;
         elsif i_or_select = '1' then
            buf_result <= i_a_register or i_b_register;
         elsif i_shift_right_select = '1' then
            buf_result <= '0' & (i_a_register(7 downto 1) and i_b_register(7 downto 1));
         end if;
         o_overflow <= buf_carry xor ((buf_carry and (buf_result(7) or (not i_a_register(7)) or (not i_b_register(7)))) 
										or (buf_result(7) and (not i_a_register(7)) and (not i_b_register(7))));
      end if;
   end process;
	o_carry <= buf_carry;
	o_result <= buf_result;
end Behavioral;
