library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity MAR is
    Port ( D : in STd_LOGIC_VECTOR (12 downto 0);
	   ld : in STd_LOGIC ;
	   RAZ : in STd_LOGIC ;
	   clk : in STd_LOGIC ;
           Q : out STd_LOGIC_VECTOR (12 downto 0));
end MAR;

architecture Behavioral of MAR is

signal Q_temp :STd_LOGIC_VECTOR (12 downto 0);

begin

c : process (clk)
begin  
if clk'event and clk='1' then
-- reset du registre
	if RAZ= '1' then Q_temp <= "0000000000000";
-- je charge l'entrée D dans le registre 
	elsif  ld = '1'then 
		Q_temp <= D;
	end if;
else 
	Q_temp<=Q_temp;

end if;
end process ;
Q<=Q_temp;

end Behavioral;
