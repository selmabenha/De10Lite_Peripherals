--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2_BACKUP                                      ==
--== Component : sevenseg_direction_angle_logic                               ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF sevenseg_direction_angle_logic IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT AND_GATE_6_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                input4 : IN  std_logic;
                input5 : IN  std_logic;
                input6 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT OR_GATE_3_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT OR_GATE
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

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus20 : std_logic_vector( 7 DOWNTO 0 );
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
   SIGNAL s_logisimNet44 : std_logic;
   SIGNAL s_logisimNet45 : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimNet1  <= R;
   s_logisimNet13 <= U;
   s_logisimNet17 <= M;
   s_logisimNet19 <= L;
   s_logisimNet24 <= S;
   s_logisimNet29 <= D;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   letter_output <= s_logisimBus20(7 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus20(7)  <=  '0';


   -- NOT Gate
   s_logisimNet4 <=  NOT s_logisimNet1;

   -- NOT Gate
   s_logisimNet2 <=  NOT s_logisimNet13;

   -- NOT Gate
   s_logisimNet0 <=  NOT s_logisimNet29;

   -- NOT Gate
   s_logisimNet6 <=  NOT s_logisimNet24;

   -- NOT Gate
   s_logisimNet3 <=  NOT s_logisimNet17;

   -- NOT Gate
   s_logisimNet5 <=  NOT s_logisimNet19;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet2,
                 input4 => s_logisimNet0,
                 input5 => s_logisimNet6,
                 input6 => s_logisimNet17,
                 result => s_logisimNet25 );

   GATES_2 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet2,
                 input4 => s_logisimNet29,
                 input5 => s_logisimNet6,
                 input6 => s_logisimNet3,
                 result => s_logisimNet42 );

   GATES_3 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet13,
                 input4 => s_logisimNet0,
                 input5 => s_logisimNet6,
                 input6 => s_logisimNet3,
                 result => s_logisimNet38 );

   GATES_4 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet1,
                 input3 => s_logisimNet2,
                 input4 => s_logisimNet0,
                 input5 => s_logisimNet6,
                 input6 => s_logisimNet3,
                 result => s_logisimNet35 );

   GATES_5 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet19,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet2,
                 input4 => s_logisimNet0,
                 input5 => s_logisimNet6,
                 input6 => s_logisimNet3,
                 result => s_logisimNet26 );

   GATES_6 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet2,
                 input4 => s_logisimNet0,
                 input5 => s_logisimNet24,
                 input6 => s_logisimNet3,
                 result => s_logisimNet30 );

   GATES_7 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet2,
                 input4 => s_logisimNet29,
                 input5 => s_logisimNet6,
                 input6 => s_logisimNet3,
                 result => s_logisimNet37 );

   GATES_8 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet13,
                 input4 => s_logisimNet0,
                 input5 => s_logisimNet6,
                 input6 => s_logisimNet3,
                 result => s_logisimNet7 );

   GATES_9 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet19,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet2,
                 input4 => s_logisimNet0,
                 input5 => s_logisimNet6,
                 input6 => s_logisimNet3,
                 result => s_logisimNet28 );

   GATES_10 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet2,
                 input4 => s_logisimNet0,
                 input5 => s_logisimNet6,
                 input6 => s_logisimNet17,
                 result => s_logisimNet41 );

   GATES_11 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet2,
                 input4 => s_logisimNet0,
                 input5 => s_logisimNet24,
                 input6 => s_logisimNet3,
                 result => s_logisimNet8 );

   GATES_12 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet2,
                 input4 => s_logisimNet29,
                 input5 => s_logisimNet6,
                 input6 => s_logisimNet3,
                 result => s_logisimNet31 );

   GATES_13 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet13,
                 input4 => s_logisimNet0,
                 input5 => s_logisimNet6,
                 input6 => s_logisimNet3,
                 result => s_logisimNet40 );

   GATES_14 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet2,
                 input4 => s_logisimNet0,
                 input5 => s_logisimNet6,
                 input6 => s_logisimNet17,
                 result => s_logisimNet34 );

   GATES_15 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet2,
                 input4 => s_logisimNet29,
                 input5 => s_logisimNet6,
                 input6 => s_logisimNet3,
                 result => s_logisimNet45 );

   GATES_16 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet13,
                 input4 => s_logisimNet0,
                 input5 => s_logisimNet6,
                 input6 => s_logisimNet3,
                 result => s_logisimNet14 );

   GATES_17 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet2,
                 input4 => s_logisimNet0,
                 input5 => s_logisimNet6,
                 input6 => s_logisimNet17,
                 result => s_logisimNet27 );

   GATES_18 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet2,
                 input4 => s_logisimNet0,
                 input5 => s_logisimNet24,
                 input6 => s_logisimNet3,
                 result => s_logisimNet33 );

   GATES_19 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet2,
                 input4 => s_logisimNet0,
                 input5 => s_logisimNet24,
                 input6 => s_logisimNet3,
                 result => s_logisimNet10 );

   GATES_20 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet2,
                 input4 => s_logisimNet29,
                 input5 => s_logisimNet6,
                 input6 => s_logisimNet3,
                 result => s_logisimNet43 );

   GATES_21 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet1,
                 input3 => s_logisimNet2,
                 input4 => s_logisimNet0,
                 input5 => s_logisimNet6,
                 input6 => s_logisimNet3,
                 result => s_logisimNet23 );

   GATES_22 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet2,
                 input4 => s_logisimNet0,
                 input5 => s_logisimNet6,
                 input6 => s_logisimNet17,
                 result => s_logisimNet18 );

   GATES_23 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet2,
                 input4 => s_logisimNet0,
                 input5 => s_logisimNet24,
                 input6 => s_logisimNet3,
                 result => s_logisimNet12 );

   GATES_24 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet13,
                 input4 => s_logisimNet0,
                 input5 => s_logisimNet6,
                 input6 => s_logisimNet3,
                 result => s_logisimNet32 );

   GATES_25 : AND_GATE_6_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"0" )
      PORT MAP ( input1 => s_logisimNet19,
                 input2 => s_logisimNet4,
                 input3 => s_logisimNet2,
                 input4 => s_logisimNet0,
                 input5 => s_logisimNet6,
                 input6 => s_logisimNet3,
                 result => s_logisimNet36 );

   GATES_26 : OR_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet34,
                 input2 => s_logisimNet45,
                 input3 => s_logisimNet14,
                 result => s_logisimBus20(1) );

   GATES_27 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet27,
                 input2 => s_logisimNet33,
                 result => s_logisimBus20(0) );

   GATES_28 : OR_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet10,
                 input2 => s_logisimNet43,
                 input3 => s_logisimNet23,
                 result => s_logisimBus20(6) );

   GATES_29 : OR_GATE_5_INPUTS
      GENERIC MAP ( BubblesMask => "0"&X"0" )
      PORT MAP ( input1 => s_logisimNet25,
                 input2 => s_logisimNet42,
                 input3 => s_logisimNet38,
                 input4 => s_logisimNet35,
                 input5 => s_logisimNet26,
                 result => s_logisimBus20(4) );

   GATES_30 : OR_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet30,
                 input2 => s_logisimNet37,
                 input3 => s_logisimNet7,
                 input4 => s_logisimNet28,
                 result => s_logisimBus20(3) );

   GATES_31 : OR_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet41,
                 input2 => s_logisimNet8,
                 input3 => s_logisimNet31,
                 input4 => s_logisimNet40,
                 result => s_logisimBus20(2) );

   GATES_32 : OR_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet18,
                 input2 => s_logisimNet12,
                 input3 => s_logisimNet32,
                 input4 => s_logisimNet36,
                 result => s_logisimBus20(5) );


END platformIndependent;
