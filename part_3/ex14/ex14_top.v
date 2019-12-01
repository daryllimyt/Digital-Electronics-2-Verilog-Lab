module ex14_top(
	SW,
	CLOCK_50,
	HEX...,
	DAC...,
	LP...
);

	input [9:0] SW;
	input CLOCK_50;

	output ...;

	reg [9:0] Addr;
	
	wire tick;
	wire [9:0] D;
	
	wire [23:0] product;
	
  wire [3:0] BCD0;
  wire [3:0] BCD1;
  wire [3:0] BCD2;
  wire [3:0] BCD3;
  wire [3:0] BCD4;


	// audio path
	
	tick_5000 t(
		.clock (CLOCK_50),
		.pulse (tick)
	);

	always (posedge tick)
		Addr = Addr + SW;

	ROM r(
		.address (Addr),
		.clock (tick),
		.q (D)
	);

	spi2dac s2d (CLOCK_50, D, tick, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
	pwm p(CLOCK_50, D, tick, PWM_OUT);
	
	
	// display path

	
	
	bin2bcd_16([23, 10]product, BCD0, BCD1, BCD2, BCD3, BCD4);
	hex_to_7seg SE0(HEX0, BCD0);
	hex_to_7seg SE1(HEX1, BCD1);
	hex_to_7seg SE2(HEX2, BCD2);
	hex_to_7seg SE3(HEX3, BCD3);
	hex_to_7seg SE4(HEX4, BCD4);



	

endmodule
