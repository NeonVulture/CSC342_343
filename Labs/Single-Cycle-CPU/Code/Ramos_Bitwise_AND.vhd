Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;

entity Ramos_Bitwise_AND is 
port ( A, B   : in std_logic_vector(31 downto 0);
       result : out std_logic_vector(31 downto 0));
end Ramos_Bitwise_AND;

architecture arch of Ramos_Bitwise_AND is
begin
    result <= A AND B;
end arch;
