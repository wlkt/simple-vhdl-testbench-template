Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TbEx is

	port(
		clk:					in		std_logic;
		input: 					in		unsigned(3 downto 0);
		output: 				out		unsigned(3 downto 0)
	);
	
end TbEx;

architecture bhv of TbEx is
	
	begin
		output(0) <= input(3);
		output(1) <= input(2);
		output(2) <= input(1);
		output(3) <= input(0);
		
end bhv;