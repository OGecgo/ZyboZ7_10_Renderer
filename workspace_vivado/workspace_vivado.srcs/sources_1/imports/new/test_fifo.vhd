library ieee;
use ieee.STD_LOGIC_1164.all;

entity test_fifo is 
    port(
        empty : in std_logic;
        full  : in std_logic;

        din   : in std_logic_vector  (31 downto 0);
        dout  : out std_logic_vector (31 downto 0);

        we    : out std_logic;
        re    : out std_logic
    );
end test_fifo;


architecture Behavioral of test_fifo is
begin

    -- read
    re <= '1' when empty = '0' and full = '0'
    else  '0';
    -- write
    we <= '1' when empty = '0' and full = '0'
    else  '0';

    -- not
    dout <= not(din);
end Behavioral;