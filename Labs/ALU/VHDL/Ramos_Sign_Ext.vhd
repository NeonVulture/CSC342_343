Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

Entity Ramos_Sign_Ext is
    port( A     : in std_logic_vector(15 downto 0);
          Output: out std_logic_vector(31 downto 0));
end Ramos_Sign_Ext;

architecture behvaioral of Ramos_Sign_Ext is 
begin
    Output <= std_logic_vector(resize(signed(A), 32));
end behvaioral;
