--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : print_ADXL345_values                                         ==
--== Component : filtered_test                                                ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF filtered_test IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT lowpass_filter_de10
         PORT ( clock             : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                reset             : IN  std_logic;
                unfiltered        : IN  std_logic_vector( 15 DOWNTO 0 );
                filtered_val_1    : OUT std_logic_vector( 7 DOWNTO 0 );
                filtered_val_2    : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT sevenseg_accel_output
         PORT ( Input_bus_1          : IN  std_logic_vector( 3 DOWNTO 0 );
                decimal              : IN  std_logic;
                logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus12 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus13 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet7  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet11 <= logisimClockTree0(0);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet10 <= Input_1;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- DIP Switch: DipSwitch_1
   s_logisimBus12(0) <= logisimInputBubbles(0);
   s_logisimBus12(1) <= logisimInputBubbles(1);
   s_logisimBus12(2) <= logisimInputBubbles(2);
   s_logisimBus12(3) <= logisimInputBubbles(3);
   s_logisimBus12(4) <= logisimInputBubbles(4);
   s_logisimBus12(5) <= logisimInputBubbles(5);
   s_logisimBus12(6) <= logisimInputBubbles(6);
   s_logisimBus12(7) <= logisimInputBubbles(7);

   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   lowpass_filter_de10_1 : lowpass_filter_de10
      PORT MAP ( clock             => s_logisimNet11,
                 filtered_val_1    => s_logisimBus13(7 DOWNTO 0),
                 filtered_val_2    => OPEN,
                 logisimClockTree0 => logisimClockTree0,
                 reset             => s_logisimNet10,
                 unfiltered        => s_logisimBus12(15 DOWNTO 0) );

   sevenseg_accel_output_1 : sevenseg_accel_output
      PORT MAP ( Input_bus_1          => s_logisimBus13(3 DOWNTO 0),
                 decimal              => '0',
                 logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(7  DOWNTO  0) );

   sevenseg_accel_output_2 : sevenseg_accel_output
      PORT MAP ( Input_bus_1          => s_logisimBus13(7 DOWNTO 4),
                 decimal              => '0',
                 logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(15  DOWNTO  8) );

END platformIndependent;
