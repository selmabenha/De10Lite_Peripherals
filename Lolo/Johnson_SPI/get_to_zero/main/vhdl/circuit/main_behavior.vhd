--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero                                                  ==
--== Component : main                                                         ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF main IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT Multiplexer_bus_4
         GENERIC ( nrOfBits : INTEGER );
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_1 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_2 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_3 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                sel     : IN  std_logic_vector( 1 DOWNTO 0 );
                muxOut  : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT letter_no_decimal
         PORT ( letter_num        : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                no_dec_letter     : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT sevenseg_mapped
         PORT ( logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                sevenseg_input       : IN  std_logic_vector( 7 DOWNTO 0 );
                logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT counter_fsm
         PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                reset             : IN  std_logic;
                state_1           : IN  std_logic;
                state_2           : IN  std_logic;
                state_3           : IN  std_logic;
                state_output      : OUT std_logic_vector( 1 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT side_to_side_anim
         PORT ( clock             : IN  std_logic;
                hex1_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                hex2_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                hex3_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                hex4_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                hex5_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                hex0_out          : OUT std_logic_vector( 7 DOWNTO 0 );
                hex1_out          : OUT std_logic_vector( 7 DOWNTO 0 );
                hex2_out          : OUT std_logic_vector( 7 DOWNTO 0 );
                hex3_out          : OUT std_logic_vector( 7 DOWNTO 0 );
                hex4_out          : OUT std_logic_vector( 7 DOWNTO 0 );
                hex5_out          : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT blink_anim
         PORT ( clock             : IN  std_logic;
                hex0_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                hex1_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                hex2_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                hex3_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                hex4_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                hex5_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                hex0_out          : OUT std_logic_vector( 7 DOWNTO 0 );
                hex1_out          : OUT std_logic_vector( 7 DOWNTO 0 );
                hex2_out          : OUT std_logic_vector( 7 DOWNTO 0 );
                hex3_out          : OUT std_logic_vector( 7 DOWNTO 0 );
                hex4_out          : OUT std_logic_vector( 7 DOWNTO 0 );
                hex5_out          : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus1  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus10 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus11 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus12 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus13 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus14 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus15 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus16 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus2  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus21 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus22 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus23 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus24 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus25 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus26 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus27 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus28 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus29 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus3  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus30 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus31 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus32 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus33 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus34 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus35 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus36 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus37 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus38 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus39 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus7  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet17 : std_logic;
   SIGNAL s_logisimNet18 : std_logic;
   SIGNAL s_logisimNet19 : std_logic;
   SIGNAL s_logisimNet20 : std_logic;
   SIGNAL s_logisimNet6  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet6 <= logisimClockTree0(0);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet17 <= reset;
   s_logisimNet18 <= state_2;
   s_logisimNet19 <= state_1;
   s_logisimNet20 <= state_3;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus25(4 DOWNTO 0)  <=  "1"&X"3";


   -- Constant
    s_logisimBus28(4 DOWNTO 0)  <=  "1"&X"4";


   -- Constant
    s_logisimBus30(4 DOWNTO 0)  <=  "0"&X"1";


   -- Constant
    s_logisimBus31(4 DOWNTO 0)  <=  "1"&X"2";


   -- Constant
    s_logisimBus33(4 DOWNTO 0)  <=  "0"&X"7";


   -- Constant
    s_logisimBus35(4 DOWNTO 0)  <=  "0"&X"E";


   -- Constant
    s_logisimBus38(4 DOWNTO 0)  <=  "0"&X"5";


   -- Constant
    s_logisimBus14(7 DOWNTO 0)  <=  X"00";


   -- Constant
    s_logisimBus2(7 DOWNTO 0)  <=  X"00";


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus22(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus1(7 DOWNTO 0),
                 muxIn_2 => X"00",
                 muxIn_3 => X"00",
                 muxOut  => s_logisimBus9(7 DOWNTO 0),
                 sel     => s_logisimBus37(1 DOWNTO 0) );

   PLEXERS_2 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus23(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus5(7 DOWNTO 0),
                 muxIn_2 => X"00",
                 muxIn_3 => X"00",
                 muxOut  => s_logisimBus10(7 DOWNTO 0),
                 sel     => s_logisimBus37(1 DOWNTO 0) );

   PLEXERS_3 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus0(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus16(7 DOWNTO 0),
                 muxIn_2 => X"00",
                 muxIn_3 => X"00",
                 muxOut  => s_logisimBus8(7 DOWNTO 0),
                 sel     => s_logisimBus37(1 DOWNTO 0) );

   PLEXERS_4 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus21(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus4(7 DOWNTO 0),
                 muxIn_2 => X"00",
                 muxIn_3 => X"00",
                 muxOut  => s_logisimBus7(7 DOWNTO 0),
                 sel     => s_logisimBus37(1 DOWNTO 0) );

   PLEXERS_5 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus13(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus15(7 DOWNTO 0),
                 muxIn_2 => X"00",
                 muxIn_3 => X"00",
                 muxOut  => s_logisimBus11(7 DOWNTO 0),
                 sel     => s_logisimBus37(1 DOWNTO 0) );

   PLEXERS_6 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus24(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus3(7 DOWNTO 0),
                 muxIn_2 => X"00",
                 muxIn_3 => X"00",
                 muxOut  => s_logisimBus12(7 DOWNTO 0),
                 sel     => s_logisimBus37(1 DOWNTO 0) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   letter_no_decimal_1 : letter_no_decimal
      PORT MAP ( letter_num        => s_logisimBus25(4 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 no_dec_letter     => s_logisimBus26(7 DOWNTO 0) );

   letter_no_decimal_2 : letter_no_decimal
      PORT MAP ( letter_num        => s_logisimBus28(4 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 no_dec_letter     => s_logisimBus27(7 DOWNTO 0) );

   letter_no_decimal_3 : letter_no_decimal
      PORT MAP ( letter_num        => s_logisimBus30(4 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 no_dec_letter     => s_logisimBus29(7 DOWNTO 0) );

   letter_no_decimal_4 : letter_no_decimal
      PORT MAP ( letter_num        => s_logisimBus31(4 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 no_dec_letter     => s_logisimBus32(7 DOWNTO 0) );

   hex2 : sevenseg_mapped
      PORT MAP ( logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(7  DOWNTO  0),
                 sevenseg_input       => s_logisimBus7(7 DOWNTO 0) );

   hex3 : sevenseg_mapped
      PORT MAP ( logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(15  DOWNTO  8),
                 sevenseg_input       => s_logisimBus12(7 DOWNTO 0) );

   hex4 : sevenseg_mapped
      PORT MAP ( logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(23  DOWNTO  16),
                 sevenseg_input       => s_logisimBus11(7 DOWNTO 0) );

   hex0 : sevenseg_mapped
      PORT MAP ( logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(31  DOWNTO  24),
                 sevenseg_input       => s_logisimBus9(7 DOWNTO 0) );

   hex5 : sevenseg_mapped
      PORT MAP ( logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(39  DOWNTO  32),
                 sevenseg_input       => s_logisimBus10(7 DOWNTO 0) );

   hex1 : sevenseg_mapped
      PORT MAP ( logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(47  DOWNTO  40),
                 sevenseg_input       => s_logisimBus8(7 DOWNTO 0) );

   letter_no_decimal_5 : letter_no_decimal
      PORT MAP ( letter_num        => s_logisimBus33(4 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 no_dec_letter     => s_logisimBus34(7 DOWNTO 0) );

   letter_no_decimal_6 : letter_no_decimal
      PORT MAP ( letter_num        => s_logisimBus35(4 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 no_dec_letter     => s_logisimBus36(7 DOWNTO 0) );

   counter_fsm_1 : counter_fsm
      PORT MAP ( logisimClockTree0 => logisimClockTree0,
                 reset             => s_logisimNet17,
                 state_1           => s_logisimNet19,
                 state_2           => s_logisimNet18,
                 state_3           => s_logisimNet20,
                 state_output      => s_logisimBus37(1 DOWNTO 0) );

   side_to_side_anim_1 : side_to_side_anim
      PORT MAP ( clock             => s_logisimNet6,
                 hex0_out          => s_logisimBus22(7 DOWNTO 0),
                 hex1_letter       => s_logisimBus27(7 DOWNTO 0),
                 hex1_out          => s_logisimBus0(7 DOWNTO 0),
                 hex2_letter       => s_logisimBus32(7 DOWNTO 0),
                 hex2_out          => s_logisimBus21(7 DOWNTO 0),
                 hex3_letter       => s_logisimBus29(7 DOWNTO 0),
                 hex3_out          => s_logisimBus24(7 DOWNTO 0),
                 hex4_letter       => s_logisimBus27(7 DOWNTO 0),
                 hex4_out          => s_logisimBus13(7 DOWNTO 0),
                 hex5_letter       => s_logisimBus26(7 DOWNTO 0),
                 hex5_out          => s_logisimBus23(7 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0 );

   blink_anim_1 : blink_anim
      PORT MAP ( clock             => s_logisimNet6,
                 hex0_letter       => s_logisimBus2(7 DOWNTO 0),
                 hex0_out          => s_logisimBus1(7 DOWNTO 0),
                 hex1_letter       => s_logisimBus14(7 DOWNTO 0),
                 hex1_out          => s_logisimBus16(7 DOWNTO 0),
                 hex2_letter       => s_logisimBus39(7 DOWNTO 0),
                 hex2_out          => s_logisimBus4(7 DOWNTO 0),
                 hex3_letter       => s_logisimBus36(7 DOWNTO 0),
                 hex3_out          => s_logisimBus3(7 DOWNTO 0),
                 hex4_letter       => s_logisimBus29(7 DOWNTO 0),
                 hex4_out          => s_logisimBus15(7 DOWNTO 0),
                 hex5_letter       => s_logisimBus34(7 DOWNTO 0),
                 hex5_out          => s_logisimBus5(7 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0 );

   letter_no_decimal_7 : letter_no_decimal
      PORT MAP ( letter_num        => s_logisimBus38(4 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 no_dec_letter     => s_logisimBus39(7 DOWNTO 0) );

END platformIndependent;
