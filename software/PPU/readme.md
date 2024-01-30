@ NES's PPU as know as 2C02

The PPU (2C02) readme is only present in purpose to compilate all knowledge about the PPU memory mapping and application 

the PPU can be cut 4 large parts 


IN/OUT/BOTH

    As the 2C02 is presented in Nesdev blog : 
                
            +-------------------------------------------+
            |2C02 pin nomenclature & signal descriptions|
            +-------------------------------------------+
                    ___  ___
                    |*  \/   |
            R/W  >01]        [40<  VCC
            D0  [02]        [39>  ALE
            D1  [03]        [38]  AD0
            D2  [04]        [37]  AD1
            D3  [05]        [36]  AD2
            D4  [06]        [35]  AD3
            D5  [07]        [34]  AD4
            D6  [08]        [33]  AD5
            D7  [09]        [32]  AD6
            A2  >10]  2C02  [31]  AD7
            A1  >11]        [30>  A8
            A0  >12]        [29>  A9
           /CS  >13]        [28>  A10
          EXT0  [14]        [27>  A11
           EXT1  [15]        [26>  A12
           EXT2  [16]        [25>  A13
            EXT3  [17]        [24>  /R
            CLK  >18]        [23>  /W
            /VBL  <19]        [22<  /SYNC
            VEE  >20]        [21>  VOUT
                    |________|


We will explain (in the main line) the purpose of every enter

the R/W /CS D[0-7] and A[0-2] are the PPU's controle signal (controle by the CPU), D[0-7] give the date, A[0-2] give which register is select but can only do this if /CS=0. The R/W give the direction between PPU and CPU data (D[0-7]). the only shady information is about the /CS, this one is generat by the address decoder 74139 and he is also know as /DBE, if this one is equal to 1 case D[0-7] float. 

The EXTx can be input or an output. As imput, the EXTx could set up de "slave" mode in register PPUCTRL causing the output of the palette indice to the EXTx pin juste before clear it . But in another hand, some datasheet say that bit are on the ground, please tcheck the following datasheet if you want more information (tchek :https://www.nesdev.org/2C02%20technical%20reference.TXT and https://www.nesdev.org/wiki/PPU_pinout). 

CLK is obviously the clock:  21.47727 MHz (NTSC) or 26.6017 MHz (PAL) 

/INT or /VBL (INT for interupt and VBL for VBlank) is , can be also open collecteur

VEE/VOUT/VCC are the composent voltage, don't care here

ALE (Address Latch Enable) goes high at the beginning of a PPU VRAM access and it use to latch the lower 8 bits of the PPU address bus. After the end it still high during one cycle. 


/SYNC or /RST 

PART in PPU 

    the first part of PPU is the PATTER TABLE 

        this containt 2 sqare table of 16 tiles, every tiles is a square of 8 pixel
        each TABLE containt 64KB of memory


     The Second is Nametables 

        containt the layout background 
        The image is 32x30 tiles, every tiles is a 8px x 8px 
        layed the data of each tiles form the cartridge, it's very long and many game make some tric knowledge
        after 
        1 Byte (OCTE!!!) by TILES 
        end have an Attribute table, an serie of byte with the association of the palette for 4 tiles 

    The Third The Palette 

        the PPU can distinct 64 colors (every colors is code on 1 BYTE)
        but can only stock 4 color for the Background and 4 color for the Foreground
        however the color, the first color is transparent
        it's use to make the transparent thing on a spirt
        In memory the color is write on 2 bits -> every tiles requert 128 bits for code all the color 

        This fourth color are link with a number between 0 and 3, so this number can be code on 2 bits 
        For stock the color of the tiles, for each line, the low and hight bits are separat and the both are stock on an Byte
        (easy use by PPU)


    Fourth Object Attribute Memory (OAM !!!)

        Controle the background and the sprite of the game 
        For the color, it's use the same principe as the palette utilisation 
        for every sprite: the first byte give the hight of the sprite 
        the seconde byte give the pablette where the sprite are stocked 
        the third give the attribute of the sprite  *
        the fourth give the x position
        
        * For this byte, form the low bit :
        0 and 1 select the palette (group of 4 color)
        2,3,4 are not use 
        5 controle the fact to be above or below the background (0 fround, 1 back)
        6  accivate if the sprite is slip horizontaly
        6  accivate if the sprite is slip vderticaly



About Memory
    Basicly the PPU is link with 32 Kbits of memory, in fact it's more complexe 

    In a Hardware POV the PPU have only few which come from the PPU.
        the 0x0000-0x1FFF are the CHR-RAM/CHR-ROM (depending of the cardbridge)
        the 0x2000-0x2FFF are the VRAM link to the PPU     //2Kb ?
        the 0x3000-0x3EFF Copy of the VRAM data presented as negligible by Nesdev 
        the 0x3F00-3FFF not configurable, always mapped to the internal palete controle 

        But another Register existe, in the PPU eight register and a memory of 256 word of 8 bits are present
        this Memory is dedicate to the OAM (the moving sprite)
        the eight register add a way for the CPU to interact with the PPU 




REGISTER 

    General Address: 
            0x2000 PPUCTRL 
            0x2001 PPUMASK
            0x2002 PPUSTATUE
            0x2003 OAMADDR 
            0x2004 OAMDATA
            0x2005 PPUSCROLL
            0x2006 PPUADDR 
            0x2007 PPUDATA
            0x4014 OAMDMA

   after that :0 is the MSB

            FOR PPUCTRL (0x2000)

                0 : enable the NMI      0=OFF 1=ON               --Stop here 

                        Also know as NMI_output 

                        NMI : non-maskable interupt , an interuption who have always priority on other, It's come form the PPU 
                        to the CPU and it's use to detect vertical blanking, 

                        IN WORKS : 

                        1- Start of vertical blanking (PPUSTATUE.0=1)
                        2- End of the vertical blanking (some time before having scan the line) (PPUSTATUE.0=0)
                        3- Read PPUSTATUE
                        4- Set this Bit to 1 

                        error if this bits and PPUSTATUE.0 = 1 


                1 : PPU master/slave    0=Slave 1=Master

                        Chose who 

                2 : sprite hight 

                3 : background tile select

                4 : sprite tile select 

                5 : increment mode

                6-7 : nametable select 



            FOR PPUMASK (0x2001)  

                0-2 : color emphasis      0=OFF 1=ON 

                        to 0-2, every bits represente a Color and: 

                            0-Blue 
                            1-Green 
                            2-Red

                        and as write over, 1 is for set up the emphasis and the 0 is for stop it


                3 : sprite enable 

                        sprite enable = 1 , unenable = 0

                4 : background enable 

                        background enable = 1 , unenable = 0

                5 : sprite left column enable 

                6 : background left column enable

                7 : greyscale



            FOR PPUSTATUE (0x2002)  

                0 : vblank      0=OFF 1=ON 
                    Also named NMI_occured
                1 : sprite 0 hit

                2 : sprite overflow



            FOR OAMADDR (0x2003)  

                0-7 : OAM read write Address



            FOR OAMDATA (0x2004)  

                0-7 : OAM read write data


            FOR PPUSCROLL (0x2005)  

                0-7 : fine scroll position (two writes X pos Y pos)


            FOR PPUADDR (0x2006)  

                0-7 : PPU read/write Address



            FOR PPUDATA (0x2007)  

                0-7 : PPU data read/write 



            FOR OAMDMA (0x4014)  

                0-7 : OAM DMA hight Address
