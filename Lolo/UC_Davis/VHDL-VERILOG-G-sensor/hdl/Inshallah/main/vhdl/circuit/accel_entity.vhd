--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Inshallah                                                    ==
--== Component : accel                                                        ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY accel IS
   PORT ( ADC_CLK_10    : IN    std_logic;
          GSENSOR_INT   : IN    std_logic_vector( 1 DOWNTO 0 );
          KEY           : IN    std_logic_vector( 1 DOWNTO 0 );
          MAX10_CLK1_50 : IN    std_logic;
          MAX10_CLK2_50 : IN    std_logic;
          SW            : IN    std_logic_vector( 9 DOWNTO 0 );
          GSENSOR_SDI   : INOUT std_logic;
          GSENSOR_SDO   : INOUT std_logic;
          GSENSOR_CS_N  : OUT   std_logic;
          GSENSOR_SCLK  : OUT   std_logic;
          HEX0          : OUT   std_logic_vector( 7 DOWNTO 0 );
          HEX1          : OUT   std_logic_vector( 7 DOWNTO 0 );
          HEX2          : OUT   std_logic_vector( 7 DOWNTO 0 );
          HEX3          : OUT   std_logic_vector( 7 DOWNTO 0 );
          HEX4          : OUT   std_logic_vector( 7 DOWNTO 0 );
          HEX5          : OUT   std_logic_vector( 7 DOWNTO 0 );
          LEDR          : OUT   std_logic_vector( 9 DOWNTO 0 ) );
END ENTITY accel;
