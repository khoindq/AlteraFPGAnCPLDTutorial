library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity blinkyled is
	Port (button : in STD_LOGIC;
	      clk : in STD_LOGIC;
			led : out STD_LOGIC);
end blinkyled;

architecture Behavioral of blinkyled is
signal r0_input                           : std_logic;
signal r1_input                           : std_logic;
signal pulse                           : std_logic;
signal led_state                           : std_logic;


	
begin

	p_rising_edge_detector : process(clk,button)
begin
  if(button='0') then
    r0_input           <= '0';
    r1_input           <= '0';
  elsif(rising_edge(clk)) then
    r0_input           <= button;
    r1_input           <= r0_input;
  end if;
  pulse            <= not r1_input and r0_input;
  end process p_rising_edge_detector;

	blinky : process(pulse)
begin
if (rising_edge(pulse)) then
led_state <= not led_state;
end if;
led  <= led_state;

  
end process blinky;
		
end Behavioral;