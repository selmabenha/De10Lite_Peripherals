--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : Inshallah                                                    ==
--== Component : accel                                                        ==
--==                                                                          ==
--==============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



architecture rtl of accel is
	constant SPI_CLK_FREQ : natural := 200;  
	constant UPDATE_FREQ  : natural := 1;    

	
	signal reset_n        : std_logic;
	signal clk            : std_logic;
	signal spi_clk        : std_logic;
	signal spi_clk_out    : std_logic;

	
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
        
		  
		  data_update   : out std_logic;
		  data_x        : out std_logic_vector(15 downto 0);
		  data_y        : out std_logic_vector(15 downto 0);
		  
		  
		  spi_sdi       : out std_logic;
		  spi_sdo       : in  std_logic;
		  spi_csn       : out std_logic;
		  spi_clk_1      : out std_logic;
		  
		  
		  interrupt     : in  std_logic_vector(1 downto 0) 
		);
	END COMPONENT spi_control;
	
begin
 
 
ip_inst: ip
	port map(
		inclk0 => MAX10_CLK1_50, c0 => clk, c1=>spi_clk, c2=>spi_clk_out
	);
 
 

 controller: spi_control
		port map(reset_n, clk, spi_clk, spi_clk_out, 
		data_update, data_x, data_y, 
		GSENSOR_SDI, GSENSOR_SDO, GSENSOR_CS_N, GSENSOR_SCLK, GSENSOR_INT
		);
 
 

 
 reset_n <= KEY(0);

 
 
 seg_0: seg7
	port map(
		segs(4) => zero, segs(3) => data_x(11), segs(2) => data_x(10),
		segs(1) => data_x(9), segs(0) => data_x(8), display(6) => HEX0(6),
		display(5) => HEX0(5), display(4) => HEX0(4), display(3) => HEX0(3),
		display(2) => HEX0(2), display(1) => HEX0(1), display(0) => HEX0(0)
	);
 
 
 
 

 
 
 
 
end architecture rtl;
