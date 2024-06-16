--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_final                                          ==
--== Component : signed_fast_filter                                           ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF signed_fast_filter IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT Multiplexer_bus_2
         GENERIC ( nrOfBits : INTEGER );
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_1 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                sel     : IN  std_logic;
                muxOut  : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT Comparator
         GENERIC ( nrOfBits       : INTEGER;
                   twosComplement : INTEGER );
         PORT ( dataA         : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                dataB         : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                aEqualsB      : OUT std_logic;
                aGreaterThanB : OUT std_logic;
                aLessThanB    : OUT std_logic );
      END COMPONENT;

      COMPONENT Adder
         GENERIC ( extendedBits : INTEGER;
                   nrOfBits     : INTEGER );
         PORT ( carryIn  : IN  std_logic;
                dataA    : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                dataB    : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                carryOut : OUT std_logic;
                result   : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT Subtractor
         GENERIC ( extendedBits : INTEGER;
                   nrOfBits     : INTEGER );
         PORT ( borrowIn  : IN  std_logic;
                dataA     : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                dataB     : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                borrowOut : OUT std_logic;
                result    : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT REGISTER_FLIP_FLOP
         GENERIC ( invertClock : INTEGER;
                   nrOfBits    : INTEGER );
         PORT ( clock       : IN  std_logic;
                clockEnable : IN  std_logic;
                d           : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                reset       : IN  std_logic;
                tick        : IN  std_logic;
                q           : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT divide_two_num
         PORT ( val                       : IN  std_logic_vector( 15 DOWNTO 0 );
                val2                      : IN  std_logic_vector( 15 DOWNTO 0 );
                final_answer              : OUT std_logic_vector( 7 DOWNTO 0 );
                final_answer_sixteen_bits : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT absolute_val_and_sign
         PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
                unfiltered        : IN  std_logic_vector( 15 DOWNTO 0 );
                negative          : OUT std_logic;
                value             : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT twos_complement
         PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
                negative_number   : IN  std_logic_vector( 15 DOWNTO 0 );
                absolute_val      : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus1  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus10 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus12 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus13 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus14 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus15 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus16 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus17 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus18 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus19 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus20 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus21 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus22 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus23 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus25 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus26 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus27 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus28 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus29 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus3  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus30 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus33 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus35 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus37 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus40 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus42 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus45 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus48 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus50 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus52 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus55 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus6  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus7  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet24 : std_logic;
   SIGNAL s_logisimNet31 : std_logic;
   SIGNAL s_logisimNet32 : std_logic;
   SIGNAL s_logisimNet34 : std_logic;
   SIGNAL s_logisimNet36 : std_logic;
   SIGNAL s_logisimNet38 : std_logic;
   SIGNAL s_logisimNet39 : std_logic;
   SIGNAL s_logisimNet41 : std_logic;
   SIGNAL s_logisimNet43 : std_logic;
   SIGNAL s_logisimNet44 : std_logic;
   SIGNAL s_logisimNet46 : std_logic;
   SIGNAL s_logisimNet47 : std_logic;
   SIGNAL s_logisimNet49 : std_logic;
   SIGNAL s_logisimNet51 : std_logic;
   SIGNAL s_logisimNet53 : std_logic;
   SIGNAL s_logisimNet54 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus25(15 DOWNTO 0) <= unfiltered;
   s_logisimNet0               <= clock;
   s_logisimNet2               <= reset;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   filtered <= s_logisimBus17(15 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimNet32  <=  '1';


   -- Constant
    s_logisimNet34  <=  '1';


   -- Constant
    s_logisimBus29(15 DOWNTO 0)  <=  X"000A";


   -- Constant
    s_logisimNet36  <=  '1';


   -- Constant
    s_logisimNet39  <=  '1';


   -- Constant
    s_logisimNet41  <=  '1';


   -- Constant
    s_logisimNet44  <=  '1';


   -- Constant
    s_logisimNet47  <=  '1';


   -- Constant
    s_logisimNet49  <=  '1';


   -- Constant
    s_logisimBus8(15 DOWNTO 0)  <=  X"0CCD";


   -- Constant
    s_logisimNet51  <=  '1';


   -- Constant
    s_logisimNet54  <=  '1';


   -- NOT Gate
   s_logisimNet31 <=  NOT s_logisimNet0;

   -- NOT Gate
   s_logisimNet38 <=  NOT s_logisimNet0;

   -- NOT Gate
   s_logisimNet43 <=  NOT s_logisimNet0;

   -- NOT Gate
   s_logisimNet46 <=  NOT s_logisimNet0;

   -- NOT Gate
   s_logisimNet53 <=  NOT s_logisimNet0;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus50(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus25(15 DOWNTO 0),
                 muxOut  => s_logisimBus21(15 DOWNTO 0),
                 sel     => s_logisimNet24 );

   PLEXERS_2 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus52(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus25(15 DOWNTO 0),
                 muxOut  => s_logisimBus28(15 DOWNTO 0),
                 sel     => s_logisimNet24 );

   PLEXERS_3 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus9(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus22(15 DOWNTO 0),
                 muxOut  => s_logisimBus17(15 DOWNTO 0),
                 sel     => s_logisimNet11 );

   PLEXERS_4 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus30(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus25(15 DOWNTO 0),
                 muxOut  => s_logisimBus5(15 DOWNTO 0),
                 sel     => s_logisimNet24 );

   PLEXERS_5 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus33(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus25(15 DOWNTO 0),
                 muxOut  => s_logisimBus16(15 DOWNTO 0),
                 sel     => s_logisimNet24 );

   PLEXERS_6 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus35(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus25(15 DOWNTO 0),
                 muxOut  => s_logisimBus26(15 DOWNTO 0),
                 sel     => s_logisimNet24 );

   PLEXERS_7 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus40(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus25(15 DOWNTO 0),
                 muxOut  => s_logisimBus27(15 DOWNTO 0),
                 sel     => s_logisimNet24 );

   PLEXERS_8 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus42(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus25(15 DOWNTO 0),
                 muxOut  => s_logisimBus4(15 DOWNTO 0),
                 sel     => s_logisimNet24 );

   PLEXERS_9 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus45(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus25(15 DOWNTO 0),
                 muxOut  => s_logisimBus14(15 DOWNTO 0),
                 sel     => s_logisimNet24 );

   PLEXERS_10 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus48(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus25(15 DOWNTO 0),
                 muxOut  => s_logisimBus20(15 DOWNTO 0),
                 sel     => s_logisimNet24 );

   ARITH_11 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 0 )
      PORT MAP ( aEqualsB      => OPEN,
                 aGreaterThanB => s_logisimNet24,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus19(15 DOWNTO 0),
                 dataB         => s_logisimBus29(15 DOWNTO 0) );

   ARITH_12 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus40(15 DOWNTO 0),
                 dataB    => s_logisimBus45(15 DOWNTO 0),
                 result   => s_logisimBus1(15 DOWNTO 0) );

   ARITH_13 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus13(15 DOWNTO 0),
                 dataB    => s_logisimBus48(15 DOWNTO 0),
                 result   => s_logisimBus15(15 DOWNTO 0) );

   ARITH_14 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus1(15 DOWNTO 0),
                 dataB    => s_logisimBus50(15 DOWNTO 0),
                 result   => s_logisimBus18(15 DOWNTO 0) );

   ARITH_15 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus15(15 DOWNTO 0),
                 dataB    => s_logisimBus52(15 DOWNTO 0),
                 result   => s_logisimBus6(15 DOWNTO 0) );

   ARITH_16 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus18(15 DOWNTO 0),
                 dataB    => s_logisimBus30(15 DOWNTO 0),
                 result   => s_logisimBus7(15 DOWNTO 0) );

   ARITH_17 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus6(15 DOWNTO 0),
                 dataB    => s_logisimBus33(15 DOWNTO 0),
                 result   => s_logisimBus10(15 DOWNTO 0) );

   ARITH_18 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus7(15 DOWNTO 0),
                 dataB    => s_logisimBus35(15 DOWNTO 0),
                 result   => s_logisimBus12(15 DOWNTO 0) );

   ARITH_19 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus10(15 DOWNTO 0),
                 dataB    => s_logisimBus37(15 DOWNTO 0),
                 result   => s_logisimBus3(15 DOWNTO 0) );

   ARITH_20 : Subtractor
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( borrowIn  => '0',
                 borrowOut => OPEN,
                 dataA     => s_logisimBus40(15 DOWNTO 0),
                 dataB     => s_logisimBus45(15 DOWNTO 0),
                 result    => s_logisimBus55(15 DOWNTO 0) );

   ARITH_21 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus12(15 DOWNTO 0),
                 dataB    => s_logisimBus42(15 DOWNTO 0),
                 result   => s_logisimBus13(15 DOWNTO 0) );

   MEMORY_22 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => s_logisimNet31,
                 clockEnable => s_logisimNet32,
                 d           => s_logisimBus21(15 DOWNTO 0),
                 q           => s_logisimBus30(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => '1' );

   MEMORY_23 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet34,
                 d           => s_logisimBus28(15 DOWNTO 0),
                 q           => s_logisimBus33(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => logisimClockTree1(2) );

   MEMORY_24 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet36,
                 d           => s_logisimBus5(15 DOWNTO 0),
                 q           => s_logisimBus35(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => logisimClockTree1(2) );

   MEMORY_25 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => s_logisimNet38,
                 clockEnable => s_logisimNet39,
                 d           => s_logisimBus16(15 DOWNTO 0),
                 q           => s_logisimBus37(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => '1' );

   MEMORY_26 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet41,
                 d           => s_logisimBus25(15 DOWNTO 0),
                 q           => s_logisimBus40(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => logisimClockTree1(2) );

   MEMORY_27 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => s_logisimNet43,
                 clockEnable => s_logisimNet44,
                 d           => s_logisimBus26(15 DOWNTO 0),
                 q           => s_logisimBus42(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => '1' );

   MEMORY_28 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => s_logisimNet46,
                 clockEnable => s_logisimNet47,
                 d           => s_logisimBus27(15 DOWNTO 0),
                 q           => s_logisimBus45(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => '1' );

   MEMORY_29 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet49,
                 d           => s_logisimBus4(15 DOWNTO 0),
                 q           => s_logisimBus48(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => logisimClockTree1(2) );

   MEMORY_30 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet51,
                 d           => s_logisimBus14(15 DOWNTO 0),
                 q           => s_logisimBus50(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => logisimClockTree1(2) );

   MEMORY_31 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => s_logisimNet53,
                 clockEnable => s_logisimNet54,
                 d           => s_logisimBus20(15 DOWNTO 0),
                 q           => s_logisimBus52(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => '1' );

   divide_two_num_1 : divide_two_num
      PORT MAP ( final_answer              => OPEN,
                 final_answer_sixteen_bits => s_logisimBus9(15 DOWNTO 0),
                 val                       => s_logisimBus23(15 DOWNTO 0),
                 val2                      => s_logisimBus8(15 DOWNTO 0) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   absolute_val_and_sign_2 : absolute_val_and_sign
      PORT MAP ( logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 negative          => OPEN,
                 unfiltered        => s_logisimBus55(15 DOWNTO 0),
                 value             => s_logisimBus19(15 DOWNTO 0) );

   twos_complement_1 : twos_complement
      PORT MAP ( absolute_val      => s_logisimBus22(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 negative_number   => s_logisimBus9(15 DOWNTO 0) );

   absolute_val_and_sign_1 : absolute_val_and_sign
      PORT MAP ( logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 negative          => s_logisimNet11,
                 unfiltered        => s_logisimBus3(15 DOWNTO 0),
                 value             => s_logisimBus23(15 DOWNTO 0) );

END platformIndependent;
