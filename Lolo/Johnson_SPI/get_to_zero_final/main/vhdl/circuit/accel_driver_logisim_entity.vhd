--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_final                                          ==
--== Component : accel_driver_logisim                                         ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY accel_driver_logisim IS
   PORT ( accel_int         : IN  std_logic;
          enable_accel      : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
          miso              : IN  std_logic;
          rst               : IN  std_logic;
          Accelerometer     : OUT std_logic_vector( 47 DOWNTO 0 );
          cs                : OUT std_logic;
          mosi              : OUT std_logic;
          sclk              : OUT std_logic );
END ENTITY accel_driver_logisim;
