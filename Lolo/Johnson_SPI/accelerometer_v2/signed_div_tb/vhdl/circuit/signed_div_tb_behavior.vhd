--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2                                             ==
--== Component : signed_div_tb                                                ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF signed_div_tb IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT hex_to_decimal_16_bits
         PORT ( val      : IN  std_logic_vector( 15 DOWNTO 0 );
                hundreds : OUT std_logic_vector( 3 DOWNTO 0 );
                ones     : OUT std_logic_vector( 3 DOWNTO 0 );
                tens     : OUT std_logic_vector( 3 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT sevenseg_numbers_output
         PORT ( decimal              : IN  std_logic;
                input_bus            : IN  std_logic_vector( 3 DOWNTO 0 );
                logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT signed_div
         PORT ( unfiltered : IN  std_logic_vector( 15 DOWNTO 0 );
                result     : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT absolute_val_and_sign
         PORT ( unfiltered : IN  std_logic_vector( 15 DOWNTO 0 );
                negative   : OUT std_logic;
                value      : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT sign_hex_output
         PORT ( negative             : IN  std_logic;
                logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus1 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus2 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus3 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus4 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus5 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus6 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet0 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus6(15 DOWNTO 0)  <=  X"FF35";


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   hex_to_decimal_16_bits_1 : hex_to_decimal_16_bits
      PORT MAP ( hundreds => s_logisimBus3(3 DOWNTO 0),
                 ones     => s_logisimBus4(3 DOWNTO 0),
                 tens     => s_logisimBus1(3 DOWNTO 0),
                 val      => s_logisimBus2(15 DOWNTO 0) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   hex2 : sevenseg_numbers_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus3(3 DOWNTO 0),
                 logisimOutputBubbles => logisimOutputBubbles(7  DOWNTO  0) );

   signed_div_1 : signed_div
      PORT MAP ( result     => s_logisimBus5(15 DOWNTO 0),
                 unfiltered => s_logisimBus6(15 DOWNTO 0) );

   absolute_val_and_sign_1 : absolute_val_and_sign
      PORT MAP ( negative   => s_logisimNet0,
                 unfiltered => s_logisimBus5(15 DOWNTO 0),
                 value      => s_logisimBus2(15 DOWNTO 0) );

   hex1 : sevenseg_numbers_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus1(3 DOWNTO 0),
                 logisimOutputBubbles => logisimOutputBubbles(15  DOWNTO  8) );

   hex0 : sevenseg_numbers_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus4(3 DOWNTO 0),
                 logisimOutputBubbles => logisimOutputBubbles(23  DOWNTO  16) );

   hex3 : sign_hex_output
      PORT MAP ( logisimOutputBubbles => logisimOutputBubbles(31  DOWNTO  24),
                 negative             => s_logisimNet0 );

END platformIndependent;
