library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity CPU_data_output_register_buffer_tb is
end CPU_data_output_register_buffer_tb ;

architecture testbench of CPU_data_output_register_buffer_tb is

	component CPU_data_output_register_buffer
	
		port(
		
			i_clk 			: in std_logic ;
			i_phi1 			: in std_logic ;
			i_phi2 			: in std_logic ;
			i_read_write 	: in std_logic ;
			i_d_bus 			: in unsigned(7 downto 0) ;
			o_data_bus 		: out unsigned(7 downto 0)
		
		) ;
		
	end component ;
	
	constant clk_period 	: time := 250ns ;
	
	signal Si_clk 			: std_logic ;
	signal Si_phi1 		: std_logic ;
	signal Si_phi2 		: std_logic ;
	signal Si_read_write : std_logic ;
	signal Si_d_bus 		: unsigned(7 downto 0) ;
	signal So_data_bus 	: unsigned(7 downto 0) ;
	
	begin
	
		module : CPU_data_output_register_buffer
					
					port map(
					
						i_clk 			=> Si_clk,
						i_phi1			=> Si_phi1,
						i_phi2 			=> Si_phi2,
						i_read_write 	=> Si_read_write,
						i_d_bus 			=> Si_d_bus,
						o_data_bus 		=> So_data_bus
					
					) ;
					
		clk_process 		: process
			begin
			
				-- H for clk and phi1, L for phi2
				Si_clk 	<= '1' ;
				Si_phi1 	<= '1' ;
				Si_phi2 	<= '0' ;
				
				wait for clk_period/2 ;
				
				-- L for clk, no changes for phi(1,2)
				Si_clk 	<= '0' ;
				
				wait for clk_period/2 ;
				
				-- H for clk and phi2, L for phi1
				Si_clk 	<= '1' ;
				Si_phi1 	<= '0' ;
				Si_phi2 	<= '1' ;
				
				wait for clk_period/2 ;
				
				-- L for clk, no changes for phi(1,2)
				Si_clk 	<= '0' ;
				
				wait for clk_period/2 ;
			
			end process ;
			
		
		testbench_process : process
			begin
				
				-- initialisation
				Si_d_bus <= "10101010" ;
				Si_read_write <= '1' ;
				
				wait for 500ns ;
				
				-- change d_bus and read_write to 1
				Si_d_bus <= "01010101" ;
				
				wait for 500ns ;
				
				-- keep new value of d_bus and read_write to 0
				Si_read_write <= '0' ;
				
				wait for 500ns ;
				
			end process ;
			
end testbench ;