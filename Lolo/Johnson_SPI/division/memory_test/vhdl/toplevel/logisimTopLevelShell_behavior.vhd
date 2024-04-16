--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : division                                                     ==
--== Component : logisimTopLevelShell                                         ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF logisimTopLevelShell IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
      COMPONENT memory_test
         PORT ( Input_1  : IN  std_logic;
                Input_2  : IN  std_logic;
                Output_1 : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_Input_1  : std_logic;
   SIGNAL s_Input_2  : std_logic;
   SIGNAL s_Output_1 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All signal adaptations are performed here                                  --
   --------------------------------------------------------------------------------
   Output_1_0 <= s_Output_1;
   s_Input_1  <= Input_1_0;
   s_Input_2  <= Input_2_0;

   --------------------------------------------------------------------------------
   -- The toplevel component is connected here                                   --
   --------------------------------------------------------------------------------
   CIRCUIT_0 : memory_test
      PORT MAP ( Input_1  => s_Input_1,
                 Input_2  => s_Input_2,
                 Output_1 => s_Output_1 );
END platformIndependent;
