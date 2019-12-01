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

	wire tick_ms;
	wire tick_hs;

	tick_5000 t1(
		.clock (CLOCK_50),
		.pulse (tick_ms)
	);

	tick_5000 t2(
		.clock (CLOCK_50),
		.pulse (tick_hs)
	);


	fsm f();


	LFSR_7 l(
		.clk (tick_ms),

		
	);

	delay d();

	bin2bcd b();

	hex_to_7seg h(
		
	);

endmodule
