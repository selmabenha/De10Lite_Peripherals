--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero_BACKUP                                           ==
--== Component : pseudo_random                                                ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF pseudo_random IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT OR_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT Comparator
         GENERIC ( nrOfBits       : INTEGER;
                   twosComplement : INTEGER );
         PORT ( dataA         : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                dataB         : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                aEqualsB      : OUT std_logic;
                aGreaterThanB : OUT std_logic;
                aLessThanB    : OUT std_logic );
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

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus11 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus2  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus7  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus0(7 DOWNTO 0) <= min_value;
   s_logisimBus7(7 DOWNTO 0) <= max_value;
   s_logisimNet3             <= rand_clock;
   s_logisimNet4             <= reset;
   s_logisimNet9             <= enable;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   random_val <= s_logisimBus11(7 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimNet5  <=  '1';


   -- Constant
    s_logisimNet6  <=  '1';


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet10,
                 input2 => s_logisimNet8,
                 result => s_logisimNet1 );

   ARITH_2 : Comparator
      GENERIC MAP ( nrOfBits       => 8,
                    twosComplement => 0 )
      PORT MAP ( aEqualsB      => OPEN,
                 aGreaterThanB => s_logisimNet10,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus2(7 DOWNTO 0),
                 dataB         => s_logisimBus7(7 DOWNTO 0) );

   ARITH_3 : Comparator
      GENERIC MAP ( nrOfBits       => 8,
                    twosComplement => 0 )
      PORT MAP ( aEqualsB      => OPEN,
                 aGreaterThanB => OPEN,
                 aLessThanB    => s_logisimNet8,
                 dataA         => s_logisimBus2(7 DOWNTO 0),
                 dataB         => s_logisimBus0(7 DOWNTO 0) );

   MEMORY_4 : LogisimCounter
      GENERIC MAP ( invertClock => 0,
                    maxVal      => X"FF",
                    mode        => 0,
                    width       => 8 )
      PORT MAP ( clear      => '0',
                 clock      => logisimClockTree0(4),
                 compareOut => OPEN,
                 countValue => s_logisimBus2(7 DOWNTO 0),
                 enable     => s_logisimNet6,
                 load       => s_logisimNet1,
                 loadData   => s_logisimBus0(7 DOWNTO 0),
                 tick       => logisimClockTree0(2),
                 upNotDown  => s_logisimNet5 );

   MEMORY_5 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 8 )
      PORT MAP ( clock       => logisimClockTree0(4),
                 clockEnable => s_logisimNet9,
                 d           => s_logisimBus2(7 DOWNTO 0),
                 q           => s_logisimBus11(7 DOWNTO 0),
                 reset       => s_logisimNet4,
                 tick        => logisimClockTree0(2) );


END platformIndependent;
