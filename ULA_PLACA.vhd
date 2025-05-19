library ieee;
use ieee.std_logic_1164.all;
USE work.ULA_PACKAGE.all;

ENTITY ULA_PLACA is
	port(SW: in std_logic_vector(10 downto 0);
			HEX0: out std_logic_vector(0 to 6);
			HEX2: out std_logic_vector(0 to 6);
			HEX4: out std_logic_vector(0 to 6);
			HEX6: out std_logic_vector(0 to 6);
			LEDR : out std_logic_vector (5 downto 0)
		 );
end ULA_PLACA;

architecture logica of ULA_PLACA is

	SIGNAL ALU_OPERATION_SIGNAL: STD_LOGIC_VECTOR(2 DOWNTO 0);
	
	signal A_SIGNAL, B_SIGNAL, RESULT_SIGNAL: STD_LOGIC_VECTOR(3 DOWNTO 0);


	COMPONENT ULA IS
		PORT (ALU_OPERATION: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
				A, B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				COUT, ZERO, OVERFLOW, EQU, GRT, LST: OUT STD_LOGIC;
				RESULT: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
			);
			
	END COMPONENT;
	
	
BEGIN


	 ALU_OPERATION_SIGNAL <= SW(2 downto 0);
    A_SIGNAL <= SW(10 downto 7);
    B_SIGNAL <= SW(6 downto 3);

    ULA_AUX: ULA port map (ALU_OPERATION  => ALU_OPERATION_SIGNAL,
									 A             => A_SIGNAL,
									 B             => B_SIGNAL,
									 COUT          => LEDR(0),
									 ZERO          => LEDR(1),
									 OVERFLOW      => LEDR(2),
									 EQU           => LEDR(3),
									 GRT           => LEDR(4),
									 LST           => LEDR(5),
									 RESULT        => RESULT_SIGNAL
								);						  
	
WITH ALU_OPERATION_SIGNAL SELECT 
	HEX0 <=  "0000001" WHEN "000", 
				"1001111" WHEN "001", 
				"0010010" WHEN "010", 
				"0000110" WHEN "011", 
				"1001100" WHEN "100", 
				"0100100" WHEN "101", 
				"0100000" WHEN "110", 
				"0001111" WHEN "111", 
				"1111111" WHEN others;

WITH B_SIGNAL SELECT 
	HEX2 <= "0000001" WHEN "0000", 
			 "1001111" WHEN "0001", 
			 "0010010" WHEN "0010", 
			 "0000110" WHEN "0011", 
			 "1001100" WHEN "0100", 
			 "0100100" WHEN "0101", 
			 "0100000" WHEN "0110", 
			 "0001111" WHEN "0111",
			 "0000000" WHEN "1000", 
			 "0000100" WHEN "1001", 
			 "1111111" WHEN others;
			 
WITH A_SIGNAL SELECT 
	HEX4 <= "0000001" WHEN "0000", 
			 "1001111" WHEN "0001", 
			 "0010010" WHEN "0010", 
			 "0000110" WHEN "0011", 
			 "1001100" WHEN "0100", 
			 "0100100" WHEN "0101", 
			 "0100000" WHEN "0110", 
			 "0001111" WHEN "0111",
			 "0000000" WHEN "1000", 
			 "0000100" WHEN "1001", 
			 "1111111" WHEN others;

WITH RESULT_SIGNAL SELECT 
	HEX6 <= "0000001" WHEN "0000", 
			 "1001111" WHEN "0001", 
			 "0010010" WHEN "0010", 
			 "0000110" WHEN "0011", 
			 "1001100" WHEN "0100", 
			 "0100100" WHEN "0101", 
			 "0100000" WHEN "0110", 
			 "0001111" WHEN "0111",
			 "0000000" WHEN "1000", 
			 "0000100" WHEN "1001", 
			 "1111111" WHEN others;
	 
	 
end logica;