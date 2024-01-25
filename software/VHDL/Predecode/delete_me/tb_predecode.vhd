-- tb_predecode.vhd

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_predecode is
end tb_predecode;

architecture Behavioral of tb_predecode is
	signal tb_i_clk : STD_LOGIC := '0';
	signal tb_i_instruction : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal tb_i_status_register : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal tb_o_active_instruction : STD_LOGIC_VECTOR(5 downto 0);
	signal tb_o_addressing_mode : STD_LOGIC_VECTOR(2 downto 0);
	signal tb_o_register_select : STD_LOGIC_VECTOR(1 downto 0);

	constant clock_period : time := 10 ns;

begin
	-- Instantiate the predecode module
	uut_predecode : entity work.predecode
		port map (
			i_clk => tb_i_clk,
			i_instruction => tb_i_instruction,
			i_status_register => tb_i_status_register,
			o_active_instruction => tb_o_active_instruction,
			o_addressing_mode => tb_o_addressing_mode,
			o_register_select => tb_o_register_select
		);

    -- Clock process
    clk_process: process
    begin
        while now < 1000 ns loop
            tb_i_clk <= not tb_i_clk;
            wait for clock_period / 2;
        end loop;
        wait;
    end process;

	-- Stimulus process
	stimulus_process: process
	begin
		tb_i_status_register <= (others => '0');
		wait for 100 ns;

		tb_i_instruction <= "00101001";			-- AND (#immediate) / 000001
		wait for 100 ns;

		tb_i_instruction <= "01001001";			-- EOR (#immediate) / 000010
		wait for 100 ns;

		tb_i_instruction <= "01101001";			-- ADC (#immediate) / 000011
		wait for 100 ns;
		
		tb_i_instruction <= "10111101";			-- LDA a,X (000101, 001, 01)
		wait for 100 ns;

		tb_i_status_register <= "00000000";		-- Zero status flag
		tb_i_instruction <= "11010000";			-- BNE (011101)
		wait for 100 ns;

		tb_i_status_register <= "11111101";		-- Zero status flag
		tb_i_instruction <= "11010000";			-- BNE (011101)
		wait for 100 ns;

		tb_i_status_register <= "11111111";		-- N/A
		tb_i_instruction <= "11010000";			-- N/A
		wait for 100 ns;

		tb_i_status_register <= "00000010";		-- Zero status flag
		tb_i_instruction <= "11110000";			-- BEQ (011110)
		wait for 100 ns;

		tb_i_status_register <= "00000000";		-- N/A
		tb_i_instruction <= "11110000";			-- N/A
		wait for 100 ns;

		tb_i_instruction <= "00000000";

	end process;

end Behavioral;
