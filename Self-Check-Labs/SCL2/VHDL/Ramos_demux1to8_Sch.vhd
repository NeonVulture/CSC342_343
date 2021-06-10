-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"
-- CREATED		"Thu Feb 25 14:17:49 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Ramos_demux1to8_Sch IS 
	PORT
	(
		Ramos_IN :  IN  STD_LOGIC;
		Ramos_S3 :  IN  STD_LOGIC;
		Ramos_S2 :  IN  STD_LOGIC;
		Ramos_S1 :  IN  STD_LOGIC;
		Ramos_OUT1 :  OUT  STD_LOGIC;
		Ramos_OUT2 :  OUT  STD_LOGIC;
		Ramos_OUT3 :  OUT  STD_LOGIC;
		Ramos_OUT4 :  OUT  STD_LOGIC;
		Ramos_OUT5 :  OUT  STD_LOGIC;
		Ramos_OUT6 :  OUT  STD_LOGIC;
		Ramos_OUT7 :  OUT  STD_LOGIC;
		Ramos_OUT8 :  OUT  STD_LOGIC
	);
END Ramos_demux1to8_Sch;

ARCHITECTURE bdf_type OF Ramos_demux1to8_Sch IS 

COMPONENT ramos_1to2_demux
	PORT(Ramos_SEL : IN STD_LOGIC;
		 Ramos_IN : IN STD_LOGIC;
		 Ramos_OUT1 : OUT STD_LOGIC;
		 Ramos_OUT2 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT ramos_1to4_demux
	PORT(Ramos_S2 : IN STD_LOGIC;
		 Ramos_IN : IN STD_LOGIC;
		 Ramos_S1 : IN STD_LOGIC;
		 Ramos_OUT1 : OUT STD_LOGIC;
		 Ramos_OUT2 : OUT STD_LOGIC;
		 Ramos_OUT3 : OUT STD_LOGIC;
		 Ramos_OUT4 : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;


BEGIN 



b2v_inst : ramos_1to2_demux
PORT MAP(Ramos_SEL => Ramos_S3,
		 Ramos_IN => Ramos_IN,
		 Ramos_OUT1 => SYNTHESIZED_WIRE_0,
		 Ramos_OUT2 => SYNTHESIZED_WIRE_1);


b2v_inst2 : ramos_1to4_demux
PORT MAP(Ramos_S2 => Ramos_S2,
		 Ramos_IN => SYNTHESIZED_WIRE_0,
		 Ramos_S1 => Ramos_S1,
		 Ramos_OUT1 => Ramos_OUT1,
		 Ramos_OUT2 => Ramos_OUT2,
		 Ramos_OUT3 => Ramos_OUT3,
		 Ramos_OUT4 => Ramos_OUT4);


b2v_inst3 : ramos_1to4_demux
PORT MAP(Ramos_S2 => Ramos_S2,
		 Ramos_IN => SYNTHESIZED_WIRE_1,
		 Ramos_S1 => Ramos_S1,
		 Ramos_OUT1 => Ramos_OUT5,
		 Ramos_OUT2 => Ramos_OUT6,
		 Ramos_OUT3 => Ramos_OUT7,
		 Ramos_OUT4 => Ramos_OUT8);


END bdf_type;
