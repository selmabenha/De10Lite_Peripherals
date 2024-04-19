library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart_tx is
    Port (
        clk_50M : in STD_LOGIC;               -- Input clock, assumed 50 MHz
        data_raw : in STD_LOGIC_VECTOR (7 downto 0);  -- Data byte (8 bits) to transmit
        trigger_raw : in STD_LOGIC;           -- Tells module to begin transmission of data_raw byte
        busy : out STD_LOGIC;                 -- Flag to indicate a transmission is in progress
        serial_out : out STD_LOGIC            -- UART output serial datastream
    );
end uart_tx;

architecture Behavioral of uart_tx is
	 
	 constant CLKS_PER_BIT: integer := 868;
	 
    type state_type is (STATE_IDLE, STATE_TRANSMITTING, STATE_CLEANUP);
    signal tx_state : state_type := STATE_IDLE;  -- State variable for main finite state machine
    signal data_aug : std_logic_vector(9 downto 0) := (others => '0');  -- Augmented data word to transmit that includes START bit, data byte, and STOP BIT
    signal tx_index : unsigned(3 downto 0) := (others => '0');  -- Index of bit currently transmitting
    signal bit_delay : unsigned(31 downto 0) := (others => '0'); -- Timer to regulate baud rate

    signal trigger_0 : std_logic := '0';  -- Synchronizer on trigger input signal
    signal trigger : std_logic := '0';    -- Synchronizer on trigger input signal

    -- Localparam CLKS_PER_BIT is not needed in VHDL since it's used as a constant value in the code directly

begin

    process (clk_50M) begin
        if rising_edge(clk_50M) then
            case tx_state is
                -- Wait for trigger condition indicating it's time to transmit a byte.
                when STATE_IDLE =>
                    busy <= '0';                 -- Indicate that transmitter is idle.
                    serial_out <= '1';           -- Idle output HIGH, per standard UART behavior.
                    if trigger = '1' then        -- Check if received trigger to TX a byte
                        data_aug <= '1' & data_raw & '0';   -- Create augmented byte with start and stop bits
                        busy <= '1';                        -- Indicate that transmitter is busy.
                        bit_delay <= (others => '0');       -- Clear timer used to track duration of each bit
                        tx_index <= (others => '0');        -- Point to first bit of data_aug to TX, namely the start bit
                        tx_state <= STATE_TRANSMITTING;     -- Move on to next state
                    end if;
                    
                -- Transmit all 10 bits with proper the proper duration per bit based on the selected baud rate.
                when STATE_TRANSMITTING =>
                    serial_out <= data_aug(to_integer(tx_index));  -- Set output based on current bit to transmit
                    bit_delay <= bit_delay + 1;                     -- Keep track of duration to hold this bit
                    if bit_delay > to_unsigned(CLKS_PER_BIT, 32) then  -- Check if bit duration has expired
                        if tx_index = "1001" then                  -- Check if just transmitted the final bit, i.e. the STOP bit
                            tx_state <= STATE_CLEANUP;            -- Move on to next state
                        else
                            tx_index <= tx_index + 1;             -- Still more bits to send so, point to next bit
                            bit_delay <= (others => '0');         -- Clear counter used to regulate baud rate
                        end if;
                    end if;
                    
                -- Pause for a few bit durations after full byte transmitted.
                when STATE_CLEANUP =>
                    bit_delay <= bit_delay + 1;                    -- Keep track of how long been in cleanup state
                    if bit_delay > to_unsigned(5 * CLKS_PER_BIT, 32) then  -- If paused HIGH long enough, then return to idle state
                        tx_state <= STATE_IDLE;
                    end if;
                    
                -- Should never get here, but if do, return to IDLE
                when others =>
                    tx_state <= STATE_IDLE;
            end case;
        end if;
    end process;

    -- Synchronizer for trigger input
    process (clk_50M) begin
        if rising_edge(clk_50M) then
            trigger_0 <= trigger_raw;
            trigger <= trigger_0;
        end if;
    end process;

end Behavioral;
