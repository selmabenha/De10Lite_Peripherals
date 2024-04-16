--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : print_ADXL345_values                                         ==
--== Component : lowpass_filter_de10                                          ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF lowpass_filter_de10 IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

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

      COMPONENT divide_two_num
         PORT ( val                       : IN  std_logic_vector( 15 DOWNTO 0 );
                val2                      : IN  std_logic_vector( 15 DOWNTO 0 );
                final_answer              : OUT std_logic_vector( 7 DOWNTO 0 );
                final_answer_sixteen_bits : OUT std_logic_vector( 15 DOWNTO 0 ) );
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
   SIGNAL s_logisimBus17 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus18 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus19 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus2  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus20 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus23 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus27 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus28 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus29 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus3  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus30 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus31 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus32 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus33 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus34 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus36 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet21 : std_logic;
   SIGNAL s_logisimNet22 : std_logic;
   SIGNAL s_logisimNet24 : std_logic;
   SIGNAL s_logisimNet25 : std_logic;
   SIGNAL s_logisimNet26 : std_logic;
   SIGNAL s_logisimNet35 : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet8  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus1(15 DOWNTO 0) <= unfiltered;
   s_logisimNet24             <= negative;
   s_logisimNet6              <= reset;
   s_logisimNet7              <= clock;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   filtered     <= s_logisimBus11(7 DOWNTO 0);
   negative_val <= s_logisimBus9(15);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- NOT Gate
   s_logisimNet21 <=  NOT s_logisimNet7;

   -- Constant
    s_logisimNet8  <=  '1';


   -- NOT Gate
   s_logisimNet22 <=  NOT s_logisimNet7;

   -- NOT Gate
   s_logisimNet25 <=  NOT s_logisimNet7;

   -- NOT Gate
   s_logisimNet26 <=  NOT s_logisimNet7;

   -- Constant
    s_logisimNet4  <=  '1';


   -- Constant
    s_logisimBus36(15 DOWNTO 0)  <=  X"0CCD";


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   MEMORY_1 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet8,
                 d           => s_logisimBus19(15 DOWNTO 0),
                 q           => s_logisimBus20(15 DOWNTO 0),
                 reset       => s_logisimNet6,
                 tick        => logisimClockTree1(2) );

   MEMORY_2 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => s_logisimNet22,
                 clockEnable => s_logisimNet8,
                 d           => s_logisimBus28(15 DOWNTO 0),
                 q           => s_logisimBus29(15 DOWNTO 0),
                 reset       => s_logisimNet6,
                 tick        => '1' );

   MEMORY_3 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet8,
                 d           => s_logisimBus23(15 DOWNTO 0),
                 q           => s_logisimBus28(15 DOWNTO 0),
                 reset       => s_logisimNet6,
                 tick        => logisimClockTree1(2) );

   MEMORY_4 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => s_logisimNet21,
                 clockEnable => s_logisimNet8,
                 d           => s_logisimBus20(15 DOWNTO 0),
                 q           => s_logisimBus23(15 DOWNTO 0),
                 reset       => s_logisimNet6,
                 tick        => '1' );

   MEMORY_5 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet8,
                 d           => s_logisimBus29(15 DOWNTO 0),
                 q           => s_logisimBus30(15 DOWNTO 0),
                 reset       => s_logisimNet6,
                 tick        => logisimClockTree1(2) );

   PLEXERS_6 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus1(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus2(15 DOWNTO 0),
                 muxOut  => s_logisimBus19(15 DOWNTO 0),
                 sel     => s_logisimNet24 );

   ARITH_7 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus20(15 DOWNTO 0),
                 dataB    => s_logisimBus23(15 DOWNTO 0),
                 result   => s_logisimBus18(15 DOWNTO 0) );

   PLEXERS_8 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus5(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus17(15 DOWNTO 0),
                 muxOut  => s_logisimBus11(15 DOWNTO 0),
                 sel     => s_logisimBus9(15) );

   MEMORY_9 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet4,
                 d           => s_logisimBus30(15 DOWNTO 0),
                 q           => s_logisimBus31(15 DOWNTO 0),
                 reset       => s_logisimNet6,
                 tick        => logisimClockTree1(2) );

   MEMORY_10 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => s_logisimNet25,
                 clockEnable => s_logisimNet4,
                 d           => s_logisimBus31(15 DOWNTO 0),
                 q           => s_logisimBus27(15 DOWNTO 0),
                 reset       => s_logisimNet6,
                 tick        => '1' );

   MEMORY_11 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => s_logisimNet26,
                 clockEnable => s_logisimNet4,
                 d           => s_logisimBus32(15 DOWNTO 0),
                 q           => s_logisimBus33(15 DOWNTO 0),
                 reset       => s_logisimNet6,
                 tick        => '1' );

   MEMORY_12 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet4,
                 d           => s_logisimBus33(15 DOWNTO 0),
                 q           => s_logisimBus34(15 DOWNTO 0),
                 reset       => s_logisimNet6,
                 tick        => logisimClockTree1(2) );

   MEMORY_13 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet4,
                 d           => s_logisimBus27(15 DOWNTO 0),
                 q           => s_logisimBus32(15 DOWNTO 0),
                 reset       => s_logisimNet6,
                 tick        => logisimClockTree1(2) );

   ARITH_14 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus18(15 DOWNTO 0),
                 dataB    => s_logisimBus28(15 DOWNTO 0),
                 result   => s_logisimBus13(15 DOWNTO 0) );

   ARITH_15 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus13(15 DOWNTO 0),
                 dataB    => s_logisimBus29(15 DOWNTO 0),
                 result   => s_logisimBus14(15 DOWNTO 0) );

   ARITH_16 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus14(15 DOWNTO 0),
                 dataB    => s_logisimBus30(15 DOWNTO 0),
                 result   => s_logisimBus3(15 DOWNTO 0) );

   ARITH_17 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus3(15 DOWNTO 0),
                 dataB    => s_logisimBus31(15 DOWNTO 0),
                 result   => s_logisimBus10(15 DOWNTO 0) );

   ARITH_18 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus12(15 DOWNTO 0),
                 dataB    => s_logisimBus32(15 DOWNTO 0),
                 result   => s_logisimBus15(15 DOWNTO 0) );

   ARITH_19 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus10(15 DOWNTO 0),
                 dataB    => s_logisimBus27(15 DOWNTO 0),
                 result   => s_logisimBus12(15 DOWNTO 0) );

   ARITH_20 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus15(15 DOWNTO 0),
                 dataB    => s_logisimBus33(15 DOWNTO 0),
                 result   => s_logisimBus0(15 DOWNTO 0) );

   ARITH_21 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus0(15 DOWNTO 0),
                 dataB    => s_logisimBus34(15 DOWNTO 0),
                 result   => s_logisimBus9(15 DOWNTO 0) );

   divide_two_num_1 : divide_two_num
      PORT MAP ( final_answer              => OPEN,
                 final_answer_sixteen_bits => s_logisimBus5(15 DOWNTO 0),
                 val                       => s_logisimBus9(15 DOWNTO 0),
                 val2                      => s_logisimBus36(15 DOWNTO 0) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   twos_complement_1 : twos_complement
      PORT MAP ( absolute_val      => s_logisimBus2(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 negative_number   => s_logisimBus1(15 DOWNTO 0) );

   twos_complement_2 : twos_complement
      PORT MAP ( absolute_val      => s_logisimBus17(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 negative_number   => s_logisimBus5(15 DOWNTO 0) );

END platformIndependent;
