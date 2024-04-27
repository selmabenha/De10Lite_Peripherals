--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : print_ADXL345_values                                         ==
--== Component : LogisimRNG                                                   ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY LogisimRNG IS
   GENERIC ( nrOfBits : INTEGER;
             seed     : std_logic_vector );
   PORT ( clear  : IN  std_logic;
          clock  : IN  std_logic;
          enable : IN  std_logic;
          tick   : IN  std_logic;
          q      : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
END ENTITY LogisimRNG;
