--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : print_ADXL345_values                                         ==
--== Component : logisimTopLevelShell                                         ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY logisimTopLevelShell IS
   PORT ( DipSwitch_1_sw_1                                             : IN  std_logic;
          DipSwitch_1_sw_2                                             : IN  std_logic;
          DipSwitch_1_sw_3                                             : IN  std_logic;
          DipSwitch_1_sw_4                                             : IN  std_logic;
          DipSwitch_1_sw_5                                             : IN  std_logic;
          DipSwitch_1_sw_6                                             : IN  std_logic;
          DipSwitch_1_sw_7                                             : IN  std_logic;
          DipSwitch_1_sw_8                                             : IN  std_logic;
          fpgaGlobalClock                                              : IN  std_logic;
          n_Input_1_0                                                  : IN  std_logic;
          n_sevenseg_accel_output_1_L_7_Segment_Display_1_DecimalPoint : OUT std_logic;
          n_sevenseg_accel_output_1_L_7_Segment_Display_1_Segment_A    : OUT std_logic;
          n_sevenseg_accel_output_1_L_7_Segment_Display_1_Segment_B    : OUT std_logic;
          n_sevenseg_accel_output_1_L_7_Segment_Display_1_Segment_C    : OUT std_logic;
          n_sevenseg_accel_output_1_L_7_Segment_Display_1_Segment_D    : OUT std_logic;
          n_sevenseg_accel_output_1_L_7_Segment_Display_1_Segment_E    : OUT std_logic;
          n_sevenseg_accel_output_1_L_7_Segment_Display_1_Segment_F    : OUT std_logic;
          n_sevenseg_accel_output_1_L_7_Segment_Display_1_Segment_G    : OUT std_logic;
          n_sevenseg_accel_output_2_L_7_Segment_Display_1_DecimalPoint : OUT std_logic;
          n_sevenseg_accel_output_2_L_7_Segment_Display_1_Segment_A    : OUT std_logic;
          n_sevenseg_accel_output_2_L_7_Segment_Display_1_Segment_B    : OUT std_logic;
          n_sevenseg_accel_output_2_L_7_Segment_Display_1_Segment_C    : OUT std_logic;
          n_sevenseg_accel_output_2_L_7_Segment_Display_1_Segment_D    : OUT std_logic;
          n_sevenseg_accel_output_2_L_7_Segment_Display_1_Segment_E    : OUT std_logic;
          n_sevenseg_accel_output_2_L_7_Segment_Display_1_Segment_F    : OUT std_logic;
          n_sevenseg_accel_output_2_L_7_Segment_Display_1_Segment_G    : OUT std_logic );
END ENTITY logisimTopLevelShell;
