--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : johnson                                                      ==
--== Component : spi_accelerometer                                            ==
--==                                                                          ==
--==============================================================================

library ieee;
use ieee.std_logic_1164.all;




architecture STR of spi_accelerometer is

	
	signal go : std_logic;
	signal pol : std_logic;
	signal pha : std_logic;
	signal bytes : std_logic_vector (3 downto 0);
	signal rxData : std_logic_vector (7 downto 0);
	signal rxDataReady	: std_logic := '0';
	signal txData 		:		 std_logic_vector (7 downto 0);
	signal accel_data	:		 std_logic_vector (47 downto 0);
	
	signal sclk_out : std_logic;
	
	signal sclk_buffer	:	std_logic;
	signal mosi_buffer	:	std_logic;
	signal cs_buffer	:	std_logic;

	signal int1_buffer : std_logic;
	signal stateID : std_logic_vector(2 downto 0);
	
	COMPONENT spi_master IS
		port (
		clk	: in std_logic;
		rst	: in std_logic;
      	mosi	: out std_logic;
		miso 	: in std_logic;
		sclk_out : out std_logic; 
		cs_out	: out std_logic;
		int1 	: in std_logic;
		int2 	: in std_logic;
		go		: in std_logic;
		pol	: in std_logic;
		pha   : in std_logic;
		bytes : in std_logic_vector (3 downto 0);
		rxData: out std_logic_vector(7 downto 0);
		txData: in  std_logic_vector(7 downto 0);
		rxDataReady: out std_logic
		);
	END COMPONENT;

	COMPONENT clock_div IS
		port (
		clk_in : in std_logic;
			clk_out : out std_logic;
			rst	: in std_logic;
			enable : in std_logic;
			bytes : in std_logic_vector(3 downto 0);
			polarity : in std_logic;
			clk_active :	out std_logic;
			byte_flag : out std_logic
		);
	END COMPONENT;

	COMPONENT accel_driver IS
		port (
		rst			:		in std_logic;
		clk			:		in std_logic;
		int1			:		in std_logic;
		rxDataReady	:		in	std_logic;
		go				:		out std_logic;
		pol			:		out std_logic;
		pha			:		out std_logic;
		bytes 		:		out std_logic_vector (3 downto 0);
		txData 		:		out std_logic_vector (7 downto 0);
		rxData		: 		in std_logic_vector ( 7 downto 0);
		accel_data	:		out std_logic_vector (47 downto 0);
		
		stateID 		:      out std_logic_vector (2 downto 0);
		c				: out std_logic;
		intBypass   : in std_logic
        	);
	END COMPONENT;
begin

	
	
	
	U_SPI_MASTER	:  spi_master
		port map(
		clk	=> clk50MHz,
		rst	=> rst,
      	mosi	=> mosi_buffer,
		miso 	=> miso,
		sclk_out => sclk_out,
		cs_out	=> cs_buffer,
		int1 	=> '0',
		int2 	=> '0',
		go		=> go,
		pol	=> pol,
		pha   => pha,
		bytes => bytes,
		rxData	=> rxData,
		txData	=> txData,
		rxDataReady	=> rxDataReady
	);
	
	mosi <= mosi_buffer;
	cs <= cs_buffer;
	sclk <= sclk_buffer;
	
	rst_led <= not rst;
	
	U_ACCEL_DRIVER : accel_driver
		port map(
			rst			=> rst,
			clk			=> clk50MHz,
			int1			=> int1_buffer,
			rxDataReady	=> rxDataReady,
			go				=> go,
			pol			=> pol,
			pha			=> pha,
			bytes 		=> bytes,
			txData 		=> txData,
			rxData		=> rxData,
			accel_data	=> accel_data,
			stateID => stateID,
			intBypass => intBypass
		);

	accel <= accel_data(47 downto 0);
	
	process(clk50MHz, rst)
	begin
	
		if(rst = '1') then
			sclk_buffer <= '1';
			int1_buffer <= '0';
		elsif(clk50MHz'event and clk50MHz = '1') then
			sclk_buffer <= sclk_out;
			int1_buffer <= int1;
		end if;
	end process;
	
end STR;
