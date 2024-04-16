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
      COMPONENT twos_complement
         PORT ( Input_1      : IN  std_logic;
                Input_2      : IN  std_logic;
                Input_bus_1  : IN  std_logic_vector( 15 DOWNTO 0 );
                Output_1     : OUT std_logic;
                Output_bus_1 : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_Input_1      : std_logic;
   SIGNAL s_Input_2      : std_logic;
   SIGNAL s_Input_bus_1  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_Output_1     : std_logic;
   SIGNAL s_Output_bus_1 : std_logic_vector( 15 DOWNTO 0 );

BEGIN

   --------------------------------------------------------------------------------
   -- All signal adaptations are performed here                                  --
   --------------------------------------------------------------------------------
   Output_1_0        <= s_Output_1;
   s_Input_1         <= Input_1_0;
   s_Input_2         <= Input_2_0;
   s_Input_bus_1(0)  <= '0';
   s_Input_bus_1(1)  <= '0';
   s_Input_bus_1(10) <= '0';
   s_Input_bus_1(11) <= '0';
   s_Input_bus_1(12) <= '0';
   s_Input_bus_1(13) <= '0';
   s_Input_bus_1(14) <= '0';
   s_Input_bus_1(15) <= '0';
   s_Input_bus_1(2)  <= '0';
   s_Input_bus_1(3)  <= '0';
   s_Input_bus_1(4)  <= '0';
   s_Input_bus_1(5)  <= '0';
   s_Input_bus_1(6)  <= '0';
   s_Input_bus_1(7)  <= '0';
   s_Input_bus_1(8)  <= '0';
   s_Input_bus_1(9)  <= '0';

   --------------------------------------------------------------------------------
   -- The toplevel component is connected here                                   --
   --------------------------------------------------------------------------------
   CIRCUIT_0 : twos_complement
      PORT MAP ( Input_1      => s_Input_1,
                 Input_2      => s_Input_2,
                 Input_bus_1  => s_Input_bus_1,
                 Output_1     => s_Output_1,
                 Output_bus_1 => s_Output_bus_1 );
END platformIndependent;
