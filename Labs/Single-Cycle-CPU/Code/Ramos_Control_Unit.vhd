-- This file defines the control signal values in order to set the correct datapaths
library ieee;
use ieee.std_logic_1164.all;

entity Ramos_Control_Unit is
	port(
        Opcode   : in std_logic_vector(5 downto 0); -- 6 Bit Opcode from 32 Bit instruction
        Funct    : in std_logic_vector(5 downto 0); -- 6 Bit function field
        -- Control Signals 
		  ExtOp	: out std_logic;
		  ALUCtrl: out std_logic_vector(3 downto 0);
		  RegWr  : out std_logic;
	     RegDst : out std_logic; -- 0 => Rt ; 1 => Rd
        ALUSrc : out std_logic; -- 0 => BusB ; 1 => ImmExt
        MemToReg : out std_logic;
        MemWr : out std_logic;
        Branch : out std_logic;
		  Jump  : out std_logic
		  );
end Ramos_Control_Unit;

architecture arch of Ramos_Control_Unit is
    signal ALUOp : std_logic_vector(2 downto 0); -- ALU Op (used to detemine ALUCtrl)
	 begin
    
    process(Opcode)
    begin
        -- Select Opcode+Function combination for sw, lw, add, addu, addi, addui, sub, subu, and, andi, ori, nor, sll, srl, sra  
        -- ALUOp: 0 => R-Type Instructions ; 1 => sw,lw ; 2 => 
        case Opcode is 
            when "000000" => -- R-Type Instructions(add, addu, sub, subu, mult, div, and, nor, sll, srl, sra)
                ALUOp <= "000";
					 ExtOp <= '0'; --X
                MemWr <= '0'; -- 0
                MemToReg <= '0'; -- 0
                ALUSrc <= '0'; -- 0
                RegWr <= '1'; -- 1
                RegDst <= '1'; -- 1
                Branch <= '0'; -- 0
					 Jump <= '0'; -- 0
            when "100011" =>	-- lw
                ALUOp <= "001";
					 ExtOp <= '1'; -- 1
                MemWr <= '0'; -- 0
                MemToReg <= '1'; -- 1
                ALUSrc <= '1'; -- 1
                RegWr <= '1'; -- 1
                RegDst <= '0'; -- 0
                Branch <= '0'; -- 0
					 Jump <= '0'; -- 0
            when "101011" => -- sw 
                ALUOp <= "001";
					 ExtOp <= '1'; -- 1
                MemWr <= '1'; -- 1
                MemToReg <= '0'; -- X
                ALUSrc <= '1'; -- 1
                RegWr <= '0'; -- 0
                RegDst <= '0'; -- X
                Branch <= '0'; -- 0
					 Jump <= '0'; -- 0
            when "001000" =>	-- addi
                ALUOp <= "001"; --
					 ExtOp <= '1'; -- 1 
                MemWr <= '0'; -- 0
                MemToReg <= '0'; -- 0
                ALUSrc <= '1'; -- 1
                RegWr <= '1'; -- 1
                RegDst <= '0'; -- 0
                Branch <= '0'; -- 0
					 Jump <= '0'; -- 0
            when "001001" =>	--addiu 
                ALUOp <= "001"; -- 
					 ExtOp <= '1'; -- 1
                MemWr <= '0'; -- 0
                MemToReg <= '0'; -- 0
                ALUSrc <= '1'; -- 1
                RegWr <= '1'; -- 1
                RegDst <= '0'; -- 0
                Branch <= '0'; -- 0
					 Jump <= '0'; -- 0
            when "001100" => -- andi 
                ALUOp <= "010"; -- 
					 ExtOp <= '0'; -- 0
                MemWr <= '0'; -- 0
                MemToReg <= '0'; -- 0
                ALUSrc <= '1'; -- 1
                RegWr <= '1'; -- 1
                RegDst <= '0'; -- 0
                Branch <= '0'; -- 0
					 Jump <= '0'; -- 0
            when "001101" => -- ori
                ALUOp <= "100"; --
					 ExtOp <= '0'; -- 0
                MemWr <= '0'; -- 0
                MemToReg <= '0'; -- 0
                ALUSrc <= '1'; -- 1
                RegWr <= '1'; -- 1
                RegDst <= '0'; -- 0
                Branch <= '0'; -- 0
					 Jump <= '0'; -- 0
            when "000100" => -- beq
                ALUOp <= "101"; --  
					 ExtOp <= '1'; -- 1
                MemWr <= '0'; -- 0
                MemToReg <= '0'; -- X
                ALUSrc <= '0'; -- 0
                RegWr <= '0'; -- 0
                RegDst <= '0'; -- X
                Branch <= '1'; -- 1
					 Jump <= '0'; -- 0
            when "000101" => -- bne
                ALUOp <= "101"; --
					 ExtOp <= '1'; -- 1
					 MemWr <= '0'; -- 0
                MemToReg <= '0'; -- X
                ALUSrc <= '0'; -- 0
                RegWr <= '0'; -- 0
                RegDst <= '0'; -- X
                Branch <= '1'; -- 1
					 Jump <= '0'; -- 0
            when "000010" => -- j
				    ALUOp <= "111"; --  
					 ExtOp <= '0'; -- X
                MemWr <= '0'; -- 0
                MemToReg <= '0'; -- X
                ALUSrc <= '0'; -- X
                RegWr <= '0'; -- 0
                RegDst <= '0'; -- X
                Branch <= '0'; -- 0
					 Jump <= '1'; -- 1
            when others =>
                ALUOp <= "ZZZ";
					 ExtOp <= 'Z'; 
                MemWr <= 'Z';
                MemToReg <= 'Z';
                ALUSrc <= 'Z';
                RegWr <= 'Z';
                RegDst <= 'Z';
					 Branch <= 'Z';
					 Jump <= 'Z';
        end case;
    end process;
	 
	 process(ALUOp, Funct)
	 begin
		if ALUOp = "000" and Funct = "100000" then -- Add
            ALUCtrl <= "0000";
        elsif ALUOp = "000" and Funct = "100001" then -- Addu
            ALUCtrl <= "0000"; -- Add 
        elsif ALUOp = "000" and Funct = "100010" then -- Sub
            ALUCtrl <= "0001";
        elsif ALUOp = "000" and Funct = "100011" then -- Subu
            ALUCtrl <= "0001"; -- Sub
        elsif ALUOp = "000" and Funct = "011000" then -- Mult
            ALUCtrl <= "0010";
        elsif ALUOp = "000" and Funct = "011010" then -- Div
            ALUCtrl <= "0011";
        elsif ALUOp = "000" and Funct = "100100" then -- And
            ALUCtrl <= "0100";
        elsif ALUOp = "000" and Funct = "100111" then -- Nor
            ALUCtrl <= "0110";
        elsif ALUOp = "000" and Funct = "000000" then -- Sll
            ALUCtrl <= "0111";
        elsif ALUOp = "000" and Funct = "000010" then -- Srl
            ALUCtrl <= "1000";
        elsif ALUOp = "000" and Funct = "000011" then -- Sra
            ALUCtrl <= "1001";
        elsif ALUOp = "001" then -- sw, lw, addi, addiu
            ALUCtrl <= "0000"; -- add
		  elsif ALUOp <= "010" then --andi
				ALUCtrl <= "0100"; 
		  elsif ALUOp = "100" then -- ori
			   ALUCtrl <= "0101"; 
		  elsif ALUOp = "101" then -- beq/bne
				ALUCtrl <= "0001"; -- Sub
        end if;
	 end process;
end arch;
