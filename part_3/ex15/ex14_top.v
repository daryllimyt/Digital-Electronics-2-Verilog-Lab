module ex14_top(
	CLOCK_50,
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	DAC_SDI,
	DAC_CS,
	DAC_SCK,
	DAC_LD,
	PWM_OUT,
	ADC_SCK,
	ADC_CS,
	ADC_SDI,
	ADC_SDO
);

	input CLOCK_50;

	output DAC_SDI, DAC_CS, DAC_SCK, DAC_LD, PWM_OUT, 	ADC_SCK, ADC_CS, ADC_SDI;
	input ADC_SDO;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4;

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

	always @ (posedge tick)
		Addr = Addr + potentiometer_value;

	ROM r(
		.address (Addr),
		.clock (tick),
		.q (D)
	);

	spi2dac s2d (CLOCK_50, D, tick, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
	pwm p(CLOCK_50, D, tick, PWM_OUT);
	
	
	// display path
	wire [9:0] potentiometer_value;
	const_mult2(
		.dataa (potentiometer_value),
		.result (product)
	);
	
	wire data_valid;
	
	spi2adc a2s (
		.sysclk (CLOCK_50), 
		.start (tick), 
		.channel (1'b0), 
		.data_from_adc (potentiometer_value), 
		.data_valid (data_valid), 
		.sdata_to_adc (ADC_SDI), 
		.adc_cs (ADC_CS), 
		.adc_sck (ADC_SCK), 
		.sdata_from_adc (ADC_SDO)
	);
	
	
	bin2bcd_16({2'b0,product[23:10]}, BCD0, BCD1, BCD2, BCD3, BCD4);
	hex_to_7seg SE0(HEX0, BCD0);
	hex_to_7seg SE1(HEX1, BCD1);
	hex_to_7seg SE2(HEX2, BCD2);
	hex_to_7seg SE3(HEX3, BCD3);
	hex_to_7seg SE4(HEX4, BCD4);



	

endmodule
