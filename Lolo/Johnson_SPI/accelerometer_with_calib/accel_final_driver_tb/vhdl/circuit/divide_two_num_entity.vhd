--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_with_calib                                     ==
--== Component : divide_two_num                                               ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY divide_two_num IS
   PORT ( val                       : IN  std_logic_vector( 15 DOWNTO 0 );
          val2                      : IN  std_logic_vector( 15 DOWNTO 0 );
          final_answer              : OUT std_logic_vector( 7 DOWNTO 0 );
          final_answer_sixteen_bits : OUT std_logic_vector( 15 DOWNTO 0 ) );
END ENTITY divide_two_num;
