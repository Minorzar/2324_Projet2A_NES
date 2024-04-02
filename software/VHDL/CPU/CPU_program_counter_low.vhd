library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity CPU_program_counter_low is
	Port(
		i_clk: in STD_LOGIC;
		i_phi2: in STD_LOGIC;
		i_adl_to_pcl: in STD_LOGIC;
      i_pcl_increment: in STD_LOGIC;
      i_pcl_reload: in STD_LOGIC;
		i_adl_bus: in STD_LOGIC_VECTOR (7 downto 0);
      o_carry: out STD_LOGIC;
		o_reg_out: out STD_LOGIC_VECTOR (7 downto 0));
end CPU_program_counter_low;

architecture Behavioral of CPU_program_counter_low is
   signal reg_pcl_select: STD_LOGIC_VECTOR (7 downto 0):= x"FC";
	signal reg_pcl_inc: STD_LOGIC_VECTOR (7 downto 0):= x"FC";
	signal reg_pcl: STD_LOGIC_VECTOR (7 downto 0):= x"FC";
begin
	process(i_clk)
	begin
		if (rising_edge(i_clk)) then
			if i_pcl_reload = '1' then
				reg_pcl_select <= reg_pcl;
			elsif i_adl_to_pcl = '1' then
				reg_pcl_select <= i_adl_bus;
			end if;
			if i_phi2 = '1' then
				reg_pcl <= reg_pcl_inc;
			end if;
		end if;
	end process;
	process(reg_pcl_select, i_pcl_increment)
	begin
		if(reg_pcl_select = "11111111" and i_pcl_increment = '1') then
				reg_pcl_inc <= "00000000";
				o_carry <='1';
		else
		o_carry <= '0';
			if i_pcl_increment = '1' then
				reg_pcl_inc <= std_logic_vector(unsigned(reg_pcl_select) + 1);
			else
				reg_pcl_inc <= reg_pcl_select;
			end if;
		end if;
	end process;
	o_reg_out <= reg_pcl;
end Behavioral;