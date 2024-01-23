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
      o_overflow: out STD_LOGIC);

end CPU_ALU;

architecture Behavioral of CPU_ALU is
begin
	process(i_clk)
		begin
			if (rising_edge(i_clk)) then
			end if;
		end process;
end Behavioral;