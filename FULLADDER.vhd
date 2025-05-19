LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.all ;

ENTITY FULLADDER IS

	PORT (Cin, x, y : IN STD_LOGIC ;
				s, Cout : OUT STD_LOGIC 
			);
				
END FULLADDER ;

ARCHITECTURE logica OF FULLADDER IS

BEGIN

	s <= x XOR y XOR Cin ;
	
	Cout <= (x AND y) OR (Cin AND x) OR (Cin AND y) ;
	
END logica ;