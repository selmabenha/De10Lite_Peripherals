--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : division                                                     ==
--== Component : divider_tb                                                   ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF divider_tb IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT hex_to_decimal
         PORT ( val          : IN  std_logic_vector( 7 DOWNTO 0 );
                final_answer : OUT std_logic_vector( 7 DOWNTO 0 );
                hundreds     : OUT std_logic_vector( 3 DOWNTO 0 );
                ones         : OUT std_logic_vector( 3 DOWNTO 0 );
                tens         : OUT std_logic_vector( 3 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT divider_v3
         PORT ( val          : IN  std_logic_vector( 15 DOWNTO 0 );
                final_answer : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT AND_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT sevenseg_output
         PORT ( decimal              : IN  std_logic;
                input_bus            : IN  std_logic_vector( 3 DOWNTO 0 );
                logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus1 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus3 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus4 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus5 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimNet2 : std_logic;
   SIGNAL s_logisimNet6 : std_logic;
   SIGNAL s_logisimNet7 : std_logic;
   SIGNAL s_logisimNet8 : std_logic;
   SIGNAL s_logisimNet9 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet6 <= Input_1;
   s_logisimNet7 <= Input_2;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   Output_1 <= s_logisimNet8;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus3(15 DOWNTO 0)  <=  X"0200";


   -- Constant
    s_logisimNet9  <=  '1';


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   hex_to_decimal_1 : hex_to_decimal
      PORT MAP ( final_answer => OPEN,
                 hundreds     => s_logisimBus5(3 DOWNTO 0),
                 ones         => s_logisimBus1(3 DOWNTO 0),
                 tens         => s_logisimBus0(3 DOWNTO 0),
                 val          => s_logisimBus4(7 DOWNTO 0) );

   divider_v3_1 : divider_v3
      PORT MAP ( final_answer => s_logisimBus4(7 DOWNTO 0),
                 val          => s_logisimBus3(15 DOWNTO 0) );

   GATES_3 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet6,
                 input2 => s_logisimNet7,
                 result => s_logisimNet8 );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   sevenseg_output_1 : sevenseg_output
      PORT MAP ( decimal              => s_logisimNet9,
                 input_bus            => s_logisimBus5(3 DOWNTO 0),
                 logisimOutputBubbles => logisimOutputBubbles(7  DOWNTO  0) );

   sevenseg_output_2 : sevenseg_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus0(3 DOWNTO 0),
                 logisimOutputBubbles => logisimOutputBubbles(15  DOWNTO  8) );

   sevenseg_output_3 : sevenseg_output
      PORT MAP ( decimal              => s_logisimNet2,
                 input_bus            => s_logisimBus1(3 DOWNTO 0),
                 logisimOutputBubbles => logisimOutputBubbles(23  DOWNTO  16) );

END platformIndependent;
