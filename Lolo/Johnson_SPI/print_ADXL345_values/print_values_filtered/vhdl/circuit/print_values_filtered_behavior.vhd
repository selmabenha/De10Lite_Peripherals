--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : print_ADXL345_values                                         ==
--== Component : print_values_filtered                                        ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF print_values_filtered IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT hex_to_decimal
         PORT ( val      : IN  std_logic_vector( 7 DOWNTO 0 );
                hundreds : OUT std_logic_vector( 3 DOWNTO 0 );
                ones     : OUT std_logic_vector( 3 DOWNTO 0 );
                tens     : OUT std_logic_vector( 3 DOWNTO 0 ) );
      END COMPONENT;

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

      COMPONENT Subtractor
         GENERIC ( extendedBits : INTEGER;
                   nrOfBits     : INTEGER );
         PORT ( borrowIn  : IN  std_logic;
                dataA     : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                dataB     : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                borrowOut : OUT std_logic;
                result    : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
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

      COMPONENT accel_main_driver
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

      COMPONENT sevenseg_accel_output
         PORT ( Input_bus_1          : IN  std_logic_vector( 3 DOWNTO 0 );
                decimal              : IN  std_logic;
                logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT lowpass_filter_de10
         PORT ( clock             : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                negative          : IN  std_logic;
                reset             : IN  std_logic;
                unfiltered        : IN  std_logic_vector( 15 DOWNTO 0 );
                filtered          : OUT std_logic_vector( 7 DOWNTO 0 );
                negative_val      : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus1  : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus11 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus13 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus14 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus15 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus16 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus17 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus18 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus19 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus2  : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus20 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus24 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus28 : std_logic_vector( 47 DOWNTO 0 );
   SIGNAL s_logisimBus3  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus6  : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet25 : std_logic;
   SIGNAL s_logisimNet26 : std_logic;
   SIGNAL s_logisimNet27 : std_logic;
   SIGNAL s_logisimNet29 : std_logic;
   SIGNAL s_logisimNet30 : std_logic;
   SIGNAL s_logisimNet31 : std_logic;
   SIGNAL s_logisimNet32 : std_logic;
   SIGNAL s_logisimNet33 : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet33 <= logisimClockTree1(0);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet10 <= rst;
   s_logisimNet7  <= miso;
   s_logisimNet8  <= accel_input;
   s_logisimNet9  <= enable_accel;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   cs   <= s_logisimNet27;
   mosi <= s_logisimNet25;
   sclk <= s_logisimNet26;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimNet31  <=  '1';


   -- Constant
    s_logisimNet32  <=  '1';


   -- Constant
    s_logisimBus20(15 DOWNTO 0)  <=  X"003B";


   -- Constant
    s_logisimBus15(15 DOWNTO 0)  <=  X"003B";


   -- Constant
    s_logisimBus16(15 DOWNTO 0)  <=  X"003B";


   -- Constant
    s_logisimBus24(15 DOWNTO 0)  <=  X"6400";


   -- DIP Switch: AXIS_SELECTOR
   s_logisimBus19(0) <= logisimInputBubbles(0);
   s_logisimBus19(1) <= logisimInputBubbles(1);

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   hex_to_decimal_1 : hex_to_decimal
      PORT MAP ( hundreds => s_logisimBus4(3 DOWNTO 0),
                 ones     => s_logisimBus2(3 DOWNTO 0),
                 tens     => s_logisimBus1(3 DOWNTO 0),
                 val      => s_logisimBus14(7 DOWNTO 0) );

   PLEXERS_2 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus17(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus11(15 DOWNTO 0),
                 muxIn_2 => s_logisimBus3(15 DOWNTO 0),
                 muxIn_3 => X"0000",
                 muxOut  => s_logisimBus5(15 DOWNTO 0),
                 sel     => s_logisimBus19(1 DOWNTO 0) );

   ARITH_3 : Subtractor
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( borrowIn  => '0',
                 borrowOut => OPEN,
                 dataA     => s_logisimBus28(15 DOWNTO 0),
                 dataB     => s_logisimBus20(15 DOWNTO 0),
                 result    => s_logisimBus17(15 DOWNTO 0) );

   ARITH_4 : Subtractor
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( borrowIn  => '0',
                 borrowOut => OPEN,
                 dataA     => s_logisimBus28(31 DOWNTO 16),
                 dataB     => s_logisimBus15(15 DOWNTO 0),
                 result    => s_logisimBus11(15 DOWNTO 0) );

   ARITH_5 : Subtractor
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( borrowIn  => '0',
                 borrowOut => OPEN,
                 dataA     => s_logisimBus28(47 DOWNTO 32),
                 dataB     => s_logisimBus16(15 DOWNTO 0),
                 result    => s_logisimBus3(15 DOWNTO 0) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   scale_down_1 : scale_down
      PORT MAP ( answer            => s_logisimBus0(15 DOWNTO 0),
                 hundreds          => s_logisimBus13(3 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 negative          => s_logisimNet12,
                 number_input      => s_logisimBus5(15 DOWNTO 0),
                 ones              => s_logisimBus6(3 DOWNTO 0),
                 second_num        => s_logisimBus24(15 DOWNTO 0),
                 tens              => s_logisimBus18(3 DOWNTO 0) );

   accel_main_driver_1 : accel_main_driver
      PORT MAP ( Accelerometer     => s_logisimBus28(47 DOWNTO 0),
                 accel_input       => s_logisimNet8,
                 cs                => s_logisimNet27,
                 enable_accel      => s_logisimNet9,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 miso              => s_logisimNet7,
                 mosi              => s_logisimNet25,
                 rst               => s_logisimNet10,
                 sclk              => s_logisimNet26 );

   HEX1 : sevenseg_accel_output
      PORT MAP ( Input_bus_1          => s_logisimBus13(3 DOWNTO 0),
                 decimal              => s_logisimNet31,
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(7  DOWNTO  0) );

   HEX2 : sevenseg_accel_output
      PORT MAP ( Input_bus_1          => s_logisimBus18(3 DOWNTO 0),
                 decimal              => '0',
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(15  DOWNTO  8) );

   HEX3 : sevenseg_accel_output
      PORT MAP ( Input_bus_1          => s_logisimBus6(3 DOWNTO 0),
                 decimal              => '0',
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(23  DOWNTO  16) );

   HEX4 : sevenseg_accel_output
      PORT MAP ( Input_bus_1          => s_logisimBus4(3 DOWNTO 0),
                 decimal              => s_logisimNet32,
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(31  DOWNTO  24) );

   HEX5 : sevenseg_accel_output
      PORT MAP ( Input_bus_1          => s_logisimBus1(3 DOWNTO 0),
                 decimal              => '0',
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(39  DOWNTO  32) );

   HEX6 : sevenseg_accel_output
      PORT MAP ( Input_bus_1          => s_logisimBus2(3 DOWNTO 0),
                 decimal              => '0',
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(47  DOWNTO  40) );

   lowpass_filter_de10_1 : lowpass_filter_de10
      PORT MAP ( clock             => s_logisimNet33,
                 filtered          => s_logisimBus14(7 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 negative          => s_logisimNet12,
                 negative_val      => OPEN,
                 reset             => s_logisimNet10,
                 unfiltered        => s_logisimBus0(15 DOWNTO 0) );

END platformIndependent;
