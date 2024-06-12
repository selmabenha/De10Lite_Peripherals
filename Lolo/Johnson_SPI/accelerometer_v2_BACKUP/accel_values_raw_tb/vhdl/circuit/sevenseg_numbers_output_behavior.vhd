--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2_BACKUP                                      ==
--== Component : sevenseg_numbers_output                                      ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF sevenseg_numbers_output IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT sevenseg_numbers_logic
         PORT ( accel             : IN  std_logic_vector( 3 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                sevensegment      : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus8 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus9 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet0 : std_logic;
   SIGNAL s_logisimNet1 : std_logic;
   SIGNAL s_logisimNet2 : std_logic;
   SIGNAL s_logisimNet3 : std_logic;
   SIGNAL s_logisimNet4 : std_logic;
   SIGNAL s_logisimNet5 : std_logic;
   SIGNAL s_logisimNet6 : std_logic;
   SIGNAL s_logisimNet7 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus8(3 DOWNTO 0) <= input_bus;
   s_logisimNet6             <= decimal;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- 7-Segment Display: L_7_Segment_Display_1
   logisimOutputBubbles(0) <= s_logisimBus9(0);
   logisimOutputBubbles(1) <= s_logisimBus9(1);
   logisimOutputBubbles(2) <= s_logisimBus9(2);
   logisimOutputBubbles(3) <= s_logisimBus9(3);
   logisimOutputBubbles(4) <= s_logisimBus9(4);
   logisimOutputBubbles(5) <= s_logisimBus9(5);
   logisimOutputBubbles(6) <= s_logisimBus9(6);
   logisimOutputBubbles(7) <= s_logisimNet6;

   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   sevenseg_numbers_logic_1 : sevenseg_numbers_logic
      PORT MAP ( accel             => s_logisimBus8(3 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 sevensegment      => s_logisimBus9(7 DOWNTO 0) );

END platformIndependent;
