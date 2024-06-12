--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2_BACKUP3                                     ==
--== Component : Subtractor                                                   ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY Subtractor IS
   GENERIC ( extendedBits : INTEGER;
             nrOfBits     : INTEGER );
   PORT ( borrowIn  : IN  std_logic;
          dataA     : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
          dataB     : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
          borrowOut : OUT std_logic;
          result    : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
END ENTITY Subtractor;
