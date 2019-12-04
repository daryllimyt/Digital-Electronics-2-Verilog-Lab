module add3_ge5(
	in,
	out
);
	input [3:0] in;
	output [3:0] out;
	
	reg [3:0]	out; // DONT FORGET TO SPECIFY BUS WIDTH IN REG DECLERATION!
	
	always @ (in)
		out = (in >= 5) ? (in + 3) : in;
//	assign out = in;
endmodule