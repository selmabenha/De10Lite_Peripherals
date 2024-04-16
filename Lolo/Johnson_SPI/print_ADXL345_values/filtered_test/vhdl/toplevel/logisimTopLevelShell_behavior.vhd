--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : print_ADXL345_values                                         ==
--== Component : logisimTopLevelShell                                         ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF logisimTopLevelShell IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
      COMPONENT logisimTickGenerator
         GENERIC ( nrOfBits    : INTEGER;
                   reloadValue : INTEGER );
         PORT ( FPGAClock : IN  std_logic;
                FPGATick  : OUT std_logic );
      END COMPONENT;

      COMPONENT LogisimClockComponent
         GENERIC ( highTicks : INTEGER;
                   lowTicks  : INTEGER;
                   nrOfBits  : INTEGER;
                   phase     : INTEGER );
         PORT ( clockTick   : IN  std_logic;
                globalClock : IN  std_logic;
                clockBus    : OUT std_logic_vector( 4 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT filtered_test
         PORT ( Input_1              : IN  std_logic;
                logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimInputBubbles  : IN  std_logic_vector( 7 DOWNTO 0 );
                logisimOutputBubbles : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_Input_1              : std_logic;
   SIGNAL s_fpgaTick             : std_logic;
   SIGNAL s_logisimClockTree0    : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimInputBubbles  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimOutputBubbles : std_logic_vector( 15 DOWNTO 0 );

BEGIN

   --------------------------------------------------------------------------------
   -- All signal adaptations are performed here                                  --
   --------------------------------------------------------------------------------
   n_sevenseg_accel_output_1_L_7_Segment_Display_1_DecimalPoint <=  NOT s_logisimOutputBubbles(7);
   n_sevenseg_accel_output_1_L_7_Segment_Display_1_Segment_A    <=  NOT s_logisimOutputBubbles(0);
   n_sevenseg_accel_output_1_L_7_Segment_Display_1_Segment_B    <=  NOT s_logisimOutputBubbles(1);
   n_sevenseg_accel_output_1_L_7_Segment_Display_1_Segment_C    <=  NOT s_logisimOutputBubbles(2);
   n_sevenseg_accel_output_1_L_7_Segment_Display_1_Segment_D    <=  NOT s_logisimOutputBubbles(3);
   n_sevenseg_accel_output_1_L_7_Segment_Display_1_Segment_E    <=  NOT s_logisimOutputBubbles(4);
   n_sevenseg_accel_output_1_L_7_Segment_Display_1_Segment_F    <=  NOT s_logisimOutputBubbles(5);
   n_sevenseg_accel_output_1_L_7_Segment_Display_1_Segment_G    <=  NOT s_logisimOutputBubbles(6);
   n_sevenseg_accel_output_2_L_7_Segment_Display_1_DecimalPoint <=  NOT s_logisimOutputBubbles(15);
   n_sevenseg_accel_output_2_L_7_Segment_Display_1_Segment_A    <=  NOT s_logisimOutputBubbles(8);
   n_sevenseg_accel_output_2_L_7_Segment_Display_1_Segment_B    <=  NOT s_logisimOutputBubbles(9);
   n_sevenseg_accel_output_2_L_7_Segment_Display_1_Segment_C    <=  NOT s_logisimOutputBubbles(10);
   n_sevenseg_accel_output_2_L_7_Segment_Display_1_Segment_D    <=  NOT s_logisimOutputBubbles(11);
   n_sevenseg_accel_output_2_L_7_Segment_Display_1_Segment_E    <=  NOT s_logisimOutputBubbles(12);
   n_sevenseg_accel_output_2_L_7_Segment_Display_1_Segment_F    <=  NOT s_logisimOutputBubbles(13);
   n_sevenseg_accel_output_2_L_7_Segment_Display_1_Segment_G    <=  NOT s_logisimOutputBubbles(14);
   s_Input_1                                                    <=  NOT n_Input_1_0;
   s_logisimInputBubbles(0)                                     <= DipSwitch_1_sw_1;
   s_logisimInputBubbles(1)                                     <= DipSwitch_1_sw_2;
   s_logisimInputBubbles(2)                                     <= DipSwitch_1_sw_3;
   s_logisimInputBubbles(3)                                     <= DipSwitch_1_sw_4;
   s_logisimInputBubbles(4)                                     <= DipSwitch_1_sw_5;
   s_logisimInputBubbles(5)                                     <= DipSwitch_1_sw_6;
   s_logisimInputBubbles(6)                                     <= DipSwitch_1_sw_7;
   s_logisimInputBubbles(7)                                     <= DipSwitch_1_sw_8;

   --------------------------------------------------------------------------------
   -- The clock tree components are defined here                                 --
   --------------------------------------------------------------------------------
   BASE_0 : logisimTickGenerator
      GENERIC MAP ( nrOfBits    => 23,
                    reloadValue => 6250000 )
      PORT MAP ( FPGAClock => fpgaGlobalClock,
                 FPGATick  => s_fpgaTick );

   BASE_1 : LogisimClockComponent
      GENERIC MAP ( highTicks => 1,
                    lowTicks  => 1,
                    nrOfBits  => 1,
                    phase     => 1 )
      PORT MAP ( clockBus    => s_logisimClockTree0,
                 clockTick   => s_fpgaTick,
                 globalClock => fpgaGlobalClock );

   --------------------------------------------------------------------------------
   -- The toplevel component is connected here                                   --
   --------------------------------------------------------------------------------
   CIRCUIT_0 : filtered_test
      PORT MAP ( Input_1              => s_Input_1,
                 logisimClockTree0    => s_logisimClockTree0,
                 logisimInputBubbles  => s_logisimInputBubbles,
                 logisimOutputBubbles => s_logisimOutputBubbles );
END platformIndependent;
