library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity axi_stream_mul_matrix is
    generic(size_data: integer := 32);
    port(
        clk : in std_logic;
        arst: in std_logic;

        -- axi stream
        s_tdata : in  signed(size_data * 16 - 1 downto 0);
        s_tid   : in  std_logic;
        s_tvalid: in  std_logic;
        s_tready: out std_logic;
    
        m_tdata : out signed(size_data * 16 - 1 downto 0);
        m_tvalid: out std_logic;
        m_tready: in  std_logic
    );
end axi_stream_mul_matrix;

architecture Behavioral of axi_stream_mul_matrix is

    component mul_4x4_4x4
        generic(size_data: integer := 32);
        port(
            clk : in std_logic;
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

    signal matrix: signed(size_data * 16 - 1 downto 0);
    signal do_mul: std_logic;
    signal save_matrix: std_logic;

    signal s_tready_temp: std_logic;

begin
    do_mul      <= (not s_tid) and s_tvalid;
    save_matrix <= s_tid and s_tvalid;

    u_mul: mul_4x4_4x4
        generic map(size_data => size_data)
        port map(
            clk  => clk,
            arst => arst,

            s_tdata_left_block  => matrix,
            s_tdata_right_block => s_tdata,
            s_tvalid            => do_mul,
            s_tready            => s_tready_temp,

            m_tdata  => m_tdata,
            m_tvalid => m_tvalid,
            m_tready => m_tready
        );
    
    process (clk, arst)
    begin
        if arst='0' then -- on second clock take data
            matrix <= (others => '0');
        elsif clk'event and clk='1' then
            if save_matrix='1' then matrix <= s_tdata;
            end if;
        end if;
    end process;
    s_tready <= s_tready_temp or save_matrix;
    --m_tdata <= matrix; debug
end Behavioral;