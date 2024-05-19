--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2                                             ==
--== Component : lowpass                                                      ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF lowpass IS 

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

      COMPONENT Adder
         GENERIC ( extendedBits : INTEGER;
                   nrOfBits     : INTEGER );
         PORT ( carryIn  : IN  std_logic;
                dataA    : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                dataB    : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                carryOut : OUT std_logic;
                result   : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
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
   SIGNAL s_logisimBus0  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus1  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus10 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus11 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus12 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus13 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus14 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus15 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus16 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus17 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus18 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus20 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus23 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus24 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus25 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus26 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus29 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus30 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus31 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus32 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus34 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus6  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus7  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet19 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet21 : std_logic;
   SIGNAL s_logisimNet22 : std_logic;
   SIGNAL s_logisimNet27 : std_logic;
   SIGNAL s_logisimNet28 : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet33 : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet5  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus11(15 DOWNTO 0) <= unfiltered;
   s_logisimNet19              <= negative;
   s_logisimNet3               <= reset;
   s_logisimNet4               <= clock;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   filtered     <= s_logisimBus34(7 DOWNTO 0);
   negative_val <= s_logisimNet33;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimNet5  <=  '1';


   -- Constant
    s_logisimNet2  <=  '1';


   -- Constant
    s_logisimBus18(15 DOWNTO 0)  <=  X"0CCD";


   -- NOT Gate
   s_logisimNet21 <=  NOT s_logisimNet4;

   -- NOT Gate
   s_logisimNet22 <=  NOT s_logisimNet4;

   -- NOT Gate
   s_logisimNet27 <=  NOT s_logisimNet4;

   -- NOT Gate
   s_logisimNet28 <=  NOT s_logisimNet4;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus11(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus6(15 DOWNTO 0),
                 muxOut  => s_logisimBus16(15 DOWNTO 0),
                 sel     => s_logisimNet19 );

   ARITH_2 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus17(15 DOWNTO 0),
                 dataB    => s_logisimBus30(15 DOWNTO 0),
                 result   => s_logisimBus14(15 DOWNTO 0) );

   ARITH_3 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus7(15 DOWNTO 0),
                 dataB    => s_logisimBus32(15 DOWNTO 0),
                 result   => s_logisimBus8(15 DOWNTO 0) );

   ARITH_4 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus14(15 DOWNTO 0),
                 dataB    => s_logisimBus29(15 DOWNTO 0),
                 result   => s_logisimBus9(15 DOWNTO 0) );

   ARITH_5 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus8(15 DOWNTO 0),
                 dataB    => s_logisimBus31(15 DOWNTO 0),
                 result   => s_logisimBus12(15 DOWNTO 0) );

   ARITH_6 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus9(15 DOWNTO 0),
                 dataB    => s_logisimBus24(15 DOWNTO 0),
                 result   => s_logisimBus10(15 DOWNTO 0) );

   ARITH_7 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus12(15 DOWNTO 0),
                 dataB    => s_logisimBus26(15 DOWNTO 0),
                 result   => s_logisimBus0(15 DOWNTO 0) );

   ARITH_8 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus10(15 DOWNTO 0),
                 dataB    => s_logisimBus23(15 DOWNTO 0),
                 result   => s_logisimBus1(15 DOWNTO 0) );

   ARITH_9 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus0(15 DOWNTO 0),
                 dataB    => s_logisimBus25(15 DOWNTO 0),
                 result   => s_logisimBus13(15 DOWNTO 0) );

   ARITH_10 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus1(15 DOWNTO 0),
                 dataB    => s_logisimBus20(15 DOWNTO 0),
                 result   => s_logisimBus7(15 DOWNTO 0) );

   MEMORY_11 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => s_logisimNet21,
                 clockEnable => s_logisimNet5,
                 d           => s_logisimBus29(15 DOWNTO 0),
                 q           => s_logisimBus24(15 DOWNTO 0),
                 reset       => s_logisimNet3,
                 tick        => '1' );

   MEMORY_12 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => s_logisimNet22,
                 clockEnable => s_logisimNet2,
                 d           => s_logisimBus31(15 DOWNTO 0),
                 q           => s_logisimBus26(15 DOWNTO 0),
                 reset       => s_logisimNet3,
                 tick        => '1' );

   MEMORY_13 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet5,
                 d           => s_logisimBus24(15 DOWNTO 0),
                 q           => s_logisimBus23(15 DOWNTO 0),
                 reset       => s_logisimNet3,
                 tick        => logisimClockTree1(2) );

   MEMORY_14 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet2,
                 d           => s_logisimBus26(15 DOWNTO 0),
                 q           => s_logisimBus25(15 DOWNTO 0),
                 reset       => s_logisimNet3,
                 tick        => logisimClockTree1(2) );

   MEMORY_15 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet5,
                 d           => s_logisimBus16(15 DOWNTO 0),
                 q           => s_logisimBus17(15 DOWNTO 0),
                 reset       => s_logisimNet3,
                 tick        => logisimClockTree1(2) );

   MEMORY_16 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet2,
                 d           => s_logisimBus23(15 DOWNTO 0),
                 q           => s_logisimBus20(15 DOWNTO 0),
                 reset       => s_logisimNet3,
                 tick        => logisimClockTree1(2) );

   MEMORY_17 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => s_logisimNet27,
                 clockEnable => s_logisimNet5,
                 d           => s_logisimBus17(15 DOWNTO 0),
                 q           => s_logisimBus30(15 DOWNTO 0),
                 reset       => s_logisimNet3,
                 tick        => '1' );

   MEMORY_18 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => s_logisimNet28,
                 clockEnable => s_logisimNet2,
                 d           => s_logisimBus20(15 DOWNTO 0),
                 q           => s_logisimBus32(15 DOWNTO 0),
                 reset       => s_logisimNet3,
                 tick        => '1' );

   MEMORY_19 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet5,
                 d           => s_logisimBus30(15 DOWNTO 0),
                 q           => s_logisimBus29(15 DOWNTO 0),
                 reset       => s_logisimNet3,
                 tick        => logisimClockTree1(2) );

   MEMORY_20 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet2,
                 d           => s_logisimBus32(15 DOWNTO 0),
                 q           => s_logisimBus31(15 DOWNTO 0),
                 reset       => s_logisimNet3,
                 tick        => logisimClockTree1(2) );

   divide_two_num_1 : divide_two_num
      PORT MAP ( final_answer              => s_logisimBus34(7 DOWNTO 0),
                 final_answer_sixteen_bits => OPEN,
                 val                       => s_logisimBus15(15 DOWNTO 0),
                 val2                      => s_logisimBus18(15 DOWNTO 0) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   absolute_val_and_sign_1 : absolute_val_and_sign
      PORT MAP ( logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 negative          => s_logisimNet33,
                 unfiltered        => s_logisimBus13(15 DOWNTO 0),
                 value             => s_logisimBus15(15 DOWNTO 0) );

   twos_complement_1 : twos_complement
      PORT MAP ( absolute_val      => s_logisimBus6(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 negative_number   => s_logisimBus11(15 DOWNTO 0) );

END platformIndependent;
