module ex12_top(
	SW,
	HEX0,
	HEX1,
	HEX2,
	CLOCK_50
);
	input CLOCK_50;
	input [9:0] SW;
	
	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX2;
	
	
				
	
	wire [9:0]mem_out;

	ROM r(SW, CLOCK_50, mem_out);
	hex_to_7seg a(HEX0, mem_out[3:0]);
	hex_to_7seg b(HEX1, mem_out[7:4]);
	hex_to_7seg c(HEX2, {2'b0, mem_out[9:8]});


endmodule