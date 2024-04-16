--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : division                                                     ==
--== Component : divide_two_num                                               ==
--==                                                                          ==
--==============================================================================

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;







ARCHITECTURE TypeArchitecture OF divide_two_num IS
	signal cmpt_1 : std_logic_vector(33 DOWNTO 0);
	signal input1_sig : std_logic_vector(16 DOWNTO 0);
	signal input2_sig : std_logic_vector(16 DOWNTO 0);
	signal shift_1 : unsigned(33 DOWNTO 0);
	
BEGIN
	input1_sig <= '0' & val;
	input2_sig <= '0' & val2;
	

	process (val, val2)
	begin

		cmpt_1 <= std_logic_vector(unsigned(input1_sig) * unsigned(input2_sig));
		shift_1 <= shift_right(unsigned(cmpt_1), 15);
		final_answer <= std_logic_vector(shift_1(7 downto 0));
		final_answer_sixteen_bits <= std_logic_vector(shift_1(15 downto 0));
		
	end process;

END TypeArchitecture;
