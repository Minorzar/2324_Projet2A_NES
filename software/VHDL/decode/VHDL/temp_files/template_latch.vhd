-- template_latch.vhd
--
-- This VHDL module implements a latch.
--
-- Description:
-- Data is loaded into the latch when the load signal is asserted on the rising edge.
--
-- Usage:
-- predecode_register.vhd
-- instruction_register.vhd

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity template_latch is
	port (
		load		: in std_logic;						-- Input signal indicating when to load data into the latch
		data_in		: in std_logic_vector(7 downto 0);	-- Input data to be loaded into the latch
		data_out	: out std_logic_vector(7 downto 0)	-- Output data from the latch
	);
end entity template_latch;

architecture Behavioral of template_latch is
begin
	process (load, data_in)
	begin
		if rising_edge(load) then
			-- Load data into the latch
			data_out <= data_in;
		end if;
	end process;
end architecture Behavioral;
