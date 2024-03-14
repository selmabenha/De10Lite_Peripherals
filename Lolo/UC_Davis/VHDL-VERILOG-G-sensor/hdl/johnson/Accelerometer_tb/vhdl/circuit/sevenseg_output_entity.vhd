--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : johnson                                                      ==
--== Component : sevenseg_output                                              ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY sevenseg_output IS
   PORT ( Input_bus_1          : IN  std_logic_vector( 3 DOWNTO 0 );
          logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
END ENTITY sevenseg_output;
