-- Copyright (C) 2021  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 21.1.0 Build 842 10/21/2021 SJ Lite Edition"
-- CREATED		"Wed Apr 17 04:37:31 2024"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY uart_transmitter_top IS 
	PORT
	(
		clk_50M :  IN  STD_LOGIC;
		switch_0 :  IN  STD_LOGIC;
		serial_out :  OUT  STD_LOGIC;
		busy :  OUT  STD_LOGIC;
		busy_LED :  OUT  STD_LOGIC;
		serial_out_LED :  OUT  STD_LOGIC
	);
END uart_transmitter_top;

ARCHITECTURE bdf_type OF uart_transmitter_top IS 

COMPONENT uart_tx
	PORT(clk_50M : IN STD_LOGIC;
		 trigger_raw : IN STD_LOGIC;
		 data_raw : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 busy : OUT STD_LOGIC;
		 serial_out : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT uart_tx_tester
	PORT(clk_50M : IN STD_LOGIC;
		 run_test_raw : IN STD_LOGIC;
		 tx_busy : IN STD_LOGIC;
		 trigger : OUT STD_LOGIC;
		 data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	busy_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	data_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	serial_out_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	trigger :  STD_LOGIC;


BEGIN 



b2v_inst : uart_tx
PORT MAP(clk_50M => clk_50M,
		 trigger_raw => trigger,
		 data_raw => data_out,
		 busy => busy_ALTERA_SYNTHESIZED,
		 serial_out => serial_out_ALTERA_SYNTHESIZED);


b2v_inst2 : uart_tx_tester
PORT MAP(clk_50M => clk_50M,
		 run_test_raw => switch_0,
		 tx_busy => busy_ALTERA_SYNTHESIZED,
		 trigger => trigger,
		 data_out => data_out);

serial_out <= serial_out_ALTERA_SYNTHESIZED;
busy <= busy_ALTERA_SYNTHESIZED;
busy_LED <= busy_ALTERA_SYNTHESIZED;
serial_out_LED <= serial_out_ALTERA_SYNTHESIZED;

END bdf_type;