-- Written by Rambod Azimi and Zuhair Mesam Salwati

-- Importing the required libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


-- Defining the entity part of the design (two 4-bit vectors as inputs and 6 outputs)
entity rambod_azimi_comparator is
Port (A, B: in std_logic_vector (3 downto 0);
AgtBplusOne : out std_logic;
AgteBplusOne : out std_logic;
AltBplusOne : out std_logic;
AlteBplusOne : out std_logic;
AeqBplusOne : out std_logic;
overflow : out std_logic);
end rambod_azimi_comparator ;

architecture comp of rambod_azimi_comparator is

begin
process (A,B)	-- A and B are the parameters of the process (because we want to use and manupulate these arguments)
begin

-- convert B vector into an integer
IF (to_integer(unsigned(B)) + 1 = 16) THEN	-- if B=15, B+1=16, which means that we can't fit B+1 into a 4-bit vector. Therefore, an overflow occurs...
AgtBplusOne <= '0';
AgteBplusOne <= '0';
AltBplusOne <= '0';
AlteBplusOne <= '0';
AeqBplusOne <= '0';
overflow <= '1';
-- In all other cases, we are certain that an overflow will not happen

ELSIF (to_integer(unsigned(B)) + 1 < to_integer(unsigned(A))) THEN	-- if A > B+1
overflow <= '0';
AgteBplusOne <= '1';
AltBplusOne <= '0';
AlteBplusOne <= '0';
AeqBplusOne <= '0';
AgtBplusOne <= '1';

ELSIF (to_integer(unsigned(B)) + 1 > to_integer(unsigned(A))) THEN	-- if A < B+1
overflow <= '0';
AgteBplusOne <= '0';
AgtBplusOne <= '0';
AlteBplusOne <= '1';
AeqBplusOne <= '0';
AltBplusOne <= '1';

ELSIF (to_integer(unsigned(B)) + 1 = to_integer(unsigned(A))) THEN	-- if A = B+1
overflow <= '0';
AgtBplusOne <= '0';
AltBplusOne <= '0';
AgteBplusOne <= '1';
AlteBplusOne <= '1';
AeqBplusOne <= '1';

ELSE	-- in all other cases, all the values for the output are 0
overflow <= '0';
AgteBplusOne <= '0';
AgtBplusOne <= '0';
AlteBplusOne <= '0';
AeqBplusOne <= '0';
AltBplusOne <= '0';

END IF;
end process;
end comp;