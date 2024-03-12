library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity accel is
	port (
		-- CLOCK
		ADC_CLK_10       : in std_logic;
		MAX10_CLK1_50    : in std_logic;
		MAX10_CLK2_50    : in std_logic;

		-- SEG7
		HEX0             : out std_logic_vector(7 downto 0);
		HEX1             : out std_logic_vector(7 downto 0);
		HEX2             : out std_logic_vector(7 downto 0);
		HEX3             : out std_logic_vector(7 downto 0);
		HEX4             : out std_logic_vector(7 downto 0);
		HEX5             : out std_logic_vector(7 downto 0);

		-- KEY
		KEY              : in std_logic_vector(1 downto 0);

		-- LED
		LEDR             : out std_logic_vector(9 downto 0);

		-- SW
		SW               : in std_logic_vector(9 downto 0);

		-- Accelerometer ports
		GSENSOR_CS_N     : out std_logic;
		GSENSOR_INT      : in std_logic_vector(2 downto 1);
		GSENSOR_SCLK     : out std_logic;
		GSENSOR_SDI      : inout std_logic;
		GSENSOR_SDO      : inout std_logic
		
);
end entity accel;

architecture rtl of accel is
	constant SPI_CLK_FREQ : natural := 200;  -- SPI Clock (Hz)
	constant UPDATE_FREQ  : natural := 1;    -- Sampling frequency (Hz)

	-- clks and reset
	signal reset_n        : std_logic;
	signal clk            : std_logic;
	signal spi_clk        : std_logic;
	signal spi_clk_out    : std_logic;

	-- output data
	signal data_update    : std_logic;
	signal data_x         : std_logic_vector(15 downto 0);
	signal data_y         : std_logic_vector(15 downto 0);
	
	signal zero 		 : std_logic := '0';

	COMPONENT seg7 is
		port(
			segs : in std_logic_vector(4 downto 0);
			display : out std_logic_vector(6 downto 0)
		);
	END COMPONENT seg7;
	
	COMPONENT ip is
		port(
			inclk0:  in std_logic;
			c0: out std_logic;
			c1: out std_logic;
			c2: out std_logic
		);
	END COMPONENT ip;
	
	COMPONENT spi_control is
		port(
		 reset_n       : in  std_logic;
       clk           : in  std_logic;
       spi_clk       : in  std_logic;
       spi_clk_out   : in  std_logic;
        
		  -- Output signals
		  data_update   : out std_logic;
		  data_x        : out std_logic_vector(15 downto 0);
		  data_y        : out std_logic_vector(15 downto 0);
		  
		  -- SPI signals
		  spi_sdi       : out std_logic;
		  spi_sdo       : in  std_logic;
		  spi_csn       : out std_logic;
		  spi_clk_1      : out std_logic;
		  
		  -- Interrupt signal
		  interrupt     : in  std_logic_vector(1 downto 0) 
		);
	END COMPONENT spi_control;
	
begin
 -- Phase-locked Loop (PLL) instantiation
 -- Code for PLL instantiation was not provided in the Verilog, hence it's not included here
ip_inst: ip
	port map(
		inclk0 => MAX10_CLK1_50, c0 => clk, c1=>spi_clk, c2=>spi_clk_out
	);
 -- Instantiation of the spi_control module
 -- The code for spi_control instantiation was not provided in the Verilog, hence it's not included here

 controller: spi_control
		port map(reset_n, clk, spi_clk, spi_clk_out, 
		data_update, data_x, data_y, 
		GSENSOR_SDI, GSENSOR_SDO, GSENSOR_CS_N, GSENSOR_SCLK, GSENSOR_INT
		);
 -- Main block
 -- To make the module do something visible, the 16-bit data_x is displayed on four of the HEX displays in hexadecimal format.

 -- Pressing KEY0 freezes the accelerometer's output
 reset_n <= KEY(0);

 -- 7-segment displays HEX0-3 show data_x in hexadecimal
 
 seg_0: seg7
	port map(
		segs(4) => zero, segs(3) => data_x(11), segs(2) => data_x(10),
		segs(1) => data_x(9), segs(0) => data_x(8), display(6) => HEX0(6),
		display(5) => HEX0(5), display(4) => HEX0(4), display(3) => HEX0(3),
		display(2) => HEX0(2), display(1) => HEX0(1), display(0) => HEX0(0)
	);
 --HEX0 <= std_logic_vector(to_unsigned(data_x(11 downto 8), HEX0'length));
 --HEX1 <= std_logic_vector(to_unsigned(data_x(7 downto 4), HEX1'length));
 --HEX2 <= std_logic_vector(to_unsigned(data_x(11 downto 8), HEX2'length));
 --HEX3 <= std_logic_vector(to_unsigned(data_x(7 downto 4), HEX3'length));

 -- A few statements just to light some LEDs
 --HEX4 <= std_logic_vector(to_unsigned(data_x(7 downto 4), HEX4'length));
 --HEX5 <= std_logic_vector(to_unsigned(data_x(7 downto 4), HEX5'length));
 -- LEDR <= SW(9 downto 8) & data_x(7 downto 0); -- commented out because LEDR is defined as output, not inout
end architecture rtl;
