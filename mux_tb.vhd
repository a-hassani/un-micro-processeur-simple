library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity mux_tb is
    
end mux_tb;
architecture Behavioral of mux_tb is

component mux
    Port ( pc_out : in STd_LOGIC_VECTOR (12 downto 0);
	   add_op : in STd_LOGIC_VECTOR (12 downto 0) ;
	   sel : in STd_LOGIC ;
           Q : out STd_LOGIC_VECTOR (12 downto 0));
end component;
signal   sel  : STD_LOGIC ;
signal pc_out,add_op,Q :STD_LOGIC_VECTOR (12 downto 0);

begin
f: mux port map(pc_out, add_op, sel  ,Q );


c1 : process 
	begin
		pc_out<="0110111000000";
		add_op<="0110101000000";
		wait for 60ns;

		pc_out<="0000110000000";
		add_op<="0110110000000";
		wait for 60ns;

		pc_out<="0110001000001";
		add_op<="0110110001011";
		wait for 60ns;
	
		pc_out<="1000110111000";
		add_op<="0110111001110";
		wait for 60ns;

		pc_out<="0000110001100";
		add_op<="0110111101000";
		wait for 60ns;

		pc_out<="0101001000001";
		add_op<="0110010011000";		
		wait for 60ns;
end process c1;


c4 : process 
	begin
		sel<='1';
		wait for 20ns;

		sel<='0';
		wait for 120ns;

		sel<='1';
		wait for 80ns;
end process c4;

end Behavioral;
