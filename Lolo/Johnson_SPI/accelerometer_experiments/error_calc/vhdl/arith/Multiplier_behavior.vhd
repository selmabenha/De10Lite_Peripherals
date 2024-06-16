--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_experiments                                    ==
--== Component : Multiplier                                                   ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF Multiplier IS 

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_extendedcarryIn : std_logic_vector( (calcBits - 1) DOWNTO 0 );
   SIGNAL s_multResult      : std_logic_vector( (calcBits - 1) DOWNTO 0 );
   SIGNAL s_newResult       : std_logic_vector( (calcBits - 1) DOWNTO 0 );

BEGIN

   s_multResult <= std_logic_vector(unsigned(inputA)*unsigned(inputB))
                       WHEN unsignedMultiplier= 1 ELSE
                    std_logic_vector(signed(inputA)*signed(inputB));
   s_extendedcarryIn(calcBits-1 DOWNTO nrOfBits) <= (OTHERS => '0') WHEN unsignedMultiplier = 1 ELSE (OTHERS => carryIn(nrOfBits-1));
   s_extendedcarryIn(nrOfBits-1 DOWNTO 0) <= carryIn;
   s_newResult  <= std_logic_vector(unsigned(s_multResult) + unsigned(s_extendedcarryIn))
                       WHEN unsignedMultiplier= 1 ELSE
                    std_logic_vector(signed(s_multResult) + signed(s_extendedcarryIn));
   multHigh     <= s_newResult(calcBits-1 DOWNTO nrOfBits);
   multLow      <= s_newResult(nrOfBits-1 DOWNTO 0);

END platformIndependent;
