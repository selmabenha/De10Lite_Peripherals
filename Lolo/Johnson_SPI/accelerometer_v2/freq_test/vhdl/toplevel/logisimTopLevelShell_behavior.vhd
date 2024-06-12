--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2                                             ==
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

      COMPONENT freq_test
         PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                led               : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_fpgaTick          : std_logic;
   SIGNAL s_led               : std_logic;
   SIGNAL s_logisimClockTree0 : std_logic_vector( 4 DOWNTO 0 );

BEGIN

   --------------------------------------------------------------------------------
   -- All signal adaptations are performed here                                  --
   --------------------------------------------------------------------------------
   led_0 <= s_led;

   --------------------------------------------------------------------------------
   -- The clock tree components are defined here                                 --
   --------------------------------------------------------------------------------
   BASE_0 : logisimTickGenerator
      GENERIC MAP ( nrOfBits    => 24,
                    reloadValue => 10000000 )
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
   CIRCUIT_0 : freq_test
      PORT MAP ( led               => s_led,
                 logisimClockTree0 => s_logisimClockTree0 );
END platformIndependent;
