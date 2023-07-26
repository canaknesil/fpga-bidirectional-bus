library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inout_example_sim is
end inout_example_sim;

architecture Behavioral of inout_example_sim is

component inout_example is
    port(data_in_1: in std_logic;
         data_in_2: in std_logic;
         data_out_1: out std_logic;
         data_out_2: out std_logic;
         direction: in std_logic); -- 0 -> data flows from user 1 to user 2, 1 -> data flows from user 2 to user 1
end component;

signal data_in_1: std_logic := '0';
signal data_in_2: std_logic := '1';
signal data_out_1, data_out_2, direction: std_logic;

begin

DUT: inout_example port map(
    data_in_1 => data_in_1,
    data_in_2 => data_in_2,
    data_out_1 => data_out_1,
    data_out_2 => data_out_2,
    direction => direction
);

process
begin
    direction <= '0';
    wait for 20ns;
    direction <= '1';
    wait for 20ns;
end process;


end Behavioral;
