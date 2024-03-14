--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : johnson                                                      ==
--== Component : logisimTopLevelShell                                         ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY logisimTopLevelShell IS
   PORT ( fpgaGlobalClock : IN  std_logic;
          int1_0          : IN  std_logic;
          intbypass_0     : IN  std_logic;
          miso_0          : IN  std_logic;
          rst_0           : IN  std_logic;
          cs_0            : OUT std_logic;
          mosi_0          : OUT std_logic;
          sclk_0          : OUT std_logic );
END ENTITY logisimTopLevelShell;
