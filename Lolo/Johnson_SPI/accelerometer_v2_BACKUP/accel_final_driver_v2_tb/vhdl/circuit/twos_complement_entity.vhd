--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2_BACKUP                                      ==
--== Component : twos_complement                                              ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY twos_complement IS
   PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
          negative_number   : IN  std_logic_vector( 15 DOWNTO 0 );
          absolute_val      : OUT std_logic_vector( 15 DOWNTO 0 ) );
END ENTITY twos_complement;
