--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_ADXL345                                        ==
--== Component : show_directions_and_angle                                    ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF show_directions_and_angle IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT accel_main_driver
         PORT ( accel_input       : IN  std_logic;
                enable_accel      : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                miso              : IN  std_logic;
                rst               : IN  std_logic;
                Accelerometer     : OUT std_logic_vector( 47 DOWNTO 0 );
                cs                : OUT std_logic;
                mosi              : OUT std_logic;
                sclk              : OUT std_logic );
      END COMPONENT;

      COMPONENT in_range
         PORT ( Higher_bound      : IN  std_logic_vector( 15 DOWNTO 0 );
                Lower_bound       : IN  std_logic_vector( 15 DOWNTO 0 );
                Number_to_check   : IN  std_logic_vector( 15 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                within_range      : OUT std_logic );
      END COMPONENT;

      COMPONENT sevenseg_directions_output
         PORT ( D                    : IN  std_logic;
                L                    : IN  std_logic;
                M                    : IN  std_logic;
                R                    : IN  std_logic;
                S                    : IN  std_logic;
                U                    : IN  std_logic;
                logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus10 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus3  : std_logic_vector( 47 DOWNTO 0 );
   SIGNAL s_logisimBus7  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet5  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   cs   <= s_logisimNet0;
   mosi <= s_logisimNet1;
   sclk <= s_logisimNet2;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus7(15 DOWNTO 0)  <=  X"0090";


   -- Constant
    s_logisimBus8(15 DOWNTO 0)  <=  X"0043";


   -- Constant
    s_logisimBus9(15 DOWNTO 0)  <=  X"FF43";


   -- Constant
    s_logisimBus10(15 DOWNTO 0)  <=  X"FFFF";


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   ADXL345_CHIP : accel_main_driver
      PORT MAP ( Accelerometer     => s_logisimBus3(47 DOWNTO 0),
                 accel_input       => '0',
                 cs                => s_logisimNet0,
                 enable_accel      => '0',
                 logisimClockTree0 => logisimClockTree0,
                 miso              => '0',
                 mosi              => s_logisimNet1,
                 rst               => '0',
                 sclk              => s_logisimNet2 );

   in_range_1 : in_range
      PORT MAP ( Higher_bound      => s_logisimBus7(15 DOWNTO 0),
                 Lower_bound       => s_logisimBus8(15 DOWNTO 0),
                 Number_to_check   => s_logisimBus3(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 within_range      => s_logisimNet4 );

   sevenseg_directions_output_1 : sevenseg_directions_output
      PORT MAP ( D                    => '0',
                 L                    => s_logisimNet4,
                 M                    => '0',
                 R                    => s_logisimNet5,
                 S                    => '0',
                 U                    => '0',
                 logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(7  DOWNTO  0) );

   in_range_2 : in_range
      PORT MAP ( Higher_bound      => s_logisimBus10(15 DOWNTO 0),
                 Lower_bound       => s_logisimBus9(15 DOWNTO 0),
                 Number_to_check   => s_logisimBus3(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 within_range      => s_logisimNet5 );

END platformIndependent;
