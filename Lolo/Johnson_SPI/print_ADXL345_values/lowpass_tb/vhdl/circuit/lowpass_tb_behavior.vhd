--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : print_ADXL345_values                                         ==
--== Component : lowpass_tb                                                   ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF lowpass_tb IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT lowpass
         PORT ( new_val               : IN  std_logic_vector( 7 DOWNTO 0 );
                val                   : IN  std_logic_vector( 7 DOWNTO 0 );
                final_answer_filtered : OUT std_logic_vector( 7 DOWNTO 0 ) );
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

      COMPONENT hex_to_decimal
         PORT ( val          : IN  std_logic_vector( 7 DOWNTO 0 );
                final_answer : OUT std_logic_vector( 7 DOWNTO 0 );
                hundreds     : OUT std_logic_vector( 3 DOWNTO 0 );
                ones         : OUT std_logic_vector( 3 DOWNTO 0 );
                tens         : OUT std_logic_vector( 3 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT sign_hex_out
         PORT ( logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                negative             : IN  std_logic;
                logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
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
   SIGNAL s_logisimBus0 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus1 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus2 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus4 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus5 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus6 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimNet3 : std_logic;
   SIGNAL s_logisimNet7 : std_logic;
   SIGNAL s_logisimNet8 : std_logic;
   SIGNAL s_logisimNet9 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet8 <= logisimClockTree0(0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimNet7  <=  '1';


   -- Constant
    s_logisimNet9  <=  '1';


   -- Constant
    s_logisimBus5(7 DOWNTO 0)  <=  X"64";


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   lowpass_1 : lowpass
      PORT MAP ( final_answer_filtered => s_logisimBus0(7 DOWNTO 0),
                 new_val               => s_logisimBus5(7 DOWNTO 0),
                 val                   => s_logisimBus2(7 DOWNTO 0) );

   MEMORY_2 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 8 )
      PORT MAP ( clock       => logisimClockTree0(4),
                 clockEnable => s_logisimNet7,
                 d           => s_logisimBus0(7 DOWNTO 0),
                 q           => s_logisimBus2(7 DOWNTO 0),
                 reset       => '0',
                 tick        => logisimClockTree0(2) );

   hex_to_decimal_1 : hex_to_decimal
      PORT MAP ( final_answer => OPEN,
                 hundreds     => s_logisimBus1(3 DOWNTO 0),
                 ones         => s_logisimBus6(3 DOWNTO 0),
                 tens         => s_logisimBus4(3 DOWNTO 0),
                 val          => s_logisimBus0(7 DOWNTO 0) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   HEX4 : sign_hex_out
      PORT MAP ( logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(7  DOWNTO  0),
                 negative             => s_logisimNet3 );

   HEX1 : sevenseg_accel_output
      PORT MAP ( Input_bus_1          => s_logisimBus6(3 DOWNTO 0),
                 decimal              => '0',
                 logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(15  DOWNTO  8) );

   HEX2 : sevenseg_accel_output
      PORT MAP ( Input_bus_1          => s_logisimBus4(3 DOWNTO 0),
                 decimal              => '0',
                 logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(23  DOWNTO  16) );

   HEX3 : sevenseg_accel_output
      PORT MAP ( Input_bus_1          => s_logisimBus1(3 DOWNTO 0),
                 decimal              => s_logisimNet9,
                 logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(31  DOWNTO  24) );

END platformIndependent;
