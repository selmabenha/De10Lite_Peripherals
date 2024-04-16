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
   PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
          number_input      : IN  std_logic_vector( 15 DOWNTO 0 );
          second_num        : IN  std_logic_vector( 15 DOWNTO 0 );
          answer            : OUT std_logic_vector( 15 DOWNTO 0 );
          hundreds          : OUT std_logic_vector( 3 DOWNTO 0 );
          negative          : OUT std_logic;
          ones              : OUT std_logic_vector( 3 DOWNTO 0 );
          tens              : OUT std_logic_vector( 3 DOWNTO 0 ) );
END ENTITY scale_down;
