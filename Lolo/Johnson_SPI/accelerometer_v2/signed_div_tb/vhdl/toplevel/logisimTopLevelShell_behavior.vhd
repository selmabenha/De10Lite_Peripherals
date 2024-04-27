--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_v2                                             ==
--== Component : logisimTopLevelShell                                         ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF logisimTopLevelShell IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
      COMPONENT signed_div_tb
         PORT ( Input_bus_1          : IN  std_logic_vector( 15 DOWNTO 0 );
                logisimOutputBubbles : OUT std_logic_vector( 31 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_Input_bus_1          : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimOutputBubbles : std_logic_vector( 31 DOWNTO 0 );

BEGIN

   --------------------------------------------------------------------------------
   -- All signal adaptations are performed here                                  --
   --------------------------------------------------------------------------------
   n_hex0_L_7_Segment_Display_1_DecimalPoint <=  NOT s_logisimOutputBubbles(23);
   n_hex0_L_7_Segment_Display_1_Segment_A    <=  NOT s_logisimOutputBubbles(16);
   n_hex0_L_7_Segment_Display_1_Segment_B    <=  NOT s_logisimOutputBubbles(17);
   n_hex0_L_7_Segment_Display_1_Segment_C    <=  NOT s_logisimOutputBubbles(18);
   n_hex0_L_7_Segment_Display_1_Segment_D    <=  NOT s_logisimOutputBubbles(19);
   n_hex0_L_7_Segment_Display_1_Segment_E    <=  NOT s_logisimOutputBubbles(20);
   n_hex0_L_7_Segment_Display_1_Segment_F    <=  NOT s_logisimOutputBubbles(21);
   n_hex0_L_7_Segment_Display_1_Segment_G    <=  NOT s_logisimOutputBubbles(22);
   n_hex1_L_7_Segment_Display_1_DecimalPoint <=  NOT s_logisimOutputBubbles(15);
   n_hex1_L_7_Segment_Display_1_Segment_A    <=  NOT s_logisimOutputBubbles(8);
   n_hex1_L_7_Segment_Display_1_Segment_B    <=  NOT s_logisimOutputBubbles(9);
   n_hex1_L_7_Segment_Display_1_Segment_C    <=  NOT s_logisimOutputBubbles(10);
   n_hex1_L_7_Segment_Display_1_Segment_D    <=  NOT s_logisimOutputBubbles(11);
   n_hex1_L_7_Segment_Display_1_Segment_E    <=  NOT s_logisimOutputBubbles(12);
   n_hex1_L_7_Segment_Display_1_Segment_F    <=  NOT s_logisimOutputBubbles(13);
   n_hex1_L_7_Segment_Display_1_Segment_G    <=  NOT s_logisimOutputBubbles(14);
   n_hex2_L_7_Segment_Display_1_DecimalPoint <=  NOT s_logisimOutputBubbles(7);
   n_hex2_L_7_Segment_Display_1_Segment_A    <=  NOT s_logisimOutputBubbles(0);
   n_hex2_L_7_Segment_Display_1_Segment_B    <=  NOT s_logisimOutputBubbles(1);
   n_hex2_L_7_Segment_Display_1_Segment_C    <=  NOT s_logisimOutputBubbles(2);
   n_hex2_L_7_Segment_Display_1_Segment_D    <=  NOT s_logisimOutputBubbles(3);
   n_hex2_L_7_Segment_Display_1_Segment_E    <=  NOT s_logisimOutputBubbles(4);
   n_hex2_L_7_Segment_Display_1_Segment_F    <=  NOT s_logisimOutputBubbles(5);
   n_hex2_L_7_Segment_Display_1_Segment_G    <=  NOT s_logisimOutputBubbles(6);
   n_hex3_L_7_Segment_Display_1_DecimalPoint <=  NOT s_logisimOutputBubbles(31);
   n_hex3_L_7_Segment_Display_1_Segment_A    <=  NOT s_logisimOutputBubbles(24);
   n_hex3_L_7_Segment_Display_1_Segment_B    <=  NOT s_logisimOutputBubbles(25);
   n_hex3_L_7_Segment_Display_1_Segment_C    <=  NOT s_logisimOutputBubbles(26);
   n_hex3_L_7_Segment_Display_1_Segment_D    <=  NOT s_logisimOutputBubbles(27);
   n_hex3_L_7_Segment_Display_1_Segment_E    <=  NOT s_logisimOutputBubbles(28);
   n_hex3_L_7_Segment_Display_1_Segment_F    <=  NOT s_logisimOutputBubbles(29);
   n_hex3_L_7_Segment_Display_1_Segment_G    <=  NOT s_logisimOutputBubbles(30);
   s_Input_bus_1(0)                          <= '0';
   s_Input_bus_1(1)                          <= '0';
   s_Input_bus_1(10)                         <= '0';
   s_Input_bus_1(11)                         <= '0';
   s_Input_bus_1(12)                         <= '0';
   s_Input_bus_1(13)                         <= '0';
   s_Input_bus_1(14)                         <= '0';
   s_Input_bus_1(15)                         <= '0';
   s_Input_bus_1(2)                          <= '0';
   s_Input_bus_1(3)                          <= '0';
   s_Input_bus_1(4)                          <= '0';
   s_Input_bus_1(5)                          <= '0';
   s_Input_bus_1(6)                          <= '0';
   s_Input_bus_1(7)                          <= '0';
   s_Input_bus_1(8)                          <= '0';
   s_Input_bus_1(9)                          <= '0';

   --------------------------------------------------------------------------------
   -- The toplevel component is connected here                                   --
   --------------------------------------------------------------------------------
   CIRCUIT_0 : signed_div_tb
      PORT MAP ( Input_bus_1          => s_Input_bus_1,
                 logisimOutputBubbles => s_logisimOutputBubbles );
END platformIndependent;
