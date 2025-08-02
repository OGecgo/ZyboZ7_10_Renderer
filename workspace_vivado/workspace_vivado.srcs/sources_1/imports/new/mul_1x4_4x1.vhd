

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

    s_tdata_left : in  signed(size_data * 4 - 1 downto 0);
    s_tdata_right: in  signed(size_data * 4 - 1 downto 0);
    s_tvalid     : in  std_logic;

    m_tdata : out signed(size_data - 1 downto 0);
    m_tvalid: out std_logic
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

  x1 <=  s_tdata_left(size_data * 4 - 1 downto size_data * 3);
  x2 <= s_tdata_right(size_data * 4 - 1 downto size_data * 3);

  y1 <=  s_tdata_left(size_data * 3 - 1 downto size_data * 2);
  y2 <= s_tdata_right(size_data * 3 - 1 downto size_data * 2);

  z1 <=  s_tdata_left(size_data * 2 - 1 downto size_data);
  z2 <= s_tdata_right(size_data * 2 - 1 downto size_data);

  w1 <=  s_tdata_left(size_data - 1 downto 0);
  w2 <= s_tdata_right(size_data - 1 downto 0);

  process(clk)
      variable temp_1    : signed(size_data - 1 downto 0);
      variable temp_2    : signed(size_data - 1 downto 0);
    begin
      if arst='0' then
        start_count <= '0';
        count       <= "00";
        m_tvalid    <= '0';
        return_data <= (others => '0');
      elsif clk'event and clk='1' then

        -- add counter
        case start_count is
          when '0' =>    -- start
            start_count <= s_tvalid;
            count <= "00";

          when '1' => -- run and stop
            -- stop count when count move to 11 and wait
            start_count <= not(count(1) and count(0));

            case count is
              when "00" => count <= "01";
              when "01" => count <= "10";
              when "10" => count <= "11";
              when "11" => count <= "00";
              when others => null;
            end case;

          when others => 
            null;
        end case;


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


        case count is
          when "00" =>
            return_data <= resize(temp_1 * temp_2, size_data);
          when others =>
            return_data <= return_data + resize(temp_1 * temp_2, size_data);
        end case;
        
        
        -- validation
        m_tvalid <= count(1) and count(0);

      end if;
  end process;

  m_tdata <= return_data;


end Behavioral;
