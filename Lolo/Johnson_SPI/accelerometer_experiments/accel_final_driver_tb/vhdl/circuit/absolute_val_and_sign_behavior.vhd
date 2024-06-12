--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_experiments                                    ==
--== Component : absolute_val_and_sign                                        ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF absolute_val_and_sign IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT Multiplexer_bus_2
         GENERIC ( nrOfBits : INTEGER );
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_1 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                sel     : IN  std_logic;
                muxOut  : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT twos_complement
         PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                negative_number   : IN  std_logic_vector( 15 DOWNTO 0 );
                absolute_val      : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus1 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus2 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet3 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus1(15 DOWNTO 0) <= unfiltered;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   negative <= s_logisimBus1(15);
   value    <= s_logisimBus2(15 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus1(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus0(15 DOWNTO 0),
                 muxOut  => s_logisimBus2(15 DOWNTO 0),
                 sel     => s_logisimBus1(15) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   twos_complement_1 : twos_complement
      PORT MAP ( absolute_val      => s_logisimBus0(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 negative_number   => s_logisimBus1(15 DOWNTO 0) );

END platformIndependent;
