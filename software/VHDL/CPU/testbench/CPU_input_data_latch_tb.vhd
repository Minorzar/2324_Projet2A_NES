library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity CPU_input_data_latch_tb is
end CPU_input_data_latch_tb ;

architecture testbench of CPU_input_data_latch_tb is

	component CPU_input_data_latch is
		
		port(
		
			i_clk 		: in std_logic ;
			i_phi2 		: in std_logic ;
			i_dl_to_db 	: in std_logic ;
			i_dl_to_adl : in std_logic ;
			i_dl_to_adh : in std_logic ;
			i_data_bus 	: in unsigned(7 downto 0) ;
			o_d_bus 		: out unsigned(7 downto 0) ;
			o_adl_bus 	: out unsigned(7 downto 0) ;
			o_adh_bus 	: out unsigned(7 downto 0)
			
		) ;
	
	end component ;
	
	constant clk_period 	: time := 250ns ;
	
	signal Si_clk 			: std_logic ;
	signal Si_phi2 		: std_logic ;
	signal Si_dl_to_db 	: std_logic ;
	signal Si_dl_to_adl 	: std_logic ;
	signal Si_dl_to_adh 	: std_logic ;
	signal Si_data_bus 	: unsigned(7 downto 0) ;
	signal So_d_bus 		: unsigned(7 downto 0) ;
	signal So_adl_bus 	: unsigned(7 downto 0) ;
	signal So_adh_bus 	: unsigned(7 downto 0) ;
	
	begin
	
		module : CPU_input_data_latch
					
					port map(
					
						i_clk 			=> Si_clk,
						i_phi2 			=> Si_phi2,
						i_dl_to_db 		=> Si_dl_to_db,
						i_dl_to_adl 	=> Si_dl_to_adl,
						i_dl_to_adh 	=> Si_dl_to_adh,
						i_data_bus 		=> Si_data_bus,
						o_d_bus 			=> So_d_bus,
						o_adl_bus 		=> So_adl_bus,
						o_adh_bus 		=> So_adh_bus
						
					) ;
					
					
		clk_process : process
			begin
			
				Si_clk <= '1' ;
				Si_phi2 <= '0' ;
				
				wait for clk_period/2 ;
				
				Si_clk <= '0' ;
				
				wait for clk_period/2 ;
				
				Si_clk <= '1' ;
				Si_phi2 <= '1' ;
				
				wait for clk_period/2 ;
				
				Si_clk <= '0' ;
				
				wait for clk_period/2 ;
				
			end process ;
			
			
		testbench_process : process
			begin
			
				-- Initialisation
				Si_data_bus <= "10101010" ;
				Si_dl_to_db <= '0' ;
				Si_dl_to_adl <= '0' ;
				Si_dl_to_adh <= '0' ;
				
				wait for 500ns ;
				
				-- only dl_to_db on
				Si_dl_to_db <= '1' ;
				
				wait for 500ns ;
				
				-- adl and db on
				Si_dl_to_adl <= '1' ;
				
				wait for 500ns ;
				
				-- all on 
				Si_dl_to_adh <= '1' ;
				
				wait for 500ns ;
				
				-- db and adl on
				Si_dl_to_adh <= '0' ;
				
				wait for 500ns ;
				
				-- db and adh on
				Si_dl_to_adl <= '0' ;
				Si_dl_to_adh <= '1' ;
				
				wait for 500ns ;
				
				-- adl and adh on
				Si_dl_to_db <= '0' ;
				Si_dl_to_adl <= '1' ;
				
				wait for 500ns ;
				
				-- only adl on
				Si_dl_to_adh <= '0' ;
				
				wait for 500ns ;
				
				-- only adh on
				Si_dl_to_adl <= '0' ;
				Si_dl_to_adh <= '1' ;
				
				wait for 500ns ;
				
			end process ;
			
end testbench ;
				