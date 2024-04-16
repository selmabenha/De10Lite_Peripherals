--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : division                                                     ==
--== Component : logisimTopLevelShell                                         ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF logisimTopLevelShell IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
      COMPONENT scale_down
         PORT ( Input_1      : IN  std_logic;
                Input_2      : IN  std_logic;
                number_input : IN  std_logic_vector( 15 DOWNTO 0 );
                Output_1     : OUT std_logic;
                answer       : OUT std_logic_vector( 7 DOWNTO 0 );
                hundreds     : OUT std_logic_vector( 3 DOWNTO 0 );
                negative     : OUT std_logic;
                ones         : OUT std_logic_vector( 3 DOWNTO 0 );
                tens         : OUT std_logic_vector( 3 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_Input_1      : std_logic;
   SIGNAL s_Input_2      : std_logic;
   SIGNAL s_Output_1     : std_logic;
   SIGNAL s_answer       : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_hundreds     : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_negative     : std_logic;
   SIGNAL s_number_input : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_ones         : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_tens         : std_logic_vector( 3 DOWNTO 0 );

BEGIN

   --------------------------------------------------------------------------------
   -- All signal adaptations are performed here                                  --
   --------------------------------------------------------------------------------
   Output_1_0         <= s_Output_1;
   s_Input_1          <=  NOT n_Input_1_0;
   s_Input_2          <=  NOT n_Input_2_0;
   s_number_input(0)  <= '0';
   s_number_input(1)  <= '0';
   s_number_input(10) <= '0';
   s_number_input(11) <= '0';
   s_number_input(12) <= '0';
   s_number_input(13) <= '0';
   s_number_input(14) <= '0';
   s_number_input(15) <= '0';
   s_number_input(2)  <= '0';
   s_number_input(3)  <= '0';
   s_number_input(4)  <= '0';
   s_number_input(5)  <= '0';
   s_number_input(6)  <= '0';
   s_number_input(7)  <= '0';
   s_number_input(8)  <= '0';
   s_number_input(9)  <= '0';

   --------------------------------------------------------------------------------
   -- The toplevel component is connected here                                   --
   --------------------------------------------------------------------------------
   CIRCUIT_0 : scale_down
      PORT MAP ( Input_1      => s_Input_1,
                 Input_2      => s_Input_2,
                 Output_1     => s_Output_1,
                 answer       => s_answer,
                 hundreds     => s_hundreds,
                 negative     => s_negative,
                 number_input => s_number_input,
                 ones         => s_ones,
                 tens         => s_tens );
END platformIndependent;
