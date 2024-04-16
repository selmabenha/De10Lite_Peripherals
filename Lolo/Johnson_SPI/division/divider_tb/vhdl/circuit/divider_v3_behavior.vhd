--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : division                                                     ==
--== Component : divider_v3                                                   ==
--==                                                                          ==
--==============================================================================

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;







ARCHITECTURE TypeArchitecture OF divider_v3 IS
	signal cmpt_1 : std_logic_vector(33 DOWNTO 0);
	signal input1_sig : std_logic_vector(16 DOWNTO 0);
	signal twelve_eighty : std_logic_vector(16 DOWNTO 0);
	signal twelve_eighty_cst : std_logic_vector(15 DOWNTO 0) := X"3200";
	signal shift_1 : unsigned(33 DOWNTO 0);
	
BEGIN
	input1_sig <= '0' & val;

	twelve_eighty <= '0' & twelve_eighty_cst;

	process (val)
	begin

		cmpt_1 <= std_logic_vector(unsigned(input1_sig) * unsigned(twelve_eighty));
		shift_1 <= shift_right(unsigned(cmpt_1), 15);
		final_answer <= std_logic_vector(shift_1(7 downto 0));
		
	end process;

END TypeArchitecture;
