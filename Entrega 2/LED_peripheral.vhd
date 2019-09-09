library IEEE;
use IEEE.std_logic_1164.all;

entity LED_peripheral is
	generic ( 
				ADD1: integer := 1
				);
				
    port (
        -- Globals
        fpga_clk_50   : in  std_logic;        
		  
        -- I/Os
		  fpga_key_pio: in std_logic_vector(0 downto 0);
		  fpga_switch_pio : in std_logic_vector(4 downto 0);
        fpga_led_pio  : out std_logic_vector(5 downto 0)
		  
	);
end entity LED_peripheral;

architecture arch_LED of LED_peripheral is
-- signal
signal blink : std_logic := '0';

begin

  process(fpga_clk_50) 
      variable counter : integer range 0 to 25000000 := 0;
      begin
			  if (rising_edge(fpga_clk_50)) then	
				  if fpga_key_pio(0) = '1' then
						if (counter < 25000000) then
						
							case fpga_switch_pio is 
								when "00000" => counter := counter;
								when "00001" => counter := counter + ADD1;
								when "00010" => counter := counter + 2;
								when "00011" => counter := counter + 3;
								when "00100" => counter := counter + 4;
								when "00101" => counter := counter + 5;
								when "00110" => counter := counter + 6;
								when "00111" => counter := counter + 7;
								when "01000" => counter := counter + 8;
								when "01001" => counter := counter + 9;
								when "01010" => counter := counter + 10;
								when "01011" => counter := counter + 11;
								when "01100" => counter := counter + 12;
								when "01101" => counter := counter + 13;
								when "01110" => counter := counter + 14;
								when "01111" => counter := counter + 15;
								when others => counter := counter;
							end case;
								
						else
							 blink <= not blink;
							 counter := 0;
						end if;
					end if;
				end if;
  end process;

  fpga_led_pio(0) <= blink;
  fpga_led_pio(1) <= blink;
  fpga_led_pio(2) <= blink;
  fpga_led_pio(3) <= blink;
  fpga_led_pio(4) <= blink;
  fpga_led_pio(5) <= blink;

  end arch_LED;