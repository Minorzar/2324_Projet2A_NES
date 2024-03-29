library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_pullup is
	Port(
		io_d_bus: inout unsigned(7 downto 0);
		io_s_bus: inout unsigned(7 downto 0);
		io_adl_bus: inout unsigned(7 downto 0);
		io_adh_bus: inout unsigned(7 downto 0));
end CPU_pullup;

architecture Dataflow of CPU_pullup is
begin
end Dataflow;