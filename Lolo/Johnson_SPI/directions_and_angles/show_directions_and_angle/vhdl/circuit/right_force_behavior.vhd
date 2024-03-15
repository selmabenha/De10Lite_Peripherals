--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : directions_and_angles                                        ==
--== Component : right_force                                                  ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF right_force IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT AND_GATE_5_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                input4 : IN  std_logic;
                input5 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT AND_GATE_4_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                input4 : IN  std_logic;
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
   SIGNAL s_logisimNet3  : std_logic;
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
   s_logisimNet0  <= L2;
   s_logisimNet15 <= M1;
   s_logisimNet3  <= M2;
   s_logisimNet4  <= S2;
   s_logisimNet6  <= L1;
   s_logisimNet7  <= S1;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   L <= s_logisimNet20;
   M <= s_logisimNet18;
   S <= s_logisimNet11;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- NOT Gate
   s_logisimNet5 <=  NOT s_logisimNet4;

   -- NOT Gate
   s_logisimNet14 <=  NOT s_logisimNet15;

   -- NOT Gate
   s_logisimNet16 <=  NOT s_logisimNet3;

   -- NOT Gate
   s_logisimNet1 <=  NOT s_logisimNet6;

   -- NOT Gate
   s_logisimNet2 <=  NOT s_logisimNet0;

   -- NOT Gate
   s_logisimNet12 <=  NOT s_logisimNet7;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : AND_GATE_5_INPUTS
      GENERIC MAP ( BubblesMask => "0"&X"0" )
      PORT MAP ( input1 => s_logisimNet4,
                 input2 => s_logisimNet14,
                 input3 => s_logisimNet16,
                 input4 => s_logisimNet1,
                 input5 => s_logisimNet2,
                 result => s_logisimNet19 );

   GATES_2 : AND_GATE_5_INPUTS
      GENERIC MAP ( BubblesMask => "0"&X"0" )
      PORT MAP ( input1 => s_logisimNet7,
                 input2 => s_logisimNet14,
                 input3 => s_logisimNet16,
                 input4 => s_logisimNet1,
                 input5 => s_logisimNet2,
                 result => s_logisimNet13 );

   GATES_3 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet14,
                 input2 => s_logisimNet3,
                 input3 => s_logisimNet1,
                 input4 => s_logisimNet2,
                 result => s_logisimNet8 );

   GATES_4 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet15,
                 input2 => s_logisimNet16,
                 input3 => s_logisimNet1,
                 input4 => s_logisimNet2,
                 result => s_logisimNet21 );

   GATES_5 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet4,
                 input2 => s_logisimNet3,
                 input3 => s_logisimNet1,
                 input4 => s_logisimNet2,
                 result => s_logisimNet17 );

   GATES_6 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet7,
                 input2 => s_logisimNet15,
                 input3 => s_logisimNet1,
                 input4 => s_logisimNet2,
                 result => s_logisimNet10 );

   GATES_7 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet12,
                 input2 => s_logisimNet5,
                 input3 => s_logisimNet15,
                 input4 => s_logisimNet3,
                 result => s_logisimNet9 );

   GATES_8 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet19,
                 input2 => s_logisimNet13,
                 result => s_logisimNet11 );

   GATES_9 : OR_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet0,
                 input2 => s_logisimNet6,
                 input3 => s_logisimNet9,
                 result => s_logisimNet20 );

   GATES_10 : OR_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet8,
                 input2 => s_logisimNet21,
                 input3 => s_logisimNet17,
                 input4 => s_logisimNet10,
                 result => s_logisimNet18 );


END platformIndependent;
