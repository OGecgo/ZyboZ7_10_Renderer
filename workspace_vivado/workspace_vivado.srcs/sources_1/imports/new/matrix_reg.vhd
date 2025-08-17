
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

----------------------------------
-- use count to fill the matrix with data 128 bits
-- 4 clocks minimum
----------------------------------

entity matrix_reg is 
    generic (size_data: integer := 32);
    port(
        clk : in std_logic;
        arst: in std_logic; -- low active

        s_tdata : in signed(size_data * 4 - 1 downto 0);
        s_tvalid: in std_logic;

        m_tdata: out signed(size_data * 16 - 1 downto 0)
    );
end matrix_reg;

architecture Behavioral of matrix_reg is
    signal matrix: signed(size_data * 16 - 1 downto 0);
    signal count : unsigned(1 downto 0);
begin
    m_tdata <= matrix;
    process(clk)
    begin
        if clk'event and clk='1' then
            if arst='0' then
                matrix <= (others => '0');
                count  <= "00";
            else
                if s_tvalid='1' then
                    case count is
                        when "00" => matrix(size_data * 16 - 1 downto size_data * 12) <= s_tdata;
                        when "01" => matrix(size_data * 12 - 1 downto size_data *  8) <= s_tdata;
                        when "10" => matrix(size_data *  8 - 1 downto size_data *  4) <= s_tdata;
                        when "11" => matrix(size_data *  4 - 1 downto              0) <= s_tdata;
                        when others => null;
                    end case;
                    count <= count + 1;
                end if;
            end if;
        end if;
    end process;

end Behavioral;