library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity PC_tb is
    
end PC_tb;
architecture Behavioral of PC_tb is

component PC
    Port ( branch : in STd_LOGIC_VECTOR (12 downto 0);
	   incr : in STd_LOGIC ;
	   ld : in STd_LOGIC ;
	   RAZ : in STd_LOGIC ;
	   clk : in STd_LOGIC ;
           Q : out STd_LOGIC_VECTOR (12 downto 0));
end component;
signal  sRAZ ,incr, ld , sclk : STD_LOGIC ;
signal branch,sQ :STD_LOGIC_VECTOR (12 downto 0);

begin
f: PC port map(branch, incr, ld ,sRAZ , sclk ,sQ );
c : process 
	begin
		sclk<='0';
		wait for 50ns;

		sclk<='1';
		wait for 50ns;
end process c;

c1 : process 
	begin
		branch<="0110111000000";
		wait for 60ns;

		branch<="0000110000000";
		wait for 60ns;

		branch<="0110001000001";
		wait for 60ns;
		branch<="1000110111000";
		wait for 60ns;

		branch<="0000110001100";
		wait for 60ns;

		branch<="0101001000001";
		wait for 60ns;
end process c1;

c2 : process 
	begin
		sRAZ<='0';
		wait for 200ns;

		sRAZ<='1';
		wait for 20ns;
end process c2;

c3 : process 
	begin
		incr<='0';
		wait for 60ns;

		incr<='1';
		wait for 40ns;

		incr<='0';
		wait for 80ns;

end process c3;

c4 : process 
	begin
		ld<='1';
		wait for 20ns;

		ld<='0';
		wait for 60ns;

		ld<='1';
		wait for 80ns;
end process c4;

end Behavioral;
