--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero_final                                            ==
--== Component : counter_fsm                                                  ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF counter_fsm IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT AND_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT OR_GATE_3_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
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

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus10 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus11 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus12 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus2  : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet14 : std_logic;
   SIGNAL s_logisimNet15 : std_logic;
   SIGNAL s_logisimNet16 : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet0 <= state_1;
   s_logisimNet1 <= state_3;
   s_logisimNet8 <= state_2;
   s_logisimNet9 <= reset;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   state_output <= s_logisimBus2(1 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus10(1 DOWNTO 0)  <=  "00";


   -- Constant
    s_logisimBus11(1 DOWNTO 0)  <=  "01";


   -- Constant
    s_logisimBus12(1 DOWNTO 0)  <=  "10";


   -- Constant
    s_logisimNet15  <=  '1';


   -- Constant
    s_logisimNet16  <=  '1';


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet13,
                 input2 => s_logisimNet0,
                 result => s_logisimNet7 );

   GATES_2 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet8,
                 input2 => s_logisimNet5,
                 result => s_logisimNet14 );

   GATES_3 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimNet6,
                 result => s_logisimNet4 );

   GATES_4 : OR_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet7,
                 input2 => s_logisimNet14,
                 input3 => s_logisimNet4,
                 result => s_logisimNet3 );

   ARITH_5 : Comparator
      GENERIC MAP ( nrOfBits       => 2,
                    twosComplement => 0 )
      PORT MAP ( aEqualsB      => s_logisimNet13,
                 aGreaterThanB => OPEN,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus2(1 DOWNTO 0),
                 dataB         => s_logisimBus10(1 DOWNTO 0) );

   ARITH_6 : Comparator
      GENERIC MAP ( nrOfBits       => 2,
                    twosComplement => 0 )
      PORT MAP ( aEqualsB      => s_logisimNet5,
                 aGreaterThanB => OPEN,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus2(1 DOWNTO 0),
                 dataB         => s_logisimBus11(1 DOWNTO 0) );

   ARITH_7 : Comparator
      GENERIC MAP ( nrOfBits       => 2,
                    twosComplement => 0 )
      PORT MAP ( aEqualsB      => s_logisimNet6,
                 aGreaterThanB => OPEN,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus2(1 DOWNTO 0),
                 dataB         => s_logisimBus12(1 DOWNTO 0) );

   MEMORY_8 : LogisimCounter
      GENERIC MAP ( invertClock => 0,
                    maxVal      => "11",
                    mode        => 0,
                    width       => 2 )
      PORT MAP ( clear      => s_logisimNet9,
                 clock      => s_logisimNet3,
                 compareOut => OPEN,
                 countValue => s_logisimBus2(1 DOWNTO 0),
                 enable     => s_logisimNet16,
                 load       => '0',
                 loadData   => "00",
                 tick       => '1',
                 upNotDown  => s_logisimNet15 );


END platformIndependent;
