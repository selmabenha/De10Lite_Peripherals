//  ------------------------------------------------------------------------------
//
//  uart_rx_tester.v -- synthesizable tester for uart_rx.v
//
//  Copyright (C) 2020 Michael Gansler - Selma Benhassine variation based off of his code
//
//  ------------------------------------------------------------------------------
//
//  Module:       uart_rx_tester.v
//
//  Objective:    Synthesizable tester for uart_rx by receiving an 8-bit message
//                every few seconds for testing on hardware with LED indicators.
//
//  Assumptions:  50 MHz input clock
//                LED indicators connected to the FPGA to display received data
//                Development done on Terasic DE10-Lite board with Altera MAX10 FPGA
//
//  Notes:        This is a simple tester module to test uart_rx.v. This module
//                simulates the reception of an 8-bit message and displays it
//                using LED indicators. It receives the data byte and triggers
//                the UART receiver to process it.
//                  
//
`default_nettype none                // Require all nets to be declared before used.
                                     // --> typo'd net names get trapped


module uart_rx_tester
(
   input                clk_50M,          // Input clock, assumed 50 MHz
   input                run_test_raw,     // HIGH indicates to continuously run test
   input                rx_ready,         // HIGH indicates receiver is ready to receive data
   
   output reg   [7:0]   data_in,          // Data byte (8 bits) received from UART
   output reg          rx_trigger         // Trigger to tell UART receiver to process received data
);

reg                     run_test_0   = 0;           // Synchronizer for 'start test' switch input
reg                     run_test     = 0;           // Synchronizer for 'start test' switch input

reg         [2:0]       tester_state = 0;           // FSM state variable

reg        [31:0]       pause_delay  = 0;           // Counter for delay between receiving messages

localparam STATE_IDLE       = 3'd0;            // Legal values for tester_state
localparam STATE_RECEIVE    = 3'd1;            // Legal values for tester_state
localparam STATE_PAUSE      = 3'd2;            // Legal values for tester_state

localparam MSG_DELAY        = 32'd100_000_000; // Delay between receiving messages, in clk cycles

//     
// Synchronizer for "run_test" input since, as tested, this comes from a 
// slide switch on the FPGA board, which is not synchronous with the
// clock. 
//
always @(posedge  clk_50M) begin

   run_test_0 <= run_test_raw;
   run_test   <= run_test_0;
   
end

//
// Main Finite State Machine that sequences the test
//
always @(posedge  clk_50M) begin

   case (tester_state)
   
      //
      // Wait for request to begin test.
      //
      STATE_IDLE: begin
      
         rx_trigger <= 1'b0;
         
         if (run_test) begin
            tester_state <= STATE_RECEIVE;    // Move on to next state.
         end
         
      end
      
      //
      // Receive the data byte from UART receiver module and trigger its processing
      //
      STATE_RECEIVE: begin
         
         rx_trigger <= 1'b1;                // Trigger UART receiver to process received data
         tester_state <= STATE_PAUSE;      // Move on to next state.
         
      end
      
      //
      // Pause before receiving next message
      //
      STATE_PAUSE: begin
      
         pause_delay <= pause_delay + 32'd1;
         
         if (pause_delay > MSG_DELAY) begin // Wait for delay to expire.
            data_in <= 8'hFF;               // Indicate receiving is done, and the LED indicators could turn off
            tester_state <= STATE_IDLE;     // Move back to idle state
         end
         
      end

      //
      // Should never get here, but if do, return to IDLE
      //
      default : begin
         tester_state <= STATE_IDLE;
      end
      
   endcase
   
end

endmodule
