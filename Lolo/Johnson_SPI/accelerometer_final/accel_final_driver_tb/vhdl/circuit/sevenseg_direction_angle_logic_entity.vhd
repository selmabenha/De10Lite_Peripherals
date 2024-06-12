--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_final                                          ==
--== Component : sevenseg_direction_angle_logic                               ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY sevenseg_direction_angle_logic IS
   PORT ( D                 : IN  std_logic;
          L                 : IN  std_logic;
          M                 : IN  std_logic;
          R                 : IN  std_logic;
          S                 : IN  std_logic;
          U                 : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
          letter_output     : OUT std_logic_vector( 7 DOWNTO 0 ) );
END ENTITY sevenseg_direction_angle_logic;
