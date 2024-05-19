--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero                                                  ==
--== Component : timer                                                        ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF timer IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT hex_to_decimal_16_bits
         PORT ( val      : IN  std_logic_vector( 15 DOWNTO 0 );
                hundreds : OUT std_logic_vector( 3 DOWNTO 0 );
                ones     : OUT std_logic_vector( 3 DOWNTO 0 );
                tens     : OUT std_logic_vector( 3 DOWNTO 0 ) );
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

      COMPONENT sevenseg_numbers_output
         PORT ( decimal              : IN  std_logic;
                input_bus            : IN  std_logic_vector( 3 DOWNTO 0 );
                logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus2 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus5 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus7 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet1 : std_logic;
   SIGNAL s_logisimNet3 : std_logic;
   SIGNAL s_logisimNet4 : std_logic;
   SIGNAL s_logisimNet6 : std_logic;
   SIGNAL s_logisimNet8 : std_logic;
   SIGNAL s_logisimNet9 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet1 <= logisimClockTree0(0);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet3 <= stop;
   s_logisimNet6 <= reset;
   s_logisimNet8 <= enable;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimNet9  <=  '1';


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   hex_to_decimal_16_bits_1 : hex_to_decimal_16_bits
      PORT MAP ( hundreds => s_logisimBus2(3 DOWNTO 0),
                 ones     => s_logisimBus0(3 DOWNTO 0),
                 tens     => s_logisimBus5(3 DOWNTO 0),
                 val      => s_logisimBus7(15 DOWNTO 0) );

   MEMORY_2 : LogisimCounter
      GENERIC MAP ( invertClock => 0,
                    maxVal      => X"FFFF",
                    mode        => 0,
                    width       => 16 )
      PORT MAP ( clear      => s_logisimNet6,
                 clock      => logisimClockTree0(4),
                 compareOut => OPEN,
                 countValue => s_logisimBus7(15 DOWNTO 0),
                 enable     => s_logisimNet4,
                 load       => '0',
                 loadData   => X"0000",
                 tick       => logisimClockTree0(2),
                 upNotDown  => s_logisimNet9 );

   MEMORY_3 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => '0',
                 d      => '0',
                 preset => s_logisimNet8,
                 q      => s_logisimNet4,
                 qBar   => OPEN,
                 reset  => s_logisimNet3,
                 tick   => '0' );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   hex2 : sevenseg_numbers_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus2(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(7  DOWNTO  0) );

   hex0 : sevenseg_numbers_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus0(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(15  DOWNTO  8) );

   hex1 : sevenseg_numbers_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus5(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(23  DOWNTO  16) );

END platformIndependent;
