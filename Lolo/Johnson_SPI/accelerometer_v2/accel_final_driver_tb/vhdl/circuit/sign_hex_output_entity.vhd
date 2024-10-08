--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2                                             ==
--== Component : sign_hex_output                                              ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY sign_hex_output IS
   PORT ( logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree1    : IN  std_logic_vector( 4 DOWNTO 0 );
          negative             : IN  std_logic;
          logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
END ENTITY sign_hex_output;
