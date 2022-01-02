library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity MARux is
    Port ( pc_out : in STd_LOGIC_VECTOR (12 downto 0);
	   add_op : in STd_LOGIC_VECTOR (12 downto 0) ;
	   sel : in STd_LOGIC ;
	   ld : in STd_LOGIC ;
	   RAZ : in STd_LOGIC ;
	   clk : in STd_LOGIC ;
           Q : out STd_LOGIC_VECTOR (12 downto 0));
    
end MARux;
architecture Behavioral of MARux is

--j'associe le mux avec le registre MAR
component mux
    Port ( pc_out : in STd_LOGIC_VECTOR (12 downto 0);
	   add_op : in STd_LOGIC_VECTOR (12 downto 0) ;
	   sel : in STd_LOGIC ;
           Q : out STd_LOGIC_VECTOR (12 downto 0));
end component;

component MAR
     Port ( D : in STd_LOGIC_VECTOR (12 downto 0);
	   ld : in STd_LOGIC ;
	   RAZ : in STd_LOGIC ;
	   clk : in STd_LOGIC ;
           Q : out STd_LOGIC_VECTOR (12 downto 0));
end component;

signal Q_temp_0 : STd_LOGIC_VECTOR (12 downto 0);

begin
p1 : mux port map(pc_out, add_op, sel  ,Q_temp_0 );
p2 : MAR port map(Q_temp_0, ld ,RAZ , clk ,Q );



end Behavioral;
