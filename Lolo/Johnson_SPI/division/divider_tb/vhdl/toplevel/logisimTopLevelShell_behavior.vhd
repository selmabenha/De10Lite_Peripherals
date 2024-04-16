--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : division                                                     ==
--== Component : logisimTopLevelShell                                         ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF logisimTopLevelShell IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
      COMPONENT divider_tb
         PORT ( Input_1              : IN  std_logic;
                Input_2              : IN  std_logic;
                Output_1             : OUT std_logic;
                logisimOutputBubbles : OUT std_logic_vector( 23 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_Input_1              : std_logic;
   SIGNAL s_Input_2              : std_logic;
   SIGNAL s_Output_1             : std_logic;
   SIGNAL s_logisimOutputBubbles : std_logic_vector( 23 DOWNTO 0 );

BEGIN

   --------------------------------------------------------------------------------
   -- All signal adaptations are performed here                                  --
   --------------------------------------------------------------------------------
   Output_1_0                                             <= s_Output_1;
   n_sevenseg_output_1_L_7_Segment_Display_1_DecimalPoint <=  NOT s_logisimOutputBubbles(7);
   n_sevenseg_output_1_L_7_Segment_Display_1_Segment_A    <=  NOT s_logisimOutputBubbles(0);
   n_sevenseg_output_1_L_7_Segment_Display_1_Segment_B    <=  NOT s_logisimOutputBubbles(1);
   n_sevenseg_output_1_L_7_Segment_Display_1_Segment_C    <=  NOT s_logisimOutputBubbles(2);
   n_sevenseg_output_1_L_7_Segment_Display_1_Segment_D    <=  NOT s_logisimOutputBubbles(3);
   n_sevenseg_output_1_L_7_Segment_Display_1_Segment_E    <=  NOT s_logisimOutputBubbles(4);
   n_sevenseg_output_1_L_7_Segment_Display_1_Segment_F    <=  NOT s_logisimOutputBubbles(5);
   n_sevenseg_output_1_L_7_Segment_Display_1_Segment_G    <=  NOT s_logisimOutputBubbles(6);
   n_sevenseg_output_2_L_7_Segment_Display_1_DecimalPoint <=  NOT s_logisimOutputBubbles(15);
   n_sevenseg_output_2_L_7_Segment_Display_1_Segment_A    <=  NOT s_logisimOutputBubbles(8);
   n_sevenseg_output_2_L_7_Segment_Display_1_Segment_B    <=  NOT s_logisimOutputBubbles(9);
   n_sevenseg_output_2_L_7_Segment_Display_1_Segment_C    <=  NOT s_logisimOutputBubbles(10);
   n_sevenseg_output_2_L_7_Segment_Display_1_Segment_D    <=  NOT s_logisimOutputBubbles(11);
   n_sevenseg_output_2_L_7_Segment_Display_1_Segment_E    <=  NOT s_logisimOutputBubbles(12);
   n_sevenseg_output_2_L_7_Segment_Display_1_Segment_F    <=  NOT s_logisimOutputBubbles(13);
   n_sevenseg_output_2_L_7_Segment_Display_1_Segment_G    <=  NOT s_logisimOutputBubbles(14);
   n_sevenseg_output_3_L_7_Segment_Display_1_DecimalPoint <=  NOT s_logisimOutputBubbles(23);
   n_sevenseg_output_3_L_7_Segment_Display_1_Segment_A    <=  NOT s_logisimOutputBubbles(16);
   n_sevenseg_output_3_L_7_Segment_Display_1_Segment_B    <=  NOT s_logisimOutputBubbles(17);
   n_sevenseg_output_3_L_7_Segment_Display_1_Segment_C    <=  NOT s_logisimOutputBubbles(18);
   n_sevenseg_output_3_L_7_Segment_Display_1_Segment_D    <=  NOT s_logisimOutputBubbles(19);
   n_sevenseg_output_3_L_7_Segment_Display_1_Segment_E    <=  NOT s_logisimOutputBubbles(20);
   n_sevenseg_output_3_L_7_Segment_Display_1_Segment_F    <=  NOT s_logisimOutputBubbles(21);
   n_sevenseg_output_3_L_7_Segment_Display_1_Segment_G    <=  NOT s_logisimOutputBubbles(22);
   s_Input_1                                              <= Input_1_0;
   s_Input_2                                              <= Input_2_0;

   --------------------------------------------------------------------------------
   -- The toplevel component is connected here                                   --
   --------------------------------------------------------------------------------
   CIRCUIT_0 : divider_tb
      PORT MAP ( Input_1              => s_Input_1,
                 Input_2              => s_Input_2,
                 Output_1             => s_Output_1,
                 logisimOutputBubbles => s_logisimOutputBubbles );
END platformIndependent;
