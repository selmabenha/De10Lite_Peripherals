--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : johnson                                                      ==
--== Component : main                                                         ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF main IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT spi_master
         PORT ( bytes       : IN  std_logic_vector( 3 DOWNTO 0 );
                clk         : IN  std_logic;
                go          : IN  std_logic;
                int1        : IN  std_logic;
                int2        : IN  std_logic;
                miso        : IN  std_logic;
                pha         : IN  std_logic;
                pol         : IN  std_logic;
                rst         : IN  std_logic;
                txData      : IN  std_logic_vector( 7 DOWNTO 0 );
                cs_out      : OUT std_logic;
                mosi        : OUT std_logic;
                rxData      : OUT std_logic_vector( 7 DOWNTO 0 );
                rxDataReady : OUT std_logic;
                sclk_out    : OUT std_logic );
      END COMPONENT;

      COMPONENT clock_div
         PORT ( bytes      : IN  std_logic_vector( 3 DOWNTO 0 );
                clk_in     : IN  std_logic;
                enable     : IN  std_logic;
                polarity   : IN  std_logic;
                rst        : IN  std_logic;
                byte_flag  : OUT std_logic;
                clk_active : OUT std_logic;
                clk_out    : OUT std_logic );
      END COMPONENT;

      COMPONENT accel_driver
         PORT ( clk         : IN  std_logic;
                int1        : IN  std_logic;
                intBypass   : IN  std_logic;
                rst         : IN  std_logic;
                rxData      : IN  std_logic_vector( 7 DOWNTO 0 );
                rxDataReady : IN  std_logic;
                accel_data  : OUT std_logic_vector( 47 DOWNTO 0 );
                bytes       : OUT std_logic_vector( 3 DOWNTO 0 );
                c           : OUT std_logic;
                go          : OUT std_logic;
                pha         : OUT std_logic;
                pol         : OUT std_logic;
                stateID     : OUT std_logic_vector( 2 DOWNTO 0 );
                txData      : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT spi_accelerometer
         PORT ( clk50MHz  : IN  std_logic;
                int1      : IN  std_logic;
                intBypass : IN  std_logic;
                miso      : IN  std_logic;
                rst       : IN  std_logic;
                accel     : OUT std_logic_vector( 47 DOWNTO 0 );
                cs        : OUT std_logic;
                mosi      : OUT std_logic;
                rst_led   : OUT std_logic;
                sclk      : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus3  : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 47 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet14 : std_logic;
   SIGNAL s_logisimNet15 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet8 <= logisimClockTree0(0);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet10 <= miso;
   s_logisimNet11 <= int1;
   s_logisimNet12 <= intbypass;
   s_logisimNet9  <= rst;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   Accelerometer <= s_logisimBus4(47 DOWNTO 0);
   cs            <= s_logisimNet15;
   mosi          <= s_logisimNet13;
   rst_led       <= s_logisimNet2;
   sclk          <= s_logisimNet14;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Ground
    s_logisimNet1  <=  '0';


   -- Ground
    s_logisimNet6  <=  '0';


   -- Ground
    s_logisimBus5(7 DOWNTO 0)  <=  X"00";


   -- Ground
    s_logisimNet7  <=  '0';


   -- Ground
    s_logisimBus3(3 DOWNTO 0)  <=  X"0";


   -- Ground
    s_logisimBus0(7 DOWNTO 0)  <=  X"00";


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   spi_master_1 : spi_master
      PORT MAP ( bytes       => s_logisimBus3(3 DOWNTO 0),
                 clk         => s_logisimNet1,
                 cs_out      => OPEN,
                 go          => s_logisimNet1,
                 int1        => s_logisimNet1,
                 int2        => s_logisimNet1,
                 miso        => s_logisimNet1,
                 mosi        => OPEN,
                 pha         => s_logisimNet1,
                 pol         => s_logisimNet1,
                 rst         => s_logisimNet1,
                 rxData      => OPEN,
                 rxDataReady => OPEN,
                 sclk_out    => OPEN,
                 txData      => s_logisimBus0(7 DOWNTO 0) );

   clock_div_1 : clock_div
      PORT MAP ( byte_flag  => OPEN,
                 bytes      => X"0",
                 clk_active => OPEN,
                 clk_in     => s_logisimNet7,
                 clk_out    => OPEN,
                 enable     => s_logisimNet7,
                 polarity   => s_logisimNet7,
                 rst        => s_logisimNet7 );

   accel_driver_1 : accel_driver
      PORT MAP ( accel_data  => OPEN,
                 bytes       => OPEN,
                 c           => OPEN,
                 clk         => s_logisimNet6,
                 go          => OPEN,
                 int1        => s_logisimNet6,
                 intBypass   => s_logisimNet6,
                 pha         => OPEN,
                 pol         => OPEN,
                 rst         => s_logisimNet6,
                 rxData      => s_logisimBus5(7 DOWNTO 0),
                 rxDataReady => s_logisimNet6,
                 stateID     => OPEN,
                 txData      => OPEN );

   spi_accelerometer_1 : spi_accelerometer
      PORT MAP ( accel     => s_logisimBus4(47 DOWNTO 0),
                 clk50MHz  => s_logisimNet8,
                 cs        => s_logisimNet15,
                 int1      => s_logisimNet11,
                 intBypass => s_logisimNet12,
                 miso      => s_logisimNet10,
                 mosi      => s_logisimNet13,
                 rst       => s_logisimNet9,
                 rst_led   => s_logisimNet2,
                 sclk      => s_logisimNet14 );


END platformIndependent;
