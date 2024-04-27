--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2                                             ==
--== Component : signed_div                                                   ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF signed_div IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT divide_two_num
         PORT ( val                       : IN  std_logic_vector( 15 DOWNTO 0 );
                val2                      : IN  std_logic_vector( 15 DOWNTO 0 );
                final_answer              : OUT std_logic_vector( 7 DOWNTO 0 );
                final_answer_sixteen_bits : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT Multiplexer_bus_2
         GENERIC ( nrOfBits : INTEGER );
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_1 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                sel     : IN  std_logic;
                muxOut  : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT absolute_val_and_sign
         PORT ( unfiltered : IN  std_logic_vector( 15 DOWNTO 0 );
                negative   : OUT std_logic;
                value      : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT twos_complement
         PORT ( negative_number : IN  std_logic_vector( 15 DOWNTO 0 );
                absolute_val    : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus1 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus3 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus4 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus5 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus6 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet2 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus6(15 DOWNTO 0) <= unfiltered;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   result <= s_logisimBus4(15 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus5(15 DOWNTO 0)  <=  X"6400";


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   divide_two_num_1 : divide_two_num
      PORT MAP ( final_answer              => OPEN,
                 final_answer_sixteen_bits => s_logisimBus0(15 DOWNTO 0),
                 val                       => s_logisimBus3(15 DOWNTO 0),
                 val2                      => s_logisimBus5(15 DOWNTO 0) );

   PLEXERS_2 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus0(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus1(15 DOWNTO 0),
                 muxOut  => s_logisimBus4(15 DOWNTO 0),
                 sel     => s_logisimNet2 );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   absolute_val_and_sign_1 : absolute_val_and_sign
      PORT MAP ( negative   => s_logisimNet2,
                 unfiltered => s_logisimBus6(15 DOWNTO 0),
                 value      => s_logisimBus3(15 DOWNTO 0) );

   twos_complement_1 : twos_complement
      PORT MAP ( absolute_val    => s_logisimBus1(15 DOWNTO 0),
                 negative_number => s_logisimBus0(15 DOWNTO 0) );

END platformIndependent;
