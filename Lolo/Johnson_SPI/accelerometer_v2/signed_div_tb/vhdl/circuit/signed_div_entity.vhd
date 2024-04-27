--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2                                             ==
--== Component : signed_div                                                   ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY signed_div IS
   PORT ( unfiltered : IN  std_logic_vector( 15 DOWNTO 0 );
          result     : OUT std_logic_vector( 15 DOWNTO 0 ) );
END ENTITY signed_div;
