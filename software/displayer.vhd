Library IEEE;
use IEEE.std_logic_1164.all;

entity displayer is
	Port(Switch : in STD_LOGIC_VECTOR(9 downto 0);
		  Led : out STD_LOGIC_VECTOR(9 downto 0));
end displayer;


architecture Behavioral of displayer is

begin

	Led <= Switch ;

end Behavioral;