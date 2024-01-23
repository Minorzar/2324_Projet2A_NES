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
	signal reg_pch: unsigned (7 downto 0);
    signal reg_pch_select: unsigned (7 downto 0);
begin
	process(i_clk)
		begin
			if (rising_edge(i_clk)) then
				if i_adh_to_pch = '1' then
					reg_pch_select <= io_adh_bus;
				end if;
                
                if i_pcl_carry = '1' then
                    reg_pch <= reg_pch_select + 1;
                    end if;
                else reg_pch <= reg_pch_select;
                end if;

                if i_pch_reload = '1' then
                    reg_pch_select <= reg_pch;
			end if;
		end process;

    io_adh_bus <= reg_pch when i_pch_to_adh = '1' else
		(others => 'Z');

	o_d_bus <= reg_pch when i_pch_to_db = '1' else
		(others => 'Z');
end Behavioral;