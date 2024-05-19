--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2                                             ==
--== Component : reset_logic                                                  ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY reset_logic IS
   PORT ( enable            : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree4 : IN  std_logic_vector( 4 DOWNTO 0 );
          reset             : IN  std_logic;
          enable_out        : OUT std_logic;
          reset_out         : OUT std_logic );
END ENTITY reset_logic;
