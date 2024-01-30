library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_ready_control is
	Port(
		i_clk: in STD_LOGIC;
		i_phi2: in STD_LOGIC;
		i_ready: in STD_LOGIC;
		i_read_write: in STD_LOGIC;
		o_rdy: out STD_LOGIC);
end CPU_ready_control;

architecture Behavioral of CPU_ready_control is
begin
	process(i_clk)
	begin
		if rising_edge(i_clk) then
			if i_phi2 = '1' then
				if i_read_write = '0' then
					o_rdy <= '1';
				else
					o_rdy <= i_ready;
				end if;
			end if;
		end if;
	end process;
end Behavioral;