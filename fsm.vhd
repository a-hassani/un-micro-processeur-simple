

Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all; 

entity FSM is
port (  n_rst : in std_logic;
	clk : in std_logic;
	op_code : in std_logic_vector(2 downto 0);
	WE: out std_logic:='0';
	OE: out std_logic:='0';
	raz : out std_logic:='0';
	fc_ctrl : out std_logic_vector(2 downto 0);
	store : out std_logic:='0';
	ld_AC : out std_logic:='0';
	ld_PC : out std_logic:='0';
	incr : out std_logic:='0';
	ld_MAR : out std_logic:='0';
	sel: out std_logic:='0';
	ld_IR : out std_logic:='0');
end FSM;

architecture bhv of FSM is
     type State_type is (Init,PC2MAR, Load_IR, op2MAR, Sav_inc, branchPC);
		 signal next_state,state : State_type;

begin
p1:process(state)
begin
     case state is
-- j'initialise les registres quand n_rst est à 0
         when Init => raz<='1';fc_ctrl<=op_code;store<='0';ld_AC<='0';
		ld_PC<='0'; incr<='0';ld_MAR<='0';sel<='0';ld_IR<='0';WE<='1';OE<='0';
		next_state <= PC2MAR;
--je charge le registre MAR à partir du registre PC en selectionnent l'entrée 0 du mux
	 when PC2MAR => raz<='0';fc_ctrl<=op_code;store<='0';ld_AC<='0';
		ld_PC<='0'; incr<='0';ld_MAR<='1';sel<='0';ld_IR<='0'; WE<='1';OE<='0';
		next_state <= Load_IR;
--je charge le registre IR à partir de memoire
         when Load_IR =>raz<='0';fc_ctrl<=op_code;store<='0';ld_AC<='0';
		ld_PC<='0'; incr<='0';ld_MAR<='0';sel<='0';ld_IR<='1';WE<='1';OE<='0';
-- si j'ai op_code = 111 je passe à l'etat branchPC
              if op_code = "111" then
		next_state <= branchPC;
--si non je passe à l'etat op2mar
	      else
		next_state <= op2MAR;
	      end if;
--je charge Address operand dans le registre MAR à partir du registre IR en selectionnent l'entrée 1 du mux
         when op2MAR =>raz<='0';ld_AC<='0';ld_PC<='0'; incr<='0';
		ld_MAR<='1';sel<='1';ld_IR<='0';
-- si j'ai op_code = 110 j'enregistre la donnée de AC dans la memoire 
		if op_code = "110" then
			store<='1';WE<='0';OE<='1';
--si non je sors une commande d'opération suivant l'op_code
	      else
			fc_ctrl<=op_code;WE<='1';OE<='0';
	      end if;
		next_state <= Sav_inc;
--j'incrémente le registre PC avec +1 pour faire saut dans la memoire 
	 when Sav_inc =>raz<='0';fc_ctrl<=op_code;store<='0';ld_AC<='1';
		ld_PC<='0'; incr<='1';ld_MAR<='0';sel<='0';ld_IR<='0';WE<='1';OE<='0';
		next_state <= PC2MAR;
--je charge Branch dans le registre PC à partir du registre IR 
	 when branchPC =>raz<='0';fc_ctrl<=op_code;store<='0';ld_AC<='0';
		ld_PC<='1'; incr<='0';ld_MAR<='0';sel<='0';ld_IR<='0';WE<='1';OE<='0';
		next_state <= PC2MAR;
	 end case;
end process;

p2:process(CLK)
begin
  if CLK'event and CLK = '1' then
--reset
  	if (n_rst = '0' ) then
     		state <= Init;
	else
     		state <= next_state;
	end if;
  else 
	state<= state;
  end if;

end process;

end bhv;
