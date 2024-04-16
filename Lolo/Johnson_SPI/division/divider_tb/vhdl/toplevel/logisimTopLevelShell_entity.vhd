--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : division                                                     ==
--== Component : logisimTopLevelShell                                         ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY logisimTopLevelShell IS
   PORT ( Input_1_0                                              : IN  std_logic;
          Input_2_0                                              : IN  std_logic;
          Output_1_0                                             : OUT std_logic;
          n_sevenseg_output_1_L_7_Segment_Display_1_DecimalPoint : OUT std_logic;
          n_sevenseg_output_1_L_7_Segment_Display_1_Segment_A    : OUT std_logic;
          n_sevenseg_output_1_L_7_Segment_Display_1_Segment_B    : OUT std_logic;
          n_sevenseg_output_1_L_7_Segment_Display_1_Segment_C    : OUT std_logic;
          n_sevenseg_output_1_L_7_Segment_Display_1_Segment_D    : OUT std_logic;
          n_sevenseg_output_1_L_7_Segment_Display_1_Segment_E    : OUT std_logic;
          n_sevenseg_output_1_L_7_Segment_Display_1_Segment_F    : OUT std_logic;
          n_sevenseg_output_1_L_7_Segment_Display_1_Segment_G    : OUT std_logic;
          n_sevenseg_output_2_L_7_Segment_Display_1_DecimalPoint : OUT std_logic;
          n_sevenseg_output_2_L_7_Segment_Display_1_Segment_A    : OUT std_logic;
          n_sevenseg_output_2_L_7_Segment_Display_1_Segment_B    : OUT std_logic;
          n_sevenseg_output_2_L_7_Segment_Display_1_Segment_C    : OUT std_logic;
          n_sevenseg_output_2_L_7_Segment_Display_1_Segment_D    : OUT std_logic;
          n_sevenseg_output_2_L_7_Segment_Display_1_Segment_E    : OUT std_logic;
          n_sevenseg_output_2_L_7_Segment_Display_1_Segment_F    : OUT std_logic;
          n_sevenseg_output_2_L_7_Segment_Display_1_Segment_G    : OUT std_logic;
          n_sevenseg_output_3_L_7_Segment_Display_1_DecimalPoint : OUT std_logic;
          n_sevenseg_output_3_L_7_Segment_Display_1_Segment_A    : OUT std_logic;
          n_sevenseg_output_3_L_7_Segment_Display_1_Segment_B    : OUT std_logic;
          n_sevenseg_output_3_L_7_Segment_Display_1_Segment_C    : OUT std_logic;
          n_sevenseg_output_3_L_7_Segment_Display_1_Segment_D    : OUT std_logic;
          n_sevenseg_output_3_L_7_Segment_Display_1_Segment_E    : OUT std_logic;
          n_sevenseg_output_3_L_7_Segment_Display_1_Segment_F    : OUT std_logic;
          n_sevenseg_output_3_L_7_Segment_Display_1_Segment_G    : OUT std_logic );
END ENTITY logisimTopLevelShell;
