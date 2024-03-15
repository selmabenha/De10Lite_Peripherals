--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_ADXL345                                        ==
--== Component : spi_master                                                   ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY spi_master IS
   PORT ( accel_input : IN  std_logic;
          bytes       : IN  std_logic_vector( 3 DOWNTO 0 );
          clk         : IN  std_logic;
          go          : IN  std_logic;
          int2        : IN  std_logic;
          miso        : IN  std_logic;
          pha         : IN  std_logic;
          pol         : IN  std_logic;
          rst         : IN  std_logic;
          txData      : IN  std_logic_vector( 7 DOWNTO 0 );
          cs_out      : OUT std_logic;
          mosi        : OUT std_logic;
          rxData      : OUT std_logic_vector( 7 DOWNTO 0 );
          rxDataReady : OUT std_logic;
          sclk_out    : OUT std_logic );
END ENTITY spi_master;
