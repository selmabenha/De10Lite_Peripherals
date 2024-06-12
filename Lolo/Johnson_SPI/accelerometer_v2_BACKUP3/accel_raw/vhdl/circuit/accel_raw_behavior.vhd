--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2_BACKUP3                                     ==
--== Component : accel_raw                                                    ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF accel_raw IS 

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

      COMPONENT sevenseg_numbers_output
         PORT ( decimal              : IN  std_logic;
                input_bus            : IN  std_logic_vector( 3 DOWNTO 0 );
                logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
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

      COMPONENT diff_detector
         PORT ( checker           : IN  std_logic_vector( 15 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                different         : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus12 : std_logic_vector( 47 DOWNTO 0 );
   SIGNAL s_logisimBus16 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus28 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus29 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus30 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus31 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet14 : std_logic;
   SIGNAL s_logisimNet18 : std_logic;
   SIGNAL s_logisimNet19 : std_logic;
   SIGNAL s_logisimNet20 : std_logic;
   SIGNAL s_logisimNet21 : std_logic;
   SIGNAL s_logisimNet22 : std_logic;
   SIGNAL s_logisimNet23 : std_logic;
   SIGNAL s_logisimNet24 : std_logic;
   SIGNAL s_logisimNet25 : std_logic;
   SIGNAL s_logisimNet26 : std_logic;
   SIGNAL s_logisimNet27 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet11 <= logisimClockTree1(0);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet21 <= rst;
   s_logisimNet22 <= miso;
   s_logisimNet23 <= accel_input;
   s_logisimNet24 <= enable_accel;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   cs   <= s_logisimNet27;
   led1 <= s_logisimNet11;
   mosi <= s_logisimNet25;
   sclk <= s_logisimNet26;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimNet18  <=  '1';


   -- DIP Switch: AXIS_SELECTOR
   s_logisimBus16(0) <= logisimInputBubbles(0);
   s_logisimBus16(1) <= logisimInputBubbles(1);

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 4 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus12(3 DOWNTO 0),
                 muxIn_1 => s_logisimBus12(19 DOWNTO 16),
                 muxIn_2 => s_logisimBus12(35 DOWNTO 32),
                 muxIn_3 => X"0",
                 muxOut  => s_logisimBus28(3 DOWNTO 0),
                 sel     => s_logisimBus16(1 DOWNTO 0) );

   PLEXERS_2 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 4 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus12(7 DOWNTO 4),
                 muxIn_1 => s_logisimBus12(23 DOWNTO 20),
                 muxIn_2 => s_logisimBus12(39 DOWNTO 36),
                 muxIn_3 => X"0",
                 muxOut  => s_logisimBus29(3 DOWNTO 0),
                 sel     => s_logisimBus16(1 DOWNTO 0) );

   PLEXERS_3 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 4 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus12(11 DOWNTO 8),
                 muxIn_1 => s_logisimBus12(27 DOWNTO 24),
                 muxIn_2 => s_logisimBus12(43 DOWNTO 40),
                 muxIn_3 => X"0",
                 muxOut  => s_logisimBus30(3 DOWNTO 0),
                 sel     => s_logisimBus16(1 DOWNTO 0) );

   PLEXERS_4 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 4 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus12(15 DOWNTO 12),
                 muxIn_1 => s_logisimBus12(31 DOWNTO 28),
                 muxIn_2 => s_logisimBus12(47 DOWNTO 44),
                 muxIn_3 => X"0",
                 muxOut  => s_logisimBus31(3 DOWNTO 0),
                 sel     => s_logisimBus16(1 DOWNTO 0) );

   MEMORY_5 : LogisimCounter
      GENERIC MAP ( invertClock => 0,
                    maxVal      => X"F",
                    mode        => 0,
                    width       => 4 )
      PORT MAP ( clear      => '0',
                 clock      => s_logisimNet14,
                 compareOut => OPEN,
                 countValue => s_logisimBus8(3 DOWNTO 0),
                 enable     => '1',
                 load       => '0',
                 loadData   => X"0",
                 tick       => '1',
                 upNotDown  => s_logisimNet18 );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   sevenseg_numbers_output_1 : sevenseg_numbers_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus8(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(7  DOWNTO  0) );

   accel_driver_logisim_1 : accel_driver_logisim
      PORT MAP ( Accelerometer     => s_logisimBus12(47 DOWNTO 0),
                 accel_input       => s_logisimNet23,
                 cs                => s_logisimNet27,
                 enable_accel      => s_logisimNet24,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 miso              => s_logisimNet22,
                 mosi              => s_logisimNet25,
                 rst               => s_logisimNet21,
                 sclk              => s_logisimNet26 );

   diff_detector_1 : diff_detector
      PORT MAP ( checker           => s_logisimBus12(15 DOWNTO 0),
                 different         => s_logisimNet14,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   HEX0 : sevenseg_numbers_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus28(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(15  DOWNTO  8) );

   HEX1 : sevenseg_numbers_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus29(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(23  DOWNTO  16) );

   HEX2 : sevenseg_numbers_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus30(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(31  DOWNTO  24) );

   HEX3 : sevenseg_numbers_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus31(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(39  DOWNTO  32) );

END platformIndependent;
