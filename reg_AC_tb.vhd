library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity reg_AC_tb is
    
end reg_AC_tb;
architecture Behavioral of reg_AC_tb is

component reg_AC 
Port ( D : in STD_LOGIC_VECTOR (15 downto 0)  ;
           store : in STD_LOGIC ;
	   ld_AC : in STD_LOGIC ;
	   RAZ : in STD_LOGIC ;
	   clk : in STD_LOGIC ;
           Q : out STD_LOGIC_VECTOR (15 downto 0);
           Q_mem : out STD_LOGIC_VECTOR (15 downto 0));

end component;
signal  sRAZ ,sstore, sld_AC , sclk : STD_LOGIC ;
signal sD,sQ,sQ_mem :STD_LOGIC_VECTOR (15 downto 0);

begin
f: reg_AC port map(sD, sstore, sld_AC ,sRAZ , sclk ,sQ,sQ_mem );
c : process 
	begin
		sclk<='0';
		wait for 50ns;

		sclk<='1';
		wait for 50ns;
end process c;

c1 : process 
	begin
		sD<=x"ABC8";
		wait for 60ns;

		sD<="0000110000000000";
		wait for 60ns;

		sD<="0110000001000001";
		wait for 60ns;
		sD<="1000110111000000";
		wait for 60ns;

		sD<="0000110000001100";
		wait for 60ns;

		sD<="0110001001000001";
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
		sstore<='0';
		wait for 60ns;

		sstore<='1';
		wait for 20ns;

		sstore<='0';
		wait for 80ns;

end process c3;

c4 : process 
	begin
		sld_AC<='1';
		wait for 20ns;

		sld_AC<='0';
		wait for 60ns;

		sld_AC<='1';
		wait for 80ns;
end process c4;

end Behavioral;
