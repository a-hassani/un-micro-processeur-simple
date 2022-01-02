library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity mux is
    Port ( pc_out : in STd_LOGIC_VECTOR (12 downto 0);
	   add_op : in STd_LOGIC_VECTOR (12 downto 0) ;
	   sel : in STd_LOGIC ;
           Q : out STd_LOGIC_VECTOR (12 downto 0));
end mux;

architecture Behavioral of mux is

signal Q_temp :STd_LOGIC_VECTOR (12 downto 0);

begin
--un simple mux
c : process (sel,pc_out,add_op)
begin  
if sel='1' then
	Q_temp <= add_op ;
elsif  sel = '0'then 
	Q_temp <= pc_out;
end if;
end process ;
Q<=Q_temp;

end Behavioral;
