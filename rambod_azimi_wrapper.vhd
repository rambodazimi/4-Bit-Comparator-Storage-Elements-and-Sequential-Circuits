library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity rambod_azimi_wrapper is
Port (enable: in std_logic;
reset: in std_logic;
clk: in std_logic;
HEX0: out std_logic_vector(6 downto 0));
end rambod_azimi_wrapper;

architecture wrapper of rambod_azimi_wrapper is
signal count_signal: std_logic_vector(2 downto 0);
signal en_out_signal: std_logic;
signal decoder_input_signal: std_logic_vector(3 downto 0);
signal HEX0_output: std_logic_vector(6 downto 0);

-- We need to import 3 circuits to the design (counter, clock divider, seven segment decoder). So, we use component
component rambod_azimi_counter is
Port (enable : in std_logic;
reset: in std_logic;
clk : in std_logic;
count : out std_logic_vector(2 downto 0));
end component;

component rambod_azimi_clock_divider is
Port (enable: in std_logic;
reset: in std_logic;
clk: in std_logic;
en_out: out std_logic);
end component;

component rambod_Azimi_seven_segment_decoder is
port (code : in std_logic_vector(3 downto 0);
segments_out : out std_logic_vector(6 downto 0));
end component;

begin
clockDivider: rambod_Azimi_clock_divider port map(enable, reset, clk, en_out_signal);

counter: rambod_azimi_counter port map(en_out_signal, reset, clk, count_signal);

decoder_input_signal <= "0" & count_signal;	-- convert 3 bit vector to 4 bit vector by anding with 0

decoder: rambod_azimi_seven_segment_decoder port map(decoder_input_signal, HEX0_output);

HEX0 <= HEX0_output;

end wrapper;


