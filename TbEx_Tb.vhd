library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TbEx_Tb is
end TbEx_Tb;

architecture bhv of TbEx_Tb is
	
	constant clock_period		: 	time						:= 10 ns;
	signal clock_bit			: 	std_logic 					:= '0';
	signal input_vector 		: 	unsigned(3 downto 0) 		:= (others => '0');
	signal output_vector 		: 	unsigned(3 downto 0) 		:= (others => '0');

	component TbEx is

	port (
		clk:					in		std_logic;
		input: 					in		unsigned(3 downto 0);
		output: 				out		unsigned(3 downto 0)
		);
		
	end component TbEx;
   
begin
   
	TbEx_INST : TbEx
	port map (
		clk						=>		clock_bit,
		input 					=>		input_vector,
		output 					=>		output_vector
	  );
	  
	process is
	
	begin
		
		-- -- All input combinations
		-- for i in 0 to (2**(input_vector'length)) loop
			
			-- input_vector <= to_unsigned(i, input_vector'length);
			-- wait for clock_period;
		-- end loop;
		
		-- All inputs with clock
		for i in 0 to (2**(input_vector'length)) loop
			
			input_vector <= to_unsigned(i, input_vector'length);

			for clk in std_logic range '0' to '1' loop
			
				clock_bit <= clk;	
				wait for clock_period;
			
			end loop;
		end loop;
		
	end process;
end bhv;