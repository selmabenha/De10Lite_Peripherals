--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2_BACKUP                                      ==
--== Component : move_buffer_fsm                                              ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY move_buffer_fsm IS
   PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          state             : IN  std_logic;
          enable            : OUT std_logic );
END ENTITY move_buffer_fsm;
