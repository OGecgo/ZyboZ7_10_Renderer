

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity mul_1x4_4x1 is
  generic (
    size_data: integer := 32 -- size of bits
  );
  
  Port (
    clk : in std_logic;
    arst: in std_logic; -- active low

    left :  in  signed(size_data * 4 - 1 downto 0);
    right:  in  signed(size_data * 4 - 1 downto 0);

    tdata : out signed(size_data - 1 downto 0);
    tvalid: out std_logic
  );
end mul_1x4_4x1;

architecture Behavioral of mul_1x4_4x1 is

  signal x1: signed(size_data - 1 downto 0);
  signal x2: signed(size_data - 1 downto 0);

  signal y1: signed(size_data - 1 downto 0);
  signal y2: signed(size_data - 1 downto 0);

  signal z1: signed(size_data - 1 downto 0);
  signal z2: signed(size_data - 1 downto 0);

  signal w1: signed(size_data - 1 downto 0);
  signal w2: signed(size_data - 1 downto 0);

  signal start_count: std_logic;
  signal count: unsigned(1 downto 0);
  signal return_data: signed(size_data - 1 downto 0);
begin

  x1 <=  left(size_data * 4 - 1 downto size_data * 3);
  x2 <= right(size_data * 4 - 1 downto size_data * 3);

  y1 <=  left(size_data * 3 - 1 downto size_data * 2);
  y2 <= right(size_data * 3 - 1 downto size_data * 2);

  z1 <=  left(size_data * 2 - 1 downto size_data);
  z2 <= right(size_data * 2 - 1 downto size_data);

  w1 <=  left(size_data - 1 downto 0);
  w2 <= right(size_data - 1 downto 0);

  tdata <= return_data;

  process(clk)
      variable temp_1    : signed(size_data - 1 downto 0);
      variable temp_2    : signed(size_data - 1 downto 0);
      variable tempt_data: signed(size_data - 1 downto 0);
    begin
      if arst='0' then
        start_count <= '0';
        count <= "00";
        return_data <= (others => '0'); 
        tvalid <= '0';
      elsif clk'event and clk='1' then
        -- add counter
        if start_count = '0' then -- test first move
          start_count <= '1';
        else
          case count is
            when "11" => count <= "00";
            when "00" => count <= "01";
            when "01" => count <= "10";
            when "10" => count <= "11";
            when others =>
              null;
          end case;
        end if;

        -- multiply and add data
        case count is
          when "00" =>
            temp_1 := x1;
            temp_2 := x2;
          when "01" =>
            temp_1 := y1;
            temp_2 := y2;
          when "10" =>
            temp_1 := z1;
            temp_2 := z2;
          when "11" =>
            temp_1 := w1;
            temp_2 := w2;
          when others =>
            null;
        end case;
       
        if count="00" then
          return_data <= resize(temp_1 * temp_2, size_data);
        else
          return_data <= return_data + resize(temp_1 * temp_2, size_data);
        end if;
        
        
        -- validation
        tvalid <= count(1) and count(0);

      end if;
  end process;




end Behavioral;
