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

	
	wire [3:0] D0, D1, D2, D3, D4;
	
	wire tick_ms;
	wire tick_hs;
	
	wire lfsr_enable;
	wire [6:0] random_delay;

	tick_50000 t1(
		.clock (CLOCK_50),
		.pulse (tick_ms)
	);

	tick_5000 t2(
		.clock (CLOCK_50 & tick_ms),
		.pulse (tick_hs)
	);


	fsm f(
		.en_lfsr (lfsr_enable)
	);


	LFSR_7 l(
		.clk (tick_ms & lfsr_enable),
		.data_out (random_delay)
	);

	delay d(
		.N (random_delay[5:0]),
	);

	bin2bcd_16 b(
		.B ((random_delay[5:0] +1) * 25)
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
