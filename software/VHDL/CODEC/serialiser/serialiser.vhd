library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity serialiser is
    port(
        --all clk
        i_mclk: in std_logic;
        o_bclk: out std_logic;
        o_dacklrck: out std_logic;

        --data
        i_sample_left : in std_logic_vector(15 downto 0);
        i_sample_right : in std_logic_vector(15 downto 0);

        o_dacdat : out std_logic
    );
end serialiser;

architecture serialiser_rtf of serialiser is 
    signal s_sample_load_en : std_logic;
    signal r_sample_left : std_logic_vector(15 downto 0) := (others => '0');
    signal r_sample_right : std_logic_vector(15 downto 0) := (others => '0');

    signal r_cpt : unsigned(9 downto 0) := (others => '0'); --attribution de la valeurs du compteur en hexa
    signal s_cpt_crop : unsigned(3 downto 0);

begin
    o_dacklrck<=r_cpt(9); -- f_dacklrck = f_mclk / 256 
    o_bclk<=r_cpt(3);     -- f_bclk = f_mclk / 8

    process(i_mclk)
    begin
        if (rising_edge(i_mclk)) then
            r_cpt <= r_cpt + 1;
            -- incrementation a chaque frond montant 
        end if;
    end process;

    s_sample_load_en <= '1' when (r_cpt =  "1111111111" )else '0';
    --autorise l'envoie d'une valeurs dans le séréaliser seulement quand le compteur
    -- prend la valeurs "11111111"

    process(i_mclk)
    begin
        if (rising_edge(i_mclk)) then
           if (s_sample_load_en = '1') then
                r_sample_left <= i_sample_left;
                r_sample_right <= i_sample_right;
            end if;
        end if;
    end process;
    --recopie à l'interieur du signal les valeurs envoyé pour 
    --stoké le son envoyé

	 s_cpt_crop <= r_cpt(7 downto 4);
	 
    process(r_sample_left, r_sample_right, r_cpt)
    begin
        if (r_cpt(9) = '0') then    -- LEFT
            o_dacdat <= r_sample_left(15-to_integer(s_cpt_crop));
        else                        -- RIGHT
            o_dacdat <= r_sample_right(15-to_integer(s_cpt_crop));
        end if;
    --end if;
	 end process;

    --Repartie entre gauche et droite le son 

end serialiser_rtf;