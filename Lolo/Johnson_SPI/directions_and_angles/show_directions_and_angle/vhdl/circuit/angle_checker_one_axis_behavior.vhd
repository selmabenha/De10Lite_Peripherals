--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : directions_and_angles                                        ==
--== Component : angle_checker_one_axis                                       ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF angle_checker_one_axis IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT OR_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT angle_checker
         PORT ( LHB               : IN  std_logic_vector( 15 DOWNTO 0 );
                LLB               : IN  std_logic_vector( 15 DOWNTO 0 );
                MHB               : IN  std_logic_vector( 15 DOWNTO 0 );
                MLB               : IN  std_logic_vector( 15 DOWNTO 0 );
                NUMBER_TO_CHECK   : IN  std_logic_vector( 15 DOWNTO 0 );
                SHB               : IN  std_logic_vector( 15 DOWNTO 0 );
                SLB               : IN  std_logic_vector( 15 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                L                 : OUT std_logic;
                M                 : OUT std_logic;
                S                 : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus10 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus11 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus12 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus13 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus14 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus15 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus16 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus17 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus18 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus19 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus20 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus21 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus10(15 DOWNTO 0) <= SLB1;
   s_logisimBus11(15 DOWNTO 0) <= SHB1;
   s_logisimBus12(15 DOWNTO 0) <= MLB1;
   s_logisimBus13(15 DOWNTO 0) <= MHB1;
   s_logisimBus14(15 DOWNTO 0) <= LLB1;
   s_logisimBus15(15 DOWNTO 0) <= LHB1;
   s_logisimBus16(15 DOWNTO 0) <= SLB2;
   s_logisimBus17(15 DOWNTO 0) <= SHB2;
   s_logisimBus18(15 DOWNTO 0) <= MLB2;
   s_logisimBus19(15 DOWNTO 0) <= MHB2;
   s_logisimBus20(15 DOWNTO 0) <= LLB2;
   s_logisimBus21(15 DOWNTO 0) <= LHB2;
   s_logisimBus5(15 DOWNTO 0)  <= AXIS;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   L <= s_logisimNet9;
   M <= s_logisimNet8;
   S <= s_logisimNet7;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet3,
                 input2 => s_logisimNet4,
                 result => s_logisimNet7 );

   GATES_2 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimNet2,
                 result => s_logisimNet8 );

   GATES_3 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet6,
                 input2 => s_logisimNet0,
                 result => s_logisimNet9 );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   angle_checker_1 : angle_checker
      PORT MAP ( L                 => s_logisimNet6,
                 LHB               => s_logisimBus15(15 DOWNTO 0),
                 LLB               => s_logisimBus14(15 DOWNTO 0),
                 M                 => s_logisimNet1,
                 MHB               => s_logisimBus13(15 DOWNTO 0),
                 MLB               => s_logisimBus12(15 DOWNTO 0),
                 NUMBER_TO_CHECK   => s_logisimBus5(15 DOWNTO 0),
                 S                 => s_logisimNet3,
                 SHB               => s_logisimBus11(15 DOWNTO 0),
                 SLB               => s_logisimBus10(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0 );

   angle_checker_2 : angle_checker
      PORT MAP ( L                 => s_logisimNet0,
                 LHB               => s_logisimBus21(15 DOWNTO 0),
                 LLB               => s_logisimBus20(15 DOWNTO 0),
                 M                 => s_logisimNet2,
                 MHB               => s_logisimBus19(15 DOWNTO 0),
                 MLB               => s_logisimBus18(15 DOWNTO 0),
                 NUMBER_TO_CHECK   => s_logisimBus5(15 DOWNTO 0),
                 S                 => s_logisimNet4,
                 SHB               => s_logisimBus17(15 DOWNTO 0),
                 SLB               => s_logisimBus16(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0 );

END platformIndependent;
