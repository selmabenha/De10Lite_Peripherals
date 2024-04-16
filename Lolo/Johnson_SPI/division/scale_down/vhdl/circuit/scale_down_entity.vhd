--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : division                                                     ==
--== Component : scale_down                                                   ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY scale_down IS
   PORT ( Input_1      : IN  std_logic;
          Input_2      : IN  std_logic;
          number_input : IN  std_logic_vector( 15 DOWNTO 0 );
          Output_1     : OUT std_logic;
          answer       : OUT std_logic_vector( 7 DOWNTO 0 );
          hundreds     : OUT std_logic_vector( 3 DOWNTO 0 );
          negative     : OUT std_logic;
          ones         : OUT std_logic_vector( 3 DOWNTO 0 );
          tens         : OUT std_logic_vector( 3 DOWNTO 0 ) );
END ENTITY scale_down;
