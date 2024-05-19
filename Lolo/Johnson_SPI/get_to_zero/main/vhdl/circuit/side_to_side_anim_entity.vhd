--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero                                                  ==
--== Component : side_to_side_anim                                            ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY side_to_side_anim IS
   PORT ( clock             : IN  std_logic;
          hex1_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
          hex2_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
          hex3_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
          hex4_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
          hex5_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree4 : IN  std_logic_vector( 4 DOWNTO 0 );
          hex0_out          : OUT std_logic_vector( 7 DOWNTO 0 );
          hex1_out          : OUT std_logic_vector( 7 DOWNTO 0 );
          hex2_out          : OUT std_logic_vector( 7 DOWNTO 0 );
          hex3_out          : OUT std_logic_vector( 7 DOWNTO 0 );
          hex4_out          : OUT std_logic_vector( 7 DOWNTO 0 );
          hex5_out          : OUT std_logic_vector( 7 DOWNTO 0 ) );
END ENTITY side_to_side_anim;
