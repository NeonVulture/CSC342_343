library ieee;
use ieee.std_logic_1164.all;

entity TB_Ramos_8_Bit_Equal_Port is
end TB_Ramos_8_Bit_Equal_Port;

architecture arch_test of TB_Ramos_8_Bit_Equal_Port is

component Ramos_8_Bit_Equal_Port
    port ( a, b : in std_logic_vector(7 downto 0);
           aeqb : out std_logic);
end component;

signal p1, p0 : std_logic_vector(7 downto 0);
signal pout : std_logic;
signal error : std_logic := '0';
begin
    uut: Ramos_8_Bit_Equal_Port port map(a => p0, b => p1, aeqb => pout);
    process
        begin
            p0 <= "00000000";
            p1 <= "00000000";
            wait for 1 ns;
            if (pout = '0') then
                error <= '1';
            end if;
            wait for 200 ns;
            p0 <= "01010101";
            p1 <= "00010101";
            wait for 1 ns;
            if (pout = '1') then
                error <= '1';
            end if;
            wait for 200 ns;
            p0 <= "01100101";
            p1 <= "11111001";
            wait for 1 ns;
            if (pout = '1') then
                error <= '1';
            end if;
            wait for 200 ns;
            p0 <= "11110011";
            p1 <= "00010100";
            wait for 1 ns;
            if (pout = '1') then
                error <= '1';
            end if;
            wait for 200 ns;
            p0 <= "11001100";
            p1 <= "11001100";
            wait for 1 ns;
            if (pout = '0') then
                error <= '1';
            end if;
            wait for 200 ns;
            p0 <= "10010001";
            p1 <= "11100111";
            wait for 1 ns;
            if (pout = '1') then
                error <= '1';
            end if;
            wait for 200 ns;
            p0 <= "10111001";
            p1 <= "10111001";
            wait for 1 ns;
            if (pout = '0') then
                error <= '1';
            end if;
            wait for 200 ns;
            p0 <= "11010011";
            p1 <= "01101001";
            wait for 1 ns;
            if (pout = '1') then
                error <= '1';
            end if;
            wait for 200 ns;

            if (error = '0') then
                report "No errors detected. Simulation successful" severity
                failure;
            else
                report "Error detected" severity failure;
            end if;

 end process;
end arch_test;