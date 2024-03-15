--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_ADXL345                                        ==
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
   SIGNAL s_logisimBus3 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus4 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus6 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus7 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus8 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus9 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet1 : std_logic;
   SIGNAL s_logisimNet2 : std_logic;
   SIGNAL s_logisimNet5 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus0(15 DOWNTO 0) <= NUMBER_TO_CHECK;
   s_logisimBus3(15 DOWNTO 0) <= SLB;
   s_logisimBus4(15 DOWNTO 0) <= SHB;
   s_logisimBus6(15 DOWNTO 0) <= MLB;
   s_logisimBus7(15 DOWNTO 0) <= MHB;
   s_logisimBus8(15 DOWNTO 0) <= LLB;
   s_logisimBus9(15 DOWNTO 0) <= LHB;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   L <= s_logisimNet5;
   M <= s_logisimNet2;
   S <= s_logisimNet1;

   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   LARGE_ANGLE : in_range
      PORT MAP ( Higher_bound      => s_logisimBus9(15 DOWNTO 0),
                 Lower_bound       => s_logisimBus8(15 DOWNTO 0),
                 Number_to_check   => s_logisimBus0(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 within_range      => s_logisimNet5 );

   SMALL_ANGLE : in_range
      PORT MAP ( Higher_bound      => s_logisimBus4(15 DOWNTO 0),
                 Lower_bound       => s_logisimBus3(15 DOWNTO 0),
                 Number_to_check   => s_logisimBus0(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 within_range      => s_logisimNet1 );

   MEDIUM_ANGLE : in_range
      PORT MAP ( Higher_bound      => s_logisimBus7(15 DOWNTO 0),
                 Lower_bound       => s_logisimBus6(15 DOWNTO 0),
                 Number_to_check   => s_logisimBus0(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 within_range      => s_logisimNet2 );

END platformIndependent;
