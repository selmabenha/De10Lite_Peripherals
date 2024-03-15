--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_ADXL345                                        ==
--== Component : sixteen_bits_comparator                                      ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY sixteen_bits_comparator IS
   PORT ( A                 : IN  std_logic_vector( 15 DOWNTO 0 );
          B                 : IN  std_logic_vector( 15 DOWNTO 0 );
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          A_bigger_than_B   : OUT std_logic;
          A_equals_B        : OUT std_logic;
          A_less_than_B     : OUT std_logic );
END ENTITY sixteen_bits_comparator;
