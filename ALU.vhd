library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity ALU is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0)  ;
           b : in STD_LOGIC_VECTOR (15 downto 0) ;
           fc_ctrl : in STD_LOGIC_VECTOR (2 downto 0);
           s : out STD_LOGIC_VECTOR (15 downto 0));
end ALU;

architecture Behavioral of ALU is

signal s_temp : STD_LOGIC_VECTOR(31 downto 0);

begin


c : process  (fc_ctrl,a,b)
begin
--si on a fc_ctrl = 000 je fais l'addition  
if fc_ctrl = "000" then s_temp(15 downto 0)<=a+b  ;
--si on a fc_ctrl = 001 je fais la soustraction
elsif fc_ctrl = "001" then s_temp(15 downto 0)<= a-b ;
--si on a fc_ctrl = 010 je fais la multiplcation
elsif fc_ctrl = "010" then s_temp<=a*b;
--si on a fc_ctrl = 101 je fais le load
elsif fc_ctrl = "101" then s_temp<=x"0000"& b;
end if;

end process c ;

s <= s_temp(15 downto 0);

end Behavioral;
