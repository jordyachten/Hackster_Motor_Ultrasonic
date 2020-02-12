library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity HC_SR04 is
 Port ( clk : in  STD_LOGIC;
        trigger : out STD_LOGIC;
        echo : in  STD_LOGIC;
        sonar_out   : out STD_LOGIC_VECTOR (15 downto 0));
end HC_SR04;

architecture Behavioral of HC_SR04 is
 signal count            : unsigned(16 downto 0) := (others => '0');
    signal centimeters      : unsigned(15 downto 0) := (others => '0');
    signal echo_last        : std_logic := '0';
    signal echo_synced      : std_logic := '0';
    signal echo_unsynced    : std_logic := '0';
    signal waiting          : std_logic := '0'; 
begin

process(clk)
    begin
        if rising_edge(clk) then
            if waiting = '0' then
                if count = 1000 then -- Assumes 100MHz
                   -- After 10us then go into waiting mode
                   trigger <= '0';
                   waiting    <= '1';
                   count       <= (others => '0');
                else
                   trigger <= '1';
                   count <= count+1;
                end if;
            elsif echo_last = '0' and echo_synced = '1' then
                -- Seen rising edge - start count
                count       <= (others => '0');
                centimeters <= (others => '0');
            elsif echo_last = '1' and echo_synced = '0' then
                -- Seen falling edge, so capture count
                sonar_out <= std_logic_vector(centimeters);
            elsif count = 2900*2 -1 then
                -- advance the counter
                centimeters <= centimeters + 1;
                count <= (others => '0');
                if centimeters = 3448 then
                    -- time out - send another pulse
                    waiting <= '0';
                end if;
            else
                count <= count + 1;                
            end if;

            echo_last     <= echo_synced;
            echo_synced   <= echo_unsynced;
            echo_unsynced <= echo;
        end if;
    end process;
end Behavioral;
