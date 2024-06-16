--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : get_to_zero_BACKUP                                           ==
--== Component : letters_logic                                                ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF letters_logic IS 

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

      COMPONENT AND_GATE_4_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                input4 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT AND_GATE_5_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                input4 : IN  std_logic;
                input5 : IN  std_logic;
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

      COMPONENT OR_GATE_7_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                input4 : IN  std_logic;
                input5 : IN  std_logic;
                input6 : IN  std_logic;
                input7 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT OR_GATE_8_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                input4 : IN  std_logic;
                input5 : IN  std_logic;
                input6 : IN  std_logic;
                input7 : IN  std_logic;
                input8 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT OR_GATE_11_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1  : IN  std_logic;
                input10 : IN  std_logic;
                input11 : IN  std_logic;
                input2  : IN  std_logic;
                input3  : IN  std_logic;
                input4  : IN  std_logic;
                input5  : IN  std_logic;
                input6  : IN  std_logic;
                input7  : IN  std_logic;
                input8  : IN  std_logic;
                input9  : IN  std_logic;
                result  : OUT std_logic );
      END COMPONENT;

      COMPONENT OR_GATE_10_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1  : IN  std_logic;
                input10 : IN  std_logic;
                input2  : IN  std_logic;
                input3  : IN  std_logic;
                input4  : IN  std_logic;
                input5  : IN  std_logic;
                input6  : IN  std_logic;
                input7  : IN  std_logic;
                input8  : IN  std_logic;
                input9  : IN  std_logic;
                result  : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus19 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus47 : std_logic_vector( 6 DOWNTO 0 );
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
   SIGNAL s_logisimNet44 : std_logic;
   SIGNAL s_logisimNet45 : std_logic;
   SIGNAL s_logisimNet46 : std_logic;
   SIGNAL s_logisimNet48 : std_logic;
   SIGNAL s_logisimNet49 : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet50 : std_logic;
   SIGNAL s_logisimNet51 : std_logic;
   SIGNAL s_logisimNet52 : std_logic;
   SIGNAL s_logisimNet53 : std_logic;
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
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus19(4 DOWNTO 0) <= letter;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   letter_out <= s_logisimBus47(6 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- NOT Gate
   s_logisimNet8 <=  NOT s_logisimBus19(3);

   -- NOT Gate
   s_logisimNet0 <=  NOT s_logisimBus19(2);

   -- NOT Gate
   s_logisimNet6 <=  NOT s_logisimBus19(1);

   -- NOT Gate
   s_logisimNet22 <=  NOT s_logisimBus19(0);

   -- NOT Gate
   s_logisimNet1 <=  NOT s_logisimBus19(4);

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet0,
                 input2 => s_logisimNet6,
                 input3 => s_logisimBus19(0),
                 result => s_logisimNet27 );

   GATES_2 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimNet8,
                 input3 => s_logisimBus19(1),
                 result => s_logisimNet61 );

   GATES_3 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimBus19(3),
                 input3 => s_logisimNet6,
                 result => s_logisimNet10 );

   GATES_4 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimBus19(4),
                 input2 => s_logisimNet8,
                 input3 => s_logisimNet6,
                 result => s_logisimNet65 );

   GATES_5 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimBus19(4),
                 input2 => s_logisimNet0,
                 input3 => s_logisimNet6,
                 result => s_logisimNet49 );

   GATES_6 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimNet0,
                 input3 => s_logisimBus19(0),
                 result => s_logisimNet41 );

   GATES_7 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet8,
                 input2 => s_logisimBus19(1),
                 input3 => s_logisimNet22,
                 result => s_logisimNet12 );

   GATES_8 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimBus19(2),
                 input3 => s_logisimNet22,
                 result => s_logisimNet18 );

   GATES_9 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet8,
                 input2 => s_logisimBus19(2),
                 input3 => s_logisimNet6,
                 result => s_logisimNet73 );

   GATES_10 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimBus19(3),
                 input3 => s_logisimNet6,
                 result => s_logisimNet36 );

   GATES_11 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimBus19(3),
                 input3 => s_logisimBus19(0),
                 result => s_logisimNet17 );

   GATES_12 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimBus19(4),
                 input2 => s_logisimNet0,
                 input3 => s_logisimNet22,
                 result => s_logisimNet55 );

   GATES_13 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimNet8,
                 input3 => s_logisimNet0,
                 input4 => s_logisimBus19(1),
                 result => s_logisimNet24 );

   GATES_14 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimNet8,
                 input3 => s_logisimBus19(1),
                 input4 => s_logisimBus19(0),
                 result => s_logisimNet68 );

   GATES_15 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet8,
                 input2 => s_logisimNet0,
                 input3 => s_logisimBus19(1),
                 input4 => s_logisimBus19(0),
                 result => s_logisimNet26 );

   GATES_16 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimBus19(2),
                 input3 => s_logisimNet6,
                 input4 => s_logisimNet22,
                 result => s_logisimNet66 );

   GATES_17 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet8,
                 input2 => s_logisimBus19(2),
                 input3 => s_logisimNet6,
                 result => s_logisimNet48 );

   GATES_18 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimBus19(2),
                 input3 => s_logisimBus19(1),
                 input4 => s_logisimBus19(0),
                 result => s_logisimNet71 );

   GATES_19 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimBus19(3),
                 input2 => s_logisimNet0,
                 input3 => s_logisimBus19(1),
                 input4 => s_logisimNet22,
                 result => s_logisimNet52 );

   GATES_20 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimBus19(4),
                 input2 => s_logisimNet8,
                 input3 => s_logisimBus19(2),
                 input4 => s_logisimNet22,
                 result => s_logisimNet63 );

   GATES_21 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet8,
                 input2 => s_logisimNet0,
                 input3 => s_logisimNet6,
                 input4 => s_logisimBus19(0),
                 result => s_logisimNet50 );

   GATES_22 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimNet0,
                 input3 => s_logisimBus19(1),
                 input4 => s_logisimNet22,
                 result => s_logisimNet32 );

   GATES_23 : AND_GATE_5_INPUTS
      GENERIC MAP ( BubblesMask => "0"&X"0" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimNet8,
                 input3 => s_logisimBus19(2),
                 input4 => s_logisimNet6,
                 input5 => s_logisimNet22,
                 result => s_logisimNet9 );

   GATES_24 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimBus19(2),
                 input3 => s_logisimBus19(1),
                 input4 => s_logisimBus19(0),
                 result => s_logisimNet39 );

   GATES_25 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimBus19(3),
                 input2 => s_logisimNet0,
                 input3 => s_logisimNet6,
                 input4 => s_logisimNet22,
                 result => s_logisimNet51 );

   GATES_26 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimBus19(3),
                 input3 => s_logisimBus19(1),
                 input4 => s_logisimNet22,
                 result => s_logisimNet72 );

   GATES_27 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimBus19(3),
                 input3 => s_logisimBus19(2),
                 input4 => s_logisimBus19(0),
                 result => s_logisimNet30 );

   GATES_28 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimBus19(4),
                 input2 => s_logisimNet8,
                 input3 => s_logisimNet0,
                 input4 => s_logisimBus19(0),
                 result => s_logisimNet40 );

   GATES_29 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimBus19(4),
                 input2 => s_logisimNet8,
                 input3 => s_logisimNet6,
                 input4 => s_logisimBus19(0),
                 result => s_logisimNet34 );

   GATES_30 : AND_GATE_5_INPUTS
      GENERIC MAP ( BubblesMask => "0"&X"0" )
      PORT MAP ( input1 => s_logisimBus19(4),
                 input2 => s_logisimNet8,
                 input3 => s_logisimBus19(2),
                 input4 => s_logisimBus19(1),
                 input5 => s_logisimNet22,
                 result => s_logisimNet59 );

   GATES_31 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimBus19(4),
                 input2 => s_logisimBus19(3),
                 input3 => s_logisimNet0,
                 input4 => s_logisimNet6,
                 result => s_logisimNet33 );

   GATES_32 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet8,
                 input2 => s_logisimNet0,
                 input3 => s_logisimNet6,
                 input4 => s_logisimBus19(0),
                 result => s_logisimNet37 );

   GATES_33 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimNet8,
                 input3 => s_logisimNet6,
                 input4 => s_logisimBus19(0),
                 result => s_logisimNet42 );

   GATES_34 : AND_GATE_5_INPUTS
      GENERIC MAP ( BubblesMask => "0"&X"0" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimNet8,
                 input3 => s_logisimBus19(2),
                 input4 => s_logisimNet6,
                 input5 => s_logisimNet22,
                 result => s_logisimNet28 );

   GATES_35 : AND_GATE_5_INPUTS
      GENERIC MAP ( BubblesMask => "0"&X"0" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimNet8,
                 input3 => s_logisimBus19(2),
                 input4 => s_logisimBus19(1),
                 input5 => s_logisimBus19(0),
                 result => s_logisimNet11 );

   GATES_36 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimBus19(3),
                 input2 => s_logisimNet0,
                 input3 => s_logisimNet22,
                 result => s_logisimNet67 );

   GATES_37 : AND_GATE_5_INPUTS
      GENERIC MAP ( BubblesMask => "0"&X"0" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimBus19(3),
                 input3 => s_logisimBus19(2),
                 input4 => s_logisimNet6,
                 input5 => s_logisimBus19(0),
                 result => s_logisimNet46 );

   GATES_38 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimBus19(4),
                 input2 => s_logisimNet0,
                 input3 => s_logisimNet6,
                 result => s_logisimNet64 );

   GATES_39 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimBus19(4),
                 input2 => s_logisimNet8,
                 input3 => s_logisimNet6,
                 input4 => s_logisimBus19(0),
                 result => s_logisimNet16 );

   GATES_40 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet8,
                 input2 => s_logisimNet0,
                 input3 => s_logisimBus19(0),
                 result => s_logisimNet38 );

   GATES_41 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimBus19(2),
                 input3 => s_logisimNet6,
                 input4 => s_logisimBus19(0),
                 result => s_logisimNet57 );

   GATES_42 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimNet8,
                 input3 => s_logisimBus19(2),
                 input4 => s_logisimBus19(1),
                 result => s_logisimNet74 );

   GATES_43 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimBus19(4),
                 input2 => s_logisimNet8,
                 input3 => s_logisimNet0,
                 input4 => s_logisimNet6,
                 result => s_logisimNet20 );

   GATES_44 : AND_GATE_5_INPUTS
      GENERIC MAP ( BubblesMask => "0"&X"0" )
      PORT MAP ( input1 => s_logisimBus19(4),
                 input2 => s_logisimBus19(3),
                 input3 => s_logisimNet0,
                 input4 => s_logisimBus19(1),
                 input5 => s_logisimNet22,
                 result => s_logisimNet29 );

   GATES_45 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimNet8,
                 input3 => s_logisimBus19(1),
                 input4 => s_logisimNet22,
                 result => s_logisimNet25 );

   GATES_46 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimNet8,
                 input3 => s_logisimBus19(2),
                 result => s_logisimNet56 );

   GATES_47 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimBus19(2),
                 input3 => s_logisimBus19(1),
                 result => s_logisimNet31 );

   GATES_48 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimBus19(3),
                 input2 => s_logisimNet0,
                 input3 => s_logisimNet6,
                 input4 => s_logisimNet22,
                 result => s_logisimNet53 );

   GATES_49 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimBus19(3),
                 input3 => s_logisimBus19(1),
                 input4 => s_logisimBus19(0),
                 result => s_logisimNet60 );

   GATES_50 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimBus19(4),
                 input2 => s_logisimNet8,
                 input3 => s_logisimNet0,
                 result => s_logisimNet5 );

   GATES_51 : AND_GATE_4_INPUTS
      GENERIC MAP ( BubblesMask => X"0" )
      PORT MAP ( input1 => s_logisimBus19(4),
                 input2 => s_logisimNet8,
                 input3 => s_logisimNet6,
                 input4 => s_logisimNet22,
                 result => s_logisimNet14 );

   GATES_52 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimBus19(4),
                 input2 => s_logisimNet0,
                 input3 => s_logisimNet6,
                 result => s_logisimNet43 );

   GATES_53 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimBus19(4),
                 input2 => s_logisimNet0,
                 input3 => s_logisimNet22,
                 result => s_logisimNet23 );

   GATES_54 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimNet0,
                 input3 => s_logisimBus19(0),
                 result => s_logisimNet62 );

   GATES_55 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet1,
                 input2 => s_logisimNet6,
                 input3 => s_logisimBus19(0),
                 result => s_logisimNet45 );

   GATES_56 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimNet8,
                 input2 => s_logisimNet0,
                 input3 => s_logisimBus19(0),
                 result => s_logisimNet21 );

   GATES_57 : OR_GATE_5_INPUTS
      GENERIC MAP ( BubblesMask => "0"&X"0" )
      PORT MAP ( input1 => s_logisimNet38,
                 input2 => s_logisimNet57,
                 input3 => s_logisimNet74,
                 input4 => s_logisimNet20,
                 input5 => s_logisimNet29,
                 result => s_logisimBus47(0) );

   GATES_58 : OR_GATE_7_INPUTS
      GENERIC MAP ( BubblesMask => "000"&X"0" )
      PORT MAP ( input1 => s_logisimNet41,
                 input2 => s_logisimNet12,
                 input3 => s_logisimNet18,
                 input4 => s_logisimNet73,
                 input5 => s_logisimNet36,
                 input6 => s_logisimNet17,
                 input7 => s_logisimNet55,
                 result => s_logisimBus47(4) );

   GATES_59 : OR_GATE_7_INPUTS
      GENERIC MAP ( BubblesMask => "000"&X"0" )
      PORT MAP ( input1 => s_logisimNet37,
                 input2 => s_logisimNet28,
                 input3 => s_logisimNet11,
                 input4 => s_logisimNet67,
                 input5 => s_logisimNet46,
                 input6 => s_logisimNet64,
                 input7 => s_logisimNet16,
                 result => s_logisimBus47(1) );

   GATES_60 : OR_GATE_8_INPUTS
      GENERIC MAP ( BubblesMask => X"00" )
      PORT MAP ( input1 => s_logisimNet62,
                 input2 => s_logisimNet45,
                 input3 => s_logisimNet21,
                 input4 => s_logisimNet27,
                 input5 => s_logisimNet61,
                 input6 => s_logisimNet10,
                 input7 => s_logisimNet65,
                 input8 => s_logisimNet49,
                 result => s_logisimBus47(5) );

   GATES_61 : OR_GATE_8_INPUTS
      GENERIC MAP ( BubblesMask => X"00" )
      PORT MAP ( input1 => s_logisimNet24,
                 input2 => s_logisimNet68,
                 input3 => s_logisimNet26,
                 input4 => s_logisimNet66,
                 input5 => s_logisimNet48,
                 input6 => s_logisimNet71,
                 input7 => s_logisimNet52,
                 input8 => s_logisimNet63,
                 result => s_logisimBus47(3) );

   GATES_62 : OR_GATE_11_INPUTS
      GENERIC MAP ( BubblesMask => "000"&X"00" )
      PORT MAP ( input1  => s_logisimNet50,
                 input10 => s_logisimNet59,
                 input11 => s_logisimNet33,
                 input2  => s_logisimNet32,
                 input3  => s_logisimNet9,
                 input4  => s_logisimNet39,
                 input5  => s_logisimNet51,
                 input6  => s_logisimNet72,
                 input7  => s_logisimNet30,
                 input8  => s_logisimNet40,
                 input9  => s_logisimNet34,
                 result  => s_logisimBus47(2) );

   GATES_63 : OR_GATE_10_INPUTS
      GENERIC MAP ( BubblesMask => "00"&X"00" )
      PORT MAP ( input1  => s_logisimNet42,
                 input10 => s_logisimNet23,
                 input2  => s_logisimNet25,
                 input3  => s_logisimNet56,
                 input4  => s_logisimNet31,
                 input5  => s_logisimNet53,
                 input6  => s_logisimNet60,
                 input7  => s_logisimNet5,
                 input8  => s_logisimNet14,
                 input9  => s_logisimNet43,
                 result  => s_logisimBus47(6) );


END platformIndependent;
