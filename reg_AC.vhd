library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity reg_AC is
    Port ( D : in STD_LOGIC_VECTOR (15 downto 0)  ;
           store : in STD_LOGIC ;
	  ld_AC : in STD_LOGIC ;
	   RAZ : in STD_LOGIC ;
	   clk : in STD_LOGIC ;
           Q : out STD_LOGIC_VECTOR (15 downto 0);
           Q_mem : out STD_LOGIC_VECTOR (15 downto 0));
end reg_AC;

architecture Behavioral of reg_AC is

signal Q_temp,Q_mem_temp :STD_LOGIC_VECTOR (15 downto 0);

begin

c : process (clk)
begin  
if clk'event and clk='1' then
-- reset du registre
	if RAZ= '1' then Q_temp <= "0000000000000000";
-- je charge l'entrée D dans le registre 
	elsif  ld_AC = '1'then Q_temp <= D;
--je met la donnée de Q sur Q_mem
	elsif store = '1' then 
		Q_mem_temp <= Q_temp;
	end if;
--je mets la sortie haute impédance si store = 0
	if store = '0' then
		Q_mem_temp <= "ZZZZZZZZZZZZZZZZ";
	end if;
else 
	Q_mem_temp<=Q_mem_temp;
	Q_temp<=Q_temp;

end if;
end process ;
Q<=Q_temp;
Q_mem<=Q_mem_temp;

end Behavioral;
