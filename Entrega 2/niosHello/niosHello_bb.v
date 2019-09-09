
module niosHello (
	buts_export,
	clk_clk,
	leds_export,
	reset_reset_n);	

	input	[5:0]	buts_export;
	input		clk_clk;
	output	[5:0]	leds_export;
	input		reset_reset_n;
endmodule
