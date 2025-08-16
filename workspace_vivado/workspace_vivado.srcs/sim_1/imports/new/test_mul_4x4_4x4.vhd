

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity test_mul_4x4_4x4 is end test_mul_4x4_4x4;

architecture Behavioral of test_mul_4x4_4x4 is

    component mul_4x4_4x4
        generic(size_data: integer := 32);
        port(
            clk:  in std_logic;
            arst: in std_logic;

            s_tdata_left_block  : in  signed(size_data * 16 - 1 downto 0);
            s_tdata_right_block : in  signed(size_data * 16 - 1 downto 0);
            s_tvalid: in  std_logic;
            s_tready: out std_logic;

            m_tdata : out signed(size_data * 16 - 1 downto 0);
            m_tvalid: out std_logic;
            m_tready: in  std_logic
        );
    end component;

    signal size_data: integer := 32;

    signal clk : std_logic := '0';
    signal arst: std_logic := '0';

    signal s_tdata_left_block  :signed(size_data * 16 - 1 downto 0) := (others => '0');
    signal s_tdata_right_block :signed(size_data * 16 - 1 downto 0) := (others => '0');
    signal s_tvalid: std_logic := '0';
    signal s_tready: std_logic;

    signal m_tdata : signed(size_data * 16 - 1 downto 0);
    signal m_tvalid: std_logic;
    signal m_tready: std_logic := '0';
begin

    uut: entity work.mul_4x4_4x4
    generic map(size_data => size_data)
    Port map(
        clk  => clk,
        arst => arst,

        s_tdata_left_block   => s_tdata_left_block,
        s_tdata_right_block  => s_tdata_right_block,
        s_tvalid => s_tvalid,
        s_tready => s_tready,

        m_tdata  => m_tdata,
        m_tvalid => m_tvalid,
        m_tready => m_tready
    )
    ;

    clock_proc: process
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
        --         [2,4,8,2]
        --         [2,2,3,1]
        --         [1,6,5,2]
        s_tdata_right_block <= to_signed(3, size_data) & to_signed(2, size_data) & to_signed(1, size_data) & to_signed(3, size_data)&
                       to_signed(2, size_data) & to_signed(4, size_data) & to_signed(8, size_data) & to_signed(2, size_data)&
                       to_signed(2, size_data) & to_signed(2, size_data) & to_signed(3, size_data) & to_signed(1, size_data)&
                       to_signed(1, size_data) & to_signed(6, size_data) & to_signed(5, size_data) & to_signed(2, size_data);
        
        wait for 40 ns;
        s_tvalid <= '1';
        m_tready <= '0';
        wait for 100 ns; -- take data
        m_tready <= '1';
        wait for 20 ns;  -- cannot take data
        s_tvalid <= '0';
        m_tready <= '0';
        wait;
    end process;

end Behavioral;
