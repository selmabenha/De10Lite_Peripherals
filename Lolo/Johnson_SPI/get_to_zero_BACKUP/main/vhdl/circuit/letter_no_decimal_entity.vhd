--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero_BACKUP                                           ==
--== Component : letter_no_decimal                                            ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY letter_no_decimal IS
   PORT ( letter_num        : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree4 : IN  std_logic_vector( 4 DOWNTO 0 );
          no_dec_letter     : OUT std_logic_vector( 7 DOWNTO 0 ) );
END ENTITY letter_no_decimal;
