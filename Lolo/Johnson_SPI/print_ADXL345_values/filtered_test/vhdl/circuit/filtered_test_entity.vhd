--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : print_ADXL345_values                                         ==
--== Component : filtered_test                                                ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY filtered_test IS
   PORT ( Input_1              : IN  std_logic;
          logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimInputBubbles  : IN  std_logic_vector( 7 DOWNTO 0 );
          logisimOutputBubbles : OUT std_logic_vector( 15 DOWNTO 0 ) );
END ENTITY filtered_test;
