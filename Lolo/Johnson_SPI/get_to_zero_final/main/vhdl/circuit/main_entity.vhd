--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero_final                                            ==
--== Component : main                                                         ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY main IS
   PORT ( accel_input          : IN  std_logic;
          button               : IN  std_logic;
          logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree1    : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree2    : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree3    : IN  std_logic_vector( 4 DOWNTO 0 );
          miso                 : IN  std_logic;
          reset                : IN  std_logic;
          cs                   : OUT std_logic;
          logisimOutputBubbles : OUT std_logic_vector( 47 DOWNTO 0 );
          mosi                 : OUT std_logic;
          sclk                 : OUT std_logic );
END ENTITY main;
