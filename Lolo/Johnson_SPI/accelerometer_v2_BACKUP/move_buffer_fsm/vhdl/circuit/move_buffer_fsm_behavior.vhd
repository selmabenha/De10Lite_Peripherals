--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2_BACKUP                                      ==
--== Component : move_buffer_fsm                                              ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF move_buffer_fsm IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT Multiplexer_bus_8
         GENERIC ( nrOfBits : INTEGER );
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_1 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_2 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_3 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_4 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_5 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_6 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_7 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                sel     : IN  std_logic_vector( 2 DOWNTO 0 );
                muxOut  : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
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
   SIGNAL s_logisimBus10 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus11 : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_logisimBus3  : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus6  : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus7  : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet5  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet1 <= logisimClockTree0(0);

   --------------------------------------------------------------------------------
   -- Here all wiring is defined                                                 --
   --------------------------------------------------------------------------------
   s_logisimBus11(0) <= s_logisimNet0;
   s_logisimBus11(1) <= s_logisimNet2;
   s_logisimNet0     <= s_logisimBus7(0);
   s_logisimNet2     <= s_logisimBus7(1);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus11(2) <= state;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   enable <= s_logisimNet0;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus3(1 DOWNTO 0)  <=  "01";


   -- Constant
    s_logisimBus8(1 DOWNTO 0)  <=  "00";


   -- Constant
    s_logisimBus9(1 DOWNTO 0)  <=  "10";


   -- Constant
    s_logisimBus10(1 DOWNTO 0)  <=  "10";


   -- Constant
    s_logisimBus4(1 DOWNTO 0)  <=  "00";


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Multiplexer_bus_8
      GENERIC MAP ( nrOfBits => 2 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus8(1 DOWNTO 0),
                 muxIn_1 => "00",
                 muxIn_2 => s_logisimBus4(1 DOWNTO 0),
                 muxIn_3 => "00",
                 muxIn_4 => s_logisimBus3(1 DOWNTO 0),
                 muxIn_5 => s_logisimBus9(1 DOWNTO 0),
                 muxIn_6 => s_logisimBus10(1 DOWNTO 0),
                 muxIn_7 => "00",
                 muxOut  => s_logisimBus6(1 DOWNTO 0),
                 sel     => s_logisimBus11(2 DOWNTO 0) );

   MEMORY_2 : REGISTER_FLIP_FLOP
      GENERIC MAP ( invertClock => 0,
                    nrOfBits    => 2 )
      PORT MAP ( clock       => logisimClockTree0(4),
                 clockEnable => '1',
                 d           => s_logisimBus6(1 DOWNTO 0),
                 q           => s_logisimBus7(1 DOWNTO 0),
                 reset       => '0',
                 tick        => logisimClockTree0(2) );


END platformIndependent;
