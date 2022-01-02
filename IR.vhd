library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity IR is
    Port ( D : in STd_LOGIC_VECTOR (15 downto 0);
					 ld : in STd_LOGIC ;
					 RAZ : in STd_LOGIC ;
					 clk : in STd_LOGIC ;
           				 op_code: out STd_LOGIC_VECTOR (2 downto 0);
	   				 addr_op : out STd_LOGIC_VECTOR (12 downto 0);
       				         branch : out STd_LOGIC_VECTOR (12 downto 0));
end IR;

architecture Behavioral of IR is

signal op_code_temp :STd_LOGIC_VECTOR (2 downto 0);
signal addr_op_temp,branch_temp :STd_LOGIC_VECTOR (12 downto 0);

begin

c : process (clk)
begin  
if clk'event and clk='1' then
-- reset du registre
	if RAZ= '1' then 
		op_code_temp <= "000";
		addr_op_temp <= "0000000000000";
		branch_temp  <= "0000000000000";

	elsif  ld = '1' then 
--je divise l'entrée D :
--	12 première bits pour addr_op et branch
		addr_op_temp<= D(12 downto 0);
		branch_temp<= D(12 downto 0);
--	3 dernière bits pour op_code 
		op_code_temp<= D(15 downto 13);
	end if;
else 
	op_code_temp <= op_code_temp;
	addr_op_temp <= addr_op_temp;
	branch_temp <= branch_temp;
end if;
end process ;

op_code <= op_code_temp;
addr_op <= addr_op_temp;
branch <= branch_temp;

end Behavioral;
