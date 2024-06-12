--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero_final                                            ==
--== Component : side_to_side_anim                                            ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF side_to_side_anim IS 

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

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus1  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus10 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus11 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus2  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus3  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus6  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus7  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus1(7 DOWNTO 0) <= hex3_letter;
   s_logisimBus2(7 DOWNTO 0) <= hex5_letter;
   s_logisimBus3(7 DOWNTO 0) <= hex1_letter;
   s_logisimBus7(7 DOWNTO 0) <= hex2_letter;
   s_logisimBus9(7 DOWNTO 0) <= hex4_letter;
   s_logisimNet0             <= clock;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   hex0_out <= s_logisimBus8(7 DOWNTO 0);
   hex1_out <= s_logisimBus6(7 DOWNTO 0);
   hex2_out <= s_logisimBus5(7 DOWNTO 0);
   hex3_out <= s_logisimBus4(7 DOWNTO 0);
   hex4_out <= s_logisimBus11(7 DOWNTO 0);
   hex5_out <= s_logisimBus10(7 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus2(7 DOWNTO 0),
                 muxIn_1 => X"00",
                 muxOut  => s_logisimBus10(7 DOWNTO 0),
                 sel     => s_logisimNet0 );

   PLEXERS_2 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus9(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus2(7 DOWNTO 0),
                 muxOut  => s_logisimBus11(7 DOWNTO 0),
                 sel     => s_logisimNet0 );

   PLEXERS_3 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus1(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus9(7 DOWNTO 0),
                 muxOut  => s_logisimBus4(7 DOWNTO 0),
                 sel     => s_logisimNet0 );

   PLEXERS_4 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus7(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus1(7 DOWNTO 0),
                 muxOut  => s_logisimBus5(7 DOWNTO 0),
                 sel     => s_logisimNet0 );

   PLEXERS_5 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus3(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus7(7 DOWNTO 0),
                 muxOut  => s_logisimBus6(7 DOWNTO 0),
                 sel     => s_logisimNet0 );

   PLEXERS_6 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => X"00",
                 muxIn_1 => s_logisimBus3(7 DOWNTO 0),
                 muxOut  => s_logisimBus8(7 DOWNTO 0),
                 sel     => s_logisimNet0 );


END platformIndependent;
