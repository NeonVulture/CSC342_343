library ieee;
use ieee.std_logic_1164.all;

entity Ramos_4_1_Mux is
    port (D0, D1, D2, D3: in std_logic_vector(3 downto 0);
          SEL			 	: in std_logic_vector(1 downto 0);
          OUT1          : out std_logic_vector(3 downto 0));
end Ramos_4_1_Mux;

architecture behavioral of Ramos_4_1_Mux is
    component Ramos_4_1_Mux_Comp is
        port( IA, IB, IC, ID : in std_logic;
              S1, S2         : in std_logic;
              Output         : out std_logic);
    end component;
    
    signal e0, e1, e2, e3 : std_logic;
    begin
    H1: Ramos_4_1_Mux_Comp port map (D0(0),D1(0),D2(0),D3(0),SEL(0),SEL(1),e0); 
    H2: Ramos_4_1_Mux_Comp port map (D0(1),D1(1),D2(1),D3(1),SEL(0),SEL(1),e1);
    H3: Ramos_4_1_Mux_Comp port map (D0(2),D1(2),D2(2),D3(2),SEL(0),SEL(1),e2);
    H4: Ramos_4_1_Mux_Comp port map (D0(3),D1(3),D2(3),D3(3),SEL(0),SEL(1),e3);
    OUT1(0) <= e0; 
    OUT1(1) <= e1;
    OUT1(2) <= e2;
    OUT1(3) <= e3;
end behavioral;
