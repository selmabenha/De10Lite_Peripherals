-- Testbench for UART Transmitter TX Module

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_uart_tx is
end tb_uart_tx;

architecture sim of tb_uart_tx is

    -- Signals
    signal clk          : std_logic := '0';      -- Clock signal
    signal reset        : std_logic := '0';      -- Reset signal
	 signal rx          	: std_logic;          	 -- Received serial stream
    signal rx_data     	: std_logic_vector(7 downto 0);  -- Deserialized byte
    signal rx_valid    	: std_logic;          	 -- Asserted when rx_data is valid
    signal tx           : std_logic;             -- Transmitted serial stream
    signal tx_data      : std_logic_vector(7 downto 0);             -- Deserialized byte to transmit
    signal tx_transmit  : std_logic := '0';      -- Start Signal
    signal tx_ready     : std_logic;             -- Asserted when ready to accept data
    signal gpio         : std_logic;             -- GPIO output
    signal SW           : std_logic_vector(9 downto 0) := (others => '0');  -- Switches
	 signal counter 		: integer := 0;			 -- Counter Signal for outside loop
    
begin
    
    -- Instantiate UART module
    uut: entity work.uarth
        generic map (
            CLK_FREQ => 50000,  -- CLK_FREQ parameter -3 0s
            BAUD     => 200      -- BAUD parameter, 115200
        )
        port map (
            clk         => clk,
            reset       => reset,
				rx          =>	rx,
				rx_data     =>	rx_data,
				rx_valid    =>	rx_valid,
            tx          => tx,
            tx_data     => tx_data,
            tx_transmit => tx_transmit,
            tx_ready    => tx_ready
        );
          
    -- Process to control transmission based on switch value
    tx_process: process(clk)
	 begin
		 if rising_edge(clk) then
			 -- Check if tx_ready is asserted
			 if tx_ready = '0' then
             -- Set tx_ready to '1' to indicate readiness for transmission
             tx_ready <= '1';
			 else
             -- Set tx_data to value of switches
             tx_data <= SW(7 downto 0);

             -- Start transmission
             tx_transmit <= '1';

             -- Wait for next rising edge of clock
             wait until rising_edge(clk);

             -- End transmission
             tx_transmit <= '0';
			 end if;
		 end if;
	 end process;


end sim;
