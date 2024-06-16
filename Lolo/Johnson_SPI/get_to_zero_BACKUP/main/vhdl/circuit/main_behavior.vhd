--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero_BACKUP                                           ==
--== Component : main                                                         ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF main IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

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

      COMPONENT counter_fsm
         PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree4 : IN  std_logic_vector( 4 DOWNTO 0 );
                reset             : IN  std_logic;
                state_1           : IN  std_logic;
                state_2           : IN  std_logic;
                state_3           : IN  std_logic;
                state_output      : OUT std_logic_vector( 1 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT game_logic
         PORT ( accel_input       : IN  std_logic;
                button            : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree4 : IN  std_logic_vector( 4 DOWNTO 0 );
                miso              : IN  std_logic;
                reset             : IN  std_logic;
                x_offset          : IN  std_logic_vector( 15 DOWNTO 0 );
                y_offset          : IN  std_logic_vector( 15 DOWNTO 0 );
                z_offset          : IN  std_logic_vector( 15 DOWNTO 0 );
                cs                : OUT std_logic;
                done              : OUT std_logic;
                game_reset        : OUT std_logic;
                mosi              : OUT std_logic;
                negative_x        : OUT std_logic;
                negative_y        : OUT std_logic;
                ones_x            : OUT std_logic_vector( 3 DOWNTO 0 );
                ones_y            : OUT std_logic_vector( 3 DOWNTO 0 );
                sclk              : OUT std_logic;
                tens_x            : OUT std_logic_vector( 3 DOWNTO 0 );
                tens_y            : OUT std_logic_vector( 3 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT side_to_side_anim
         PORT ( clock             : IN  std_logic;
                hex1_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                hex2_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                hex3_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                hex4_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                hex5_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree4 : IN  std_logic_vector( 4 DOWNTO 0 );
                hex0_out          : OUT std_logic_vector( 7 DOWNTO 0 );
                hex1_out          : OUT std_logic_vector( 7 DOWNTO 0 );
                hex2_out          : OUT std_logic_vector( 7 DOWNTO 0 );
                hex3_out          : OUT std_logic_vector( 7 DOWNTO 0 );
                hex4_out          : OUT std_logic_vector( 7 DOWNTO 0 );
                hex5_out          : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT letter_no_decimal
         PORT ( letter_num        : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree4 : IN  std_logic_vector( 4 DOWNTO 0 );
                no_dec_letter     : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT timer
         PORT ( enable            : IN  std_logic;
                game_reset        : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree4 : IN  std_logic_vector( 4 DOWNTO 0 );
                reset             : IN  std_logic;
                stop              : IN  std_logic;
                timer_clock       : IN  std_logic;
                hundreds          : OUT std_logic_vector( 3 DOWNTO 0 );
                ones              : OUT std_logic_vector( 3 DOWNTO 0 );
                tens              : OUT std_logic_vector( 3 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT blink_anim
         PORT ( clock             : IN  std_logic;
                hex0_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                hex1_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                hex2_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                hex3_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                hex4_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                hex5_letter       : IN  std_logic_vector( 7 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree4 : IN  std_logic_vector( 4 DOWNTO 0 );
                hex0_out          : OUT std_logic_vector( 7 DOWNTO 0 );
                hex1_out          : OUT std_logic_vector( 7 DOWNTO 0 );
                hex2_out          : OUT std_logic_vector( 7 DOWNTO 0 );
                hex3_out          : OUT std_logic_vector( 7 DOWNTO 0 );
                hex4_out          : OUT std_logic_vector( 7 DOWNTO 0 );
                hex5_out          : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT sevenseg_numbers_logic
         PORT ( accel             : IN  std_logic_vector( 3 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree4 : IN  std_logic_vector( 4 DOWNTO 0 );
                sevensegment      : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT sevenseg_mapped
         PORT ( logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree2    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree3    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree4    : IN  std_logic_vector( 4 DOWNTO 0 );
                sevenseg_input       : IN  std_logic_vector( 7 DOWNTO 0 );
                logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus1  : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus11 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus12 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus13 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus14 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus15 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus16 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus17 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus18 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus19 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus2  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus20 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus21 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus22 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus23 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus24 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus25 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus26 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus27 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus3  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus30 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus31 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus32 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus33 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus34 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus36 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus39 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus40 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus43 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus46 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus47 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus48 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus54 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus55 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus56 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus57 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus58 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus59 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus6  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus60 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus61 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus62 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus63 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus64 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus65 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus66 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus67 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus68 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus69 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus7  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet28 : std_logic;
   SIGNAL s_logisimNet29 : std_logic;
   SIGNAL s_logisimNet35 : std_logic;
   SIGNAL s_logisimNet37 : std_logic;
   SIGNAL s_logisimNet38 : std_logic;
   SIGNAL s_logisimNet44 : std_logic;
   SIGNAL s_logisimNet45 : std_logic;
   SIGNAL s_logisimNet49 : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet50 : std_logic;
   SIGNAL s_logisimNet51 : std_logic;
   SIGNAL s_logisimNet52 : std_logic;
   SIGNAL s_logisimNet53 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet35 <= logisimClockTree3(0);
   s_logisimNet38 <= logisimClockTree4(0);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet28 <= button;
   s_logisimNet37 <= reset;
   s_logisimNet44 <= miso;
   s_logisimNet45 <= accel_input;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   cs   <= s_logisimNet52;
   mosi <= s_logisimNet50;
   sclk <= s_logisimNet51;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimNet29  <=  '0';


   -- Constant
    s_logisimBus46(15 DOWNTO 0)  <=  X"003B";


   -- Constant
    s_logisimBus47(15 DOWNTO 0)  <=  X"003B";


   -- Constant
    s_logisimBus48(15 DOWNTO 0)  <=  X"003B";


   -- Constant
    s_logisimBus54(4 DOWNTO 0)  <=  "1"&X"3";


   -- Constant
    s_logisimBus56(4 DOWNTO 0)  <=  "1"&X"4";


   -- Constant
    s_logisimBus58(4 DOWNTO 0)  <=  "0"&X"1";


   -- Constant
    s_logisimBus60(4 DOWNTO 0)  <=  "1"&X"2";


   -- Constant
    s_logisimBus20(0)  <=  '0';
    s_logisimBus20(1)  <=  '0';
    s_logisimBus20(2)  <=  '0';
    s_logisimBus20(3)  <=  '0';
    s_logisimBus20(4)  <=  '0';
    s_logisimBus20(5)  <=  '0';
    s_logisimBus20(7)  <=  '0';


   -- Constant
    s_logisimBus32(0)  <=  '0';
    s_logisimBus32(1)  <=  '0';
    s_logisimBus32(2)  <=  '0';
    s_logisimBus32(3)  <=  '0';
    s_logisimBus32(4)  <=  '0';
    s_logisimBus32(5)  <=  '0';
    s_logisimBus32(7)  <=  '0';


   -- Constant
    s_logisimBus62(4 DOWNTO 0)  <=  "0"&X"7";


   -- Constant
    s_logisimBus64(4 DOWNTO 0)  <=  "0"&X"3";


   -- Constant
    s_logisimBus66(4 DOWNTO 0)  <=  "0"&X"5";


   -- Constant
    s_logisimBus68(4 DOWNTO 0)  <=  "0"&X"E";


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus24(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus9(7 DOWNTO 0),
                 muxIn_2 => s_logisimBus18(7 DOWNTO 0),
                 muxIn_3 => X"00",
                 muxOut  => s_logisimBus11(7 DOWNTO 0),
                 sel     => s_logisimBus43(1 DOWNTO 0) );

   PLEXERS_2 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus30(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus32(7 DOWNTO 0),
                 muxIn_2 => s_logisimBus7(7 DOWNTO 0),
                 muxIn_3 => X"00",
                 muxOut  => s_logisimBus12(7 DOWNTO 0),
                 sel     => s_logisimBus43(1 DOWNTO 0) );

   PLEXERS_3 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus19(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus17(7 DOWNTO 0),
                 muxIn_2 => s_logisimBus22(7 DOWNTO 0),
                 muxIn_3 => X"00",
                 muxOut  => s_logisimBus16(7 DOWNTO 0),
                 sel     => s_logisimBus43(1 DOWNTO 0) );

   PLEXERS_4 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus27(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus33(7 DOWNTO 0),
                 muxIn_2 => s_logisimBus34(7 DOWNTO 0),
                 muxIn_3 => X"00",
                 muxOut  => s_logisimBus13(7 DOWNTO 0),
                 sel     => s_logisimBus43(1 DOWNTO 0) );

   PLEXERS_5 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus21(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus20(7 DOWNTO 0),
                 muxIn_2 => s_logisimBus2(7 DOWNTO 0),
                 muxIn_3 => X"00",
                 muxOut  => s_logisimBus14(7 DOWNTO 0),
                 sel     => s_logisimBus43(1 DOWNTO 0) );

   PLEXERS_6 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus8(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus40(7 DOWNTO 0),
                 muxIn_2 => s_logisimBus6(7 DOWNTO 0),
                 muxIn_3 => X"00",
                 muxOut  => s_logisimBus15(7 DOWNTO 0),
                 sel     => s_logisimBus43(1 DOWNTO 0) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   counter_fsm_1 : counter_fsm
      PORT MAP ( logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 reset             => s_logisimNet37,
                 state_1           => s_logisimNet28,
                 state_2           => s_logisimNet53,
                 state_3           => s_logisimNet29,
                 state_output      => s_logisimBus43(1 DOWNTO 0) );

   game_logic_1 : game_logic
      PORT MAP ( accel_input       => s_logisimNet45,
                 button            => s_logisimNet28,
                 cs                => s_logisimNet52,
                 done              => s_logisimNet53,
                 game_reset        => s_logisimNet49,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 miso              => s_logisimNet44,
                 mosi              => s_logisimNet50,
                 negative_x        => s_logisimBus20(6),
                 negative_y        => s_logisimBus32(6),
                 ones_x            => s_logisimBus25(3 DOWNTO 0),
                 ones_y            => s_logisimBus26(3 DOWNTO 0),
                 reset             => s_logisimNet37,
                 sclk              => s_logisimNet51,
                 tens_x            => s_logisimBus31(3 DOWNTO 0),
                 tens_y            => s_logisimBus1(3 DOWNTO 0),
                 x_offset          => s_logisimBus46(15 DOWNTO 0),
                 y_offset          => s_logisimBus47(15 DOWNTO 0),
                 z_offset          => s_logisimBus48(15 DOWNTO 0) );

   side_to_side_anim_1 : side_to_side_anim
      PORT MAP ( clock             => s_logisimNet35,
                 hex0_out          => s_logisimBus24(7 DOWNTO 0),
                 hex1_letter       => s_logisimBus57(7 DOWNTO 0),
                 hex1_out          => s_logisimBus8(7 DOWNTO 0),
                 hex2_letter       => s_logisimBus61(7 DOWNTO 0),
                 hex2_out          => s_logisimBus21(7 DOWNTO 0),
                 hex3_letter       => s_logisimBus59(7 DOWNTO 0),
                 hex3_out          => s_logisimBus27(7 DOWNTO 0),
                 hex4_letter       => s_logisimBus57(7 DOWNTO 0),
                 hex4_out          => s_logisimBus19(7 DOWNTO 0),
                 hex5_letter       => s_logisimBus55(7 DOWNTO 0),
                 hex5_out          => s_logisimBus30(7 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4 );

   letter_no_decimal_1 : letter_no_decimal
      PORT MAP ( letter_num        => s_logisimBus54(4 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 no_dec_letter     => s_logisimBus55(7 DOWNTO 0) );

   letter_no_decimal_2 : letter_no_decimal
      PORT MAP ( letter_num        => s_logisimBus56(4 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 no_dec_letter     => s_logisimBus57(7 DOWNTO 0) );

   letter_no_decimal_3 : letter_no_decimal
      PORT MAP ( letter_num        => s_logisimBus58(4 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 no_dec_letter     => s_logisimBus59(7 DOWNTO 0) );

   letter_no_decimal_4 : letter_no_decimal
      PORT MAP ( letter_num        => s_logisimBus60(4 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 no_dec_letter     => s_logisimBus61(7 DOWNTO 0) );

   timer_1 : timer
      PORT MAP ( enable            => s_logisimNet28,
                 game_reset        => s_logisimNet49,
                 hundreds          => s_logisimBus39(3 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 ones              => s_logisimBus36(3 DOWNTO 0),
                 reset             => s_logisimNet37,
                 stop              => s_logisimNet53,
                 tens              => s_logisimBus23(3 DOWNTO 0),
                 timer_clock       => s_logisimNet38 );

   blink_anim_1 : blink_anim
      PORT MAP ( clock             => s_logisimNet35,
                 hex0_letter       => s_logisimBus65(7 DOWNTO 0),
                 hex0_out          => s_logisimBus18(7 DOWNTO 0),
                 hex1_letter       => s_logisimBus67(7 DOWNTO 0),
                 hex1_out          => s_logisimBus6(7 DOWNTO 0),
                 hex2_letter       => s_logisimBus55(7 DOWNTO 0),
                 hex2_out          => s_logisimBus2(7 DOWNTO 0),
                 hex3_letter       => s_logisimBus3(7 DOWNTO 0),
                 hex3_out          => s_logisimBus34(7 DOWNTO 0),
                 hex4_letter       => s_logisimBus4(7 DOWNTO 0),
                 hex4_out          => s_logisimBus22(7 DOWNTO 0),
                 hex5_letter       => s_logisimBus0(7 DOWNTO 0),
                 hex5_out          => s_logisimBus7(7 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4 );

   letter_no_decimal_5 : letter_no_decimal
      PORT MAP ( letter_num        => s_logisimBus62(4 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 no_dec_letter     => s_logisimBus63(7 DOWNTO 0) );

   letter_no_decimal_6 : letter_no_decimal
      PORT MAP ( letter_num        => s_logisimBus64(4 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 no_dec_letter     => s_logisimBus65(7 DOWNTO 0) );

   letter_no_decimal_7 : letter_no_decimal
      PORT MAP ( letter_num        => s_logisimBus66(4 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 no_dec_letter     => s_logisimBus67(7 DOWNTO 0) );

   letter_no_decimal_8 : letter_no_decimal
      PORT MAP ( letter_num        => s_logisimBus68(4 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 no_dec_letter     => s_logisimBus69(7 DOWNTO 0) );

   sevenseg_numbers_logic_1 : sevenseg_numbers_logic
      PORT MAP ( accel             => s_logisimBus1(3 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 sevensegment      => s_logisimBus17(7 DOWNTO 0) );

   sevenseg_numbers_logic_2 : sevenseg_numbers_logic
      PORT MAP ( accel             => s_logisimBus26(3 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 sevensegment      => s_logisimBus33(7 DOWNTO 0) );

   sevenseg_numbers_logic_3 : sevenseg_numbers_logic
      PORT MAP ( accel             => s_logisimBus31(3 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 sevensegment      => s_logisimBus40(7 DOWNTO 0) );

   sevenseg_numbers_logic_4 : sevenseg_numbers_logic
      PORT MAP ( accel             => s_logisimBus25(3 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 sevensegment      => s_logisimBus9(7 DOWNTO 0) );

   sevenseg_numbers_logic_5 : sevenseg_numbers_logic
      PORT MAP ( accel             => s_logisimBus39(3 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 sevensegment      => s_logisimBus0(7 DOWNTO 0) );

   sevenseg_numbers_logic_6 : sevenseg_numbers_logic
      PORT MAP ( accel             => s_logisimBus23(3 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 sevensegment      => s_logisimBus4(7 DOWNTO 0) );

   sevenseg_numbers_logic_7 : sevenseg_numbers_logic
      PORT MAP ( accel             => s_logisimBus36(3 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 sevensegment      => s_logisimBus3(7 DOWNTO 0) );

   hex5 : sevenseg_mapped
      PORT MAP ( logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimClockTree2    => logisimClockTree2,
                 logisimClockTree3    => logisimClockTree3,
                 logisimClockTree4    => logisimClockTree4,
                 logisimOutputBubbles => logisimOutputBubbles(7  DOWNTO  0),
                 sevenseg_input       => s_logisimBus12(7 DOWNTO 0) );

   hex4 : sevenseg_mapped
      PORT MAP ( logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimClockTree2    => logisimClockTree2,
                 logisimClockTree3    => logisimClockTree3,
                 logisimClockTree4    => logisimClockTree4,
                 logisimOutputBubbles => logisimOutputBubbles(15  DOWNTO  8),
                 sevenseg_input       => s_logisimBus16(7 DOWNTO 0) );

   hex3 : sevenseg_mapped
      PORT MAP ( logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimClockTree2    => logisimClockTree2,
                 logisimClockTree3    => logisimClockTree3,
                 logisimClockTree4    => logisimClockTree4,
                 logisimOutputBubbles => logisimOutputBubbles(23  DOWNTO  16),
                 sevenseg_input       => s_logisimBus13(7 DOWNTO 0) );

   hex2 : sevenseg_mapped
      PORT MAP ( logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimClockTree2    => logisimClockTree2,
                 logisimClockTree3    => logisimClockTree3,
                 logisimClockTree4    => logisimClockTree4,
                 logisimOutputBubbles => logisimOutputBubbles(31  DOWNTO  24),
                 sevenseg_input       => s_logisimBus14(7 DOWNTO 0) );

   hex1 : sevenseg_mapped
      PORT MAP ( logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimClockTree2    => logisimClockTree2,
                 logisimClockTree3    => logisimClockTree3,
                 logisimClockTree4    => logisimClockTree4,
                 logisimOutputBubbles => logisimOutputBubbles(39  DOWNTO  32),
                 sevenseg_input       => s_logisimBus15(7 DOWNTO 0) );

   hex0 : sevenseg_mapped
      PORT MAP ( logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimClockTree2    => logisimClockTree2,
                 logisimClockTree3    => logisimClockTree3,
                 logisimClockTree4    => logisimClockTree4,
                 logisimOutputBubbles => logisimOutputBubbles(47  DOWNTO  40),
                 sevenseg_input       => s_logisimBus11(7 DOWNTO 0) );

END platformIndependent;
