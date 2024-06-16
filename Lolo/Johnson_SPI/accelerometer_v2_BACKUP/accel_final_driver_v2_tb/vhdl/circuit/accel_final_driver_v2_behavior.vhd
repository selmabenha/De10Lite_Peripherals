--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2_BACKUP                                      ==
--== Component : accel_final_driver_v2                                        ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF accel_final_driver_v2 IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT OR_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT AND_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
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

      COMPONENT Subtractor
         GENERIC ( extendedBits : INTEGER;
                   nrOfBits     : INTEGER );
         PORT ( borrowIn  : IN  std_logic;
                dataA     : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                dataB     : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                borrowOut : OUT std_logic;
                result    : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
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

      COMPONENT signed_fast_filter
         PORT ( clock             : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                reset             : IN  std_logic;
                unfiltered        : IN  std_logic_vector( 15 DOWNTO 0 );
                filtered          : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT absolute_val_and_sign
         PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                unfiltered        : IN  std_logic_vector( 15 DOWNTO 0 );
                negative          : OUT std_logic;
                value             : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT reset_logic
         PORT ( enable            : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                reset             : IN  std_logic;
                enable_out        : OUT std_logic;
                reset_out         : OUT std_logic );
      END COMPONENT;

      COMPONENT accel_driver_logisim
         PORT ( accel_input       : IN  std_logic;
                enable_accel      : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                miso              : IN  std_logic;
                rst               : IN  std_logic;
                Accelerometer     : OUT std_logic_vector( 47 DOWNTO 0 );
                cs                : OUT std_logic;
                mosi              : OUT std_logic;
                sclk              : OUT std_logic );
      END COMPONENT;

      COMPONENT signed_div_by_128
         PORT ( logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                unfiltered        : IN  std_logic_vector( 15 DOWNTO 0 );
                result            : OUT std_logic_vector( 15 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus1  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus17 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus18 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus19 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus2  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus28 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus29 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus3  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus30 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus34 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus55 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus56 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus57 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus63 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus64 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus65 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus66 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus67 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus68 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus69 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus70 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus71 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus72 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus73 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus74 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus75 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus76 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus77 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus81 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus82 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus86 : std_logic_vector( 47 DOWNTO 0 );
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet14 : std_logic;
   SIGNAL s_logisimNet15 : std_logic;
   SIGNAL s_logisimNet16 : std_logic;
   SIGNAL s_logisimNet20 : std_logic;
   SIGNAL s_logisimNet21 : std_logic;
   SIGNAL s_logisimNet22 : std_logic;
   SIGNAL s_logisimNet23 : std_logic;
   SIGNAL s_logisimNet24 : std_logic;
   SIGNAL s_logisimNet25 : std_logic;
   SIGNAL s_logisimNet26 : std_logic;
   SIGNAL s_logisimNet27 : std_logic;
   SIGNAL s_logisimNet31 : std_logic;
   SIGNAL s_logisimNet32 : std_logic;
   SIGNAL s_logisimNet33 : std_logic;
   SIGNAL s_logisimNet35 : std_logic;
   SIGNAL s_logisimNet36 : std_logic;
   SIGNAL s_logisimNet37 : std_logic;
   SIGNAL s_logisimNet38 : std_logic;
   SIGNAL s_logisimNet39 : std_logic;
   SIGNAL s_logisimNet40 : std_logic;
   SIGNAL s_logisimNet41 : std_logic;
   SIGNAL s_logisimNet42 : std_logic;
   SIGNAL s_logisimNet43 : std_logic;
   SIGNAL s_logisimNet44 : std_logic;
   SIGNAL s_logisimNet45 : std_logic;
   SIGNAL s_logisimNet46 : std_logic;
   SIGNAL s_logisimNet47 : std_logic;
   SIGNAL s_logisimNet48 : std_logic;
   SIGNAL s_logisimNet49 : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet50 : std_logic;
   SIGNAL s_logisimNet51 : std_logic;
   SIGNAL s_logisimNet52 : std_logic;
   SIGNAL s_logisimNet53 : std_logic;
   SIGNAL s_logisimNet54 : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet61 : std_logic;
   SIGNAL s_logisimNet62 : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet78 : std_logic;
   SIGNAL s_logisimNet79 : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet80 : std_logic;
   SIGNAL s_logisimNet83 : std_logic;
   SIGNAL s_logisimNet84 : std_logic;
   SIGNAL s_logisimNet85 : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet78 <= logisimClockTree1(0);
   s_logisimNet79 <= logisimClockTree1(0);
   s_logisimNet80 <= logisimClockTree1(0);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus55(15 DOWNTO 0) <= x_offset;
   s_logisimBus56(15 DOWNTO 0) <= y_offset;
   s_logisimBus57(15 DOWNTO 0) <= z_offset;
   s_logisimNet20              <= enable_accel;
   s_logisimNet38              <= miso;
   s_logisimNet48              <= accel_input;
   s_logisimNet53              <= rst;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   cs         <= s_logisimNet85;
   down       <= s_logisimNet31;
   left       <= s_logisimNet14;
   mosi       <= s_logisimNet83;
   right      <= s_logisimNet43;
   sclk       <= s_logisimNet84;
   up         <= s_logisimNet50;
   x_filtered <= s_logisimBus82(15 DOWNTO 0);
   x_large    <= s_logisimNet45;
   x_medium   <= s_logisimNet39;
   x_small    <= s_logisimNet46;
   y_filtered <= s_logisimBus81(15 DOWNTO 0);
   y_large    <= s_logisimNet51;
   y_medium   <= s_logisimNet44;
   y_small    <= s_logisimNet49;
   z_filtered <= s_logisimBus34(15 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus66(15 DOWNTO 0)  <=  X"000A";


   -- Constant
    s_logisimBus67(15 DOWNTO 0)  <=  X"0028";


   -- Constant
    s_logisimBus68(15 DOWNTO 0)  <=  X"0028";


   -- Constant
    s_logisimBus69(15 DOWNTO 0)  <=  X"0046";


   -- Constant
    s_logisimBus70(15 DOWNTO 0)  <=  X"0046";


   -- Constant
    s_logisimBus71(15 DOWNTO 0)  <=  X"000A";


   -- Constant
    s_logisimBus72(15 DOWNTO 0)  <=  X"000A";


   -- Constant
    s_logisimBus73(15 DOWNTO 0)  <=  X"0028";


   -- Constant
    s_logisimBus74(15 DOWNTO 0)  <=  X"0028";


   -- Constant
    s_logisimBus75(15 DOWNTO 0)  <=  X"0046";


   -- Constant
    s_logisimBus76(15 DOWNTO 0)  <=  X"0046";


   -- Constant
    s_logisimBus63(15 DOWNTO 0)  <=  X"0000";


   -- Constant
    s_logisimBus64(15 DOWNTO 0)  <=  X"0000";


   -- Constant
    s_logisimBus65(15 DOWNTO 0)  <=  X"0000";


   -- Constant
    s_logisimBus77(15 DOWNTO 0)  <=  X"000A";


   -- NOT Gate
   s_logisimNet61 <=  NOT s_logisimNet10;

   -- NOT Gate
   s_logisimNet62 <=  NOT s_logisimNet33;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet13,
                 input2 => s_logisimNet32,
                 result => s_logisimNet5 );

   GATES_2 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet22,
                 input2 => s_logisimNet21,
                 result => s_logisimNet54 );

   GATES_3 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet23,
                 input2 => s_logisimNet61,
                 result => s_logisimNet31 );

   GATES_4 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet23,
                 input2 => s_logisimNet10,
                 result => s_logisimNet50 );

   GATES_5 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet26,
                 input2 => s_logisimNet5,
                 result => s_logisimNet49 );

   GATES_6 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet27,
                 input2 => s_logisimNet54,
                 result => s_logisimNet44 );

   GATES_7 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet25,
                 input2 => s_logisimNet24,
                 result => s_logisimNet52 );

   GATES_8 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet12,
                 input2 => s_logisimNet11,
                 result => s_logisimNet47 );

   GATES_9 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet9,
                 input2 => s_logisimNet62,
                 result => s_logisimNet14 );

   GATES_10 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet9,
                 input2 => s_logisimNet33,
                 result => s_logisimNet43 );

   GATES_11 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet15,
                 input2 => s_logisimNet52,
                 result => s_logisimNet46 );

   GATES_12 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet16,
                 input2 => s_logisimNet47,
                 result => s_logisimNet39 );

   PLEXERS_13 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus2(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus63(15 DOWNTO 0),
                 muxOut  => s_logisimBus28(15 DOWNTO 0),
                 sel     => s_logisimNet35 );

   PLEXERS_14 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus3(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus64(15 DOWNTO 0),
                 muxOut  => s_logisimBus29(15 DOWNTO 0),
                 sel     => s_logisimNet36 );

   PLEXERS_15 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 16 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus4(15 DOWNTO 0),
                 muxIn_1 => s_logisimBus65(15 DOWNTO 0),
                 muxOut  => s_logisimBus30(15 DOWNTO 0),
                 sel     => s_logisimNet37 );

   ARITH_16 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 0 )
      PORT MAP ( aEqualsB      => OPEN,
                 aGreaterThanB => s_logisimNet26,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus0(15 DOWNTO 0),
                 dataB         => s_logisimBus66(15 DOWNTO 0) );

   ARITH_17 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 0 )
      PORT MAP ( aEqualsB      => s_logisimNet13,
                 aGreaterThanB => OPEN,
                 aLessThanB    => s_logisimNet32,
                 dataA         => s_logisimBus0(15 DOWNTO 0),
                 dataB         => s_logisimBus67(15 DOWNTO 0) );

   ARITH_18 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 0 )
      PORT MAP ( aEqualsB      => OPEN,
                 aGreaterThanB => s_logisimNet27,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus0(15 DOWNTO 0),
                 dataB         => s_logisimBus68(15 DOWNTO 0) );

   ARITH_19 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 0 )
      PORT MAP ( aEqualsB      => s_logisimNet22,
                 aGreaterThanB => OPEN,
                 aLessThanB    => s_logisimNet21,
                 dataA         => s_logisimBus0(15 DOWNTO 0),
                 dataB         => s_logisimBus69(15 DOWNTO 0) );

   ARITH_20 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 0 )
      PORT MAP ( aEqualsB      => OPEN,
                 aGreaterThanB => s_logisimNet51,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus0(15 DOWNTO 0),
                 dataB         => s_logisimBus70(15 DOWNTO 0) );

   ARITH_21 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 1 )
      PORT MAP ( aEqualsB      => OPEN,
                 aGreaterThanB => s_logisimNet23,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus0(15 DOWNTO 0),
                 dataB         => s_logisimBus71(15 DOWNTO 0) );

   ARITH_22 : Subtractor
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( borrowIn  => '0',
                 borrowOut => OPEN,
                 dataA     => s_logisimBus86(15 DOWNTO 0),
                 dataB     => s_logisimBus55(15 DOWNTO 0),
                 result    => s_logisimBus2(15 DOWNTO 0) );

   ARITH_23 : Subtractor
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( borrowIn  => '0',
                 borrowOut => OPEN,
                 dataA     => s_logisimBus86(31 DOWNTO 16),
                 dataB     => s_logisimBus56(15 DOWNTO 0),
                 result    => s_logisimBus3(15 DOWNTO 0) );

   ARITH_24 : Subtractor
      GENERIC MAP ( extendedBits => 17,
                    nrOfBits     => 16 )
      PORT MAP ( borrowIn  => '0',
                 borrowOut => OPEN,
                 dataA     => s_logisimBus86(47 DOWNTO 32),
                 dataB     => s_logisimBus57(15 DOWNTO 0),
                 result    => s_logisimBus4(15 DOWNTO 0) );

   ARITH_25 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 0 )
      PORT MAP ( aEqualsB      => OPEN,
                 aGreaterThanB => s_logisimNet15,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus1(15 DOWNTO 0),
                 dataB         => s_logisimBus72(15 DOWNTO 0) );

   ARITH_26 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 0 )
      PORT MAP ( aEqualsB      => s_logisimNet25,
                 aGreaterThanB => OPEN,
                 aLessThanB    => s_logisimNet24,
                 dataA         => s_logisimBus1(15 DOWNTO 0),
                 dataB         => s_logisimBus73(15 DOWNTO 0) );

   ARITH_27 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 0 )
      PORT MAP ( aEqualsB      => OPEN,
                 aGreaterThanB => s_logisimNet16,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus1(15 DOWNTO 0),
                 dataB         => s_logisimBus74(15 DOWNTO 0) );

   ARITH_28 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 0 )
      PORT MAP ( aEqualsB      => s_logisimNet12,
                 aGreaterThanB => OPEN,
                 aLessThanB    => s_logisimNet11,
                 dataA         => s_logisimBus1(15 DOWNTO 0),
                 dataB         => s_logisimBus75(15 DOWNTO 0) );

   ARITH_29 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 0 )
      PORT MAP ( aEqualsB      => OPEN,
                 aGreaterThanB => s_logisimNet45,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus1(15 DOWNTO 0),
                 dataB         => s_logisimBus76(15 DOWNTO 0) );

   ARITH_30 : Comparator
      GENERIC MAP ( nrOfBits       => 16,
                    twosComplement => 1 )
      PORT MAP ( aEqualsB      => OPEN,
                 aGreaterThanB => s_logisimNet9,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus1(15 DOWNTO 0),
                 dataB         => s_logisimBus77(15 DOWNTO 0) );

   MEMORY_31 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => '0',
                 d      => '0',
                 preset => s_logisimNet40,
                 q      => s_logisimNet35,
                 qBar   => OPEN,
                 reset  => s_logisimNet7,
                 tick   => '0' );

   MEMORY_32 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => '0',
                 d      => '0',
                 preset => s_logisimNet41,
                 q      => s_logisimNet36,
                 qBar   => OPEN,
                 reset  => s_logisimNet8,
                 tick   => '0' );

   MEMORY_33 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => '0',
                 d      => '0',
                 preset => s_logisimNet42,
                 q      => s_logisimNet37,
                 qBar   => OPEN,
                 reset  => s_logisimNet6,
                 tick   => '0' );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   signed_fast_filter_1 : signed_fast_filter
      PORT MAP ( clock             => s_logisimNet78,
                 filtered          => s_logisimBus82(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 reset             => s_logisimNet53,
                 unfiltered        => s_logisimBus17(15 DOWNTO 0) );

   signed_fast_filter_2 : signed_fast_filter
      PORT MAP ( clock             => s_logisimNet79,
                 filtered          => s_logisimBus81(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 reset             => s_logisimNet53,
                 unfiltered        => s_logisimBus18(15 DOWNTO 0) );

   signed_fast_filter_3 : signed_fast_filter
      PORT MAP ( clock             => s_logisimNet80,
                 filtered          => s_logisimBus34(15 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 reset             => s_logisimNet53,
                 unfiltered        => s_logisimBus19(15 DOWNTO 0) );

   absolute_val_and_sign_2 : absolute_val_and_sign
      PORT MAP ( logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 negative          => s_logisimNet10,
                 unfiltered        => s_logisimBus81(15 DOWNTO 0),
                 value             => s_logisimBus0(15 DOWNTO 0) );

   reset_logic_3 : reset_logic
      PORT MAP ( enable            => s_logisimNet20,
                 enable_out        => s_logisimNet6,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 reset             => s_logisimNet53,
                 reset_out         => s_logisimNet42 );

   reset_logic_1 : reset_logic
      PORT MAP ( enable            => s_logisimNet20,
                 enable_out        => s_logisimNet7,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 reset             => s_logisimNet53,
                 reset_out         => s_logisimNet40 );

   reset_logic_2 : reset_logic
      PORT MAP ( enable            => s_logisimNet20,
                 enable_out        => s_logisimNet8,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 reset             => s_logisimNet53,
                 reset_out         => s_logisimNet41 );

   absolute_val_and_sign_1 : absolute_val_and_sign
      PORT MAP ( logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 negative          => s_logisimNet33,
                 unfiltered        => s_logisimBus82(15 DOWNTO 0),
                 value             => s_logisimBus1(15 DOWNTO 0) );

   accel_driver_logisim_1 : accel_driver_logisim
      PORT MAP ( Accelerometer     => s_logisimBus86(47 DOWNTO 0),
                 accel_input       => s_logisimNet48,
                 cs                => s_logisimNet85,
                 enable_accel      => s_logisimNet20,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 miso              => s_logisimNet38,
                 mosi              => s_logisimNet83,
                 rst               => s_logisimNet53,
                 sclk              => s_logisimNet84 );

   signed_div_by_128_1 : signed_div_by_128
      PORT MAP ( logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 result            => s_logisimBus17(15 DOWNTO 0),
                 unfiltered        => s_logisimBus28(15 DOWNTO 0) );

   signed_div_by_128_2 : signed_div_by_128
      PORT MAP ( logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 result            => s_logisimBus18(15 DOWNTO 0),
                 unfiltered        => s_logisimBus29(15 DOWNTO 0) );

   signed_div_by_128_3 : signed_div_by_128
      PORT MAP ( logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1,
                 result            => s_logisimBus19(15 DOWNTO 0),
                 unfiltered        => s_logisimBus30(15 DOWNTO 0) );

END platformIndependent;
