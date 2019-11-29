module add3_ge5 (in, out);
	output [3:0] out;
	input [3:-] in;
	
	always @ (*)
		if ()


module bcd_to_7seg (BCD_0, BCD_1, BCD_2, in);
//based on design lecture 10 slide 22
	output [3:0] BCD_0, BCD_1, BCD_2;
	input [9:0] in;
	
	wire [3:0] w1, w2, w3,w4, w5,w6, w7, w8, w9;
	wire [3:0] a1, a2, a3,a4, a5,a6, a7, a8, a9;
	
	add3_get
	
	reg [6:0] out;
	reg [11:0] tmp

	always @ (*)
		for ( i = 0 ; i < 10 ; i = i + 1 ) begin
			tmp = input >> 10 - i;
			if (tmp >= 5)
			then
		end
endmodule