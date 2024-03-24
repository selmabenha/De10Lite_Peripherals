library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uarth is
  generic (
    CLK_FREQ : integer := 50000000; -- CLK_FREQ parameter
    BAUD     : integer := 115200    -- BAUD parameter
  );
  port (
    clk         : in  std_logic;          -- Clock input
    reset       : in  std_logic;          -- Reset input
    rx          : in  std_logic;          -- Received serial stream
    rx_data     : out std_logic_vector(7 downto 0);  -- Deserialized byte
    rx_valid    : out std_logic;          -- Asserted when rx_data is valid
    tx          : out std_logic;          -- Transmitted serial stream
    tx_data     : in  std_logic_vector(7 downto 0);  -- Deserialized byte to transmit
    tx_transmit : in  std_logic;          -- Start Signal
    tx_ready    : out std_logic           -- Asserted when ready to accept data
  );
end entity uarth;

architecture behavioral of uart is
  -- Local Parameters
  constant SYNC_STAGES    : integer := 2;
  constant OSF            : integer := 16;
  constant CLK_DIV_COUNT  : integer := CLK_FREQ / (OSF * BAUD);

  -- Clock Dividing Counter
  signal count      : unsigned(15 downto 0);
  signal enable     : std_logic;

  -- RX Synchronizer
  signal rx_sync    : std_logic_vector(SYNC_STAGES-1 downto 0);
  signal rx_internal: std_logic;

  -- RX Signals
  type rx_state_type is (RX_WAIT, RX_CHECK_START, RX_RECEIVING, RX_WAIT_FOR_STOP);
  signal rx_state          : rx_state_type := RX_WAIT;
  signal rx_count          : unsigned(4 downto 0) := (others => '0');
  signal rx_sampleCount    : unsigned(2 downto 0) := (others => '0');
  signal rx_validInternal : std_logic := '0';
  signal rx_validLast     : std_logic := '0';

  -- TX Signals
  type tx_state_type is (TX_WAIT, TX_TRANSMITTING);
  signal tx_state       : tx_state_type := TX_WAIT;
  signal tx_dataBuffer  : std_logic_vector(9 downto 0) := (others => '0');
  signal tx_count       : unsigned(4 downto 0) := (others => '0');
  signal tx_sampleCount : unsigned(3 downto 0) := (others => '0');
begin
  -- Misc Synchronous Logic
  -- Clock Divider
  clock_divider: process(clk, reset)
  begin
    if reset = '1' then
      count <= (others => '0');
      enable <= '0';
    elsif rising_edge(clk) then
      if count = CLK_DIV_COUNT - 1 then
        count <= (others => '0');
        enable <= '1';
      else
        count <= count + 1;
        enable <= '0';
      end if;
    end if;
  end process clock_divider;

  -- RX Synchronizer
  rx_sync_process: process(clk)
  begin
    if rising_edge(clk) then
      rx_sync <= rx & rx_sync(SYNC_STAGES-2 downto 0);
    end if;
  end process rx_sync_process;

  -- Pulse Shortener for rx_valid signal
  rx_valid_process: process(clk)
  begin
    if rising_edge(clk) then
      rx_validLast <= rx_validInternal;
      rx_validInternal <= rx_sync(SYNC_STAGES-1) and not rx_validLast;
    end if;
  end process rx_valid_process;

  -- RX State Machine
  -- Functionality Description
  rx_state_machine: process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        rx_state <= RX_WAIT;
        rx_validInternal <= '0';
      elsif enable = '1' then
        case rx_state is
          -- Wait for the start bit
          when RX_WAIT =>
            if rx_internal = '0' then
              rx_state <= RX_CHECK_START;
              rx_count <= "00001";
            end if;
          -- Align with center of transmitted bit
          when RX_CHECK_START =>
            if rx_count = to_unsigned(OSF/2 - 1, 5) and rx_internal = '0' then
              rx_state <= RX_RECEIVING;
              rx_count <= (others => '0');
              rx_sampleCount <= (others => '0');
            elsif rx_count = to_unsigned(OSF/2 - 1, 5) and rx_internal = '1' then
              rx_state <= RX_WAIT;
            else
              rx_count <= rx_count + 1;
            end if;
          -- Sample in middle of received bit
          when RX_RECEIVING =>
            if rx_count = to_unsigned(OSF - 1, 5) then
              rx_count <= (others => '0');
              rx_data <= rx_internal & rx_data(6 downto 0);
              rx_sampleCount <= rx_sampleCount + 1;
              if rx_sampleCount = to_unsigned(7, 3) then
                rx_state <= RX_WAIT_FOR_STOP;
              end if;
            else
              rx_count <= rx_count + 1;
            end if;
          -- Wait until stop bit is received
          when RX_WAIT_FOR_STOP =>
            if rx_internal = '1' then
              rx_state <= RX_WAIT;
              rx_validInternal <= '1';
            end if;
          when others =>
            rx_state <= RX_WAIT;
        end case;
      end if;
    end if;
  end process rx_state_machine;

  -- TX State Machine
  -- Functionality Description
  tx_state_machine: process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        tx_state <= TX_WAIT;
        tx <= '1';
      else
        case tx_state is
          -- Wait for start signal
          when TX_WAIT =>
            tx <= '1';
            if tx_transmit = '1' then
              tx_dataBuffer <= "1" & tx_data & "0";
              tx_count <= (others => '0');
              tx_sampleCount <= (others => '0');
              tx_ready <= '0';
              tx_state <= TX_TRANSMITTING;
            else
              tx_ready <= '1';
            end if;
          -- Shift Out Data
          when TX_TRANSMITTING =>
            if enable = '1' then
              if tx_count = to_unsigned(OSF - 1, 5) then
                tx_count <= (others => '0');
                tx_sampleCount <= tx_sampleCount + 1;
                tx <= tx_dataBuffer(0);
                tx_dataBuffer <= "1" & tx_dataBuffer(9 downto 1);
                if tx_sampleCount = to_unsigned(9, 4) then
                  tx_state <= TX_WAIT;
               

 end if;
              else
                tx_count <= tx_count + 1;
              end if;
            end if;
          when others =>
            tx_state <= TX_WAIT;
        end case;
      end if;
    end if;
  end process tx_state_machine;
end architecture behavioral;