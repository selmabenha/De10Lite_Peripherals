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

      COMPONENT OR_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
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

      COMPONENT hex_to_decimal_16_bits
         PORT ( val      : IN  std_logic_vector( 15 DOWNTO 0 );
                hundreds : OUT std_logic_vector( 3 DOWNTO 0 );
                ones     : OUT std_logic_vector( 3 DOWNTO 0 );
                tens     : OUT std_logic_vector( 3 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus10 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet7  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet0 <= stop;
   s_logisimNet3 <= timer_clock;
   s_logisimNet5 <= enable;
   s_logisimNet6 <= reset;
   s_logisimNet7 <= game_reset;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   hundreds <= s_logisimBus8(3 DOWNTO 0);
   ones     <= s_logisimBus10(3 DOWNTO 0);
   tens     <= s_logisimBus9(3 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimNet11  <=  '1';


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet7,
                 input2 => s_logisimNet6,
                 result => s_logisimNet1 );

   MEMORY_2 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => '0',
                 d      => '0',
                 preset => s_logisimNet5,
                 q      => s_logisimNet2,
                 qBar   => OPEN,
                 reset  => s_logisimNet0,
                 tick   => '0' );

   MEMORY_3 : LogisimCounter
      GENERIC MAP ( invertClock => 0,
                    maxVal      => X"FFFF",
                    mode        => 0,
                    width       => 16 )
      PORT MAP ( clear      => s_logisimNet1,
                 clock      => logisimClockTree4(4),
                 compareOut => OPEN,
                 countValue => s_logisimBus4(15 DOWNTO 0),
                 enable     => s_logisimNet2,
                 load       => '0',
                 loadData   => X"0000",
                 tick       => logisimClockTree4(2),
                 upNotDown  => s_logisimNet11 );

   hex_to_dec_timer : hex_to_decimal_16_bits
      PORT MAP ( hundreds => s_logisimBus8(3 DOWNTO 0),
                 ones     => s_logisimBus10(3 DOWNTO 0),
                 tens     => s_logisimBus9(3 DOWNTO 0),
                 val      => s_logisimBus4(15 DOWNTO 0) );


END platformIndependent;
