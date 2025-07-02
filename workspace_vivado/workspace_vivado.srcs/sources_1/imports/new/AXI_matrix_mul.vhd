

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AXI_matrix_mul is
    generic (
        floatSize : integer := 32
    );
    port (
        -- slave AXI Stream (input)
        s_axis_tdata  : in  std_logic_vector(16*floatSize-1 downto 0);
        s_axis_tvalid : in  std_logic;
        s_axis_tlast  : in  std_logic;
        s_axis_tready : out std_logic;
        -- s_axis_tkeep dont realy need for now;

        -- master AXI Stream (ouput)
        m_axis_tdata  : out std_logic_vector(16*floatSize-1 downto 0);
        m_axis_tvalid : out std_logic;
        m_axis_tlast  : out std_logic;
        m_axis_tready : in  std_logic;
        m_axis_tkeep  : out std_logic_vector(16*floatSize/8-1 downto 0);

        -- Clock/Reset
        aclk    : in std_logic;
        aresetn : in std_logic    
        );
end AXI_matrix_mul;

architecture Behavioral of AXI_matrix_mul is
    -- components
    component matrix_mul
        generic (
            floatSize : integer := 32
        );
        port(
            leftMatrix   : in  std_logic_vector(16*floatSize-1 downto 0);
            rightMatrix  : in  std_logic_vector(16*floatSize-1 downto 0);
            returnMatrix : out std_logic_vector(16*floatSize-1 downto 0)
            );
    end component;

    signal inputMem  : std_logic_vector(16*floatSize-1 downto 0);
    signal outputMem : std_logic_vector(16*floatSize-1 downto 0);

    signal InOutAxi  : std_logic := '0'; -- 0 is input 1 is output

begin

    -- Instantiation of matrix_mul component
    matrix_mul_inst : matrix_mul
        generic map ( floatSize => floatSize )
        port map (
            leftMatrix   => inputMem,
            rightMatrix  => (others => '0'),
            returnMatrix => outputMem
        );

    -- check send and read data
    process (aresetn, aclk)
    begin
        if aresetn = '0' then 
            s_axis_tready <= '0';
            m_axis_tdata  <= (others => '0');
            m_axis_tvalid <= '0';
            m_axis_tlast  <= '0';
            m_axis_tkeep  <= (others => '0');

            InOutAxi      <= '0'; -- input output mode

        elsif rising_edge(aclk) then

            -- INPUT MODE
            if InOutAxi = '0' then
                -- reset send data
                m_axis_tvalid <= '0';
                m_axis_tlast  <= '0';
                s_axis_tready <= '1'; -- start take data

                -- send one big buffer. that mean tlast if 1 only thed do
                -- data should be valid
                if s_axis_tvalid = '1' and s_axis_tlast = '1' then
                    inputMem      <= s_axis_tdata; -- taka data
                    InOutAxi      <= '1'; -- move to output mode
                    s_axis_tready <= '0'; -- stop take data
                end if;

            else 
                s_axis_tready <= '0'; -- stop take data
            end if;




            -- OUTPUT MOD
            if InOutAxi = '1' then
                if m_axis_tready = '1'then
                    m_axis_tdata  <= outputMem; -- send data in one move
                    m_axis_tvalid <= '1';       -- validation is properly
                    m_axis_tlast  <= '1';       -- is the last data
                    InOutAxi      <= '0';       -- reset
                end if;
            end if;
                    

        end if;
    end process;

    m_axis_tkeep <= (others => '1'); -- dont need for now (check what bits is valid for that block)

end Behavioral;

