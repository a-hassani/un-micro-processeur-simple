Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity ROM is
port ( Address : in std_logic_vector(12 downto 0);
CS : in std_logic;
data : out std_logic_vector(15 downto 0));
end ROM;

architecture Behavior of ROM is

begin
process (Address, CS)
begin
	data <= (others => 'Z');
	if CS = '0' then
		case Address is
			when "0000000000000" => data <= "0001000000000000";
			when "0000000000001" => data <= "0011111000011110";
			when "0000000000010" => data <= "1011101000011110";
			when "0000000000011" => data <= "0101111000011110";
			when "0000000000100" => data <= "1100001000010010";
			when "1101000011110" => data <= "1111111111111111";
			when "1000000000000" => data <= "1010101010101010";
			when "1111000011110" => data <= "0110001110001110";
			when others => data <= (others => '0');
		end case;
	end if;
end process;

end Behavior;
