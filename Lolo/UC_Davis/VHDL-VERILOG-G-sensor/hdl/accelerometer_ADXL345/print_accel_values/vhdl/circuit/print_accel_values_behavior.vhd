--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_ADXL345                                        ==
--== Component : print_accel_values                                           ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF print_accel_values IS 

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

      COMPONENT accel_main_driver
         PORT ( accel_input       : IN  std_logic;
                enable_accel      : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                miso              : IN  std_logic;
                rst               : IN  std_logic;
                Accelerometer     : OUT std_logic_vector( 47 DOWNTO 0 );
                cs                : OUT std_logic;
                mosi              : OUT std_logic;
                sclk              : OUT std_logic );
      END COMPONENT;

      COMPONENT sevenseg_output
         PORT ( Input_bus_1          : IN  std_logic_vector( 3 DOWNTO 0 );
                logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus13 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus23 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus24 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus25 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus26 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 47 DOWNTO 0 );
   SIGNAL s_logisimNet14 : std_logic;
   SIGNAL s_logisimNet15 : std_logic;
   SIGNAL s_logisimNet16 : std_logic;
   SIGNAL s_logisimNet17 : std_logic;
   SIGNAL s_logisimNet18 : std_logic;
   SIGNAL s_logisimNet19 : std_logic;
   SIGNAL s_logisimNet20 : std_logic;
   SIGNAL s_logisimNet21 : std_logic;
   SIGNAL s_logisimNet22 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet16 <= rst;
   s_logisimNet17 <= miso;
   s_logisimNet18 <= accel_input;
   s_logisimNet19 <= enable_accel;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   cs   <= s_logisimNet22;
   mosi <= s_logisimNet20;
   sclk <= s_logisimNet21;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- DIP Switch: AXIS_SELECTOR
   s_logisimBus13(0) <= logisimInputBubbles(0);
   s_logisimBus13(1) <= logisimInputBubbles(1);

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 4 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus5(3 DOWNTO 0),
                 muxIn_1 => s_logisimBus5(19 DOWNTO 16),
                 muxIn_2 => s_logisimBus5(35 DOWNTO 32),
                 muxIn_3 => X"0",
                 muxOut  => s_logisimBus23(3 DOWNTO 0),
                 sel     => s_logisimBus13(1 DOWNTO 0) );

   PLEXERS_2 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 4 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus5(7 DOWNTO 4),
                 muxIn_1 => s_logisimBus5(23 DOWNTO 20),
                 muxIn_2 => s_logisimBus5(39 DOWNTO 36),
                 muxIn_3 => X"0",
                 muxOut  => s_logisimBus24(3 DOWNTO 0),
                 sel     => s_logisimBus13(1 DOWNTO 0) );

   PLEXERS_3 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 4 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus5(11 DOWNTO 8),
                 muxIn_1 => s_logisimBus5(27 DOWNTO 24),
                 muxIn_2 => s_logisimBus5(43 DOWNTO 40),
                 muxIn_3 => X"0",
                 muxOut  => s_logisimBus25(3 DOWNTO 0),
                 sel     => s_logisimBus13(1 DOWNTO 0) );

   PLEXERS_4 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 4 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus5(15 DOWNTO 12),
                 muxIn_1 => s_logisimBus5(31 DOWNTO 28),
                 muxIn_2 => s_logisimBus5(47 DOWNTO 44),
                 muxIn_3 => X"0",
                 muxOut  => s_logisimBus26(3 DOWNTO 0),
                 sel     => s_logisimBus13(1 DOWNTO 0) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   ADXL345_CHIP : accel_main_driver
      PORT MAP ( Accelerometer     => s_logisimBus5(47 DOWNTO 0),
                 accel_input       => s_logisimNet18,
                 cs                => s_logisimNet22,
                 enable_accel      => s_logisimNet19,
                 logisimClockTree0 => logisimClockTree0,
                 miso              => s_logisimNet17,
                 mosi              => s_logisimNet20,
                 rst               => s_logisimNet16,
                 sclk              => s_logisimNet21 );

   HEX0 : sevenseg_output
      PORT MAP ( Input_bus_1          => s_logisimBus23(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(7  DOWNTO  0) );

   HEX1 : sevenseg_output
      PORT MAP ( Input_bus_1          => s_logisimBus24(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(15  DOWNTO  8) );

   HEX2 : sevenseg_output
      PORT MAP ( Input_bus_1          => s_logisimBus25(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(23  DOWNTO  16) );

   HEX3 : sevenseg_output
      PORT MAP ( Input_bus_1          => s_logisimBus26(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(31  DOWNTO  24) );

END platformIndependent;
