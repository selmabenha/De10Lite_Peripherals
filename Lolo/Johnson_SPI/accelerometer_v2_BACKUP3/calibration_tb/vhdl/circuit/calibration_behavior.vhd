--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2_BACKUP3                                     ==
--== Component : calibration                                                  ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF calibration IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

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

      COMPONENT Subtractor
         GENERIC ( extendedBits : INTEGER;
                   nrOfBits     : INTEGER );
         PORT ( borrowIn  : IN  std_logic;
                dataA     : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                dataB     : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                borrowOut : OUT std_logic;
                result    : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT Multiplexer_bus_2
         GENERIC ( nrOfBits : INTEGER );
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_1 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                sel     : IN  std_logic;
                muxOut  : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
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

      COMPONENT signed_div_by_128
         PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                unfiltered        : IN  std_logic_vector( 15 DOWNTO 0 );
                result            : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT reset_logic
         PORT ( enable            : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                reset             : IN  std_logic;
                enable_out        : OUT std_logic;
                reset_out         : OUT std_logic );
      END COMPONENT;

      COMPONENT signed_fast_filter
         PORT ( clock             : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                reset             : IN  std_logic;
                unfiltered        : IN  std_logic_vector( 15 DOWNTO 0 );
                filtered          : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus1  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus16 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus17 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus18 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus2  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus23 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus24 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus25 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus26 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus27 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus28 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus30 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus32 : std_logic_vector( 47 DOWNTO 0 );
   SIGNAL s_logisimBus37 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus38 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus6  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus7  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet14 : std_logic;
   SIGNAL s_logisimNet15 : std_logic;
   SIGNAL s_logisimNet19 : std_logic;
   SIGNAL s_logisimNet20 : std_logic;
   SIGNAL s_logisimNet21 : std_logic;
   SIGNAL s_logisimNet22 : std_logic;
   SIGNAL s_logisimNet29 : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet31 : std_logic;
   SIGNAL s_logisimNet35 : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet9 <= logisimClockTree1(0);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus26(15 DOWNTO 0) <= x_offset;
   s_logisimBus27(15 DOWNTO 0) <= y_offset;
   s_logisimBus28(15 DOWNTO 0) <= z_offset;
   s_logisimNet13              <= miso;
   s_logisimNet14              <= accel_input;
   s_logisimNet15              <= enable_accel;
   s_logisimNet22              <= rst;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   cs         <= s_logisimNet31;
   mosi       <= s_logisimNet35;
   sclk       <= s_logisimNet29;
   x_filtered <= s_logisimBus0(15 DOWNTO 0);
   y_filtered <= s_logisimBus1(15 DOWNTO 0);
   z_filtered <= s_logisimBus2(15 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus30(15 DOWNTO 0)  <=  X"0000";


   -- Constant
    s_logisimBus37(15 DOWNTO 0)  <=  X"0000";


   -- Constant
    s_logisimBus38(15 DOWNTO 0)  <=  X"0000";


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   MEMORY_1 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => '0',
                 d      => '0',
                 preset => s_logisimNet4,
                 q      => s_logisimNet21,
                 qBar   => OPEN,
                 reset  => s_logisimNet10,
                 tick   => '0' );

   ARITH_2 : Subtractor
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( borrowIn  => '0',
                 borrowOut => OPEN,
                 dataA     => s_logisimBus32(47 DOWNTO 32),
                 dataB     => s_logisimBus28(15 DOWNTO 0),
                 result    => s_logisimBus8(15 DOWNTO 0) );

   MEMORY_3 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => '0',
                 d      => '0',
                 preset => s_logisimNet3,
                 q      => s_logisimNet19,
                 qBar   => OPEN,
                 reset  => s_logisimNet11,
                 tick   => '0' );

   PLEXERS_4 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus8(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus38(15 DOWNTO 0),
                 muxOut  => s_logisimBus25(15 DOWNTO 0),
                 sel     => s_logisimNet21 );

   PLEXERS_5 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus7(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus30(15 DOWNTO 0),
                 muxOut  => s_logisimBus24(15 DOWNTO 0),
                 sel     => s_logisimNet20 );

   ARITH_6 : Subtractor
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( borrowIn  => '0',
                 borrowOut => OPEN,
                 dataA     => s_logisimBus32(15 DOWNTO 0),
                 dataB     => s_logisimBus26(15 DOWNTO 0),
                 result    => s_logisimBus6(15 DOWNTO 0) );

   MEMORY_7 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => '0',
                 d      => '0',
                 preset => s_logisimNet5,
                 q      => s_logisimNet20,
                 qBar   => OPEN,
                 reset  => s_logisimNet12,
                 tick   => '0' );

   ARITH_8 : Subtractor
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( borrowIn  => '0',
                 borrowOut => OPEN,
                 dataA     => s_logisimBus32(31 DOWNTO 16),
                 dataB     => s_logisimBus27(15 DOWNTO 0),
                 result    => s_logisimBus7(15 DOWNTO 0) );

   PLEXERS_9 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus6(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus37(15 DOWNTO 0),
                 muxOut  => s_logisimBus23(15 DOWNTO 0),
                 sel     => s_logisimNet19 );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   accel_driver_logisim_1 : accel_driver_logisim
      PORT MAP ( Accelerometer     => s_logisimBus32(47 DOWNTO 0),
                 accel_input       => s_logisimNet14,
                 cs                => s_logisimNet31,
                 enable_accel      => s_logisimNet15,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 miso              => s_logisimNet13,
                 mosi              => s_logisimNet35,
                 rst               => s_logisimNet22,
                 sclk              => s_logisimNet29 );

   signed_div_by_128_2 : signed_div_by_128
      PORT MAP ( logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 result            => s_logisimBus17(15 DOWNTO 0),
                 unfiltered        => s_logisimBus24(15 DOWNTO 0) );

   reset_logic_2 : reset_logic
      PORT MAP ( enable            => s_logisimNet15,
                 enable_out        => s_logisimNet12,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 reset             => s_logisimNet22,
                 reset_out         => s_logisimNet5 );

   signed_div_by_128_3 : signed_div_by_128
      PORT MAP ( logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 result            => s_logisimBus18(15 DOWNTO 0),
                 unfiltered        => s_logisimBus25(15 DOWNTO 0) );

   signed_fast_filter_1 : signed_fast_filter
      PORT MAP ( clock             => s_logisimNet9,
                 filtered          => s_logisimBus0(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 reset             => s_logisimNet22,
                 unfiltered        => s_logisimBus16(15 DOWNTO 0) );

   signed_fast_filter_3 : signed_fast_filter
      PORT MAP ( clock             => s_logisimNet9,
                 filtered          => s_logisimBus2(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 reset             => s_logisimNet22,
                 unfiltered        => s_logisimBus18(15 DOWNTO 0) );

   signed_fast_filter_2 : signed_fast_filter
      PORT MAP ( clock             => s_logisimNet9,
                 filtered          => s_logisimBus1(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 reset             => s_logisimNet22,
                 unfiltered        => s_logisimBus17(15 DOWNTO 0) );

   reset_logic_1 : reset_logic
      PORT MAP ( enable            => s_logisimNet15,
                 enable_out        => s_logisimNet11,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 reset             => s_logisimNet22,
                 reset_out         => s_logisimNet3 );

   reset_logic_3 : reset_logic
      PORT MAP ( enable            => s_logisimNet15,
                 enable_out        => s_logisimNet10,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 reset             => s_logisimNet22,
                 reset_out         => s_logisimNet4 );

   signed_div_by_128_1 : signed_div_by_128
      PORT MAP ( logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 result            => s_logisimBus16(15 DOWNTO 0),
                 unfiltered        => s_logisimBus23(15 DOWNTO 0) );

END platformIndependent;
