library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity Ramos_2to1_Mux is
	port ( D0, D1 : in STD_LOGIC_VECTOR(31 downto 0);
			 SEL	  : in STD_LOGIC;
			 OUT1   : out STD_LOGIC_VECTOR(31 downto 0));
end Ramos_2to1_Mux;

architecture behavioral of Ramos_2to1_Mux is
begin
	OUT1(0) <= (D0(0) AND (NOT SEL)) OR (D1(0) AND SEL);
	OUT1(1) <= (D0(1) AND (NOT SEL)) OR (D1(1) AND SEL);
	OUT1(2) <= (D0(2) AND (NOT SEL)) OR (D1(2) AND SEL);
	OUT1(3) <= (D0(3) AND (NOT SEL)) OR (D1(3) AND SEL);
	OUT1(4) <= (D0(4) AND (NOT SEL)) OR (D1(4) AND SEL);
	OUT1(5) <= (D0(5) AND (NOT SEL)) OR (D1(5) AND SEL);
	OUT1(6) <= (D0(6) AND (NOT SEL)) OR (D1(6) AND SEL);
	OUT1(7) <= (D0(7) AND (NOT SEL)) OR (D1(7) AND SEL);
    OUT1(8) <= (D0(8) AND (NOT SEL)) OR (D1(8) AND SEL);
	OUT1(9) <= (D0(9) AND (NOT SEL)) OR (D1(9) AND SEL);
	OUT1(10) <= (D0(10) AND (NOT SEL)) OR (D1(10) AND SEL);
	OUT1(11) <= (D0(11) AND (NOT SEL)) OR (D1(11) AND SEL);
	OUT1(12) <= (D0(12) AND (NOT SEL)) OR (D1(12) AND SEL);
	OUT1(13) <= (D0(13) AND (NOT SEL)) OR (D1(13) AND SEL);
	OUT1(14) <= (D0(14) AND (NOT SEL)) OR (D1(14) AND SEL);
	OUT1(15) <= (D0(15) AND (NOT SEL)) OR (D1(15) AND SEL);
    OUT1(16) <= (D0(16) AND (NOT SEL)) OR (D1(16) AND SEL);
	OUT1(17) <= (D0(17) AND (NOT SEL)) OR (D1(17) AND SEL);
	OUT1(18) <= (D0(18) AND (NOT SEL)) OR (D1(18) AND SEL);
	OUT1(19) <= (D0(19) AND (NOT SEL)) OR (D1(19) AND SEL);
	OUT1(20) <= (D0(20) AND (NOT SEL)) OR (D1(20) AND SEL);
	OUT1(21) <= (D0(21) AND (NOT SEL)) OR (D1(21) AND SEL);
    OUT1(22) <= (D0(22) AND (NOT SEL)) OR (D1(22) AND SEL);
	OUT1(23) <= (D0(23) AND (NOT SEL)) OR (D1(23) AND SEL);
	OUT1(24) <= (D0(24) AND (NOT SEL)) OR (D1(24) AND SEL);
	OUT1(25) <= (D0(25) AND (NOT SEL)) OR (D1(25) AND SEL);
	OUT1(26) <= (D0(26) AND (NOT SEL)) OR (D1(26) AND SEL);
	OUT1(27) <= (D0(27) AND (NOT SEL)) OR (D1(27) AND SEL);
    OUT1(28) <= (D0(28) AND (NOT SEL)) OR (D1(28) AND SEL);
	OUT1(29) <= (D0(29) AND (NOT SEL)) OR (D1(29) AND SEL);
	OUT1(30) <= (D0(30) AND (NOT SEL)) OR (D1(30) AND SEL);
	OUT1(31) <= (D0(31) AND (NOT SEL)) OR (D1(31) AND SEL);
	
end behavioral;