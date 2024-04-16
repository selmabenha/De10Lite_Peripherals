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
      COMPONENT division_by_256
         PORT ( Input_value : IN  std_logic_vector( 31 DOWNTO 0 );
                hundreds    : OUT std_logic_vector( 31 DOWNTO 0 );
                ones        : OUT std_logic_vector( 31 DOWNTO 0 );
                tens        : OUT std_logic_vector( 31 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_Input_value : std_logic_vector( 31 DOWNTO 0 );
   SIGNAL s_hundreds    : std_logic_vector( 31 DOWNTO 0 );
   SIGNAL s_ones        : std_logic_vector( 31 DOWNTO 0 );
   SIGNAL s_tens        : std_logic_vector( 31 DOWNTO 0 );

BEGIN

   --------------------------------------------------------------------------------
   -- All signal adaptations are performed here                                  --
   --------------------------------------------------------------------------------
   s_Input_value(0)  <= '0';
   s_Input_value(1)  <= '0';
   s_Input_value(10) <= '0';
   s_Input_value(11) <= '0';
   s_Input_value(12) <= '0';
   s_Input_value(13) <= '0';
   s_Input_value(14) <= '0';
   s_Input_value(15) <= '0';
   s_Input_value(16) <= '0';
   s_Input_value(17) <= '0';
   s_Input_value(18) <= '0';
   s_Input_value(19) <= '0';
   s_Input_value(2)  <= '0';
   s_Input_value(20) <= '0';
   s_Input_value(21) <= '0';
   s_Input_value(22) <= '0';
   s_Input_value(23) <= '0';
   s_Input_value(24) <= '0';
   s_Input_value(25) <= '0';
   s_Input_value(26) <= '0';
   s_Input_value(27) <= '0';
   s_Input_value(28) <= '0';
   s_Input_value(29) <= '0';
   s_Input_value(3)  <= '0';
   s_Input_value(30) <= '0';
   s_Input_value(31) <= '0';
   s_Input_value(4)  <= '0';
   s_Input_value(5)  <= '0';
   s_Input_value(6)  <= '0';
   s_Input_value(7)  <= '0';
   s_Input_value(8)  <= '0';
   s_Input_value(9)  <= '0';

   --------------------------------------------------------------------------------
   -- The toplevel component is connected here                                   --
   --------------------------------------------------------------------------------
   CIRCUIT_0 : division_by_256
      PORT MAP ( Input_value => s_Input_value,
                 hundreds    => s_hundreds,
                 ones        => s_ones,
                 tens        => s_tens );
END platformIndependent;
