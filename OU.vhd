LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL ;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY OU IS
	
PORT (x, y : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
			s : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) 
		);
END OU ;

ARCHITECTURE logica OF OU IS

BEGIN

	S <= X OR Y;


END logica ;