library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity MAR_tb is
    
end MAR_tb;
architecture Behavioral of MAR_tb is

component MAR
     Port ( D : in STd_LOGIC_VECTOR (12 downto 0);
	   ld : in STd_LOGIC ;
	   RAZ : in STd_LOGIC ;
	   clk : in STd_LOGIC ;
           Q : out STd_LOGIC_VECTOR (12 downto 0));
end component;
signal  RAZ , ld , clk : STD_LOGIC ;
signal D,Q :STD_LOGIC_VECTOR (12 downto 0);

begin
f: MAR port map(D, ld ,RAZ , clk ,Q );
c : process 
	begin
		clk<='0';
		wait for 50ns;

		clk<='1';
		wait for 50ns;
end process c;

c1 : process 
	begin
		D<="0110111000000";
		wait for 60ns;

		D<="0000110000000";
		wait for 60ns;

		D<="0110001000001";
		wait for 60ns;
		D<="1000110111000";
		wait for 60ns;

		D<="0000110001100";
		wait for 60ns;

		D<="0101001000001";
		wait for 60ns;
end process c1;

c2 : process 
	begin
		RAZ<='0';
		wait for 200ns;

		RAZ<='1';
		wait for 20ns;
end process c2;


c3 : process 
	begin
		ld<='1';
		wait for 20ns;

		ld<='0';
		wait for 60ns;

		ld<='1';
		wait for 80ns;
end process c3;

end Behavioral;
