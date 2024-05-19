--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero                                                  ==
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

      COMPONENT timer
         PORT ( enable               : IN  std_logic;
                logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                reset                : IN  std_logic;
                stop                 : IN  std_logic;
                logisimOutputBubbles : OUT std_logic_vector( 23 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_enable               : std_logic;
   SIGNAL s_fpgaTick             : std_logic;
   SIGNAL s_logisimClockTree0    : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimOutputBubbles : std_logic_vector( 23 DOWNTO 0 );
   SIGNAL s_reset                : std_logic;
   SIGNAL s_stop                 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All signal adaptations are performed here                                  --
   --------------------------------------------------------------------------------
   n_hex0_L_7_Segment_Display_1_DecimalPoint <=  NOT s_logisimOutputBubbles(15);
   n_hex0_L_7_Segment_Display_1_Segment_A    <=  NOT s_logisimOutputBubbles(8);
   n_hex0_L_7_Segment_Display_1_Segment_B    <=  NOT s_logisimOutputBubbles(9);
   n_hex0_L_7_Segment_Display_1_Segment_C    <=  NOT s_logisimOutputBubbles(10);
   n_hex0_L_7_Segment_Display_1_Segment_D    <=  NOT s_logisimOutputBubbles(11);
   n_hex0_L_7_Segment_Display_1_Segment_E    <=  NOT s_logisimOutputBubbles(12);
   n_hex0_L_7_Segment_Display_1_Segment_F    <=  NOT s_logisimOutputBubbles(13);
   n_hex0_L_7_Segment_Display_1_Segment_G    <=  NOT s_logisimOutputBubbles(14);
   n_hex1_L_7_Segment_Display_1_DecimalPoint <=  NOT s_logisimOutputBubbles(23);
   n_hex1_L_7_Segment_Display_1_Segment_A    <=  NOT s_logisimOutputBubbles(16);
   n_hex1_L_7_Segment_Display_1_Segment_B    <=  NOT s_logisimOutputBubbles(17);
   n_hex1_L_7_Segment_Display_1_Segment_C    <=  NOT s_logisimOutputBubbles(18);
   n_hex1_L_7_Segment_Display_1_Segment_D    <=  NOT s_logisimOutputBubbles(19);
   n_hex1_L_7_Segment_Display_1_Segment_E    <=  NOT s_logisimOutputBubbles(20);
   n_hex1_L_7_Segment_Display_1_Segment_F    <=  NOT s_logisimOutputBubbles(21);
   n_hex1_L_7_Segment_Display_1_Segment_G    <=  NOT s_logisimOutputBubbles(22);
   n_hex2_L_7_Segment_Display_1_DecimalPoint <=  NOT s_logisimOutputBubbles(7);
   n_hex2_L_7_Segment_Display_1_Segment_A    <=  NOT s_logisimOutputBubbles(0);
   n_hex2_L_7_Segment_Display_1_Segment_B    <=  NOT s_logisimOutputBubbles(1);
   n_hex2_L_7_Segment_Display_1_Segment_C    <=  NOT s_logisimOutputBubbles(2);
   n_hex2_L_7_Segment_Display_1_Segment_D    <=  NOT s_logisimOutputBubbles(3);
   n_hex2_L_7_Segment_Display_1_Segment_E    <=  NOT s_logisimOutputBubbles(4);
   n_hex2_L_7_Segment_Display_1_Segment_F    <=  NOT s_logisimOutputBubbles(5);
   n_hex2_L_7_Segment_Display_1_Segment_G    <=  NOT s_logisimOutputBubbles(6);
   s_enable                                  <= enable_0;
   s_reset                                   <= reset_0;
   s_stop                                    <= stop_0;

   --------------------------------------------------------------------------------
   -- The clock tree components are defined here                                 --
   --------------------------------------------------------------------------------
   BASE_0 : logisimTickGenerator
      GENERIC MAP ( nrOfBits    => 3,
                    reloadValue => 4 )
      PORT MAP ( FPGAClock => fpgaGlobalClock,
                 FPGATick  => s_fpgaTick );

   BASE_1 : LogisimClockComponent
      GENERIC MAP ( highTicks => 6250000,
                    lowTicks  => 6250000,
                    nrOfBits  => 24,
                    phase     => 1 )
      PORT MAP ( clockBus    => s_logisimClockTree0,
                 clockTick   => s_fpgaTick,
                 globalClock => fpgaGlobalClock );

   --------------------------------------------------------------------------------
   -- The toplevel component is connected here                                   --
   --------------------------------------------------------------------------------
   CIRCUIT_0 : timer
      PORT MAP ( enable               => s_enable,
                 logisimClockTree0    => s_logisimClockTree0,
                 logisimOutputBubbles => s_logisimOutputBubbles,
                 reset                => s_reset,
                 stop                 => s_stop );
END platformIndependent;
