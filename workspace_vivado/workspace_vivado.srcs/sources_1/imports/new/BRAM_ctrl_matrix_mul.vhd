-- test

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BRAM_ctrl_matrix_mul is 
    port(

        aclk: in  std_logic;                      -- clock

        din : out std_logic_vector (31 downto 0); -- write
        dout: in  std_logic_vector (31 downto 0); -- read
        we  : out std_logic;                      -- write enable
        re  : out std_logic;                      -- read  enable
    );
end BRAM_ctrl_matrix_mul;

architecture Behavioral of BRAM_ctrl_matrix_mul is 
    -- components
    component matrix_mul
        generic (
            floatSize : integer := 2 --> 31:0
        );
        port(
            leftMatrix   : in  std_logic_vector(16*floatSize-1 downto 0);
            rightMatrix  : in  std_logic_vector(16*floatSize-1 downto 0);
            returnMatrix : out std_logic_vector(16*floatSize-1 downto 0);
            );
    end component;

    signal leftMatrix  : std_logic_vector (16*2-1 downto 0);
    signal rightMatrix : std_logic_vector (16*2-1 downto 0) := (others => '0');
    signal returnMatrix: std_logic_vector (16*2-1 downto 0);

begin

    matrix_mul_inst : matrix_mul generic map ( floatSize => floatSize )
        port map (
            leftMatrix   => leftMatrix,
            rightMatrix  => rightMatrix,
            returnMatrix => returnMatrix
        );



    process(aclk)
    begin
        if rising_edge(aclk) then

        end if;
    end process;

end Behavioral;