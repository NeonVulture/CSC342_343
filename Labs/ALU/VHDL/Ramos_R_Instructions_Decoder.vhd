Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;
Use WORK.Ramos_Package_1.ALL;
Use WORK.Ramos_Full_Adder_Package.ALL;

entity Ramos_R_Instructions_Decoder is 
port ( CLK                          : in std_logic;
       Opcode                       : in std_logic_vector(3 downto 0);
       Rs_Data, Rt_Data		    : in std_logic_vector(31 downto 0); -- Input data for registers Rs and Rt
       RD_Data			    : out std_logic_vector(31 downto 0);
       Cout, V_FLAG, Z_FLAG, N_FLAG : out std_logic); -- Carry Out, Overflow, Zero, and Negative Flags
end Ramos_R_Instructions_Decoder;

architecture arch of Ramos_R_Instructions_Decoder is
	 signal Rs_Out, Rt_Out : std_logic_vector(31 downto 0);
	 signal Op_Sel, Overflow : std_logic;
     signal Out1, Out2, Out3, Out4, Out5, Out6, Out7 : std_logic_vector(31 downto 0);
begin
    -- Write data to registers Rs and Rt
    R1: Ramos_32Bit_Register port map(CLK,'1', '1', '1', Rs_Data, Rs_Out);
    R2: Ramos_32Bit_Register port map(CLK,'1', '1', '1', Rt_Data, Rt_Out);
    
    process(Opcode) 
    begin
	 if (Opcode = "0001") then -- Add (With Overflow)
		Op_Sel <= '0';
	 elsif (Opcode = "0010") then -- Addu (No Overflow)
		Op_Sel <= '0';
	 elsif (Opcode = "0011") then -- Sub (with Overflow)
		Op_Sel <= '1';
	 elsif (Opcode = "0100") then -- Subu (No Overflow)
		Op_Sel <= '1';
		
	 end if;
    end process;
	 
    U1: Ramos_NBit_Add_Sub port map (Rs_Out, Rt_Out, '0', Op_Sel, Out1, Cout, Overflow, Z_FLAG, N_FLAG);
    
    process(Opcode, Overflow) -- Choose whether or not to display V_Flag
    begin
    	 if (Opcode = "0001") then
	 	V_FLAG <= Overflow;
	 elsif (Opcode = "0010") then
	 	V_FLAG <= 'Z';
	 elsif (Opcode = "0011") then
	 	V_FLAG <= Overflow;
	 elsif (Opcode = "0100") then
	 	V_FLAG <= 'Z';
	 end if;
    end process;

    U2: Ramos_Bitwise_AND port map (Rs_Out, Rt_Out, Out2); -- Bitwise AND
    U3: Ramos_Bitwise_NOR port map (Rs_Out, Rt_Out, Out3); -- Bitwise NOR
    U4: Ramos_Bitwise_OR port map (Rs_Out, Rt_Out, Out4); -- Bitwise OR
    U5: Ramos_Bitwise_LeftShift port map(Rt_Out, Out5);-- SLL
    U6: Ramos_Bitwise_RightShift port map(Rt_Out,Out6);-- SRL
    U7: Ramos_Bitwise_RightShiftArith port map(Rt_out, Out7);-- SRA
    
    process(Opcode, Out1, Out2, Out3, Out4)
    begin
        --if(Start = '1') then
            case Opcode is
              when "0001" => RD_Data <= Out1;
              when "0010" => RD_Data <= Out1;
              when "0011" => RD_Data <= Out1;
              when "0100" => RD_Data <= Out1;
	      when "0101" => RD_Data <= Out2;
	      when "0110" => RD_Data <= Out3;
	      when "0111" => RD_Data <= Out4;
	      when "1000" => RD_Data <= Out5;
	      when "1001" => RD_Data <= Out6;
	      when "1010" => RD_Data <= Out7;
              when others => RD_Data <= (others => 'Z');
            end case;
        --end if;
    end process;
end arch;