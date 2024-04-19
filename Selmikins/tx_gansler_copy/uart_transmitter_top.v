// Copyright (C) 2021  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 21.1.0 Build 842 10/21/2021 SJ Lite Edition"
// CREATED		"Tue Apr 16 22:34:49 2024"

module uart_transmitter_top(
	clk_50M,
	switch_0,
	serial_out,
	busy,
	busy_LED,
	serial_out_LED
);


input wire	clk_50M;
input wire	switch_0;
output wire	serial_out;
output wire	busy;
output wire	busy_LED;
output wire	serial_out_LED;

wire	busy_ALTERA_SYNTHESIZED;
wire	[7:0] data_out;
wire	serial_out_ALTERA_SYNTHESIZED;
wire	trigger;





uart_tx	b2v_inst(
	.clk_50M(clk_50M),
	.trigger_raw(trigger),
	.data_raw(data_out),
	.busy(busy_ALTERA_SYNTHESIZED),
	.serial_out(serial_out_ALTERA_SYNTHESIZED));


uart_tx_tester	b2v_inst2(
	.clk_50M(clk_50M),
	.run_test_raw(switch_0),
	.tx_busy(busy_ALTERA_SYNTHESIZED),
	.trigger(trigger),
	.data_out(data_out));

assign	serial_out = serial_out_ALTERA_SYNTHESIZED;
assign	busy = busy_ALTERA_SYNTHESIZED;
assign	busy_LED = busy_ALTERA_SYNTHESIZED;
assign	serial_out_LED = serial_out_ALTERA_SYNTHESIZED;

endmodule
