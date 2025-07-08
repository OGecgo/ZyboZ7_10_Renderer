

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity test_AXI_matrix_mul is end test_AXI_matrix_mul;

architecture Behavioral of test_AXI_matrix_mul is

    component AXI_matrix_mul
        generic (
            floatSize : integer := 32
        );
        port (
            -- slave AXI Stream (input)
            s_axis_tdata  : in  std_logic_vector(16*floatSize-1 downto 0);
            s_axis_tvalid : in  std_logic;
            s_axis_tlast  : in  std_logic;
            s_axis_tready : out std_logic;


            -- master AXI Stream (ouput)
            m_axis_tdata  : out std_logic_vector(16*floatSize-1 downto 0);
            m_axis_tvalid : out std_logic;
            m_axis_tlast  : out std_logic;
            m_axis_tready : in  std_logic;

            -- Clock/Reset
            aclk    : in std_logic;
            aresetn : in std_logic    
        );
    end component;

    -- Input slave
    signal s_axis_tdata  : std_logic_vector(511 downto 0) := (others => '0');
    signal s_axis_tvalid : std_logic := '0';
    signal s_axis_tlast  : std_logic := '0';
    signal s_axis_tready : std_logic;

    -- Output master 
    signal m_axis_tdata  : std_logic_vector(511 downto 0);
    signal m_axis_tvalid : std_logic;
    signal m_axis_tlast  : std_logic;
    signal m_axis_tready : std_logic := '0';

    signal aclk    : std_logic := '0';
    signal aresetn : std_logic := '0';


begin

    uut: entity work.AXI_matrix_mul 
        generic map (
            floatSize => 32 
        )    
        port map(
        -- input
        s_axis_tdata  => s_axis_tdata,
        s_axis_tvalid => s_axis_tvalid,
        s_axis_tlast  => s_axis_tlast,
        s_axis_tready => s_axis_tready,

        -- output
        m_axis_tdata  => m_axis_tdata,
        m_axis_tvalid => m_axis_tvalid,
        m_axis_tlast  => m_axis_tlast,
        m_axis_tready => m_axis_tready,

        -- clock
        aclk          => aclk,
        aresetn       => aresetn
    );

    clock_proc: process
    begin
        wait for 5 ns;
        aclk <= not aclk; -- start with 0
    end process;

    stim_proc: process
    begin
        -- Reset sequence
        aresetn <= '0';
        wait for 20 ns;
        aresetn <= '1';        
        wait for 20 ns;

        -- Wait for ready signal
        if s_axis_tready = '0' then
            wait until s_axis_tready = '1';
        end if;
        wait for 10 ns;

        -- Send first data (512 bits = 16 floats × 32 bits)
        s_axis_tdata <= (others => '0');  -- data
        s_axis_tvalid <= '1';
        s_axis_tlast <= '1';
        wait until rising_edge(aclk); -- wait one clock for send data
        
        -- Complete the transaction
        s_axis_tvalid <= '0';
        s_axis_tlast <= '0';
        
        -- Wait for output to be ready
        wait until m_axis_tvalid = '1';
        wait for 10 ns;
        
        -- take the output data
        m_axis_tready <= '1';
        wait for 10 ns;
        m_axis_tready <= '0';
        
        -- Wait a bit before next transaction
        wait for 10 ns;

        -- Send second test data
        if s_axis_tready = '0' then
            wait until s_axis_tready = '1';
        end if;

        s_axis_tdata <= (others => '1');  -- All ones test data
        s_axis_tvalid <= '1';
        s_axis_tlast <= '1';
        wait for 10 ns;
        
        -- Complete the transaction
        s_axis_tvalid <= '0';
        s_axis_tlast <= '0';
        
        -- Wait for output and accept it
        if m_axis_tvalid = '0' then
            wait until m_axis_tvalid = '1';
        end if;
        
        wait for 10 ns;
        m_axis_tready <= '1';
        wait until rising_edge(aclk);
        m_axis_tready <= '0';

        wait for 100 ns;
        wait;
    end process;


end Behavioral;
