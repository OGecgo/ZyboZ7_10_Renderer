
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity test_mul_1x4_4x1 is end test_mul_1x4_4x1;

architecture Behavioral of test_mul_1x4_4x1 is


    component mul_1x4_4x1
        generic ( size_data: integer := 32);
        Port (
            clk : in std_logic;
            arst: in std_logic; -- active low

            s_tdata_left : in  signed(size_data * 4 - 1 downto 0);
            s_tdata_right: in  signed(size_data * 4 - 1 downto 0);
            s_tvalid     : in  std_logic;
            s_tready     : out std_logic;

            m_tdata : out signed(size_data - 1 downto 0);
            m_tvalid: out std_logic;
            m_tready: in  std_logic
        );
    end component;

    signal size_data: integer := 32;

    signal clk : std_logic := '0';
    signal arst: std_logic := '0';

    signal s_tdata_left   : signed(size_data * 4 - 1 downto 0) := (others => '0');
    signal s_tdata_right  : signed(size_data * 4 - 1 downto 0) := (others => '0');
    signal s_tvalid       : std_logic := '0';
    signal s_tready       : std_logic;

    signal m_tdata : signed(size_data - 1 downto 0);
    signal m_tvalid: std_logic;
    signal m_tready: std_logic := '0';

begin

    uut: entity work.mul_1x4_4x1
        generic map(size_data => size_data)
        Port map(
            clk  => clk,
            arst => arst,
            s_tdata_left  => s_tdata_left,
            s_tdata_right => s_tdata_right,
            s_tvalid => s_tvalid,
            s_tready => s_tready,
            m_tdata  => m_tdata,
            m_tvalid => m_tvalid,
            m_tready => m_tready
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
        -- s_tdata_left = [5,2,3,5]
        s_tdata_left <= to_signed(5, size_data)&
                to_signed(2, size_data)&
                to_signed(3, size_data)&
                to_signed(5, size_data);

        -- s_tdata_right = [3,2,1,3]
        s_tdata_right <= to_signed(3, size_data)&
                 to_signed(2, size_data)&
                 to_signed(1, size_data)&
                 to_signed(3, size_data);
        
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
