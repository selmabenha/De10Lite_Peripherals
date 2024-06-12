--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2_BACKUP3                                     ==
--== Component : calibration                                                  ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY calibration IS
   PORT ( accel_input       : IN  std_logic;
          enable_accel      : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
          miso              : IN  std_logic;
          rst               : IN  std_logic;
          x_offset          : IN  std_logic_vector( 15 DOWNTO 0 );
          y_offset          : IN  std_logic_vector( 15 DOWNTO 0 );
          z_offset          : IN  std_logic_vector( 15 DOWNTO 0 );
          cs                : OUT std_logic;
          mosi              : OUT std_logic;
          sclk              : OUT std_logic;
          x_filtered        : OUT std_logic_vector( 15 DOWNTO 0 );
          y_filtered        : OUT std_logic_vector( 15 DOWNTO 0 );
          z_filtered        : OUT std_logic_vector( 15 DOWNTO 0 ) );
END ENTITY calibration;
