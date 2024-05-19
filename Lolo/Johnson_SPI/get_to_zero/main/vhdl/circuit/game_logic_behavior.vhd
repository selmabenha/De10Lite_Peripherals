--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero                                                  ==
--== Component : game_logic                                                   ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF game_logic IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT AND_GATE_3_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT AND_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT OR_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT OR_GATE_3_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT hex_to_decimal_16_bits
         PORT ( val      : IN  std_logic_vector( 15 DOWNTO 0 );
                hundreds : OUT std_logic_vector( 3 DOWNTO 0 );
                ones     : OUT std_logic_vector( 3 DOWNTO 0 );
                tens     : OUT std_logic_vector( 3 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT Multiplexer_bus_2
         GENERIC ( nrOfBits : INTEGER );
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_1 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                sel     : IN  std_logic;
                muxOut  : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT Comparator
         GENERIC ( nrOfBits       : INTEGER;
                   twosComplement : INTEGER );
         PORT ( dataA         : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                dataB         : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                aEqualsB      : OUT std_logic;
                aGreaterThanB : OUT std_logic;
                aLessThanB    : OUT std_logic );
      END COMPONENT;

      COMPONENT Adder
         GENERIC ( extendedBits : INTEGER;
                   nrOfBits     : INTEGER );
         PORT ( carryIn  : IN  std_logic;
                dataA    : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                dataB    : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                carryOut : OUT std_logic;
                result   : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT D_FLIPFLOP
         GENERIC ( invertClockEnable : INTEGER );
         PORT ( clock  : IN  std_logic;
                d      : IN  std_logic;
                preset : IN  std_logic;
                reset  : IN  std_logic;
                tick   : IN  std_logic;
                q      : OUT std_logic;
                qBar   : OUT std_logic );
      END COMPONENT;

      COMPONENT absolute_val_and_sign
         PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree4 : IN  std_logic_vector( 4 DOWNTO 0 );
                unfiltered        : IN  std_logic_vector( 15 DOWNTO 0 );
                negative          : OUT std_logic;
                value             : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT twos_complement
         PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree4 : IN  std_logic_vector( 4 DOWNTO 0 );
                negative_number   : IN  std_logic_vector( 15 DOWNTO 0 );
                absolute_val      : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT accel_final_driver_v2
         PORT ( accel_input       : IN  std_logic;
                enable_accel      : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree4 : IN  std_logic_vector( 4 DOWNTO 0 );
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

      COMPONENT save_random_val
         PORT ( button            : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree4 : IN  std_logic_vector( 4 DOWNTO 0 );
                max_value         : IN  std_logic_vector( 7 DOWNTO 0 );
                min_value         : IN  std_logic_vector( 7 DOWNTO 0 );
                rand_clock        : IN  std_logic;
                reset             : IN  std_logic;
                final_random_val  : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT debouce
         PORT ( button            : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree2 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree3 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree4 : IN  std_logic_vector( 4 DOWNTO 0 );
                debouced          : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus1  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus10 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus16 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus17 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus18 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus20 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus23 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus26 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus28 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus29 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus35 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus36 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus37 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus39 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus40 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus41 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus42 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus43 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus47 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus51 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus53 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus56 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus59 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus64 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus65 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus66 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus70 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus71 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus75 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus76 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus77 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus78 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus79 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus80 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus81 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus82 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet14 : std_logic;
   SIGNAL s_logisimNet15 : std_logic;
   SIGNAL s_logisimNet19 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet21 : std_logic;
   SIGNAL s_logisimNet22 : std_logic;
   SIGNAL s_logisimNet24 : std_logic;
   SIGNAL s_logisimNet25 : std_logic;
   SIGNAL s_logisimNet27 : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet30 : std_logic;
   SIGNAL s_logisimNet31 : std_logic;
   SIGNAL s_logisimNet32 : std_logic;
   SIGNAL s_logisimNet33 : std_logic;
   SIGNAL s_logisimNet34 : std_logic;
   SIGNAL s_logisimNet38 : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet44 : std_logic;
   SIGNAL s_logisimNet45 : std_logic;
   SIGNAL s_logisimNet46 : std_logic;
   SIGNAL s_logisimNet48 : std_logic;
   SIGNAL s_logisimNet49 : std_logic;
   SIGNAL s_logisimNet50 : std_logic;
   SIGNAL s_logisimNet55 : std_logic;
   SIGNAL s_logisimNet57 : std_logic;
   SIGNAL s_logisimNet58 : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet62 : std_logic;
   SIGNAL s_logisimNet63 : std_logic;
   SIGNAL s_logisimNet67 : std_logic;
   SIGNAL s_logisimNet68 : std_logic;
   SIGNAL s_logisimNet69 : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet72 : std_logic;
   SIGNAL s_logisimNet73 : std_logic;
   SIGNAL s_logisimNet74 : std_logic;
   SIGNAL s_logisimNet83 : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet12 <= logisimClockTree2(0);
   s_logisimNet33 <= logisimClockTree2(0);
   s_logisimNet72 <= logisimClockTree0(0);
   s_logisimNet9  <= logisimClockTree0(0);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus64(15 DOWNTO 0) <= x_offset;
   s_logisimBus65(15 DOWNTO 0) <= y_offset;
   s_logisimBus66(15 DOWNTO 0) <= z_offset;
   s_logisimNet46              <= button;
   s_logisimNet49              <= reset;
   s_logisimNet62              <= miso;
   s_logisimNet63              <= accel_input;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   cs         <= s_logisimNet69;
   done       <= s_logisimNet13;
   game_reset <= s_logisimNet58;
   mosi       <= s_logisimNet67;
   negative_x <= s_logisimNet14;
   negative_y <= s_logisimNet4;
   ones_x     <= s_logisimBus36(3 DOWNTO 0);
   ones_y     <= s_logisimBus28(3 DOWNTO 0);
   sclk       <= s_logisimNet68;
   tens_x     <= s_logisimBus35(3 DOWNTO 0);
   tens_y     <= s_logisimBus47(3 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus70(15 DOWNTO 0)  <=  X"0000";


   -- Constant
    s_logisimBus71(15 DOWNTO 0)  <=  X"0000";


   -- Constant
    s_logisimBus75(7 DOWNTO 0)  <=  X"12";


   -- Constant
    s_logisimBus76(7 DOWNTO 0)  <=  X"52";


   -- Constant
    s_logisimBus77(7 DOWNTO 0)  <=  X"00";


   -- Constant
    s_logisimBus78(7 DOWNTO 0)  <=  X"01";


   -- Constant
    s_logisimBus18(15 DOWNTO 8)  <=  X"00";


   -- Constant
    s_logisimNet44  <=  '1';


   -- Constant
    s_logisimBus79(7 DOWNTO 0)  <=  X"14";


   -- Constant
    s_logisimBus80(7 DOWNTO 0)  <=  X"50";


   -- Constant
    s_logisimBus81(7 DOWNTO 0)  <=  X"00";


   -- Constant
    s_logisimBus82(7 DOWNTO 0)  <=  X"01";


   -- Constant
    s_logisimBus16(15 DOWNTO 0)  <=  X"0000";


   -- Constant
    s_logisimBus51(15 DOWNTO 0)  <=  X"0064";


   -- Constant
    s_logisimBus17(15 DOWNTO 0)  <=  X"FF9C";


   -- Constant
    s_logisimBus40(15 DOWNTO 0)  <=  X"0000";


   -- Constant
    s_logisimBus59(15 DOWNTO 0)  <=  X"0064";


   -- Constant
    s_logisimBus41(15 DOWNTO 0)  <=  X"FF9C";


   -- Constant
    s_logisimBus20(15 DOWNTO 8)  <=  X"00";


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet7,
                 input2 => '1',
                 input3 => s_logisimNet48,
                 result => s_logisimNet21 );

   GATES_2 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet27,
                 input2 => s_logisimNet6,
                 result => s_logisimNet13 );

   GATES_3 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet50,
                 input2 => s_logisimNet58,
                 result => s_logisimNet32 );

   GATES_4 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet50,
                 input2 => s_logisimNet58,
                 result => s_logisimNet19 );

   GATES_5 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet50,
                 input2 => s_logisimNet58,
                 result => s_logisimNet22 );

   GATES_6 : OR_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet57,
                 input2 => s_logisimNet45,
                 input3 => s_logisimNet34,
                 result => s_logisimNet73 );

   GATES_7 : OR_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet3,
                 input2 => s_logisimNet11,
                 input3 => s_logisimNet24,
                 result => s_logisimNet74 );

   GATES_8 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet55,
                 input2 => '1',
                 input3 => s_logisimNet38,
                 result => s_logisimNet15 );

   hex_to_decimal_16_bits_1 : hex_to_decimal_16_bits
      PORT MAP ( hundreds => OPEN,
                 ones     => s_logisimBus36(3 DOWNTO 0),
                 tens     => s_logisimBus35(3 DOWNTO 0),
                 val      => s_logisimBus42(15 DOWNTO 0) );

   hex_to_decimal_16_bits_2 : hex_to_decimal_16_bits
      PORT MAP ( hundreds => OPEN,
                 ones     => s_logisimBus28(3 DOWNTO 0),
                 tens     => s_logisimBus47(3 DOWNTO 0),
                 val      => s_logisimBus53(15 DOWNTO 0) );

   PLEXERS_11 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus0(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus70(15 DOWNTO 0),
                 muxOut  => s_logisimBus42(15 DOWNTO 0),
                 sel     => s_logisimNet27 );

   PLEXERS_12 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus20(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus26(15 DOWNTO 0),
                 muxOut  => s_logisimBus56(15 DOWNTO 0),
                 sel     => s_logisimBus43(0) );

   PLEXERS_13 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus29(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus71(15 DOWNTO 0),
                 muxOut  => s_logisimBus53(15 DOWNTO 0),
                 sel     => s_logisimNet6 );

   PLEXERS_14 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus18(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus8(15 DOWNTO 0),
                 muxOut  => s_logisimBus23(15 DOWNTO 0),
                 sel     => s_logisimBus5(0) );

   ARITH_15 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 1 )
      PORT MAP ( aEqualsB      => s_logisimNet57,
                 aGreaterThanB => OPEN,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus10(15 DOWNTO 0),
                 dataB         => s_logisimBus16(15 DOWNTO 0) );

   ARITH_16 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 1 )
      PORT MAP ( aEqualsB      => s_logisimNet45,
                 aGreaterThanB => OPEN,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus10(15 DOWNTO 0),
                 dataB         => s_logisimBus51(15 DOWNTO 0) );

   ARITH_17 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 1 )
      PORT MAP ( aEqualsB      => s_logisimNet34,
                 aGreaterThanB => OPEN,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus10(15 DOWNTO 0),
                 dataB         => s_logisimBus17(15 DOWNTO 0) );

   ARITH_18 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus56(15 DOWNTO 0),
                 dataB    => s_logisimBus37(15 DOWNTO 0),
                 result   => s_logisimBus10(15 DOWNTO 0) );

   ARITH_19 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 1 )
      PORT MAP ( aEqualsB      => s_logisimNet3,
                 aGreaterThanB => OPEN,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus1(15 DOWNTO 0),
                 dataB         => s_logisimBus40(15 DOWNTO 0) );

   ARITH_20 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 1 )
      PORT MAP ( aEqualsB      => s_logisimNet11,
                 aGreaterThanB => OPEN,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus1(15 DOWNTO 0),
                 dataB         => s_logisimBus59(15 DOWNTO 0) );

   ARITH_21 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 1 )
      PORT MAP ( aEqualsB      => s_logisimNet24,
                 aGreaterThanB => OPEN,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus1(15 DOWNTO 0),
                 dataB         => s_logisimBus41(15 DOWNTO 0) );

   ARITH_22 : Adder
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( carryIn  => '0',
                 carryOut => OPEN,
                 dataA    => s_logisimBus23(15 DOWNTO 0),
                 dataB    => s_logisimBus39(15 DOWNTO 0),
                 result   => s_logisimBus1(15 DOWNTO 0) );

   MEMORY_23 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => '0',
                 d      => '0',
                 preset => s_logisimNet15,
                 q      => s_logisimNet27,
                 qBar   => OPEN,
                 reset  => s_logisimNet19,
                 tick   => '0' );

   MEMORY_24 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => '0',
                 d      => '0',
                 preset => s_logisimNet21,
                 q      => s_logisimNet6,
                 qBar   => OPEN,
                 reset  => s_logisimNet22,
                 tick   => '0' );

   MEMORY_25 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimNet46,
                 preset => '0',
                 q      => s_logisimNet58,
                 qBar   => OPEN,
                 reset  => '0',
                 tick   => logisimClockTree0(2) );

   MEMORY_26 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => '0',
                 d      => '0',
                 preset => s_logisimNet2,
                 q      => s_logisimNet38,
                 qBar   => OPEN,
                 reset  => s_logisimNet19,
                 tick   => '0' );

   MEMORY_27 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => logisimClockTree2(4),
                 d      => s_logisimNet73,
                 preset => '0',
                 q      => s_logisimNet55,
                 qBar   => OPEN,
                 reset  => '0',
                 tick   => logisimClockTree2(2) );

   MEMORY_28 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => '0',
                 d      => '0',
                 preset => s_logisimNet31,
                 q      => s_logisimNet48,
                 qBar   => OPEN,
                 reset  => s_logisimNet22,
                 tick   => '0' );

   MEMORY_29 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => logisimClockTree2(4),
                 d      => s_logisimNet74,
                 preset => '0',
                 q      => s_logisimNet7,
                 qBar   => OPEN,
                 reset  => '0',
                 tick   => logisimClockTree2(2) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   absolute_val_and_sign_1 : absolute_val_and_sign
      PORT MAP ( logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 negative          => s_logisimNet14,
                 unfiltered        => s_logisimBus10(15 DOWNTO 0),
                 value             => s_logisimBus0(15 DOWNTO 0) );

   absolute_val_and_sign_2 : absolute_val_and_sign
      PORT MAP ( logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 negative          => s_logisimNet4,
                 unfiltered        => s_logisimBus1(15 DOWNTO 0),
                 value             => s_logisimBus29(15 DOWNTO 0) );

   twos_complement_1 : twos_complement
      PORT MAP ( absolute_val      => s_logisimBus26(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 negative_number   => s_logisimBus20(15 DOWNTO 0) );

   twos_complement_2 : twos_complement
      PORT MAP ( absolute_val      => s_logisimBus8(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 negative_number   => s_logisimBus18(15 DOWNTO 0) );

   accel_final_driver_v2_1 : accel_final_driver_v2
      PORT MAP ( accel_input       => s_logisimNet63,
                 cs                => s_logisimNet69,
                 down              => OPEN,
                 enable_accel      => s_logisimNet44,
                 left              => OPEN,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 miso              => s_logisimNet62,
                 mosi              => s_logisimNet67,
                 right             => OPEN,
                 rst               => s_logisimNet32,
                 sclk              => s_logisimNet68,
                 up                => OPEN,
                 x_filtered        => s_logisimBus37(15 DOWNTO 0),
                 x_large           => OPEN,
                 x_medium          => OPEN,
                 x_offset          => s_logisimBus64(15 DOWNTO 0),
                 x_small           => OPEN,
                 y_filtered        => s_logisimBus39(15 DOWNTO 0),
                 y_large           => OPEN,
                 y_medium          => OPEN,
                 y_offset          => s_logisimBus65(15 DOWNTO 0),
                 y_small           => OPEN,
                 z_filtered        => OPEN,
                 z_offset          => s_logisimBus66(15 DOWNTO 0) );

   save_random_val_3 : save_random_val
      PORT MAP ( button            => s_logisimNet83,
                 final_random_val  => s_logisimBus18(7 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 max_value         => s_logisimBus76(7 DOWNTO 0),
                 min_value         => s_logisimBus75(7 DOWNTO 0),
                 rand_clock        => s_logisimNet9,
                 reset             => s_logisimNet50 );

   save_random_val_4 : save_random_val
      PORT MAP ( button            => s_logisimNet83,
                 final_random_val  => s_logisimBus5(7 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 max_value         => s_logisimBus78(7 DOWNTO 0),
                 min_value         => s_logisimBus77(7 DOWNTO 0),
                 rand_clock        => s_logisimNet9,
                 reset             => s_logisimNet50 );

   debouce_1 : debouce
      PORT MAP ( button            => s_logisimNet58,
                 debouced          => s_logisimNet83,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4 );

   debouce_2 : debouce
      PORT MAP ( button            => s_logisimNet49,
                 debouced          => s_logisimNet50,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4 );

   save_random_val_1 : save_random_val
      PORT MAP ( button            => s_logisimNet83,
                 final_random_val  => s_logisimBus20(7 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 max_value         => s_logisimBus80(7 DOWNTO 0),
                 min_value         => s_logisimBus79(7 DOWNTO 0),
                 rand_clock        => s_logisimNet9,
                 reset             => s_logisimNet50 );

   save_random_val_2 : save_random_val
      PORT MAP ( button            => s_logisimNet83,
                 final_random_val  => s_logisimBus43(7 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4,
                 max_value         => s_logisimBus82(7 DOWNTO 0),
                 min_value         => s_logisimBus81(7 DOWNTO 0),
                 rand_clock        => s_logisimNet9,
                 reset             => s_logisimNet50 );

   debouce_3 : debouce
      PORT MAP ( button            => s_logisimNet83,
                 debouced          => s_logisimNet2,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4 );

   debouce_4 : debouce
      PORT MAP ( button            => s_logisimNet83,
                 debouced          => s_logisimNet31,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 logisimClockTree2 => logisimClockTree2,
                 logisimClockTree3 => logisimClockTree3,
                 logisimClockTree4 => logisimClockTree4 );

END platformIndependent;
