--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2_BACKUP3                                     ==
--== Component : sign_hex_logic                                               ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF sign_hex_logic IS 

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimNet0 : std_logic;
   SIGNAL s_logisimNet1 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet1 <= negative;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   a <= s_logisimNet0;
   b <= s_logisimNet0;
   c <= s_logisimNet0;
   d <= s_logisimNet0;
   e <= s_logisimNet0;
   f <= s_logisimNet0;
   g <= s_logisimNet1;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimNet0  <=  '0';


END platformIndependent;
