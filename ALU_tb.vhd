library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ALU_tb is
end ALU_tb;

architecture Behavioral of ALU_tb is
component ALU
 Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           fc_ctrl : in STD_LOGIC_VECTOR (2 downto 0);
           s : out STD_LOGIC_VECTOR (15 downto 0));
end component;
 
signal sa, sb : STD_LOGIC_VECTOR (15 downto 0);
signal sfc_ctrl : STD_LOGIC_VECTOR (2 downto 0);
signal  ss : STD_LOGIC_VECTOR (15 downto 0);
begin
c : ALU port map(sa, sb, sfc_ctrl, ss);

simu : process
begin


sa <= x"FFFF";
sb <= x"FF1F";
wait for 100 ns;
sb <= x"F01F";
wait for 20 ns;

sa <= "0000110001000110";
sb <= "0001110001000110";
wait for 100 ns;

sa <= "0000000001000110";
sb <= "0000110001000110";
wait for 100 ns;

sa <= "0000000001000110";
sb <= "0000010001000110";
wait for 100 ns;

end process ;


simu1 : process
begin


sfc_ctrl <= "010";
wait for 100 ns;

sfc_ctrl <= "001";
wait for 100 ns;

sfc_ctrl <= "010";
wait for 100 ns;

sfc_ctrl <= "000";
wait for 100 ns;

end process ;

end Behavioral;
