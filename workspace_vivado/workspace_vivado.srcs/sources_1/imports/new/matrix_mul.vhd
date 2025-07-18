

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity matrix_mul is
    generic (
        floatSize : integer := 32
    );
    port (
        leftMatrix   : in  std_logic_vector(16*floatSize-1 downto 0);
        rightMatrix  : in  std_logic_vector(16*floatSize-1 downto 0);
        returnMatrix : out std_logic_vector(16*floatSize-1 downto 0);
    );
end matrix_mul;

architecture Behavioral of matrix_mul is

begin

    -- the process
    returnMatrix <= not(leftMatrix);


end Behavioral;

