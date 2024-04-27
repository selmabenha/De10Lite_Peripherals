--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2                                             ==
--== Component : signed_div_tb                                                ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY signed_div_tb IS
   PORT ( Input_bus_1          : IN  std_logic_vector( 15 DOWNTO 0 );
          logisimOutputBubbles : OUT std_logic_vector( 31 DOWNTO 0 ) );
END ENTITY signed_div_tb;
