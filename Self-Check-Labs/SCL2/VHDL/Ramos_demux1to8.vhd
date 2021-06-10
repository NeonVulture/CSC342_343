library ieee;
use ieee.std_logic_1164.all;

entity Ramos_demux1to8 is
port ( DataIn : in std_logic;
       SEL    : in std_logic_vector(2 downto 0);
       OUT1   : out std_logic_vector(7 downto 0));
end Ramos_demux1to8;

architecture behavioral of Ramos_demux1to8 is
begin
OUT1(0) <= DataIn when SEL = "000" else '0';
OUT1(1) <= DataIn when SEL = "001" else '0';
OUT1(2) <= DataIn when SEL = "010" else '0';
OUT1(3) <= DataIn when SEL = "011" else '0';
OUT1(4) <= DataIn when SEL = "100" else '0';
OUT1(5) <= DataIn when SEL = "101" else '0';
OUT1(6) <= DataIn when SEL = "110" else '0';
OUT1(7) <= DataIn when SEL = "111" else '0';	
end behavioral;
