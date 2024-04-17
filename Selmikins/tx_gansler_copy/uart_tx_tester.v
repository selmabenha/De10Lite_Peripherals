//  ------------------------------------------------------------------------------
//
//  uart_tx_tester.v -- synthesizable tester for uart_tx.v
//
//  Copyright (C) 2020 Michael Gansler
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>.
//
//  ------------------------------------------------------------------------------
//
//  Module:       uart_tx_tester.v
//
//  Objective:    Synthesaizable tester for uart_tx by feeding it a 16 byte
//                message every few seconds for testing on hardware 
//                with a scope or logic analyzer.
//
//  Assumptions:  50 MHz input clock
//                16 byte long test message
//                Development done on Terasic DE10-Lite board with Altera MAX10 FPGA
//
//  Notes:        This is a simple tester module to test uart_tx.v.  This is 
//                synthesizable code which sends a 16 byte ASCII message to 
//                uart_tx every few seconds. It drives the data and trigger 
//                lines while monitoring the busy line to pace the characters.
//
//                A full test bench for simulation would also be helpful, but has
//                not yet been created at this time.
//                  
//
`default_nettype none                // Require all nets to be declared before used.
                                     // --> typo'd net names get trapped


module uart_tx_tester
(
   input                clk_50M,          // Input clock, assumed 50 MHz
   input                run_test_raw,     // HIGH indicates to continuously run test
   input                tx_busy,          // HIGH indicates transmitter is busy 
   
   output  reg   [7:0]  data_out,         // Data byte (8 bits) to transmit
   output  reg          trigger           // Trigger to tell UART module to begin transmission
);

reg                     run_test_0   = 0;           // Synchronizer for 'start test' switch input
reg                     run_test     = 0;           // Synchronizer for 'start test' switch input

reg         [5:0]       tester_state = 0;           // FSM state variable

reg        [31:0]       byte_index   = (8*16)-1;    // Pointer to beginning of next byte to transmit in 16 byte message

reg        [31:0]       pause_delay  = 0;           // Counter for delay between re-transmissions of message

reg         [5:0]       trigger_ctr  = 0;           // Delay to hold trigger high, in clock cycles

                                 // Byte position:
                                 //
                                 // 111111
                                 // 5432109876543210
reg  [(8*16)-1:0]       byte_str = "Hello World!    ";  // 16 byte message to transmit

localparam STATE_IDLE       = 6'b00_0000;           // Legal values for tester_state
localparam STATE_LOAD       = 6'b00_0010;           // Legal values for tester_state
localparam STATE_TRIGGER    = 6'b00_0100;           // Legal values for tester_state
localparam STATE_POLL_BUSY  = 6'b00_1000;           // Legal values for tester_state
localparam STATE_PAUSE      = 6'b01_0000;           // Legal values for tester_state

localparam MSG_DELAY        = 32'd100_000_000;      // Delay between messages re-transmissions, in clk cycles

//     
// Synchronizer for "run_test" input since, as tested, this comes from a 
// slide switch on the DE10-Lite board, which is not synchronous with the
// clock.  See more on clock domain crossing and metastability to better
// understand this topic.
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
      
         trigger <= 1'b0;
         
         if (run_test) begin
         
            byte_index   <= (8*16)-1;      // Point to 1st bit of 1st byte in message.
            tester_state <= STATE_LOAD;    // Move on to next state.
            
         end
         
      end
      
      //
      // Output next byte to transmitter module, with trigger still low
      // so it won't transmit yet.
      //
      STATE_LOAD: begin
         
         trigger      <= 1'b0;                       // Make sure trigger is LOW while setting data byte.
         data_out     <= byte_str[byte_index -:8];   // Set data byte to transmit.
         trigger_ctr  <= 6'd5;                       // Init counter which defines trigger HIGH time.
         tester_state <= STATE_TRIGGER;              // Move on to next state.
         
      end
      
      //
      // Now that previous state output'd the next byte to transmit,
      // assert the trigger signal to begin the transmission.
      // 
      STATE_TRIGGER: begin
      
         trigger     <= 1'b1;                  // Assert trigger to begin transmission.
         trigger_ctr <= trigger_ctr - 6'd1;    // Keep trigger high for N cycles to accommodate synchronizer
                                               //  in uart_tx module.  Handles latency between trigger assertion
                                               //  here and FSM in uart_tx module beginning transmission and 
                                               //  setting the busy flag.  
         
         if (trigger_ctr==0)
            tester_state <= STATE_POLL_BUSY;   // Move on to next state.
         
      end
      
      //
      // Clear trigger signal, and wait until all bits shifted out
      // for the current byte.
      //
      STATE_POLL_BUSY: begin

         trigger <= 1'b0;                       // Clear trigger flag now that N cycles have passed.
         
         if (~tx_busy) begin                    // Check to see if uart_tx module still shifting out bits.
         
            if (byte_index<=7) begin            // Check to see if just transmitted last byte of message.  7 since that
                                                // is the location of the MSbit of the final byte of the message.
               pause_delay  <= 32'd0;           // All done transmitting message, so setup for delay between message transmissions.
               tester_state <= STATE_PAUSE;     // Move on to next state.
               
            end else begin 
            
               byte_index   <= byte_index - 32'd8;  // More bytes to send so point to next byte.
               tester_state <= STATE_LOAD;          // Move on to next state.
               
            end
              
         end
         
      end
      
      //
      // Once transmitted full message, pause before 
      // transmitting message again for testing convenience.
      //
      STATE_PAUSE: begin
      
         pause_delay <= pause_delay + 32'd1;
         
         if (pause_delay>MSG_DELAY)            // Wait for delay to expire.
            tester_state <= STATE_IDLE;
            
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
