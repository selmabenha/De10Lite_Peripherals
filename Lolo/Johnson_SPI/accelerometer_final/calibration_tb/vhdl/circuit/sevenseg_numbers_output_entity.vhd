--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_final                                          ==
--== Component : sevenseg_numbers_output                                      ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY sevenseg_numbers_output IS
   PORT ( decimal              : IN  std_logic;
          input_bus            : IN  std_logic_vector( 3 DOWNTO 0 );
          logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree1    : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
END ENTITY sevenseg_numbers_output;
