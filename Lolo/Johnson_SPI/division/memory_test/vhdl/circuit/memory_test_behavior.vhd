--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : division                                                     ==
--== Component : memory_test                                                  ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF memory_test IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT AND_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT low_pass
         PORT ( new_val               : IN  std_logic_vector( 7 DOWNTO 0 );
                val                   : IN  std_logic_vector( 7 DOWNTO 0 );
                final_answer_filtered : OUT std_logic_vector( 7 DOWNTO 0 );
                hundreds_filtered     : OUT std_logic_vector( 3 DOWNTO 0 );
                ones_filtered         : OUT std_logic_vector( 3 DOWNTO 0 );
                tens_filtered         : OUT std_logic_vector( 3 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimNet0 : std_logic;
   SIGNAL s_logisimNet1 : std_logic;
   SIGNAL s_logisimNet2 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet0 <= Input_1;
   s_logisimNet1 <= Input_2;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   Output_1 <= s_logisimNet2;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet0,
                 input2 => s_logisimNet1,
                 result => s_logisimNet2 );

   low_pass_1 : low_pass
      PORT MAP ( final_answer_filtered => OPEN,
                 hundreds_filtered     => OPEN,
                 new_val               => X"00",
                 ones_filtered         => OPEN,
                 tens_filtered         => OPEN,
                 val                   => X"00" );


END platformIndependent;
