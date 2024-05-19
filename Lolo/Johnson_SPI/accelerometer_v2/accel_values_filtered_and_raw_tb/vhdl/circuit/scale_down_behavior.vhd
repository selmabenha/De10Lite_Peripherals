--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2                                             ==
--== Component : scale_down                                                   ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF scale_down IS 

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

      COMPONENT hex_to_decimal
         PORT ( val      : IN  std_logic_vector( 7 DOWNTO 0 );
                hundreds : OUT std_logic_vector( 3 DOWNTO 0 );
                ones     : OUT std_logic_vector( 3 DOWNTO 0 );
                tens     : OUT std_logic_vector( 3 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT divide_two_num
         PORT ( val                       : IN  std_logic_vector( 15 DOWNTO 0 );
                val2                      : IN  std_logic_vector( 15 DOWNTO 0 );
                final_answer              : OUT std_logic_vector( 7 DOWNTO 0 );
                final_answer_sixteen_bits : OUT std_logic_vector( 15 DOWNTO 0 ) );
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
   SIGNAL s_logisimBus3 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus5 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus6 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus7 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus8 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus9 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet4 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus0(15 DOWNTO 0) <= number_input;
   s_logisimBus8(15 DOWNTO 0) <= second_num;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   answer   <= s_logisimBus2(15 DOWNTO 0);
   hundreds <= s_logisimBus5(3 DOWNTO 0);
   negative <= s_logisimBus0(15);
   ones     <= s_logisimBus7(3 DOWNTO 0);
   tens     <= s_logisimBus6(3 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus0(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus1(15 DOWNTO 0),
                 muxOut  => s_logisimBus3(15 DOWNTO 0),
                 sel     => s_logisimBus0(15) );

   hex_to_decimal_1 : hex_to_decimal
      PORT MAP ( hundreds => s_logisimBus5(3 DOWNTO 0),
                 ones     => s_logisimBus7(3 DOWNTO 0),
                 tens     => s_logisimBus6(3 DOWNTO 0),
                 val      => s_logisimBus9(7 DOWNTO 0) );

   divide_two_num_1 : divide_two_num
      PORT MAP ( final_answer              => s_logisimBus9(7 DOWNTO 0),
                 final_answer_sixteen_bits => s_logisimBus2(15 DOWNTO 0),
                 val                       => s_logisimBus3(15 DOWNTO 0),
                 val2                      => s_logisimBus8(15 DOWNTO 0) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   twos_complement_1 : twos_complement
      PORT MAP ( absolute_val      => s_logisimBus1(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 negative_number   => s_logisimBus0(15 DOWNTO 0) );

END platformIndependent;
