library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_divider is
	Port (clk : in STD_LOGIC;
			clk_div : out STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is

	signal pulse : std_LOGIC := '0';
	signal count : integer range 0 to 50000001 := 0;
	
begin

	counter : process(clk)
	begin
		if clk'event and clk = '1' then
			if count = 5000000 then
				count <= 1;
				pulse <= not pulse;
			else
				count <= count + 1;
			end if;
		end if;
	
	end process;
	
	clk_div <= pulse;
	
end Behavioral;