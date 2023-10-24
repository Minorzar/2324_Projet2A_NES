Library IEEE;
use IEEE.std_logic_1164.all;

library PLL;
use PLL.all;

entity displayer is
	Port(
		clk50 : in std_logic;
		reset_n : in std_logic;
		Led : out STD_LOGIC_VECTOR(9 downto 0));
end displayer;


architecture Behavioral of displayer is
	signal clk_pll : std_logic;
	signal pll_locked : std_logic;
	signal blink_counter : natural range 0 to 50000000;
	signal led_state : std_logic_vector (9 downto 0) := "0000000001" ;
	signal index : natural range 1 to 10;
	
	-- 1.66MHz pour la NES
	-- PPU à 5.37MHz
begin
	pll0: entity PLL.PLL 
	port map (
		refclk => clk50,
		rst => not reset_n,
		outclk_0 => clk_pll,
		locked => pll_locked
	);

	process (clk_pll)
	begin
		if (pll_locked = '0') then
			blink_counter <= 0;
		elsif (rising_edge(clk_pll)) then
			if (blink_counter = 3999999) then
				blink_counter <= 0;
				for i in 0 to 8 loop
					led_state(i+1) <= led_state(i);
				end loop;
				
				led_state(0) <= led_state(9);
			else
				blink_counter <= blink_counter + 1;
			end if;
		end if;
	end process;
	
	Led <= led_state;

end Behavioral;