library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;



entity CPU_ALU_tb is
end CPU_ALU_tb ;



architecture testbench of CPU_ALU_tb is

	component CPU_ALU
		
		port(
			i_a_register: in unsigned (7 downto 0);
			i_b_register: in unsigned (7 downto 0);
			i_clk: in STD_LOGIC;
			i_sum_select: in STD_LOGIC;
			i_and_select: in STD_LOGIC;
			i_eor_select: in STD_LOGIC;
			i_or_select: in STD_LOGIC;
			i_shift_right_select: in STD_LOGIC;
			i_carry: in STD_LOGIC;
			b_result: buffer unsigned (7 downto 0);
			b_carry: buffer STD_LOGIC;
			o_overflow: out STD_LOGIC
		);
		
	end component ;
	
	constant clk_period : time := 500ns ;
	
	signal Si_a_register : unsigned (7 downto 0) ;
	signal Si_b_register : unsigned (7 downto 0) ;
	signal Si_clk : std_logic ;
	signal Si_sum_select : std_logic ;
	signal Si_and_select : std_logic ;
	signal Si_eor_select : std_logic ;
	signal Si_or_select : std_logic ;
	signal Si_shift_right_select : std_logic ;
	signal Si_carry : std_logic ;
	
	signal Sb_result : unsigned (7 downto 0) ;
	signal Sb_carry : std_logic ;
	
	signal So_overflow : std_logic ;
	
begin
	
	module : CPU_ALU
				port map(
					i_a_register => Si_a_register,
					i_b_register => Si_b_register,
					i_clk => Si_clk,
					i_sum_select => Si_sum_select,
					i_and_select => Si_and_select,
					i_eor_select => Si_eor_select,
					i_or_select => Si_or_select,
					i_shift_right_select => Si_shift_right_select,
					i_carry => Si_carry,
					b_result => Sb_result,
					b_carry => Sb_carry,
					o_overflow => So_overflow
				);
				
	clk_process : process
	begin
	
		Si_clk <= '1' ;
		wait for clk_period/2 ;
		Si_clk <= '0' ;
		wait for clk_period/2 ;
		
	end process ;
	
	testbench_process : process
	begin
	
		-- nothing test:
		Si_sum_select <= '0' ;
		Si_and_select <= '0' ;
		Si_eor_select <= '0' ;
		Si_or_select <= '0' ;
		Si_shift_right_select <= '0' ;
		
		-- with carry
		Si_a_register <= "10101010" ;
		Si_b_register <= "01010101" ;
		Si_carry <= '1' ;
		
		wait for 1ms ;
		
		-- without carry
		Si_carry <= '0' ;
	
	
		wait for 1ms ;
	
		-- add test:
		Si_sum_select <= '1' ;
	
		-- add with carry with carry out
		Si_a_register <= "10101010" ;
		Si_b_register <= "01010101" ;
		Si_carry <= '1' ;
		
		wait for 1ms ;
		
		-- add with carry without carry out
		Si_a_register <= "10101000" ;
		Si_b_register <= "00000010" ;
		
		wait for 1ms ;
		
		-- add without carry with carry out
		Si_a_register <= "11111111" ;
		Si_b_register <= "00000011" ;
		Si_carry <= '0' ;
		
		wait for 1ms ;
		
		-- add without carry without carry out
		Si_a_register <= "10101000" ;
		Si_b_register <= "00010010" ;
		
		wait for 1ms ;
		
		-- add with overflow
		Si_carry <= '0' ;
		Si_a_register <= "01000000" ;
		Si_b_register <= "01000000" ;
		
		
		wait for 1ms ;
		
		-- and test:
		Si_sum_select <= '0' ;
		Si_and_select <= '1' ;
		
		Si_a_register <= "10101010" ;
		Si_b_register <= "01110111" ;
		
		
		wait for 1ms ;
		
		-- or test:
		Si_and_select <= '0' ;
		Si_or_select <= '1' ;
		
		Si_a_register <= "10101010" ;
		Si_b_register <= "01000100" ;
		
		
		wait for 1ms ;
		
		-- xor test:
		Si_or_select <= '0' ;
		Si_eor_select <= '1' ;
		
		Si_a_register <= "10101010" ;
		Si_b_register <= "11001100" ;
	
		
		wait for 1ms ;
		
		-- shift right test:
		Si_eor_select <= '0' ;
		Si_shift_right_select <= '1' ;
		
		Si_a_register <= "10101010" ;
		Si_b_register <= "10101010" ;
		
		wait for 1ms ;
		
	end process ;
	
end testbench ;
		
		