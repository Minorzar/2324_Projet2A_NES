library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_pullup is
	Port(
		io_d_bus: inout STD_LOGIC_VECTOR(7 downto 0);
		io_s_bus: inout STD_LOGIC_VECTOR(7 downto 0);
		io_adl_bus: inout STD_LOGIC_VECTOR(7 downto 0);
		io_adh_bus: inout STD_LOGIC_VECTOR(7 downto 0));
end CPU_pullup;

architecture Dataflow of CPU_pullup is
begin
	process(io_d_bus)
	begin
		for i in 0 to 7 loop
			if io_d_bus(i) = 'Z' then
				io_d_bus(i) <= '1';
			else io_d_bus(i) <= 'Z';
			end if;
		end loop;
	end process;
	
	process(io_s_bus)
	begin
		for i in 0 to 7 loop
			if io_s_bus(i) = 'Z' then
				io_s_bus(i) <= '1';
			else io_s_bus(i) <= 'Z';
			end if;
		end loop;
	end process;
	
	process(io_adl_bus)
	begin
		for i in 0 to 7 loop
			if io_adl_bus(i) = 'Z' then
				io_adl_bus(i) <= '1';
			else io_adl_bus(i) <= 'Z';
			end if;
		end loop;
	end process;
	
	process(io_adh_bus)
	begin
		for i in 0 to 7 loop
			if io_adh_bus(i) = 'Z' then
				io_adh_bus(i) <= '1';
			else io_adh_bus(i) <= 'Z';
			end if;
		end loop;
	end process;
	
end Dataflow;