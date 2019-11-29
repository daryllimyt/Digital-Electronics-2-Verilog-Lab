module ex7_top (
	HEX0,
	HEX1,
	//CLOCK_50,
	KEY
);

	input [3:0] KEY;
		//input CLOCK_50;

	
	output [6:0] HEX0;
	output [6:0] HEX1;
	
	wire [3:0] BCD0; 
	wire [3:0] BCD1;
	wire [3:0] BCD2;
	wire [3:0] BCD3;
	wire [3:0] BCD4;
	
	wire [7:1] out;
	
	wire tick;
	
	tick_50000 t(CLOCK_50, tick);
	
	//LFSR_7 L(~KEY[3] & tick, out);
			LFSR_7 L(~KEY[3], out);

	
	
	//bin2bcd_16 b({9'b0, out[7:1]}, BCD0, BCD1, BCD2, BCD3, BCD4); // we must pack bits to convert out to a 16 bit bus, using concatination operator
	hex_to_7seg SE0(HEX0, out[4:1]);
	hex_to_7seg SE1(HEX1, {1'b0,out[7:5]});
	//hex_to_7seg SE2(HEX2, BCD2);
	//hex_to_7seg SE3(HEX3, BCD3);
	//hex_to_7seg SE4(HEX4, BCD4);
endmodule