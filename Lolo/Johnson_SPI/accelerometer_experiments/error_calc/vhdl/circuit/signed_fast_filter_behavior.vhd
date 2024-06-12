--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_experiments                                    ==
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

      COMPONENT Adder
         GENERIC ( extendedBits : INTEGER;
                   nrOfBits     : INTEGER );
         PORT ( carryIn  : IN  std_logic;
                dataA    : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                dataB    : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                carryOut : OUT std_logic;
                result   : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT absolute_val_and_sign
         PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                unfiltered        : IN  std_logic_vector( 15 DOWNTO 0 );
                negative          : OUT std_logic;
                value             : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT twos_complement
         PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
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
   SIGNAL s_logisimBus33 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus35 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus39 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus40 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus41 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus42 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus48 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus49 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus51 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus52 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus54 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus6  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus7  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet24 : std_logic;
   SIGNAL s_logisimNet30 : std_logic;
   SIGNAL s_logisimNet31 : std_logic;
   SIGNAL s_logisimNet32 : std_logic;
   SIGNAL s_logisimNet34 : std_logic;
   SIGNAL s_logisimNet36 : std_logic;
   SIGNAL s_logisimNet37 : std_logic;
   SIGNAL s_logisimNet38 : std_logic;
   SIGNAL s_logisimNet43 : std_logic;
   SIGNAL s_logisimNet44 : std_logic;
   SIGNAL s_logisimNet45 : std_logic;
   SIGNAL s_logisimNet46 : std_logic;
   SIGNAL s_logisimNet47 : std_logic;
   SIGNAL s_logisimNet50 : std_logic;
   SIGNAL s_logisimNet53 : std_logic;
   SIGNAL s_logisimNet55 : std_logic;

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
    s_logisimNet31  <=  '1';


   -- Constant
    s_logisimBus29(15 DOWNTO 0)  <=  X"000A";


   -- Constant
    s_logisimNet32  <=  '1';


   -- Constant
    s_logisimNet34  <=  '1';


   -- Constant
    s_logisimNet37  <=  '1';


   -- Constant
    s_logisimBus8(15 DOWNTO 0)  <=  X"0CCD";


   -- Constant
    s_logisimNet38  <=  '1';


   -- NOT Gate
   s_logisimNet30 <=  NOT s_logisimNet0;

   -- NOT Gate
   s_logisimNet36 <=  NOT s_logisimNet0;

   -- Constant
    s_logisimNet45  <=  '1';


   -- NOT Gate
   s_logisimNet44 <=  NOT s_logisimNet0;

   -- Constant
    s_logisimNet43  <=  '1';


   -- NOT Gate
   s_logisimNet46 <=  NOT s_logisimNet0;

   -- Constant
    s_logisimNet50  <=  '1';


   -- Constant
    s_logisimNet47  <=  '1';


   -- Constant
    s_logisimNet53  <=  '1';


   -- NOT Gate
   s_logisimNet55 <=  NOT s_logisimNet0;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus40(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus25(15 DOWNTO 0),
                 muxOut  => s_logisimBus21(15 DOWNTO 0),
                 sel     => s_logisimNet24 );

   PLEXERS_2 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus9(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus22(15 DOWNTO 0),
                 muxOut  => s_logisimBus17(15 DOWNTO 0),
                 sel     => s_logisimNet11 );

   PLEXERS_3 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus41(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus25(15 DOWNTO 0),
                 muxOut  => s_logisimBus5(15 DOWNTO 0),
                 sel     => s_logisimNet24 );

   PLEXERS_4 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus33(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus25(15 DOWNTO 0),
                 muxOut  => s_logisimBus27(15 DOWNTO 0),
                 sel     => s_logisimNet24 );

   PLEXERS_5 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus35(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus25(15 DOWNTO 0),
                 muxOut  => s_logisimBus14(15 DOWNTO 0),
                 sel     => s_logisimNet24 );

   ARITH_6 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 0 )
      PORT MAP ( aEqualsB      => OPEN,
                 aGreaterThanB => s_logisimNet24,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus19(15 DOWNTO 0),
                 dataB         => s_logisimBus29(15 DOWNTO 0) );

   ARITH_7 : Subtractor
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( borrowIn  => '0',
                 borrowOut => OPEN,
                 dataA     => s_logisimBus33(15 DOWNTO 0),
                 dataB     => s_logisimBus35(15 DOWNTO 0),
                 result    => s_logisimBus39(15 DOWNTO 0) );

   MEMORY_8 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => s_logisimNet30,
                 clockEnable => s_logisimNet31,
                 d           => s_logisimBus21(15 DOWNTO 0),
                 q           => s_logisimBus41(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => '1' );

   MEMORY_9 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet32,
                 d           => s_logisimBus5(15 DOWNTO 0),
                 q           => s_logisimBus42(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => logisimClockTree1(2) );

   MEMORY_10 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet34,
                 d           => s_logisimBus25(15 DOWNTO 0),
                 q           => s_logisimBus33(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => logisimClockTree1(2) );

   MEMORY_11 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => s_logisimNet36,
                 clockEnable => s_logisimNet37,
                 d           => s_logisimBus27(15 DOWNTO 0),
                 q           => s_logisimBus35(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => '1' );

   MEMORY_12 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet38,
                 d           => s_logisimBus14(15 DOWNTO 0),
                 q           => s_logisimBus40(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => logisimClockTree1(2) );

   divide_two_num_1 : divide_two_num
      PORT MAP ( final_answer              => OPEN,
                 final_answer_sixteen_bits => s_logisimBus9(15 DOWNTO 0),
                 val                       => s_logisimBus23(15 DOWNTO 0),
                 val2                      => s_logisimBus8(15 DOWNTO 0) );

   ARITH_14 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus33(15 DOWNTO 0),
                 dataB    => s_logisimBus35(15 DOWNTO 0),
                 result   => s_logisimBus1(15 DOWNTO 0) );

   ARITH_15 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus1(15 DOWNTO 0),
                 dataB    => s_logisimBus40(15 DOWNTO 0),
                 result   => s_logisimBus18(15 DOWNTO 0) );

   ARITH_16 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus18(15 DOWNTO 0),
                 dataB    => s_logisimBus41(15 DOWNTO 0),
                 result   => s_logisimBus7(15 DOWNTO 0) );

   ARITH_17 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus7(15 DOWNTO 0),
                 dataB    => s_logisimBus42(15 DOWNTO 0),
                 result   => s_logisimBus12(15 DOWNTO 0) );

   ARITH_18 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus6(15 DOWNTO 0),
                 dataB    => s_logisimBus54(15 DOWNTO 0),
                 result   => s_logisimBus10(15 DOWNTO 0) );

   ARITH_19 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus13(15 DOWNTO 0),
                 dataB    => s_logisimBus52(15 DOWNTO 0),
                 result   => s_logisimBus15(15 DOWNTO 0) );

   ARITH_20 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus10(15 DOWNTO 0),
                 dataB    => s_logisimBus51(15 DOWNTO 0),
                 result   => s_logisimBus3(15 DOWNTO 0) );

   ARITH_21 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus15(15 DOWNTO 0),
                 dataB    => s_logisimBus49(15 DOWNTO 0),
                 result   => s_logisimBus6(15 DOWNTO 0) );

   ARITH_22 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus12(15 DOWNTO 0),
                 dataB    => s_logisimBus48(15 DOWNTO 0),
                 result   => s_logisimBus13(15 DOWNTO 0) );

   MEMORY_23 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => s_logisimNet46,
                 clockEnable => s_logisimNet53,
                 d           => s_logisimBus16(15 DOWNTO 0),
                 q           => s_logisimBus51(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => '1' );

   MEMORY_24 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet47,
                 d           => s_logisimBus28(15 DOWNTO 0),
                 q           => s_logisimBus54(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => logisimClockTree1(2) );

   MEMORY_25 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => s_logisimNet55,
                 clockEnable => s_logisimNet43,
                 d           => s_logisimBus20(15 DOWNTO 0),
                 q           => s_logisimBus49(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => '1' );

   PLEXERS_26 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus54(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus25(15 DOWNTO 0),
                 muxOut  => s_logisimBus16(15 DOWNTO 0),
                 sel     => s_logisimNet24 );

   MEMORY_27 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => s_logisimNet44,
                 clockEnable => s_logisimNet45,
                 d           => s_logisimBus26(15 DOWNTO 0),
                 q           => s_logisimBus48(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => '1' );

   PLEXERS_28 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus48(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus25(15 DOWNTO 0),
                 muxOut  => s_logisimBus4(15 DOWNTO 0),
                 sel     => s_logisimNet24 );

   PLEXERS_29 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus52(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus25(15 DOWNTO 0),
                 muxOut  => s_logisimBus20(15 DOWNTO 0),
                 sel     => s_logisimNet24 );

   MEMORY_30 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet50,
                 d           => s_logisimBus4(15 DOWNTO 0),
                 q           => s_logisimBus52(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => logisimClockTree1(2) );

   PLEXERS_31 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus42(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus25(15 DOWNTO 0),
                 muxOut  => s_logisimBus26(15 DOWNTO 0),
                 sel     => s_logisimNet24 );

   PLEXERS_32 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus49(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus25(15 DOWNTO 0),
                 muxOut  => s_logisimBus28(15 DOWNTO 0),
                 sel     => s_logisimNet24 );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   absolute_val_and_sign_2 : absolute_val_and_sign
      PORT MAP ( logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 negative          => OPEN,
                 unfiltered        => s_logisimBus39(15 DOWNTO 0),
                 value             => s_logisimBus19(15 DOWNTO 0) );

   twos_complement_1 : twos_complement
      PORT MAP ( absolute_val      => s_logisimBus22(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 negative_number   => s_logisimBus9(15 DOWNTO 0) );

   absolute_val_and_sign_1 : absolute_val_and_sign
      PORT MAP ( logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 negative          => s_logisimNet11,
                 unfiltered        => s_logisimBus3(15 DOWNTO 0),
                 value             => s_logisimBus23(15 DOWNTO 0) );

END platformIndependent;
