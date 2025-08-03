
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity test_mul_4x4_4x1 is end test_mul_4x4_4x1;

architecture Behavioral of test_mul_4x4_4x1 is


    component mul_4x4_4x1
        generic(size_data: integer := 32);
        Port (
            clk:  in std_logic;
            arst: in std_logic; -- active low 

            s_tdata_left_block  : in  signed(size_data * 16 - 1 downto 0);
            s_tdata_right_line  : in  signed(size_data *  4 - 1 downto 0);
            s_tvalid            : in std_logic;

            m_tdata:  out signed(size_data *  4 - 1 downto 0);
            m_tvalid: out std_logic
        );
    end component;

    signal size_data: integer := 32;

    signal clk : std_logic := '0';
    signal arst: std_logic := '0';

    signal s_tdata_left_block  : signed(size_data * 16 - 1 downto 0) := (others => '0');
    signal s_tdata_right_line  : signed(size_data *  4 - 1 downto 0) := (others => '0');
    signal s_tvalid: std_logic := '0';

    signal m_tdata : signed(size_data * 4 - 1 downto 0);
    signal m_tvalid: std_logic;

begin

    uut: entity work.mul_4x4_4x1
        generic map(size_data => size_data)
        Port map(
            clk  => clk,
            arst => arst,
            s_tdata_left_block  => s_tdata_left_block,
            s_tdata_right_line  => s_tdata_right_line,
            s_tvalid => s_tvalid,
            m_tdata  => m_tdata,
            m_tvalid => m_tvalid
        );



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
        --        [3,8,2,1]
        --        [5,2,1,9]
        --        [3,2,2,2]
        s_tdata_left_block <= to_signed(5, size_data) & to_signed(2, size_data) & to_signed(3, size_data) & to_signed(5, size_data)&
                      to_signed(3, size_data) & to_signed(8, size_data) & to_signed(2, size_data) & to_signed(1, size_data)&
                      to_signed(5, size_data) & to_signed(2, size_data) & to_signed(1, size_data) & to_signed(9, size_data)&
                      to_signed(3, size_data) & to_signed(2, size_data) & to_signed(2, size_data) & to_signed(2, size_data);


        -- right = [3,2,1,3]
        s_tdata_right_line <= to_signed(3, size_data)&
                      to_signed(2, size_data)&
                      to_signed(1, size_data)&
                      to_signed(3, size_data);
        wait for 50 ns;
        s_tvalid <= '1';
        wait for 20 ns;
        s_tvalid <= '0';
        wait for 100 ns;
        s_tvalid <= '1';
        wait;
    end process;

end Behavioral;
