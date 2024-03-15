--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : directions_and_angles                                        ==
--== Component : angle_checker                                                ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF angle_checker IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT in_range
         PORT ( Higher_bound      : IN  std_logic_vector( 15 DOWNTO 0 );
                Lower_bound       : IN  std_logic_vector( 15 DOWNTO 0 );
                Number_to_check   : IN  std_logic_vector( 15 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                within_range      : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus1 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus2 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus4 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus5 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus7 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus8 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet3 : std_logic;
   SIGNAL s_logisimNet6 : std_logic;
   SIGNAL s_logisimNet9 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus0(15 DOWNTO 0) <= NUMBER_TO_CHECK;
   s_logisimBus1(15 DOWNTO 0) <= SLB;
   s_logisimBus2(15 DOWNTO 0) <= SHB;
   s_logisimBus4(15 DOWNTO 0) <= MLB;
   s_logisimBus5(15 DOWNTO 0) <= MHB;
   s_logisimBus7(15 DOWNTO 0) <= LLB;
   s_logisimBus8(15 DOWNTO 0) <= LHB;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   L <= s_logisimNet9;
   M <= s_logisimNet6;
   S <= s_logisimNet3;

   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   SMALL_ANGLE : in_range
      PORT MAP ( Higher_bound      => s_logisimBus2(15 DOWNTO 0),
                 Lower_bound       => s_logisimBus1(15 DOWNTO 0),
                 Number_to_check   => s_logisimBus0(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 within_range      => s_logisimNet3 );

   MEDIUM_ANGLE : in_range
      PORT MAP ( Higher_bound      => s_logisimBus5(15 DOWNTO 0),
                 Lower_bound       => s_logisimBus4(15 DOWNTO 0),
                 Number_to_check   => s_logisimBus0(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 within_range      => s_logisimNet6 );

   LARGE_ANGLE : in_range
      PORT MAP ( Higher_bound      => s_logisimBus8(15 DOWNTO 0),
                 Lower_bound       => s_logisimBus7(15 DOWNTO 0),
                 Number_to_check   => s_logisimBus0(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 within_range      => s_logisimNet9 );

END platformIndependent;
