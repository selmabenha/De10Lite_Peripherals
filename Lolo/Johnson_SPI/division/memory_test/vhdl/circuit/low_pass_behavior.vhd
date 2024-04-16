--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : division                                                     ==
--== Component : low_pass                                                     ==
--==                                                                          ==
--==============================================================================

LIBRARY ieee;
USE ieee.std_logic_1164.all;







ARCHITECTURE TypeArchitecture OF low_pass IS
	signal val_signal : std_logic_vector(16 DOWNTO 0);
	signal val_signal_1 : std_logic_vector(16 DOWNTO 0);
	signal big_percentage : std_logic_vector(16 DOWNTO 0) := '0' & X"7AE1";
	signal small_percentage : std_logic_vector(16 DOWNTO 0) := '0' & X"051F";
	signal cmpt : std_logic_vector(33 DOWNTO 0);
	signal shift : unsigned(33 DOWNTO 0);
	signal cmpt_1 : std_logic_vector(33 DOWNTO 0);
	signal shift_1 : unsigned(33 DOWNTO 0);
	signal result : std_logic_vector(7 DOWNTO 0);
	
BEGIN
	val_signal <= '0' & X"00" & val;
	val_signal_1 <= '0' & X"00" & new_val;
	
	cmpt <= std_logic_vector(unsigned(val_signal) * unsigned(big_percentage));
	shift <= shift_right(unsigned(cmpt), 15); 

	cmpt_1 <= std_logic_vector(unsigned(val_signal_1) * unsigned(small_percentage));
	shift_1 <= shift_right(unsigned(cmpt_1), 15);

	result <= std_logic_vector(unsigned(shift(7 downto 0)) + unsigned(shift_1(7 downto 0)));
	
END TypeArchitecture;
