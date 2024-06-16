--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2_BACKUP3                                     ==
--== Component : diff_detector                                                ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF diff_detector IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT Comparator
         GENERIC ( nrOfBits       : INTEGER;
                   twosComplement : INTEGER );
         PORT ( dataA         : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                dataB         : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                aEqualsB      : OUT std_logic;
                aGreaterThanB : OUT std_logic;
                aLessThanB    : OUT std_logic );
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
   SIGNAL s_logisimBus0 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus1 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus5 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet2 : std_logic;
   SIGNAL s_logisimNet3 : std_logic;
   SIGNAL s_logisimNet4 : std_logic;
   SIGNAL s_logisimNet6 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet2 <= logisimClockTree0(0);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus5(15 DOWNTO 0) <= checker;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   different <= s_logisimNet6;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimNet3  <=  '1';


   -- NOT Gate
   s_logisimNet6 <=  NOT s_logisimNet4;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   ARITH_1 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 1 )
      PORT MAP ( aEqualsB      => s_logisimNet4,
                 aGreaterThanB => OPEN,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus1(15 DOWNTO 0),
                 dataB         => s_logisimBus0(15 DOWNTO 0) );

   MEMORY_2 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree0(4),
                 clockEnable => s_logisimNet3,
                 d           => s_logisimBus5(15 DOWNTO 0),
                 q           => s_logisimBus1(15 DOWNTO 0),
                 reset       => '0',
                 tick        => logisimClockTree0(2) );

   MEMORY_3 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree0(4),
                 clockEnable => s_logisimNet3,
                 d           => s_logisimBus1(15 DOWNTO 0),
                 q           => s_logisimBus0(15 DOWNTO 0),
                 reset       => '0',
                 tick        => logisimClockTree0(2) );


END platformIndependent;
