Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all; 

entity cpu is
port (  n_rst : in std_logic;
	clk : in std_logic;
	cs : in std_logic);
end cpu;

architecture bhv of cpu is

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

component MARux
    Port ( pc_out : in STd_LOGIC_VECTOR (12 downto 0);
	   add_op : in STd_LOGIC_VECTOR (12 downto 0) ;
	   sel : in STd_LOGIC ;
	   ld : in STd_LOGIC ;
	   RAZ : in STd_LOGIC ;
	   clk : in STd_LOGIC ;
           Q : out STd_LOGIC_VECTOR (12 downto 0));
end component;

component IR
    Port ( D : in STd_LOGIC_VECTOR (15 downto 0);
	   ld : in STd_LOGIC ;
	   RAZ : in STd_LOGIC ;
	   clk : in STd_LOGIC ;
           op_code: out STd_LOGIC_VECTOR (2 downto 0);
	   addr_op : out STd_LOGIC_VECTOR (12 downto 0);
           branch : out STd_LOGIC_VECTOR (12 downto 0));
end component;

component reg_AC 
	     Port ( D : in STD_LOGIC_VECTOR (15 downto 0)  ;
		   store : in STD_LOGIC ;
		   ld_AC : in STD_LOGIC ;
		   RAZ : in STD_LOGIC ;
		   clk : in STD_LOGIC ;
		   Q : out STD_LOGIC_VECTOR (15 downto 0);
		   Q_mem : out STD_LOGIC_VECTOR (15 downto 0));

end component;

component ALU
	 Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
		   b : in STD_LOGIC_VECTOR (15 downto 0);
		   fc_ctrl : in STD_LOGIC_VECTOR (2 downto 0);
		   s : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component PC
    Port ( branch : in STd_LOGIC_VECTOR (12 downto 0);
	   incr : in STd_LOGIC ;
	   ld : in STd_LOGIC ;
	   RAZ : in STd_LOGIC ;
	   clk : in STd_LOGIC ;
           Q : out STd_LOGIC_VECTOR (12 downto 0));
end component;

component ROM 
port ( Address : in std_logic_vector(12 downto 0);
CS : in std_logic;
data : out std_logic_vector(15 downto 0));
end component;



signal raz,store,ld_AC,ld_PC,incr,ld_MAR,sel,ld_IR: std_logic ;
signal fc_ctrl,op_code: std_logic_vector(2 downto 0) ;
signal pc_out,addr_op,branch,Address :STD_LOGIC_VECTOR (12 downto 0);
signal a,Q_mem,data,s :STD_LOGIC_VECTOR (15 downto 0);

begin

--dans ce script je fais juste le rootage des blocs.
	c0 : FSM port map(n_rst,clk,op_code,RAZ,fc_ctrl,store,ld_AC,ld_PC,incr,ld_MAR,sel,ld_IR);
	c1 : MARux port map(pc_out,addr_op,sel, ld_MAR ,RAZ , clk ,Address );
	c2 : IR port map(data, ld_IR ,RAZ , clk ,op_code,addr_op,branch );
	c3 : reg_AC port map(s, store,ld_AC ,RAZ , clk ,a,Q_mem );
	c4 : ALU port map(a, data, fc_ctrl, s);
	c5 : PC port map(branch, incr, ld_PC ,RAZ , clk ,pc_out );
	c6 : ROM port map( Address ,cs,data);



end bhv;
