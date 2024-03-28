library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity CPU_program_counter_low_tb is
end CPU_program_counter_low_tb ;

architecture testbench of CPU_program_counter_low_tb is

	component CPU_program_counter_low
		port(
			
			i_clk 				: in std_logic ;
			i_adl_to_pcl 		: in std_logic ;
			i_pcl_to_adl 		: in std_logic ;
			i_pcl_to_db 		: in std_logic ;
			i_pcl_increment 	: in std_logic ;
			i_pcl_reload 		: in std_logic ;
			o_carry 				: out std_logic ;
			o_d_bus 				: out unsigned(7 downto 0) ;
			io_adl_bus 			: inout unsigned(7 downto 0)
			
		) ;
		
	end component ;
	
	constant clk_period 		: time := 50 ns ;
	
	signal Si_clk 				: std_logic ;
	signal Si_adl_to_pcl 	: std_logic ;
	signal Si_pcl_to_adl 	: std_logic ;
	signal Si_pcl_to_db 		: std_logic ;
	signal Si_pcl_increment : std_logic ;
	signal Si_pcl_reload 	: std_logic ;
	signal So_carry 			: std_logic ;
	signal So_d_bus 			: unsigned(7 downto 0) ;
	signal Sio_adl_bus 		: unsigned(7 downto 0) ;
	
begin

	module : CPU_program_counter_low
				port map(
				
					i_clk 				=> Si_clk,
					i_adl_to_pcl 		=> Si_adl_to_pcl,
					i_pcl_to_adl 		=> Si_pcl_to_adl,
					i_pcl_to_db 		=> Si_pcl_to_db,
					i_pcl_increment 	=> Si_pcl_increment,
					i_pcl_reload 		=> Si_pcl_reload,
					o_carry 				=> So_carry,
					o_d_bus 				=> So_d_bus,
					io_adl_bus 			=> Sio_adl_bus
					
				) ;
	
	clk_process : process
	begin
		
		Si_clk <= '1' ;
		wait for clk_period/2 ;
		
		Si_clk <= '0' ;
		wait for clk_period/ 2 ;
			
	end process ;
	
	testbench_process : process
	begin
	
		-- Init, expected: carry at 0, io and o at Z
		Si_adl_to_pcl <= '0' ;
		Si_pcl_to_adl <= '0' ;
		Si_pcl_to_db <= '0' ;
		Si_pcl_increment <= '0' ;
		Si_pcl_reload <= '0' ;
		
		wait for 100 ns ;
		
		-- case reload 0
		-- case adl to pcl
		Sio_adl_bus <= "10101010" ;
		Si_adl_to_pcl <= '1' ;
		
		wait for 100 ns ;
		
		-- case adl to pcl + pcl to adl
		Sio_adl_bus <= "10101010" ;
		Si_pcl_to_adl <= '1' ;
		
		wait for 100 ns ;
		
		-- case increment
		Sio_adl_bus <= "10101010" ;
		Si_adl_to_pcl <= '0' ;
		Si_pcl_to_adl <= '0' ;
		Si_pcl_increment <= '1' ;
		
		wait for 100 ns ;
		
		-- case increment + pcl to db 
		Sio_adl_bus <= "10101010" ;
		Si_pcl_to_db <= '1' ;
		
		wait for 100 ns ;
		
		-- case increment + pcl to db + adl to pc
		Sio_adl_bus <= "10101010" ;
		Si_adl_to_pcl <= '1' ;
		
		wait for 100 ns ;
		
		-- case all
		Sio_adl_bus <= "10101010" ;
		Si_pcl_to_adl <= '1' ;
		
		wait for 100 ns ;
		
		
		-- case reload 1
		Si_pcl_reload <= '1' ;
		
		-- case adl to pcl
		Sio_adl_bus <= "10101010" ;
		Si_adl_to_pcl <= '1' ;
		
		wait for 100 ns ;
		
		-- case adl to pcl + pcl to adl
		Sio_adl_bus <= "10101010" ;
		Si_pcl_to_adl <= '1' ;
		
		wait for 100 ns ;
		
		-- case increment
		Sio_adl_bus <= "10101010" ;
		Si_adl_to_pcl <= '0' ;
		Si_pcl_to_adl <= '0' ;
		Si_pcl_increment <= '1' ;
		
		wait for 100 ns ;
		
		-- case increment + pcl to db 
		Sio_adl_bus <= "10101010" ;
		Si_pcl_to_db <= '1' ;
		
		wait for 100 ns ;
		
		-- case increment + pcl to db + adl to pc
		Sio_adl_bus <= "10101010" ;
		Si_adl_to_pcl <= '1' ;
		
		wait for 100 ns ;
		
		-- case all
		Sio_adl_bus <= "10101010" ;
		Si_pcl_to_adl <= '1' ;
		
		wait for 100 ns ;
		
	end process ;
	
end testbench ;