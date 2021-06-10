library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ramos_2_4_Decoder is
	port (
			  oct : in std_logic_vector(1 downto 0);
	      dec : out std_logic_vector(3 downto 0));
end Ramos_2_4_Decoder;

architecture behavioral of Ramos_2_4_Decoder is
begin
with oct select
	dec <=	"0001" when "00",
			  	"0010" when "01",
				  "0100" when "10",
				  "1000" when "11",
				  "0000" when others;
end behavioral;
