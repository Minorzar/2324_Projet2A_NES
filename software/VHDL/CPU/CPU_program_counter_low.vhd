library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity CPU_program_counter_low is
	Port(
		i_clk: in STD_LOGIC;
		i_adl_to_pcl: in STD_LOGIC;
		i_pcl_to_adl: in STD_LOGIC;
		i_pcl_to_db: in STD_LOGIC;
      i_pcl_increment: in STD_LOGIC;
      i_pcl_reload: in STD_LOGIC;
      o_carry: out STD_LOGIC;
		o_d_bus: out unsigned (7 downto 0);
		io_adl_bus: inout unsigned (7 downto 0));
end CPU_program_counter_low;

architecture Behavioral of CPU_program_counter_low is
	signal pcl_reg: unsigned (7 downto 0);
    signal reg_pcl_select: unsigned (7 downto 0);
begin
	process(i_clk)
		begin
			if (rising_edge(i_clk)) then
				if i_adl_to_pcl = '1' then
					reg_pcl_select <= io_adl_bus;
				end if;

                if i_pcl_increment = '1' then
                    pcl_reg <= reg_pcl_select + 1;
                    if reg_pcl_select = "11111111" then
                       o_carry <= '1';
                    else
                        o_carry <= '0';
                    end if;
                else pcl_reg <= reg_pcl_select;
                    o_carry <= '0';
                end if;

                if i_pcl_reload = '1' then
                    reg_pcl_select <= pcl_reg;
						  end if;
			end if;
		end process;

    io_adl_bus <= pcl_reg when i_pcl_to_adl = '1' else
		(others => 'Z');

	o_d_bus <= pcl_reg when i_pcl_to_db = '1' else
		(others => 'Z');
end Behavioral;