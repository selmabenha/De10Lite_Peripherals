--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2                                             ==
--== Component : accel_values_filtered_and_raw_tb                             ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF accel_values_filtered_and_raw_tb IS 

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

      COMPONENT Multiplexer_bus_2
         GENERIC ( nrOfBits : INTEGER );
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_1 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                sel     : IN  std_logic;
                muxOut  : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
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

      COMPONENT D_FLIPFLOP
         GENERIC ( invertClockEnable : INTEGER );
         PORT ( clock  : IN  std_logic;
                d      : IN  std_logic;
                preset : IN  std_logic;
                reset  : IN  std_logic;
                tick   : IN  std_logic;
                q      : OUT std_logic;
                qBar   : OUT std_logic );
      END COMPONENT;

      COMPONENT hex_to_decimal
         PORT ( val      : IN  std_logic_vector( 7 DOWNTO 0 );
                hundreds : OUT std_logic_vector( 3 DOWNTO 0 );
                ones     : OUT std_logic_vector( 3 DOWNTO 0 );
                tens     : OUT std_logic_vector( 3 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT lowpass
         PORT ( clock             : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                negative          : IN  std_logic;
                reset             : IN  std_logic;
                unfiltered        : IN  std_logic_vector( 15 DOWNTO 0 );
                filtered          : OUT std_logic_vector( 7 DOWNTO 0 );
                negative_val      : OUT std_logic );
      END COMPONENT;

      COMPONENT sevenseg_numbers_output
         PORT ( decimal              : IN  std_logic;
                input_bus            : IN  std_logic_vector( 3 DOWNTO 0 );
                logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT reset_logic
         PORT ( enable            : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                reset             : IN  std_logic;
                enable_out        : OUT std_logic;
                reset_out         : OUT std_logic );
      END COMPONENT;

      COMPONENT accel_driver_logisim
         PORT ( accel_input       : IN  std_logic;
                enable_accel      : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                miso              : IN  std_logic;
                rst               : IN  std_logic;
                Accelerometer     : OUT std_logic_vector( 47 DOWNTO 0 );
                cs                : OUT std_logic;
                mosi              : OUT std_logic;
                sclk              : OUT std_logic );
      END COMPONENT;

      COMPONENT scale_down
         PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                number_input      : IN  std_logic_vector( 15 DOWNTO 0 );
                second_num        : IN  std_logic_vector( 15 DOWNTO 0 );
                answer            : OUT std_logic_vector( 15 DOWNTO 0 );
                hundreds          : OUT std_logic_vector( 3 DOWNTO 0 );
                negative          : OUT std_logic;
                ones              : OUT std_logic_vector( 3 DOWNTO 0 );
                tens              : OUT std_logic_vector( 3 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus1  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus12 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus14 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus16 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus17 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus18 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus19 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus2  : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus20 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus21 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus23 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus24 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus25 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus37 : std_logic_vector( 47 DOWNTO 0 );
   SIGNAL s_logisimBus38 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus6  : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet15 : std_logic;
   SIGNAL s_logisimNet22 : std_logic;
   SIGNAL s_logisimNet29 : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet30 : std_logic;
   SIGNAL s_logisimNet31 : std_logic;
   SIGNAL s_logisimNet32 : std_logic;
   SIGNAL s_logisimNet33 : std_logic;
   SIGNAL s_logisimNet34 : std_logic;
   SIGNAL s_logisimNet35 : std_logic;
   SIGNAL s_logisimNet36 : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet31 <= logisimClockTree1(0);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet10 <= accel_input;
   s_logisimNet11 <= enable_accel;
   s_logisimNet22 <= rst;
   s_logisimNet9  <= miso;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   cs   <= s_logisimNet36;
   mosi <= s_logisimNet34;
   sclk <= s_logisimNet35;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimNet32  <=  '1';


   -- Constant
    s_logisimNet33  <=  '1';


   -- Constant
    s_logisimBus25(15 DOWNTO 0)  <=  X"003B";


   -- Constant
    s_logisimBus18(15 DOWNTO 0)  <=  X"003B";


   -- Constant
    s_logisimBus19(15 DOWNTO 0)  <=  X"003B";


   -- Constant
    s_logisimBus14(15 DOWNTO 0)  <=  X"0000";


   -- Constant
    s_logisimBus38(15 DOWNTO 0)  <=  X"6400";


   -- DIP Switch: AXIS_SELECTOR
   s_logisimBus24(0) <= logisimInputBubbles(0);
   s_logisimBus24(1) <= logisimInputBubbles(1);

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus21(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus12(15 DOWNTO 0),
                 muxIn_2 => s_logisimBus5(15 DOWNTO 0),
                 muxIn_3 => X"0000",
                 muxOut  => s_logisimBus0(15 DOWNTO 0),
                 sel     => s_logisimBus24(1 DOWNTO 0) );

   PLEXERS_2 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus0(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus14(15 DOWNTO 0),
                 muxOut  => s_logisimBus20(15 DOWNTO 0),
                 sel     => s_logisimNet13 );

   ARITH_3 : Subtractor
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( borrowIn  => '0',
                 borrowOut => OPEN,
                 dataA     => s_logisimBus37(15 DOWNTO 0),
                 dataB     => s_logisimBus25(15 DOWNTO 0),
                 result    => s_logisimBus21(15 DOWNTO 0) );

   ARITH_4 : Subtractor
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( borrowIn  => '0',
                 borrowOut => OPEN,
                 dataA     => s_logisimBus37(31 DOWNTO 16),
                 dataB     => s_logisimBus18(15 DOWNTO 0),
                 result    => s_logisimBus12(15 DOWNTO 0) );

   ARITH_5 : Subtractor
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( borrowIn  => '0',
                 borrowOut => OPEN,
                 dataA     => s_logisimBus37(47 DOWNTO 32),
                 dataB     => s_logisimBus19(15 DOWNTO 0),
                 result    => s_logisimBus5(15 DOWNTO 0) );

   MEMORY_6 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => '0',
                 d      => '0',
                 preset => s_logisimNet3,
                 q      => s_logisimNet13,
                 qBar   => OPEN,
                 reset  => s_logisimNet7,
                 tick   => '0' );

   hex_to_decimal_1 : hex_to_decimal
      PORT MAP ( hundreds => s_logisimBus6(3 DOWNTO 0),
                 ones     => s_logisimBus4(3 DOWNTO 0),
                 tens     => s_logisimBus2(3 DOWNTO 0),
                 val      => s_logisimBus17(7 DOWNTO 0) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   lowpass_1 : lowpass
      PORT MAP ( clock             => s_logisimNet31,
                 filtered          => s_logisimBus17(7 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 negative          => s_logisimNet15,
                 negative_val      => OPEN,
                 reset             => s_logisimNet22,
                 unfiltered        => s_logisimBus1(15 DOWNTO 0) );

   HEX5 : sevenseg_numbers_output
      PORT MAP ( decimal              => s_logisimNet32,
                 input_bus            => s_logisimBus16(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(7  DOWNTO  0) );

   HEX4 : sevenseg_numbers_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus23(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(15  DOWNTO  8) );

   HEX3 : sevenseg_numbers_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus8(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(23  DOWNTO  16) );

   HEX2 : sevenseg_numbers_output
      PORT MAP ( decimal              => s_logisimNet33,
                 input_bus            => s_logisimBus6(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(31  DOWNTO  24) );

   HEX1 : sevenseg_numbers_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus2(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(39  DOWNTO  32) );

   HEX0 : sevenseg_numbers_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus4(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(47  DOWNTO  40) );

   reset_logic_1 : reset_logic
      PORT MAP ( enable            => s_logisimNet11,
                 enable_out        => s_logisimNet7,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 reset             => s_logisimNet22,
                 reset_out         => s_logisimNet3 );

   accel_driver_logisim_1 : accel_driver_logisim
      PORT MAP ( Accelerometer     => s_logisimBus37(47 DOWNTO 0),
                 accel_input       => s_logisimNet10,
                 cs                => s_logisimNet36,
                 enable_accel      => s_logisimNet11,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 miso              => s_logisimNet9,
                 mosi              => s_logisimNet34,
                 rst               => s_logisimNet22,
                 sclk              => s_logisimNet35 );

   scale_down_1 : scale_down
      PORT MAP ( answer            => s_logisimBus1(15 DOWNTO 0),
                 hundreds          => s_logisimBus16(3 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 negative          => s_logisimNet15,
                 number_input      => s_logisimBus20(15 DOWNTO 0),
                 ones              => s_logisimBus8(3 DOWNTO 0),
                 second_num        => s_logisimBus38(15 DOWNTO 0),
                 tens              => s_logisimBus23(3 DOWNTO 0) );

END platformIndependent;
