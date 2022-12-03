library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rambod_azimi_jkff is	-- 3 input signals clk, J, and K
Port (clk : in std_logic;		-- 1 output signal Q
		J : in std_logic;
		K : in std_logic;
		Q : out std_logic);
end rambod_azimi_jkff;

architecture jkff of rambod_azimi_jkff is
	signal q1: std_logic;

begin

process(clk)
begin
if (rising_edge(clk)) then

	if (J='0' and K='0') then	-- J = K = 0 => Q(t+1) = Q(t)
		q1 <= q1;
		
	elsif (J='0' and K='1') then	-- J = 0 and K = 1 => Q(t+1) = 0
		q1 <= '0';
		
	elsif (J='1' and K='0') then	-- J = 1 and K = 0 => Q(t+1) = 1
		q1 <= '1';
		
	elsif (J='1' and K='1') then	-- J = K = 1 => Q(t+1) = Q(t)'
		q1 <= not(q1);
		
	end if;
end if;

end process;

Q <= q1;	-- storing the q1 into Q output

end jkff;