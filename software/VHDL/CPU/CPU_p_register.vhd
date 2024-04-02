library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_p_register is
	Port(
		i_clk: in STD_LOGIC;
		i_ir5: in STD_LOGIC;
		i_acr: in STD_LOGIC;
		i_avr: in STD_LOGIC;
		i_db0_to_c: in STD_LOGIC;
		i_ir5_to_c: in STD_LOGIC;
		i_acr_to_c: in STD_LOGIC;
		i_db1_to_z: in STD_LOGIC;
		i_dbz_to_z: in STD_LOGIC;
		i_db2_to_i: in STD_LOGIC;
		i_ir5_to_i: in STD_LOGIC;
		i_db3_to_d: in STD_LOGIC;
		i_ir5_to_d: in STD_LOGIC;
		i_db6_to_v: in STD_LOGIC;
		i_avr_to_v: in STD_LOGIC;
		i_i_to_v: in STD_LOGIC;
		i_O_to_v: in STD_LOGIC;
		i_db7_to_n: in STD_LOGIC;
		i_d_bus: in STD_LOGIC_VECTOR (7 downto 0);
		o_reg_out: out STD_LOGIC_VECTOR(7 downto 0):= "00101100");
end CPU_p_register;

architecture Behavioral of CPU_p_register is
begin
	o_reg_out(5) <= '1';
	o_reg_out(4) <= '1';
	process(i_clk)
		begin
			if (rising_edge(i_clk)) then
				if i_db0_to_c = '1' then
					o_reg_out(0) <= i_d_bus(0);
				elsif i_ir5_to_c = '1' then
					o_reg_out(0) <= i_ir5;
				elsif i_acr_to_c = '1' then
						o_reg_out(0) <= i_acr;
				end if;
				if i_db1_to_z = '1' then
					o_reg_out(1) <= i_d_bus(1);
				elsif i_dbz_to_z = '1' then
					if i_d_bus = "00000000" then
						o_reg_out(1) <= '1';
					else o_reg_out(1) <= '0';
					end if;
				end if;
				if i_db2_to_i = '1' then
					o_reg_out(2) <= i_d_bus(2);
				elsif i_ir5_to_i = '1' then
					o_reg_out(2) <= i_ir5;
				end if;
				if i_db3_to_d = '1' then
					o_reg_out(3) <= i_d_bus(3);
				elsif i_ir5_to_d = '1' then
					o_reg_out(3) <= i_ir5;
				end if;
				if i_db6_to_v = '1' then
					o_reg_out(6) <= i_d_bus(6);
				elsif i_avr_to_v = '1' then
					o_reg_out(6) <= i_avr;
				elsif i_i_to_v = '1' then
					o_reg_out(6) <= '1';
				elsif i_O_to_v = '1' then
					o_reg_out(6) <= '0';
				end if;
				if i_db7_to_n = '1' then
					o_reg_out(7) <= i_d_bus(7);
				end if;
			end if;
		end process;

end Behavioral;