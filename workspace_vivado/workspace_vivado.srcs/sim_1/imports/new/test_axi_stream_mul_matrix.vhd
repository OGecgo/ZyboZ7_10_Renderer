
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity test_axi_stream_mul_matrix is end test_axi_stream_mul_matrix;

architecture Behavioral of test_axi_stream_mul_matrix is

    component axi_stream_mul_matrix
        generic (size_data: integer := 32);
        port(
            clk : in std_logic;
            arst: in std_logic;

            -- 16 elements (4x4)
            s_tdata : in  signed(size_data * 16 - 1 downto 0);
            s_tid   : in  std_logic;
            s_tvalid: in  std_logic;
            s_tready: out std_logic;
        
            m_tdata : out signed(size_data * 16 - 1 downto 0);
            m_tvalid: out std_logic;
            m_tready: in  std_logic;
            m_tlast : out std_logic
        );
    end component;

    constant size_data : integer := 32;

    signal clk      : std_logic := '1';
    signal arst     : std_logic := '0';

    -- 16 elements (4x4)
    signal s_tdata  : signed(size_data * 16 - 1 downto 0) := (others => '0');
    signal s_tid    : std_logic := '0';
    signal s_tvalid : std_logic := '0';
    signal s_tready : std_logic;

    signal m_tdata  : signed(size_data * 16 - 1 downto 0);
    signal m_tvalid : std_logic;
    signal m_tready : std_logic := '1';
    signal m_tlast  : std_logic;

begin

    uut: entity work.axi_stream_mul_matrix
        generic map (
            size_data => size_data
        )
        port map (
            clk      => clk,
            arst     => arst,

            s_tdata  => s_tdata,
            s_tid    => s_tid,
            s_tvalid => s_tvalid,
            s_tready => s_tready,

            m_tdata  => m_tdata,
            m_tvalid => m_tvalid,
            m_tready => m_tready,
            m_tlast  => m_tlast
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
        m_tready <= '0';
        wait for 20 ns; -- write matrix
        s_tid <= '1';
        -- left = [5,2,3,5]
        --        [3,8,2,1]
        --        [5,2,1,9]
        --        [3,2,2,2]
        s_tdata <= to_signed(5, size_data) & to_signed(2, size_data) & to_signed(3, size_data) & to_signed(5, size_data)&
                   to_signed(3, size_data) & to_signed(8, size_data) & to_signed(2, size_data) & to_signed(1, size_data)&
                   to_signed(5, size_data) & to_signed(2, size_data) & to_signed(1, size_data) & to_signed(9, size_data)&
                   to_signed(3, size_data) & to_signed(2, size_data) & to_signed(2, size_data) & to_signed(2, size_data);
        s_tvalid <= '1'; 

        wait for 20 ns;
        s_tid <= '0';
        -- right = [3,2,1,3]
        --         [2,4,8,2]
        --         [2,2,3,1]
        --         [1,6,5,2]
        s_tdata <= to_signed(3, size_data) & to_signed(2, size_data) & to_signed(1, size_data) & to_signed(3, size_data)&
                   to_signed(2, size_data) & to_signed(4, size_data) & to_signed(8, size_data) & to_signed(2, size_data)&
                   to_signed(2, size_data) & to_signed(2, size_data) & to_signed(3, size_data) & to_signed(1, size_data)&
                   to_signed(1, size_data) & to_signed(6, size_data) & to_signed(5, size_data) & to_signed(2, size_data);
        s_tvalid <= '1';
        
        wait for 20 ns;
        m_tready <= '1';
        wait;
    end process;


end Behavioral;