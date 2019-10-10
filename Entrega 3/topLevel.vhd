library IEEE;
use IEEE.std_logic_1164.all;

entity topLevel is
    port (
        -- Gloabals
            fpga_clk_50                 : in    std_logic; -- clk
            fpga_led_pio                : out   std_logic_vector(3 downto 0); -- led
            ps2_peripheral_0_clk_export : inout std_logic; -- export
            ps2_peripheral_0_dat_export : inout std_logic; -- export
            reset_reset_n               : in    std_logic -- reset_n
    );
end entity topLevel;

architecture rtl of topLevel is

    component niosHello is
        port (
            clk_clk                     : in    std_logic                    := 'X'; -- clk
            led_led                     : out   std_logic_vector(3 downto 0);        -- led
            ps2_peripheral_0_clk_export : inout std_logic                    := 'X'; -- export
            ps2_peripheral_0_dat_export : inout std_logic                    := 'X'; -- export
            reset_reset_n               : in    std_logic                    := 'X'  -- reset_n
        );
    end component niosHello;

	 begin
	 
    u0 : component niosHello
        port map (
            clk_clk                     => fpga_clk_50,                     --                  clk.clk
            led_led                     => fpga_led_pio,                     --                  led.led
            ps2_peripheral_0_clk_export => ps2_peripheral_0_clk_export, -- ps2_peripheral_0_clk.export
            ps2_peripheral_0_dat_export => ps2_peripheral_0_dat_export, -- ps2_peripheral_0_dat.export
            reset_reset_n               => '1'                --                reset.reset_n
        );


end rtl;