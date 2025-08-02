

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity axi_mul_4x4_4x4 is
    generic(size_data: integer := 32);
    port(
        -- S_AXI
        tdata :  in signed(size_data * 16 - 1 downto 0);
        -- tkeep :  in std_logic_vector(size_data * 2); data dont need mask
        -- tlast :  in std_logic; every step sending only one package
        tready: out std_logic;
        tvalid:  in std_logic;

        -- M_AXI
        tdata : out signed(size_data * 16 - 1 downto 0);
        -- tkeep : out std_logic_vector(size_data * 2);
        -- tlast : out std_logic;
        tready:  in std_logic;
        tvalid: out std_logic;
    );
end axi_mul_4x4_4x4;

architecture Behavioral of axi_mul_4x4_4x4 is

begin
    -- if fifo is ready for take data


end Behavioral;
