library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity VGA_Sync is
    Port(
        i_clk25   : in std_logic;
        i_reset   : in std_logic;
		  o_blank	: out std_logic ;
        o_hs      : out std_logic;
        o_vs      : out std_logic;
        o_x       : out std_logic_vector(9 downto 0);
        o_y       : out std_logic_vector(9 downto 0)
    );
end VGA_Sync;

architecture behavioral of VGA_Sync is
    signal sEN      	: std_logic;
    signal sblankH   : std_logic;
    signal sblankV   : std_logic;
    signal sVS   		: std_logic;
    signal sHS   		: std_logic;
    signal rx   	 	: std_logic_vector(9 downto 0);
    signal ry    		: std_logic_vector(9 downto 0);

begin

    u1 : entity work.H_sync
				port map (
					i_clk25 			=> i_clk25, 
					i_reset 			=> i_reset, 
					o_blank_h 		=> sblankH, 
					o_cnt_y_enable => sEN, 
					o_hs 				=> shs, 
					o_h_count 		=> rx
				);
				
    u2 : entity work.V_sync
				port map (
					i_clk25 			=> i_clk25, 
					i_reset			=> i_reset, 
					i_cnt_y_enable => sEN, 
					o_blank_v 		=> sblankV, 
					o_vs 				=> svs, 
					o_v_count 		=> ry
				);

    o_hs 	<= sHS;
    o_vs 	<= sVS;
    o_x 		<= rx;
    o_y 		<= ry;
	 o_blank <= not (sblankH or sblankV) ;

end behavioral;