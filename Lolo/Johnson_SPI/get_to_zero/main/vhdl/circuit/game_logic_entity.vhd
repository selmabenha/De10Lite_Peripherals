--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero                                                  ==
--== Component : game_logic                                                   ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY game_logic IS
   PORT ( accel_input       : IN  std_logic;
          button            : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree4 : IN  std_logic_vector( 4 DOWNTO 0 );
          miso              : IN  std_logic;
          reset             : IN  std_logic;
          x_offset          : IN  std_logic_vector( 15 DOWNTO 0 );
          y_offset          : IN  std_logic_vector( 15 DOWNTO 0 );
          z_offset          : IN  std_logic_vector( 15 DOWNTO 0 );
          cs                : OUT std_logic;
          done              : OUT std_logic;
          game_reset        : OUT std_logic;
          mosi              : OUT std_logic;
          negative_x        : OUT std_logic;
          negative_y        : OUT std_logic;
          ones_x            : OUT std_logic_vector( 3 DOWNTO 0 );
          ones_y            : OUT std_logic_vector( 3 DOWNTO 0 );
          sclk              : OUT std_logic;
          tens_x            : OUT std_logic_vector( 3 DOWNTO 0 );
          tens_y            : OUT std_logic_vector( 3 DOWNTO 0 ) );
END ENTITY game_logic;
