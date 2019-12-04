module ex4_top(
	SW,
	HEX0,
	HEX1,
	HEX2,
	HEX3
);

	input [9:0] SW;
	output [6:0] HEX0, HEX1, HEX2, HEX3;

	wire [3:0] X, Y, Z, W;
	
	bin2bcd10 b(
		.B (SW),
		.BCD_0 (X),
		.BCD_1 (Y),
		.BCD_2 (Z),
		.BCD_3 (W)
	);
	
	hex_to_7seg SEG0(HEX0, X);
	hex_to_7seg SEG1(HEX1, Y);
	hex_to_7seg SEG2(HEX2, Z);
	hex_to_7seg SEG3(HEX3, W);

//	hex_to_7seg SEG0(HEX0, SW[3:0]);
//	hex_to_7seg SEG1(HEX1, SW[7:4]);
//	hex_to_7seg SEG2(HEX2, {2'b0, SW[9:8]});
//	hex_to_7seg SEG3(HEX3, 4'b0);
	
endmodule