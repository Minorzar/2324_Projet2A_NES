entity predecode_register is
	Port (
		i_databus : in STD_LOGIC_VECTOR(7 downto 0);					-- Input data bus
		i_clk : in STD_LOGIC;												-- Clock signal
		i_clear_buffer : in STD_LOGIC;									-- Clear signal for the buffer
		o_predecode_buffer : out STD_LOGIC_VECTOR(7 downto 0)		-- Output predecode buffer
	);
end predecode_register;

architecture Behavioral of predecode_register is
	signal s_predecode_buffer : unsigned(7 downto 0) := (others => '0');
begin
	-- Main process
	process(i_clk, i_clear_buffer)
	begin
		if i_clear_buffer = '1' then
			-- Reset the buffer in case of an active clear signal
			s_predecode_buffer <= (others => '0');
		elsif rising_edge(i_clk) then
			-- Load the buffer with data from the data bus
			s_predecode_buffer <= unsigned(i_databus);
		end if;
	end process;

	-- Output the buffer
	o_predecode_buffer <= std_logic_vector(s_predecode_buffer);

end Behavioral;
