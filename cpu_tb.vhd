
Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all; 

entity cpu_tb is
end cpu_tb;

architecture bhv of cpu_tb is

component cpu
port (  n_rst : in std_logic;
	clk : in std_logic;
	cs : in std_logic);
end component;

signal n_rst,clk,cs: std_logic ;

begin

UUT : cpu port map(n_rst,clk,cs);

c : process 
	begin
		clk<='0';
		wait for 10ns;

		clk<='1';
		wait for 10ns;
end process c;



p1 : process
	begin

	n_rst <= '0';
	wait for 15ns;

	n_rst <= '1';
	wait for 2350 ns;

end process ;

p2 : process 
	begin
		cs<='0';
		wait for 500ns;

end process ;


end bhv;
