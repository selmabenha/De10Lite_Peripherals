--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_experiments                                    ==
--== Component : error_calc                                                   ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF error_calc IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT OR_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT AND_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
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

      COMPONENT Adder
         GENERIC ( extendedBits : INTEGER;
                   nrOfBits     : INTEGER );
         PORT ( carryIn  : IN  std_logic;
                dataA    : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                dataB    : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                carryOut : OUT std_logic;
                result   : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT LogisimCounter
         GENERIC ( invertClock : INTEGER;
                   maxVal      : std_logic_vector;
                   mode        : INTEGER;
                   width       : INTEGER );
         PORT ( clear      : IN  std_logic;
                clock      : IN  std_logic;
                enable     : IN  std_logic;
                load       : IN  std_logic;
                loadData   : IN  std_logic_vector( (width - 1) DOWNTO 0 );
                tick       : IN  std_logic;
                upNotDown  : IN  std_logic;
                compareOut : OUT std_logic;
                countValue : OUT std_logic_vector( (width - 1) DOWNTO 0 ) );
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

      COMPONENT Multiplexer_bus_2
         GENERIC ( nrOfBits : INTEGER );
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_1 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                sel     : IN  std_logic;
                muxOut  : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT sevenseg_numbers_output
         PORT ( decimal              : IN  std_logic;
                input_bus            : IN  std_logic_vector( 3 DOWNTO 0 );
                logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT accel_final_driver
         PORT ( accel_input       : IN  std_logic;
                enable_accel      : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                miso              : IN  std_logic;
                rst               : IN  std_logic;
                x_offset          : IN  std_logic_vector( 15 DOWNTO 0 );
                y_offset          : IN  std_logic_vector( 15 DOWNTO 0 );
                z_offset          : IN  std_logic_vector( 15 DOWNTO 0 );
                cs                : OUT std_logic;
                down              : OUT std_logic;
                left              : OUT std_logic;
                mosi              : OUT std_logic;
                right             : OUT std_logic;
                sclk              : OUT std_logic;
                up                : OUT std_logic;
                x_filtered        : OUT std_logic_vector( 15 DOWNTO 0 );
                x_large           : OUT std_logic;
                x_medium          : OUT std_logic;
                x_small           : OUT std_logic;
                y_filtered        : OUT std_logic_vector( 15 DOWNTO 0 );
                y_large           : OUT std_logic;
                y_medium          : OUT std_logic;
                y_small           : OUT std_logic;
                z_filtered        : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT absolute_val_and_sign
         PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                unfiltered        : IN  std_logic_vector( 15 DOWNTO 0 );
                negative          : OUT std_logic;
                value             : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus13 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus14 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus15 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus16 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus20 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus21 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus24 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus25 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus3  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus6  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet17 : std_logic;
   SIGNAL s_logisimNet18 : std_logic;
   SIGNAL s_logisimNet22 : std_logic;
   SIGNAL s_logisimNet23 : std_logic;
   SIGNAL s_logisimNet26 : std_logic;
   SIGNAL s_logisimNet27 : std_logic;
   SIGNAL s_logisimNet28 : std_logic;
   SIGNAL s_logisimNet29 : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet18 <= logisimClockTree1(0);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet10 <= selector;
   s_logisimNet11 <= miso;
   s_logisimNet12 <= accel_input;
   s_logisimNet17 <= enable_accel;
   s_logisimNet5  <= rst;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   cs   <= s_logisimNet29;
   led  <= s_logisimNet1;
   mosi <= s_logisimNet27;
   sclk <= s_logisimNet28;
   y    <= s_logisimNet10;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus24(7 DOWNTO 0)  <=  X"65";


   -- Constant
    s_logisimBus13(15 DOWNTO 0)  <=  X"003E";


   -- Constant
    s_logisimBus14(15 DOWNTO 0)  <=  X"0039";


   -- Constant
    s_logisimBus15(15 DOWNTO 0)  <=  X"003A";


   -- Constant
    s_logisimNet23  <=  '1';


   -- NOT Gate
   s_logisimNet26 <=  NOT s_logisimNet1;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimNet5,
                 result => s_logisimNet9 );

   GATES_2 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet26,
                 input2 => s_logisimNet17,
                 result => s_logisimNet22 );

   ARITH_3 : Comparator
      GENERIC MAP ( nrOfBits       => 8,
                    twosComplement => 1 )
      PORT MAP ( aEqualsB      => s_logisimNet1,
                 aGreaterThanB => OPEN,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus6(7 DOWNTO 0),
                 dataB         => s_logisimBus24(7 DOWNTO 0) );

   ARITH_4 : Multiplier
      GENERIC MAP ( calcBits           => 32,
                    nrOfBits           => 16,
                    unsignedMultiplier => 0 )
      PORT MAP ( carryIn  => X"0000",
                 inputA   => s_logisimBus3(15 DOWNTO 0),
                 inputB   => s_logisimBus3(15 DOWNTO 0),
                 multHigh => OPEN,
                 multLow  => s_logisimBus0(15 DOWNTO 0) );

   ARITH_5 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus0(15 DOWNTO 0),
                 dataB    => s_logisimBus4(15 DOWNTO 0),
                 result   => s_logisimBus16(15 DOWNTO 0) );

   MEMORY_6 : LogisimCounter
      GENERIC MAP ( invertClock => 0,
                    maxVal      => X"FF",
                    mode        => 0,
                    width       => 8 )
      PORT MAP ( clear      => s_logisimNet5,
                 clock      => logisimClockTree1(4),
                 compareOut => OPEN,
                 countValue => s_logisimBus6(7 DOWNTO 0),
                 enable     => s_logisimNet22,
                 load       => '0',
                 loadData   => X"00",
                 tick       => logisimClockTree1(2),
                 upNotDown  => '0' );

   MEMORY_7 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree1(4),
                 clockEnable => s_logisimNet23,
                 d           => s_logisimBus16(15 DOWNTO 0),
                 q           => s_logisimBus4(15 DOWNTO 0),
                 reset       => s_logisimNet5,
                 tick        => logisimClockTree1(2) );

   PLEXERS_8 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus25(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus21(15 DOWNTO 0),
                 muxOut  => s_logisimBus20(15 DOWNTO 0),
                 sel     => s_logisimNet10 );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   sevenseg_numbers_output_1 : sevenseg_numbers_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus4(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(7  DOWNTO  0) );

   sevenseg_numbers_output_2 : sevenseg_numbers_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus4(7 DOWNTO 4),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(15  DOWNTO  8) );

   sevenseg_numbers_output_3 : sevenseg_numbers_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus4(11 DOWNTO 8),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(23  DOWNTO  16) );

   sevenseg_numbers_output_4 : sevenseg_numbers_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus4(15 DOWNTO 12),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(31  DOWNTO  24) );

   accel_final_driver_1 : accel_final_driver
      PORT MAP ( accel_input       => s_logisimNet12,
                 cs                => s_logisimNet29,
                 down              => OPEN,
                 enable_accel      => s_logisimNet17,
                 left              => OPEN,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 miso              => s_logisimNet11,
                 mosi              => s_logisimNet27,
                 right             => OPEN,
                 rst               => s_logisimNet9,
                 sclk              => s_logisimNet28,
                 up                => OPEN,
                 x_filtered        => s_logisimBus25(15 DOWNTO 0),
                 x_large           => OPEN,
                 x_medium          => OPEN,
                 x_offset          => s_logisimBus13(15 DOWNTO 0),
                 x_small           => OPEN,
                 y_filtered        => s_logisimBus21(15 DOWNTO 0),
                 y_large           => OPEN,
                 y_medium          => OPEN,
                 y_offset          => s_logisimBus14(15 DOWNTO 0),
                 y_small           => OPEN,
                 z_filtered        => OPEN,
                 z_offset          => s_logisimBus15(15 DOWNTO 0) );

   absolute_val_and_sign_1 : absolute_val_and_sign
      PORT MAP ( logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 negative          => OPEN,
                 unfiltered        => s_logisimBus20(15 DOWNTO 0),
                 value             => s_logisimBus3(15 DOWNTO 0) );

END platformIndependent;
