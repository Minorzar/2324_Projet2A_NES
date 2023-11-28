library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top_entity is
  Port ( 
    clk          : in  STD_LOGIC;
    data_input   : in  STD_LOGIC;
    data_output  : out STD_LOGIC
  );
end top_entity;

architecture Behavioral of top_entity is
begin
  flip_flop : entity work.flip_flop_d port map (
    clk => clk,
    d   => data_input,
    q   => data_output
  );

end Behavioral;
