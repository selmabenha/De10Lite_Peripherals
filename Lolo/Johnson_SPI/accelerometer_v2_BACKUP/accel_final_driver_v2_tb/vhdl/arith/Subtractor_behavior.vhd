--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2_BACKUP                                      ==
--== Component : Subtractor                                                   ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF Subtractor IS 

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_carry         : std_logic;
   SIGNAL s_extendeddataA : std_logic_vector( (extendedBits - 1) DOWNTO 0 );
   SIGNAL s_extendeddataB : std_logic_vector( (extendedBits - 1) DOWNTO 0 );
   SIGNAL s_sumresult     : std_logic_vector( (extendedBits - 1) DOWNTO 0 );

BEGIN

   s_extendeddataA <= "0"&dataA;
   s_extendeddataB <= "0"&(NOT(dataB));
   s_carry         <= NOT(borrowIn);
   s_sumresult     <= std_logic_vector(unsigned(s_extendeddataA) +
                      unsigned(s_extendeddataB) +
                      (""&s_carry));
   result    <= s_sumresult( (nrOfBits-1) DOWNTO 0 );
   borrowOut <= NOT(s_sumresult(extendedBits-1));

END platformIndependent;
