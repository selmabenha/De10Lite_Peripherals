--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : accelerometer_ADXL345                                        ==
--== Component : spi_master                                                   ==
--==                                                                          ==
--==============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;




architecture FSM_1P of spi_master is





type STATE_TYPE is (S_IDLE, S_TXRX);
signal state, next_state : STATE_TYPE;





signal sclk : std_logic;
signal enable : std_logic := '0';

signal polarity : std_logic;
signal last_clk_active : std_logic;
signal clk_active : std_logic;
signal byte_flag : std_logic;




signal rx_buffer	: std_logic_vector (7 downto 0) := (others => '1');
signal tx_buffer	: std_logic_vector (7 downto 0);
signal cs : std_logic := '1';
constant byte_w : natural := 8;
signal bit : integer range -1 to 8 := 7; 
signal w_r : std_logic := '0'; 
signal phase_Delay : std_logic := '0';
signal last_cs : std_logic := '1';
signal last_sclk : std_logic := '0';

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

begin


	U_CLOCK_DIV : clock_div
		port map(
			clk_in => clk,
			clk_out => sclk,
			rst	=> rst,
			enable => enable,
			bytes	=> bytes,
			polarity => polarity,
			clk_active => clk_active,
			byte_flag => byte_flag);



	
	
	process (clk, rst)
	begin
		
		if(rst = '1') then
			state <= S_IDLE;
			last_clk_active <= '0';
			enable <= '0';
			cs <= '1';
		elsif (clk'event and clk = '1') then
			
	
		
		
		
			rxDataReady <= '0'; 
			polarity <= pol;
			
		
			enable <= '0';
			
			last_clk_active <= clk_active;
			
			case state is
				when S_IDLE =>
					
					
					cs <= '1';
					if((accel_input = '1' or int2 = '1' or go = '1') and rst = '0') then
						state <= S_TXRX;
	
	
						enable <= '1';
						cs <= '0';
						tx_buffer <= txData; 
						
					end if;
				
				
				when S_TXRX =>
					
					
					enable <= '1';
					
					if(last_clk_active = '1' and clk_active = '0') then  
						enable <= '0';
						cs <= '1';
						rxDataReady <= '1';
						state <= S_IDLE;
					
					else 
						enable <= '1';
						cs <= '0';
						if(byte_flag = '1') then
							rxDataReady <= '1';
							tx_buffer <= txData;
						end if;
					
					end if;
						
				when others => null;
				
				
			end case;
			
			
		end if;
		
	end process;
	
	cs_out <= cs;
	sclk_out <= sclk;
	
	
	
	
	process (clk, sclk, cs, rst)
	
	begin
		
		if( rst = '1') then
			bit <= 7;
			mosi <= '1';
		
		elsif(clk'event and clk = '1') then
		last_cs <= cs;
		last_sclk <= sclk;  
			if(cs = '0' and last_cs = '1' ) then
				
				w_r <= not pha;				
				
				if(pha = '0') then
					mosi <= tx_buffer(bit); 
				end if;
				
			elsif(cs = '0' and (last_sclk /= sclk)) then									
				
				if(w_r = '0') 	then				
					mosi <= tx_buffer(bit);
					
				elsif (w_r = '1') then		
					rx_buffer <= rx_buffer(6 downto 0) & miso;
					bit <= bit - 1;			
					if(bit = 0) then			
						bit <= 7;
						
					end if;
				else 
					null;							
				end if;
				
				w_r <= not w_r;				
				
			else 
				
				null;
			end if;
			
			if(bit = 7) then
				rxData <= rx_buffer;
			end if;
			
		end if;
	
	
	
	end process;
	

	
end FSM_1P;
