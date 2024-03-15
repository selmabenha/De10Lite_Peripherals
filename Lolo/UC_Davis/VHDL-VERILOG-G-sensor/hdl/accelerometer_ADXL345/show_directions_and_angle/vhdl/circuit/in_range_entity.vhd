--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_ADXL345                                        ==
--== Component : in_range                                                     ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY in_range IS
   PORT ( Higher_bound      : IN  std_logic_vector( 15 DOWNTO 0 );
          Lower_bound       : IN  std_logic_vector( 15 DOWNTO 0 );
          Number_to_check   : IN  std_logic_vector( 15 DOWNTO 0 );
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          within_range      : OUT std_logic );
END ENTITY in_range;
