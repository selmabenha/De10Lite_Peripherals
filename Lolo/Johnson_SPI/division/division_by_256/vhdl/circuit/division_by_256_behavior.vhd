--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : division                                                     ==
--== Component : division_by_256                                              ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF division_by_256 IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT Multiplier
         GENERIC ( calcBits           : INTEGER;
                   nrOfBits           : INTEGER;
                   unsignedMultiplier : INTEGER );
         PORT ( carryIn  : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                inputA   : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                inputB   : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                multHigh : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                multLow  : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT Shifter_32_bit
         GENERIC ( shifterMode : INTEGER );
         PORT ( dataA       : IN  std_logic_vector( 31 DOWNTO 0 );
                shiftAmount : IN  std_logic_vector( 4 DOWNTO 0 );
                result      : OUT std_logic_vector( 31 DOWNTO 0 ) );
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

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0  : std_logic_vector( 31 DOWNTO 0 );
   SIGNAL s_logisimBus1  : std_logic_vector( 31 DOWNTO 0 );
   SIGNAL s_logisimBus10 : std_logic_vector( 31 DOWNTO 0 );
   SIGNAL s_logisimBus11 : std_logic_vector( 31 DOWNTO 0 );
   SIGNAL s_logisimBus12 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus13 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus14 : std_logic_vector( 31 DOWNTO 0 );
   SIGNAL s_logisimBus15 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus16 : std_logic_vector( 31 DOWNTO 0 );
   SIGNAL s_logisimBus17 : std_logic_vector( 31 DOWNTO 0 );
   SIGNAL s_logisimBus18 : std_logic_vector( 31 DOWNTO 0 );
   SIGNAL s_logisimBus2  : std_logic_vector( 31 DOWNTO 0 );
   SIGNAL s_logisimBus3  : std_logic_vector( 31 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 31 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 31 DOWNTO 0 );
   SIGNAL s_logisimBus6  : std_logic_vector( 31 DOWNTO 0 );
   SIGNAL s_logisimBus7  : std_logic_vector( 31 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 31 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 31 DOWNTO 0 );

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus6(31 DOWNTO 0) <= Input_value;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   hundreds <= s_logisimBus0(31 DOWNTO 0);
   ones     <= s_logisimBus11(31 DOWNTO 0);
   tens     <= s_logisimBus2(31 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus12(4 DOWNTO 0)  <=  "0"&X"F";


   -- Constant
    s_logisimBus13(4 DOWNTO 0)  <=  "0"&X"F";


   -- Constant
    s_logisimBus14(31 DOWNTO 0)  <=  X"00000148";


   -- Constant
    s_logisimBus16(31 DOWNTO 0)  <=  X"00000CCD";


   -- Constant
    s_logisimBus15(4 DOWNTO 0)  <=  "0"&X"F";


   -- Constant
    s_logisimBus17(31 DOWNTO 0)  <=  X"00000064";


   -- Constant
    s_logisimBus18(31 DOWNTO 0)  <=  X"0000000A";


   -- Constant
    s_logisimBus7(31 DOWNTO 0)  <=  X"00003200";


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   ARITH_1 : Multiplier
      GENERIC MAP ( calcBits           => 64,
                    nrOfBits           => 32,
                    unsignedMultiplier => 0 )
      PORT MAP ( carryIn  => X"00000000",
                 inputA   => s_logisimBus6(31 DOWNTO 0),
                 inputB   => s_logisimBus7(31 DOWNTO 0),
                 multHigh => OPEN,
                 multLow  => s_logisimBus4(31 DOWNTO 0) );

   ARITH_2 : Shifter_32_bit
      GENERIC MAP ( shifterMode => 2 )
      PORT MAP ( dataA       => s_logisimBus4(31 DOWNTO 0),
                 result      => s_logisimBus10(31 DOWNTO 0),
                 shiftAmount => s_logisimBus13(4 DOWNTO 0) );

   ARITH_3 : Shifter_32_bit
      GENERIC MAP ( shifterMode => 2 )
      PORT MAP ( dataA       => s_logisimBus3(31 DOWNTO 0),
                 result      => s_logisimBus0(31 DOWNTO 0),
                 shiftAmount => s_logisimBus12(4 DOWNTO 0) );

   ARITH_4 : Multiplier
      GENERIC MAP ( calcBits           => 64,
                    nrOfBits           => 32,
                    unsignedMultiplier => 0 )
      PORT MAP ( carryIn  => X"00000000",
                 inputA   => s_logisimBus10(31 DOWNTO 0),
                 inputB   => s_logisimBus14(31 DOWNTO 0),
                 multHigh => OPEN,
                 multLow  => s_logisimBus3(31 DOWNTO 0) );

   ARITH_5 : Shifter_32_bit
      GENERIC MAP ( shifterMode => 2 )
      PORT MAP ( dataA       => s_logisimBus5(31 DOWNTO 0),
                 result      => s_logisimBus2(31 DOWNTO 0),
                 shiftAmount => s_logisimBus15(4 DOWNTO 0) );

   ARITH_6 : Multiplier
      GENERIC MAP ( calcBits           => 64,
                    nrOfBits           => 32,
                    unsignedMultiplier => 0 )
      PORT MAP ( carryIn  => X"00000000",
                 inputA   => s_logisimBus1(31 DOWNTO 0),
                 inputB   => s_logisimBus16(31 DOWNTO 0),
                 multHigh => OPEN,
                 multLow  => s_logisimBus5(31 DOWNTO 0) );

   ARITH_7 : Multiplier
      GENERIC MAP ( calcBits           => 64,
                    nrOfBits           => 32,
                    unsignedMultiplier => 0 )
      PORT MAP ( carryIn  => X"00000000",
                 inputA   => s_logisimBus0(31 DOWNTO 0),
                 inputB   => s_logisimBus17(31 DOWNTO 0),
                 multHigh => OPEN,
                 multLow  => s_logisimBus8(31 DOWNTO 0) );

   ARITH_8 : Subtractor
      GENERIC MAP ( extendedBits => 33,
                    nrOfBits     => 32 )
      PORT MAP ( borrowIn  => '0',
                 borrowOut => OPEN,
                 dataA     => s_logisimBus10(31 DOWNTO 0),
                 dataB     => s_logisimBus8(31 DOWNTO 0),
                 result    => s_logisimBus1(31 DOWNTO 0) );

   ARITH_9 : Subtractor
      GENERIC MAP ( extendedBits => 33,
                    nrOfBits     => 32 )
      PORT MAP ( borrowIn  => '0',
                 borrowOut => OPEN,
                 dataA     => s_logisimBus1(31 DOWNTO 0),
                 dataB     => s_logisimBus9(31 DOWNTO 0),
                 result    => s_logisimBus11(31 DOWNTO 0) );

   ARITH_10 : Multiplier
      GENERIC MAP ( calcBits           => 64,
                    nrOfBits           => 32,
                    unsignedMultiplier => 0 )
      PORT MAP ( carryIn  => X"00000000",
                 inputA   => s_logisimBus2(31 DOWNTO 0),
                 inputB   => s_logisimBus18(31 DOWNTO 0),
                 multHigh => OPEN,
                 multLow  => s_logisimBus9(31 DOWNTO 0) );


END platformIndependent;
