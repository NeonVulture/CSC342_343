LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- 16 Bit Register for Immediate Field
entity Ramos_16bit_register is 
    port (
        Ramos_CLK  : in std_logic;
        Ramos_WREN : in std_logic;
        Ramos_RDEN : in std_logic;
        Ramos_CHEN : in std_logic;
        Ramos_DATA : in std_logic_vector(15 downto 0);
        Ramos_Q    : out std_logic_vector(15 downto 0));
end Ramos_16bit_register;

architecture arch of Ramos_16bit_register is
    signal Ramos_STORAGE : std_logic_vector(15 downto 0);
    
begin
    process (Ramos_CLK)
    begin
        if (rising_edge(Ramos_CLK) and Ramos_WREN = '1')
            then Ramos_STORAGE <= Ramos_DATA;
        end if;
    end process;
    
    process(Ramos_RDEN, Ramos_CHEN, Ramos_STORAGE)
    begin   
        if (Ramos_RDEN = '1' and Ramos_CHEN = '1')
            then Ramos_Q <= Ramos_STORAGE;
        elsif(Ramos_CHEN = '0')
            then Ramos_Q <= (others => 'Z');
        end if;
    end process;
end arch;