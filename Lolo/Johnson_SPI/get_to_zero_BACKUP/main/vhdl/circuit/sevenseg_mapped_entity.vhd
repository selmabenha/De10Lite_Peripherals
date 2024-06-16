--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2_BACKUP                                      ==
--== Component : sevenseg_mapped                                              ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY sevenseg_mapped IS
   PORT ( logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree1    : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree2    : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree3    : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree4    : IN  std_logic_vector( 4 DOWNTO 0 );
          sevenseg_input       : IN  std_logic_vector( 7 DOWNTO 0 );
          logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
END ENTITY sevenseg_mapped;
