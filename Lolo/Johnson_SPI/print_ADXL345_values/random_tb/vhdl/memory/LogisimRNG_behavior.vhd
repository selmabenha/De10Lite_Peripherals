--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : print_ADXL345_values                                         ==
--== Component : LogisimRNG                                                   ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF LogisimRNG IS 

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_busyPipeNext  : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_busyPipeReg   : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_currentSeed   : std_logic_vector( 47 DOWNTO 0 );
   SIGNAL s_initSeed      : std_logic_vector( 47 DOWNTO 0 );
   SIGNAL s_macHigh1Next  : std_logic_vector( 23 DOWNTO 0 );
   SIGNAL s_macHighIn2    : std_logic_vector( 23 DOWNTO 0 );
   SIGNAL s_macHighReg    : std_logic_vector( 23 DOWNTO 0 );
   SIGNAL s_macHighReg1   : std_logic_vector( 23 DOWNTO 0 );
   SIGNAL s_macLowIn1     : std_logic_vector( 24 DOWNTO 0 );
   SIGNAL s_macLowIn2     : std_logic_vector( 24 DOWNTO 0 );
   SIGNAL s_macLowReg     : std_logic_vector( 24 DOWNTO 0 );
   SIGNAL s_multBusy      : std_logic;
   SIGNAL s_multShiftNext : std_logic_vector( 35 DOWNTO 0 );
   SIGNAL s_multShiftReg  : std_logic_vector( 35 DOWNTO 0 );
   SIGNAL s_outputReg     : std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
   SIGNAL s_reset         : std_logic;
   SIGNAL s_resetNext     : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_resetReg      : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_seedShiftNext : std_logic_vector( 47 DOWNTO 0 );
   SIGNAL s_seedShiftReg  : std_logic_vector( 47 DOWNTO 0 );
   SIGNAL s_start         : std_logic;
   SIGNAL s_startReg      : std_logic;

BEGIN
   --------------------------------------------------------------------------------
   -- This is a multicycle implementation of the Random Component                --
   --------------------------------------------------------------------------------


   q               <= s_outputReg;
   s_initSeed      <= x"0005DEECE66D" WHEN seed = x"00000000" ELSE
                      x"0000"&seed;
   s_reset         <= '1' WHEN s_resetReg /= "010" ELSE '0';
   s_resetNext     <= "010" WHEN (s_resetReg = "101" OR
                                  s_resetReg = "010") AND
                                  clear = '0' ELSE
                      "101" WHEN s_resetReg = "001" ELSE
                      "001";
   s_start         <= '1' WHEN (tick = '1' AND enable = '1') OR
                            (s_resetReg = "101" AND clear = '0') ELSE '0';
   s_multShiftNext <= (OTHERS => '0') WHEN s_reset = '1' ELSE
                      X"5DEECE66D" WHEN s_startReg = '1' ELSE
                      '0'&s_multShiftReg(35 DOWNTO 1);
   s_seedShiftNext <= (OTHERS => '0') WHEN s_reset = '1' ELSE
                      s_currentSeed WHEN s_startReg = '1' ELSE
                      s_seedShiftReg(46 DOWNTO 0)&'0';
   s_multBusy      <= '0' WHEN s_multShiftReg = X"000000000" ELSE '1';

   s_macLowIn1     <= (OTHERS => '0') WHEN s_startReg = '1' OR
                                             s_reset = '1' ELSE
                      '0'&s_macLowReg(23 DOWNTO 0);
   s_macLowIn2     <= '0'&X"00000B"
                           WHEN s_startReg = '1' ELSE
                      '0'&s_seedShiftReg(23 DOWNTO 0)
                           WHEN s_multShiftReg(0) = '1' ELSE
                      (OTHERS => '0');
   s_macHighIn2    <= (OTHERS => '0') WHEN s_startReg = '1' ELSE
                      s_macHighReg;
   s_macHigh1Next  <= s_seedShiftReg(47 DOWNTO 24)
                         WHEN s_multShiftReg(0) = '1' ELSE
                      (OTHERS => '0');
   s_busyPipeNext  <= "00" WHEN s_reset = '1' ELSE
                      s_busyPipeReg(0)&s_multBusy;

   makeCurrentSeed : PROCESS(clock, s_busyPipeReg, s_reset) IS
   BEGIN
      IF (rising_edge(clock)) THEN
         IF (s_reset = '1') THEN s_currentSeed <= s_initSeed;
         ELSIF (s_busyPipeReg = "10") THEN
            s_currentSeed <= s_macHighReg&s_macLowReg(23 DOWNTO 0);
         END IF;
      END IF;
   END PROCESS makeCurrentSeed;

   makeShiftRegs : PROCESS(clock, s_multShiftNext, s_seedShiftNext,
                           s_macLowIn1, s_macLowIn2) IS
   BEGIN
      IF (rising_edge(clock)) THEN
         s_multShiftReg <= s_multShiftNext;
         s_seedShiftReg <= s_seedShiftNext;
         s_macLowReg    <= std_logic_vector( unsigned(s_macLowIn1) + unsigned(s_macLowIn2) );
         s_macHighReg1  <= s_macHigh1Next;
         s_macHighReg   <= std_logic_vector( unsigned(s_macHighReg1) + unsigned(s_macHighIn2) +
                           unsigned(s_macLowReg(24 DOWNTO 24)) );
         s_busyPipeReg  <= s_busyPipeNext;
      END IF;
   END PROCESS makeShiftRegs;

   makeStartReg : PROCESS(clock, s_start) IS
   BEGIN
      IF (rising_edge(clock)) THEN
         s_startReg <= s_start;
      END IF;
   END PROCESS makeStartReg;

   makeResetReg : PROCESS(clock, s_resetNext) IS
   BEGIN
      IF (rising_edge(clock)) THEN
         s_resetReg <= s_resetNext;
      END IF;
   END PROCESS makeResetReg;

   makeOutput : PROCESS(clock, s_reset, s_initSeed) IS
   BEGIN
      IF (rising_edge(clock)) THEN
         IF (s_reset = '1') THEN s_outputReg <= s_initSeed( (nrOfBits-1) DOWNTO 0 );
         ELSIF (tick = '1' AND enable = '1') THEN
            s_outputReg <= s_currentSeed((nrOfBits+11) DOWNTO 12);
         END IF;
      END IF;
   END PROCESS makeOutput;

END platformIndependent;
