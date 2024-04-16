--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : division                                                     ==
--== Component : hex_to_decimal                                               ==
--==                                                                          ==
--==============================================================================

LIBRARY ieee;
USE ieee.std_logic_1164.all;







ARCHITECTURE TypeArchitecture OF hex_to_decimal IS
	signal cmpt_2 : std_logic_vector(33 DOWNTO 0);
	signal cmpt_3 : std_logic_vector(33 DOWNTO 0);
	signal cmpt_4 : std_logic_vector(33 DOWNTO 0);
	signal cmpt_5 : std_logic_vector(33 DOWNTO 0);
	signal cmpt_6 : std_logic_vector(33 DOWNTO 0);
	signal no_hundos : std_logic_vector(33 DOWNTO 0);
	
	signal div_one_hundos : std_logic_vector(16 DOWNTO 0);
	signal div_one_hundo : std_logic_vector(15 DOWNTO 0) := X"0148";

	signal times_one_hundos : std_logic_vector(16 DOWNTO 0);
	signal times_one_hundo : std_logic_vector(15 DOWNTO 0) := X"0064";
	
	signal tenners : std_logic_vector(16 DOWNTO 0);
	signal ten : std_logic_vector(15 DOWNTO 0) := X"0CCD";

	signal times_tenner : std_logic_vector(16 DOWNTO 0);
	signal times_ten : std_logic_vector(15 DOWNTO 0) := X"000a";

	signal shift_2 : unsigned(33 DOWNTO 0);
	signal shift_4 : unsigned(33 DOWNTO 0);
	signal shift_5 : unsigned(33 DOWNTO 0);
	signal final_answer_sig : std_logic_vector(7 DOWNTO 0);
	signal hundreds_digit : std_logic_vector(3 DOWNTO 0);
	signal tens_digit : std_logic_vector(3 DOWNTO 0);
BEGIN
	final_answer_sig <= val;
	div_one_hundos <= '0' & div_one_hundo;
	tenners <= '0' & ten;
	times_one_hundos <= '0' & times_one_hundo;
	times_tenner <= '0' & times_ten;

	process (val)
	begin
		cmpt_2 <= std_logic_vector(('0' & X"00" & unsigned(final_answer_sig)) * unsigned(div_one_hundos));
		shift_2 <= shift_right(unsigned(cmpt_2), 15);
		hundreds <= std_logic_vector(shift_2(3 downto 0));
		hundreds_digit <= std_logic_vector(shift_2(3 downto 0));

		cmpt_3 <= std_logic_vector(unsigned('0' & '0' & X"000000" & final_answer_sig) - unsigned('0' & X"000" & hundreds_digit) * unsigned(times_one_hundos));
		no_hundos <= cmpt_3;
		cmpt_4 <= std_logic_vector(unsigned('0' & X"00" & cmpt_3(7 downto 0)) * unsigned(tenners));
		shift_4 <= shift_right(unsigned(cmpt_4), 15);
		tens <= std_logic_vector(shift_4(3 downto 0));
		tens_digit <= std_logic_vector(shift_4(3 downto 0));

		cmpt_5 <= std_logic_vector(unsigned(no_hundos) - unsigned('0' & X"000" & tens_digit) * unsigned(times_tenner));
		ones <= std_logic_vector(cmpt_5(3 downto 0));
		
	end process;

END TypeArchitecture;
