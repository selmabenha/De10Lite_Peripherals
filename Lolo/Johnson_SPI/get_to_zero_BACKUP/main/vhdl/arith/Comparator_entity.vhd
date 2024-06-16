--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero_BACKUP                                           ==
--== Component : Comparator                                                   ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY Comparator IS
   GENERIC ( nrOfBits       : INTEGER;
             twosComplement : INTEGER );
   PORT ( dataA         : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
          dataB         : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
          aEqualsB      : OUT std_logic;
          aGreaterThanB : OUT std_logic;
          aLessThanB    : OUT std_logic );
END ENTITY Comparator;
