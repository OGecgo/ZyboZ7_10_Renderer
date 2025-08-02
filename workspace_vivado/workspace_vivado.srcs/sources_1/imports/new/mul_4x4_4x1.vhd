

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity mul_4x4_4x1 is
    generic(size_data: integer := 32);
    Port (
        clk:  in std_logic;
        arst: in std_logic; -- active low 

        left_block  : in  signed(size_data * 16 - 1 downto 0);
        right_line  : in  signed(size_data *  4 - 1 downto 0);

        tdata:  out signed(size_data *  4 - 1 downto 0);
        tvalid: out std_logic
    );
end mul_4x4_4x1;

architecture Behavioral of mul_4x4_4x1 is

component mul_1x4_4x1
    generic(size_data: integer := 32);
    Port (
        clk:  in std_logic;
        arst: in std_logic; -- active low

        left:   in  signed(size_data * 4 - 1 downto 0);
        right:  in  signed(size_data * 4 - 1 downto 0);

        tdata:  out signed(size_data - 1 downto 0);
        tvalid: out std_logic
    );
end component;

    signal tvalid_array: std_logic_vector(3 downto 0);
    
begin
    -- generate for block for multiply
    gen_mul: for i in 0 to 3 generate
        u_mul: mul_1x4_4x1 
            generic map(size_data => size_data)
            port map(
                clk  => clk,
                arst => arst,

                left   => left_block(size_data * (16 - i * 4) - 1 downto size_data * (12 - i * 4)), 
                right  => right_line,
                
                tdata  => tdata(size_data *  (4 - i) - 1 downto size_data *  (3 - i)),
                tvalid => tvalid_array(3 - i)
            );
    end generate gen_mul;
    
    tvalid <= tvalid_array(3) and tvalid_array(2) and tvalid_array(1) and tvalid_array(0);
end Behavioral;
