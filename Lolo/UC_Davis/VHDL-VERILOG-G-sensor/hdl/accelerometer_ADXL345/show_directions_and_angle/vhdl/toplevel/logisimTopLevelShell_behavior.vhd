--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_ADXL345                                        ==
--== Component : logisimTopLevelShell                                         ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF logisimTopLevelShell IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
      COMPONENT logisimTickGenerator
         GENERIC ( nrOfBits    : INTEGER;
                   reloadValue : INTEGER );
         PORT ( FPGAClock : IN  std_logic;
                FPGATick  : OUT std_logic );
      END COMPONENT;

      COMPONENT LogisimClockComponent
         GENERIC ( highTicks : INTEGER;
                   lowTicks  : INTEGER;
                   nrOfBits  : INTEGER;
                   phase     : INTEGER );
         PORT ( clockTick   : IN  std_logic;
                globalClock : IN  std_logic;
                clockBus    : OUT std_logic_vector( 4 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT show_directions_and_angle
         PORT ( accel_input          : IN  std_logic;
                enable_accel         : IN  std_logic;
                logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                miso                 : IN  std_logic;
                rst                  : IN  std_logic;
                cs                   : OUT std_logic;
                logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 );
                mosi                 : OUT std_logic;
                sclk                 : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_accel_input          : std_logic;
   SIGNAL s_cs                   : std_logic;
   SIGNAL s_enable_accel         : std_logic;
   SIGNAL s_fpgaTick             : std_logic;
   SIGNAL s_logisimClockTree0    : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimOutputBubbles : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_miso                 : std_logic;
   SIGNAL s_mosi                 : std_logic;
   SIGNAL s_rst                  : std_logic;
   SIGNAL s_sclk                 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All signal adaptations are performed here                                  --
   --------------------------------------------------------------------------------
   cs_0                                            <= s_cs;
   mosi_0                                          <= s_mosi;
   n_sevenseg_directions_output_1_HEX_DecimalPoint <=  NOT s_logisimOutputBubbles(7);
   n_sevenseg_directions_output_1_HEX_Segment_A    <=  NOT s_logisimOutputBubbles(0);
   n_sevenseg_directions_output_1_HEX_Segment_B    <=  NOT s_logisimOutputBubbles(1);
   n_sevenseg_directions_output_1_HEX_Segment_C    <=  NOT s_logisimOutputBubbles(2);
   n_sevenseg_directions_output_1_HEX_Segment_D    <=  NOT s_logisimOutputBubbles(3);
   n_sevenseg_directions_output_1_HEX_Segment_E    <=  NOT s_logisimOutputBubbles(4);
   n_sevenseg_directions_output_1_HEX_Segment_F    <=  NOT s_logisimOutputBubbles(5);
   n_sevenseg_directions_output_1_HEX_Segment_G    <=  NOT s_logisimOutputBubbles(6);
   s_accel_input                                   <= accel_input_0;
   s_enable_accel                                  <= enable_accel_0;
   s_miso                                          <= miso_0;
   s_rst                                           <= rst_0;
   sclk_0                                          <= s_sclk;

   --------------------------------------------------------------------------------
   -- The clock tree components are defined here                                 --
   --------------------------------------------------------------------------------
   BASE_0 : logisimTickGenerator
      GENERIC MAP ( nrOfBits    => 3,
                    reloadValue => 4 )
      PORT MAP ( FPGAClock => fpgaGlobalClock,
                 FPGATick  => s_fpgaTick );

   BASE_1 : LogisimClockComponent
      GENERIC MAP ( highTicks => 1,
                    lowTicks  => 1,
                    nrOfBits  => 1,
                    phase     => 1 )
      PORT MAP ( clockBus    => s_logisimClockTree0,
                 clockTick   => s_fpgaTick,
                 globalClock => fpgaGlobalClock );

   --------------------------------------------------------------------------------
   -- The toplevel component is connected here                                   --
   --------------------------------------------------------------------------------
   CIRCUIT_0 : show_directions_and_angle
      PORT MAP ( accel_input          => s_accel_input,
                 cs                   => s_cs,
                 enable_accel         => s_enable_accel,
                 logisimClockTree0    => s_logisimClockTree0,
                 logisimOutputBubbles => s_logisimOutputBubbles,
                 miso                 => s_miso,
                 mosi                 => s_mosi,
                 rst                  => s_rst,
                 sclk                 => s_sclk );
END platformIndependent;
