module ex10_top(SW, CLOCK_50, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK);
	input [9:0] SW;
	input CLOCK_50;
	output DAC_CS;
	output DAC_SDI;
	output DAC_LD;
	output DAC_SCK;
	
	wire tick;
	
	tick_50000 t(CLOCK_50, tick);
	spi2dac s2d (CLOCK_50, SW, tick, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);

endmodule