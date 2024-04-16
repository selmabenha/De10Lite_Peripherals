--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : division                                                     ==
--== Component : twos_complement                                              ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY twos_complement IS
   PORT ( Input_1      : IN  std_logic;
          Input_2      : IN  std_logic;
          Input_bus_1  : IN  std_logic_vector( 15 DOWNTO 0 );
          Output_1     : OUT std_logic;
          Output_bus_1 : OUT std_logic_vector( 15 DOWNTO 0 ) );
END ENTITY twos_complement;
