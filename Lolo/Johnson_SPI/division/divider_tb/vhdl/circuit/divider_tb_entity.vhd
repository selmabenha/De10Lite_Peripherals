--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : division                                                     ==
--== Component : divider_tb                                                   ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY divider_tb IS
   PORT ( Input_1              : IN  std_logic;
          Input_2              : IN  std_logic;
          Output_1             : OUT std_logic;
          logisimOutputBubbles : OUT std_logic_vector( 23 DOWNTO 0 ) );
END ENTITY divider_tb;
