--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : directions_and_angles                                        ==
--== Component : angle_checker_one_axis                                       ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY angle_checker_one_axis IS
   PORT ( AXIS              : IN  std_logic_vector( 15 DOWNTO 0 );
          LHB1              : IN  std_logic_vector( 15 DOWNTO 0 );
          LHB2              : IN  std_logic_vector( 15 DOWNTO 0 );
          LLB1              : IN  std_logic_vector( 15 DOWNTO 0 );
          LLB2              : IN  std_logic_vector( 15 DOWNTO 0 );
          MHB1              : IN  std_logic_vector( 15 DOWNTO 0 );
          MHB2              : IN  std_logic_vector( 15 DOWNTO 0 );
          MLB1              : IN  std_logic_vector( 15 DOWNTO 0 );
          MLB2              : IN  std_logic_vector( 15 DOWNTO 0 );
          SHB1              : IN  std_logic_vector( 15 DOWNTO 0 );
          SHB2              : IN  std_logic_vector( 15 DOWNTO 0 );
          SLB1              : IN  std_logic_vector( 15 DOWNTO 0 );
          SLB2              : IN  std_logic_vector( 15 DOWNTO 0 );
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          L                 : OUT std_logic;
          M                 : OUT std_logic;
          S                 : OUT std_logic );
END ENTITY angle_checker_one_axis;
