library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart_tx_tester is
    Port (
        clk_50M : in STD_LOGIC;               -- Input clock, assumed 50 MHz
        run_test_raw : in STD_LOGIC;          -- HIGH indicates to continuously run test
        tx_busy : in STD_LOGIC;               -- HIGH indicates transmitter is busy 
        data_out : out STD_LOGIC_VECTOR (7 downto 0);  -- Data byte (8 bits) to transmit
        trigger : out STD_LOGIC                -- Trigger to tell UART module to begin transmission
    );
end uart_tx_tester;

architecture Behavioral of uart_tx_tester is

    signal run_test_0 : std_logic := '0';          -- Synchronizer for 'start test' switch input
    signal run_test : std_logic := '0';            -- Synchronizer for 'start test' switch input
    signal tester_state : unsigned(5 downto 0) := (others => '0');  -- FSM state variable
    -- signal byte_index : unsigned(31 downto 0) := unsigned(8*16)-unsigned(1);          -- Pointer to beginning of next byte to transmit in 16 byte message
    constant BYTE_INDEX_INIT: natural := (8*16)-1; -- Calculate the initial value for byte_index
    signal byte_index : unsigned(31 downto 0) := to_unsigned(BYTE_INDEX_INIT, 32); -- Initialize byte_index with the calculated value
	 signal pause_delay : unsigned(31 downto 0) := (others => '0');  -- Counter for delay between re-transmissions of message
    signal trigger_ctr : unsigned(5 downto 0) := (others => '0');    -- Delay to hold trigger high, in clock cycles

    constant STATE_IDLE : unsigned(5 downto 0) := "000000";          -- Legal values for tester_state
    constant STATE_LOAD : unsigned(5 downto 0) := "000010";          -- Legal values for tester_state
    constant STATE_TRIGGER : unsigned(5 downto 0) := "000100";       -- Legal values for tester_state
    constant STATE_POLL_BUSY : unsigned(5 downto 0) := "001000";     -- Legal values for tester_state
    constant STATE_PAUSE : unsigned(5 downto 0) := "010000";         -- Legal values for tester_state

    constant MSG_DELAY : unsigned(31 downto 0) := to_unsigned(100_000_000, 32);  -- Delay between messages re-transmissions, in clk cycles
	 
	 -- Message to transmit
    signal byte_str : std_logic_vector((8*16)-1 downto 0) := "01001000" & "01100101" & "01101100" & "01101100" & "01101111" & "00100000" & "01010111" & "01101111" &
                                                            "01110010" & "01101100" & "01100100" & "00100001" & "00100000" & "00100000" & "00100000" & "00100000";


begin

    -- Synchronizer for "run_test" input since, as tested, this comes from a 
    -- slide switch on the DE10-Lite board, which is not synchronous with the
    -- clock.
    process (clk_50M) begin
        if rising_edge(clk_50M) then
            run_test_0 <= run_test_raw;
            run_test <= run_test_0;
        end if;
    end process;

    -- Main Finite State Machine that sequences the test
    process (clk_50M) begin
        if rising_edge(clk_50M) then
            case tester_state is
                -- Wait for request to begin test.
                when STATE_IDLE =>
                    trigger <= '0';
                    if run_test = '1' then
                        byte_index <= to_unsigned(BYTE_INDEX_INIT, 32);
                        tester_state <= STATE_LOAD;
                    end if;
                    
                -- Output next byte to transmitter module, with trigger still low
                -- so it won't transmit yet.
                when STATE_LOAD =>
                    trigger <= '0';
                    data_out <= byte_str(to_integer(byte_index) downto to_integer(byte_index)-7);
                    trigger_ctr <= to_unsigned(5, 6);
                    tester_state <= STATE_TRIGGER;
                    
                -- Now that previous state output'd the next byte to transmit,
                -- assert the trigger signal to begin the transmission.
                when STATE_TRIGGER =>
                    trigger <= '1';
                    trigger_ctr <= trigger_ctr - 1;
                    if trigger_ctr = 0 then
                        tester_state <= STATE_POLL_BUSY;
                    end if;
                    
                -- Clear trigger signal, and wait until all bits shifted out
                -- for the current byte.
                when STATE_POLL_BUSY =>
                    trigger <= '0';
                    if tx_busy = '0' then
                        if byte_index <= 7 then
                            pause_delay <= (others => '0');
                            tester_state <= STATE_PAUSE;
                        else
                            byte_index <= byte_index - 8;
                            tester_state <= STATE_LOAD;
                        end if;
                    end if;
                    
                -- Once transmitted full message, pause before 
                -- transmitting message again for testing convenience.
                when STATE_PAUSE =>
                    pause_delay <= pause_delay + 1;
                    if pause_delay > to_integer(MSG_DELAY) then
                        tester_state <= STATE_IDLE;
                    end if;
                    
                -- Should never get here, but if do, return to IDLE
                when others =>
                    tester_state <= STATE_IDLE;
            end case;
        end if;
    end process;

end Behavioral;
