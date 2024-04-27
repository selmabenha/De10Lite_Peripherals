--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : print_ADXL345_values                                         ==
--== Component : logisimTopLevelShell                                         ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF logisimTopLevelShell IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
      COMPONENT random_tb
         PORT ( Input_1      : IN  std_logic;
                Output_bus_1 : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_Input_1      : std_logic;
   SIGNAL s_Output_bus_1 : std_logic_vector( 7 DOWNTO 0 );

BEGIN

   --------------------------------------------------------------------------------
   -- All signal adaptations are performed here                                  --
   --------------------------------------------------------------------------------
   Output_bus_1_0 <= s_Output_bus_1(0);
   s_Input_1      <= Input_1_0;

   --------------------------------------------------------------------------------
   -- The toplevel component is connected here                                   --
   --------------------------------------------------------------------------------
   CIRCUIT_0 : random_tb
      PORT MAP ( Input_1      => s_Input_1,
                 Output_bus_1 => s_Output_bus_1 );
END platformIndependent;
