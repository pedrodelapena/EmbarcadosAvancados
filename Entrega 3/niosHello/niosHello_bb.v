
module niosHello (
	clk_clk,
	led_led,
	reset_reset_n,
	ps2_peripheral_0_dat_export,
	ps2_peripheral_0_clk_export);	

	input		clk_clk;
	output	[3:0]	led_led;
	input		reset_reset_n;
	inout		ps2_peripheral_0_dat_export;
	inout		ps2_peripheral_0_clk_export;
endmodule
