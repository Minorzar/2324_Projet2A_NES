library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity processor_6502 is
  Port ( 
    clk     : in STD_LOGIC;  -- Clock
    reset   : in STD_LOGIC;  -- Reset signal
    data_bus: inout STD_LOGIC_VECTOR (7 downto 0);  -- 8-bit data bus
    address : out STD_LOGIC_VECTOR (15 downto 0);  -- 16-bit address bus
    ...
    -- Other input/output ports
  );
end processor_6502;
