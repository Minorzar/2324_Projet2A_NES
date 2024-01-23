---------------------------------------------------------------------
--autor : Xteck 

--this composent is the PPU present in the original NES 

-- you need some information, go see https://github.com/Minorzar/2324_Projet2A_NES
-- in another hand, see the readme in this desk
-- else, see the nesdev web site for any information https://www.nesdev.org

--

--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PPU is 

    port(
    D : inout unsigned(7 downto 0); -- data exchange with CPU /
    AD : inout unsigned(7 downto 0); -- data or information inout with PPU's BUS
    -- / link to the CHR data BUS
    
    EXT : in unsigned(3 downto 0); 
    i_A_CPU : in unsigned(2 downto 0); -- address exchange with CPU 
    A_PPU : out unsigned(5 downto 0);-- / link to the CHR Add BUS


    --signal eliver by CPU
    clk: in std_logic;
    CS_n : in std_logic;
    RW : in std_logic; 
    
    -- signal deliver by PPU
    RST_n : in  std_logic;
    ALE : out std_logic;
    RD_n : out std_logic; 
    RW_n : out std_logic;
    

    -- https://www.nesdev.org/wiki/PPU_pinout for every check up
    );
    end PPU;



    architecture PPU_rft of PPU is 
        subtype word_8 is unsigned(7 downto 0);

        type REG_PPU is array(0 to 7) of word_8;
        signal REG: REG_PPU; 

        type OAM_PPU is array(0 to 64*4) of word_8;
        signal OAM: OAM_PPU;

        --Set up to use the inout of  AD and D 
        signal s_in_D : unsigned(7 downto 0);
        signal s_out_D : unsigned(7 downto 0);

        signal s_in_AD : unsigned(7 downto 0);
        signal s_out_AD : unsigned (7 downto 0);


    begin 
        process(clk)
        begin 
        end process;

    end PPU_rft;



