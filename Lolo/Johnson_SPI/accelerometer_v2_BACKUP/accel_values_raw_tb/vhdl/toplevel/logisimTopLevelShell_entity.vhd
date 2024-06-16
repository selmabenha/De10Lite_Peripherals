--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2_BACKUP                                      ==
--== Component : logisimTopLevelShell                                         ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY logisimTopLevelShell IS
   PORT ( AXIS_SELECTOR_sw_1                        : IN  std_logic;
          AXIS_SELECTOR_sw_2                        : IN  std_logic;
          accel_input_0                             : IN  std_logic;
          enable_accel_0                            : IN  std_logic;
          fpgaGlobalClock                           : IN  std_logic;
          miso_0                                    : IN  std_logic;
          rst_0                                     : IN  std_logic;
          cs_0                                      : OUT std_logic;
          mosi_0                                    : OUT std_logic;
          n_HEX0_L_7_Segment_Display_1_DecimalPoint : OUT std_logic;
          n_HEX0_L_7_Segment_Display_1_Segment_A    : OUT std_logic;
          n_HEX0_L_7_Segment_Display_1_Segment_B    : OUT std_logic;
          n_HEX0_L_7_Segment_Display_1_Segment_C    : OUT std_logic;
          n_HEX0_L_7_Segment_Display_1_Segment_D    : OUT std_logic;
          n_HEX0_L_7_Segment_Display_1_Segment_E    : OUT std_logic;
          n_HEX0_L_7_Segment_Display_1_Segment_F    : OUT std_logic;
          n_HEX0_L_7_Segment_Display_1_Segment_G    : OUT std_logic;
          n_HEX1_L_7_Segment_Display_1_DecimalPoint : OUT std_logic;
          n_HEX1_L_7_Segment_Display_1_Segment_A    : OUT std_logic;
          n_HEX1_L_7_Segment_Display_1_Segment_B    : OUT std_logic;
          n_HEX1_L_7_Segment_Display_1_Segment_C    : OUT std_logic;
          n_HEX1_L_7_Segment_Display_1_Segment_D    : OUT std_logic;
          n_HEX1_L_7_Segment_Display_1_Segment_E    : OUT std_logic;
          n_HEX1_L_7_Segment_Display_1_Segment_F    : OUT std_logic;
          n_HEX1_L_7_Segment_Display_1_Segment_G    : OUT std_logic;
          n_HEX2_L_7_Segment_Display_1_DecimalPoint : OUT std_logic;
          n_HEX2_L_7_Segment_Display_1_Segment_A    : OUT std_logic;
          n_HEX2_L_7_Segment_Display_1_Segment_B    : OUT std_logic;
          n_HEX2_L_7_Segment_Display_1_Segment_C    : OUT std_logic;
          n_HEX2_L_7_Segment_Display_1_Segment_D    : OUT std_logic;
          n_HEX2_L_7_Segment_Display_1_Segment_E    : OUT std_logic;
          n_HEX2_L_7_Segment_Display_1_Segment_F    : OUT std_logic;
          n_HEX2_L_7_Segment_Display_1_Segment_G    : OUT std_logic;
          n_HEX3_L_7_Segment_Display_1_DecimalPoint : OUT std_logic;
          n_HEX3_L_7_Segment_Display_1_Segment_A    : OUT std_logic;
          n_HEX3_L_7_Segment_Display_1_Segment_B    : OUT std_logic;
          n_HEX3_L_7_Segment_Display_1_Segment_C    : OUT std_logic;
          n_HEX3_L_7_Segment_Display_1_Segment_D    : OUT std_logic;
          n_HEX3_L_7_Segment_Display_1_Segment_E    : OUT std_logic;
          n_HEX3_L_7_Segment_Display_1_Segment_F    : OUT std_logic;
          n_HEX3_L_7_Segment_Display_1_Segment_G    : OUT std_logic;
          sclk_0                                    : OUT std_logic );
END ENTITY logisimTopLevelShell;
