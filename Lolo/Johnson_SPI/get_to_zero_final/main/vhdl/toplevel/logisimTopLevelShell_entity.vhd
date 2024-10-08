--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero_final                                            ==
--== Component : logisimTopLevelShell                                         ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY logisimTopLevelShell IS
   PORT ( accel_input_0           : IN  std_logic;
          fpgaGlobalClock         : IN  std_logic;
          miso_0                  : IN  std_logic;
          n_button_0              : IN  std_logic;
          n_reset_0               : IN  std_logic;
          cs_0                    : OUT std_logic;
          mosi_0                  : OUT std_logic;
          n_hex0_HEX_DecimalPoint : OUT std_logic;
          n_hex0_HEX_Segment_A    : OUT std_logic;
          n_hex0_HEX_Segment_B    : OUT std_logic;
          n_hex0_HEX_Segment_C    : OUT std_logic;
          n_hex0_HEX_Segment_D    : OUT std_logic;
          n_hex0_HEX_Segment_E    : OUT std_logic;
          n_hex0_HEX_Segment_F    : OUT std_logic;
          n_hex0_HEX_Segment_G    : OUT std_logic;
          n_hex1_HEX_DecimalPoint : OUT std_logic;
          n_hex1_HEX_Segment_A    : OUT std_logic;
          n_hex1_HEX_Segment_B    : OUT std_logic;
          n_hex1_HEX_Segment_C    : OUT std_logic;
          n_hex1_HEX_Segment_D    : OUT std_logic;
          n_hex1_HEX_Segment_E    : OUT std_logic;
          n_hex1_HEX_Segment_F    : OUT std_logic;
          n_hex1_HEX_Segment_G    : OUT std_logic;
          n_hex2_HEX_DecimalPoint : OUT std_logic;
          n_hex2_HEX_Segment_A    : OUT std_logic;
          n_hex2_HEX_Segment_B    : OUT std_logic;
          n_hex2_HEX_Segment_C    : OUT std_logic;
          n_hex2_HEX_Segment_D    : OUT std_logic;
          n_hex2_HEX_Segment_E    : OUT std_logic;
          n_hex2_HEX_Segment_F    : OUT std_logic;
          n_hex2_HEX_Segment_G    : OUT std_logic;
          n_hex3_HEX_DecimalPoint : OUT std_logic;
          n_hex3_HEX_Segment_A    : OUT std_logic;
          n_hex3_HEX_Segment_B    : OUT std_logic;
          n_hex3_HEX_Segment_C    : OUT std_logic;
          n_hex3_HEX_Segment_D    : OUT std_logic;
          n_hex3_HEX_Segment_E    : OUT std_logic;
          n_hex3_HEX_Segment_F    : OUT std_logic;
          n_hex3_HEX_Segment_G    : OUT std_logic;
          n_hex4_HEX_DecimalPoint : OUT std_logic;
          n_hex4_HEX_Segment_A    : OUT std_logic;
          n_hex4_HEX_Segment_B    : OUT std_logic;
          n_hex4_HEX_Segment_C    : OUT std_logic;
          n_hex4_HEX_Segment_D    : OUT std_logic;
          n_hex4_HEX_Segment_E    : OUT std_logic;
          n_hex4_HEX_Segment_F    : OUT std_logic;
          n_hex4_HEX_Segment_G    : OUT std_logic;
          n_hex5_HEX_DecimalPoint : OUT std_logic;
          n_hex5_HEX_Segment_A    : OUT std_logic;
          n_hex5_HEX_Segment_B    : OUT std_logic;
          n_hex5_HEX_Segment_C    : OUT std_logic;
          n_hex5_HEX_Segment_D    : OUT std_logic;
          n_hex5_HEX_Segment_E    : OUT std_logic;
          n_hex5_HEX_Segment_F    : OUT std_logic;
          n_hex5_HEX_Segment_G    : OUT std_logic;
          sclk_0                  : OUT std_logic );
END ENTITY logisimTopLevelShell;
