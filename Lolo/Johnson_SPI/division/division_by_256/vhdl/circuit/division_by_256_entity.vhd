--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : division                                                     ==
--== Component : division_by_256                                              ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY division_by_256 IS
   PORT ( Input_value : IN  std_logic_vector( 31 DOWNTO 0 );
          hundreds    : OUT std_logic_vector( 31 DOWNTO 0 );
          ones        : OUT std_logic_vector( 31 DOWNTO 0 );
          tens        : OUT std_logic_vector( 31 DOWNTO 0 ) );
END ENTITY division_by_256;
