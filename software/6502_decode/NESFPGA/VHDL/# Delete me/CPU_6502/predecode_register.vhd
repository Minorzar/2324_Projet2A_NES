library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Predecode is
  port (
    databus      : in std_logic_vector(7 downto 0);
    reset        : in std_logic;
    cycle_number : out unsigned(3 downto 0);
    Instruction  : out std_logic_vector(7 downto 0);
    RMW          : out std_logic
  );
end Predecode;

architecture rtl of Predecode is
begin
  process (databus, reset)
  begin
    if reset = '1' then
      cycle_number <= to_unsigned(1, 4);
      Instruction <= "00000000";
      RMW <= '0';
    else
      Instruction <= databus;
      RMW <= '0';

      if databus = x"FF" then
        cycle_number <= to_unsigned(1, 4);
      else
        case databus(1 downto 0) is
          when "01" =>
            case databus(4 downto 0) is
              when "00001" =>
                cycle_number <= to_unsigned(6, 4);
              when "00101" =>
                cycle_number <= to_unsigned(3, 4);
              when "01001" =>
                cycle_number <= to_unsigned(2, 4);
              when "01101" =>
                cycle_number <= to_unsigned(4, 4);
              when "10001" =>
                cycle_number <= to_unsigned(6, 4);
              when "10101" =>
                cycle_number <= to_unsigned(4, 4);
              when "11001" =>
                cycle_number <= to_unsigned(5, 4);
              when others =>
                cycle_number <= to_unsigned(1, 4);
            end case;

          when "10" =>
            if databus(7) = '1' and databus(3 downto 2) = "10" then
              RMW <= '0';
              cycle_number <= to_unsigned(2, 4);
            elsif databus(7 downto 6) = "10" and not (databus(3 downto 2) = "10") then
              RMW <= '0';
              case databus(4 downto 2) is
                when "000" =>
                  cycle_number <= to_unsigned(2, 4);
                when "001" =>
                  cycle_number <= to_unsigned(3, 4);
                when "010" =>
                  cycle_number <= to_unsigned(2, 4);
                when "011" =>
                  cycle_number <= to_unsigned(4, 4);
                when "101" =>
                  cycle_number <= to_unsigned(4, 4);
                when "111" =>
                  cycle_number <= to_unsigned(5, 4);
                when others =>
                  cycle_number <= to_unsigned(1, 4);
              end case;
            elsif databus(4 downto 2) = "010" then
              cycle_number <= to_unsigned(2, 4);
              RMW <= '0';
            else
              RMW <= '1';
              case databus(4 downto 2) is
                when "001" =>
                  cycle_number <= to_unsigned(5, 4);
                when "011" =>
                  cycle_number <= to_unsigned(6, 4);
                when "101" =>
                  cycle_number <= to_unsigned(6, 4);
                when "111" =>
                  cycle_number <= to_unsigned(7, 4);
                when others =>
                  cycle_number <= to_unsigned(1, 4);
              end case;
            -- Handle interrupts
            if databus(6 downto 5) = "00" then -- BRK
              cycle_number <= to_unsigned(1, 4);
              RMW <= '0';
            else -- JSR, RTS, RTI
              cycle_number <= to_unsigned(6, 4);
              RMW <= '0';
            end if;

          when others =>
            cycle_number <= to_unsigned(1, 4);
            RMW <= '0';
        end case;
      end if;
    end if;
  end process;
end rtl;
