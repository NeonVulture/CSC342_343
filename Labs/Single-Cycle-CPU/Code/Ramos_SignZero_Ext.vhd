Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

Entity Ramos_SignZero_Ext is
    port( A     : in std_logic_vector(15 downto 0);
			    ExtOp : in std_logic;
          Output: out std_logic_vector(31 downto 0));
end Ramos_SignZero_Ext;

architecture behvaioral of Ramos_SignZero_Ext is 
begin
	process(ExtOp)
	begin
		if (ExtOp = '0') then
			Output <= std_logic_vector(resize(unsigned(A), 32));
		else
			Output <= std_logic_vector(resize(signed(A), 32));
		end if;
	end process;
end behvaioral;
