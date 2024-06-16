--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_final                                          ==
--== Component : accel_driver                                                 ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY accel_driver IS
   PORT ( accel_int    : IN  std_logic;
          clk          : IN  std_logic;
          enable_accel : IN  std_logic;
          rst          : IN  std_logic;
          rxData       : IN  std_logic_vector( 7 DOWNTO 0 );
          rxDataReady  : IN  std_logic;
          accel_data   : OUT std_logic_vector( 47 DOWNTO 0 );
          bytes        : OUT std_logic_vector( 3 DOWNTO 0 );
          c            : OUT std_logic;
          go           : OUT std_logic;
          pha          : OUT std_logic;
          pol          : OUT std_logic;
          stateID      : OUT std_logic_vector( 2 DOWNTO 0 );
          txData       : OUT std_logic_vector( 7 DOWNTO 0 ) );
END ENTITY accel_driver;
