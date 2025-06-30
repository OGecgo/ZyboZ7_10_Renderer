----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/30/2025 06:17:07 PM
-- Design Name: 
-- Module Name: matrix4x4_mult - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity matrix4x4_mult is
    generic (
        int : integer := 32
    );
    port (
        -- 4x4 Matrix 
        leftMatrix : in  std_logic_vector(16*int-1 downto 0); 
        rightMatrix : in  std_logic_vector(16*int-1 downto 0);
        newMatrix : out std_logic_vector(16*int-1 downto 0)
    );
end matrix4x4_mult;

architecture Behavioral of matrix4x4_mult is
    -- 4 is width matrix
begin
    newMatrix <= leftMatrix;

end Behavioral;
