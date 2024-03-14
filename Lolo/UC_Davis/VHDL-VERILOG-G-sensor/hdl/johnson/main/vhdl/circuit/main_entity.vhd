--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : johnson                                                      ==
--== Component : main                                                         ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY main IS
   PORT ( int1              : IN  std_logic;
          intbypass         : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          miso              : IN  std_logic;
          rst               : IN  std_logic;
          Accelerometer     : OUT std_logic_vector( 47 DOWNTO 0 );
          cs                : OUT std_logic;
          mosi              : OUT std_logic;
          rst_led           : OUT std_logic;
          sclk              : OUT std_logic );
END ENTITY main;
