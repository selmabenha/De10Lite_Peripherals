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

      COMPONENT main
         PORT ( logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                reset                : IN  std_logic;
                state_1              : IN  std_logic;
                state_2              : IN  std_logic;
                state_3              : IN  std_logic;
                logisimOutputBubbles : OUT std_logic_vector( 47 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_fpgaTick             : std_logic;
   SIGNAL s_logisimClockTree0    : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimOutputBubbles : std_logic_vector( 47 DOWNTO 0 );
   SIGNAL s_reset                : std_logic;
   SIGNAL s_state_1              : std_logic;
   SIGNAL s_state_2              : std_logic;
   SIGNAL s_state_3              : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All signal adaptations are performed here                                  --
   --------------------------------------------------------------------------------
   n_hex0_HEX_DecimalPoint <=  NOT s_logisimOutputBubbles(31);
   n_hex0_HEX_Segment_A    <=  NOT s_logisimOutputBubbles(24);
   n_hex0_HEX_Segment_B    <=  NOT s_logisimOutputBubbles(25);
   n_hex0_HEX_Segment_C    <=  NOT s_logisimOutputBubbles(26);
   n_hex0_HEX_Segment_D    <=  NOT s_logisimOutputBubbles(27);
   n_hex0_HEX_Segment_E    <=  NOT s_logisimOutputBubbles(28);
   n_hex0_HEX_Segment_F    <=  NOT s_logisimOutputBubbles(29);
   n_hex0_HEX_Segment_G    <=  NOT s_logisimOutputBubbles(30);
   n_hex1_HEX_DecimalPoint <=  NOT s_logisimOutputBubbles(47);
   n_hex1_HEX_Segment_A    <=  NOT s_logisimOutputBubbles(40);
   n_hex1_HEX_Segment_B    <=  NOT s_logisimOutputBubbles(41);
   n_hex1_HEX_Segment_C    <=  NOT s_logisimOutputBubbles(42);
   n_hex1_HEX_Segment_D    <=  NOT s_logisimOutputBubbles(43);
   n_hex1_HEX_Segment_E    <=  NOT s_logisimOutputBubbles(44);
   n_hex1_HEX_Segment_F    <=  NOT s_logisimOutputBubbles(45);
   n_hex1_HEX_Segment_G    <=  NOT s_logisimOutputBubbles(46);
   n_hex2_HEX_DecimalPoint <=  NOT s_logisimOutputBubbles(7);
   n_hex2_HEX_Segment_A    <=  NOT s_logisimOutputBubbles(0);
   n_hex2_HEX_Segment_B    <=  NOT s_logisimOutputBubbles(1);
   n_hex2_HEX_Segment_C    <=  NOT s_logisimOutputBubbles(2);
   n_hex2_HEX_Segment_D    <=  NOT s_logisimOutputBubbles(3);
   n_hex2_HEX_Segment_E    <=  NOT s_logisimOutputBubbles(4);
   n_hex2_HEX_Segment_F    <=  NOT s_logisimOutputBubbles(5);
   n_hex2_HEX_Segment_G    <=  NOT s_logisimOutputBubbles(6);
   n_hex3_HEX_DecimalPoint <=  NOT s_logisimOutputBubbles(15);
   n_hex3_HEX_Segment_A    <=  NOT s_logisimOutputBubbles(8);
   n_hex3_HEX_Segment_B    <=  NOT s_logisimOutputBubbles(9);
   n_hex3_HEX_Segment_C    <=  NOT s_logisimOutputBubbles(10);
   n_hex3_HEX_Segment_D    <=  NOT s_logisimOutputBubbles(11);
   n_hex3_HEX_Segment_E    <=  NOT s_logisimOutputBubbles(12);
   n_hex3_HEX_Segment_F    <=  NOT s_logisimOutputBubbles(13);
   n_hex3_HEX_Segment_G    <=  NOT s_logisimOutputBubbles(14);
   n_hex4_HEX_DecimalPoint <=  NOT s_logisimOutputBubbles(23);
   n_hex4_HEX_Segment_A    <=  NOT s_logisimOutputBubbles(16);
   n_hex4_HEX_Segment_B    <=  NOT s_logisimOutputBubbles(17);
   n_hex4_HEX_Segment_C    <=  NOT s_logisimOutputBubbles(18);
   n_hex4_HEX_Segment_D    <=  NOT s_logisimOutputBubbles(19);
   n_hex4_HEX_Segment_E    <=  NOT s_logisimOutputBubbles(20);
   n_hex4_HEX_Segment_F    <=  NOT s_logisimOutputBubbles(21);
   n_hex4_HEX_Segment_G    <=  NOT s_logisimOutputBubbles(22);
   n_hex5_HEX_DecimalPoint <=  NOT s_logisimOutputBubbles(39);
   n_hex5_HEX_Segment_A    <=  NOT s_logisimOutputBubbles(32);
   n_hex5_HEX_Segment_B    <=  NOT s_logisimOutputBubbles(33);
   n_hex5_HEX_Segment_C    <=  NOT s_logisimOutputBubbles(34);
   n_hex5_HEX_Segment_D    <=  NOT s_logisimOutputBubbles(35);
   n_hex5_HEX_Segment_E    <=  NOT s_logisimOutputBubbles(36);
   n_hex5_HEX_Segment_F    <=  NOT s_logisimOutputBubbles(37);
   n_hex5_HEX_Segment_G    <=  NOT s_logisimOutputBubbles(38);
   s_reset                 <=  NOT n_reset_0;
   s_state_1               <= state_1_0;
   s_state_2               <= state_2_0;
   s_state_3               <= state_3_0;

   --------------------------------------------------------------------------------
   -- The clock tree components are defined here                                 --
   --------------------------------------------------------------------------------
   BASE_0 : logisimTickGenerator
      GENERIC MAP ( nrOfBits    => 3,
                    reloadValue => 4 )
      PORT MAP ( FPGAClock => fpgaGlobalClock,
                 FPGATick  => s_fpgaTick );

   BASE_1 : LogisimClockComponent
      GENERIC MAP ( highTicks => 12500000,
                    lowTicks  => 12500000,
                    nrOfBits  => 25,
                    phase     => 1 )
      PORT MAP ( clockBus    => s_logisimClockTree0,
                 clockTick   => s_fpgaTick,
                 globalClock => fpgaGlobalClock );

   --------------------------------------------------------------------------------
   -- The toplevel component is connected here                                   --
   --------------------------------------------------------------------------------
   CIRCUIT_0 : main
      PORT MAP ( logisimClockTree0    => s_logisimClockTree0,
                 logisimOutputBubbles => s_logisimOutputBubbles,
                 reset                => s_reset,
                 state_1              => s_state_1,
                 state_2              => s_state_2,
                 state_3              => s_state_3 );
END platformIndependent;
