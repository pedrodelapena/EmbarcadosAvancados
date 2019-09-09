library IEEE;
use IEEE.std_logic_1164.all;

entity RTL_Blink_LED is
    port (
        -- Globals
        fpga_clk_50   : in  std_logic;        
		  
        -- I/Os
		  fpga_key_pio: in std_logic_vector(0 downto 0);
		  fpga_switch_pio : in std_logic_vector(4 downto 0);
        fpga_led_pio  : out std_logic_vector(5 downto 0)
		  
	);
end entity RTL_Blink_LED;

architecture entrega1 of RTL_Blink_LED is
	component LED_peripheral is
		    port (
        -- Globals
        fpga_clk_50   : in  std_logic;        
		  
        -- I/Os
		  fpga_key_pio: in std_logic_vector(0 downto 0);
		  fpga_switch_pio : in std_logic_vector(4 downto 0);
        fpga_led_pio  : out std_logic_vector(5 downto 0)
		  
	);
	end component;
	begin 
	LED: LED_peripheral port map(fpga_clk_50, fpga_key_pio, fpga_switch_pio, fpga_led_pio);

end entrega1;