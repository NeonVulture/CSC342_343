Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Ramos_RegisterFile is 
	port(
	   clock: in std_logic;
	   wren : in std_logic; 
	   rst  : in std_logic;
      data : in std_logic_vector(31 downto 0);
	   waddress  : in std_logic_vector(4 downto 0);
	   raddress1 : in std_logic_vector(4 downto 0);
	   raddress2 : in std_logic_vector(4 downto 0);
	   q1 : out std_logic_vector(31 downto 0);
	   q2 : out std_logic_vector(31 downto 0));
end Ramos_RegisterFile;

architecture arch of Ramos_RegisterFile is
   type reg is array(0 to 31) of std_logic_vector(31 downto 0);
   signal reg_array: reg := (
		0 => X"00C3A23B",
		5 => X"3FFD02E1",
		9 => X"00C3A23B",
		13 => X"FFFFEEEE",
		21 => X"FFFFEEEE",
		27 => X"224CCC80",
		others => X"00000000");
   
	begin
   
	process(rst, clock)
   begin
	 if (rst = '1') then 
		reg_array <= (others => (others => '0')); 
	 elsif (clock'event and clock = '1') then 
		if (wren = '1') then
			reg_array(to_integer(unsigned(waddress))) <= data;
		end if;
    end if;
       q1 <= reg_array(to_integer(unsigned(raddress1)));
       q2 <= reg_array(to_integer(unsigned(raddress2)));
    end process;

    
end arch;