--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero_BACKUP                                           ==
--== Component : logisimTickGenerator                                         ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY logisimTickGenerator IS
   GENERIC ( nrOfBits    : INTEGER;
             reloadValue : INTEGER );
   PORT ( FPGAClock : IN  std_logic;
          FPGATick  : OUT std_logic );
END ENTITY logisimTickGenerator;
