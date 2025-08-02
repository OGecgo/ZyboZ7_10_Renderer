
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity test_mul_1x4_4x1 is end test_mul_1x4_4x1;

architecture Behavioral of test_mul_1x4_4x1 is


    component mul_1x4_4x1
        generic (
            size_data: integer := 32 -- size of bits
        );
        
        Port (
            clk: in std_logic;
            arst: in std_logic;

            left:   in  signed(size_data * 4 - 1 downto 0);
            right:  in  signed(size_data * 4 - 1 downto 0);

            tdata:  out signed(size_data - 1 downto 0);
            tvalid: out std_logic
        );
    end component;

    signal size_data: integer := 32;

    signal clk : std_logic := '0';
    signal arst: std_logic := '0';

    signal left   : signed(size_data * 4 - 1 downto 0) := (others => '0');
    signal right  : signed(size_data * 4 - 1 downto 0) := (others => '0');
    
    signal tdata : signed(size_data - 1 downto 0);
    signal tvalid: std_logic;

begin

    uut: entity work.mul_1x4_4x1
        generic map(size_data => size_data)
        Port map(
            clk => clk,
            arst => arst,
            left => left,
            right => right,
            tdata => tdata,
            tvalid=> tvalid
        )
    ;

    time_proc: process
    begin
        clk <= not(clk);
        wait for 10 ns;
    end process;

    stim_proc: process
    begin
        wait for 20 ns;
        arst <= '1';
        -- left = [5,2,3,5]
        left <= to_signed(5, size_data)&
                to_signed(2, size_data)&
                to_signed(3, size_data)&
                to_signed(5, size_data);

        -- right = [3,2,1,3]
        right <= to_signed(3, size_data)&
                 to_signed(2, size_data)&
                 to_signed(1, size_data)&
                 to_signed(3, size_data);

        wait;
    end process;

end Behavioral;
