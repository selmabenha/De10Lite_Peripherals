--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : print_ADXL345_values                                         ==
--== Component : hex_to_decimal                                               ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY hex_to_decimal IS
   PORT ( val      : IN  std_logic_vector( 7 DOWNTO 0 );
          hundreds : OUT std_logic_vector( 3 DOWNTO 0 );
          ones     : OUT std_logic_vector( 3 DOWNTO 0 );
          tens     : OUT std_logic_vector( 3 DOWNTO 0 ) );
END ENTITY hex_to_decimal;
