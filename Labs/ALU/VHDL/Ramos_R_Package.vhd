Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;
-- This package contains component declarations for the necessary bitwise operations:
-- This package also includes the component declaration for the 32-Bit Register & R-Type instructions decoder
package Ramos_R_Package is

    component Ramos_32Bit_Register
    port (
        Ramos_CLK  : in std_logic;
        Ramos_WREN : in std_logic;
        Ramos_RDEN : in std_logic;
        Ramos_CHEN : in std_logic;
        Ramos_DATA : in std_logic_vector(31 downto 0);
        Ramos_Q    : out std_logic_vector(31 downto 0));
    end component;
    
    component Ramos_NBit_Add_Sub
    Port ( A, B                   : in std_logic_vector(31 downto 0);
           Cin                    : in std_logic;
           Opcode	            	 : in std_logic; -- Add when 0 / subtract when 1
           S                      : out std_logic_vector(31 downto 0);
           Cout                   : out std_logic;
           V_FLAG, Z_FLAG, N_FLAG : out std_logic);
    end component;
    
    component Ramos_Bitwise_AND
    port ( A, B   : in std_logic_vector(31 downto 0);
           result : out std_logic_vector(31 downto 0));
    end component;
    
    component Ramos_Bitwise_NOR
    port ( A, B   : in std_logic_vector(31 downto 0);
           result : out std_logic_vector(31 downto 0));
    end component;
    
    component Ramos_Bitwise_OR
    port ( A, B   : in std_logic_vector(31 downto 0);
           result : out std_logic_vector(31 downto 0));
    end component;
    
    component Ramos_R_Instructions_Decoder
    port ( CLK                          : in std_logic;
           Opcode                       : in std_logic_vector(3 downto 0);
           Rs_Data, Rt_Data		: in std_logic_vector(31 downto 0); -- Input data for registers Rs and Rt
           RD_Data			: out std_logic_vector(31 downto 0);
           Cout, V_FLAG, Z_FLAG, N_FLAG : out std_logic); -- Carry Out, Overflow, Zero, and Negative Flags
    end component;

    component Ramos_Bitwise_LeftShift
    port ( A  : in std_logic_vector(31 downto 0);
           result : out std_logic_vector(31 downto 0));
    end component;
    
    component Ramos_Bitwise_RightShift
    port ( A  : in std_logic_vector(31 downto 0);
           result : out std_logic_vector(31 downto 0));
    end component;

    component Ramos_Bitwise_RightShiftArith
    port ( A  : in std_logic_vector(31 downto 0);
           result : out std_logic_vector(31 downto 0));
    end component;
end Ramos_R_Package;
