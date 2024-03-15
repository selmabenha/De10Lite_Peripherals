--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : directions_and_angles                                        ==
--== Component : angle_checker                                                ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY angle_checker IS
   PORT ( LHB               : IN  std_logic_vector( 15 DOWNTO 0 );
          LLB               : IN  std_logic_vector( 15 DOWNTO 0 );
          MHB               : IN  std_logic_vector( 15 DOWNTO 0 );
          MLB               : IN  std_logic_vector( 15 DOWNTO 0 );
          NUMBER_TO_CHECK   : IN  std_logic_vector( 15 DOWNTO 0 );
          SHB               : IN  std_logic_vector( 15 DOWNTO 0 );
          SLB               : IN  std_logic_vector( 15 DOWNTO 0 );
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          L                 : OUT std_logic;
          M                 : OUT std_logic;
          S                 : OUT std_logic );
END ENTITY angle_checker;
