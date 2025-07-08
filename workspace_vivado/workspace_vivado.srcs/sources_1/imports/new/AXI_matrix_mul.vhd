

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

        -- master AXI Stream (ouput)
        m_axis_tdata  : out std_logic_vector(16*floatSize-1 downto 0);
        m_axis_tvalid : out std_logic;
        m_axis_tlast  : out std_logic;
        m_axis_tready : in  std_logic;

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
            returnMatrix : out std_logic_vector(16*floatSize-1 downto 0);
            validation   : out std_logic
            );
    end component;

    signal inputMem  : std_logic_vector(16*floatSize-1 downto 0);

    signal outputMem : std_logic_vector(16*floatSize-1 downto 0);
    signal data_valid : std_logic;

    -- State machine for AXI Stream control
    type state_type is (IDLE, PROCESSING, OUTPUT_READY);
    signal state : state_type := IDLE;
    

begin

    -- Instantiation of matrix_mul component
    matrix_mul_inst : matrix_mul generic map ( floatSize => floatSize )
        port map (
            leftMatrix   => inputMem,
            rightMatrix  => (others => '0'),
            returnMatrix => outputMem,
            validation   => data_valid
        );

    -- AXI Stream slave interface (input side)
    s_axis_tready <= '1' when state = IDLE else '0';
    
    -- AXI Stream master interface (output side)  
    m_axis_tvalid <= '1' when state = OUTPUT_READY else '0';
    m_axis_tdata  <= outputMem when state = OUTPUT_READY else (others => '0');
    m_axis_tlast  <= '1' when state = OUTPUT_READY else '0';

    process (aclk, aresetn)
    begin
        if aresetn = '0' then 
            state <= IDLE;
            inputMem <= (others => '0');

        elsif rising_edge(aclk) then
            case state is
                when IDLE =>
                    -- Wait for valid input data with tlast
                    if s_axis_tvalid = '1' and s_axis_tlast = '1' then
                        inputMem <= s_axis_tdata;
                        state <= PROCESSING;
                    end if;
                    
                when PROCESSING =>
                    -- Wait for processing to complete
                    if data_valid = '1' then
                        state <= OUTPUT_READY;
                    end if;
                    
                when OUTPUT_READY =>
                    -- Wait for master side to accept data
                    if m_axis_tready = '1' then
                        state <= IDLE;  -- Ready for next transaction
                    end if;
                    
                when others =>
                    state <= IDLE;
            end case;
        end if;
    end process;


end Behavioral;




