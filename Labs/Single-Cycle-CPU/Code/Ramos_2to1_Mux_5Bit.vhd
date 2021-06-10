library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity Ramos_2to1_Mux_5Bit is
	port ( D0, D1 : in STD_LOGIC_VECTOR(4 downto 0);
	  		 SEL	  : in STD_LOGIC;
		  	 OUT1   : out STD_LOGIC_VECTOR(4 downto 0));
end Ramos_2to1_Mux_5Bit;

architecture behavioral of Ramos_2to1_Mux_5Bit is
begin
	OUT1(0) <= (D0(0) AND (NOT SEL)) OR (D1(0) AND SEL);
	OUT1(1) <= (D0(1) AND (NOT SEL)) OR (D1(1) AND SEL);
	OUT1(2) <= (D0(2) AND (NOT SEL)) OR (D1(2) AND SEL);
	OUT1(3) <= (D0(3) AND (NOT SEL)) OR (D1(3) AND SEL);
	OUT1(4) <= (D0(4) AND (NOT SEL)) OR (D1(4) AND SEL);
end behavioral;
