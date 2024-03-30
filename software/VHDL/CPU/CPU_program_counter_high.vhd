library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity CPU_program_counter_high is
	Port(
		i_clk: in STD_LOGIC;
		i_phi2: in STD_LOGIC;
		i_adh_to_pch: in STD_LOGIC;
      i_pcl_carry: in STD_LOGIC;
      i_pch_reload: in STD_LOGIC;
		i_adh_bus: in STD_LOGIC_VECTOR (7 downto 0);
		o_reg_out : out STD_LOGIC_VECTOR (7 downto 0));
end CPU_program_counter_high;

architecture Behavioral of CPU_program_counter_high is
	signal reg_pch_select: STD_LOGIC_VECTOR (7 downto 0):= x"FF";
	signal reg_pch_inc: STD_LOGIC_VECTOR (7 downto 0):= x"FF";
	signal reg_pch: STD_LOGIC_VECTOR (7 downto 0):= x"FF";
begin
	process(i_clk)
		begin
			if (rising_edge(i_clk)) then
				if i_pch_reload = '1' then
					reg_pch_select <= reg_pch;
				elsif i_adh_to_pch = '1' then
					reg_pch_select <= i_adh_bus;
				end if;
				if(reg_pch_select = "11111111" and i_pcl_carry = '1') then
					reg_pch_inc <= "00000000";
				else
					if i_pcl_carry = '1' then
						reg_pch_inc <= std_logic_vector(unsigned(reg_pch_select) + 1);
					else
						reg_pch_inc <= reg_pch_select;
					end if;
				end if;
				if i_phi2 = '1' then
					reg_pch <= reg_pch_inc;
				end if;
			end if;
		end process;
	o_reg_out <= reg_pch;
end Behavioral;