--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : directions_and_angles                                        ==
--== Component : show_directions_and_angle                                    ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF show_directions_and_angle IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT OR_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT right_force
         PORT ( L1                : IN  std_logic;
                L2                : IN  std_logic;
                M1                : IN  std_logic;
                M2                : IN  std_logic;
                S1                : IN  std_logic;
                S2                : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                L                 : OUT std_logic;
                M                 : OUT std_logic;
                S                 : OUT std_logic );
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

      COMPONENT angle_checker_one_axis
         PORT ( AXIS              : IN  std_logic_vector( 15 DOWNTO 0 );
                LHB1              : IN  std_logic_vector( 15 DOWNTO 0 );
                LHB2              : IN  std_logic_vector( 15 DOWNTO 0 );
                LLB1              : IN  std_logic_vector( 15 DOWNTO 0 );
                LLB2              : IN  std_logic_vector( 15 DOWNTO 0 );
                MHB1              : IN  std_logic_vector( 15 DOWNTO 0 );
                MHB2              : IN  std_logic_vector( 15 DOWNTO 0 );
                MLB1              : IN  std_logic_vector( 15 DOWNTO 0 );
                MLB2              : IN  std_logic_vector( 15 DOWNTO 0 );
                SHB1              : IN  std_logic_vector( 15 DOWNTO 0 );
                SHB2              : IN  std_logic_vector( 15 DOWNTO 0 );
                SLB1              : IN  std_logic_vector( 15 DOWNTO 0 );
                SLB2              : IN  std_logic_vector( 15 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                L                 : OUT std_logic;
                M                 : OUT std_logic;
                S                 : OUT std_logic );
      END COMPONENT;

      COMPONENT in_range
         PORT ( Higher_bound      : IN  std_logic_vector( 15 DOWNTO 0 );
                Lower_bound       : IN  std_logic_vector( 15 DOWNTO 0 );
                Number_to_check   : IN  std_logic_vector( 15 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                within_range      : OUT std_logic );
      END COMPONENT;

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

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus11 : std_logic_vector( 47 DOWNTO 0 );
   SIGNAL s_logisimBus22 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus24 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus25 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus26 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus27 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus28 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus29 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus30 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus31 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus32 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet14 : std_logic;
   SIGNAL s_logisimNet15 : std_logic;
   SIGNAL s_logisimNet16 : std_logic;
   SIGNAL s_logisimNet17 : std_logic;
   SIGNAL s_logisimNet18 : std_logic;
   SIGNAL s_logisimNet19 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet20 : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet33 : std_logic;
   SIGNAL s_logisimNet34 : std_logic;
   SIGNAL s_logisimNet35 : std_logic;
   SIGNAL s_logisimNet36 : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet33 <= rst;
   s_logisimNet34 <= miso;
   s_logisimNet35 <= accel_input;
   s_logisimNet36 <= enable_accel;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   cs   <= s_logisimNet20;
   mosi <= s_logisimNet18;
   sclk <= s_logisimNet19;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus28(15 DOWNTO 0)  <=  X"0000";


   -- Constant
    s_logisimBus22(15 DOWNTO 0)  <=  X"002D";


   -- Constant
    s_logisimBus31(15 DOWNTO 0)  <=  X"FFBA";


   -- Constant
    s_logisimBus30(15 DOWNTO 0)  <=  X"FFFF";


   -- Constant
    s_logisimBus29(15 DOWNTO 0)  <=  X"002D";


   -- Constant
    s_logisimBus32(15 DOWNTO 0)  <=  X"FFD2";


   -- Constant
    s_logisimBus25(15 DOWNTO 0)  <=  X"007A";


   -- Constant
    s_logisimBus26(15 DOWNTO 0)  <=  X"00A7";


   -- Constant
    s_logisimBus24(15 DOWNTO 0)  <=  X"004D";


   -- Constant
    s_logisimBus27(15 DOWNTO 0)  <=  X"00D4";


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet10,
                 input2 => s_logisimNet4,
                 result => s_logisimNet0 );

   GATES_2 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet6,
                 input2 => s_logisimNet14,
                 result => s_logisimNet15 );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   right_force_1 : right_force
      PORT MAP ( L                 => s_logisimNet12,
                 L1                => s_logisimNet1,
                 L2                => s_logisimNet2,
                 M                 => s_logisimNet16,
                 M1                => s_logisimNet9,
                 M2                => s_logisimNet13,
                 S                 => s_logisimNet5,
                 S1                => s_logisimNet8,
                 S2                => s_logisimNet7,
                 logisimClockTree0 => logisimClockTree0 );

   sevenseg_directions_output_3 : sevenseg_directions_output
      PORT MAP ( D                    => '0',
                 L                    => s_logisimNet12,
                 M                    => s_logisimNet16,
                 R                    => '0',
                 S                    => s_logisimNet5,
                 U                    => '0',
                 logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(7  DOWNTO  0) );

   angle_checker_one_axis_2 : angle_checker_one_axis
      PORT MAP ( AXIS              => s_logisimBus11(31 DOWNTO 16),
                 L                 => s_logisimNet2,
                 LHB1              => s_logisimBus27(15 DOWNTO 0),
                 LHB2              => s_logisimBus32(15 DOWNTO 0),
                 LLB1              => s_logisimBus26(15 DOWNTO 0),
                 LLB2              => s_logisimBus31(15 DOWNTO 0),
                 M                 => s_logisimNet13,
                 MHB1              => s_logisimBus26(15 DOWNTO 0),
                 MHB2              => s_logisimBus30(15 DOWNTO 0),
                 MLB1              => s_logisimBus25(15 DOWNTO 0),
                 MLB2              => s_logisimBus32(15 DOWNTO 0),
                 S                 => s_logisimNet7,
                 SHB1              => s_logisimBus25(15 DOWNTO 0),
                 SHB2              => s_logisimBus29(15 DOWNTO 0),
                 SLB1              => s_logisimBus24(15 DOWNTO 0),
                 SLB2              => s_logisimBus28(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0 );

   LEFT : in_range
      PORT MAP ( Higher_bound      => s_logisimBus27(15 DOWNTO 0),
                 Lower_bound       => s_logisimBus24(15 DOWNTO 0),
                 Number_to_check   => s_logisimBus11(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 within_range      => s_logisimNet17 );

   RIGHT1 : in_range
      PORT MAP ( Higher_bound      => s_logisimBus22(15 DOWNTO 0),
                 Lower_bound       => s_logisimBus28(15 DOWNTO 0),
                 Number_to_check   => s_logisimBus11(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 within_range      => s_logisimNet10 );

   RIGHT2 : in_range
      PORT MAP ( Higher_bound      => s_logisimBus30(15 DOWNTO 0),
                 Lower_bound       => s_logisimBus31(15 DOWNTO 0),
                 Number_to_check   => s_logisimBus11(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 within_range      => s_logisimNet4 );

   DOWN : in_range
      PORT MAP ( Higher_bound      => s_logisimBus27(15 DOWNTO 0),
                 Lower_bound       => s_logisimBus24(15 DOWNTO 0),
                 Number_to_check   => s_logisimBus11(31 DOWNTO 16),
                 logisimClockTree0 => logisimClockTree0,
                 within_range      => s_logisimNet3 );

   UP1 : in_range
      PORT MAP ( Higher_bound      => s_logisimBus22(15 DOWNTO 0),
                 Lower_bound       => s_logisimBus28(15 DOWNTO 0),
                 Number_to_check   => s_logisimBus11(31 DOWNTO 16),
                 logisimClockTree0 => logisimClockTree0,
                 within_range      => s_logisimNet6 );

   UP2 : in_range
      PORT MAP ( Higher_bound      => s_logisimBus30(15 DOWNTO 0),
                 Lower_bound       => s_logisimBus31(15 DOWNTO 0),
                 Number_to_check   => s_logisimBus11(31 DOWNTO 16),
                 logisimClockTree0 => logisimClockTree0,
                 within_range      => s_logisimNet14 );

   angle_checker_one_axis_1 : angle_checker_one_axis
      PORT MAP ( AXIS              => s_logisimBus11(15 DOWNTO 0),
                 L                 => s_logisimNet1,
                 LHB1              => s_logisimBus27(15 DOWNTO 0),
                 LHB2              => s_logisimBus32(15 DOWNTO 0),
                 LLB1              => s_logisimBus26(15 DOWNTO 0),
                 LLB2              => s_logisimBus31(15 DOWNTO 0),
                 M                 => s_logisimNet9,
                 MHB1              => s_logisimBus26(15 DOWNTO 0),
                 MHB2              => s_logisimBus30(15 DOWNTO 0),
                 MLB1              => s_logisimBus25(15 DOWNTO 0),
                 MLB2              => s_logisimBus32(15 DOWNTO 0),
                 S                 => s_logisimNet8,
                 SHB1              => s_logisimBus25(15 DOWNTO 0),
                 SHB2              => s_logisimBus29(15 DOWNTO 0),
                 SLB1              => s_logisimBus24(15 DOWNTO 0),
                 SLB2              => s_logisimBus28(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0 );

   sevenseg_directions_output_1 : sevenseg_directions_output
      PORT MAP ( D                    => '0',
                 L                    => s_logisimNet17,
                 M                    => '0',
                 R                    => s_logisimNet0,
                 S                    => '0',
                 U                    => '0',
                 logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(15  DOWNTO  8) );

   sevenseg_directions_output_2 : sevenseg_directions_output
      PORT MAP ( D                    => s_logisimNet3,
                 L                    => '0',
                 M                    => '0',
                 R                    => '0',
                 S                    => '0',
                 U                    => s_logisimNet15,
                 logisimClockTree0    => logisimClockTree0,
                 logisimOutputBubbles => logisimOutputBubbles(23  DOWNTO  16) );

   accel_main_driver_1 : accel_main_driver
      PORT MAP ( Accelerometer     => s_logisimBus11(47 DOWNTO 0),
                 accel_input       => s_logisimNet35,
                 cs                => s_logisimNet20,
                 enable_accel      => s_logisimNet36,
                 logisimClockTree0 => logisimClockTree0,
                 miso              => s_logisimNet34,
                 mosi              => s_logisimNet18,
                 rst               => s_logisimNet33,
                 sclk              => s_logisimNet19 );

END platformIndependent;
