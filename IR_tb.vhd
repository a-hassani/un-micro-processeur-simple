library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity IR_tb is
    
end IR_tb;
architecture Behavioral of IR_tb is

component IR
    Port ( D : in STd_LOGIC_VECTOR (15 downto 0);
	   ld : in STd_LOGIC ;
	   RAZ : in STd_LOGIC ;
	   clk : in STd_LOGIC ;
           op_code: out STd_LOGIC_VECTOR (2 downto 0);
	   addr_op : out STd_LOGIC_VECTOR (12 downto 0);
           branch : out STd_LOGIC_VECTOR (12 downto 0));
end component;

signal  RAZ , ld , clk : STD_LOGIC ;
signal addr_op,branch :STD_LOGIC_VECTOR (12 downto 0);
signal op_code :STD_LOGIC_VECTOR (2 downto 0);
signal D :STD_LOGIC_VECTOR (15 downto 0);

begin
f: IR port map(D, ld ,RAZ , clk ,op_code,addr_op,branch );
c : process 
	begin
		clk<='0';
		wait for 50ns;

		clk<='1';
		wait for 50ns;
end process c;

c1 : process 
	begin
		D<=x"ABC1";
		wait for 60ns;

		D<=x"A935";
		wait for 60ns;

		D<=x"F597";
		wait for 60ns;

		D<=x"E354";
		wait for 60ns;

		D<=x"A54A";
		wait for 60ns;

		D<=x"98D7";
		wait for 60ns;
end process c1;

c2 : process 
	begin
		RAZ<='0';
		wait for 200ns;

		RAZ<='1';
		wait for 20ns;
end process c2;


c3 : process 
	begin
		ld<='1';
		wait for 20ns;

		ld<='0';
		wait for 60ns;

		ld<='1';
		wait for 80ns;
end process c3;

end Behavioral;
