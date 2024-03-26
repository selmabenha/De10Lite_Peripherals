----------------------------------------------------------------------
-- File Downloaded from http://www.nandland.com
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity uart_tb_test is
end uart_tb_test;

architecture behave of uart_tb_test is

  component uart_tx is
    generic (
      g_CLKS_PER_BIT : integer := 87   -- Needs to be set correctly
      );
    port (
      i_clk       : in  std_logic;
      i_tx_dv     : in  std_logic;
      i_tx_byte   : in  std_logic_vector(7 downto 0);
      o_tx_active : out std_logic;
      o_tx_serial : out std_logic;
      o_tx_done   : out std_logic
      );
  end component uart_tx;

  component uart_rx is
    generic (
      g_CLKS_PER_BIT : integer := 87   -- Needs to be set correctly
      );
    port (
      i_clk       : in  std_logic;
      i_rx_serial : in  std_logic;
      o_rx_dv     : out std_logic;
      o_rx_byte   : out std_logic_vector(7 downto 0)
      );
  end component uart_rx;


  -- Test Bench uses a 10 MHz Clock
  -- Want to interface to 2400 baud UART
  -- 10000000 / 2400 = 87 Clocks Per Bit. < slow time!
  constant c_CLKS_PER_BIT : integer := 87;

  constant c_BIT_PERIOD : time := 8680 ns;
  
  type state_TB_type is (idle, wait_for_tx_done, send_command, wait_for_rx, tests_complete);
  type state_WRITE_type is (idle, start_bit, data_bits, stop_bit, done);

  
  signal r_CLOCK     : std_logic                     := '0';
  signal r_TX_DV     : std_logic                     := '0';
  signal r_TX_BYTE   : std_logic_vector(7 downto 0) := (others => '0');
  signal w_TX_SERIAL : std_logic;
  signal w_TX_DONE   : std_logic;
  signal w_RX_DV     : std_logic;
  signal w_RX_BYTE   : std_logic_vector(7 downto 0);
  signal r_RX_SERIAL : std_logic := '1';
  
  signal state_TB: state_TB_type	:= idle; -- State signal for TB state machine
  signal state_WRITE: state_WRITE_type	:= idle; -- State signal for WRITE state machine


-- Low-level byte-write
procedure UART_WRITE_BYTE (
    i_data_in   : in  std_logic_vector(7 downto 0);
    o_serial    : out std_logic;
    clock       : in  std_logic;
    reset       : in  std_logic;
    state_write : in  state_write_type;
    signal state_write_next : out state_write_type) is
begin
    -- Synchronous process
    process(clock, reset)
    begin
        if reset = '1' then
            -- Reset the state to idle
            state_write_next <= idle;
        elsif rising_edge(clock) then
            case state_write is
                when idle =>
                    -- Send Start Bit
                    o_serial <= '0';
                    state_write_next <= start_bit;

                when start_bit =>
                    -- Wait for start bit to finish
                    if clock = '1' then
                        state_write_next <= data_bits;
                    end if;

                when data_bits =>
                    -- Send Data Bits
                    if clock = '1' then
                        o_serial <= i_data_in(state_write_next'LEFT);
                        if state_write_next = stop_bit then
                            state_write_next <= done;
                        else
                            state_write_next <= state_write_next + 1;
                        end if;
                    end if;

                when stop_bit =>
                    -- Send Stop Bit
                    o_serial <= '1';
                    state_write_next <= done;

                when others =>
                    -- Error handling, should not occur
                    assert false report "Unknown state in UART_WRITE_BYTE" severity failure;
            end case;
        end if;
    end process;
end UART_WRITE_BYTE;


begin

-- Instantiate UART transmitter 
UART_TX_INST : uart_tx 
  generic map (
    g_CLKS_PER_BIT => c_CLKS_PER_BIT
      )
    port map (
      i_clk       => r_CLOCK,
      i_tx_dv     => r_TX_DV,
      i_tx_byte   => r_TX_BYTE,
      o_tx_active => open,
      o_tx_serial => w_TX_SERIAL,
      o_tx_done   => w_TX_DONE
      );

  -- Instantiate UART Receiver
  UART_RX_INST : uart_rx
    generic map (
      g_CLKS_PER_BIT => c_CLKS_PER_BIT
      )
    port map (
      i_clk       => r_CLOCK,
      i_rx_serial => r_RX_SERIAL,
      o_rx_dv     => w_RX_DV,
      o_rx_byte   => w_RX_BYTE
      );

  r_CLOCK <= not r_CLOCK after 50 ns;

	-- Process as state machine
	process (r_CLOCK, w_TX_DONE, w_RX_BYTE)
	begin
		case state_TB is
			when idle =>
				-- Tell the UART to send a command.
				if rising_edge(r_CLOCK) then
					r_TX_DV   <= '1';
					r_TX_BYTE <= X"AB";
					state_TB <= wait_for_tx_done;
				end if;

			when wait_for_tx_done =>
				-- Wait for transmission to complete
				if rising_edge(r_CLOCK) and (w_TX_DONE = '1') then
					r_TX_DV   <= '0';
					state_TB <= send_command;
				end if;

			when send_command =>
				-- Send a command to the UART
				if rising_edge(r_CLOCK) then
					UART_WRITE_BYTE(X"3F", r_RX_SERIAL);
					state_TB <= wait_for_rx;
				end if;

			when wait_for_rx =>
				-- Wait for the received byte
				if rising_edge(r_CLOCK) then
					-- Check that the correct command was received
					if w_RX_BYTE = X"3F" then
						report "Test Passed - Correct Byte Received" severity note;
					else
						report "Test Failed - Incorrect Byte Received" severity note;
					end if;
					state_TB <= tests_complete;
				end if;

			when tests_complete =>
				-- End the test
				assert false report "Tests Complete" severity failure;

			when others =>
				-- Error handling, should not occur
				assert false report "Unknown state" severity failure;
		end case;
	end process;

	-- Process for UART_WRITE_BYTE state machine
	process (r_CLOCK, state_WRITE)
	begin
		UART_WRITE_BYTE(r_TX_BYTE, w_TX_SERIAL);
	end process;

end behave;
