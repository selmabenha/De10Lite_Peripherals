--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero                                                  ==
--== Component : save_random_val                                              ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF save_random_val IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

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

      COMPONENT pseudo_random
         PORT ( enable            : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree4 : IN  std_logic_vector( 4 DOWNTO 0 );
                max_value         : IN  std_logic_vector( 7 DOWNTO 0 );
                min_value         : IN  std_logic_vector( 7 DOWNTO 0 );
                rand_clock        : IN  std_logic;
                reset             : IN  std_logic;
                random_val        : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus2 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus3 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus5 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus6 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet0 : std_logic;
   SIGNAL s_logisimNet1 : std_logic;
   SIGNAL s_logisimNet4 : std_logic;
   SIGNAL s_logisimNet7 : std_logic;
   SIGNAL s_logisimNet8 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet7 <= logisimClockTree0(0);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus5(7 DOWNTO 0) <= min_value;
   s_logisimBus6(7 DOWNTO 0) <= max_value;
   s_logisimNet0             <= button;
   s_logisimNet1             <= reset;
   s_logisimNet4             <= rand_clock;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   final_random_val <= s_logisimBus3(7 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- NOT Gate
   s_logisimNet8 <=  NOT s_logisimNet0;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   MEMORY_1 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 8 )
      PORT MAP ( clock       => logisimClockTree0(4),
                 clockEnable => s_logisimNet0,
                 d           => s_logisimBus2(7 DOWNTO 0),
                 q           => s_logisimBus3(7 DOWNTO 0),
                 reset       => s_logisimNet1,
                 tick        => logisimClockTree0(2) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   pseudo_random_1 : pseudo_random
      PORT MAP ( enable            => s_logisimNet8,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 max_value         => s_logisimBus6(7 DOWNTO 0),
                 min_value         => s_logisimBus5(7 DOWNTO 0),
                 rand_clock        => s_logisimNet4,
                 random_val        => s_logisimBus2(7 DOWNTO 0),
                 reset             => s_logisimNet1 );

END platformIndependent;
