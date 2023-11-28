library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity OpcodeDecoder is
  Port (
    opcode : in STD_LOGIC_VECTOR(7 downto 0);
    control_signals : out STD_LOGIC_VECTOR(7 downto 0)
  );
end OpcodeDecoder;

architecture Behavioral of OpcodeDecoder is
begin
  process (opcode)
  begin
    case opcode is
      -- Define opcode patterns and generate control signals
      when "0010_0000" => control_signals <= "1000_0000"; -- LDA Immediate
      when "0001_0000" => control_signals <= "1000_0000"; -- LDA Zero Page
      -- Add more cases for other opcodes...

      when others => control_signals <= "0000_0000"; -- Default
    end case;
  end process;
end Behavioral;
