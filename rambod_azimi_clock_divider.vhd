library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity rambod_azimi_clock_divider is
Port (enable : in std_logic;
reset : in std_logic;
clk : in std_logic;
en_out : out std_logic);
end rambod_azimi_clock_divider;


architecture divider of rambod_azimi_clock_divider is
signal output: std_logic_vector(25 downto 0);
signal T: unsigned(25 downto 0);
signal a: std_logic;
begin

process (clk)
begin


case reset is
when '0' => -- reset is active-low
T <= "10111110101111000001111111";	-- reset T to 49,999,999
		
when '1' =>	-- when reset = 1, no need to reset!
	if (enable = '1' and rising_edge(clk)) then
		T <= to_unsigned((to_integer(unsigned(T)) - 1) mod 50000000, 26);
end if;

when others =>	-- else, to nothing!

end case;

end process;

output <= std_logic_vector(T);
a <= output(0) OR output(1) OR output(2) OR output(3) OR output(4) OR output(5) OR output(6) OR output(7) OR output(8)
OR output(9) OR output(10) OR output(11) OR output(12) OR output(13) OR output(14) OR output(15) OR output(16) OR output(17) OR output(18)
OR output(19) OR output(20) OR output(21) OR output(22) OR output(23) OR output(24) OR output(25);
en_out <= NOT (a);
end divider;