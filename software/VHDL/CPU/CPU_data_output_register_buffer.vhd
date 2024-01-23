library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_data_output_register_buffer is
	Port(
		i_clk: in STD_LOGIC;
		i_phi1: in STD_LOGIC;
		i_phi2: in STD_LOGIC;
		i_read_write: in STD_LOGIC;
		i_d_bus: in unsigned (7 downto 0);
		o_data_bus: out unsigned (7 downto 0));
end CPU_data_output_register_buffer;

architecture Behavioral of CPU_data_output_register_buffer is
	signal reg_data_out: unsigned (7 downto 0);
begin
	process(i_clk)
	begin
		if (rising_edge(i_clk)) then
			if i_phi1 = '1' then
				reg_data_out <= i_d_bus;
			end if;
		end if;
	end process;
	o_data_bus <= reg_data_out when i_phi2 = '1' and i_read_write = '0' else
		(others => 'Z');
end Behavioral;