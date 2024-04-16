--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : division                                                     ==
--== Component : divider_v3                                                   ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY divider_v3 IS
   PORT ( val          : IN  std_logic_vector( 15 DOWNTO 0 );
          final_answer : OUT std_logic_vector( 7 DOWNTO 0 ) );
END ENTITY divider_v3;
