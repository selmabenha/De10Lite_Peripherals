--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : directions_and_angles                                        ==
--== Component : right_force                                                  ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY right_force IS
   PORT ( L1                : IN  std_logic;
          L2                : IN  std_logic;
          M1                : IN  std_logic;
          M2                : IN  std_logic;
          S1                : IN  std_logic;
          S2                : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          L                 : OUT std_logic;
          M                 : OUT std_logic;
          S                 : OUT std_logic );
END ENTITY right_force;
