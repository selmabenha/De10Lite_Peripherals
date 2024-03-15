--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : directions_and_angles                                        ==
--== Component : AND_GATE_5_INPUTS                                            ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY AND_GATE_5_INPUTS IS
   GENERIC ( BubblesMask : std_logic_vector );
   PORT ( input1 : IN  std_logic;
          input2 : IN  std_logic;
          input3 : IN  std_logic;
          input4 : IN  std_logic;
          input5 : IN  std_logic;
          result : OUT std_logic );
END ENTITY AND_GATE_5_INPUTS;
