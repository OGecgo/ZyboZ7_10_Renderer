

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity mul_1x4_4x1 is
    generic (size_data: integer := 32);

    Port (
        clk : in std_logic;
        arst: in std_logic; -- active low

        s_tdata_left : in  signed(size_data * 4 - 1 downto 0);
        s_tdata_right: in  signed(size_data * 4 - 1 downto 0);
        s_tvalid     : in  std_logic;
        s_tready     : out std_logic;

        m_tdata : out signed(size_data - 1 downto 0);
        m_tvalid: out std_logic;
        m_tready: in  std_logic
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

    signal count: unsigned(1 downto 0);
    signal data : signed(size_data - 1 downto 0);
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
        variable temp_data : signed(size_data - 1 downto 0);

        variable wait_count: std_logic; -- 0 run 1 wait
        variable wait_data : std_logic;
    begin
        if clk'event and clk='1' then
            if arst='0' then
                count <= "00";
                data  <= (others => '0');
                s_tready <= '0';
                m_tvalid <= '0';
            else
                -- mul + add
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
                    when others =>
                        temp_1 := w1;
                        temp_2 := w2;
                end case;
                case count is
                    when "00" =>
                        data <= resize(temp_1 * temp_2, size_data);
                    when others =>
                        if wait_data='0' then
                            data <= data + resize(temp_1 * temp_2, size_data);
                        end if;
                end case;
        
                wait_count := not(not(not(m_tready) and count(1) and count(0)) and s_tvalid);
                -- wait if not send data or wait if validation of data is wrong
                if wait_count='0' then
                    wait_data := '0';
                    count <= count + 1;
                else 
                    wait_data := '1';
                end if;
        
                -- validation
                m_tvalid <= count(1) and count(0);
                s_tready <= not(count(1) or count(0));
            end if;
        end if;
  end process;

  m_tdata <= data;


end Behavioral;
