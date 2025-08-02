library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity mul_4x4_4x4 is
    generic(size_data: integer := 32);
    port(
        clk : in std_logic;
        arst: in std_logic;

        left_block  : in  signed(size_data * 16 - 1 downto 0);
        right_block : in  signed(size_data * 16 - 1 downto 0);

        tdata : out signed(size_data * 16 - 1 downto 0);
        tvalid: out std_logic
    );
end mul_4x4_4x4;

architecture Behavioral of mul_4x4_4x4 is

    component mul_4x4_4x1
        generic(size_data: integer := 32);
        port (
            clk : in std_logic;
            arst: in std_logic; -- active low

            left_block: in  signed(size_data * 16 - 1 downto 0);
            right_line: in  signed(size_data * 4 - 1 downto 0);

            tdata : out signed(size_data * 4 - 1 downto 0);
            tvalid: out std_logic
        );
    end component;


    --[size_data*16-1 downto size_data*12]
    --[size_data*12-1 downto size_data*8]
    --[size_data*8-1  downto size_data*4]
    --[size_data*4-1  downto 0]

    function rotate_line(i: integer; my_block: signed) return signed is
        variable tmp : signed(size_data * 4 - 1 downto 0);
        variable data: signed(size_data     - 1 downto 0);
        variable move: integer;
    begin
        for j in 0 to 3 loop
            move := 16 - (i + 4*j);
            data := my_block(size_data * move - 1 downto size_data * (move-1));
            
            tmp(size_data * (4-j) - 1 downto size_data * (3-j)) := data;
        end loop;
        return tmp;
    end function;

    signal right_u : signed(size_data * 16 - 1 downto 0);
    signal result_u: signed(size_data * 16 - 1 downto 0);

    signal tvalid_array: std_logic_vector(3 downto 0);

begin

    -- rotate row
    right_u <= rotate_line(0, right_block)&
               rotate_line(1, right_block)& 
               rotate_line(2, right_block)&
               rotate_line(3, right_block);

    -- generate block for multiply
    gen_mul: for i in 0 to 3 generate
        u_mul: mul_4x4_4x1
            generic map(size_data => size_data)
            Port map(
                clk  => clk,
                arst => arst,

                left_block =>  left_block,
                right_line => right_u(size_data * (16 - i * 4) - 1 downto size_data * (12 - i * 4)),

                tdata  => result_u(size_data * (16 - i * 4) - 1 downto size_data * (12 - i * 4)),
                tvalid => tvalid_array(i)
            );
    end generate gen_mul; 

    -- rotate row
    tdata(size_data*16 - 1 downto size_data*12) <= rotate_line(0, result_u);
    tdata(size_data*12 - 1 downto size_data* 8) <= rotate_line(1, result_u);
    tdata(size_data* 8 - 1 downto size_data* 4) <= rotate_line(2, result_u);
    tdata(size_data* 4 - 1 downto 0           ) <= rotate_line(3, result_u);
    
    tvalid <= tvalid_array(3) and tvalid_array(2) and tvalid_array(1) and tvalid_array(0);
end Behavioral;