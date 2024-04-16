--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : print_ADXL345_values                                         ==
--== Component : lowpass                                                      ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY lowpass IS
   PORT ( new_val               : IN  std_logic_vector( 7 DOWNTO 0 );
          val                   : IN  std_logic_vector( 7 DOWNTO 0 );
          final_answer_filtered : OUT std_logic_vector( 7 DOWNTO 0 ) );
END ENTITY lowpass;
