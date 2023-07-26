library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bidir_bus is
    port(bus_data: inout std_logic;
         data_in: in std_logic;
         data_out: out std_logic;
         direction: in std_logic); -- 1 -> data is input, 0 -> data is output
end bidir_bus;

architecture Behavioral of bidir_bus is

begin

--data_out <= bus_data; -- another option
data_out <= bus_data when (direction = '1') else 'Z';
bus_data <= data_in when (direction = '0') else 'Z';

end Behavioral;
