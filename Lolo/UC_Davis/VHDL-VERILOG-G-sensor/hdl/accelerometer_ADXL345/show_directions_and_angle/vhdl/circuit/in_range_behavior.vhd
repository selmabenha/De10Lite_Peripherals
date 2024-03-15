--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_ADXL345                                        ==
--== Component : in_range                                                     ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF in_range IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT OR_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT AND_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT sixteen_bits_comparator
         PORT ( A                 : IN  std_logic_vector( 15 DOWNTO 0 );
                B                 : IN  std_logic_vector( 15 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                A_bigger_than_B   : OUT std_logic;
                A_equals_B        : OUT std_logic;
                A_less_than_B     : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus2 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus8 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus9 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet0 : std_logic;
   SIGNAL s_logisimNet1 : std_logic;
   SIGNAL s_logisimNet3 : std_logic;
   SIGNAL s_logisimNet4 : std_logic;
   SIGNAL s_logisimNet5 : std_logic;
   SIGNAL s_logisimNet6 : std_logic;
   SIGNAL s_logisimNet7 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus2(15 DOWNTO 0) <= Number_to_check;
   s_logisimBus8(15 DOWNTO 0) <= Lower_bound;
   s_logisimBus9(15 DOWNTO 0) <= Higher_bound;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   within_range <= s_logisimNet7;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet0,
                 input2 => s_logisimNet1,
                 result => s_logisimNet4 );

   GATES_2 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet6,
                 result => s_logisimNet3 );

   GATES_3 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet4,
                 input2 => s_logisimNet3,
                 result => s_logisimNet7 );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   sixteen_bits_comparator_1 : sixteen_bits_comparator
      PORT MAP ( A                 => s_logisimBus2(15 DOWNTO 0),
                 A_bigger_than_B   => s_logisimNet1,
                 A_equals_B        => s_logisimNet0,
                 A_less_than_B     => OPEN,
                 B                 => s_logisimBus8(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0 );

   sixteen_bits_comparator_2 : sixteen_bits_comparator
      PORT MAP ( A                 => s_logisimBus2(15 DOWNTO 0),
                 A_bigger_than_B   => OPEN,
                 A_equals_B        => s_logisimNet6,
                 A_less_than_B     => s_logisimNet5,
                 B                 => s_logisimBus9(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0 );

END platformIndependent;
