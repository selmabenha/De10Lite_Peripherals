--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : print_ADXL345_values                                         ==
--== Component : lowpass_filter_de10                                          ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF lowpass_filter_de10 IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT Adder
         GENERIC ( extendedBits : INTEGER;
                   nrOfBits     : INTEGER );
         PORT ( carryIn  : IN  std_logic;
                dataA    : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                dataB    : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                carryOut : OUT std_logic;
                result   : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
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
   SIGNAL s_logisimBus1  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus11 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus12 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus14 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus15 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus16 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus7  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet3  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus7(15 DOWNTO 0) <= unfiltered;
   s_logisimNet0              <= clock;
   s_logisimNet2              <= reset;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   filtered_val_1 <= s_logisimBus16(7 DOWNTO 0);
   filtered_val_2 <= s_logisimBus16(15 DOWNTO 8);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimNet3  <=  '1';


   -- Constant
    s_logisimBus5(15 DOWNTO 0)  <=  X"0005";


   -- NOT Gate
   s_logisimNet10 <=  NOT s_logisimNet0;

   -- NOT Gate
   s_logisimNet13 <=  NOT s_logisimNet0;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   ARITH_1 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus9(15 DOWNTO 0),
                 dataB    => s_logisimBus15(15 DOWNTO 0),
                 result   => s_logisimBus8(15 DOWNTO 0) );

   ARITH_2 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus8(15 DOWNTO 0),
                 dataB    => s_logisimBus14(15 DOWNTO 0),
                 result   => s_logisimBus4(15 DOWNTO 0) );

   ARITH_3 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus4(15 DOWNTO 0),
                 dataB    => s_logisimBus12(15 DOWNTO 0),
                 result   => s_logisimBus1(15 DOWNTO 0) );

   ARITH_4 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus1(15 DOWNTO 0),
                 dataB    => s_logisimBus11(15 DOWNTO 0),
                 result   => s_logisimBus16(15 DOWNTO 0) );

   MEMORY_5 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => s_logisimNet10,
                 clockEnable => s_logisimNet3,
                 d           => s_logisimBus14(15 DOWNTO 0),
                 q           => s_logisimBus12(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => '1' );

   MEMORY_6 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree0(4),
                 clockEnable => s_logisimNet3,
                 d           => s_logisimBus12(15 DOWNTO 0),
                 q           => s_logisimBus11(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => logisimClockTree0(2) );

   MEMORY_7 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree0(4),
                 clockEnable => s_logisimNet3,
                 d           => s_logisimBus7(15 DOWNTO 0),
                 q           => s_logisimBus9(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => logisimClockTree0(2) );

   MEMORY_8 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => s_logisimNet13,
                 clockEnable => s_logisimNet3,
                 d           => s_logisimBus9(15 DOWNTO 0),
                 q           => s_logisimBus15(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => '1' );

   MEMORY_9 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 16 )
      PORT MAP ( clock       => logisimClockTree0(4),
                 clockEnable => s_logisimNet3,
                 d           => s_logisimBus15(15 DOWNTO 0),
                 q           => s_logisimBus14(15 DOWNTO 0),
                 reset       => s_logisimNet2,
                 tick        => logisimClockTree0(2) );


END platformIndependent;
