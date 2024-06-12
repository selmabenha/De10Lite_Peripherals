--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero_BACKUP                                           ==
--== Component : letter_no_decimal                                            ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF letter_no_decimal IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT letters_logic
         PORT ( letter            : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree4 : IN  std_logic_vector( 4 DOWNTO 0 );
                letter_out        : OUT std_logic_vector( 6 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus3 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimNet2 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus3(4 DOWNTO 0) <= letter_num;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   no_dec_letter <= s_logisimBus0(7 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus0(7)  <=  '0';


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   letters_logic_1 : letters_logic
      PORT MAP ( letter            => s_logisimBus3(4 DOWNTO 0),
                 letter_out        => s_logisimBus0(6 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4 );

END platformIndependent;
