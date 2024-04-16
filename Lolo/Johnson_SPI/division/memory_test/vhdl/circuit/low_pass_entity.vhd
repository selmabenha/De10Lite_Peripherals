--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : division                                                     ==
--== Component : low_pass                                                     ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY low_pass IS
   PORT ( new_val               : IN  std_logic_vector( 7 DOWNTO 0 );
          val                   : IN  std_logic_vector( 7 DOWNTO 0 );
          final_answer_filtered : OUT std_logic_vector( 7 DOWNTO 0 );
          hundreds_filtered     : OUT std_logic_vector( 3 DOWNTO 0 );
          ones_filtered         : OUT std_logic_vector( 3 DOWNTO 0 );
          tens_filtered         : OUT std_logic_vector( 3 DOWNTO 0 ) );
END ENTITY low_pass;
