--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero                                                  ==
--== Component : timer                                                        ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY timer IS
   PORT ( enable            : IN  std_logic;
          game_reset        : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree4 : IN  std_logic_vector( 4 DOWNTO 0 );
          reset             : IN  std_logic;
          stop              : IN  std_logic;
          timer_clock       : IN  std_logic;
          hundreds          : OUT std_logic_vector( 3 DOWNTO 0 );
          ones              : OUT std_logic_vector( 3 DOWNTO 0 );
          tens              : OUT std_logic_vector( 3 DOWNTO 0 ) );
END ENTITY timer;
