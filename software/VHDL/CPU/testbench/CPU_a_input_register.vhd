library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity CPU_a_input_register_tb is
end CPU_a_input_register_tb ;

architecture testbench of CPU_a_input_register_tb is

	component CPU_a_input_register
		
		port(
			i_clk			: in STD_LOGIC ;
			i_sb_to_add : in STD_LOGIC ;
			i_O_to_add	: in STD_LOGIC ;
			i_s_bus		: in unsigned (7 downto 0) ;
			o_output		: out unsigned (7 downto 0)
		) ;
		
	end component ;
	
	constant clk_period : time := 500ns ;
	
	signal Si_clk			: STD_LOGIC ;
	signal Si_sb_to_add	: STD_LOGIC ;
	signal Si_O_to_add	: STD_LOGIC ;
	signal Si_s_bus		: unsigned (7 downto 0) ;
	signal So_output		: unsigned (7 downto 0) ;
	
begin

	module : CPU_a_input_register
				
				port map(
					i_clk => Si_clk,
					i_sb_to_add => Si_sb_to_add,
					i_O_to_add => Si_O_to_add,
					i_s_bus => Si_s_bus,
					o_output => So_output
				) ;
					
	clk_process : process
	begin
	
		Si_clk <= '1' ;
		wait for clk_period/2 ;
		Si_clk <= '0' ;
		wait for clk_period/2 ;
		
	end process ;
	
	testbench_process : process
	begin
	
		-- init
		Si_s_bus <= "10101010" ;
		Si_o_to_add <= '0' ;
		Si_sb_to_add <= '0' ;
		
		wait for 1ms ;
		
		-- sb_to_add high
		Si_sb_to_add <= '1' ;
		
		wait for 1ms ;
		
		--o_to_add high
		Si_sb_to_add <= '0' ;
		Si_o_to_add <= '1' ;
		
		wait for 1ms ;
		
	end process ;
	
end testbench ;
		