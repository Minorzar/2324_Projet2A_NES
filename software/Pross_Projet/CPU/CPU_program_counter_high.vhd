library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity CPU_program_counter_high is
	Port(
		i_clk: in STD_LOGIC;
		i_adh_to_pch: in STD_LOGIC;
		i_pch_to_adh: in STD_LOGIC;
		i_pch_to_db: in STD_LOGIC;
        i_pcl_carry: in STD_LOGIC;
        i_pch_reload: in STD_LOGIC;
		o_d_bus: out unsigned (7 downto 0);
		io_adh_bus: inout unsigned (7 downto 0));
end CPU_program_counter_high;

architecture Behavioral of CPU_program_counter_high is
	signal pch_reg: unsigned (7 downto 0);
    signal pch_select_reg: unsigned (7 downto 0);
begin
	process(i_clk)
		begin
			if (rising_edge(i_clk)) then
				if i_adh_to_pcl = '1' then
					pch_select_reg <= io_adl_bus;
				end if;
                
                if i_pcl_carry = '1' then
                    pch_reg <= pch_select_reg + 1;
                    end if;
                else pch_reg = pch_select_reg;
                end if;

                if i_pch_reload = '1' then
                    pch_select_reg <= pch_reg;
			end if;
		end process;

    io_adl_bus <= pch_reg when i_pch_to_adh = '1' else
		(others => 'Z');

	o_d_bus <= pch_reg when i_pch_to_db = '1' else
		(others => 'Z');
end Behavioral;