

Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all; 

entity fsm_tb is
end fsm_tb;

architecture bhv of fsm_tb is

component FSM
port (  n_rst : in std_logic;
	clk : in std_logic;
	op_code : in std_logic_vector(2 downto 0);
	raz : out std_logic;
	fc_ctrl : out std_logic_vector(2 downto 0);
	store : out std_logic;
	ld_AC : out std_logic;
	ld_PC : out std_logic;
	incr : out std_logic;
	ld_MAR : out std_logic;
	sel: out std_logic;
	ld_IR : out std_logic);
end component;

signal n_rst,clk,raz,store,ld_AC,ld_PC,incr,ld_MAR,sel,ld_IR: std_logic ;
signal fc_ctrl,op_code: std_logic_vector(2 downto 0) ;

begin

UUT : FSM port map(n_rst,clk,op_code,raz,fc_ctrl,store,ld_AC,ld_PC,incr,ld_MAR,sel,ld_IR);

c : process 
	begin
		clk<='0';
		wait for 50ns;

		clk<='1';
		wait for 50ns;
end process c;

p1 : process
	begin

	wait for 350 ns;
	op_code <= "000";
	wait for 350 ns;

	op_code <= "001";
	wait for 350 ns;

	op_code <= "010";
	wait for 350 ns;

	op_code <= "101";
	wait for 350 ns;

	op_code <= "110";
	wait for 350 ns;

	op_code <= "111";
	wait for 250 ns;

end process p1;

p3 : process
	begin

	n_rst <= '0';
	wait for 100 ns;

	n_rst <= '1';
	wait for 2350 ns;

end process p3;

end bhv;
