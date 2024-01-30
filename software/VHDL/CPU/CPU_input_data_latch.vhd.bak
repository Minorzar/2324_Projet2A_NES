library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_input_data_latch is
	Port(
		i_clk: in STD_LOGIC;
		i_phi2: in STD_LOGIC;
		i_dl_to_db: in STD_LOGIC;
		i_dl_to_adl: in STD_LOGIC;
		i_dl_to_adh: in STD_LOGIC;
		i_data_bus: in unsigned (7 downto 0);
		o_d_bus: out unsigned (7 downto 0);
		o_adl_bus: out unsigned (7 downto 0);
		o_adh_bus: out unsigned (7 downto 0));
end CPU_input_data_latch;

architecture Behavioral of CPU_input_data_latch is
	signal reg_dl: unsigned (7 downto 0);
begin
	process(i_clk)
	begin
		if (rising_edge(i_clk)) then
			if i_phi2 = '1' then 
				reg_dl <= i_data_bus;
			end if;
		end if;
	end process;
	
	o_d_bus <= reg_dl when i_dl_to_db = '1' else
		(others => 'Z');
	o_adl_bus <= reg_dl when i_dl_to_adl = '1' else
		(others => 'Z');
	o_adh_bus <= reg_dl when i_dl_to_adh = '1' else
		(others => 'Z');
	
	
end Behavioral;