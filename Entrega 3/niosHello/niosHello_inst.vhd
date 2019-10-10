	component niosHello is
		port (
			clk_clk                     : in    std_logic                    := 'X'; -- clk
			led_led                     : out   std_logic_vector(3 downto 0);        -- led
			reset_reset_n               : in    std_logic                    := 'X'; -- reset_n
			ps2_peripheral_0_dat_export : inout std_logic                    := 'X'; -- export
			ps2_peripheral_0_clk_export : inout std_logic                    := 'X'  -- export
		);
	end component niosHello;

	u0 : component niosHello
		port map (
			clk_clk                     => CONNECTED_TO_clk_clk,                     --                  clk.clk
			led_led                     => CONNECTED_TO_led_led,                     --                  led.led
			reset_reset_n               => CONNECTED_TO_reset_reset_n,               --                reset.reset_n
			ps2_peripheral_0_dat_export => CONNECTED_TO_ps2_peripheral_0_dat_export, -- ps2_peripheral_0_dat.export
			ps2_peripheral_0_clk_export => CONNECTED_TO_ps2_peripheral_0_clk_export  -- ps2_peripheral_0_clk.export
		);

