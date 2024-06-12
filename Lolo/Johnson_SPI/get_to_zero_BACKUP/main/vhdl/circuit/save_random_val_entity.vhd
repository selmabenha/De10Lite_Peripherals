--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero_BACKUP                                           ==
--== Component : save_random_val                                              ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY save_random_val IS
   PORT ( button            : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree4 : IN  std_logic_vector( 4 DOWNTO 0 );
          max_value         : IN  std_logic_vector( 7 DOWNTO 0 );
          min_value         : IN  std_logic_vector( 7 DOWNTO 0 );
          rand_clock        : IN  std_logic;
          reset             : IN  std_logic;
          final_random_val  : OUT std_logic_vector( 7 DOWNTO 0 ) );
END ENTITY save_random_val;
