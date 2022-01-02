library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity PC is
    Port ( branch : in STd_LOGIC_VECTOR (12 downto 0);
	   incr : in STd_LOGIC ;
	   ld : in STd_LOGIC ;
	   RAZ : in STd_LOGIC ;
	   clk : in STd_LOGIC ;
           Q : out STd_LOGIC_VECTOR (12 downto 0));
end PC;

architecture Behavioral of PC is

signal Q_temp :STd_LOGIC_VECTOR (12 downto 0);

begin

c : process (clk)
begin  
if clk'event and clk='1' then
-- reset du registre
	if RAZ= '1' then Q_temp <= "0000000000000";
-- je charge l'entrée branch dans le registre 
	elsif  ld = '1'then  Q_temp <= branch;
--j'incrémente le registre PC avec +1 pour faire saut dans la memoire 
	elsif incr= '1' then Q_temp <= Q_temp+'1';
	end if;
else 
	Q_temp<=Q_temp;

end if;
end process ;
Q<=Q_temp;

end Behavioral;
