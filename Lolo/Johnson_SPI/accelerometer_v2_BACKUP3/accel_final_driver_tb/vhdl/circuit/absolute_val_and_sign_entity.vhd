--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2_BACKUP3                                     ==
--== Component : absolute_val_and_sign                                        ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY absolute_val_and_sign IS
   PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
          unfiltered        : IN  std_logic_vector( 15 DOWNTO 0 );
          negative          : OUT std_logic;
          value             : OUT std_logic_vector( 15 DOWNTO 0 ) );
END ENTITY absolute_val_and_sign;
