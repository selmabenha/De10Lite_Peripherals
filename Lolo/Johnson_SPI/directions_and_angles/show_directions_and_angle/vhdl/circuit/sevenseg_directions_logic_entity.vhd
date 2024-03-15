--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : directions_and_angles                                        ==
--== Component : sevenseg_directions_logic                                    ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY sevenseg_directions_logic IS
   PORT ( D                 : IN  std_logic;
          L                 : IN  std_logic;
          M                 : IN  std_logic;
          R                 : IN  std_logic;
          S                 : IN  std_logic;
          U                 : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          letter_output     : OUT std_logic_vector( 7 DOWNTO 0 ) );
END ENTITY sevenseg_directions_logic;
