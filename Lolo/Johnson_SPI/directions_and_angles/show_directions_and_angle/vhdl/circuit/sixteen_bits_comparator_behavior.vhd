--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : directions_and_angles                                        ==
--== Component : sixteen_bits_comparator                                      ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF sixteen_bits_comparator IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT one_bits_with_inputs
         PORT ( A                      : IN  std_logic;
                A_bigger_than_B_input  : IN  std_logic;
                A_equal_B_input        : IN  std_logic;
                A_less_B_input         : IN  std_logic;
                B                      : IN  std_logic;
                logisimClockTree0      : IN  std_logic_vector( 4 DOWNTO 0 );
                A_bigger_than_B_output : OUT std_logic;
                A_equals_B_output      : OUT std_logic;
                A_less_than_B_output   : OUT std_logic );
      END COMPONENT;

      COMPONENT one_bits_comparator
         PORT ( A                 : IN  std_logic;
                B                 : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                A_bigger_than_B   : OUT std_logic;
                A_equals_B        : OUT std_logic;
                A_less_than_B     : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus44 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus47 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
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
   SIGNAL s_logisimNet21 : std_logic;
   SIGNAL s_logisimNet22 : std_logic;
   SIGNAL s_logisimNet23 : std_logic;
   SIGNAL s_logisimNet24 : std_logic;
   SIGNAL s_logisimNet25 : std_logic;
   SIGNAL s_logisimNet26 : std_logic;
   SIGNAL s_logisimNet27 : std_logic;
   SIGNAL s_logisimNet28 : std_logic;
   SIGNAL s_logisimNet29 : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet30 : std_logic;
   SIGNAL s_logisimNet31 : std_logic;
   SIGNAL s_logisimNet32 : std_logic;
   SIGNAL s_logisimNet33 : std_logic;
   SIGNAL s_logisimNet34 : std_logic;
   SIGNAL s_logisimNet35 : std_logic;
   SIGNAL s_logisimNet36 : std_logic;
   SIGNAL s_logisimNet37 : std_logic;
   SIGNAL s_logisimNet38 : std_logic;
   SIGNAL s_logisimNet39 : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet40 : std_logic;
   SIGNAL s_logisimNet41 : std_logic;
   SIGNAL s_logisimNet42 : std_logic;
   SIGNAL s_logisimNet43 : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet54 : std_logic;
   SIGNAL s_logisimNet55 : std_logic;
   SIGNAL s_logisimNet56 : std_logic;
   SIGNAL s_logisimNet57 : std_logic;
   SIGNAL s_logisimNet58 : std_logic;
   SIGNAL s_logisimNet59 : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet60 : std_logic;
   SIGNAL s_logisimNet61 : std_logic;
   SIGNAL s_logisimNet62 : std_logic;
   SIGNAL s_logisimNet63 : std_logic;
   SIGNAL s_logisimNet64 : std_logic;
   SIGNAL s_logisimNet65 : std_logic;
   SIGNAL s_logisimNet66 : std_logic;
   SIGNAL s_logisimNet67 : std_logic;
   SIGNAL s_logisimNet68 : std_logic;
   SIGNAL s_logisimNet69 : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet70 : std_logic;
   SIGNAL s_logisimNet71 : std_logic;
   SIGNAL s_logisimNet72 : std_logic;
   SIGNAL s_logisimNet73 : std_logic;
   SIGNAL s_logisimNet74 : std_logic;
   SIGNAL s_logisimNet75 : std_logic;
   SIGNAL s_logisimNet76 : std_logic;
   SIGNAL s_logisimNet77 : std_logic;
   SIGNAL s_logisimNet78 : std_logic;
   SIGNAL s_logisimNet79 : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet80 : std_logic;
   SIGNAL s_logisimNet81 : std_logic;
   SIGNAL s_logisimNet82 : std_logic;
   SIGNAL s_logisimNet83 : std_logic;
   SIGNAL s_logisimNet84 : std_logic;
   SIGNAL s_logisimNet85 : std_logic;
   SIGNAL s_logisimNet86 : std_logic;
   SIGNAL s_logisimNet87 : std_logic;
   SIGNAL s_logisimNet88 : std_logic;
   SIGNAL s_logisimNet89 : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus44(15 DOWNTO 0) <= A;
   s_logisimBus47(15 DOWNTO 0) <= B;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   A_bigger_than_B <= s_logisimNet28;
   A_equals_B      <= s_logisimNet29;
   A_less_than_B   <= s_logisimNet38;

   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   one_bits_with_inputs_13 : one_bits_with_inputs
      PORT MAP ( A                      => s_logisimBus44(14),
                 A_bigger_than_B_input  => s_logisimNet71,
                 A_bigger_than_B_output => s_logisimNet56,
                 A_equal_B_input        => s_logisimNet70,
                 A_equals_B_output      => s_logisimNet55,
                 A_less_B_input         => s_logisimNet69,
                 A_less_than_B_output   => s_logisimNet54,
                 B                      => s_logisimBus47(14),
                 logisimClockTree0      => logisimClockTree0 );

   one_bits_with_inputs_9 : one_bits_with_inputs
      PORT MAP ( A                      => s_logisimBus44(10),
                 A_bigger_than_B_input  => s_logisimNet77,
                 A_bigger_than_B_output => s_logisimNet59,
                 A_equal_B_input        => s_logisimNet76,
                 A_equals_B_output      => s_logisimNet58,
                 A_less_B_input         => s_logisimNet75,
                 A_less_than_B_output   => s_logisimNet57,
                 B                      => s_logisimBus47(10),
                 logisimClockTree0      => logisimClockTree0 );

   one_bits_with_inputs_1 : one_bits_with_inputs
      PORT MAP ( A                      => s_logisimBus44(3),
                 A_bigger_than_B_input  => s_logisimNet83,
                 A_bigger_than_B_output => s_logisimNet39,
                 A_equal_B_input        => s_logisimNet82,
                 A_equals_B_output      => s_logisimNet13,
                 A_less_B_input         => s_logisimNet81,
                 A_less_than_B_output   => s_logisimNet32,
                 B                      => s_logisimBus47(3),
                 logisimClockTree0      => logisimClockTree0 );

   one_bits_with_inputs_4 : one_bits_with_inputs
      PORT MAP ( A                      => s_logisimBus44(7),
                 A_bigger_than_B_input  => s_logisimNet89,
                 A_bigger_than_B_output => s_logisimNet42,
                 A_equal_B_input        => s_logisimNet88,
                 A_equals_B_output      => s_logisimNet18,
                 A_less_B_input         => s_logisimNet87,
                 A_less_than_B_output   => s_logisimNet40,
                 B                      => s_logisimBus47(7),
                 logisimClockTree0      => logisimClockTree0 );

   one_bits_with_inputs_12 : one_bits_with_inputs
      PORT MAP ( A                      => s_logisimBus44(15),
                 A_bigger_than_B_input  => s_logisimNet56,
                 A_bigger_than_B_output => s_logisimNet28,
                 A_equal_B_input        => s_logisimNet55,
                 A_equals_B_output      => s_logisimNet29,
                 A_less_B_input         => s_logisimNet54,
                 A_less_than_B_output   => s_logisimNet38,
                 B                      => s_logisimBus47(15),
                 logisimClockTree0      => logisimClockTree0 );

   one_bits_with_inputs_8 : one_bits_with_inputs
      PORT MAP ( A                      => s_logisimBus44(11),
                 A_bigger_than_B_input  => s_logisimNet59,
                 A_bigger_than_B_output => s_logisimNet12,
                 A_equal_B_input        => s_logisimNet58,
                 A_equals_B_output      => s_logisimNet33,
                 A_less_B_input         => s_logisimNet57,
                 A_less_than_B_output   => s_logisimNet43,
                 B                      => s_logisimBus47(11),
                 logisimClockTree0      => logisimClockTree0 );

   one_bits_comparator_1 : one_bits_comparator
      PORT MAP ( A                 => s_logisimBus44(0),
                 A_bigger_than_B   => s_logisimNet62,
                 A_equals_B        => s_logisimNet61,
                 A_less_than_B     => s_logisimNet60,
                 B                 => s_logisimBus47(0),
                 logisimClockTree0 => logisimClockTree0 );

   one_bits_with_inputs_7 : one_bits_with_inputs
      PORT MAP ( A                      => s_logisimBus44(4),
                 A_bigger_than_B_input  => s_logisimNet39,
                 A_bigger_than_B_output => s_logisimNet65,
                 A_equal_B_input        => s_logisimNet13,
                 A_equals_B_output      => s_logisimNet64,
                 A_less_B_input         => s_logisimNet32,
                 A_less_than_B_output   => s_logisimNet63,
                 B                      => s_logisimBus47(4),
                 logisimClockTree0      => logisimClockTree0 );

   one_bits_with_inputs_15 : one_bits_with_inputs
      PORT MAP ( A                      => s_logisimBus44(12),
                 A_bigger_than_B_input  => s_logisimNet12,
                 A_bigger_than_B_output => s_logisimNet68,
                 A_equal_B_input        => s_logisimNet33,
                 A_equals_B_output      => s_logisimNet67,
                 A_less_B_input         => s_logisimNet43,
                 A_less_than_B_output   => s_logisimNet66,
                 B                      => s_logisimBus47(12),
                 logisimClockTree0      => logisimClockTree0 );

   one_bits_with_inputs_11 : one_bits_with_inputs
      PORT MAP ( A                      => s_logisimBus44(8),
                 A_bigger_than_B_input  => s_logisimNet42,
                 A_bigger_than_B_output => s_logisimNet74,
                 A_equal_B_input        => s_logisimNet18,
                 A_equals_B_output      => s_logisimNet73,
                 A_less_B_input         => s_logisimNet40,
                 A_less_than_B_output   => s_logisimNet72,
                 B                      => s_logisimBus47(8),
                 logisimClockTree0      => logisimClockTree0 );

   one_bits_with_inputs_3 : one_bits_with_inputs
      PORT MAP ( A                      => s_logisimBus44(1),
                 A_bigger_than_B_input  => s_logisimNet62,
                 A_bigger_than_B_output => s_logisimNet80,
                 A_equal_B_input        => s_logisimNet61,
                 A_equals_B_output      => s_logisimNet79,
                 A_less_B_input         => s_logisimNet60,
                 A_less_than_B_output   => s_logisimNet78,
                 B                      => s_logisimBus47(1),
                 logisimClockTree0      => logisimClockTree0 );

   one_bits_with_inputs_6 : one_bits_with_inputs
      PORT MAP ( A                      => s_logisimBus44(5),
                 A_bigger_than_B_input  => s_logisimNet65,
                 A_bigger_than_B_output => s_logisimNet86,
                 A_equal_B_input        => s_logisimNet64,
                 A_equals_B_output      => s_logisimNet85,
                 A_less_B_input         => s_logisimNet63,
                 A_less_than_B_output   => s_logisimNet84,
                 B                      => s_logisimBus47(5),
                 logisimClockTree0      => logisimClockTree0 );

   one_bits_with_inputs_14 : one_bits_with_inputs
      PORT MAP ( A                      => s_logisimBus44(13),
                 A_bigger_than_B_input  => s_logisimNet68,
                 A_bigger_than_B_output => s_logisimNet71,
                 A_equal_B_input        => s_logisimNet67,
                 A_equals_B_output      => s_logisimNet70,
                 A_less_B_input         => s_logisimNet66,
                 A_less_than_B_output   => s_logisimNet69,
                 B                      => s_logisimBus47(13),
                 logisimClockTree0      => logisimClockTree0 );

   one_bits_with_inputs_10 : one_bits_with_inputs
      PORT MAP ( A                      => s_logisimBus44(9),
                 A_bigger_than_B_input  => s_logisimNet74,
                 A_bigger_than_B_output => s_logisimNet77,
                 A_equal_B_input        => s_logisimNet73,
                 A_equals_B_output      => s_logisimNet76,
                 A_less_B_input         => s_logisimNet72,
                 A_less_than_B_output   => s_logisimNet75,
                 B                      => s_logisimBus47(9),
                 logisimClockTree0      => logisimClockTree0 );

   one_bits_with_inputs_2 : one_bits_with_inputs
      PORT MAP ( A                      => s_logisimBus44(2),
                 A_bigger_than_B_input  => s_logisimNet80,
                 A_bigger_than_B_output => s_logisimNet83,
                 A_equal_B_input        => s_logisimNet79,
                 A_equals_B_output      => s_logisimNet82,
                 A_less_B_input         => s_logisimNet78,
                 A_less_than_B_output   => s_logisimNet81,
                 B                      => s_logisimBus47(2),
                 logisimClockTree0      => logisimClockTree0 );

   one_bits_with_inputs_5 : one_bits_with_inputs
      PORT MAP ( A                      => s_logisimBus44(6),
                 A_bigger_than_B_input  => s_logisimNet86,
                 A_bigger_than_B_output => s_logisimNet89,
                 A_equal_B_input        => s_logisimNet85,
                 A_equals_B_output      => s_logisimNet88,
                 A_less_B_input         => s_logisimNet84,
                 A_less_than_B_output   => s_logisimNet87,
                 B                      => s_logisimBus47(6),
                 logisimClockTree0      => logisimClockTree0 );

END platformIndependent;
