--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero_BACKUP                                           ==
--== Component : pseudo_random                                                ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY pseudo_random IS
   PORT ( enable            : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree4 : IN  std_logic_vector( 4 DOWNTO 0 );
          max_value         : IN  std_logic_vector( 7 DOWNTO 0 );
          min_value         : IN  std_logic_vector( 7 DOWNTO 0 );
          rand_clock        : IN  std_logic;
          reset             : IN  std_logic;
          random_val        : OUT std_logic_vector( 7 DOWNTO 0 ) );
END ENTITY pseudo_random;
