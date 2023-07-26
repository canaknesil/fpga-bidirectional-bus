library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inout_example is
    port(data_in_1: in std_logic;
         data_in_2: in std_logic;
         data_out_1: out std_logic;
         data_out_2: out std_logic;
         direction: in std_logic); -- 0 -> data flows from user 1 to user 2, 1 -> data flows from user 2 to user 1
end inout_example;

architecture Behavioral of inout_example is

component bidir_bus is
    port(bus_data: inout std_logic;
         data_in: in std_logic;
         data_out: out std_logic;
         direction: in std_logic); -- 1 -> data is input, 0 -> data is output
end component;

signal bus_data, direction_1, direction_2: std_logic;

begin

BUS_USER_1: bidir_bus port map(
    bus_data => bus_data,
    data_in => data_in_1,
    data_out => data_out_1,
    direction => direction_1
);

BUS_USER_2: bidir_bus port map(
    bus_data => bus_data,
    data_in => data_in_2,
    data_out => data_out_2,
    direction => direction_2
);

direction_1 <= direction;
direction_2 <= not direction;

end Behavioral;
