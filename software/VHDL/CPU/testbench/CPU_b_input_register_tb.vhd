library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity CPU_b_input_register_tb is
end CPU_b_input_register_tb ;

architecture testbench of CPU_b_input_register_tb is

	component CPU_b_input_register is
	
		port(
		
			i_clk 				: in std_logic ;
			i_adl_to_add 		: in std_logic ;
			i_db_to_add 		: in std_logic ;
			i_db_bar_to_add 	: in std_logic ;
			i_d_bus 				: in unsigned(7 downto 0) ;
			i_adl_bus 			: in unsigned(7 downto 0) ;
			o_output 			: out unsigned(7 downto 0)
			
		) ;
		
	end component ;
	
	constant clk_period 		: time := 250ns ;
	
	signal Si_clk 				: std_logic ;
	signal Si_adl_to_add 	: std_logic ;
	signal Si_db_to_add 		: std_logic ;
	signal Si_db_bar_to_add : std_logic ;
	signal Si_d_bus 			: unsigned(7 downto 0) ;
	signal Si_adl_bus 		: unsigned(7 downto 0) ;
	signal So_output 			: unsigned(7 downto 0) ;
	
	
	begin
	
		module : CPU_b_input_register
					port map(
					
						i_clk 				=> Si_clk,
						i_adl_to_add 		=> Si_adl_to_add,
						i_db_to_add 		=> Si_db_to_add,
						i_db_bar_to_add 	=> Si_db_bar_to_add,
						i_d_bus 				=> Si_d_bus,
						i_adl_bus 			=> Si_adl_bus,
						o_output 			=> So_output
						
					) ;
					
		clk_process : process
			begin
			
				Si_clk <= '1' ;
				wait for clk_period/2 ;
				Si_clk <= '0' ;
				wait for clk_period/2 ;
				
			end process ;
			
		testbech_process : process
			begin
			
				-- initialisation
				Si_d_bus <= "10101010" ;
				Si_adl_bus <= "11110000" ;
				
				-- case adl
				Si_db_bar_to_add <= '0' ;
				Si_adl_to_add <= '1' ;
				Si_db_to_add <= '0' ;
				
				wait for 500ns ;
				
				-- case db
				Si_adl_to_add <= '0' ;
				Si_db_to_add <= '1' ;
				
				wait for 500ns ;
				
				-- case db bar
				Si_db_to_add <= '0' ;
				Si_db_bar_to_add <= '1' ;
				
				wait for 500ns ;
				
			end process ;
			
end testbench ;