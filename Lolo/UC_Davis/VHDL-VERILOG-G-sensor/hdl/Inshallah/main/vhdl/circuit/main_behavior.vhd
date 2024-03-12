--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Inshallah                                                    ==
--== Component : main                                                         ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF main IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT accel
         PORT ( ADC_CLK_10    : IN    std_logic;
                GSENSOR_INT   : IN    std_logic_vector( 1 DOWNTO 0 );
                KEY           : IN    std_logic_vector( 1 DOWNTO 0 );
                MAX10_CLK1_50 : IN    std_logic;
                MAX10_CLK2_50 : IN    std_logic;
                SW            : IN    std_logic_vector( 9 DOWNTO 0 );
                GSENSOR_SDI   : INOUT std_logic;
                GSENSOR_SDO   : INOUT std_logic;
                GSENSOR_CS_N  : OUT   std_logic;
                GSENSOR_SCLK  : OUT   std_logic;
                HEX0          : OUT   std_logic_vector( 7 DOWNTO 0 );
                HEX1          : OUT   std_logic_vector( 7 DOWNTO 0 );
                HEX2          : OUT   std_logic_vector( 7 DOWNTO 0 );
                HEX3          : OUT   std_logic_vector( 7 DOWNTO 0 );
                HEX4          : OUT   std_logic_vector( 7 DOWNTO 0 );
                HEX5          : OUT   std_logic_vector( 7 DOWNTO 0 );
                LEDR          : OUT   std_logic_vector( 9 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0  : std_logic_vector( 9 DOWNTO 0 );
   SIGNAL s_logisimBus10 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus11 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus12 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus3  : std_logic_vector( 9 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus6  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus7  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet4  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet1 <= logisimClockTree0(0);
   s_logisimNet2 <= logisimClockTree0(0);
   s_logisimNet4 <= logisimClockTree0(0);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus11(1 DOWNTO 0) <= Input_bus_1;
   s_logisimBus3(9 DOWNTO 0)  <= Input_bus_2;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   Output_bus_1 <= s_logisimBus12(7 DOWNTO 0);
   Output_bus_2 <= s_logisimBus8(7 DOWNTO 0);
   Output_bus_3 <= s_logisimBus5(7 DOWNTO 0);
   Output_bus_4 <= s_logisimBus7(7 DOWNTO 0);
   Output_bus_5 <= s_logisimBus6(7 DOWNTO 0);
   Output_bus_6 <= s_logisimBus10(7 DOWNTO 0);
   Output_bus_7 <= s_logisimBus0(9 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   accel_1 : accel
      PORT MAP ( ADC_CLK_10    => s_logisimNet1,
                 GSENSOR_CS_N  => OPEN,
                 GSENSOR_INT   => s_logisimBus9(1 DOWNTO 0),
                 GSENSOR_SCLK  => OPEN,
                 GSENSOR_SDI   => OPEN,
                 GSENSOR_SDO   => OPEN,
                 HEX0          => s_logisimBus12(7 DOWNTO 0),
                 HEX1          => s_logisimBus8(7 DOWNTO 0),
                 HEX2          => s_logisimBus5(7 DOWNTO 0),
                 HEX3          => s_logisimBus7(7 DOWNTO 0),
                 HEX4          => s_logisimBus6(7 DOWNTO 0),
                 HEX5          => s_logisimBus10(7 DOWNTO 0),
                 KEY           => s_logisimBus11(1 DOWNTO 0),
                 LEDR          => s_logisimBus0(9 DOWNTO 0),
                 MAX10_CLK1_50 => s_logisimNet4,
                 MAX10_CLK2_50 => s_logisimNet2,
                 SW            => s_logisimBus3(9 DOWNTO 0) );


END platformIndependent;
