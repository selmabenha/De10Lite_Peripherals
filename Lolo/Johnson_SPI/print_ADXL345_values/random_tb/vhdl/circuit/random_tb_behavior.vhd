--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : print_ADXL345_values                                         ==
--== Component : random_tb                                                    ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF random_tb IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT LogisimRNG
         GENERIC ( nrOfBits : INTEGER;
                   seed     : std_logic_vector );
         PORT ( clear  : IN  std_logic;
                clock  : IN  std_logic;
                enable : IN  std_logic;
                tick   : IN  std_logic;
                q      : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet1 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet1 <= Input_1;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   Output_bus_1 <= s_logisimBus0(7 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   MEMORY_1 : LogisimRNG
      GENERIC MAP ( nrOfBits => 8,
                    seed     => X"00000020" )
      PORT MAP ( clear  => s_logisimNet1,
                 clock  => '0',
                 enable => '1',
                 q      => s_logisimBus0(7 DOWNTO 0),
                 tick   => '0' );


END platformIndependent;
