library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity flip_flop_d is
  Port ( 
    clk  : in  STD_LOGIC;	-- Clock input
    d    : in  STD_LOGIC;	-- Data input
    q    : out STD_LOGIC	-- Data output
  );
end flip_flop_d;

architecture Behavioral of flip_flop_d is
  signal q_temp : STD_LOGIC;
begin
  process (clk)
  begin
    if rising_edge(clk) then
      q_temp <= d;			-- Update the D flip-flop
    end if;
  end process;
  
  q <= q_temp;					-- Output the Q data
end Behavioral;
