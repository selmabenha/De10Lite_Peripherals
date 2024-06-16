--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_experiments                                    ==
--== Component : Multiplier                                                   ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY Multiplier IS
   GENERIC ( calcBits           : INTEGER;
             nrOfBits           : INTEGER;
             unsignedMultiplier : INTEGER );
   PORT ( carryIn  : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
          inputA   : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
          inputB   : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
          multHigh : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
          multLow  : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
END ENTITY Multiplier;
