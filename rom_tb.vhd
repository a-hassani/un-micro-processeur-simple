library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity rom_tb is
    
end rom_tb;

architecture Behavioral of rom_tb is

component ROM 
	port ( Address : in std_logic_vector(12 downto 0);
	CS : in std_logic;
	data : out std_logic_vector(15 downto 0));
end component;

signal CS: std_logic ;
signal Address :STD_LOGIC_VECTOR (12 downto 0);
signal data :STD_LOGIC_VECTOR (15 downto 0);


begin
c6 : ROM port map( Address ,CS ,data);
c : process 
	begin
		cs<='1';
		wait for 10ns;
		cs<='0';
		wait for 500ns;

		cs<='1';
		wait for 10ns;
end process c;



p1 : process
	begin

	Address <= "0000000000000";
	wait for 15ns;

	Address <= "1101000011110";
	wait for 15 ns;
	Address <= "0010000000000";
	wait for 15ns;

	Address <= "1101011011110";
	wait for 15 ns;

end process ;



end Behavioral;
