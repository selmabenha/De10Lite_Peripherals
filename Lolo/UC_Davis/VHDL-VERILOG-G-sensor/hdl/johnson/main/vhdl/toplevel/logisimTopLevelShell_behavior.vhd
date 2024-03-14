--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : johnson                                                      ==
--== Component : logisimTopLevelShell                                         ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF logisimTopLevelShell IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
      COMPONENT logisimTickGenerator
         GENERIC ( nrOfBits    : INTEGER;
                   reloadValue : INTEGER );
         PORT ( FPGAClock : IN  std_logic;
                FPGATick  : OUT std_logic );
      END COMPONENT;

      COMPONENT LogisimClockComponent
         GENERIC ( highTicks : INTEGER;
                   lowTicks  : INTEGER;
                   nrOfBits  : INTEGER;
                   phase     : INTEGER );
         PORT ( clockTick   : IN  std_logic;
                globalClock : IN  std_logic;
                clockBus    : OUT std_logic_vector( 4 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT main
         PORT ( int1              : IN  std_logic;
                intbypass         : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                miso              : IN  std_logic;
                rst               : IN  std_logic;
                Accelerometer     : OUT std_logic_vector( 47 DOWNTO 0 );
                cs                : OUT std_logic;
                mosi              : OUT std_logic;
                rst_led           : OUT std_logic;
                sclk              : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_Accelerometer     : std_logic_vector( 47 DOWNTO 0 );
   SIGNAL s_cs                : std_logic;
   SIGNAL s_fpgaTick          : std_logic;
   SIGNAL s_int1              : std_logic;
   SIGNAL s_intbypass         : std_logic;
   SIGNAL s_logisimClockTree0 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_miso              : std_logic;
   SIGNAL s_mosi              : std_logic;
   SIGNAL s_rst               : std_logic;
   SIGNAL s_rst_led           : std_logic;
   SIGNAL s_sclk              : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All signal adaptations are performed here                                  --
   --------------------------------------------------------------------------------
   cs_0        <= s_cs;
   mosi_0      <= s_mosi;
   s_int1      <= int1_0;
   s_intbypass <= intbypass_0;
   s_miso      <= miso_0;
   s_rst       <= rst_0;
   sclk_0      <= s_sclk;

   --------------------------------------------------------------------------------
   -- The clock tree components are defined here                                 --
   --------------------------------------------------------------------------------
   BASE_0 : logisimTickGenerator
      GENERIC MAP ( nrOfBits    => 3,
                    reloadValue => 4 )
      PORT MAP ( FPGAClock => fpgaGlobalClock,
                 FPGATick  => s_fpgaTick );

   BASE_1 : LogisimClockComponent
      GENERIC MAP ( highTicks => 1,
                    lowTicks  => 1,
                    nrOfBits  => 1,
                    phase     => 1 )
      PORT MAP ( clockBus    => s_logisimClockTree0,
                 clockTick   => s_fpgaTick,
                 globalClock => fpgaGlobalClock );

   --------------------------------------------------------------------------------
   -- The toplevel component is connected here                                   --
   --------------------------------------------------------------------------------
   CIRCUIT_0 : main
      PORT MAP ( Accelerometer     => s_Accelerometer,
                 cs                => s_cs,
                 int1              => s_int1,
                 intbypass         => s_intbypass,
                 logisimClockTree0 => s_logisimClockTree0,
                 miso              => s_miso,
                 mosi              => s_mosi,
                 rst               => s_rst,
                 rst_led           => s_rst_led,
                 sclk              => s_sclk );
END platformIndependent;
