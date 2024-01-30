library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity CPU_address_bus_register_tb is
end CPU_address_bus_register_tb ;

architecture testbench of CPU_address_bus_register_tb is

	component CPU_address_bus_register
		port(
			i_clk: in std_logic;
			i_phi1: in std_logic;
			i_adlh_to_ablh: in std_logic;
			o_address_bus: out unsigned (7 downto 0);
			i_adlh_bus: in unsigned (7 downto 0)
		);
	end component ;
	
	constant clk_period : time := 50ns ;
	
	signal Si_clk : std_logic ;
	signal Si_phi1 : std_logic := '0' ;
	signal Si_adhl_to_ablh : std_logic ;
	signal Si_adlh_bus : unsigned(7 downto 0) ;
	signal So_address_bus : unsigned(7 downto 0) ;
	
begin

	module : CPU_address_bus_register
				port map(
					i_clk => Si_clk,
					i_phi1 => Si_phi1,
					i_adlh_to_ablh => Si_adhl_to_ablh,
					i_adlh_bus => Si_adlh_bus,
					o_address_bus => So_address_bus
				) ;
				
	clk_process : process
	begin
	
		si_clk <= '0' ;
		wait for clk_period/2 ;
		si_clk <= '1' ;
		si_phi1 <= '1' ;
		wait for clk_period/2 ;
		si_clk <= '0' ;
		wait for clk_period/2 ;
		si_clk <= '1' ;
		si_phi1 <= '0' ;
		wait for clk_period/2 ;
		
	end process ;
	
	tb_process : process
	begin
	
		si_adlh_bus <= "10101010" ;
		Si_adhl_to_ablh <= '0' ;
		wait for 25ns ;
		Si_adhl_to_ablh <= '1' ;
		wait for 25ns ;
		si_adlh_bus <= "01010101" ;
		wait for 25ns ;
	
	end process ;
	
end testbench ;