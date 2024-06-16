--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_final                                          ==
--== Component : spi_accelerometer                                            ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY spi_accelerometer IS
   PORT ( accel_int    : IN  std_logic;
          clk50MHz     : IN  std_logic;
          enable_accel : IN  std_logic;
          miso         : IN  std_logic;
          rst          : IN  std_logic;
          accel        : OUT std_logic_vector( 47 DOWNTO 0 );
          cs           : OUT std_logic;
          mosi         : OUT std_logic;
          sclk         : OUT std_logic );
END ENTITY spi_accelerometer;
