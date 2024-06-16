--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_experiments                                    ==
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

      COMPONENT error_calc
         PORT ( accel_input          : IN  std_logic;
                enable_accel         : IN  std_logic;
                logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1    : IN  std_logic_vector( 4 DOWNTO 0 );
                miso                 : IN  std_logic;
                rst                  : IN  std_logic;
                selector             : IN  std_logic;
                cs                   : OUT std_logic;
                led                  : OUT std_logic;
                logisimOutputBubbles : OUT std_logic_vector( 31 DOWNTO 0 );
                mosi                 : OUT std_logic;
                sclk                 : OUT std_logic;
                y                    : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_accel_input          : std_logic;
   SIGNAL s_cs                   : std_logic;
   SIGNAL s_enable_accel         : std_logic;
   SIGNAL s_fpgaTick             : std_logic;
   SIGNAL s_led                  : std_logic;
   SIGNAL s_logisimClockTree0    : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimClockTree1    : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimOutputBubbles : std_logic_vector( 31 DOWNTO 0 );
   SIGNAL s_miso                 : std_logic;
   SIGNAL s_mosi                 : std_logic;
   SIGNAL s_rst                  : std_logic;
   SIGNAL s_sclk                 : std_logic;
   SIGNAL s_selector             : std_logic;
   SIGNAL s_y                    : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All signal adaptations are performed here                                  --
   --------------------------------------------------------------------------------
   cs_0                                                           <= s_cs;
   led_0                                                          <= s_led;
   mosi_0                                                         <= s_mosi;
   n_sevenseg_numbers_output_1_L_7_Segment_Display_1_DecimalPoint <=  NOT s_logisimOutputBubbles(7);
   n_sevenseg_numbers_output_1_L_7_Segment_Display_1_Segment_A    <=  NOT s_logisimOutputBubbles(0);
   n_sevenseg_numbers_output_1_L_7_Segment_Display_1_Segment_B    <=  NOT s_logisimOutputBubbles(1);
   n_sevenseg_numbers_output_1_L_7_Segment_Display_1_Segment_C    <=  NOT s_logisimOutputBubbles(2);
   n_sevenseg_numbers_output_1_L_7_Segment_Display_1_Segment_D    <=  NOT s_logisimOutputBubbles(3);
   n_sevenseg_numbers_output_1_L_7_Segment_Display_1_Segment_E    <=  NOT s_logisimOutputBubbles(4);
   n_sevenseg_numbers_output_1_L_7_Segment_Display_1_Segment_F    <=  NOT s_logisimOutputBubbles(5);
   n_sevenseg_numbers_output_1_L_7_Segment_Display_1_Segment_G    <=  NOT s_logisimOutputBubbles(6);
   n_sevenseg_numbers_output_2_L_7_Segment_Display_1_DecimalPoint <=  NOT s_logisimOutputBubbles(15);
   n_sevenseg_numbers_output_2_L_7_Segment_Display_1_Segment_A    <=  NOT s_logisimOutputBubbles(8);
   n_sevenseg_numbers_output_2_L_7_Segment_Display_1_Segment_B    <=  NOT s_logisimOutputBubbles(9);
   n_sevenseg_numbers_output_2_L_7_Segment_Display_1_Segment_C    <=  NOT s_logisimOutputBubbles(10);
   n_sevenseg_numbers_output_2_L_7_Segment_Display_1_Segment_D    <=  NOT s_logisimOutputBubbles(11);
   n_sevenseg_numbers_output_2_L_7_Segment_Display_1_Segment_E    <=  NOT s_logisimOutputBubbles(12);
   n_sevenseg_numbers_output_2_L_7_Segment_Display_1_Segment_F    <=  NOT s_logisimOutputBubbles(13);
   n_sevenseg_numbers_output_2_L_7_Segment_Display_1_Segment_G    <=  NOT s_logisimOutputBubbles(14);
   n_sevenseg_numbers_output_3_L_7_Segment_Display_1_DecimalPoint <=  NOT s_logisimOutputBubbles(23);
   n_sevenseg_numbers_output_3_L_7_Segment_Display_1_Segment_A    <=  NOT s_logisimOutputBubbles(16);
   n_sevenseg_numbers_output_3_L_7_Segment_Display_1_Segment_B    <=  NOT s_logisimOutputBubbles(17);
   n_sevenseg_numbers_output_3_L_7_Segment_Display_1_Segment_C    <=  NOT s_logisimOutputBubbles(18);
   n_sevenseg_numbers_output_3_L_7_Segment_Display_1_Segment_D    <=  NOT s_logisimOutputBubbles(19);
   n_sevenseg_numbers_output_3_L_7_Segment_Display_1_Segment_E    <=  NOT s_logisimOutputBubbles(20);
   n_sevenseg_numbers_output_3_L_7_Segment_Display_1_Segment_F    <=  NOT s_logisimOutputBubbles(21);
   n_sevenseg_numbers_output_3_L_7_Segment_Display_1_Segment_G    <=  NOT s_logisimOutputBubbles(22);
   n_sevenseg_numbers_output_4_L_7_Segment_Display_1_DecimalPoint <=  NOT s_logisimOutputBubbles(31);
   n_sevenseg_numbers_output_4_L_7_Segment_Display_1_Segment_A    <=  NOT s_logisimOutputBubbles(24);
   n_sevenseg_numbers_output_4_L_7_Segment_Display_1_Segment_B    <=  NOT s_logisimOutputBubbles(25);
   n_sevenseg_numbers_output_4_L_7_Segment_Display_1_Segment_C    <=  NOT s_logisimOutputBubbles(26);
   n_sevenseg_numbers_output_4_L_7_Segment_Display_1_Segment_D    <=  NOT s_logisimOutputBubbles(27);
   n_sevenseg_numbers_output_4_L_7_Segment_Display_1_Segment_E    <=  NOT s_logisimOutputBubbles(28);
   n_sevenseg_numbers_output_4_L_7_Segment_Display_1_Segment_F    <=  NOT s_logisimOutputBubbles(29);
   n_sevenseg_numbers_output_4_L_7_Segment_Display_1_Segment_G    <=  NOT s_logisimOutputBubbles(30);
   s_accel_input                                                  <= accel_input_0;
   s_enable_accel                                                 <= enable_accel_0;
   s_miso                                                         <= miso_0;
   s_rst                                                          <= rst_0;
   s_selector                                                     <= selector_0;
   sclk_0                                                         <= s_sclk;
   y_0                                                            <= s_y;

   --------------------------------------------------------------------------------
   -- The clock tree components are defined here                                 --
   --------------------------------------------------------------------------------
   BASE_0 : logisimTickGenerator
      GENERIC MAP ( nrOfBits    => 4,
                    reloadValue => 10 )
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
   BASE_2 : LogisimClockComponent
      GENERIC MAP ( highTicks => 125000,
                    lowTicks  => 125000,
                    nrOfBits  => 18,
                    phase     => 1 )
      PORT MAP ( clockBus    => s_logisimClockTree1,
                 clockTick   => s_fpgaTick,
                 globalClock => fpgaGlobalClock );

   --------------------------------------------------------------------------------
   -- The toplevel component is connected here                                   --
   --------------------------------------------------------------------------------
   CIRCUIT_0 : error_calc
      PORT MAP ( accel_input          => s_accel_input,
                 cs                   => s_cs,
                 enable_accel         => s_enable_accel,
                 led                  => s_led,
                 logisimClockTree0    => s_logisimClockTree0,
                 logisimClockTree1    => s_logisimClockTree1,
                 logisimOutputBubbles => s_logisimOutputBubbles,
                 miso                 => s_miso,
                 mosi                 => s_mosi,
                 rst                  => s_rst,
                 sclk                 => s_sclk,
                 selector             => s_selector,
                 y                    => s_y );
END platformIndependent;
