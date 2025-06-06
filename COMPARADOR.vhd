LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL ;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY COMPARADOR IS
	
	PORT (A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				EQUAL, GREATER, LESS: OUT STD_LOGIC 
			);
	END COMPARADOR ;

ARCHITECTURE logica OF COMPARADOR IS

BEGIN

	EQUAL   <= '1' WHEN A = B ELSE '0';
	
	GREATER <= '1' WHEN A > B ELSE '0';
	
	LESS 	  <= '1' WHEN A < B ELSE '0';
		   

END logica ;