--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_with_calib                                     ==
--== Component : signed_fast_filter                                           ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY signed_fast_filter IS
   PORT ( clock             : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
          reset             : IN  std_logic;
          unfiltered        : IN  std_logic_vector( 15 DOWNTO 0 );
          filtered          : OUT std_logic_vector( 15 DOWNTO 0 ) );
END ENTITY signed_fast_filter;
