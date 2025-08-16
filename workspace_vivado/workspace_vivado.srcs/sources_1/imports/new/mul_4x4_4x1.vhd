

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity mul_4x4_4x1 is
    generic(size_data: integer := 32);
    Port (
        clk:  in std_logic;
        arst: in std_logic; -- active low 

        s_tdata_left_block  : in  signed(size_data * 16 - 1 downto 0);
        s_tdata_right_line  : in  signed(size_data *  4 - 1 downto 0);
        s_tvalid            : in  std_logic;
        s_tready            : out std_logic;

        m_tdata : out signed(size_data *  4 - 1 downto 0);
        m_tvalid: out std_logic;
        m_tready: in  std_logic
    );
end mul_4x4_4x1;

architecture Behavioral of mul_4x4_4x1 is

component mul_1x4_4x1
    generic(size_data: integer := 32);
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

    signal m_tvalid_array: std_logic_vector(3 downto 0);
    signal s_tready_array: std_logic_vector(3 downto 0);

begin
    -- generate for block for multiply
    gen_mul: for i in 0 to 3 generate
        u_mul: mul_1x4_4x1 
            generic map(size_data => size_data)
            port map(
                clk  => clk,
                arst => arst,

                s_tdata_left   => s_tdata_left_block(size_data * (16 - i * 4) - 1 downto size_data * (12 - i * 4)), 
                s_tdata_right  => s_tdata_right_line,
                s_tvalid => s_tvalid, -- check validation being in mul_1x4_4x1
                s_tready => s_tready_array(3 - i),

                m_tdata  => m_tdata(size_data *  (4 - i) - 1 downto size_data *  (3 - i)),
                m_tvalid => m_tvalid_array(3 - i),
                m_tready => m_tready
            );
    end generate gen_mul;
    
    m_tvalid <= m_tvalid_array(3) and m_tvalid_array(2) and m_tvalid_array(1) and m_tvalid_array(0);
    s_tready <= s_tready_array(3) and s_tready_array(2) and s_tready_array(1) and s_tready_array(0);
end Behavioral;
