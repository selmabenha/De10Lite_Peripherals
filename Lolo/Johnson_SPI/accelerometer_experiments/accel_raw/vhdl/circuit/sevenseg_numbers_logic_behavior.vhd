--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_experiments                                    ==
--== Component : sevenseg_numbers_logic                                       ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF sevenseg_numbers_logic IS 

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

      COMPONENT OR_GATE_5_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                input4 : IN  std_logic;
                input5 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT OR_GATE_4_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                input4 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT OR_GATE_6_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                input4 : IN  std_logic;
                input5 : IN  std_logic;
                input6 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus40 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus44 : std_logic_vector( 3 DOWNTO 0 );
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
   SIGNAL s_logisimNet41 : std_logic;
   SIGNAL s_logisimNet42 : std_logic;
   SIGNAL s_logisimNet43 : std_logic;
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
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus44(3 DOWNTO 0) <= accel;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   sevensegment <= s_logisimBus40(7 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus40(7)  <=  '0';


   -- NOT Gate
   s_logisimNet12 <=  NOT s_logisimBus44(2);

   -- NOT Gate
   s_logisimNet8 <=  NOT s_logisimBus44(1);

   -- NOT Gate
   s_logisimNet9 <=  NOT s_logisimBus44(0);

   -- NOT Gate
   s_logisimNet22 <=  NOT s_logisimBus44(3);

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet22,
                 input2 => s_logisimNet12,
                 input3 => s_logisimNet9,
                 result => s_logisimNet41 );

   GATES_2 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet22,
                 input2 => s_logisimBus44(1),
                 input3 => s_logisimNet9,
                 result => s_logisimNet30 );

   GATES_3 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet12,
                 input2 => s_logisimBus44(1),
                 input3 => s_logisimBus44(0),
                 result => s_logisimNet3 );

   GATES_4 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimBus44(2),
                 input2 => s_logisimNet8,
                 input3 => s_logisimBus44(0),
                 result => s_logisimNet33 );

   GATES_5 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimBus44(3),
                 input2 => s_logisimNet8,
                 result => s_logisimNet36 );

   GATES_6 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimBus44(3),
                 input2 => s_logisimBus44(2),
                 input3 => s_logisimNet9,
                 result => s_logisimNet10 );

   GATES_7 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet22,
                 input2 => s_logisimNet8,
                 result => s_logisimNet6 );

   GATES_8 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet22,
                 input2 => s_logisimBus44(0),
                 result => s_logisimNet18 );

   GATES_9 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet8,
                 input2 => s_logisimBus44(0),
                 result => s_logisimNet2 );

   GATES_10 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet22,
                 input2 => s_logisimBus44(2),
                 result => s_logisimNet29 );

   GATES_11 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimBus44(3),
                 input2 => s_logisimNet12,
                 result => s_logisimNet15 );

   GATES_12 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet22,
                 input2 => s_logisimNet12,
                 result => s_logisimNet27 );

   GATES_13 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet22,
                 input2 => s_logisimNet8,
                 input3 => s_logisimNet9,
                 result => s_logisimNet42 );

   GATES_14 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet12,
                 input2 => s_logisimNet9,
                 result => s_logisimNet50 );

   GATES_15 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet22,
                 input2 => s_logisimBus44(1),
                 input3 => s_logisimBus44(0),
                 result => s_logisimNet20 );

   GATES_16 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimBus44(3),
                 input2 => s_logisimNet8,
                 input3 => s_logisimBus44(0),
                 result => s_logisimNet25 );

   GATES_17 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet12,
                 input2 => s_logisimNet9,
                 result => s_logisimNet35 );

   GATES_18 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet22,
                 input2 => s_logisimBus44(1),
                 result => s_logisimNet31 );

   GATES_19 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet22,
                 input2 => s_logisimBus44(2),
                 input3 => s_logisimBus44(0),
                 result => s_logisimNet4 );

   GATES_20 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimBus44(2),
                 input2 => s_logisimBus44(1),
                 result => s_logisimNet34 );

   GATES_21 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimBus44(3),
                 input2 => s_logisimNet12,
                 input3 => s_logisimNet8,
                 result => s_logisimNet37 );

   GATES_22 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimBus44(3),
                 input2 => s_logisimNet9,
                 result => s_logisimNet11 );

   GATES_23 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet12,
                 input2 => s_logisimBus44(1),
                 result => s_logisimNet14 );

   GATES_24 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimBus44(1),
                 input2 => s_logisimNet9,
                 result => s_logisimNet32 );

   GATES_25 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet22,
                 input2 => s_logisimBus44(2),
                 input3 => s_logisimNet8,
                 result => s_logisimNet48 );

   GATES_26 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimBus44(3),
                 input2 => s_logisimNet12,
                 result => s_logisimNet51 );

   GATES_27 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimBus44(3),
                 input2 => s_logisimBus44(0),
                 result => s_logisimNet7 );

   GATES_28 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet8,
                 input2 => s_logisimNet9,
                 result => s_logisimNet26 );

   GATES_29 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet22,
                 input2 => s_logisimBus44(2),
                 input3 => s_logisimNet8,
                 result => s_logisimNet16 );

   GATES_30 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimBus44(2),
                 input2 => s_logisimNet9,
                 result => s_logisimNet24 );

   GATES_31 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimBus44(3),
                 input2 => s_logisimNet12,
                 result => s_logisimNet39 );

   GATES_32 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimBus44(3),
                 input2 => s_logisimBus44(1),
                 result => s_logisimNet28 );

   GATES_33 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet12,
                 input2 => s_logisimNet9,
                 result => s_logisimNet38 );

   GATES_34 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimBus44(1),
                 input2 => s_logisimNet9,
                 result => s_logisimNet46 );

   GATES_35 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimBus44(3),
                 input2 => s_logisimBus44(1),
                 result => s_logisimNet17 );

   GATES_36 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimBus44(3),
                 input2 => s_logisimBus44(2),
                 result => s_logisimNet45 );

   GATES_37 : OR_GATE_5_INPUTS
      GENERIC MAP ( BubblesMask => "0"&X"0" )
      PORT MAP ( input1 => s_logisimNet6,
                 input2 => s_logisimNet18,
                 input3 => s_logisimNet2,
                 input4 => s_logisimNet29,
                 input5 => s_logisimNet15,
                 result => s_logisimBus40(2) );

   GATES_38 : OR_GATE_5_INPUTS
      GENERIC MAP ( BubblesMask => "0"&X"0" )
      PORT MAP ( input1 => s_logisimNet27,
                 input2 => s_logisimNet42,
                 input3 => s_logisimNet50,
                 input4 => s_logisimNet20,
                 input5 => s_logisimNet25,
                 result => s_logisimBus40(1) );

   GATES_39 : OR_GATE_5_INPUTS
      GENERIC MAP ( BubblesMask => "0"&X"0" )
      PORT MAP ( input1 => s_logisimNet14,
                 input2 => s_logisimNet32,
                 input3 => s_logisimNet48,
                 input4 => s_logisimNet51,
                 input5 => s_logisimNet7,
                 result => s_logisimBus40(6) );

   GATES_40 : OR_GATE_5_INPUTS
      GENERIC MAP ( BubblesMask => "0"&X"0" )
      PORT MAP ( input1 => s_logisimNet26,
                 input2 => s_logisimNet16,
                 input3 => s_logisimNet24,
                 input4 => s_logisimNet39,
                 input5 => s_logisimNet28,
                 result => s_logisimBus40(5) );

   GATES_41 : OR_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet38,
                 input2 => s_logisimNet46,
                 input3 => s_logisimNet17,
                 input4 => s_logisimNet45,
                 result => s_logisimBus40(4) );

   GATES_42 : OR_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet41,
                 input2 => s_logisimNet30,
                 input3 => s_logisimNet3,
                 input4 => s_logisimNet33,
                 input5 => s_logisimNet36,
                 input6 => s_logisimNet10,
                 result => s_logisimBus40(3) );

   GATES_43 : OR_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet35,
                 input2 => s_logisimNet31,
                 input3 => s_logisimNet4,
                 input4 => s_logisimNet34,
                 input5 => s_logisimNet37,
                 input6 => s_logisimNet11,
                 result => s_logisimBus40(0) );


END platformIndependent;
