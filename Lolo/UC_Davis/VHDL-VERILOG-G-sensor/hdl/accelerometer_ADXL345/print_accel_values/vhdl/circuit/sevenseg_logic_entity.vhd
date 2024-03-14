--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_ADXL345                                        ==
--== Component : sevenseg_logic                                               ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY sevenseg_logic IS
   PORT ( accel             : IN  std_logic_vector( 3 DOWNTO 0 );
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          sevensegment      : OUT std_logic_vector( 7 DOWNTO 0 ) );
END ENTITY sevenseg_logic;
