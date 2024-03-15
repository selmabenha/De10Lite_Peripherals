--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_ADXL345                                        ==
--== Component : sevenseg_directions_output                                   ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF sevenseg_directions_output IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT sevenseg_directions_logic
         PORT ( D                 : IN  std_logic;
                L                 : IN  std_logic;
                M                 : IN  std_logic;
                R                 : IN  std_logic;
                S                 : IN  std_logic;
                U                 : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                letter_output     : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus14 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet10 <= U;
   s_logisimNet11 <= D;
   s_logisimNet12 <= S;
   s_logisimNet13 <= M;
   s_logisimNet8  <= L;
   s_logisimNet9  <= R;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- 7-Segment Display: HEX
   logisimOutputBubbles(0) <= s_logisimBus14(0);
   logisimOutputBubbles(1) <= s_logisimBus14(1);
   logisimOutputBubbles(2) <= s_logisimBus14(2);
   logisimOutputBubbles(3) <= s_logisimBus14(3);
   logisimOutputBubbles(4) <= s_logisimBus14(4);
   logisimOutputBubbles(5) <= s_logisimBus14(5);
   logisimOutputBubbles(6) <= s_logisimBus14(6);
   logisimOutputBubbles(7) <= s_logisimBus14(7);

   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   sevenseg_directions_output : sevenseg_directions_logic
      PORT MAP ( D                 => s_logisimNet11,
                 L                 => s_logisimNet8,
                 M                 => s_logisimNet13,
                 R                 => s_logisimNet9,
                 S                 => s_logisimNet12,
                 U                 => s_logisimNet10,
                 letter_output     => s_logisimBus14(7 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0 );

END platformIndependent;
