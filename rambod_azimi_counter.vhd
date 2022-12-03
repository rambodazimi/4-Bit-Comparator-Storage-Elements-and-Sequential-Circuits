library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rambod_azimi_counter is
Port ( enable : in std_logic;
reset: in std_logic;
clk : in std_logic;
count : out std_logic_vector(2 downto 0));
end rambod_azimi_counter;


architecture counter of rambod_Azimi_counter is

signal output: unsigned(2 downto 0);	-- define a signal with type unsigned to do operation inside the process block statement


begin

process (clk)
begin

case reset is
when '0' => 
output <= "000";	-- reset the counter to 000

when '1' =>
	if (rising_edge(clk) and enable = '1') then
	output <= to_unsigned((to_integer(unsigned(output)) + 1) mod 8, 3);
	end if;
	
when others =>	-- else, to nothing!

end case;

end process;

count <= std_logic_vector(output);	-- convert unsigned to vector and assign it to count

end counter;