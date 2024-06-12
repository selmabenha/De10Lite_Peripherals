--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2                                             ==
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

      COMPONENT accel_final_driver_tb
         PORT ( accel_input          : IN  std_logic;
                enable_accel         : IN  std_logic;
                logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimInputBubbles  : IN  std_logic_vector( 1 DOWNTO 0 );
                miso                 : IN  std_logic;
                rst                  : IN  std_logic;
                cs                   : OUT std_logic;
                logisimOutputBubbles : OUT std_logic_vector( 47 DOWNTO 0 );
                mosi                 : OUT std_logic;
                sclk                 : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_accel_input          : std_logic;
   SIGNAL s_cs                   : std_logic;
   SIGNAL s_enable_accel         : std_logic;
   SIGNAL s_fpgaTick             : std_logic;
   SIGNAL s_logisimClockTree0    : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimClockTree1    : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimInputBubbles  : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimOutputBubbles : std_logic_vector( 47 DOWNTO 0 );
   SIGNAL s_miso                 : std_logic;
   SIGNAL s_mosi                 : std_logic;
   SIGNAL s_rst                  : std_logic;
   SIGNAL s_sclk                 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All signal adaptations are performed here                                  --
   --------------------------------------------------------------------------------
   cs_0                                      <= s_cs;
   mosi_0                                    <= s_mosi;
   n_HEX0_L_7_Segment_Display_1_DecimalPoint <=  NOT s_logisimOutputBubbles(23);
   n_HEX0_L_7_Segment_Display_1_Segment_A    <=  NOT s_logisimOutputBubbles(16);
   n_HEX0_L_7_Segment_Display_1_Segment_B    <=  NOT s_logisimOutputBubbles(17);
   n_HEX0_L_7_Segment_Display_1_Segment_C    <=  NOT s_logisimOutputBubbles(18);
   n_HEX0_L_7_Segment_Display_1_Segment_D    <=  NOT s_logisimOutputBubbles(19);
   n_HEX0_L_7_Segment_Display_1_Segment_E    <=  NOT s_logisimOutputBubbles(20);
   n_HEX0_L_7_Segment_Display_1_Segment_F    <=  NOT s_logisimOutputBubbles(21);
   n_HEX0_L_7_Segment_Display_1_Segment_G    <=  NOT s_logisimOutputBubbles(22);
   n_HEX1_L_7_Segment_Display_1_DecimalPoint <=  NOT s_logisimOutputBubbles(15);
   n_HEX1_L_7_Segment_Display_1_Segment_A    <=  NOT s_logisimOutputBubbles(8);
   n_HEX1_L_7_Segment_Display_1_Segment_B    <=  NOT s_logisimOutputBubbles(9);
   n_HEX1_L_7_Segment_Display_1_Segment_C    <=  NOT s_logisimOutputBubbles(10);
   n_HEX1_L_7_Segment_Display_1_Segment_D    <=  NOT s_logisimOutputBubbles(11);
   n_HEX1_L_7_Segment_Display_1_Segment_E    <=  NOT s_logisimOutputBubbles(12);
   n_HEX1_L_7_Segment_Display_1_Segment_F    <=  NOT s_logisimOutputBubbles(13);
   n_HEX1_L_7_Segment_Display_1_Segment_G    <=  NOT s_logisimOutputBubbles(14);
   n_HEX2_L_7_Segment_Display_1_DecimalPoint <=  NOT s_logisimOutputBubbles(7);
   n_HEX2_L_7_Segment_Display_1_Segment_A    <=  NOT s_logisimOutputBubbles(0);
   n_HEX2_L_7_Segment_Display_1_Segment_B    <=  NOT s_logisimOutputBubbles(1);
   n_HEX2_L_7_Segment_Display_1_Segment_C    <=  NOT s_logisimOutputBubbles(2);
   n_HEX2_L_7_Segment_Display_1_Segment_D    <=  NOT s_logisimOutputBubbles(3);
   n_HEX2_L_7_Segment_Display_1_Segment_E    <=  NOT s_logisimOutputBubbles(4);
   n_HEX2_L_7_Segment_Display_1_Segment_F    <=  NOT s_logisimOutputBubbles(5);
   n_HEX2_L_7_Segment_Display_1_Segment_G    <=  NOT s_logisimOutputBubbles(6);
   n_HEX3_L_7_Segment_Display_1_DecimalPoint <=  NOT s_logisimOutputBubbles(47);
   n_HEX3_L_7_Segment_Display_1_Segment_A    <=  NOT s_logisimOutputBubbles(40);
   n_HEX3_L_7_Segment_Display_1_Segment_B    <=  NOT s_logisimOutputBubbles(41);
   n_HEX3_L_7_Segment_Display_1_Segment_C    <=  NOT s_logisimOutputBubbles(42);
   n_HEX3_L_7_Segment_Display_1_Segment_D    <=  NOT s_logisimOutputBubbles(43);
   n_HEX3_L_7_Segment_Display_1_Segment_E    <=  NOT s_logisimOutputBubbles(44);
   n_HEX3_L_7_Segment_Display_1_Segment_F    <=  NOT s_logisimOutputBubbles(45);
   n_HEX3_L_7_Segment_Display_1_Segment_G    <=  NOT s_logisimOutputBubbles(46);
   n_HEX4_HEX_DecimalPoint                   <=  NOT s_logisimOutputBubbles(31);
   n_HEX4_HEX_Segment_A                      <=  NOT s_logisimOutputBubbles(24);
   n_HEX4_HEX_Segment_B                      <=  NOT s_logisimOutputBubbles(25);
   n_HEX4_HEX_Segment_C                      <=  NOT s_logisimOutputBubbles(26);
   n_HEX4_HEX_Segment_D                      <=  NOT s_logisimOutputBubbles(27);
   n_HEX4_HEX_Segment_E                      <=  NOT s_logisimOutputBubbles(28);
   n_HEX4_HEX_Segment_F                      <=  NOT s_logisimOutputBubbles(29);
   n_HEX4_HEX_Segment_G                      <=  NOT s_logisimOutputBubbles(30);
   n_HEX5_HEX_DecimalPoint                   <=  NOT s_logisimOutputBubbles(39);
   n_HEX5_HEX_Segment_A                      <=  NOT s_logisimOutputBubbles(32);
   n_HEX5_HEX_Segment_B                      <=  NOT s_logisimOutputBubbles(33);
   n_HEX5_HEX_Segment_C                      <=  NOT s_logisimOutputBubbles(34);
   n_HEX5_HEX_Segment_D                      <=  NOT s_logisimOutputBubbles(35);
   n_HEX5_HEX_Segment_E                      <=  NOT s_logisimOutputBubbles(36);
   n_HEX5_HEX_Segment_F                      <=  NOT s_logisimOutputBubbles(37);
   n_HEX5_HEX_Segment_G                      <=  NOT s_logisimOutputBubbles(38);
   s_accel_input                             <= accel_input_0;
   s_enable_accel                            <= enable_accel_0;
   s_logisimInputBubbles(0)                  <= DipSwitch_1_sw_1;
   s_logisimInputBubbles(1)                  <= DipSwitch_1_sw_2;
   s_miso                                    <= miso_0;
   s_rst                                     <= rst_0;
   sclk_0                                    <= s_sclk;

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
      GENERIC MAP ( highTicks => 500000,
                    lowTicks  => 500000,
                    nrOfBits  => 20,
                    phase     => 1 )
      PORT MAP ( clockBus    => s_logisimClockTree1,
                 clockTick   => s_fpgaTick,
                 globalClock => fpgaGlobalClock );

   --------------------------------------------------------------------------------
   -- The toplevel component is connected here                                   --
   --------------------------------------------------------------------------------
   CIRCUIT_0 : accel_final_driver_tb
      PORT MAP ( accel_input          => s_accel_input,
                 cs                   => s_cs,
                 enable_accel         => s_enable_accel,
                 logisimClockTree0    => s_logisimClockTree0,
                 logisimClockTree1    => s_logisimClockTree1,
                 logisimInputBubbles  => s_logisimInputBubbles,
                 logisimOutputBubbles => s_logisimOutputBubbles,
                 miso                 => s_miso,
                 mosi                 => s_mosi,
                 rst                  => s_rst,
                 sclk                 => s_sclk );
END platformIndependent;
