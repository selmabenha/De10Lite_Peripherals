--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero                                                  ==
--== Component : main                                                         ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY main IS
   PORT ( logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
          reset                : IN  std_logic;
          state_1              : IN  std_logic;
          state_2              : IN  std_logic;
          state_3              : IN  std_logic;
          logisimOutputBubbles : OUT std_logic_vector( 47 DOWNTO 0 ) );
END ENTITY main;
