--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : print_ADXL345_values                                         ==
--== Component : lowpass_filter_de10                                          ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY lowpass_filter_de10 IS
   PORT ( clock             : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
          negative          : IN  std_logic;
          reset             : IN  std_logic;
          unfiltered        : IN  std_logic_vector( 15 DOWNTO 0 );
          filtered          : OUT std_logic_vector( 7 DOWNTO 0 );
          negative_val      : OUT std_logic );
END ENTITY lowpass_filter_de10;
