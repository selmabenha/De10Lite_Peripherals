--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2_BACKUP3                                     ==
--== Component : AND_GATE_6_INPUTS                                            ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY AND_GATE_6_INPUTS IS
   GENERIC ( BubblesMask : std_logic_vector );
   PORT ( input1 : IN  std_logic;
          input2 : IN  std_logic;
          input3 : IN  std_logic;
          input4 : IN  std_logic;
          input5 : IN  std_logic;
          input6 : IN  std_logic;
          result : OUT std_logic );
END ENTITY AND_GATE_6_INPUTS;
