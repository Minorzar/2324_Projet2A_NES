library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity triangle_tb is
end triangle_tb ;

architecture testbench of triangle_tb is

    component triangle
    
        port(
		  
				i_en_seq     			: in std_logic ;
            i_clk                : in std_logic ;
            i_reset             	: in std_logic ;
            i_linear_counter     : in std_logic ;
            i_length_counter     : in std_logic ;
            o_level            	: out std_logic_vector(3 downto 0)

        ) ;

    end component ;

    constant clk_period : time := 500ns ;

    signal Si_clk             : std_logic ;
	 signal Si_en_seq				: std_logic ;
    signal Si_reset				: std_logic ;
    signal Si_linear_counter  : std_logic ;
    signal Si_length_counter  : std_logic ;
    signal So_level           : std_logic_vector(3 downto 0) ;

begin

    module : triangle
            port map(

                i_clk 				=> Si_clk,
					 i_en_seq			=> Si_en_seq,
                i_reset 			=> Si_reset,
                i_linear_counter => Si_linear_counter,
                i_length_counter => Si_length_counter,
                o_level 			=> So_level

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
				
				Si_linear_counter <= '1' ;
				Si_en_seq <= '1' ;
            Si_length_counter <= '1' ;
            Si_reset <= '1' ;
				
				wait for 10ms ;
				

            -- Initialisation, everything at 0
            Si_linear_counter <= '0' ;
				Si_en_seq <= '0' ;
            Si_length_counter <= '0' ;
            Si_reset <= '0' ;

            wait for 1ms ;
				
				-- Seq off
            -- Reset off
            -- Linear on length off
            Si_linear_counter <= '1' ;

            wait for 1ms ;

            --Linear off length on
            Si_linear_counter <= '0' ;
            Si_length_counter <= '1' ;

            wait for 1ms ;

            -- Linear on length on
            Si_linear_counter <= '1' ;

            wait for 32*clk_period ;

            -- Reset on
            Si_reset <= '1' ;
            
            -- Linear on length off
            Si_linear_counter <= '1' ;

            wait for 1ms ;

            --Linear off length on
            Si_linear_counter <= '0' ;
            Si_length_counter <= '1' ;

            wait for 1ms ;

            -- Linear on length on
            Si_linear_counter <= '1' ;

            wait for 32*clk_period ;
				
				-- Seq on
				Si_en_seq <= '1' ;
				
				-- Reset off
            -- Linear on length off
            Si_linear_counter <= '1' ;

            wait for 1ms ;

            --Linear off length on
            Si_linear_counter <= '0' ;
            Si_length_counter <= '1' ;

            wait for 1ms ;

            -- Linear on length on
            Si_linear_counter <= '1' ;

            wait for 32*clk_period ;

            -- Reset on
            Si_reset <= '1' ;
            
            -- Linear on length off
            Si_linear_counter <= '1' ;

            wait for 1ms ;

            --Linear off length on
            Si_linear_counter <= '0' ;
            Si_length_counter <= '1' ;

            wait for 1ms ;

            -- Linear on length on
            Si_linear_counter <= '1' ;

            wait for 32*clk_period ;

        end process ;

end testbench ;