module ex13_top(SW, CLOCK_50, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT);
	input [9:0] SW;
	input CLOCK_50;
	output DAC_CS;
	output DAC_SDI;
	output DAC_LD;
	output DAC_SCK;
	output PWM_OUT;
	
	wire tick;
	tick_50000 t(CLOCK_50, tick);

	wire [9:0] count;
	counter_10 c (CLOCK_50, tick, count,1'b1);
	wire [9:0] data;
	ROM r (count, tick, data);
	
	pwm p(CLOCK_50, data, tick, PWM_OUT);
	spi2dac s2d (CLOCK_50, data, tick, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);

endmodule