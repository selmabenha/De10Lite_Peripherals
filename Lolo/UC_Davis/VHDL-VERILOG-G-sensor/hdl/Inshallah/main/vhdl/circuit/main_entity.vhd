--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Inshallah                                                    ==
--== Component : main                                                         ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY main IS
   PORT ( Input_bus_1       : IN  std_logic_vector( 1 DOWNTO 0 );
          Input_bus_2       : IN  std_logic_vector( 9 DOWNTO 0 );
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          Output_bus_1      : OUT std_logic_vector( 7 DOWNTO 0 );
          Output_bus_2      : OUT std_logic_vector( 7 DOWNTO 0 );
          Output_bus_3      : OUT std_logic_vector( 7 DOWNTO 0 );
          Output_bus_4      : OUT std_logic_vector( 7 DOWNTO 0 );
          Output_bus_5      : OUT std_logic_vector( 7 DOWNTO 0 );
          Output_bus_6      : OUT std_logic_vector( 7 DOWNTO 0 );
          Output_bus_7      : OUT std_logic_vector( 9 DOWNTO 0 ) );
END ENTITY main;
