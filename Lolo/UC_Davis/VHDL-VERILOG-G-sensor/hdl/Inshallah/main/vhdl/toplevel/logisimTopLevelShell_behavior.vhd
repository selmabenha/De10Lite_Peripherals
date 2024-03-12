--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Inshallah                                                    ==
--== Component : logisimTopLevelShell                                         ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF logisimTopLevelShell IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
      COMPONENT logisimTickGenerator
         GENERIC ( nrOfBits    : INTEGER;
                   reloadValue : INTEGER );
         PORT ( FPGAClock : IN  std_logic;
                FPGATick  : OUT std_logic );
      END COMPONENT;

      COMPONENT LogisimClockComponent
         GENERIC ( highTicks : INTEGER;
                   lowTicks  : INTEGER;
                   nrOfBits  : INTEGER;
                   phase     : INTEGER );
         PORT ( clockTick   : IN  std_logic;
                globalClock : IN  std_logic;
                clockBus    : OUT std_logic_vector( 4 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT main
         PORT ( Input_bus_1       : IN  std_logic_vector( 1 DOWNTO 0 );
                Input_bus_2       : IN  std_logic_vector( 9 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                Output_bus_1      : OUT std_logic_vector( 7 DOWNTO 0 );
                Output_bus_2      : OUT std_logic_vector( 7 DOWNTO 0 );
                Output_bus_3      : OUT std_logic_vector( 7 DOWNTO 0 );
                Output_bus_4      : OUT std_logic_vector( 7 DOWNTO 0 );
                Output_bus_5      : OUT std_logic_vector( 7 DOWNTO 0 );
                Output_bus_6      : OUT std_logic_vector( 7 DOWNTO 0 );
                Output_bus_7      : OUT std_logic_vector( 9 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_Input_bus_1       : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_Input_bus_2       : std_logic_vector( 9 DOWNTO 0 );
   SIGNAL s_Output_bus_1      : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_Output_bus_2      : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_Output_bus_3      : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_Output_bus_4      : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_Output_bus_5      : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_Output_bus_6      : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_Output_bus_7      : std_logic_vector( 9 DOWNTO 0 );
   SIGNAL s_fpgaTick          : std_logic;
   SIGNAL s_logisimClockTree0 : std_logic_vector( 4 DOWNTO 0 );

BEGIN

   --------------------------------------------------------------------------------
   -- All signal adaptations are performed here                                  --
   --------------------------------------------------------------------------------
   n_Output_bus_1_0 <=  NOT s_Output_bus_1(0);
   n_Output_bus_1_1 <=  NOT s_Output_bus_1(1);
   n_Output_bus_1_2 <=  NOT s_Output_bus_1(2);
   n_Output_bus_1_3 <=  NOT s_Output_bus_1(3);
   n_Output_bus_1_4 <=  NOT s_Output_bus_1(4);
   n_Output_bus_1_5 <=  NOT s_Output_bus_1(5);
   n_Output_bus_1_6 <=  NOT s_Output_bus_1(6);
   n_Output_bus_1_7 <=  NOT s_Output_bus_1(7);
   s_Input_bus_1(0) <=  NOT n_Input_bus_1_0;
   s_Input_bus_1(1) <=  NOT n_Input_bus_1_1;
   s_Input_bus_2(0) <= '0';
   s_Input_bus_2(1) <= '0';
   s_Input_bus_2(2) <= '0';
   s_Input_bus_2(3) <= '0';
   s_Input_bus_2(4) <= '0';
   s_Input_bus_2(5) <= '0';
   s_Input_bus_2(6) <= '0';
   s_Input_bus_2(7) <= '0';
   s_Input_bus_2(8) <= '0';
   s_Input_bus_2(9) <= '0';

   --------------------------------------------------------------------------------
   -- The clock tree components are defined here                                 --
   --------------------------------------------------------------------------------
   BASE_0 : logisimTickGenerator
      GENERIC MAP ( nrOfBits    => 3,
                    reloadValue => 4 )
      PORT MAP ( FPGAClock => fpgaGlobalClock,
                 FPGATick  => s_fpgaTick );

   BASE_1 : LogisimClockComponent
      GENERIC MAP ( highTicks => 1,
                    lowTicks  => 1,
                    nrOfBits  => 1,
                    phase     => 1 )
      PORT MAP ( clockBus    => s_logisimClockTree0,
                 clockTick   => s_fpgaTick,
                 globalClock => fpgaGlobalClock );

   --------------------------------------------------------------------------------
   -- The toplevel component is connected here                                   --
   --------------------------------------------------------------------------------
   CIRCUIT_0 : main
      PORT MAP ( Input_bus_1       => s_Input_bus_1,
                 Input_bus_2       => s_Input_bus_2,
                 Output_bus_1      => s_Output_bus_1,
                 Output_bus_2      => s_Output_bus_2,
                 Output_bus_3      => s_Output_bus_3,
                 Output_bus_4      => s_Output_bus_4,
                 Output_bus_5      => s_Output_bus_5,
                 Output_bus_6      => s_Output_bus_6,
                 Output_bus_7      => s_Output_bus_7,
                 logisimClockTree0 => s_logisimClockTree0 );
END platformIndependent;
