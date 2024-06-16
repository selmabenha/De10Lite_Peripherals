--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_experiments                                    ==
--== Component : clock_div                                                    ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY clock_div IS
   PORT ( bytes      : IN  std_logic_vector( 3 DOWNTO 0 );
          clk_in     : IN  std_logic;
          enable     : IN  std_logic;
          polarity   : IN  std_logic;
          rst        : IN  std_logic;
          byte_flag  : OUT std_logic;
          clk_active : OUT std_logic;
          clk_out    : OUT std_logic );
END ENTITY clock_div;
