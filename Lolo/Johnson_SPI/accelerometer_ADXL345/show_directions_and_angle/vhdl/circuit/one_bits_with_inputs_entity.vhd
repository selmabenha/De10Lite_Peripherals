--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_ADXL345                                        ==
--== Component : one_bits_with_inputs                                         ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY one_bits_with_inputs IS
   PORT ( A                      : IN  std_logic;
          A_bigger_than_B_input  : IN  std_logic;
          A_equal_B_input        : IN  std_logic;
          A_less_B_input         : IN  std_logic;
          B                      : IN  std_logic;
          logisimClockTree0      : IN  std_logic_vector( 4 DOWNTO 0 );
          A_bigger_than_B_output : OUT std_logic;
          A_equals_B_output      : OUT std_logic;
          A_less_than_B_output   : OUT std_logic );
END ENTITY one_bits_with_inputs;
