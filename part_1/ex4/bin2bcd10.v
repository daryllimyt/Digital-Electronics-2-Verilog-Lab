// implementation based on verilog code in slide 22 of Lecture 10
module bin2bcd10(
	B,
	BCD_0,
	BCD_1,
	BCD_2,
	BCD_3
);

	input [9:0] B; // modified to be 10 bits wide
	output [3:0] BCD_0, BCD_1, BCD_2, BCD_3;
	
//	wire [3:0] w1, w2, w3, w4, w5, w6, w7, w8, w9;
	wire [3:0] a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12;

	add3_ge5 A1 (
		{1'b0, B[9:7]},
		a1);
	
	add3_ge5 A2 (
		{a1[2:0], B[6]},
		a2);
	
	add3_ge5 A3 (
		{a2[2:0], B[5]},
		a3);
	
	add3_ge5 A4 (
		{1'b0, a1[3], a2[3], a3[3]},
		a4);
	
	add3_ge5 A5 (
		{a3[2:0], B[4]},
		a5);
		
	add3_ge5 A6 (
		{a4[2:0], a5[3]},
		a6);
		
	add3_ge5 A7 (
		{a5[2:0], B[3]},
		a7);
		
	add3_ge5 A8 (
		{a6[2:0], a7[3]},
		a8);
		
	add3_ge5 A9 (
		{a7[2:0], B[2]},
		a9);
	
	add3_ge5 A10 (
		{1'b0, a4[3], a6[3], a8[3]},
		a10);
	
	add3_ge5 A11 (
		{a8[2:0], a9[3]},
		a11);
		
	add3_ge5 A12 (
		{a9[2:0], B[1]},
		a12);
		
		
	assign BCD_0 = {a12[2:0], B[0]};

	assign BCD_1 = {a11[2:0], a12[3]};

	assign BCD_2 = {a10[2:0], a11[3]};	
	
	assign BCD_3 = {3'b0, a10[3]};
	
//	assign BCD_0 = B[3:0];
//
//	assign BCD_1 = B[7:4];
//
//	assign BCD_2 = {2'b0, B[9:8]};	
//	
//	assign BCD_3 = 4'b0;
endmodule