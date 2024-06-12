--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_final                                          ==
--== Component : sign_hex_output                                              ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF sign_hex_output IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT sign_hex_logic
         PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                negative          : IN  std_logic;
                a                 : OUT std_logic;
                b                 : OUT std_logic;
                c                 : OUT std_logic;
                d                 : OUT std_logic;
                e                 : OUT std_logic;
                f                 : OUT std_logic;
                g                 : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimNet0 : std_logic;
   SIGNAL s_logisimNet1 : std_logic;
   SIGNAL s_logisimNet2 : std_logic;
   SIGNAL s_logisimNet3 : std_logic;
   SIGNAL s_logisimNet4 : std_logic;
   SIGNAL s_logisimNet5 : std_logic;
   SIGNAL s_logisimNet6 : std_logic;
   SIGNAL s_logisimNet7 : std_logic;
   SIGNAL s_logisimNet8 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet8 <= negative;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimNet6  <=  '0';


   -- 7-Segment Display: L_7_Segment_Display_1
   logisimOutputBubbles(0) <= s_logisimNet5;
   logisimOutputBubbles(1) <= s_logisimNet7;
   logisimOutputBubbles(2) <= s_logisimNet3;
   logisimOutputBubbles(3) <= s_logisimNet2;
   logisimOutputBubbles(4) <= s_logisimNet4;
   logisimOutputBubbles(5) <= s_logisimNet1;
   logisimOutputBubbles(6) <= s_logisimNet0;
   logisimOutputBubbles(7) <= s_logisimNet6;

   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   sign_hex_logic_1 : sign_hex_logic
      PORT MAP ( a                 => s_logisimNet5,
                 b                 => s_logisimNet7,
                 c                 => s_logisimNet3,
                 d                 => s_logisimNet2,
                 e                 => s_logisimNet4,
                 f                 => s_logisimNet1,
                 g                 => s_logisimNet0,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 negative          => s_logisimNet8 );

END platformIndependent;
