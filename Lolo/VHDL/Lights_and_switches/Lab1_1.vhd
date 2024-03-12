LIBRARY ieee;
USE ieee.std_logic_1164.all;-- Simple entity that connects the SW switches to the LEDR lights

ENTITY lab1_1 IS
PORT ( 	SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
END lab1_1;

ARCHITECTURE Behavior OF lab1_1 IS
BEGIN
	LEDR<=SW;
END Behavior;