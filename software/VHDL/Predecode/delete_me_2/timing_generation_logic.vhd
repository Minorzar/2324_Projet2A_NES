library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity timing_generation_logic is
	Port (
		i_clk : in STD_LOGIC;									-- Clock signal
		i_cycles_required : in UNSIGNED(3 downto 0);		-- Number of cycles required for the instruction
		o_instruction_complete : out STD_LOGIC				-- Instruction complete signal
	);
end timing_generation_logic;

architecture Behavioral of timing_generation_logic is
	signal s_cycle_count : UNSIGNED(3 downto 0) := "0000";  -- Initialize to 0
begin
	process(i_clk)
	begin
		if rising_edge(i_clk) then
			-- Decrement cycle count until it reaches 0
			if s_cycle_count /= "0000" then
				s_cycle_count <= s_cycle_count - 1;
			end if;

			-- Output instruction complete signal when the cycle count reaches 0
			if s_cycle_count = "0000" then
				o_instruction_complete <= '1';
			end if;
		end if;
	end process;
end Behavioral;
