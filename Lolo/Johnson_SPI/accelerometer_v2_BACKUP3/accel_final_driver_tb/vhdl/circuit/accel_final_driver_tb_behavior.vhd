--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2_BACKUP3                                     ==
--== Component : accel_final_driver_tb                                        ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF accel_final_driver_tb IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT hex_to_decimal_16_bits
         PORT ( val      : IN  std_logic_vector( 15 DOWNTO 0 );
                hundreds : OUT std_logic_vector( 3 DOWNTO 0 );
                ones     : OUT std_logic_vector( 3 DOWNTO 0 );
                tens     : OUT std_logic_vector( 3 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT Multiplexer_4
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic;
                muxIn_1 : IN  std_logic;
                muxIn_2 : IN  std_logic;
                muxIn_3 : IN  std_logic;
                sel     : IN  std_logic_vector( 1 DOWNTO 0 );
                muxOut  : OUT std_logic );
      END COMPONENT;

      COMPONENT Multiplexer_bus_4
         GENERIC ( nrOfBits : INTEGER );
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_1 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_2 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_3 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                sel     : IN  std_logic_vector( 1 DOWNTO 0 );
                muxOut  : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT sign_hex_output
         PORT ( logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1    : IN  std_logic_vector( 4 DOWNTO 0 );
                negative             : IN  std_logic;
                logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT sevenseg_direction_angle_logic
         PORT ( D                 : IN  std_logic;
                L                 : IN  std_logic;
                M                 : IN  std_logic;
                R                 : IN  std_logic;
                S                 : IN  std_logic;
                U                 : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                letter_output     : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT absolute_val_and_sign
         PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                unfiltered        : IN  std_logic_vector( 15 DOWNTO 0 );
                negative          : OUT std_logic;
                value             : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT sevenseg_mapped
         PORT ( logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1    : IN  std_logic_vector( 4 DOWNTO 0 );
                sevenseg_input       : IN  std_logic_vector( 7 DOWNTO 0 );
                logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT sevenseg_numbers_output
         PORT ( decimal              : IN  std_logic;
                input_bus            : IN  std_logic_vector( 3 DOWNTO 0 );
                logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT accel_final_driver
         PORT ( accel_input       : IN  std_logic;
                enable_accel      : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                miso              : IN  std_logic;
                rst               : IN  std_logic;
                x_offset          : IN  std_logic_vector( 15 DOWNTO 0 );
                y_offset          : IN  std_logic_vector( 15 DOWNTO 0 );
                z_offset          : IN  std_logic_vector( 15 DOWNTO 0 );
                cs                : OUT std_logic;
                down              : OUT std_logic;
                left              : OUT std_logic;
                mosi              : OUT std_logic;
                right             : OUT std_logic;
                sclk              : OUT std_logic;
                up                : OUT std_logic;
                x_filtered        : OUT std_logic_vector( 15 DOWNTO 0 );
                x_large           : OUT std_logic;
                x_medium          : OUT std_logic;
                x_small           : OUT std_logic;
                y_filtered        : OUT std_logic_vector( 15 DOWNTO 0 );
                y_large           : OUT std_logic;
                y_medium          : OUT std_logic;
                y_small           : OUT std_logic;
                z_filtered        : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus10 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus17 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus18 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus20 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus22 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus24 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus26 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus27 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus28 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus30 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus34 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus35 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus36 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus37 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus38 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus39 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus44 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus45 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus46 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus6  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus7  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet14 : std_logic;
   SIGNAL s_logisimNet15 : std_logic;
   SIGNAL s_logisimNet16 : std_logic;
   SIGNAL s_logisimNet19 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet21 : std_logic;
   SIGNAL s_logisimNet23 : std_logic;
   SIGNAL s_logisimNet25 : std_logic;
   SIGNAL s_logisimNet29 : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet31 : std_logic;
   SIGNAL s_logisimNet32 : std_logic;
   SIGNAL s_logisimNet33 : std_logic;
   SIGNAL s_logisimNet40 : std_logic;
   SIGNAL s_logisimNet41 : std_logic;
   SIGNAL s_logisimNet42 : std_logic;
   SIGNAL s_logisimNet43 : std_logic;
   SIGNAL s_logisimNet47 : std_logic;
   SIGNAL s_logisimNet48 : std_logic;
   SIGNAL s_logisimNet49 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet40 <= rst;
   s_logisimNet41 <= miso;
   s_logisimNet42 <= accel_input;
   s_logisimNet43 <= enable_accel;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   cs   <= s_logisimNet49;
   mosi <= s_logisimNet47;
   sclk <= s_logisimNet48;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimNet31  <=  '0';


   -- Constant
    s_logisimNet33  <=  '1';


   -- Constant
    s_logisimBus36(7 DOWNTO 0)  <=  X"00";


   -- DIP Switch: DipSwitch_1
   s_logisimBus30(0) <= logisimInputBubbles(0);
   s_logisimBus30(1) <= logisimInputBubbles(1);

   -- Constant
    s_logisimBus44(15 DOWNTO 0)  <=  X"003E";


   -- Constant
    s_logisimBus45(15 DOWNTO 0)  <=  X"0039";


   -- Constant
    s_logisimBus38(7 DOWNTO 0)  <=  X"00";


   -- Constant
    s_logisimBus39(7 DOWNTO 0)  <=  X"00";


   -- Constant
    s_logisimBus46(15 DOWNTO 0)  <=  X"003A";


   -- Constant
    s_logisimBus35(7 DOWNTO 0)  <=  X"00";


   -- Constant
    s_logisimBus37(15 DOWNTO 0)  <=  X"0000";


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   hex_to_decimal_16_bits_1 : hex_to_decimal_16_bits
      PORT MAP ( hundreds => s_logisimBus4(3 DOWNTO 0),
                 ones     => s_logisimBus5(3 DOWNTO 0),
                 tens     => s_logisimBus17(3 DOWNTO 0),
                 val      => s_logisimBus34(15 DOWNTO 0) );

   PLEXERS_2 : Multiplexer_4
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimNet19,
                 muxIn_1 => s_logisimNet12,
                 muxIn_2 => s_logisimNet11,
                 muxIn_3 => s_logisimNet31,
                 muxOut  => s_logisimNet32,
                 sel     => s_logisimBus30(1 DOWNTO 0) );

   PLEXERS_3 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus22(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus6(15 DOWNTO 0),
                 muxIn_2 => s_logisimBus20(15 DOWNTO 0),
                 muxIn_3 => s_logisimBus37(15 DOWNTO 0),
                 muxOut  => s_logisimBus34(15 DOWNTO 0),
                 sel     => s_logisimBus30(1 DOWNTO 0) );

   PLEXERS_4 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus10(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus9(7 DOWNTO 0),
                 muxIn_2 => s_logisimBus35(7 DOWNTO 0),
                 muxIn_3 => s_logisimBus36(7 DOWNTO 0),
                 muxOut  => s_logisimBus27(7 DOWNTO 0),
                 sel     => s_logisimBus30(1 DOWNTO 0) );

   PLEXERS_5 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus24(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus8(7 DOWNTO 0),
                 muxIn_2 => s_logisimBus38(7 DOWNTO 0),
                 muxIn_3 => s_logisimBus39(7 DOWNTO 0),
                 muxOut  => s_logisimBus26(7 DOWNTO 0),
                 sel     => s_logisimBus30(1 DOWNTO 0) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   HEX3 : sign_hex_output
      PORT MAP ( logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(7  DOWNTO  0),
                 negative             => s_logisimNet32 );

   sevenseg_direction_angle_logic_3 : sevenseg_direction_angle_logic
      PORT MAP ( D                 => '0',
                 L                 => s_logisimNet21,
                 M                 => s_logisimNet0,
                 R                 => '0',
                 S                 => s_logisimNet3,
                 U                 => '0',
                 letter_output     => s_logisimBus24(7 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   absolute_val_and_sign_2 : absolute_val_and_sign
      PORT MAP ( logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 negative          => s_logisimNet12,
                 unfiltered        => s_logisimBus28(15 DOWNTO 0),
                 value             => s_logisimBus6(15 DOWNTO 0) );

   sevenseg_direction_angle_logic_4 : sevenseg_direction_angle_logic
      PORT MAP ( D                 => '0',
                 L                 => s_logisimNet13,
                 M                 => s_logisimNet2,
                 R                 => '0',
                 S                 => s_logisimNet1,
                 U                 => '0',
                 letter_output     => s_logisimBus8(7 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   sevenseg_direction_angle_logic_2 : sevenseg_direction_angle_logic
      PORT MAP ( D                 => s_logisimNet23,
                 L                 => '0',
                 M                 => '0',
                 R                 => '0',
                 S                 => '0',
                 U                 => s_logisimNet16,
                 letter_output     => s_logisimBus9(7 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   HEX5 : sevenseg_mapped
      PORT MAP ( logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(15  DOWNTO  8),
                 sevenseg_input       => s_logisimBus26(7 DOWNTO 0) );

   HEX2 : sevenseg_numbers_output
      PORT MAP ( decimal              => s_logisimNet33,
                 input_bus            => s_logisimBus4(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(23  DOWNTO  16) );

   absolute_val_and_sign_1 : absolute_val_and_sign
      PORT MAP ( logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 negative          => s_logisimNet19,
                 unfiltered        => s_logisimBus18(15 DOWNTO 0),
                 value             => s_logisimBus22(15 DOWNTO 0) );

   absolute_val_and_sign_3 : absolute_val_and_sign
      PORT MAP ( logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 negative          => s_logisimNet11,
                 unfiltered        => s_logisimBus7(15 DOWNTO 0),
                 value             => s_logisimBus20(15 DOWNTO 0) );

   HEX4 : sevenseg_mapped
      PORT MAP ( logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(31  DOWNTO  24),
                 sevenseg_input       => s_logisimBus27(7 DOWNTO 0) );

   HEX0 : sevenseg_numbers_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus5(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(39  DOWNTO  32) );

   sevenseg_direction_angle_logic_1 : sevenseg_direction_angle_logic
      PORT MAP ( D                 => '0',
                 L                 => s_logisimNet15,
                 M                 => '0',
                 R                 => s_logisimNet14,
                 S                 => '0',
                 U                 => '0',
                 letter_output     => s_logisimBus10(7 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   HEX1 : sevenseg_numbers_output
      PORT MAP ( decimal              => '0',
                 input_bus            => s_logisimBus17(3 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(47  DOWNTO  40) );

   accel_final_driver_v2_1 : accel_final_driver
      PORT MAP ( accel_input       => s_logisimNet42,
                 cs                => s_logisimNet49,
                 down              => s_logisimNet23,
                 enable_accel      => s_logisimNet43,
                 left              => s_logisimNet15,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 miso              => s_logisimNet41,
                 mosi              => s_logisimNet47,
                 right             => s_logisimNet14,
                 rst               => s_logisimNet40,
                 sclk              => s_logisimNet48,
                 up                => s_logisimNet16,
                 x_filtered        => s_logisimBus18(15 DOWNTO 0),
                 x_large           => s_logisimNet21,
                 x_medium          => s_logisimNet0,
                 x_offset          => s_logisimBus44(15 DOWNTO 0),
                 x_small           => s_logisimNet3,
                 y_filtered        => s_logisimBus28(15 DOWNTO 0),
                 y_large           => s_logisimNet13,
                 y_medium          => s_logisimNet2,
                 y_offset          => s_logisimBus45(15 DOWNTO 0),
                 y_small           => s_logisimNet1,
                 z_filtered        => s_logisimBus7(15 DOWNTO 0),
                 z_offset          => s_logisimBus46(15 DOWNTO 0) );

END platformIndependent;
