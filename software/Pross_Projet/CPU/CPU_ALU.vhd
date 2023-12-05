library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

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
		o_output: out unsigned (7 downto 0);
		o_half_carry: out STD_LOGIC;
      o_carry: out STD_LOGIC;
		o_negative: out STD_LOGIC;
      o_overflow: out STD_LOGIC;
		o_zero: out STD_LOGIC);

end CPU_ALU;

architecture Behavioral of CPU_ALU is
begin
	process(i_clk)
		variable output_add_temp: unsigned (8 downto 0);
		variable a_add_temp:unsigned (8 downto 0);
		variable b_add_temp:unsigned (8 downto 0);
		variable output_temp: unsigned (7 downto 0);
		begin
			if (rising_edge(i_clk)) then
				if i_sum_select='1' then
					a_add_temp := '0' & i_a_register;
					b_add_temp := '0' & i_b_register;
					if i_carry ='1' then
						output_add_temp:= a_add_temp+b_add_temp+"00000001";
					else
						output_add_temp:= a_add_temp+b_add_temp;
					end if;
					output_temp:= output_add_temp(7 downto 0);
					o_carry<= output_add_temp(8);
					o_overflow<= output_add_temp(8) xor (((i_a_register(7) nand i_b_register(7)) and output_add_temp(8)) or
					((i_a_register(7) nor i_b_register(7)) and output_add_temp(7)));
				elsif i_and_select='1' then
					output_temp:= i_a_register and i_b_register;
				elsif i_eor_select='1' then
					output_temp:= i_a_register xor i_b_register;
				elsif i_or_select='1' then
					output_temp:=i_a_register or i_b_register;
				elsif i_shift_right_select ='1' then
					output_temp:= '0' & i_a_register(7 downto 1);
					o_carry <= i_a_register(0);
				end if;
				o_output <= output_temp;
				o_negative <= output_temp(7);
				if i_a_register = "00000000" then
					o_zero <= '1';
				else
					o_zero <= '0';
				end if;
			end if;
		end process;
end Behavioral;