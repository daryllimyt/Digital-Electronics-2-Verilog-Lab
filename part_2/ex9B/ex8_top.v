module ex8_top (
	CLOCK_50,
	KEY,
	LEDR,
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4
);

	input CLOCK_50;
	input [3:0] KEY;

	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX2;
	output [6:0] HEX3;
	output [6:0] HEX4;
	output [9:0] LEDR;

	
	wire [3:0] D0, D1, D2, D3, D4;
	
	wire tick_ms;
	wire tick_hs;
	
	wire lfsr_enable;
	wire trigger_delay;
	wire time_out;
	wire [13:0] random_delay;

	tick_50000 t1(
		.clock (CLOCK_50),
		.pulse (tick_ms)
	);

	tick_500 t2(
		.clock (CLOCK_50 & tick_ms),
		.pulse (tick_hs)
	);


	fsm f(
		.clk (tick_ms),
		.en_lfsr (lfsr_enable),
		.tick (tick_hs),
		.trigger (KEY[3]),
		.time_out (time_out),
		.start_delay (trigger_delay),
		.ledr (LEDR)
	);


	LFSR_14 l(
		.clk (tick_ms & lfsr_enable),
//		.clk (tick_ms),
		.data_out (random_delay)
	);

	delay d(
		.N (random_delay),
		.trigger (trigger_delay),
		.clk (tick_ms),
		.time_out (time_out)
	);

	
	wire [15:0] display;
	
	reaction_counter r(
		.clk (tick_hs),
		.start_counting (time_out),
		.end_counting (~KEY[0]),
		.count (display)
	);
	
	bin2bcd_16 b(
		.B (display),
		.BCD_0 (D0),
		.BCD_1 (D1),
		.BCD_2 (D2),
		.BCD_3 (D3),
		.BCD_4 (D4)
	);

	hex_to_7seg SEG0(HEX0, D0);
	hex_to_7seg SEG1(HEX1, D1);
	hex_to_7seg SEG2(HEX2, D2);
	hex_to_7seg SEG3(HEX3, D3);
	hex_to_7seg SEG4(HEX4, D4);


endmodule
