--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : division                                                     ==
--== Component : sign_hex                                                     ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY sign_hex IS
   PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          negative          : IN  std_logic;
          a                 : OUT std_logic;
          b                 : OUT std_logic;
          c                 : OUT std_logic;
          d                 : OUT std_logic;
          e                 : OUT std_logic;
          f                 : OUT std_logic;
          g                 : OUT std_logic );
END ENTITY sign_hex;
